"""Tests for load structure with an empty database."""

from .base_test_database import DatabaseTestCase

__copyright__ = "Copyright 2019, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"
__revision__ = "$Format:%H$"


class TestSqlFunctions(DatabaseTestCase):
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
        """Test de la fonction calcul_num_adr."""
        # Test du calcul de numero d'adresse de base, la voie déverrouillée pour le test a la
        # numérotation inversée, donc nombre pair à gauche

        # Suppression des points pour pouvoir tout tester
        sql = "delete from adresse.point_adresse"
        self.cursor.execute(sql)

        # Test ajout point impair
        # Premier point, test d'égalité à 1
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé après le premier, test d'égalité à 3
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428106 6922255)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428106 6922255)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428106 6922255)', 2154))"
        )
        self.cursor.execute(sql)

        # Troisième point placé entre les deux premiers, test d'égalité à 1bis
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428198 6922157)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, "bis"), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428198 6922157)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428198 6922157)', 2154))"
        )
        self.cursor.execute(sql)

        # Test d'ajout des points Pair
        # Premier point, test d'égalité à 2
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428226 6922001)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428226 6922001)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428226 6922001)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé après le premier, test d'égalité à 4
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((4, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(427937 6922173)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)

        # Troisième point entre les deux autres, test d'égalité à 2bis
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428035 6922078)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, "bis"), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428035 6922078)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428035 6922078)', 2154))"
        )
        self.cursor.execute(sql)

    def test_calcul_num_metrique(self):
        """Test de la fonction calcul_num_metrique."""
        # Suppression des points pour pouvoir tout tester
        sql = "delete from adresse.point_adresse"
        self.cursor.execute(sql)

        # Test ajout point impair
        # Premier point, test d'égalité à 1997
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1997, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310. 6922058.)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé sur le même que le premier, test d'égalité à 1997bis
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1997, "bis"), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Test ajout point Pair
        # Premier point, test d'égalité à 1992
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1992, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428252 6921965)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé sur le même que le premier, test d'égalité à 1992bis
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1992, "bis"), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select num, suffixe, 3,"
            "ST_geomfromtext('POINT(428252 6921965)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)

        # test avant puis apres Inversion de la voie et sens de numérotation
        # (comme si l'on clique sur le bouton dans la popup)

        sql = "TRUNCATE TABLE adresse.point_adresse"
        self.cursor.execute(sql)

        # Test pair
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1992, None), self.cursor.fetchone())

        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428269 6921939)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1962, None), self.cursor.fetchone())

        # test impair
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1997, None), self.cursor.fetchone())

        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428369 6922065)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1953, None), self.cursor.fetchone())

        # Inversion
        sql = "UPDATE adresse.voie SET geom = ST_REVERSE(geom), sens_numerotation = NOT sens_numerotation WHERE id_voie = 3;"
        self.cursor.execute(sql)

        # Test pair
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((714, None), self.cursor.fetchone())

        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428269 6921939)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((742, None), self.cursor.fetchone())

        # test impair
        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((709, None), self.cursor.fetchone())

        sql = (
            "select num, suffixe from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428369 6922065)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((753, None), self.cursor.fetchone())
