BEGIN;

ALTER TABLE adresse.appartenir_com DROP CONSTRAINT appartenir_com_id_voie_fkey;
ALTER TABLE adresse.appartenir_com ADD CONSTRAINT appartenir_com_id_voie_fkey FOREIGN KEY (id_voie) REFERENCES adresse.voie(id_voie) ON DELETE CASCADE;

CREATE OR REPLACE FUNCTION adresse.calcul_point_voie()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
    nb integer;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = OLD.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = OLD.id_voie;
    ELSIF TG_OP = 'INSERT' THEN
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = NEW.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = NEW.id_voie;
    END IF;

    RETURN NEW;
END;
$BODY$;

DROP TRIGGER IF EXISTS nb_point_delete ON adresse.point_adresse;
CREATE TRIGGER nb_point_delete
    AFTER DELETE
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.calcul_point_voie();

COMMIT;
