BEGIN;

CREATE OR REPLACE FUNCTION adresse.calcul_num_metrique(
	pgeom geometry)
    RETURNS TABLE(num integer, suffixe text)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$DECLARE
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

    SELECT v.sens into sens FROM adresse.voie v WHERE v.id_voie = idvoie;

    SELECT adresse.calcul_point_position(adresse.calcul_segment_proche(geom, pgeom),pgeom) into isleft
    FROM( SELECT geom, id_voie, ST_Distance(pgeom, geom) as dist
    FROM adresse.voie
    WHERE statut_voie_num IS FALSE ORDER BY dist LIMIT 1) AS d;

    SELECT ST_Length(ST_MakeLine(ST_StartPoint(v.geom), ST_ClosestPoint(v.geom, pgeom)))::integer into num
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
$BODY$;

CREATE OR REPLACE FUNCTION adresse.calcul_num_adr(
	pgeom geometry)
    RETURNS TABLE(num integer, suffixe text)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$DECLARE
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

    SELECT v.sens into sens
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
        WHILE NOT test OR numa <= numb LOOP
            FOREACH rec IN ARRAY suff LOOP
                IF (SELECT TRUE FROM adresse.point_adresse p WHERE p.id_voie = idvoie AND p.numero = numa AND p.suffixe = rec) IS NULL AND NOT test THEN
                    test = true;
                    numc = numa;
                    s = rec;
                END IF;
            END LOOP;
            numa = numa+2;
        END LOOP;
    ELSIF numa IS NOT NULL AND numb IS NULL THEN
        numc = numa+2;
    ELSIF numa IS NULL AND numb IS NOT NULL THEN
        IF numb - 2 >0 THEN
            numc =  numb - 2;
        ELSIF numb - 2 <= 0 THEN
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

CREATE OR REPLACE VIEW adresse.export_bal AS
SELECT p.id_point,
    CASE
        WHEN p.suffixe IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
        ELSE concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
    END AS cle_interop,
    ''::text AS uid_adresse,
    v.nom AS voie_nom,
    p.numero,
    p.suffixe,
    c.commune_nom,
    'parcelle'::text AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    st_x(st_transform(p.geom, 4326)) AS long,
    st_y(st_transform(p.geom, 4326)) AS lat,
    ''::text AS source,
    p.date_modif AS date_derniere_maj,
    c.insee_code AS code_insee
FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
WHERE p.id_commune = c.id_com AND p.id_voie = v.id_voie;

CREATE OR REPLACE VIEW adresse.vue_com AS
SELECT c.insee_code::integer AS insee_code,
    c.commune_nom
FROM adresse.commune c;

COMMIT;
