__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"

from qgis.core import (
    QgsDataSourceUri,
    QgsProcessingContext,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingOutputString,
    QgsProviderRegistry,
    QgsVectorLayer,
    QgsExpressionContextUtils,
    QgsProcessingParameterDatabaseSchema,
    QgsProcessingParameterProviderConnection,
)

from ...definitions.variables import GESTION_ADRESSE_POINT_ADRESSE, GESTION_ADRESSE_VOIE
from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.i18n import tr


class LoadLayersAlgorithm(BaseProcessingAlgorithm):
    """
    Chargement des couches adresse depuis la base de données
    """

    CONNECTION_NAME = "CONNECTION_NAME"
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
        # Database connection parameters
        default = QgsExpressionContextUtils.globalScope().variable('adresse_connection_name')
        param = QgsProcessingParameterProviderConnection(
            self.CONNECTION_NAME,
            tr("Connexion PostgreSQL vers la base de données"),
            "postgres",
            optional=False,
            defaultValue=default
        )
        param.setHelp("Base de données de destination")
        self.addParameter(param)

        param = QgsProcessingParameterDatabaseSchema(
            self.SCHEMA,
            tr("Schéma"),
            self.CONNECTION_NAME,
            defaultValue='adresse',
            optional=False,
        )
        param.setHelp('Nom du schéma des données adresses')
        self.addParameter(param)

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
        layers_name = dict()
        layers_name["commune"] = ""
        layers_name['voie'] = ""
        layers_name["parcelle"] = ""
        layers_name["v_point_adresse"] = 'id_point'
        layers_name["v_lieux_dits"] = 'id_ld'
        layers_name_none = dict()
        layers_name_none["document"] = ""
        layers_name_none["v_commune"] = "insee_code"

        connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
        schema = self.parameterAsSchema(parameters, self.SCHEMA, context)

        feedback.pushInfo("## CONNEXION A LA BASE DE DONNEES ##")

        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        connection = metadata.findConnection(connection_name)
        uri = QgsDataSourceUri(connection.uri())

        is_host = uri.host() != ""
        if is_host:
            feedback.pushInfo("Connexion établie via l'hôte")
        else:
            feedback.pushInfo("Connexion établie via le service")

        feedback.pushInfo("")
        feedback.pushInfo("## CHARGEMENT DES COUCHES ##")
        for x in layers_name:
            if not context.project().mapLayersByName(x):
                result = self.initLayer(context, uri, schema, x, "geom", '', layers_name[x])
                if not result:
                    feedback.pushInfo("La couche " + x + " ne peut pas être chargée 1")
                else:
                    output_layers.append(result.id())
                    if x == "voie":
                        QgsExpressionContextUtils.setProjectVariable(
                            context.project(), GESTION_ADRESSE_VOIE, result.id()
                        )
                    elif x == "v_point_adresse":
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
