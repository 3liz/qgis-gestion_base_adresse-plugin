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
)

from processing.tools.postgis import uri_from_name, GeoDB


class LoadLayersAlgorithm(QgsProcessingAlgorithm):
    """
    Chargement des couches adresse depuis la base de données
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    DATABASE = 'DATABASE'
    SCHEMA = 'SCHEMA'
    OUTPUT = 'OUTPUT'
    OUTPUT_MSG = 'OUTPUT MSG'

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm.
        """
        return 'load_layers'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any
        user-visible display of the algorithm name.
        """
        return self.tr('Chargement des couches depuis la base')

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
        return LoadLayersAlgorithm()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """

        # INPUTS
        db_param = QgsProcessingParameterString(
            self.DATABASE,
            self.tr('Connexion à la base de données'))
        db_param.setMetadata({
            'widget_wrapper': {
                'class': 'processing.gui.wrappers_postgis.ConnectionWidgetWrapper'}})
        self.addParameter(db_param)

        schema_param = QgsProcessingParameterString(
            self.SCHEMA,
            self.tr('Schéma'), 'adresse', False, True)
        schema_param.setMetadata({
            'widget_wrapper': {
                'class': 'processing.gui.wrappers_postgis.SchemaWidgetWrapper',
                'connection_param': self.DATABASE}})
        self.addParameter(schema_param)

        # OUTPUTS
        self.addOutput(
            QgsProcessingOutputMultipleLayers(
                self.OUTPUT,
                self.tr('Couches de sortie')
            )
        )

        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_MSG,
                self.tr('Message de sortie')
            )
        )


    def processAlgorithm(self, parameters, context, feedback):

        output_layers = []
        layers_name = ['commune', 'voie', 'point_adresse', 'parcelle']
        layers_name_none = ['document', 'vue_comm']

        def initLayer(schema, table, geom, sql):
            uri.setDataSource(schema, table, geom, sql)
            layer = QgsVectorLayer(uri.uri(), table, "postgres")
            if not layer.isValid():
                return False
            context.temporaryLayerStore().addMapLayer(layer)
            context.addLayerToLoadOnCompletion(
                layer.id(),
                QgsProcessingContext.LayerDetails(table,
                    context.project(),
                    self.OUTPUT
                )
            )
            return layer
        """
        Here is where the processing itself takes place.
        """

        #override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        connection = self.parameterAsString(parameters, self.DATABASE, context)
        uri = uri_from_name(connection)
        host = uri.host()
        dbname = uri.database()
        user = uri.username()
        passw = uri.password()
        port = uri.port()

        schema = self.parameterAsString(parameters, self.SCHEMA, context)

        msg = 'Requête Exécutée avec succés'
        uri = QgsDataSourceUri()
        # set host name, port, database name, username and password
        uri.setConnection(host, port, dbname, user, passw)
        for x in layers_name:
            if not context.project().mapLayersByName(x):
                result = initLayer(schema, x, "geom", "")
                if not result:
                    feedback.pushInfo('La couche '+x+' ne peut pas être chargée')
                else:
                    output_layers.append(result.id())

        for x in layers_name_none:
            if not context.project().mapLayersByName(x):
                result = initLayer(schema, x, None, "")
                if not result:
                    feedback.pushInfo('La couche '+x+' ne peut pas être chargée')


        # Return the results of the algorithm. In this case our only result is
        # the feature sink which contains the processed features, but some
        # algorithms may return multiple feature sinks, calculated numeric
        # statistics, etc. These should all be included in the returned
        # dictionary, with keys matching the feature corresponding parameter
        # or output names.
        return {self.OUTPUT_MSG: msg, self.OUTPUT: output_layers}

