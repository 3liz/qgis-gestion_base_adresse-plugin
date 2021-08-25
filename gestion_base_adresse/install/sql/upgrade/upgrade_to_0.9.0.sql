BEGIN;

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;
--
-- Début FONCTIONS
--


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 1 : Détection des erreurs sur les points adresses
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- C1 T1: Identifier les points adresse plus près d’une autre voie que celle à laquelle il appartient et retourne la distance entre le point et sa voie de ratachement

CREATE OR REPLACE FUNCTION adresse.f_point_voie_distant()
  RETURNS "trigger" AS
$fct$
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


$fct$ LANGUAGE plpgsql;


--------------------------------------------------------------------------------------
--- C1 T2: Identifier les	points adresse pair ou impair du mauvais coté de la voie
------------------------------------------------------------------------------------------


--  Fonction qui projete le point sur sa voix de rattachement (elle retourne une valeur correspondant au geom du point projeté) -------------

CREATE FUNCTION  adresse.point_proj(pgeom geometry, idv integer)
RETURNS GEOMETRY
AS $BODY$
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
$BODY$ LANGUAGE 'plpgsql';



--- FONCTION qui dessine un sgement du point adresse à un point projeté au 50/49e de la distance entre le point adresse et son point projeté 

CREATE FUNCTION  adresse.segment_prolong(ptgeom geometry, ptgeom_proj geometry)
RETURNS GEOMETRY
AS $BODY$
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
$BODY$ LANGUAGE 'plpgsql';





--- Fonction qui trouve les points à droites et à gauche

CREATE FUNCTION  adresse.f_cote_voie(idv integer, geom_segment geometry)
RETURNS TEXT
AS $BODY$
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
$BODY$ LANGUAGE 'plpgsql';



--- Fonction qui identifie les	points adresse pair ou impair du mauvais coté de la voie
     

CREATE FUNCTION  adresse.c_erreur_cote_parite(numero integer, cote_voie text)
RETURNS TEXT
AS $BODY$
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
$BODY$ LANGUAGE 'plpgsql';



 
--- FONCTION TRIGGER qui identifie les	points adresse pair ou impair du mauvais coté de la voie dès qu'un point est crée ou modifié

CREATE OR REPLACE FUNCTION adresse.c_erreur_parite()
  RETURNS "trigger" AS
$fct$
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
$fct$ LANGUAGE plpgsql;



------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 2 : Détecter les erreurs de tracé de voies _ A complèter avec la vue v_c2_line_cross pour identifier les portions problèmatiques
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--  EXTRAIRE LES SEGMENTS DE POLYLIGNE
CREATE FUNCTION  adresse.segment_extract(table_name varchar, id_line varchar, geom_line varchar)
RETURNS TABLE ( id bigint,  id_voie integer, geom_segment geometry ) -- retourne une table avec les id segment, leur id_voie et leurs géométries
AS $BODY$
BEGIN

/* Cette requête sélectionne les nœuds des voies. Puis trace des lignes entre les différents nœuds crées en leur attibuant des identifiants uniques et en conservant les id_voies de la voie d'origine.
*/
Return query execute
'SELECT * from (SELECT ROW_NUMBER() OVER() as id, dumps.id_voie, ST_MakeLine(lag((pt).geom, 1, NULL) OVER (PARTITION BY dumps.id_voie ORDER BY dumps.id_voie, (pt).path), (pt).geom) AS geom_segment
  FROM (SELECT '||id_line||' as id_voie, '||geom_line||' as geom, ST_DumpPoints('||geom_line||') AS pt from '||table_name||') dumps)s WHERE s.geom_segment IS NOT NULL';

END;
$BODY$ LANGUAGE 'plpgsql';





--  CREER CENTROID  1/3 DES SEGMENTS, ROTATIONS 

CREATE FUNCTION  adresse.line_rotation(lgeom geometry)
RETURNS GEOMETRY
AS $BODY$
DECLARE 
geom_rotate GEOMETRY; 
BEGIN
/* Cette requête effectue une rotation à 80,1 degrès d’1/3 du segment au niveau de son centroide
*/
SELECT ST_CollectionExtract(st_rotate(ST_LineSubstring(lgeom, 0.333 ::real, 0.666::real), 80.1, st_centroid(lgeom)), 2) into geom_rotate; 

RETURN geom_rotate; -- retourne la géométrie du segment retourné
END;
$BODY$ LANGUAGE 'plpgsql';



