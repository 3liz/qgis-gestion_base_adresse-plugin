__copyright__ = "Copyright 2021, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"

from qgis.core import (
    Qgis,
    QgsProcessingParameterString,
    QgsProviderRegistry,
    QgsProcessingException,
    QgsExpressionContextUtils,
    QgsProviderConnectionException,
)

if Qgis.QGIS_VERSION_INT >= 31400:
    from qgis.core import (
        QgsProcessingParameterProviderConnection,
    )

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm


class RefreshViewAlgo(BaseProcessingAlgorithm):

    """
    Refresh the materialized view adresse.v_certificat
    """

    CONNECTION_NAME = "CONNECTION_NAME"

    def name(self):
        return "refresh_view_certificat"

    def displayName(self):
        return "Rafraîchissement de la vue adresse.v_certificat"

    def groupId(self):
        return "adresse_donnees"

    def group(self):
        return "Données"

    def shortHelpString(self):
        return (
            "Cet algorithme permet le rafraîchissement de la vue matérialisée adresse.v_certificat.<br>"
            "Il faut effectuer cette opération quand il y a des changements dans votre schéma "
            "'cadastre'.<br><br>"
            "La vue est créée par l'algorithme 'Mise en place des données parcellaires'."
        )

    def initAlgorithm(self, config):
        label = "Connexion PostgreSQL vers la base de données"
        tooltip = "Base de données de vos schémas 'cadastre' et 'adresse'"
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

    def processAlgorithm(self, parameters, context, feedback):
        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        if Qgis.QGIS_VERSION_INT >= 31400:
            connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
        else:
            connection_name = self.parameterAsString(parameters, self.CONNECTION_NAME, context)

        connection = metadata.findConnection(connection_name)
        if not connection:
            raise QgsProcessingException("La connexion {} n'existe pas.").format(connection_name)

        sql = "REFRESH MATERIALIZED VIEW CONCURRENTLY adresse.v_certificat;"
        try:
            connection.executeSql(sql)
        except QgsProviderConnectionException as e:
            feedback.reportError("Erreur lors du rafraîchissement de la vue.")
            feedback.reportError(str(e))
            raise QgsProcessingException(str(e))

        feedback.pushDebugInfo(sql)
        feedback.pushInfo("Rafraîchissement de la vue avec succès")
        return {}
