__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"

from qgis.core import (
    Qgis,
    QgsDataSourceUri,
    QgsProcessingContext,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingOutputString,
    QgsProcessingParameterString,
    QgsProviderRegistry,
    QgsVectorLayer,
    QgsExpressionContextUtils,
)

if Qgis.QGIS_VERSION_INT >= 31400:
    from qgis.core import (
        QgsProcessingParameterDatabaseSchema,
        QgsProcessingParameterProviderConnection,
    )
else:
    from processing.tools.postgis import uri_from_name

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
        label = tr("Connexion PostgreSQL vers la base de données")
        tooltip = "Base de données de destination"
        default = QgsExpressionContextUtils.globalScope().variable('adresse_connection_name')
        if Qgis.QGIS_VERSION_INT >= 31400:
            param = QgsProcessingParameterProviderConnection(
                self.CONNECTION_NAME,
                label,
                "postgres",
                optional=False,
                defaultValue=default
            )
        else:
            param = QgsProcessingParameterString(self.CONNECTION_NAME, label, defaultValue=default)
            param.setMetadata(
                {
                    "widget_wrapper": {
                        "class": "processing.gui.wrappers_postgis.ConnectionWidgetWrapper"
                    }
                }
            )
        if Qgis.QGIS_VERSION_INT >= 31600:
            param.setHelp(tooltip)
        else:
            param.tooltip_3liz = tooltip
        self.addParameter(param)

        label = tr("Schéma")
        tooltip = 'Nom du schéma des données adresses'
        default = 'adresse'
        if Qgis.QGIS_VERSION_INT >= 31400:
            param = QgsProcessingParameterDatabaseSchema(
                self.SCHEMA,
                label,
                self.CONNECTION_NAME,
                defaultValue=default,
                optional=False,
            )
        else:
            param = QgsProcessingParameterString(self.SCHEMA, label, default, False, True)
            param.setMetadata(
                {
                    "widget_wrapper": {
                        "class": "processing.gui.wrappers_postgis.SchemaWidgetWrapper",
                        "connection_param": self.CONNECTION_NAME,
                    }
                }
            )
        if Qgis.QGIS_VERSION_INT >= 31600:
            param.setHelp(tooltip)
        else:
            param.tooltip_3liz = tooltip
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
        layers_name = ["commune", "voie", "point_adresse", "parcelle"]
        layers_name_none = dict()
        layers_name_none["document"] = ""
        layers_name_none["v_commune"] = "insee_code"

        if Qgis.QGIS_VERSION_INT >= 31400:
            connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
            schema = self.parameterAsSchema(parameters, self.SCHEMA, context)
        else:
            connection_name = self.parameterAsString(parameters, self.CONNECTION_NAME, context)
            schema = self.parameterAsString(parameters, self.SCHEMA, context)

        feedback.pushInfo("## CONNEXION A LA BASE DE DONNEES ##")

        uri = None
        if Qgis.QGIS_VERSION_INT >= 31000:
            metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
            connection = metadata.findConnection(connection_name)
            uri = QgsDataSourceUri(connection.uri())
        else:
            uri = uri_from_name(connection)

        is_host = uri.host() != ""
        if is_host:
            feedback.pushInfo("Connexion établie via l'hote")
        else:
            feedback.pushInfo("Connexion établie via le service")

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