--  Identifier les voies avec erreur de tracé: qui croisent plusieurs fois un segment retourné

CREATE OR REPLACE FUNCTION adresse.f_voie_erreur_trace()
  RETURNS "trigger" AS
$fct$
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
END;$fct$
  LANGUAGE plpgsql;








------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 3 : AFFICHER pour chaque parcelle LE NOMBRE DE POINTS ADRESSES, LA DERNIERE DATE DE MODIFICATION 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION adresse.f_bilan_pt_parcelle()
  RETURNS "trigger" AS
$fct$
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
END;$fct$
  LANGUAGE plpgsql;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 4 : BILAN POINTS ADRESSE COMMUNES 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Drop trigger if exists bilan_pt_com on adresse.point_adresse ;
DROP FUNCTION if exists adresse.f_bilan_pt_com();
CREATE OR REPLACE FUNCTION adresse.f_bilan_pt_com()
  RETURNS "trigger" AS
$fct$
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
END;$fct$
  LANGUAGE plpgsql;

  


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 5 : problèmes répétitions voies
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--C5.T1 Identifier les voies portant le même nom qu'une autre voie de la même commune


CREATE OR REPLACE FUNCTION adresse.f_commune_repet_nom_voie()
  RETURNS "trigger" AS
$fct$
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
$fct$ LANGUAGE plpgsql;




-- C5.T2: Identifier les voies avec un nom trop long


CREATE OR REPLACE FUNCTION adresse.f_controle_longueur_nom() 
RETURNS "trigger" AS
$fct$
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
$fct$ LANGUAGE plpgsql;




-- C5.T3: IDENTIFIER LES VOIES SAISIES EN 2 FOIS :



CREATE OR REPLACE FUNCTION adresse.f_voie_double_saisie()
  RETURNS "trigger" AS
$fct$
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
$fct$ LANGUAGE plpgsql;






------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Contrôle 6 : BILAN VOIES PAR COMMUNES  ----- Faire tourner en PGCRON
------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION adresse.f_bilan_voie_com()
  RETURNS "trigger" AS
$fct$
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
END;$fct$
  LANGUAGE plpgsql;

--
-- Fin FONCTION
--

--
-- Début TABLE_sequence
--


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE adresse.point_adresse
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- point_adresse.c_erreur_voie


ALTER TABLE adresse.point_adresse
ADD COLUMN c_erreur_dist_voie BOOLEAN  ;


--- point_adresse.c_dist_voie

ALTER TABLE adresse.point_adresse
ADD COLUMN c_dist_voie  integer ;


-- point_adresse.geom_pt_proj


ALTER TABLE adresse.point_adresse
ADD COLUMN geom_pt_proj GEOMETRY  ;




-- point_adresse.geom_segment_prolong

ALTER TABLE adresse.point_adresse
ADD COLUMN geom_segment_prolong GEOMETRY  ;




-- point_adresse.cote_voie

ALTER TABLE adresse.point_adresse
ADD COLUMN cote_voie TEXT ;


-- point_adresse.c_erreur_cote_parite

ALTER TABLE adresse.point_adresse
ADD COLUMN c_erreur_cote_parite TEXT ;







------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  TABLE adresse.voie
------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--- voie.c_erreur_trace

ALTER TABLE adresse.voie
ADD COLUMN c_erreur_trace  BOOLEAN  ;



---voie.c_repet_nom_voie

ALTER TABLE adresse.voie
ADD COLUMN c_repet_nom_voie BOOLEAN  ;



---voie.c_long_nom

  ALTER TABLE adresse.voie
ADD COLUMN  c_long_nom  BOOLEAN; 



---voie.c_repet_num

ALTER TABLE adresse.voie
ADD COLUMN c_repet_num BOOLEAN  ;


---voie.c_saisie_double

ALTER TABLE adresse.voie
ADD COLUMN c_saisie_double BOOLEAN ; 




-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE adresse.parcelle
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- parcelle.nb_pt_adresse 

ALTER TABLE adresse.parcelle
ADD COLUMN nb_pt_adresse  INTEGER  ;


--- parcelle.date_pt_modif 


ALTER TABLE adresse.parcelle
ADD COLUMN date_pt_modif  DATE  ; 




------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TABLE adresse.commune
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- commune.pt_hors_parcelle 

