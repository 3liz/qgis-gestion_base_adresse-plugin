BEGIN;

-- DROP TRIGGERE point_adresse get_parcelle
DROP TRIGGER IF EXISTS get_parcelle ON adresse.point_adresse;

-- DROP FUNCTION get_parcelle()
DROP FUNCTION IF EXISTS adresse.get_parcelle();

-- CREATE FUNCTION get_parcelle() with upgrade
CREATE FUNCTION adresse.get_parcelle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.id_parcelle = (SELECT p.fid FROM adresse.parcelle p WHERE ST_intersects(NEW.geom, p.geom) LIMIT 1);
    RETURN NEW;
END;
$$;

-- CREATE TRIGGERE point_adresse get_parcelle
CREATE TRIGGER get_parcelle BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_parcelle();

COMMIT;
