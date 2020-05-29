BEGIN;

CREATE OR REPLACE FUNCTION adresse.calcul_num_adr(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text)
    LANGUAGE plpgsql
    AS $$
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
    SELECT adresse.get_id_voie(pgeom) into idvoie;

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom ) into isleft
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE AND id_voie=idvoie;

    SELECT v.sens_numerotation into sens
    FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT numero into numa
    FROM(
    SELECT ST_Distance(pgeom, p1.geom) as dist, p1.numero as numero
    FROM adresse.point_adresse p1, adresse.voie v
    WHERE statut_voie_num IS FALSE AND p1.id_voie = idvoie AND v.id_voie = idvoie AND
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
    WHERE statut_voie_num IS FALSE AND p1.id_voie = idvoie AND v.id_voie = idvoie AND
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
$$;


CREATE OR REPLACE FUNCTION adresse.calcul_num_metrique(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text)
    LANGUAGE plpgsql
    AS $$DECLARE
    num integer;
    idvoie integer;
    numc integer;
    sens boolean;
    res text;
    rec text;
    isleft boolean;
    test boolean;
    suff text[];
BEGIN

    -- Get idvoie
    SELECT adresse.get_id_voie(pgeom) into idvoie;

    SELECT v.sens_numerotation into sens FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom) into isleft
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE AND id_voie = idvoie;

    SELECT round(ST_Length(v.geom)*ST_LineLocatePoint(v.geom, pgeom))::integer into num
    FROM adresse.voie v
    WHERE id_voie = idvoie;

    suff = ARRAY ['bis', 'ter', 'qua', 'qui', 'a', 'b', 'c', 'd', 'e'];

    IF isleft AND num%2 = 0 AND NOT sens THEN
        num = num +1;
    ELSIF NOT isleft AND num%2 != 0 AND NOT sens THEN
        num = num + 1;
    ELSIF isleft AND num%2 != 0 AND sens THEN
        num = num +1;
    ELSIF NOT isleft AND num%2 = 0 AND sens THEN
        num = num + 1;
    END IF;

    test = false;
    WHILE NOT test LOOP
        IF (SELECT TRUE FROM adresse.point_adresse p WHERE p.id_voie = idvoie AND numero = num) IS NULL THEN
            test = true;
            numc = num;
        ELSE
            FOREACH rec IN ARRAY suff LOOP
                IF (SELECT TRUE FROM adresse.point_adresse p WHERE p.id_voie = idvoie AND p.numero = num AND p.suffixe = rec) IS NULL AND NOT test THEN
                    test = true;
                    numc = num;
                    res = rec;
                END IF;
            END LOOP;
        END IF;
        num = num +2;
    END LOOP;

   RETURN query SELECT numc, res;
END;
$$;


-- update_adr_complete()
CREATE OR REPLACE FUNCTION adresse.update_adr_complete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    idvoie integer;
    adrvoie text;
