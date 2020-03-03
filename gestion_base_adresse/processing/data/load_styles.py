__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (
    QgsProcessingParameterString,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingOutputString,
    QgsProcessingAlgorithm,
    QgsProject,
    QgsDataSourceUri,
    QgsProcessingContext,
    QgsVectorLayer,
    QgsProcessingParameterDefinition,
)
from processing.tools.postgis import uri_from_name, GeoDB
from ...qgis_plugin_tools.tools.resources import resources_path


class LoadStylesAlgorithm(QgsProcessingAlgorithm):
    """
    Chargement des couches adresse depuis la base de données
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    INPUT = 'INPUT'
    OUTPUT_MSG = 'OUTPUT MSG'

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm.
        """
        return 'load_styles'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('Chargement des styles depuis le dossier resources')

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to.
        """
        return 'adresse_donnees'

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string
        should be localised.
        """
        return self.tr('Données')

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return LoadStylesAlgorithm()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """

        # INPUTS
        parameter = QgsProcessingParameterString(
            self.INPUT, 'Champ qui ne sert à rien !', optional=True)
        parameter.setFlags(parameter.flags() | QgsProcessingParameterDefinition.FlagHidden)
        self.addParameter(parameter)

        # OUTPUTS
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_MSG,
                self.tr('Message de sortie')
            )
        )


    def processAlgorithm(self, parameters, context, feedback):
        msg = ''
        output_layers = []
        layers_name = ['commune', 'voie', 'point_adresse', 'parcelle']

        for x in layers_name:
            layer = context.project().mapLayersByName(x)
            if layer:
                for l in layer:
                    feedback.pushInfo(l.name() + ', qml loaded')
                    l.loadNamedStyle(resources_path('qml', x+'.qml'))
                    feedback.pushInfo('Style for ' + x +' successfully loaded')
                    msg = msg+ ' // Style for ' + x +' successfully loaded'



        """
        Here is where the processing itself takes place.
        """

        # Return the results of the algorithm. In this case our only result is
        # the feature sink which contains the processed features, but some
        # algorithms may return multiple feature sinks, calculated numeric
        # statistics, etc. These should all be included in the returned
        # dictionary, with keys matching the feature corresponding parameter
        # or output names.
        return {self.OUTPUT_MSG: msg}
