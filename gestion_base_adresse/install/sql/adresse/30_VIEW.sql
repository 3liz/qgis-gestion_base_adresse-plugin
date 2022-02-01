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
     LEFT JOIN ( SELECT rc.id_com,
            cd.id_com_del,
            cd.insee_code AS commune_deleguee_insee,
            cd.commune_deleguee_nom,
            cd.geom
           FROM (adresse.referencer_com rc
             JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)))) cdr ON (((p.id_commune = cdr.id_com) AND public.st_contains(cdr.geom, p.geom))))
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


-- v_lieux_dits
CREATE VIEW adresse.v_lieux_dits AS
 SELECT ld.id_ld,
    ld.geom,
    ld.nom_ld,
    ld.numero,
    ld.integration_ban,
    ld.id_com,
    ld.date_der_maj,
    c.commune_nom,
    c.insee_code,
    cd.commune_deleguee_nom,
    cd.insee_code AS commune_deleguee_insee
   FROM (((adresse.lieux_dits ld
     JOIN adresse.commune c ON ((c.id_com = ld.id_com)))
     LEFT JOIN adresse.referencer_com rc ON ((ld.id_com = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)));


-- v_point_adresse
CREATE VIEW adresse.v_point_adresse AS
 SELECT p.id_point,
    p.numero,
    p.suffixe,
    p.adresse_complete,
    p.code_postal,
    p.type_pos,
    p.achat_plaque_numero,
    p.createur,
    p.date_creation,
    p.modificateur,
    p.date_modif,
    p.erreur,
    p.commentaire,
    p.geom,
    p.id_voie,
    p.id_commune,
    p.id_parcelle,
    p.valide,
    p.verif_terrain,
    p.complement_adresse,
    p.lieudit_complement_nom,
    p.creation_adresse,
    c.commune_nom,
    c.insee_code,
    cd.commune_deleguee_nom,
    cd.insee_code AS commune_deleguee_insee
   FROM (((adresse.point_adresse p
     JOIN adresse.commune c ON ((c.id_com = p.id_commune)))
     LEFT JOIN adresse.referencer_com rc ON ((p.id_commune = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)));


--
-- PostgreSQL database dump complete
--


COMMIT;
