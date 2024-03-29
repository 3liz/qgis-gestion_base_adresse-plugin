BEGIN;
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- add_referencer_com()
CREATE FUNCTION adresse.add_referencer_com() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

DROP INDEX IF EXISTS adresse.idx_tmp_centroide_communes;
CREATE INDEX idx_tmp_centroide_communes ON adresse.commune_deleguee (ST_PointOnSurface(geom));

INSERT INTO adresse.referencer_com
SELECT
	c.id_com AS id_com,
	cd.id_com_del AS id_com_del,
	'Ajout automatique en fonction des tables commune_deleguee et commune' AS action,
	NOW() AS date
FROM adresse.commune_deleguee cd
JOIN adresse.commune AS c
	ON St_Contains(c.geom, ST_PointOnSurface(cd.geom))
ON CONFLICT ON CONSTRAINT referencer_com_pkey DO NOTHING
;

DROP INDEX IF EXISTS adresse.idx_tmp_centroide_communes;
END;
$$;


-- FUNCTION add_referencer_com()
COMMENT ON FUNCTION adresse.add_referencer_com() IS 'Permet la réinitialisation de la table adresse.referencer_com en faisant une intersection entre adresse.commune_deleguee et adresse.commune';


-- calcul_num_adr(public.geometry)
CREATE FUNCTION adresse.calcul_num_adr(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text, voie integer)
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

    -- Aucune voie dévérouillée trouvée
    IF idvoie IS NULL THEN
        return query SELECT numc, s, idvoie;
    END IF;

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

    return query SELECT numc, s, idvoie;
END;
$$;


-- calcul_num_metrique(public.geometry)
CREATE FUNCTION adresse.calcul_num_metrique(pgeom public.geometry) RETURNS TABLE(num integer, suffixe text, voie integer)
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

    -- Aucune voie dévérouillée trouvée
    IF idvoie IS NULL THEN
        return query SELECT numc, res, idvoie;
    END IF;

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

   RETURN query SELECT numc, res, idvoie;
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


-- check_impair(integer)
CREATE FUNCTION adresse.check_impair(nombre integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
/* Cette fonction retourne true (vrai) si le nombre passé en argument est impair 
 
   Exemple :  SELECT checkimpair(12);
              false
*/
BEGIN
 return nombre % 2!=0;
END;
$$;


-- creation_adresse()
CREATE FUNCTION adresse.creation_adresse() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.creation_adresse = 'true';
RETURN NEW;
END;
$$;


-- edit_com_lieux_dits()
CREATE FUNCTION adresse.edit_com_lieux_dits() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    SELECT c.id_com into NEW.id_com
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, c.geom, 0.01);

	NEW.numero = 99999 ;
	NEW.date_der_maj = NOW();
RETURN NEW;
END;
$$;


-- edit_lieux_dits()
CREATE FUNCTION adresse.edit_lieux_dits() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
 IF (TG_OP = 'INSERT') THEN
    INSERT INTO adresse.lieux_dits(
        geom,
        nom_ld,
        numero,
        integration_ban,
        id_com,
        date_der_maj
    ) VALUES(
        NEW.geom,
        NEW.nom_ld,
        NEW.numero,
        NEW.integration_ban,
        NEW.id_com,
        NEW.date_der_maj
    );
 ELSEIF (TG_OP = 'UPDATE') THEN
    UPDATE adresse.lieux_dits SET 
        geom=NEW.geom,
        nom_ld=NEW.nom_ld,
        numero=NEW.numero,
        integration_ban=NEW.integration_ban,
        id_com=NEW.id_com,
        date_der_maj=NEW.date_der_maj
    WHERE id_ld = OLD.id_ld;
 ELSEIF (TG_OP = 'DELETE') THEN
    DELETE FROM adresse.lieux_dits WHERE id_ld = OLD.id_ld;
 END IF;
RETURN NEW;
END;
$$;


