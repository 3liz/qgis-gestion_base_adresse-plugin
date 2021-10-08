"""Tests for load structure with an empty database."""

from .base_test_database import DatabaseTestCase
import psycopg2

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
            "v_commune",
            "v_export_bal",
            "codes_postaux",
            "import_ban",
            "import_ban_etat_commune",
            "import_ban_lo",
            "v_point_adresse",
            "lieux_dits",
            "v_lieux_dits",
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
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Check INSERT
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, None, 3), self.cursor.fetchone())

        # Deuxième point placé après le premier, test d'égalité à 3
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428106 6922255)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428106 6922255)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428106 6922255)', 2154))"
        )
        self.cursor.execute(sql)

        # Troisième point placé entre les deux premiers, test d'égalité à 1bis
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428198 6922157)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, "bis", 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428198 6922157)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428198 6922157)', 2154))"
        )
        self.cursor.execute(sql)

        # Test d'ajout des points Pair
        # Premier point, test d'égalité à 2
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428226 6922001)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428226 6922001)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428226 6922001)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé après le premier, test d'égalité à 4
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((4, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(427937 6922173)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)

        # Troisième point entre les deux autres, test d'égalité à 2bis
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428035 6922078)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, "bis", 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428035 6922078)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428035 6922078)', 2154))"
        )
        self.cursor.execute(sql)

        # Test d'ajout des points Pair Avec un ordre spécifique 2, 2bis puis 4

        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Premier point, test d'égalité à 2
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428226 6922001)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
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
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((4, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(427937 6922173)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(427937 6922173)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérouillage des voies
        sql='UPDATE adresse.voie SET statut_voie_num = true'
        self.cursor.execute(sql)

        # Aucune voie dévérouillée n'est disponible
        # Aucun numéro d'adresse calculable
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_adr(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((None, None, None), self.cursor.fetchone())

    def test_calcul_num_metrique(self):
        """Test de la fonction calcul_num_metrique."""
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Test ajout point impair
        # Premier point, test d'égalité à 1997
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1997, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310. 6922058.)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé sur le même que le premier, test d'égalité à 1997bis
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1997, "bis", 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Test ajout point Pair
        # Premier point, test d'égalité à 1992
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1992, None, 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428252 6921965)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)

        # Deuxième point placé sur le même que le premier, test d'égalité à 1992bis
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1992, "bis", 3), self.cursor.fetchone())
        # Insertion du point
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom) "
            "SELECT num, suffixe, voie,"
            "ST_geomfromtext('POINT(428252 6921965)', 2154) "
            "from adresse.calcul_num_metrique(ST_geomfromtext('POINT(428252 6921965)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérouillage des voies
        sql='UPDATE adresse.voie SET statut_voie_num = true'
        self.cursor.execute(sql)

        # Aucune voie dévérouillée n'est disponible
        # Aucun numéro d'adresse calculable
        sql = (
            "select num, suffixe, voie from adresse.calcul_num_metrique(ST_geomfromtext("
            "'POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((None, None, None), self.cursor.fetchone())

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

        # Dévérouillage de la voie 2
        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 2'
        self.cursor.execute(sql)

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

        # vérouillage de la voie 2
        sql='UPDATE adresse.voie SET statut_voie_num = true where id_voie = 2'
        self.cursor.execute(sql)

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
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310 6922058)', 2154))"
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

    def test_insert_point_adresse(self):
        """
        Test d'insert
        """
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Insertion du point 1
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom) select num, suffixe,"
            "ST_geomfromtext('POINT(428310 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428310 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification
        sql = (
            "select numero, suffixe, id_voie, valide from adresse.point_adresse WHERE id_point=1"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1, None, 3, True), self.cursor.fetchone())

        # Insertion d'un point avec un numéro existant
        # Insertion du point 1
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 1, NULL, ST_geomfromtext('POINT(428320 6922058)', 2154) "
        )
        self.cursor.execute(sql)

        # Vérification
        sql = (
            "select COUNT(id_point) from adresse.point_adresse"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1,), self.cursor.fetchone())

        # Insertion du point 2 sur la voie 2
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, id_voie, geom)"
            " select num, suffixe, 2, ST_geomfromtext('POINT(428300 6922058)', 2154) "
            "from adresse.calcul_num_adr(ST_geomfromtext('POINT(428300 6922058)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification
        sql = (
            "select COUNT(id_point) from adresse.point_adresse"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((2,), self.cursor.fetchone())

        # Vérification du point 2 sur la voie 3
        sql = (
            "select numero, suffixe, id_voie, valide from adresse.point_adresse WHERE id_point=3"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 3, True), self.cursor.fetchone())

        # Vérouillage des voies
        sql='UPDATE adresse.voie SET statut_voie_num = true'
        self.cursor.execute(sql)

        # Insertion du point 3
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 5, NULL, ST_geomfromtext('POINT(428290 6922058)', 2154) "
        )
        self.cursor.execute(sql)

        # Vérification
        sql = (
            "select COUNT(id_point) from adresse.point_adresse"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3,), self.cursor.fetchone())

        # Vérification du point 3
        sql = (
            "select numero, suffixe, id_voie, valide from adresse.point_adresse WHERE id_point=4"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((5, None, None, False), self.cursor.fetchone())

    def test_update_point_adresse(self):
        """
        Test d'update
        """
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Insertion du point 1
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 1, NULL, ST_geomfromtext('POINT(428310 6922058)', 2154) "
        )
        self.cursor.execute(sql)

        # Insertion du point 2
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 3, NULL, ST_geomfromtext('POINT(428300 6922058)', 2154) "
        )
        self.cursor.execute(sql)

        # Insertion du point 3
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 5, NULL, ST_geomfromtext('POINT(428290 6922058)', 2154) "
        )
        self.cursor.execute(sql)

        # Vérification
        sql = (
            "select COUNT(id_point) from adresse.point_adresse"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3,), self.cursor.fetchone())

        # Mise à jour du point 2 avec un numéro existant
        sql = (
            "UPDATE adresse.point_adresse SET numero=1 "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, aucun changement
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 3), self.cursor.fetchone())

        # Mise à jour du point 2 avec une voie NULL et suffixe
        sql = (
            "UPDATE adresse.point_adresse SET id_voie=NULL, suffixe='bis' "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, changement du suffixe uniquement
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, 'bis', 3), self.cursor.fetchone())

        # Mise à jour du point 2 avec suppression du suffixe
        sql = (
            "UPDATE adresse.point_adresse SET suffixe=NULL "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, changement du suffixe
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 3), self.cursor.fetchone())

        # Dévérouillage de la voie 2
        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 2'
        self.cursor.execute(sql)

        # Déplacement du point 2, à côté de la voie 2
        sql = (
            "UPDATE adresse.point_adresse "
            "SET geom=ST_geomfromtext('POINT(429148 6921999)', 2154) "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, Changement de voie
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 2), self.cursor.fetchone())

        # Vérouillage des voies
        sql='UPDATE adresse.voie SET statut_voie_num = true'
        self.cursor.execute(sql)

        # Mise à jour du point 2 avec une voie NULL
        sql = (
            "UPDATE adresse.point_adresse SET id_voie=NULL, suffixe='bis' "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, aucun changement
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 2), self.cursor.fetchone())

        # Mise à jour du point 2 à côté de la voie 3
        sql = (
            "UPDATE adresse.point_adresse SET suffixe='bis' "
            ", geom=ST_geomfromtext('POINT(428300 6922058)', 2154) "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, aucun changement
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 2), self.cursor.fetchone())

        # Mise à jour du point 2 modification du suffixe
        sql = (
            "UPDATE adresse.point_adresse SET suffixe='bis' "
            "WHERE id_point=2"
        )
        self.cursor.execute(sql)

        # Vérification du point 2, changement du suffixe
        sql = (
            "select numero, suffixe, id_voie from adresse.point_adresse WHERE id_point=2"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, 'bis', 2), self.cursor.fetchone())

        # Insertion du point 4 à côté de la voie 2
        sql = (
            "INSERT INTO adresse.point_adresse(numero, suffixe, geom)"
            " select 3, NULL, ST_geomfromtext('POINT(429149 6921999)', 2154) "
        )
        self.cursor.execute(sql)

        # Vérification du point 4
        sql = (
            "select numero, suffixe, id_voie, valide from adresse.point_adresse WHERE id_point=4"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, None, False), self.cursor.fetchone())

        # Dévérouillage de la voie 2
        sql='UPDATE adresse.voie SET statut_voie_num = false where id_voie = 2'
        self.cursor.execute(sql)

        # Valider le point 4
        sql = (
            "UPDATE adresse.point_adresse SET valide=True "
            "WHERE id_point=4"
        )
        self.cursor.execute(sql)

        # Vérification du point 4
        sql = (
            "select numero, suffixe, id_voie, valide from adresse.point_adresse WHERE id_point=4"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((3, None, 2, True), self.cursor.fetchone())

    def test_add_and_delete_road(self):
        """ Test to add and delete Road """

        # Premier test ajout et supression d'une voie

        # Ajout d'une nouvelle voie
        sql=(
            "INSERT INTO adresse.voie(id_voie, typologie, nom, type_num, geom)"
            " Values(1000, 'Rue', 'du test', 'Classique', "
            "st_geomfromtext('LINESTRING(429172 6920701, 429165 6920737, 429142 6920823,"
            " 429141 6920875, 429147 6920926)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification de l'existance de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1000,), self.cursor.fetchone())

        # Suppression de la voie
        sql = (
            "delete from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)

        # Vérification de la suppression de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual((None), self.cursor.fetchone())

        # Deuxième test: Ajout, déverrouillage et suppression de voie

        # Ajout d'une nouvelle voie
        sql=(
            "INSERT INTO adresse.voie(id_voie, typologie, nom, type_num, geom) "
            " Values(1000, 'Rue', 'du test', 'Classique', "
            "st_geomfromtext('LINESTRING(429172 6920701, 429165 6920737, 429142 6920823,"
            " 429141 6920875, 429147 6920926)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification de l'existance de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1000,), self.cursor.fetchone())

        # Déverrouillage de la voie
        sql=(
            "UPDATE adresse.voie SET statut_voie_num = False WHERE id_voie = 1000"
        )
        self.cursor.execute(sql)

        # Vérification du déverrouillage de la voie
        sql=(
            "SELECT statut_voie_num From adresse.voie WHERE id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((False,), self.cursor.fetchone())

        # Suppression de la voie
        sql = (
            "delete from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)

        # Vérification de la suppression de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual((None), self.cursor.fetchone())

        # Troisième test: Ajout, déverrouillage, ajout d'un point
        # et test de suppression de voie

        # Ajout d'une nouvelle voie
        sql=(
            "INSERT INTO adresse.voie(id_voie, typologie, nom, type_num, geom) "
            " Values(1000, 'Rue', 'du test', 'Classique', "
            "st_geomfromtext('LINESTRING(429172 6920701, 429165 6920737, 429142 6920823,"
            " 429141 6920875, 429147 6920926)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification de l'existance de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((1000,), self.cursor.fetchone())

        # Déverrouillage de la voie
        sql=(
            "UPDATE adresse.voie SET statut_voie_num = False WHERE id_voie = 1000"
        )
        self.cursor.execute(sql)

        # Vérification du déverrouillage de la voie
        sql=(
            "SELECT statut_voie_num From adresse.voie WHERE id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertTupleEqual((False,), self.cursor.fetchone())

        # Ajout d'un point
        sql=(
            "INSERT INTO adresse.point_adresse(id_point, numero, id_voie, geom)"
            "values(1000, 20, 1000, St_geomfromtext('POINT(429162 6920851)', 2154))"
        )
        self.cursor.execute(sql)

        # Vérification de l'ajout du point
        sql=(
            "SELECT numero From adresse.point_adresse WHERE id_point = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual(20, self.cursor.fetchone()[0])

        sql=(
            "COMMIT"
        )
        self.cursor.execute(sql)
        # Suppression de la voie
        sql = (
            "delete from adresse.voie where id_voie = 1000"
        )
        msg = 'La voie ne peut pas être supprimé'
        with self.assertRaises(psycopg2.IntegrityError, msg=msg):
            self.cursor.execute(sql)

        sql = (
            "ROLLBACK"
        )
        self.cursor.execute(sql)
        # Vérification que la suppression de la voie n'a pas marché
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual(1000, self.cursor.fetchone()[0])

        # Dernier test: suppression du point,
        # suppression de la voie

        # Vérification de la présence du point
        sql=(
            "SELECT numero From adresse.point_adresse WHERE id_point = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual(20, self.cursor.fetchone()[0])

        # Suppression du point
        sql = (
            "delete from adresse.point_adresse where id_point = 1000"
        )
        self.cursor.execute(sql)

        # Vérification de la suppression du point
        sql = (
            "select id_point from adresse.point_adresse where id_point = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual(None, self.cursor.fetchone())

        # Suppression de la voie
        sql = (
            "delete from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)

        # Vérification de la suppression de la voie
        sql = (
            "select id_voie from adresse.voie where id_voie = 1000"
        )
        self.cursor.execute(sql)
        self.assertEqual(None, self.cursor.fetchone())

    def test_count_number_point(self):
        """ Test count number of point for a road """
        # Suppression des points pour pouvoir tout tester
        sql = "TRUNCATE TABLE adresse.point_adresse RESTART IDENTITY"
        self.cursor.execute(sql)

        # Disable trigger
        sql = (
            "ALTER TABLE adresse.point_adresse "
            "DISABLE TRIGGER trigger_point_adr"
        )
        self.cursor.execute(sql)

        # Adding One point
        sql=(
            "INSERT INTO adresse.point_adresse(id_point, numero, geom, valide)"
            "values(1, 20, St_geomfromtext('POINT(429162 6920851)', 2154), false) "
        )
        self.cursor.execute(sql)

        # Set point valide = true
        sql=(
            "UPDATE adresse.point_adresse SET valide = true WHERE id_point = 1"
        )
        self.cursor.execute(sql)

        # select id_voie from point
        sql= (
            "SELECT id_voie FROM adresse.point_adresse WHERE id_point = 1"
        )
        self.cursor.execute(sql)
        self.assertEqual((3,), self.cursor.fetchone())

        # test nb_point = 1
        sql= (
            "SELECT nb_point FROM adresse.voie WHERE id_voie = 3"
        )
        self.cursor.execute(sql)
        self.assertEqual((1,), self.cursor.fetchone())
