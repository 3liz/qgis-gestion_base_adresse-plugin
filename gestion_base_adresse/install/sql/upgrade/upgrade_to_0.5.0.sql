BEGIN;

CREATE OR REPLACE FUNCTION adresse.calcul_point_voie() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    nb integer;
BEGIN
    IF TG_OP = 'DELETE' THEN
      SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = OLD.id_voie;
      UPDATE adresse.voie SET nb_point = nb WHERE id_voie = OLD.id_voie;
    ELSIF TG_OP = 'INSERT'  THEN
      IF NEW.id_voie IS NOT NULL THEN
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = NEW.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = NEW.id_voie;
      END IF;
    ELSIF TG_OP = 'UPDATE' AND NEW.id_voie IS DISTINCT FROM OLD.id_voie THEN
      IF NEW.id_voie IS NULL THEN
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = OLD.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = OLD.id_voie;
      ELSIF OLD.id_voie IS NULL THEN
          SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = NEW.id_voie;
          UPDATE adresse.voie SET nb_point = nb WHERE id_voie = NEW.id_voie;
      ELSE
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = NEW.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = NEW.id_voie;
        SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = OLD.id_voie;
        UPDATE adresse.voie SET nb_point = nb WHERE id_voie = OLD.id_voie;
      END IF;
    END IF;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS nb_point ON adresse.point_adresse;
CREATE TRIGGER nb_point
AFTER INSERT OR UPDATE
ON adresse.point_adresse
FOR EACH ROW
EXECUTE PROCEDURE adresse.calcul_point_voie();

COMMIT;
