--Add default value NOW() to date_modif
ALTER TABLE adresse.voie ALTER COLUMN date_modif SET DEFAULT NOW();
ALTER TABLE adresse.point_adresse ALTER COLUMN date_modif SET DEFAULT NOW();


-- Trigger to save createur and force Now() to date_modif

CREATE OR REPLACE FUNCTION adresse.modif_update()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.createur = OLD.createur;
    NEW.date_creation = OLD.date_creation;
    NEW.date_modif = NOW();

    RETURN NEW;
END;
$BODY$;

CREATE TRIGGER update_modif_create
    BEFORE INSERT
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.modif_update();
