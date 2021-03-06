BEGIN;

DROP VIEW IF EXISTS adresse.export_bal;
-- v_export_bal
CREATE VIEW adresse.v_export_bal AS
 SELECT p.id_point,
        CASE
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    ''::text AS uid_adresse,
    v.nom_complet AS voie_nom,
    p.numero,
    p.suffixe,
    c.commune_nom,
    p.type_pos AS "position",
    public.st_x(p.geom) AS x,
    public.st_y(p.geom) AS y,
    public.st_x(public.st_transform(p.geom, 4326)) AS long,
    public.st_y(public.st_transform(p.geom, 4326)) AS lat,
    ''::text AS source,
    p.date_modif AS date_der_maj,
    c.insee_code AS code_insee
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
  WHERE ((p.id_commune = c.id_com) AND (p.id_voie = v.id_voie));

  ALTER VIEW adresse.vue_com RENAME TO v_commune;

COMMIT;
