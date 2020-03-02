"""Tests for Processing algorithms."""

import psycopg2

from qgis.core import (
    QgsApplication,
    QgsProcessingException,
)
from qgis.testing import unittest

try:
    # QGIS >= 3.8
    from qgis import processing
except ImportError:
    # QGIS < 3.8
    import processing

from ..processing.provider import GestionAdresseProvider
from ..qgis_plugin_tools.tools.logger_processing import LoggerProcessingFeedBack

__copyright__ = 'Copyright 2019, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'



class TestProcessing(unittest.TestCase):

    def setUp(self) -> None:
        self.connection = psycopg2.connect(
            user='docker',
            password='docker',
            host='db',
            port='5432',
            database='gis'
        )
        self.cursor = self.connection.cursor()

    def test_load_structure(self):
        """Test we can load the PostGIS structure."""
        provider = GestionAdresseProvider()
        QgsApplication.processingRegistry().addProvider(provider)

        params = {
            'CONNECTION_NAME': 'test',
            'OVERRIDE': True,
            'ADDTESTDATA': True,
        }

        feedback = LoggerProcessingFeedBack()
        processing.run('gestion_adresse:create_database_structure', params, feedback=feedback)

        self.cursor.execute('SELECT table_name FROM information_schema.tables WHERE table_schema = \'adresse\'')
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        expected = [
            'appartenir_com', 'commune', 'document', 'metadata', 'point_adresse',
            'voie', 'parcelle', 'commune_deleguee', 'referencer_com',
        ]
        self.assertCountEqual(expected, result)

        # Relaunch the algorithm without override
        params = {
            'CONNECTION_NAME': 'test',
            'OVERRIDE': False,
        }

        with self.assertRaises(QgsProcessingException):
            processing.run('gestion_adresse:create_database_structure', params, feedback=feedback)

        expected = 'Unable to execute algorithm\n Le schéma existe déjà dans la base de données ! Si vous voulez VRAIMENT supprimer et recréer le schéma (et supprimer les données) cocher la case **Écraser**'
        self.assertEqual(expected, feedback.last)
