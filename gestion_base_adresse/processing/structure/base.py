from ...qgis_plugin_tools.tools.algorithm_processing import (
    BaseProcessingAlgorithm,
)


class BaseDatabaseAlgorithm(BaseProcessingAlgorithm):

    def group(self):
        return 'Structure des données'

    def groupId(self):
        return 'database'
