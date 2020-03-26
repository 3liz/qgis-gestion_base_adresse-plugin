BEGIN;

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
