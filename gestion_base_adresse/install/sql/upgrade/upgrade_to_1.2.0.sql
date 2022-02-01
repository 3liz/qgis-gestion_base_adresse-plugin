BEGIN;

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

COMMENT ON FUNCTION adresse.add_referencer_com IS 'Permet la réinitialisation de la table adresse.referencer_com en faisant une intersection entre adresse.commune_deleguee et adresse.commune';

CREATE OR REPLACE VIEW adresse.v_export_bal AS
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    c.insee_code AS commune_insee,
    c.commune_nom,
    cdr.commune_deleguee_insee,
    cdr.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    public.st_x(p.geom) AS x,
    public.st_y(p.geom) AS y,
    round((public.st_x(public.st_transform(p.geom, 4326)))::numeric, 10) AS long,
    round((public.st_y(public.st_transform(p.geom, 4326)))::numeric, 10) AS lat,
    g.id AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM ((((adresse.point_adresse p
     LEFT JOIN adresse.commune c ON ((p.id_commune = c.id_com)))
     LEFT JOIN (
        SELECT
            rc.id_com,
            cd.id_com_del,
            cd.insee_code AS commune_deleguee_insee,
            cd.commune_deleguee_nom, cd.geom
          FROM adresse.referencer_com rc JOIN adresse.commune_deleguee cd
          ON (cd.id_com_del = rc.id_com_deleguee)
        ) cdr
        ON (p.id_commune = cdr.id_com AND public.st_contains(cdr.geom, p.geom)))
     LEFT JOIN adresse.voie v ON ((p.id_voie = v.id_voie)))
     LEFT JOIN adresse.parcelle g ON ((p.id_parcelle = g.fid)))
UNION
 SELECT ''::text AS uid_adresse,
    concat(c.insee_code, '_', 'xxxx', '_', ld.numero) AS cle_interop,
    c.insee_code AS commune_insee,
    c.commune_nom,
    cdr.commune_deleguee_insee,
    cdr.commune_deleguee_nom,
    ld.nom_ld AS voie_nom,
    ''::character varying(255) AS lieudit_complement_nom,
    ld.numero,
    ''::text AS suffixe,
    ''::text AS "position",
    public.st_x(ld.geom) AS x,
    public.st_y(ld.geom) AS y,
    round((public.st_x(public.st_transform(ld.geom, 4326)))::numeric, 10) AS long,
    round((public.st_y(public.st_transform(ld.geom, 4326)))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    c.commune_nom AS source,
    ld.date_der_maj
   FROM ((adresse.lieux_dits ld
     LEFT JOIN adresse.commune c ON ((c.id_com = ld.id_com)))
     LEFT JOIN ( SELECT rc.id_com,
            cd.id_com_del,
            cd.insee_code AS commune_deleguee_insee,
            cd.commune_deleguee_nom,
            cd.geom
           FROM (adresse.referencer_com rc
             JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)))) cdr ON (((ld.id_com = cdr.id_com) AND public.st_contains(cdr.geom, ld.geom))))
  WHERE (ld.integration_ban = true);

COMMIT;
