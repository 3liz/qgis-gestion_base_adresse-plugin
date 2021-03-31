
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- v_commune
CREATE VIEW adresse.v_commune AS
 SELECT (c.insee_code)::integer AS insee_code,
    c.commune_nom
   FROM adresse.commune c
  ORDER BY c.commune_nom;


-- v_export_bal
CREATE VIEW adresse.v_export_bal AS
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    p.commune_insee,
    c.commune_nom,
    p.commune_deleguee_insee,
    p.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    round(st_x(st_transform(p.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(p.geom, 4326))::numeric, 10) AS lat,
    g.geo_parcelle AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v,
    cadastre.geo_parcelle g
  WHERE p.id_commune = c.id_com AND st_intersects(g.geom, p.geom) AND p.id_voie = v.id_voie
UNION
 SELECT ''::text AS uid_adresse,
    concat(commune.insee_code, '_', 'xxxx', '_', ld.numero) AS cle_interop,
    commune.insee_code AS commune_insee,
    ld.commune_nom,
    commune_deleguee.insee_code AS commune_deleguee_insee,
    ld.commune_deleguee_nom,
    ld.nom_ld AS voie_nom,
    ''::character varying(255) AS lieudit_complement_nom,
    ld.numero,
    ''::text AS suffixe,
    ''::text AS "position",
    st_x(ld.geom) AS x,
    st_y(ld.geom) AS y,
    round(st_x(st_transform(ld.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(ld.geom, 4326))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    ld.commune_nom AS source,
    ld.date_der_maj
   FROM adresse.lieux_dits ld
     LEFT JOIN adresse.commune_deleguee ON commune_deleguee.id_com_del = ld.id_com_del
     LEFT JOIN adresse.commune ON commune.id_com = ld.id_com
  WHERE ld.integration_ban = true
UNION
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    p.commune_insee,
    c.commune_nom,
    p.commune_deleguee_insee,
    p.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    round(st_x(st_transform(p.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(p.geom, 4326))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
  WHERE p.id_parcelle IS NULL AND p.id_commune = c.id_com AND p.id_voie = v.id_voie;


--
-- PostgreSQL database dump complete
--
