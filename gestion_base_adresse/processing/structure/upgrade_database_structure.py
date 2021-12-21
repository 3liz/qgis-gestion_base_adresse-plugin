__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"

import os

from qgis.core import (
    QgsProcessingException,
    QgsProcessingParameterBoolean,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils,
    QgsProcessingParameterCrs,
    QgsProviderConnectionException,
    QgsProcessingParameterProviderConnection,
    QgsProviderRegistry,
)

from .base import (
    BaseDatabaseAlgorithm,
)

from ...qgis_plugin_tools.tools.database import (
    available_migrations,
)
from ...qgis_plugin_tools.tools.i18n import tr
from ...qgis_plugin_tools.tools.resources import plugin_path
from ...qgis_plugin_tools.tools.version import format_version_integer, version

SCHEMA = "adresse"


class UpgradeDatabaseStructure(BaseDatabaseAlgorithm):

    CONNECTION_NAME = "CONNECTION_NAME"
    RUN_MIGRATIONS = "RUN_MIGRATIONS"
    SRID = 'SRID'
    OUTPUT_STATUS = "OUTPUT_STATUS"
    OUTPUT_STRING = "OUTPUT_STRING"

    def name(self):
        return "upgrade_database_structure"

    def displayName(self):
        return tr("Mise à jour de la structure de la base")

    def shortHelpString(self):
        return tr(
            "Mise à jour de la base de données suite à une nouvelle version de l'extension."
        )

    def initAlgorithm(self, config):
        _ = config
        connection_name = QgsExpressionContextUtils.globalScope().variable(
            "adresse_connection_name"
        )
        param = QgsProcessingParameterProviderConnection(
            self.CONNECTION_NAME,
            "Connexion PostgreSQL vers la base de données",
            "postgres",
            defaultValue=connection_name,
            optional=False,
        )
        param.setHelp('Nom de la connexion dans QGIS pour se connecter à la base de données')
        self.addParameter(param)

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.RUN_MIGRATIONS,
                tr("Cocher cette option pour lancer la mise-à-jour."),
                defaultValue=False,
                optional=False,
            )
        )

        self.addParameter(
            QgsProcessingParameterCrs(
                self.SRID, 'Projection des géométries',
                defaultValue='EPSG:2154',
                optional=False
            )
        )
        # OUTPUTS
        self.addOutput(
            QgsProcessingOutputNumber(self.OUTPUT_STATUS, tr("Output status"))
        )
        self.addOutput(
            QgsProcessingOutputString(self.OUTPUT_STRING, tr("Output message"))
        )

    def checkParameterValues(self, parameters, context):
        connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        connection = metadata.findConnection(connection_name)
        if not connection:
            raise QgsProcessingException(tr("La connexion {} n'existe pas").format(connection_name))

        if SCHEMA not in connection.schemas():
            msg = tr(
                "Le schéma {} n'existe pas dans la base de données {} ! "
            ).format(SCHEMA, connection_name)
            return False, msg

        return super().checkParameterValues(parameters, context)

    def processAlgorithm(self, parameters, context, feedback):
        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)
        connection = metadata.findConnection(connection_name)
        if not connection:
            raise QgsProcessingException(tr("La connexion {} n'existe pas.").format(connection_name))

        # Check if migration was enabled
        run_migrations = self.parameterAsBool(parameters, self.RUN_MIGRATIONS, context)
        if not run_migrations:
            msg = tr("Vous devez cocher cette case pour réaliser la mise à jour !")
            raise QgsProcessingException(msg)

        # Get database version
        sql = """
            SELECT me_version
            FROM {}.metadata
            WHERE me_status = 1
            ORDER BY me_version_date DESC
            LIMIT 1;
        """.format(
            SCHEMA
        )
        try:
            data = connection.executeSql(sql)
        except QgsProviderConnectionException as e:
            connection.executeSql("ROLLBACK;")
            raise QgsProcessingException(str(e))

        db_version = None
        for a in data:
            db_version = a[0]
        if not db_version:
            error_message = tr("Aucune version trouvée dans la base de données !")
            raise QgsProcessingException(error_message)

        feedback.pushInfo(
            tr("Version de la base de données") + " = {}".format(db_version)
        )

        # Get plugin version
        plugin_version = version()
        if plugin_version in ["master", "dev"]:
            migrations = available_migrations(000000)
            last_migration = migrations[-1]
            plugin_version = (
                last_migration.replace("upgrade_to_", "").replace(".sql", "").strip()
            )
            feedback.reportError(
                "Be careful, running the migrations on a development branch!"
            )
            feedback.reportError(
                "Latest available migration is {}".format(plugin_version)
            )
        else:
            feedback.pushInfo(tr("Version du plugin") + " = {}".format(plugin_version))

        # Return if nothing to do
        if db_version == plugin_version:
            return {
                self.OUTPUT_STATUS: 1,
                self.OUTPUT_STRING: tr(
                    " La version de la base de données et du plugin sont les mêmes. "
                    "Aucune mise-à-jour n'est nécessaire"
                ),
            }

        db_version_integer = format_version_integer(db_version)
        sql_files = available_migrations(db_version_integer)

        # Get input srid
        crs = self.parameterAsCrs(parameters, self.SRID, context)
        srid = crs.authid().replace('EPSG:', '')
        feedback.pushInfo('SRID = {}'.format(srid))

        # Loop sql files and run SQL code
        for sf in sql_files:
            sql_file = os.path.join(plugin_path(), "install/sql/upgrade/{}".format(sf))
            with open(sql_file, "r") as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo("* " + sf + " -- NON TRAITÉ (FICHIER VIDE)")
                    continue

                # Replace 2154 by given srid
                sql = sql.replace('2154', srid)

                # Add SQL database version in adresse.metadata
                new_db_version = (
                    sf.replace("upgrade_to_", "").replace(".sql", "").strip()
                )
                feedback.pushInfo("* NOUVELLE VERSION BDD " + new_db_version)
                sql += """
                    UPDATE {}.metadata
                    SET (me_version, me_version_date)
                    = ( '{}', now()::timestamp(0) );
                """.format(
                    SCHEMA, new_db_version
                )

                try:
                    connection.executeSql(sql)
                except QgsProviderConnectionException as e:
                    connection.executeSql("ROLLBACK;")
                    raise QgsProcessingException(str(e))

                feedback.pushInfo("* " + sf + " -- OK !")

        # Everything is fine, we now update to the plugin version
        sql = """
            UPDATE {}.metadata
            SET (me_version, me_version_date)
            = ( '{}', now()::timestamp(0) );
        """.format(
            SCHEMA, plugin_version
        )

        try:
            connection.executeSql(sql)
        except QgsProviderConnectionException as e:
            connection.executeSql("ROLLBACK;")
            raise QgsProcessingException(str(e))

        msg = tr("*** LA STRUCTURE A BIEN ÉTÉ MISE À JOUR SUR LA BASE DE DONNÉES ***")
        feedback.pushInfo(msg)

        return {self.OUTPUT_STATUS: 1, self.OUTPUT_STRING: msg}
