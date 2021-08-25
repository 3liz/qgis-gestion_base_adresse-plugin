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

-- c_erreur_cote_parite(integer, text)
CREATE FUNCTION adresse.c_erreur_cote_parite(numero integer, cote_voie text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE erreur_cote_parite text;

BEGIN
/* identifie si le côté duquel se trouve le point adresse correspond à la parité de son numéro
*/
SELECT case 
WHEN cote_voie = 'gauche' AND numero % 2=0 then 'true'
WHEN cote_voie = 'droite' AND numero % 2!=0 then 'true'
WHEN cote_voie = 'droite' AND numero % 2=0 then 'false'
WHEN cote_voie = 'gauche' AND numero % 2!=0 then 'false'
WHEN cote_voie = 'indefini' then 'indefini'
ELSE 'probleme' 
end into erreur_cote_parite;

RETURN  erreur_cote_parite; -- Retourne True si le point adresse est du mauvais coté de la voie. Sinon false ou indefini. Si problème, cela signifie une erreur de tracé sur la voie
END;
$$;


-- c_erreur_parite()
CREATE FUNCTION adresse.c_erreur_parite() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
point_proj geometry ;
segment_prolong geometry ;
cote_voie text ;
erreur_parite text;

BEGIN 
/* La requête identifie ainsi si le côté duquel se trouve le point adresse correspond à la parité de son numéro. 
*/
SELECT adresse.point_proj(NEW.geom, NEW.id_voie) into point_proj;

SELECT adresse.segment_prolong(NEW.geom, point_proj) into segment_prolong;

SELECT adresse.f_cote_voie(NEW.id_voie, segment_prolong) into cote_voie ;

SELECT adresse.c_erreur_cote_parite(NEW.numero, cote_voie) into erreur_parite ;


NEW.c_erreur_cote_parite = erreur_parite ; -- Si le point adresse est pair, mais à gauche de la voie ou si le point adresse est impair mais à droite de la voie, la fonction retourne TRUE, sinon FALSE.

    RETURN NEW; 

END;
$$;


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


-- f_bilan_pt_com()
CREATE FUNCTION adresse.f_bilan_pt_com() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
id_c integer;
BEGIN 

IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN

Select NEW.id_commune into id_c ;

/* Cette requête ci-dessous retourne le nombre de point hors parcelle/commune

Elle fait le lien avec id_commune et les points adresses dont la référence parcelle est nulle 
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET pt_hors_parcelle = coalesce((select count(p.id_commune) from adresse.point_adresse p WHERE id_c = p.id_commune 
and p.id_parcelle is null group by p.id_commune), 0) where commune.id_com = id_c ; 




/* Cette requêteretourne le nombre de point hors parcelle validés/commune

Elle fait le lien entre id_commune de la table commune et id_com des points adresses dont la référence parcelle est nulle et qui sont classés comme validés
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET pt_hors_parcelle_valid =  coalesce(( select count(p.id_commune) from adresse.point_adresse p WHERE id_c = p.id_commune 
and p.id_parcelle is null and p.valide = true group by p.id_commune), 0) where commune.id_com = id_c ;


/* Cette requête retourne le nombre de point validés/commune

Elle fait le lien entre id_commune de la table commune et id_com des points classés comme validés
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat

*/
update adresse.commune SET nb_pt_valide =  coalesce((SELECT count(p.valide) from adresse.point_adresse p WHERE id_c = p.id_commune
and p.valide = true group by p.id_commune), 0) where commune.id_com = id_c ;


/* Cette requête retourne le nombre de point en erreur/commune

Elle fait le lien entre id_commune de la table commune et id_com des points classés comme en erreur
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET nb_pt_erreur =  coalesce((SELECT count(p.erreur) from adresse.point_adresse p WHERE id_c= p.id_commune
and p.erreur = true group by p.id_commune), 0) where commune.id_com = id_c ;



/* Cette requête retourne le nombre de point à vérifier sur terrain/commune

Elle fait le lien entre id_commune de la table commune et id_com des points classés comme à vérifier sur terrain
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET nb_a_verif  =  coalesce((SELECT count(p.verif_terrain) from adresse.point_adresse p WHERE id_c = p.id_commune
and p.verif_terrain = true group by p.id_commune), 0) where commune.id_com = id_c ;



/* Cette requête retourne le nombre de point non validés/commune

Elle fait le lien entre id_commune de la table commune et id_com des points non classés comme validés
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET nb_pt_no_valid  =  coalesce((SELECT count(p.valide) from adresse.point_adresse p WHERE id_c = p.id_commune
and p.valide = false group by p.id_commune), 0) where commune.id_com = id_c ;



/* Cette requête retourne le nombre de point total/commune

Elle fait le lien entre id_commune de la table commune et id_com des points 
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET pt_total  =  coalesce((SELECT count(p.id_commune) from adresse.point_adresse p WHERE id_c = p.id_commune
group by p.id_commune), 0) where commune.id_com = id_c ;




/* Cette requête retourne le pourcentage de point réellement validés (ni hors parcelle validés, ni en erreur, ni à vérifier, ni à valider) /commune

Elle fait le calcul de pourcentage suivant : 100 * (points total-(points hors parcelle validé + points à vérifier + points non valides + points en erreur))/points total
On passe les valleurs du total des points à NULL si ils ont égal à 0 pour éviter une division par 0 qui provoquerait une erreur 
*/
update adresse.commune SET pct_pt_reel_valid  = 100*("pt_total"-("pt_hors_parcelle_valid"+"nb_a_verif"+
"nb_pt_no_valid"+"nb_pt_erreur"))/NULLIF("pt_total", 0) where commune.id_com = id_c ;




END IF;
RETURN    NEW ; 
END;$$;


-- f_bilan_pt_parcelle()
CREATE FUNCTION adresse.f_bilan_pt_parcelle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
id_p integer;
BEGIN 

IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN

Select NEW.id_parcelle into id_p;

/* Cette requête compte d’abords le nombre d’id point adresse par parcelle 
*/
update adresse.parcelle SET nb_pt_adresse =  coalesce((select count(p.id_parcelle) from adresse.point_adresse p 
WHERE id_p = p.id_parcelle 
group by parcelle.fid) , 0) where parcelle.fid = id_p ; 

/* Cette requête ajoute la date de modification associée nulle ou la plus récente.
*/
update adresse.parcelle SET date_pt_modif = pt.date from (SELECT parcelle.fid, p.date_modif as date
FROM adresse.parcelle 
LEFT JOIN adresse.point_adresse p ON parcelle.fid = p.id_parcelle
WHERE id_p = parcelle.fid and p.date_modif IS NULL
    OR p.date_modif = (
        SELECT MAX(point_adresse.date_modif)
        FROM adresse.point_adresse
        WHERE id_p = point_adresse.id_parcelle)
group by parcelle.fid, p.date_modif) pt where pt.fid = parcelle.fid; 

END IF;
RETURN    NEW ; 
END;$$;


-- f_bilan_voie_com()
CREATE FUNCTION adresse.f_bilan_voie_com() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
commune_geom geometry;
idc integer;
BEGIN 
IF TG_OP = 'INSERT' or TG_OP = 'UPDATE' THEN

Select commune.geom into commune_geom from adresse.commune where st_intersects(commune.geom, NEW.geom);

Select commune.id_com into idc from adresse.commune where st_intersects(commune.geom, NEW.geom);



/* Cette requête ci-dessous retourne le nombre de voies non validées/commune

Elle fait le lien avec le geom commune et et le geom voie dont le statut_voie est mentionné comme false 
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET voie_non_valid = coalesce((SELECT count (v.id_voie) 
from  adresse.voie v where st_intersects(commune_geom, v.geom) and v.statut_voie = false group by commune.id_com), 0) where commune.id_com = idc; 

/* Cette requête ci-dessous retourne le nombre de voies validées/commune

Elle fait le lien avec le geom commune et et le geom voie dont le statut_voie est mentionné comme true 
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET voie_valid = coalesce((SELECT count (v.id_voie) 
from  adresse.voie v where st_intersects(commune_geom, v.geom) and v.statut_voie = true group by commune.id_com), 0) where commune.id_com = idc; 

/* Cette requête ci-dessous retourne le nombre de voies validées/commune

Elle fait le lien avec le geom commune et et le geom voie dont le statut_voie est mentionné comme true 
On "coalesce" à 0 les comptes de points pour ne pas avoir de valeurs nulles qui fausseraient le résultat
*/
update adresse.commune SET voie_total = coalesce((SELECT count (v.id_voie) 
from  adresse.voie v where st_intersects(commune_geom, v.geom) group by commune.id_com), 0) where commune.id_com = idc; 

/* Cette requête retourne le pourcentage de voies validés /commune

Elle fait le calcul de pourcentage suivant : 100 * voie_valid/voie_ total
On passe les valleurs du total des points à NULL si ils ont égal à 0 pour éviter une division par 0 qui provoquerait une erreur 
*/
update adresse.commune SET pct_voie_valid  = 100*"voie_valid"/NULLIF("voie_total", 0) where commune.id_com = idc;




END IF;
RETURN    NEW ; 
END;$$;


-- f_commune_repet_nom_voie()
CREATE FUNCTION adresse.f_commune_repet_nom_voie() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
repet integer ;
BEGIN 

/* Cette requête retourne 
*/
SELECT count(g.nom) into repet ----------- Séléctionne le nombre de répétition des noms de voies depuis..... 
          FROM (select c.id_com, c.geom, v.nom--------------------------------------------------------------------------------------------------------------------
from adresse.voie v
inner join adresse.commune c on st_intersects(c.geom, v.geom)---------------------- la séléction de l'ensemble des id_com, geom communes et noms de voie regroupés
group by c.id_com, c.geom, v.nom) g----------------------------------------------------------------------------------------------------------------------------------
         WHERE levenshtein(g.nom, NEW.nom) <= 1 ---- fonction comparant les noms proches à 1 caractère près
           AND g.id_com IS NOT DISTINCT FROM ------------------------------------------------------ Contrainte pour n'avoir que les répétion dont l'id commune est lié à l'id commune du nouveau nom de voie saisi
		   (select g.id_com where st_intersects(g.geom,NEW.geom) and g.nom = NEW.nom) ;


    IF repet = 0 THEN
        NEW.c_repet_nom_voie = FALSE; -- retrourne faux si pas de repetition de nom
    ELSE
        NEW.c_repet_nom_voie = TRUE; -- retrourne vrai si repetition de nom
    END IF;
    RETURN NEW; 
END;
$$;


-- f_controle_longueur_nom()
CREATE FUNCTION adresse.f_controle_longueur_nom() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

/* Cette requête retourne 
*/
       		IF char_length(NEW.nom) < 24
        THEN NEW.c_long_nom = FALSE ; -- retrourne faux si le nom fait moins de 24 caractères
        ELSE
             NEW.c_long_nom = TRUE ; -- retrourne vrai si le nom est trop long
        END IF;
        RETURN NEW; 
        END;
$$;


-- f_cote_voie(integer, public.geometry)
CREATE FUNCTION adresse.f_cote_voie(idv integer, geom_segment public.geometry) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE 
cote_voie TEXT;
BEGIN

/* Cette requête identifie si le segment prolongé crée à partir du point projeté sur la voie de rattachement du point adresse, 
croise la ligne à gauche, à droite, ne croise pas ou croise plusieurs fois.
*/
SELECT case 
WHEN ST_LineCrossingDirection(geom_segment, v.geom) = -1 then 'gauche'
WHEN ST_LineCrossingDirection(geom_segment, v.geom ) = 1 then 'droite'
WHEN ST_LineCrossingDirection(geom_segment, v.geom ) = 0 then 'indefini'
ELSE 'probleme' 
end into cote_voie
from adresse.voie v
WHERE idv = v.id_voie;

RETURN  cote_voie; -- Retourne le text définissant le coté de la voie duquel se trouve le point
END;
$$;


-- f_point_voie_distant()
CREATE FUNCTION adresse.f_point_voie_distant() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
voie_rat  integer ;
dist_ratach      integer;

BEGIN 

/* Cette requête retourne l'id_voie le plus proche du nouveau point adresse crée
*/
select g.voie into voie_rat from (select v.id_voie as voie , ST_Distance(NEW.geom, v.geom) as dist
from adresse.voie v
where ST_DWithin(v.geom, NEW.geom, 10000) 
ORDER BY dist LIMIT 1) g ;

/* Cette requête calcul la distance entre le point et sa voie de ratachement
*/
select ST_Distance(NEW.geom, v.geom) into dist_ratach
from adresse.voie v
where v.id_voie = NEW.id_voie;

/* si erreur True, sinon false
*/
    IF voie_rat = NEW.id_voie THEN
        NEW.c_erreur_dist_voie = FALSE; -- Faux, si le point adresse est proche de sa voie de ratachement
    ELSE
        NEW.c_erreur_dist_voie = TRUE; -- Sinon vrai
    END IF;

        NEW.c_dist_voie = dist_ratach;

    RETURN NEW; 
	END;


$$;


-- f_voie_double_saisie()
CREATE FUNCTION adresse.f_voie_double_saisie() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
repet integer;
BEGIN 
/* Cette requête retourne  les voies à moins de 500 mètre de la nouvelle voie crée et dont le nom est proche de celui ci
*/
select v.id_voie into repet
from adresse.voie v
where st_distance(NEW.geom, v.geom) < '500'
AND levenshtein(CONCAT(NEW.typologie, ' ', NEW.nom), CONCAT(v.typologie, ' ', v.nom)) <= 1;

IF repet is not null 
THEN NEW.c_saisie_double = TRUE; -- retrourne vrai si la voie est saisie deux fois
ELSE
NEW.c_saisie_double = FALSE; -- retrourne faux si la voie n'est pas saisie deux fois


END IF;
    RETURN NEW; 

 END;
$$;


-- f_voie_erreur_trace()
CREATE FUNCTION adresse.f_voie_erreur_trace() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
geom_rotate geometry ;
geom_exist geometry;
BEGIN 
/* Cette requête retourne les segments au niveau de leur centroides raccourcies de 2/3
*/
Select adresse.line_rotation(g.geom_segment) into geom_rotate from
/* Cette requête extrait des segments à partir de polylignes _ pas possible d'utiliser la fonction dans ce cas
*/
(SELECT * from (SELECT ROW_NUMBER() OVER() as id, dumps.id_voie, ST_MakeLine(lag((pt).geom, 1, NULL) OVER (PARTITION BY dumps.id_voie ORDER BY dumps.id_voie, (pt).path), (pt).geom) AS geom_segment
  FROM (SELECT NEW.id_voie as id_voie, NEW.geom as geom, ST_DumpPoints(NEW.geom) AS pt ) dumps)s WHERE s.geom_segment IS NOT NULL)g;


/* Cette requête identifie si la voie croise plusieurs fois les segments retournés
*/
Select geom_rotate into geom_exist
WHERE ST_LineCrossingDirection(New.geom, geom_rotate) = '-2' or  ST_LineCrossingDirection(New.geom, geom_rotate) = '2'
or ST_LineCrossingDirection(New.geom, geom_rotate) = '3' or ST_LineCrossingDirection(New.geom, geom_rotate) = '-3';

IF geom_exist is not null THEN
NEW.c_erreur_trace = TRUE ; -- retourne vrai si il y a erreur de tracé
ELSE
NEW.c_erreur_trace = FALSE; -- si pas d'erreur retourne faux

END IF;
RETURN    NEW ; 
END;$$;


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
    NEW.id_parcelle = (SELECT p.fid FROM adresse.parcelle p WHERE ST_intersects(NEW.geom, p.geom));
    RETURN NEW;
END;
$$;


-- lieux_dits()
CREATE FUNCTION adresse.lieux_dits() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    SELECT c.id_com into NEW.id_com
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

    SELECT c.commune_nom into NEW.commune_nom 
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

	SELECT d.id_com_del into NEW.id_com_del
    FROM adresse.commune_deleguee d
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

    SELECT  d.commune_deleguee_nom into NEW.commune_deleguee_nom
    FROM adresse.commune_deleguee d
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

	NEW.numero = 99999 ;
	NEW.date_der_maj = NOW();
RETURN NEW;
END;
$$;


-- line_rotation(public.geometry)
CREATE FUNCTION adresse.line_rotation(lgeom public.geometry) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE 
geom_rotate GEOMETRY; 
BEGIN
/* Cette requête effectue une rotation à 80,1 degrès d’1/3 du segment au niveau de son centroide
*/
SELECT ST_CollectionExtract(st_rotate(ST_LineSubstring(lgeom, 0.333 ::real, 0.666::real), 80.1, st_centroid(lgeom)), 2) into geom_rotate; 

RETURN geom_rotate; -- retourne la géométrie du segment retourné
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


-- point_proj(public.geometry, integer)
CREATE FUNCTION adresse.point_proj(pgeom public.geometry, idv integer) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE 
locate_point DOUBLE PRECISION;
geom_pt_proj GEOMETRY;
BEGIN
/* Cette requête créer un point à partir de la localisation du point le proche du point adresse d’entré, sur la ligne possédant le même id_voie que ce point d’entré
*/

SELECT st_linelocatepoint(voie.geom, pgeom) into locate_point
   FROM adresse.voie
  WHERE  voie.id_voie = idv;

IF locate_point >1 OR locate_point <0

THEN

SELECT ST_ClosestPoint(voie.geom, pgeom) into geom_pt_proj
FROM adresse.voie
WHERE voie.id_voie = idv;

ELSE

SELECT ST_LineInterpolatePoint(voie.geom, locate_point) into geom_pt_proj
FROM adresse.voie
WHERE voie.id_voie = idv;

END IF ;

RETURN geom_pt_proj; -- Retourne la géométrie du point projeté sur la voie
END;
$$;


-- segment_extract(character varying, character varying, character varying)
CREATE FUNCTION adresse.segment_extract(table_name character varying, id_line character varying, geom_line character varying) RETURNS TABLE(id bigint, id_voie integer, geom_segment public.geometry)
    LANGUAGE plpgsql
    AS $$
BEGIN

/* Cette requête sélectionne les nœuds des voies. Puis trace des lignes entre les différents nœuds crées en leur attibuant des identifiants uniques et en conservant les id_voies de la voie d'origine.
*/
Return query execute
'SELECT * from (SELECT ROW_NUMBER() OVER() as id, dumps.id_voie, ST_MakeLine(lag((pt).geom, 1, NULL) OVER (PARTITION BY dumps.id_voie ORDER BY dumps.id_voie, (pt).path), (pt).geom) AS geom_segment
  FROM (SELECT '||id_line||' as id_voie, '||geom_line||' as geom, ST_DumpPoints('||geom_line||') AS pt from '||table_name||') dumps)s WHERE s.geom_segment IS NOT NULL';

END;
$$;


-- segment_prolong(public.geometry, public.geometry)
CREATE FUNCTION adresse.segment_prolong(ptgeom public.geometry, ptgeom_proj public.geometry) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE 
geom_segment_prolong GEOMETRY;
BEGIN
/* Cette requête dessine un segment du point adresse à un point projeté au 50/49e de la distance entre le point adresse et son point projeté.
*/
SELECT 
ST_MakeLine(ptgeom,  
ST_TRANSLATE(ptgeom, sin(ST_AZIMUTH(ptgeom,ptgeom_proj)) * (ST_DISTANCE(ptgeom,ptgeom_proj)
+ (ST_DISTANCE(ptgeom,ptgeom_proj) * (50/49))), cos(ST_AZIMUTH(ptgeom,ptgeom_proj)) * (ST_DISTANCE(ptgeom,ptgeom_proj)
+ (ST_DISTANCE(ptgeom,ptgeom_proj) * (50/49))))) into geom_segment_prolong ;

RETURN geom_segment_prolong; -- Retourne la géométrie du segement prolongé
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
