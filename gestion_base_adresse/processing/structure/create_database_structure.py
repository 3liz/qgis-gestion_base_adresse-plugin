__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

import configparser
import os

from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingParameterString,
    QgsProcessingParameterBoolean,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils,
)

from ..tools import (
    fetchDataFromSqlQuery,
)


class CreateDatabaseStructure(QgsProcessingAlgorithm):
    """
    Création de la structure sur la base de données
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.
    CONNECTION_NAME = 'CONNECTION_NAME'
    OVERRIDE = 'OVERRIDE'
    ADDTESTDATA = 'ADDTESTDATA'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'create_database_structure'

    def displayName(self):
        return self.tr('Installation de la structure sur la base de données')

    def group(self):
        return self.tr('Structure')

    def groupId(self):
        return 'adresse_structure'

    def shortHelpString(self):
        return ''

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return self.__class__()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        connection_name = QgsExpressionContextUtils.globalScope().variable('adresse_connection_name')
        db_param_a = QgsProcessingParameterString(
            self.CONNECTION_NAME,
            self.tr('Connexion PostgreSQL vers la base de données'),
            defaultValue=connection_name,
            optional=False
        )
        db_param_a.setMetadata({
            'widget_wrapper': {
                'class': 'processing.gui.wrappers_postgis.ConnectionWidgetWrapper'
            }
        })
        self.addParameter(db_param_a)

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.OVERRIDE,
                self.tr('Écraser le schéma adresse ? ** ATTENTION ** Cela supprimera toutes les données !'),
                defaultValue=False,
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.ADDTESTDATA,
                self.tr('Ajouter des données de test ?'),
                defaultValue=False,
                optional=False
            )
        )

        # OUTPUTS
        # Add output for status (integer) and message (string)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                self.tr('Output status')
            )
        )
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                self.tr('Output message')
            )
        )


    def checkParameterValues(self, parameters, context):
        # Check database content
        ok, msg = self.checkSchema(parameters, context)
        if not ok:
            return False, msg

        return super(CreateDatabaseStructure, self).checkParameterValues(parameters, context)

    def checkSchema(self, parameters, context):
        connection_name = parameters[self.CONNECTION_NAME]
        sql = '''
            SELECT schema_name
            FROM information_schema.schemata
            WHERE schema_name = 'adresse';
        '''
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            return ok, error_message
        override = parameters[self.OVERRIDE]
        msg = self.tr('Le schéma adresse n\'existe pas. On poursuit...')
        for a in data:
            schema = a[0]
            if schema == 'adresse' and not override:
                ok = False
                msg = self.tr(
                    " Le schéma existe déjà dans la base de données !"
                    " Si vous voulez VRAIMENT supprimer et recréer le schéma (et supprimer les données) cocher la case **Écraser**"
                )
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """

        connection_name = parameters[self.CONNECTION_NAME]

        # Drop schema if needed
        override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        if override:
            feedback.pushInfo(self.tr("Essai de suppression du schéma adresse..."))
            sql = 'DROP SCHEMA IF EXISTS adresse CASCADE;'

            [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                connection_name,
                sql
            )
            if ok:
                feedback.pushInfo(self.tr("Le schéma adresse a été supprimé."))
            else:
                feedback.reportError(error_message)
                status = 0
                # raise Exception(msg)
                return {
                    self.OUTPUT_STATUS: status,
                    self.OUTPUT_STRING: error_message
                }

        # Create full structure
        sql_files = [
            '00_initialize_database.sql',
            'adresse/10_FUNCTION.sql',
            'adresse/20_TABLE_COMMENT_SEQUENCE_DEFAULT.sql',
            'adresse/30_VIEW.sql',
            'adresse/40_INDEX.sql',
            'adresse/50_TRIGGER.sql',
            'adresse/60_CONSTRAINT.sql',
            #'adresse/90_GLOSSARY.sql',
            '99_finalize_database.sql',
        ]
        # Add test data
        addtestdata = self.parameterAsBool(parameters, self.ADDTESTDATA, context)
        if addtestdata:
            sql_files.append('99_test_data.sql')

        msg = ''
        alg_dir = os.path.dirname(__file__)
        plugin_dir = os.path.join(alg_dir, '../../')

        # Loop sql files and run SQL code
        for sf in sql_files:
            feedback.pushInfo(sf)
            sql_file = os.path.join(plugin_dir, 'install/sql/%s' % sf)
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('  Skipped (empty file)')
                    continue

                [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                    connection_name,
                    sql
                )
                if ok:
                    feedback.pushInfo('  Success !')
                else:
                    feedback.reportError('* ' + error_message)
                    status = 0
                    raise Exception(error_message)
                    # return {
                        # self.OUTPUT_STATUS: status,
                        # self.OUTPUT_STRING: error_message
                    # }

        # Add version
        config = configparser.ConfigParser()
        config.read(str(os.path.join(plugin_dir, 'metadata.txt')))
        version = config['general']['version']
        sql = '''
            INSERT INTO adresse.metadata
            (me_version, me_version_date, me_status)
            VALUES (
                '%s', now()::timestamp(0), 1
            )
        ''' % version
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: self.tr('*** LA STRUCTURE adresse A BIEN ÉTÉ CRÉÉE ***')
        }
