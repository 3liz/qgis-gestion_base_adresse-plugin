__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"

from qgis.core import (
    QgsProcessingParameterString,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingOutputString,
    QgsProcessingParameterBoolean,
    QgsProcessingContext,
    QgsVectorLayer,
)

from processing.tools.postgis import uri_from_name

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.i18n import tr
from ...qgis_plugin_tools.tools.database import (
    fetch_data_from_sql_query,
)


class DataParcelleAlgo(BaseProcessingAlgorithm):
    """
    Chargement des couches adresse depuis la base de données
    """

    DATABASE = "DATABASE"
    SCHEMA = "SCHEMA"
    TRUNCATE_PARCELLE = "TRUNCATE_PARCELLE"
    OUTPUT = "OUTPUT"
    OUTPUT_MSG = "OUTPUT MSG"

    def name(self):
        return "data_parcelle"

    def displayName(self):
        return tr("Mise en place des données pour certificat de numérotation")

    def groupId(self):
        return "adresse_donnees"

    def group(self):
        return tr("Données")

    def shortHelpString(self):
        return tr(
            "Ajout des données parcellaire et "
            "création des vues pour les certificats de numérotation."
        )

    def initAlgorithm(self, config):
        # INPUTS
        db_param = QgsProcessingParameterString(
            self.DATABASE, tr("Connexion à la base de données")
        )
        db_param.setMetadata(
            {
                "widget_wrapper": {
                    "class": "processing.gui.wrappers_postgis.ConnectionWidgetWrapper"
                }
            }
        )
        self.addParameter(db_param)

        schema_param = QgsProcessingParameterString(
            self.SCHEMA, tr(
                "Schéma du cadastre contenant les données des parcelles est propriétaires"
            ), "cadastre", False, True
        )
        schema_param.setMetadata(
            {
                "widget_wrapper": {
                    "class": "processing.gui.wrappers_postgis.SchemaWidgetWrapper",
                    "connection_param": self.DATABASE,
                }
            }
        )
        self.addParameter(schema_param)

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.TRUNCATE_PARCELLE,
                tr("Mise à jour de la table parcelle")
            )
        )

        # OUTPUTS
        self.addOutput(
            QgsProcessingOutputMultipleLayers(self.OUTPUT, tr("Couches de sortie"))
        )

        self.addOutput(
            QgsProcessingOutputString(self.OUTPUT_MSG, tr("Message de sortie"))
        )

    def initLayer(self, context, uri, schema, table, geom, sql, pk=None):
        if pk:
            uri.setDataSource(schema, table, geom, sql, pk)
        else:
            uri.setDataSource(schema, table, geom, sql)
        layer = QgsVectorLayer(uri.uri(), table, "postgres")
        if not layer.isValid():
            return False
        context.temporaryLayerStore().addMapLayer(layer)
        context.addLayerToLoadOnCompletion(
            layer.id(),
            QgsProcessingContext.LayerDetails(table, context.project(), self.OUTPUT),
        )
        return layer

    def processAlgorithm(self, parameters, context, feedback):
        msg = ""
        output_layers = []
        layers_name_none = dict()
        layers_name_none["v_certificat"] = "id_view"
        layers_name_none["v_voie"] = "id_view"
        layers_name_none["v_section"] = "id_view"
        layers_name_none["v_parcelle"] = "id_view"

        # override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        connection = self.parameterAsString(parameters, self.DATABASE, context)
        schema = self.parameterAsString(parameters, self.SCHEMA, context)
        data_update = self.parameterAsBool(parameters, self.TRUNCATE_PARCELLE, context)

        if data_update:
            feedback.pushInfo("## Mise à jour des données parcelles ##")
            feedback.pushInfo("## Rend id_parcelle = null dans adresse.point_adresse ##")
            sql = """
                UPDATE adresse.point_adresse pa
                SET id_parcelle = NULL;
            """
            _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
            if not ok:
                return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

            feedback.pushInfo("""
                ## Désactivation de la clé étrangère sur adresse.point_adresse pour
                pouvoir vider la table adresse.parcelle ##
            """)
            sql = """
                ALTER TABLE adresse.point_adresse DROP CONSTRAINT point_adresse_id_parcelle_fkey;
            """
            _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
            if not ok:
                return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

            feedback.pushInfo("## Vide la table adresse.parcelle ##")
            sql = """
                TRUNCATE adresse.parcelle RESTART IDENTITY;
            """
            _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
            if not ok:
                return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

            feedback.pushInfo("## Réactivation de la clé étrangère sur adresse.point_adresse ##")
            sql = """
                ALTER TABLE adresse.point_adresse
                ADD CONSTRAINT point_adresse_id_parcelle_fkey FOREIGN KEY (id_parcelle)
                REFERENCES adresse.parcelle (fid);
            """
            _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
            if not ok:
                return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

            feedback.pushInfo("## Remplissage de la table adresse.parcelle ##")
            sql = """
                INSERT INTO adresse.parcelle(id,commune, prefixe, section, numero,
                    contenance, arpente, geom)
                SELECT p.idu, p.nomcommune, p1.ccopre, p1.ccosec, p1.dnupla, p.contenance,
                CASE
                WHEN p1.ccoarp = 'A' THEN True
                ELSE False
                END as arpente,
                p.geom
                FROM {}.parcelle_info p, {}.parcelle p1
                WHERE p.geo_parcelle = p1.parcelle
                AND p.idu not in(select pa.id from adresse.parcelle pa)
            """.format(
                schema, schema
            )
            _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
            if not ok:
                return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        feedback.pushInfo("## Mise à jour de id_parcelle dans adresse.point_adresse ##")
        sql = """
            UPDATE adresse.point_adresse pa
            SET id_parcelle = (SELECT p.fid FROM adresse.parcelle p
            WHERE ST_intersects(pa.geom, p.geom));
        """
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        if not ok:
            return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        feedback.pushInfo("## CREATION DES VUES ##")
        feedback.pushInfo("## Vue  adresse.v_certificat ##")
        sql = "DROP VIEW IF EXISTS adresse.v_certificat"
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        sql = """
            CREATE VIEW adresse.v_certificat AS
            SELECT row_number() over (order by c.commune_nom) as id_view,
            pr.proprietaire as id_prop, pa.id_point,
            c.insee_code, c.commune_nom, c.code_postal, c.adresse_mairie, c.maire,
            trim(coalesce(pr.dqualp, '')) || ' ' ||
            CASE WHEN trim(pr.dnomus) != trim(pr.dnomlp) THEN Coalesce( trim(pr.dnomus) ||
            '/' || trim(pr.dprnus) || ', née ', '' ) ELSE '' END ||
            trim(coalesce(pr.ddenom, ''))
            AS p_nom,
            ltrim(trim(coalesce(pr.dlign4, '')), '0') || trim(coalesce(pr.dlign5, '')) AS p_adresse,
            trim(coalesce(pr.dlign6, '')) as p_adresse2,
            pc.ccosec,
            pi.tex,
            pa.adresse_complete
            FROM adresse.commune c
            JOIN adresse.point_adresse pa ON pa.id_commune = c.id_com
            JOIN adresse.parcelle p ON p.fid = pa.id_parcelle
            JOIN {}.parcelle_info pi ON pi.idu = p.id
            JOIN {}.parcelle pc ON pc.parcelle = pi.geo_parcelle
            JOIN {}.proprietaire pr ON pr.dnupro = pc.dnupro;
        """.format(
            schema, schema, schema
        )
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        if not ok:
            return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        feedback.pushInfo("## Vue  adresse.v_voie ##")
        sql = "DROP VIEW IF EXISTS adresse.v_voie"
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        sql = """
            CREATE VIEW adresse.v_voie
            AS
            SELECT row_number() OVER (ORDER BY v.nom) AS id_view,
            v.id_voie,
            v.nom_complet,
            c.id_com,
            cc.insee_code
            FROM adresse.voie v,
            adresse.appartenir_com c,
            adresse.commune cc
            WHERE c.id_voie = v.id_voie AND c.id_com = cc.id_com;
        """
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        if not ok:
            return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        feedback.pushInfo("## Vue  adresse.v_section ##")
        sql = "DROP VIEW IF EXISTS adresse.v_section"
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        sql = """
            CREATE VIEW adresse.v_section
            AS
            SELECT row_number() OVER (ORDER BY s.tex) AS id_view,
            concat(c.ccodep, c.ccocom) AS insee,
            s.tex,
            cc.id_com
            FROM {}.commune c,
            {}.geo_section s,
            adresse.commune cc
            WHERE c.commune = s.geo_commune AND concat(c.ccodep, c.ccocom) = cc.insee_code::text;
        """.format(
            schema, schema
        )
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        if not ok:
            return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        feedback.pushInfo("## Vue  adresse.v_parcelle ##")
        sql = "DROP VIEW IF EXISTS adresse.v_parcelle"
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        sql = """
            CREATE VIEW adresse.v_parcelle
            as SELECT row_number() OVER (ORDER BY s.tex) AS id_view,
            concat(c.ccodep, c.ccocom) as insee,
            s.tex as section,
            cc.id_com,
            p.tex as parcelle
            FROM {}.commune c,
            {}.geo_section s,
            {}.parcelle_info p,
            adresse.commune cc
            WHERE c.commune = s.geo_commune AND concat(c.ccodep, c.ccocom) = cc.insee_code
            AND p.geo_section= s.geo_section
            ORDER BY p.tex;
        """.format(
            schema, schema, schema
        )
        _, _, _, ok, error_message = fetch_data_from_sql_query(connection, sql)
        if not ok:
            return {self.OUTPUT_MSG: error_message, self.OUTPUT: output_layers}

        uri = uri_from_name(connection)
        is_host = uri.host() != ""
        if is_host:
            feedback.pushInfo("Connexion établie via l'hote")
        else:
            feedback.pushInfo("Connexion établie via le service")
        feedback.pushInfo("")
        feedback.pushInfo("## CHARGEMENT DES COUCHES ##")
        for x in layers_name_none:
            if not context.project().mapLayersByName(x):
                result = self.initLayer(
                    context, uri, 'adresse', x, None, "", layers_name_none[x]
                )
                if not result:
                    feedback.pushInfo("La couche " + x + " ne peut pas être chargée")
                else:
                    feedback.pushInfo("La couche " + x + " a pu être chargée")
                    output_layers.append(result.id())

        msg = "success"

        return {self.OUTPUT_MSG: msg, self.OUTPUT: output_layers}
