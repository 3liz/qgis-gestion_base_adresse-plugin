--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)
-- Dumped by pg_dump version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- calcul_num_adr(public.geometry)
CREATE FUNCTION adresse.calcul_num_adr(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text)
    LANGUAGE plpgsql
    AS $$DECLARE
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

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom)into isleft
    FROM( SELECT geom, id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    SELECT id_voie into idvoie
    FROM( SELECT id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    SELECT v.sens_numerotation into sens
    FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT numero into numa
    FROM(
    SELECT ST_Distance(pgeom, p1.geom) as dist, p1.numero as numero
    FROM adresse.point_adresse p1, adresse.voie v
    WHERE statut_voie_num IS FALSE AND p1.id_voie = idvoie AND
        (ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, pgeom)) - ST_LineLocatePoint(v.geom, ST_ClosestPoint(v.geom, p1.geom))) >0
        AND
        adresse.calcul_point_position(adresse.calcul_segment_proche(v.geom, pgeom), pgeom) =
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
        adresse.calcul_point_position(adresse.calcul_segment_proche(v.geom, pgeom), pgeom) =
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


-- calcul_num_metrique(public.geometry)
CREATE FUNCTION adresse.calcul_num_metrique(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text)
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
    SELECT id_voie into idvoie FROM(
    SELECT id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    SELECT v.sens_numerotation into sens FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom) into isleft
    FROM( SELECT geom, id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

   
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


-- calcul_point_position(public.geometry, public.geometry)
CREATE FUNCTION adresse.calcul_point_position(seg public.geometry, pointc public.geometry) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    a geometry;
    b geometry;
BEGIN
   a = ST_StartPoint(seg);
   b = ST_EndPoint(seg);
   RETURN (ST_X(b) - St_X(a))*(ST_Y(pointc) - ST_Y(a))
    - (ST_Y(b) - ST_Y(a))*(ST_X(pointc) - St_X(a))
    > 0;
END;
$$;


-- calcul_point_voie()
CREATE FUNCTION adresse.calcul_point_voie() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    nb integer;
BEGIN
    SELECT COUNT(id_point) into nb FROM adresse.point_adresse WHERE id_voie = NEW.id_voie;
    UPDATE adresse.voie SET nb_point = nb WHERE id_voie = NEW.id_voie;

    RETURN NEW;
END;
$$;


-- calcul_segment_proche(public.geometry, public.geometry)
CREATE FUNCTION adresse.calcul_segment_proche(ligne public.geometry, pointc public.geometry) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE
    lageom geometry;
BEGIN
   SELECT endgeom into lageom
   FROM ( SELECT ST_Distance(ST_MakeLine(St_PointN(ligne, n), St_PointN(ligne, n+1)), pointc) as dist,
   ST_MakeLine(St_PointN(ligne, n), St_PointN(ligne, n+1)) as endgeom
   FROM (SELECT generate_series(1, ST_NumPoints(ligne)-1) AS n) AS serie
   ORDER BY dist LIMIT 1) as finalgeom;

   RETURN lageom;
END;
$$;


-- check_num_exist(integer, text, integer)
CREATE FUNCTION adresse.check_num_exist(num integer, suff text, idvoie integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT numero FROM adresse.point_adresse WHERE numero = num AND suffixe = suff AND id_voie = idvoie) IS NULL THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$$;


-- get_id_voie(public.geometry)
CREATE FUNCTION adresse.get_id_voie(pgeom public.geometry) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    idvoie integer;
BEGIN
    SELECT leid into idvoie FROM(
    SELECT v.id_voie as leid, ST_Distance(pgeom, v.geom) as dist
    FROM adresse.voie  v
    WHERE v.statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    RETURN idvoie;
END;
$$;


-- longueur_voie()
CREATE FUNCTION adresse.longueur_voie() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.longueur = ST_Length(NEW.geom);

    RETURN NEW;
END;
$$;


-- modif_createur()
CREATE FUNCTION adresse.modif_createur() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    IF NEW.createur IS NULL AND NEW.modificateur IS NOT NULL THEN
        NEW.createur = NEW.modificateur;
    ELSIF NEW.createur IS NOT NULL THEN
        NEW.modificateur = NEW.createur;
    END IF;
    NEW.date_creation = NOW();
    NEW.date_modif = NOW();

    RETURN NEW;
END;
$$;


-- modif_update()
CREATE FUNCTION adresse.modif_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.createur = OLD.createur;
    NEW.date_creation = OLD.date_creation;
    NEW.date_modif = NOW();

    RETURN NEW;
END;
$$;


-- trigger_point_adr()
CREATE FUNCTION adresse.trigger_point_adr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
    idvoie integer;
    adrvoie text;
BEGIN
    SELECT adresse.get_id_voie(NEW.geom) into idvoie;

    IF idvoie IS NOT NULL THEN
        IF (SELECT adresse.check_num_exist(NEW.numero, NEW.suffixe, idvoie)) THEN
            NEW.id_voie = idvoie;
            SELECT nom_complet into adrvoie FROM adresse.voie WHERE id_voie = idvoie;
            IF NEW.suffixe IS NOT NULL THEN
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', NEW.suffixe, ' ', adrvoie);
            ELSE
                NEW.adresse_complete = CONCAT(NEW.numero, ' ', adrvoie);
            END IF;
            RETURN NEW;
        ELSE
            RETURN NULL;
        END IF;
    ELSE
        RETURN NULL;
    END IF;
END;
$$;


-- update_adr_complete()
CREATE FUNCTION adresse.update_adr_complete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
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
        IF NEW.numero != OLD.numero OR NEW.suffixe != OLD.suffixe THEN
            SELECT nom_complet into adrvoie FROM adresse.voie WHERE id_voie = OLD.id_voie;
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


-- update_commune()
CREATE FUNCTION adresse.update_commune() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    leid integer;
BEGIN
    IF (TG_TABLE_NAME = 'voie') THEN
        INSERT INTO adresse.appartenir_com(id_voie, id_com) SELECT NEW.id_voie, c.id_com from adresse.commune c where ST_intersect(NEW.geom, c.geom);
        RETURN NEW;
    ELSIF (TG_TABLE_NAME = 'point_adresse') THEN
        SELECT c.id_com into leid FROM adresse.commune c WHERE st_intersects(New.geom,c.geom);
        NEW.id_commune = leid;
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$;


-- update_full_name()
CREATE FUNCTION adresse.update_full_name() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.typologie != OLD.typologie OR NEW.nom != OLD.nom THEN
        NEW.nom_complet:= CONCAT(NEW.typologie, ' ', NEW.nom);
    END IF;

    RETURN NEW;
END;
$$;


-- voie_nom_complet()
CREATE FUNCTION adresse.voie_nom_complet() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN
    NEW.nom_complet = Concat(NEW.typologie, ' ', NEW.nom);

    RETURN NEW;
END;
$$;


--
-- PostgreSQL database dump complete
--

