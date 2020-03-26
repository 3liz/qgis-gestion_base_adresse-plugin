__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"


from qgis.core import (
    QgsProcessing,
    QgsProcessingParameterVectorLayer,
    QgsExpressionContextUtils,
)

from ...definitions.variables import GESTION_ADRESSE_POINT_ADRESSE, GESTION_ADRESSE_VOIE
from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm


class ConfigProject(BaseProcessingAlgorithm):
    """
    Algorithm to set project variables.
    """

    STREET_LAYER = "STREET_LAYER"
    ADDRESS_LAYER = "ADDRESS_LAYER"

    def name(self):
        return "config_project"

    def displayName(self):
        return "Configuration du projet"

    def group(self):
        return "Outils"

    def groupId(self):
        return "tools"

    def shortHelpString(self):
        return (
            "La configuration ajoute les variables concernant le nom des couches dans le projet."
        )

    def initAlgorithm(self, config):
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.ADDRESS_LAYER, "Voirie", [QgsProcessing.TypeVectorLine],
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.STREET_LAYER, "Point adresse", [QgsProcessing.TypeVectorPoint]
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        street_layer = self.parameterAsString(parameters, self.STREET_LAYER, context)
        address_layer = self.parameterAsString(parameters, self.ADDRESS_LAYER, context)

        QgsExpressionContextUtils.setProjectVariable(
            context.project(), GESTION_ADRESSE_VOIE, street_layer
        )
        QgsExpressionContextUtils.setProjectVariable(
            context.project(), GESTION_ADRESSE_POINT_ADRESSE, address_layer
        )
        return {}
