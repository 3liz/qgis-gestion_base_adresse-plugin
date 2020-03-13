__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

from qgis.core import QgsProcessingProvider
from qgis.PyQt.QtGui import QIcon

from .tools.configure_project import ConfigProject
from .data.load_layers import LoadLayersAlgorithm
from .data.load_styles import LoadStylesAlgorithm
from .structure.create_database_structure import CreateDatabaseStructure
from .structure.upgrade_database_structure import UpgradeDatabaseStructure

from ..qgis_plugin_tools.tools.resources import resources_path


class GestionAdresseProvider(QgsProcessingProvider):

    def loadAlgorithms(self):
        self.addAlgorithm(CreateDatabaseStructure())
        self.addAlgorithm(UpgradeDatabaseStructure())
        self.addAlgorithm(LoadLayersAlgorithm())
        self.addAlgorithm(LoadStylesAlgorithm())
        self.addAlgorithm(ConfigProject())

    def id(self):
        return 'gestion_adresse'

    def icon(self):
        return QIcon(resources_path('icons', 'icon.png'))

    def name(self):
        return 'Gestion des adresses'

    def longName(self):
        return self.name()