BEGIN
    IF (TG_TABLE_NAME = 'voie') THEN
        IF NEW.typologie != OLD.typologie OR NEW.nom != OLD.nom THEN
            UPDATE adresse.point_adresse
            SET adresse_complete = CONCAT(numero, ' ', NEW.typologie, ' ', NEW.nom)
            WHERE id_voie = OLD.id_voie;
        END IF;
        RETURN NEW;
    ELSIF (TG_TABLE_NAME = 'point_adresse') THEN
        -- Cas des différence
        IF NEW.numero != OLD.numero
            OR NEW.suffixe IS DISTINCT FROM OLD.suffixe
            OR NEW.id_voie IS DISTINCT FROM OLD.id_voie
            OR ST_DISTANCE(NEW.geom, OLD.geom) > 0.0
            OR (NEW.a_valider IS DISTINCT FROM OLD.a_valider AND OLD.a_valider) THEN

            -- Cas où id_voie est null, calculer un nouvel id_voie
            IF NEW.id_voie IS DISTINCT FROM OLD.id_voie
                OR (NEW.id_voie IS NULL AND OLD.a_valider)
                OR ST_DISTANCE(NEW.geom, OLD.geom) > 0.0 THEN
                SELECT adresse.get_id_voie(NEW.geom) into idvoie;
                -- Aucune voie dévérouillée trouvée
                IF idvoie IS NULL THEN
                    return NULL;
                END IF;
                NEW.id_voie = idvoie;
            END IF;

            -- Vérification que la nouvelle adresse n'existe pas déjà
            IF (NEW.numero != OLD.numero
                OR NEW.suffixe IS DISTINCT FROM OLD.suffixe
                OR NEW.id_voie IS DISTINCT FROM OLD.id_voie)
                AND (SELECT adresse.num_exists(NEW.numero, NEW.suffixe, NEW.id_voie)) THEN
                return NULL;
            END IF;

            -- Modification du nom complet de la voie
            SELECT nom_complet into adrvoie FROM adresse.voie WHERE id_voie = NEW.id_voie;
            IF NEW.suffixe IS NOT NULL THEN
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', NEW.suffixe, ' ', adrvoie);
            ELSE
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', adrvoie);
            END IF;
        END IF;
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$;

-- get_id_voie(public.geometry)
CREATE OR REPLACE FUNCTION adresse.get_id_voie(pgeom public.geometry) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    idvoie integer;
BEGIN
    SELECT leid into idvoie FROM(
        SELECT v.id_voie as leid, ST_Distance(pgeom, v.geom) as dist
        FROM adresse.voie  v, adresse.commune com
        WHERE v.statut_voie_num IS FALSE
          AND ST_Intersects(pgeom, com.geom)
          AND ST_DWithin(v.geom, com.geom, 2000)
        ORDER BY dist LIMIT 1
    ) AS d;

    RETURN idvoie;
END;
$$;

DROP FUNCTION IF EXISTS adresse.check_num_exist(num integer, suff text, idvoie integer);
-- num_exists(integer, text, integer)
CREATE OR REPLACE FUNCTION adresse.num_exists(num integer, suff text, idvoie integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (
        SELECT numero
          FROM adresse.point_adresse
         WHERE numero = num
           AND suffixe IS NOT DISTINCT FROM suff
           AND id_voie IS NOT DISTINCT FROM idvoie
        ) IS NULL THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END;
$$;

-- trigger_point_adr()
CREATE OR REPLACE FUNCTION adresse.trigger_point_adr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
    idvoie integer;
    adrvoie text;
BEGIN
    -- Récupération de l'identifiant de la voie dévérouillée la plus proche
    SELECT adresse.get_id_voie(NEW.geom) into idvoie;

    -- Si aucune voie dévérouillée proche mais qu'un identifiant de voie est fourni
    -- on le garde la voie
    IF idvoie is NULL AND NEW.id_voie IS NOT NULL THEN
        idvoie:= NEW.id_voie;
    END IF;

    IF idvoie IS NOT NULL THEN
        -- Si l'identifiant de voies est non null
        IF NOT (SELECT adresse.num_exists(NEW.numero, NEW.suffixe, idvoie)) THEN
            -- Si l'adresse n'existe pas déjà on enregistre et modififie le nom complet
            NEW.id_voie = idvoie;
            SELECT nom_complet into adrvoie FROM adresse.voie WHERE id_voie = idvoie;
            IF NEW.suffixe IS NOT NULL THEN
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', NEW.suffixe, ' ', adrvoie);
            ELSE
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', adrvoie);
            END IF;
            RETURN NEW;
        ELSE
            -- Sinon enregistrement impossible
            RETURN NULL;
        END IF;
    ELSE
        -- Sinon on modifie a_valider et on enregistre
        NEW.a_valider = True;
        RETURN NEW;
    END IF;
END;
$$;

COMMIT;
