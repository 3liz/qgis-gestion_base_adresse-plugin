"""Tests for load structure with an empty database."""

from .base_test_database import DatabaseWithoutDataTestCase

__copyright__ = "Copyright 2019, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"


class TestSqlFunctions(DatabaseWithoutDataTestCase):

    def test_to_be_removed_later(self):
        """ Test the database is provided without data. """
        # Number of tables
        self.cursor.execute(
            "SELECT ST_astext(ST_startPoint(adresse.calcul_segment_proche(st_geomfromtext"
            "('LINESTRING(429172 6920701, 429165 6920737, 429142 6920823,"
            " 429141 6920875, 429147 6920926)', 2154), "
            "St_geomfromtext('POINT(429162 6920851)', 2154)))) "
        )
        self.assertEqual('POINT(429142 6920823)', self.cursor.fetchone()[0])

        self.cursor.execute(
            "SELECT ST_astext(ST_startPoint(adresse.calcul_segment_proche(st_geomfromtext"
            "('LINESTRING(429172 6920701, 429165 6920737, 429142 6920823,"
            " 429141 6920875, 429147 6920926)', 2154), "
            "St_geomfromtext('POINT(429125 6920901)', 2154)))) "
        )
        self.assertEqual('POINT(429141 6920875)', self.cursor.fetchone()[0])
