BEGIN;

DROP TRIGGER IF EXISTS nb_point ON adresse.point_adresse;
CREATE TRIGGER nb_point
    AFTER INSERT OR UPDATE
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.calcul_point_voie();

COMMIT;
