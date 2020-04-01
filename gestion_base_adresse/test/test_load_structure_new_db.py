"""Tests for load structure with an empty database."""

from .base_test_database import DatabaseTestCase

__copyright__ = "Copyright 2019, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"


class TestLoadStructureEmptyDatabase(DatabaseTestCase):

    """This class is redundant with test_load_structure,
    but this one is using a setup function."""

    def test_configure_project_with_new_db(self):
        """Test we can load the PostGIS structure using the setup function."""

        self.cursor.execute(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = 'adresse'"
        )
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        expected = [
            "appartenir_com",
            "commune",
            "document",
            "metadata",
            "point_adresse",
            "voie",
            "parcelle",
            "commune_deleguee",
            "referencer_com",
            "vue_com",
            "export_bal",
        ]
        self.assertCountEqual(expected, result)

    def test_calcul_num_adr(self):
        """Test calcul numero adresse"""
        sql = (
            "select adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(429155.362707719 6921958.66174973)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("(4,bis)",), self.cursor.fetchone())

    def test_calcul_num_metrique(self):
        """Test calcul numero adresse métrique"""
        sql = (
            "select adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(429155.362707719 6921958.66174973)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("(547,)",), self.cursor.fetchone())
