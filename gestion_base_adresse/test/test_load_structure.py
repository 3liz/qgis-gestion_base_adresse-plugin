"""Tests for Processing algorithms."""

import psycopg2

from qgis.core import (
    QgsApplication,
    QgsProcessingException,
    Qgis,
)
from qgis.testing import unittest

if Qgis.QGIS_VERSION_INT >= 30800:
    from qgis import processing
else:
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

        feedback = LoggerProcessingFeedBack()
        self.cursor.execute('SELECT version();')
        record = self.cursor.fetchone()
        feedback.pushInfo('PostgreSQL version : {}'.format(record[0]))

        self.cursor.execute('SELECT PostGIS_Version();')
        record = self.cursor.fetchone()
        feedback.pushInfo('PostGIS version : {}'.format(record[0]))

        params = {
            'CONNECTION_NAME': 'test',
            'OVERRIDE': True,
            'ADDTESTDATA': True,
        }

        processing.run('gestion_adresse:create_database_structure', params, feedback=feedback)

        self.cursor.execute('SELECT table_name FROM information_schema.tables WHERE table_schema = \'adresse\'')
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        expected = [
            'appartenir_com', 'commune', 'document', 'metadata', 'point_adresse',
            'voie', 'parcelle', 'commune_deleguee', 'referencer_com',
        ]
        self.assertCountEqual(expected, result)

        feedback.pushDebugInfo('Relaunch the algorithm without override')
        params = {
            'CONNECTION_NAME': 'test',
            'OVERRIDE': False,
        }

        with self.assertRaises(QgsProcessingException):
            processing.run('gestion_adresse:create_database_structure', params, feedback=feedback)

        expected = 'Unable to execute algorithm\n Le schéma existe déjà dans la base de données ! Si vous voulez VRAIMENT supprimer et recréer le schéma (et supprimer les données) cocher la case **Écraser**'
        self.assertEqual(expected, feedback.last)

        feedback.pushDebugInfo('Update the database')
        params = {'CONNECTION_NAME': 'test', 'RUNIT': True}
        results = processing.run('gestion_adresse:upgrade_database_structure', params, feedback=feedback)
        self.assertEqual(1, results['OUTPUT_STATUS'], 1)
        self.assertEqual(' La version de la base de données et du plugin sont les mêmes. Aucune mise-à-jour n\'est nécessaire', results['OUTPUT_STRING'])
