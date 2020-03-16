__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

import os

from qgis.core import (
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingParameterBoolean,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils,
)

from ..processing_tools import fetchDataFromSqlQuery
from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.i18n import tr
from ...qgis_plugin_tools.tools.resources import metadata_config, plugin_path
from ...qgis_plugin_tools.tools.version import format_version_integer


class UpgradeDatabaseStructure(BaseProcessingAlgorithm):

    CONNECTION_NAME = 'CONNECTION_NAME'
    RUNIT = 'RUNIT'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'upgrade_database_structure'

    def displayName(self):
        return tr('Mise à jour de la structure de la base')

    def group(self):
        return tr('Structure')

    def groupId(self):
        return 'adresse_structure'

    def shortHelpString(self):
        return tr('Mise à jour de la base de données suite à une nouvelle version de l\'extension.')

    def initAlgorithm(self, config):
        # INPUTS
        connection_name = QgsExpressionContextUtils.globalScope().variable('adresse_connection_name')
        db_param_a = QgsProcessingParameterString(
            self.CONNECTION_NAME,
            tr('Connexion PostgreSQL vers la base de données'),
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
                self.RUNIT,
                tr('Cocher cette option pour lancer la mise-à-jour.'),
                defaultValue=False,
                optional=False
            )
        )
        # OUTPUTS
        # Add output for status (integer) and message (string)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                tr('Output status')
            )
        )
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                tr('Output message')
            )
        )

    def checkParameterValues(self, parameters, context):
        # Check if runit is checked
        runit = self.parameterAsBool(parameters, self.RUNIT, context)
        if not runit:
            msg = tr('Vous devez cocher cette case pour réaliser la mise à jour !')
            ok = False
            return ok, msg

        # Check database content
        ok, msg = self.checkSchema(parameters, context)
        if not ok:
            return False, msg

        return super(UpgradeDatabaseStructure, self).checkParameterValues(parameters, context)

    def checkSchema(self, parameters, context):
        sql = '''
            SELECT schema_name
            FROM information_schema.schemata
            WHERE schema_name = 'adresse';
        '''
        connection_name = parameters[self.CONNECTION_NAME]
        _, data, _, ok, error_message = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            return ok, error_message
        ok = False
        msg = tr("Le schéma adresse n'existe pas dans la base de données !")
        for a in data:
            schema = a[0]
            if schema == 'adresse':
                ok = True
                msg = ''
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        connection_name = parameters[self.CONNECTION_NAME]

        # Drop schema if needed
        runit = self.parameterAsBool(parameters, self.RUNIT, context)
        if not runit:
            status = 0
            msg = tr('Vous devez cocher cette case pour réaliser la mise à jour !')
            # raise Exception(msg)
            return {
                self.OUTPUT_STATUS: status,
                self.OUTPUT_STRING: msg
            }

        # get database version
        sql = '''
            SELECT me_version
            FROM adresse.metadata
            WHERE me_status = 1
            ORDER BY me_version_date DESC
            LIMIT 1;
        '''
        _, data, _, ok, error_message = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            feedback.reportError(error_message)
            raise QgsProcessingException(error_message)

        db_version = None
        for a in data:
            db_version = a[0]
        if not db_version:
            error_message = tr('Aucune version trouvée dans la base de données !')
            raise QgsProcessingException(error_message)

        feedback.pushInfo(tr('Version de la base de données') + ' = %s' % db_version)

        # get plugin version
        plugin_version = metadata_config()['general']['version']
        feedback.pushInfo(tr('Version du plugin') + ' = %s' % plugin_version)

        # Return if nothing to do
        if db_version == plugin_version:
            return {
                self.OUTPUT_STATUS: 1,
                self.OUTPUT_STRING: tr(
                    ' La version de la base de données et du plugin sont les mêmes. Aucune mise-à-jour n\'est nécessaire'
                )
            }

        # Get all the upgrade SQL files between db versions and plugin version
        upgrade_dir = os.path.join(plugin_path(), 'install/sql/upgrade/')
        get_files = [
            f for f in os.listdir(upgrade_dir)
            if os.path.isfile(os.path.join(upgrade_dir, f))
        ]
        files = []
        db_version_integer = format_version_integer(db_version)
        for f in get_files:
            k = format_version_integer(
                f.replace('upgrade_to_', '').replace('.sql', '').strip()
            )
            if k > db_version_integer:
                files.append(
                    [k, f]
                )

        def getKey(item):
            return item[0]

        sfiles = sorted(files, key=getKey)
        sql_files = [s[1] for s in sfiles]

        # Loop sql files and run SQL code
        for sf in sql_files:
            sql_file = os.path.join(plugin_path(), 'install/sql/upgrade/%s' % sf)
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('* ' + sf + ' -- NON TRAITÉ (FICHIER VIDE)')
                    continue

                # Add SQL database version in adresse.metadata
                new_db_version = sf.replace('upgrade_to_', '').replace('.sql', '').strip()
                feedback.pushInfo('* NOUVELLE VERSION BDD ' + new_db_version )
                sql += '''
                    UPDATE adresse.metadata
                    SET (me_version, me_version_date)
                    = ( '%s', now()::timestamp(0) );
                ''' % new_db_version

                _, _, _, ok, error_message = fetchDataFromSqlQuery(
                    connection_name,
                    sql
                )
                if not ok:
                    feedback.reportError(error_message)
                    raise QgsProcessingException(error_message)

                feedback.pushInfo('* ' + sf + ' -- OK !')

        # Everything is fine, we now update to the plugin version
        sql = '''
            UPDATE adresse.metadata
            SET (me_version, me_version_date)
            = ( '{}', now()::timestamp(0) );
        '''.format(plugin_version)

        _, _, _, ok, error_message = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            feedback.reportError(error_message)
            raise QgsProcessingException(error_message)

        msg = tr('*** LA STRUCTURE A BIEN ÉTÉ MISE À JOUR SUR LA BASE DE DONNÉES ***')
        feedback.pushInfo(msg)

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: msg
        }
