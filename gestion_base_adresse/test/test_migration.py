"""Tests for migrations."""

from gestion_base_adresse.processing.structure.create_database_structure import SCHEMA
import os
import unittest

from gestion_base_adresse.qgis_plugin_tools.tools.database import (
    available_migrations,
)
from gestion_base_adresse.qgis_plugin_tools.tools.resources import (
    plugin_path,
)

__copyright__ = "Copyright 2021, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"


class TestMigration(unittest.TestCase):

    def test_transactions(self):
        """ Tests migrations must have a transaction. """

        migrations = available_migrations(000000)
        for migration in migrations:

            with self.subTest(test_file=migration):
                sql_file = os.path.join(plugin_path(), "install/sql/upgrade/{}".format(migration))
                with open(sql_file, "r") as f:
                    sql = f.readlines()

                self.assertEqual(
                    'BEGIN;\n',
                    sql[0],
                    'The first line in {} must be a BEGIN; on a single line.'.format(migration)
                )
                self.assertEqual(
                    'COMMIT;\n',
                    sql[-1],
                    'The last line in {} must be a COMMIT; on a single line.'.format(migration)
                )

        sql_files = [
            "00_initialize_database.sql",
            "{}/10_FUNCTION.sql".format(SCHEMA),
            "{}/20_TABLE_SEQUENCE_DEFAULT.sql".format(SCHEMA),
            "{}/30_VIEW.sql".format(SCHEMA),
            "{}/40_INDEX.sql".format(SCHEMA),
            "{}/50_TRIGGER.sql".format(SCHEMA),
            "{}/60_CONSTRAINT.sql".format(SCHEMA),
            "{}/70_COMMENT.sql".format(SCHEMA),
        ]

        for sf in sql_files:
            with self.subTest(test_file=sf):
                sql_file = os.path.join(plugin_path(), "install/sql/{}".format(sf))

                with open(sql_file, "r") as f:
                    sql = f.readlines()

                self.assertEqual(
                    'BEGIN;\n',
                    sql[0],
                    'The first line in {} must be a BEGIN; on a single line.'.format(sf)
                )
                self.assertEqual(
                    'COMMIT;\n',
                    sql[-1],
                    'The last line in {} must be a COMMIT; on a single line.'.format(sf)
                )
