--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.17
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- export_bal
CREATE VIEW adresse.export_bal AS
 SELECT p.id_point,
        CASE
            WHEN (p.suffixe IS NOT NULL) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            ELSE concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text))
        END AS cle_interop,
    ''::text AS uid_adresse,
    v.nom AS voie_nom,
    p.numero,
    p.suffixe,
    c.commune_nom,
    'parcelle'::text AS "position",
    public.st_x(p.geom) AS x,
    public.st_y(p.geom) AS y,
    public.st_x(public.st_transform(p.geom, 4326)) AS long,
    public.st_y(public.st_transform(p.geom, 4326)) AS lat,
    ''::text AS source,
    p.date_modif AS date_derniere_maj,
    c.insee_code AS code_insee
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
  WHERE ((p.id_commune = c.id_com) AND (p.id_voie = v.id_voie));


-- vue_com
CREATE VIEW adresse.vue_com AS
 SELECT (c.insee_code)::integer AS insee_code,
    c.commune_nom
   FROM adresse.commune c;


--
-- PostgreSQL database dump complete
--

