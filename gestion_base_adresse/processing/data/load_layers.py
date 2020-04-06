__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"

from qgis.core import (
    QgsProcessingParameterString,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingOutputString,
    QgsProcessingContext,
    QgsVectorLayer,
    QgsExpressionContextUtils,
)

from processing.tools.postgis import uri_from_name

from ...definitions.variables import GESTION_ADRESSE_POINT_ADRESSE, GESTION_ADRESSE_VOIE
from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.i18n import tr


class LoadLayersAlgorithm(BaseProcessingAlgorithm):
    """
    Chargement des couches adresse depuis la base de données
    """

    DATABASE = "DATABASE"
    SCHEMA = "SCHEMA"
    OUTPUT = "OUTPUT"
    OUTPUT_MSG = "OUTPUT MSG"

    def name(self):
        return "load_layers"

    def displayName(self):
        return tr("Chargement des couches depuis la base")

    def groupId(self):
        return "adresse_donnees"

    def group(self):
        return tr("Données")

    def shortHelpString(self):
        return tr("Charger toutes les couches de la base de données.")

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
            self.SCHEMA, tr("Schéma"), "adresse", False, True
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
        layers_name = ["commune", "voie", "point_adresse", "parcelle"]
        layers_name_none = dict()
        layers_name_none["document"] = ""
        layers_name_none["vue_com"] = "insee_code"

        # override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        connection = self.parameterAsString(parameters, self.DATABASE, context)

        feedback.pushInfo("## CONNEXION A LA BASE DE DONNEES ##")
        uri = uri_from_name(connection)

        is_host = uri.host() != ""
        if is_host:
            feedback.pushInfo("Connexion établie via l'hote")
        else:
            feedback.pushInfo("Connexion établie via le service")

        schema = self.parameterAsString(parameters, self.SCHEMA, context)
        feedback.pushInfo("")
        feedback.pushInfo("## CHARGEMENT DES COUCHES ##")
        for x in layers_name:
            if not context.project().mapLayersByName(x):
                result = self.initLayer(context, uri, schema, x, "geom", "")
                if not result:
                    feedback.pushInfo("La couche " + x + " ne peut pas être chargée")
                else:
                    output_layers.append(result.id())
                    if x == "voie":
                        QgsExpressionContextUtils.setProjectVariable(
                            context.project(), GESTION_ADRESSE_VOIE, result.id()
                        )
                    elif x == "point_adresse":
                        QgsExpressionContextUtils.setProjectVariable(
                            context.project(),
                            GESTION_ADRESSE_POINT_ADRESSE,
                            result.id(),
                        )

        for x in layers_name_none:
            if not context.project().mapLayersByName(x):
                result = self.initLayer(
                    context, uri, schema, x, None, "", layers_name_none[x]
                )
                if not result:
                    feedback.pushInfo("La couche " + x + " ne peut pas être chargée")

        return {self.OUTPUT_MSG: msg, self.OUTPUT: output_layers}
