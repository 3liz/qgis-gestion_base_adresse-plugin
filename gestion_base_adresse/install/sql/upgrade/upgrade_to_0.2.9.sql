BEGIN;

CREATE OR REPLACE FUNCTION adresse.update_commune()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
    leid integer;
BEGIN
    IF (TG_TABLE_NAME = 'voie') THEN
        INSERT INTO adresse.appartenir_com(id_voie, id_com) SELECT NEW.id_voie, c.id_com from adresse.commune c where ST_intersects(NEW.geom, c.geom);
        RETURN NEW;
    ELSIF (TG_TABLE_NAME = 'point_adresse') THEN
        SELECT c.id_com into leid FROM adresse.commune c WHERE st_intersects(New.geom,c.geom);
        NEW.id_commune = leid;
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$BODY$;

CREATE TRIGGER get_commune
    BEFORE INSERT
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.update_commune();

CREATE TRIGGER get_commune
    BEFORE INSERT
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.update_commune();
COMMIT;
