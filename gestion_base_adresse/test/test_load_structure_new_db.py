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
        """Test calcul numero adresse de base la voie déverrouillée pour le test à la numérotation inversée donc pair à gauche"""
        """Suppression des points pour pouvoir tout tester"""
        sql = ("delete from adresse.point_adresse")
        self.cursor.execute(sql)

        """Test ajout point Impair"""
        """Premier point test égalité 1 """
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1,None), self.cursor.fetchone())
        """Insertion du point"""
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)


        """Deuxième point  après le premier, test égalité 3 """
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428106.09004837374 6922255.081019576)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3,None), self.cursor.fetchone())
        """Insertion du point"""
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428106.09004837374 6922255.081019576)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428106.09004837374 6922255.081019576)', 2154))"
        )
        self.cursor.execute(sql)

        """Troisième point entre les deux premier, test égalité 1bis"""
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428198.26787811174 6922157.2860289095)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1,'bis'), self.cursor.fetchone())
        """Insertion du point"""
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428198.26787811174 6922157.2860289095)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428198.26787811174 6922157.2860289095)', 2154))"
        )
        self.cursor.execute(sql)


        """Test ajout point Pair"""
        """Premier point, test égalité 2"""
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2,None), self.cursor.fetchone())
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)

        """Deuxième point après le premier, test égalité 4"""
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(427937.1260948194 6922173.154354719)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((4,None), self.cursor.fetchone())
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(427937.1260948194 6922173.154354719)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(427937.1260948194 6922173.154354719)', 2154))"
        )
        self.cursor.execute(sql)

        """Troisième point entre les deux autres, test égalité 2bis"""
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428035.6821912417 6922078.166801699)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2,'bis'), self.cursor.fetchone())
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428035.6821912417 6922078.166801699)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428035.6821912417 6922078.166801699)', 2154))"
        )
        self.cursor.execute(sql)

    def test_calcul_num_metrique(self):
        """Test calcul numero adresse métrique"""
        """Suppression des points pour pouvoir tout tester"""
        sql = ("delete from adresse.point_adresse")
        self.cursor.execute(sql)

        """Test ajout point Impair"""
        """Premier point test égalité 1473 """
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1473,None), self.cursor.fetchone())
        """Insertion du point"""
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)


        """Deuxième point le même que le premier, test égalité 1473bis """
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1473,'bis'), self.cursor.fetchone())
        """Insertion du point"""
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310.70370692277 6922058.531181184)', 2154))"
        )
        self.cursor.execute(sql)

        """Test ajout point Pair"""
        """Premier point, test égalité 1504"""
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1504,None), self.cursor.fetchone())
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)

        """Deuxième point le même que le premier, test égalité 1504bis"""
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1504,'bis'), self.cursor.fetchone())
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428226.8122813868 6922001.779449942)', 2154))"
        )
        self.cursor.execute(sql)