-- edit_point_adresse()
CREATE FUNCTION adresse.edit_point_adresse() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
 IF (TG_OP = 'INSERT') THEN
    INSERT INTO adresse.point_adresse(
        numero,
        suffixe,
        id_voie,
        adresse_complete,
        type_pos,
        achat_plaque_numero,
        valide,
        verif_terrain,
        createur,
        date_creation,
        modificateur,
        date_modif,
        erreur,
        commentaire,
        geom
    ) VALUES(
        NEW.numero,
        NEW.suffixe,
        NEW.id_voie,
        NEW.adresse_complete,
        NEW.type_pos,
        NEW.achat_plaque_numero,
        NEW.valide,
        NEW.verif_terrain,
        NEW.createur,
        NEW.date_creation,
        NEW.modificateur,
        NEW.date_modif,
        NEW.erreur,
        NEW.commentaire,
        NEW.geom
    );
 ELSEIF (TG_OP = 'UPDATE') THEN
    UPDATE adresse.point_adresse SET 
        numero=NEW.numero,
        suffixe=NEW.suffixe,
        id_voie=NEW.id_voie,
        adresse_complete=NEW.adresse_complete,
        type_pos=NEW.type_pos,
        achat_plaque_numero=NEW.achat_plaque_numero,
        valide=NEW.valide,
        verif_terrain=NEW.verif_terrain,
        createur=NEW.createur,
        date_creation=NEW.date_creation,
        modificateur=NEW.modificateur,
        date_modif=NEW.date_modif,
        erreur=NEW.erreur,
        commentaire=NEW.commentaire,
        geom=NEW.geom
    WHERE id_point = OLD.id_point;
 ELSEIF (TG_OP = 'DELETE') THEN
    DELETE FROM adresse.point_adresse WHERE id_point = OLD.id_point;
 END IF;
RETURN NEW;
END;
$$;


-- get_code_postal()
CREATE FUNCTION adresse.get_code_postal() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    SELECT a.cp into NEW.code_postal FROM adresse.codes_postaux a WHERE ST_intersects(NEW.geom, a.geom);
    RETURN NEW;
END;
$$;


-- get_commune()
CREATE FUNCTION adresse.get_commune() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    leid integer;
BEGIN
    SELECT c.id_com into leid FROM adresse.commune c WHERE st_intersects(New.geom,c.geom);
    NEW.id_commune = leid;
    RETURN NEW;
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
        FROM adresse.voie  v, adresse.commune com
        WHERE v.statut_voie_num IS FALSE
          AND ST_Intersects(pgeom, com.geom)
          AND ST_DWithin(v.geom, com.geom, 2000)
        ORDER BY dist LIMIT 1
    ) AS d;

    RETURN idvoie;
END;
$$;


-- get_parcelle()
CREATE FUNCTION adresse.get_parcelle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.id_parcelle = (SELECT p.fid FROM adresse.parcelle p WHERE ST_intersects(NEW.geom, p.geom) LIMIT 1);
    RETURN NEW;
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


-- num_exists(integer, text, integer)
CREATE FUNCTION adresse.num_exists(num integer, suff text, idvoie integer) RETURNS boolean
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
CREATE FUNCTION adresse.trigger_point_adr() RETURNS trigger
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
        -- Sinon on modifie valide et on enregistre
        NEW.valide = False;
        RETURN NEW;
    END IF;
END;
$$;


-- update_adr_complete()
CREATE FUNCTION adresse.update_adr_complete() RETURNS trigger
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
            OR (NEW.valide IS DISTINCT FROM OLD.valide AND NEW.valide) THEN

            -- Cas où id_voie est null, calculer un nouvel id_voie
            IF NEW.id_voie IS DISTINCT FROM OLD.id_voie
                OR (NEW.id_voie IS NULL AND NEW.valide)
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


-- update_appartenir_com()
CREATE FUNCTION adresse.update_appartenir_com() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    leid integer;
BEGIN
    INSERT INTO adresse.appartenir_com(id_voie, id_com) SELECT NEW.id_voie, c.id_com from adresse.commune c where ST_intersects(NEW.geom, c.geom);
    RETURN NEW;
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


-- voie_nom_complet_maj()
CREATE FUNCTION adresse.voie_nom_complet_maj() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.nom_complet_maj = Translate(Upper(Concat(NEW.typologie, ' ', NEW.nom)), 'ÀÉÈÊËÏÎÔÖÜÛÇ'::text, 'AEEEEIIOOUUC'::text);
    RETURN NEW;
END;
$$;


--
-- PostgreSQL database dump complete
--


COMMIT;
