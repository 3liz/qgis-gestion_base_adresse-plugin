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


--
-- PostgreSQL database dump complete
--

