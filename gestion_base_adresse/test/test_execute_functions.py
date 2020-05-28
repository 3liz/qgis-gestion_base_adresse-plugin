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
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
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

        # Test d'ajout des points Pair Avec un ordre spécifique 2, 2bis puis 4

        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

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

        # Deuxième point on force le 2bis
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) select 2, 'bis', 3,"
            "ST_geomfromtext('POINT(428035 6922078)', 2154) "
        )
        self.cursor.execute(sql)

        # Troisime point placé après le deuxième, test d'égalité à 4
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

    def test_calcul_num_metrique(self):
        """Test de la fonction calcul_num_metrique."""
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
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

    def test_multiple_voie_unlock(self):
        """Test d'ajout de point avec plusieurs voies déverrouillées"""
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 1'
        self.cursor.execute(sql)

        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 2'
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

    def test_inversion_calcul_metrique(self):
        """ Test avant puis après inversion de la voie et sens de numérotation
        (comme si l'on clique sur le bouton dans la popup) """

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
        sql = (
            "UPDATE adresse.voie SET geom = ST_REVERSE(geom), sens_numerotation = NOT sens_numerotation "
            "WHERE id_voie = 3;"
        )
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

    def test_id_commune(self):
        """Test si l'id de la commune et
        Présent lors de l'ajout d'un point"""

        sql = (
            "INSERT INTO adresse.point_adresse(id_point, numero, suffixe, id_voie, geom) "
            "select 100, num, suffixe, 3, ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        sql = (
            "SELECT id_commune FROM adresse.point_adresse WHERE id_point = 100"
        )
        self.cursor.execute(sql)
        self.assertEqual((4,), self.cursor.fetchone())

    def test_update_adr_complete(self):
        """ Test de la fonction trigger update_adr_complete """
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Ajout d'un point proche de la voie 2 qui n'est pas dévérouillé
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom) "
            "select num, suffixe, ST_geomfromtext('POINT(429148 6921999)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(429148 6921999)', 2154))"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, None, 3), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 Route d'Arromanches",), self.cursor.fetchone())

        # Modification de l'id_voie du point
        sql = (
            "UPDATE adresse.point_adresse SET id_voie = 2 WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, None, 2), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 Chemin des Cauterets",), self.cursor.fetchone())

        # Modification de l'id_voie du point en mettant NULL
        # seul la voie 3 est dévérouillé
        sql = (
            "UPDATE adresse.point_adresse SET id_voie = NULL WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, None, 3), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 Route d'Arromanches",), self.cursor.fetchone())

        # Dévérouillage de la voie 2
        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 2'
        self.cursor.execute(sql)

        # Modification de l'id_voie du point en mettant NULL
        # la voie dévérouillée la plus proche est la 2
        sql = (
            "UPDATE adresse.point_adresse SET id_voie = NULL WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, None, 2), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 Chemin des Cauterets",), self.cursor.fetchone())

        # Modification du suffixe du point
        sql = (
            "UPDATE adresse.point_adresse SET suffixe = 'bis' WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, 'bis', 2), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 bis Chemin des Cauterets",), self.cursor.fetchone())
        # Modification du suffixe du point
        sql = (
            "UPDATE adresse.point_adresse SET suffixe = 'ter' WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 1, 'ter', 2), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("1 ter Chemin des Cauterets",), self.cursor.fetchone())

        # Modification du suffixe du point
        sql = (
            "UPDATE adresse.point_adresse SET numero = 3, suffixe = NULL WHERE id_point=1"
        )
        self.cursor.execute(sql)

        sql = (
            "select id_point, numero, suffixe, id_voie from adresse.point_adresse LIMIT 1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, 3, None, 2), self.cursor.fetchone())

        # Vérification du nom complet
        sql = (
            "select adresse_complete from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual(("3 Chemin des Cauterets",), self.cursor.fetchone())

    def test_calcul_num_adr_voie_complexe(self):
        """
        Test de la numérotation sur une voie complexe
        La voie 2, Route d'Arromanche présente des virages
        Le calcul des numéros peut-en être affecté
        """
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Test ajout point impair
        # Premier point, test d'égalité à 1
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428237 6922087)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, None), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom) select num, suffixe,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428237 6922087)', 2154))"
        )
        self.cursor.execute(sql)

        # Test ajout point pair
        # Premier point, test d'égalité à 2
        sql = (
            "select num, suffixe from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(429148 6921624)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, None), self.cursor.fetchone())