ALTER TABLE adresse.commune
ADD COLUMN pt_hors_parcelle  INTEGER  ;

--- commune.pt_hors_parcelle_valid
ALTER TABLE adresse.commune
ADD COLUMN pt_hors_parcelle_valid INTEGER  ;

--- commune.nb_pt_valide 
ALTER TABLE adresse.commune
ADD COLUMN nb_pt_valide      INTEGER  ; 

--- commune.nb_pt_erreur 
ALTER TABLE adresse.commune
ADD COLUMN nb_pt_erreur      INTEGER  ;

--- commune.nb_a_verif
ALTER TABLE adresse.commune
ADD COLUMN nb_a_verif        INTEGER  ;

--- commune.nb_pt_no_valid
ALTER TABLE adresse.commune
ADD COLUMN nb_pt_no_valid    INTEGER  ;

--- commune.pt_total 
ALTER TABLE adresse.commune
ADD COLUMN pt_total          INTEGER  ;

--- commune.pct_pt_reel_valid 
ALTER TABLE adresse.commune
ADD COLUMN pct_pt_reel_valid INTEGER  ;

---commune.voie_non_valid

ALTER TABLE adresse.commune
ADD COLUMN voie_non_valid INTEGER ;

---commune.voie_valid
ALTER TABLE adresse.commune
ADD COLUMN voie_valid INTEGER  ;

---commune.pct_voie_valid
ALTER TABLE adresse.commune
ADD COLUMN pct_voie_valid      INTEGER ;

---commune.voie_total 
ALTER TABLE adresse.commune
ADD COLUMN voie_total INTEGER ;

--
-- Fin TABLE_SEQUENCE
--

--
-- Début VIEW
--

-- VUE Contrôle : Détecter les erreurs de tracé de voies ----- Faire tourner en PGCRON

drop materialized view if exists adresse.v_controle_voie;
create materialized view adresse.v_controle_voie as
Select r.id, r.id_voie, r.geom_segment, r.geom_rotate, r.erreur_voie
from
(select id, segment_extract.id_voie, geom_segment, adresse.line_rotation(geom_segment) as geom_rotate,
ST_LineCrossingDirection(adresse.line_rotation(geom_segment), voie.geom) = '-2' or  ST_LineCrossingDirection(adresse.line_rotation(geom_segment), voie.geom) = '2'
or ST_LineCrossingDirection(adresse.line_rotation(geom_segment), voie.geom) = '3' or ST_LineCrossingDirection(adresse.line_rotation(geom_segment), voie.geom) = '-3' as erreur_voie
from adresse.segment_extract('adresse.voie', 'voie.id_voie', 'voie.geom'), adresse.voie
where voie.id_voie =  segment_extract.id_voie)r
where r.erreur_voie = true;



--
-- Fin VIEW
--

--
-- Début TRIGGER
--


  CREATE TRIGGER controle_point_voie_distant
  BEFORE INSERT OR UPDATE 
  ON adresse.point_adresse
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_point_voie_distant();



  CREATE TRIGGER c_erreur_parite
  BEFORE INSERT OR UPDATE OF geom, numero
  ON adresse.point_adresse
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.c_erreur_parite();



  CREATE TRIGGER bilan_pt_parcelle
  AFTER INSERT OR UPDATE OF geom
  ON adresse.point_adresse
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_bilan_pt_parcelle();             


  CREATE TRIGGER bilan_pt_com
  AFTER INSERT OR UPDATE OF geom
  ON adresse.point_adresse
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_bilan_pt_com();




  CREATE TRIGGER controle_commune_repet_nom_voie
  BEFORE INSERT OR UPDATE of nom
  ON adresse.voie
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_commune_repet_nom_voie();



CREATE TRIGGER controle_longueur_nom
BEFORE INSERT OR UPDATE of nom
ON adresse.voie 
FOR EACH ROW
EXECUTE PROCEDURE  adresse.f_controle_longueur_nom();



  CREATE TRIGGER controle_voie_double_saisie
  BEFORE INSERT OR UPDATE   ----------------------
  ON adresse.voie 
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_voie_double_saisie();

  CREATE TRIGGER controle_voie_erreur_trace
  BEFORE INSERT OR UPDATE of geom  ----------------------
  ON adresse.voie 
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_voie_erreur_trace();



  CREATE TRIGGER bilan_voie_com
  AFTER INSERT OR UPDATE OF geom
  ON adresse.voie
  FOR EACH ROW
  EXECUTE PROCEDURE adresse.f_bilan_voie_com();

