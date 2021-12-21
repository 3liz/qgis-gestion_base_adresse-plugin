__copyright__ = "Copyright 2021, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"

from qgis.core import (
    QgsProviderRegistry,
    QgsProcessingException,
    QgsExpressionContextUtils,
    QgsProviderConnectionException,
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
        _ = config
        default = QgsExpressionContextUtils.globalScope().variable('adresse_connection_name')
        param = QgsProcessingParameterProviderConnection(
            self.CONNECTION_NAME,
            "Connexion PostgreSQL vers la base de données",
            "postgres",
            optional=False,
            defaultValue=default
        )
        param.setHelp("Base de données de vos schémas 'cadastre' et 'adresse'")
        self.addParameter(param)

    def processAlgorithm(self, parameters, context, feedback):
        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
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
