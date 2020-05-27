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
    AFTER INSERT
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.update_commune();

ALTER TABLE adresse.document ADD COLUMN lien text;
COMMENT ON COLUMN adresse.document.lien IS 'Chemin de stockage du document';

ALTER TABLE adresse.document ALTER COLUMN date_doc TYPE date USING date_doc::date;

CREATE OR REPLACE FUNCTION adresse.calcul_num_adr(
	pgeom geometry)
    RETURNS TABLE(num integer, suffixe text)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$
DECLARE
    numa integer;
    numb integer;
    numc integer;
    sens boolean;
    s text;
    rec text;
    suff text[];
    idvoie integer;
    isleft boolean;
    test boolean;
BEGIN

    -- Get idvoie
    SELECT id_voie into idvoie
    FROM( SELECT id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom ) into isleft
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE AND id_voie=idvoie;

    SELECT v.sens_numerotation into sens
    FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT numero into numa
    FROM(
    SELECT ST_Distance(pgeom, p1.geom) as dist, p1.numero as numero
    FROM adresse.point_adresse p1, adresse.voie v
    WHERE statut_voie_num IS FALSE AND p1.id_voie = idvoie AND
        (ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, pgeom)) - ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, p1.geom))) >0
        AND
        isleft =
        adresse.calcul_point_position(adresse.calcul_segment_proche(v.geom, p1.geom), p1.geom)
    ORDER BY dist LIMIT 1) AS a;

    suff = ARRAY ['bis', 'ter', 'qua', 'qui', 'a', 'b', 'c', 'd', 'e'];

    SELECT numero into numb
    FROM(
    SELECT ST_Distance(pgeom, p1.geom) as dist, p1.numero as numero
    FROM adresse.point_adresse p1, adresse.voie v
    WHERE statut_voie_num IS FALSE AND p1.id_voie = idvoie AND
        (ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, pgeom)) - ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, p1.geom))) <0
        AND
        isleft =
        adresse.calcul_point_position(adresse.calcul_segment_proche(v.geom, p1.geom), p1.geom)
    ORDER BY dist LIMIT 1) AS b;

    IF numa IS NOT NULL AND numb IS NOT NULL THEN
        test = false;
        IF numb - numa > 2 THEN
         numc = numa+2;
        ELSE
            FOREACH rec IN ARRAY suff LOOP
                IF (SELECT TRUE FROM adresse.point_adresse p WHERE p.id_voie = idvoie AND p.numero = numa AND p.suffixe = rec) IS NULL AND NOT test THEN
                    test = true;
                    numc = numa;
                    s = rec;
                END IF;
            END LOOP;
        END IF;
    ELSIF numa IS NOT NULL AND numb IS NULL THEN
        numc = numa+2;
    ELSIF numa IS NULL AND numb IS NOT NULL THEN
        IF numb - 2 >0 THEN
            numc =  numb - 2;
        ELSIF numb - 2 <= 0 THEN
            test = false;
            FOREACH rec IN ARRAY suff LOOP
                IF (SELECT TRUE FROM adresse.point_adresse p WHERE p.id_voie = idvoie AND p.numero = numb AND p.suffixe = rec) IS NULL AND NOT test THEN
                    test = true;
                    numc = numb;
                    s = rec;
                END IF;
            END LOOP;
        END IF;
    ELSIF numa IS NULL AND numb IS NULL THEN
        IF isleft AND NOT sens THEN
            numc = 1;
        ELSIF NOT isleft AND NOT sens THEN
            numc = 2;
        ELSIF isleft AND sens THEN
            numc = 2;
        ELSIF NOT isleft AND sens THEN
            numc = 1;
        END IF;
    END IF;

    return query SELECT numc, s;
END;
$BODY$;

COMMIT;