--
-- FIN TRIGGER
--

--
-- Début COMMENT
--


-- point_adresse.c_erreur_dist_voie
COMMENT ON COLUMN adresse.point_adresse.c_erreur_dist_voie IS 'identifie les points adresse plus près d’une autre voie que celle à laquelle il appartient';

-- point_adresse.c_point_voie_distant
COMMENT ON COLUMN adresse.point_adresse.c_dist_voie IS 'Calacul la distance entre le point adresse et sa voie de rattachement';

-- point_adresse.geom_pt_proj

COMMENT ON COLUMN adresse.point_adresse.geom_pt_proj IS 'geometrie du point adressse projeté sur sa voie de ratachement';


-- point_adresse.geom_segment_prolong

COMMENT ON COLUMN adresse.point_adresse.geom_segment_prolong IS 'géometrie du segment tracé entre le point adresse et le point projeté sur sa voie de ratachement. Prolongé de son 50/49e';

-- point_adresse.cote_voie

COMMENT ON COLUMN adresse.point_adresse.cote_voie IS 'indique la position du point par rapport à sa voie de ratachement : droite, gauche, indéfinie. Sinon problème (voie mal tracée, point non rattaché à une voie, ...)';


-- point_adresse.c_erreur_cote_parite
COMMENT ON COLUMN adresse.point_adresse.c_erreur_cote_parite IS 'identifie les points adresse pair ou impair du mauvais coté de la voie à laquelle il est rattaché : true (erreur coté), false (pas derreur) ou indefini. Sinon problème (voie mal tracée, point non rattaché à une voie, ...)';


-- voie.c_erreur_trace
COMMENT ON COLUMN adresse.voie.c_erreur_trace IS 'erreur de tracé de voies recourbées sur ou vers elles mêmes';
-- voie.c_repet_nom_voie
COMMENT ON COLUMN adresse.voie.c_repet_nom_voie IS 'voie portant le même nom qu1 autre voie de la même commune';

-- voie.c_long_nom
COMMENT ON COLUMN adresse.voie.c_long_nom IS 'voie portant un nom de plus de 24 charactères';

-- voie.c_repet_num
COMMENT ON COLUMN adresse.voie.c_repet_num IS 'voies avec repetition de numéro sur les points adresses qui lui sont associés';

-- voie.c_saisie_double
COMMENT ON COLUMN adresse.voie.c_saisie_double IS 'Voies à moins de 50 mètres de distance portant le même nom';

-- parcelle. nb_pt_adresse
COMMENT ON COLUMN adresse.parcelle.nb_pt_adresse IS 'nombre de points adresse par parcelle';

-- parcelle.date_pt_modif
COMMENT ON COLUMN adresse.parcelle.date_pt_modif IS 'derniere modification des points adresse par parcelle';

-- commune.pt_hors_parcelle
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle IS 'nombre de point adresse hors parcelle/commune';

-- commune.pt_hors_parcelle_valid
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point adresse hors parcelle validés/commune';
-- commune.nb_pt_valide
COMMENT ON COLUMN adresse.commune.nb_pt_valide IS 'nombre de point adresse marqués comme validés par les users/commune';

-- commune.nb_pt_erreur 
COMMENT ON COLUMN adresse.commune.nb_pt_erreur IS 'nombre de point adresse en erreur/commune';

-- commune.nb_a_verif
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point adresse à vérifier sur le terrain/commune';

-- commune.nb_pt_no_valid
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point adresse non validés/commune';

-- commune.pt_total
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point adresse total/commune';

-- commune.pct_pt_reel_valid 
COMMENT ON COLUMN adresse.commune.pt_hors_parcelle_valid IS 'nombre de point  adresse réellement validés/commune';


-- commune.voie_non_valid
COMMENT ON COLUMN adresse.commune.voie_non_valid IS 'nombre de voies non validées/commune';

-- commune.voie_valid
COMMENT ON COLUMN adresse.commune.voie_valid IS 'nombre de voies  validées/commune';

-- commune.voie_total
COMMENT ON COLUMN adresse.commune.voie_total IS 'nombre de voies total/commune';

-- commune.pct_voie_valid
COMMENT ON COLUMN adresse.commune.pct_voie_valid IS 'pourcentage de voie validé/commune';

--
-- FIN COMMENT
--

COMMIT;
