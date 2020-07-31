--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Debian 10.14-1.pgdg100+1)
-- Dumped by pg_dump version 10.14 (Debian 10.14-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

-- appartenir_com
CREATE TABLE adresse.appartenir_com (
    id_voie integer NOT NULL,
    id_com integer NOT NULL
);


-- commune
CREATE TABLE adresse.commune (
    id_com integer NOT NULL,
    commune_nom text,
    insee_code character(5),
    statut_com text,
    intercom text,
    fibre text,
    phase_fibre character(1),
    actif character(3),
    nom_referent text,
    tel_referent character(10),
    mail_referent text,
    situation text,
    commenter text,
    date_delib date,
    diffusion_dgfip character(3),
    date_dgfip date,
    diffusion_ban character(3),
    date_ban date,
    geom public.geometry(MultiPolygon,2154),
    adresse_mairie text,
    code_postal text,
    maire text
);


-- commune_deleguee
CREATE TABLE adresse.commune_deleguee (
    id_com_del integer NOT NULL,
    commune_deleguee_nom text,
    insee_code character(5),
    nom_referent_deleguee text,
    tel_referent_deleguee character(10),
    mail_referent_deleguee text,
    geom public.geometry(MultiPolygon,2154)
);


-- commune_deleguee_id_com_del_seq
CREATE SEQUENCE adresse.commune_deleguee_id_com_del_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- commune_deleguee_id_com_del_seq
ALTER SEQUENCE adresse.commune_deleguee_id_com_del_seq OWNED BY adresse.commune_deleguee.id_com_del;


-- commune_id_com_seq
CREATE SEQUENCE adresse.commune_id_com_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- commune_id_com_seq
ALTER SEQUENCE adresse.commune_id_com_seq OWNED BY adresse.commune.id_com;


-- document
CREATE TABLE adresse.document (
    id_doc integer NOT NULL,
    nom_doc text,
    date_doc date,
    type_document text,
    id_commune integer,
    lien text
);


-- document_id_doc_seq
CREATE SEQUENCE adresse.document_id_doc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- document_id_doc_seq
ALTER SEQUENCE adresse.document_id_doc_seq OWNED BY adresse.document.id_doc;


-- point_adresse
CREATE TABLE adresse.point_adresse (
    id_point integer NOT NULL,
    numero integer NOT NULL,
    suffixe text,
    adresse_complete text,
    code_postal character(5),
    type_pos text,
    achat_plaque_numero boolean DEFAULT false NOT NULL,
    createur text,
    date_creation date DEFAULT now(),
    modificateur text,
    date_modif date DEFAULT now(),
    erreur boolean DEFAULT false NOT NULL,
    commentaire text,
    geom public.geometry(Point,2154),
    id_voie integer,
    id_commune integer,
    id_parcelle integer,
    valide boolean DEFAULT true
);


-- voie
CREATE TABLE adresse.voie (
    id_voie integer NOT NULL,
    typologie text NOT NULL,
    nom text NOT NULL,
    nom_complet text,
    type_num text,
    statut_voie_num boolean DEFAULT true NOT NULL,
    statut_voie boolean DEFAULT false NOT NULL,
    sens_numerotation boolean DEFAULT false NOT NULL,
    achat_plaque_voie boolean DEFAULT false NOT NULL,
    nb_point integer,
    createur text,
    date_creation date DEFAULT now(),
    modificateur text,
    date_modif date DEFAULT now(),
    longueur integer,
    code_fantoir integer,
    delib boolean,
    geom public.geometry(LineString,2154)
);


-- metadata
CREATE TABLE adresse.metadata (
    id integer NOT NULL,
    me_version text NOT NULL,
    me_version_date date NOT NULL,
    me_status smallint NOT NULL
);


-- metadata
COMMENT ON TABLE adresse.metadata IS 'Métadonnée de la structure du schéma, en lien avec la version du plugin QGIS. C''est utilisé pour les scripts de migration de la structure entre 2 versions.';


-- metadata_id_seq
CREATE SEQUENCE adresse.metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- metadata_id_seq
ALTER SEQUENCE adresse.metadata_id_seq OWNED BY adresse.metadata.id;


-- parcelle
CREATE TABLE adresse.parcelle (
    fid integer NOT NULL,
    id text,
    commune character varying,
    prefixe character varying,
    section character varying,
    numero character varying,
    contenance integer,
    arpente boolean,
    created date DEFAULT now(),
    updated date DEFAULT now(),
    geom public.geometry(MultiPolygon,2154)
);


-- parcelle_fid_seq
CREATE SEQUENCE adresse.parcelle_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- parcelle_fid_seq
ALTER SEQUENCE adresse.parcelle_fid_seq OWNED BY adresse.parcelle.fid;


-- point_adresse_id_point_seq
CREATE SEQUENCE adresse.point_adresse_id_point_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- point_adresse_id_point_seq
ALTER SEQUENCE adresse.point_adresse_id_point_seq OWNED BY adresse.point_adresse.id_point;


-- referencer_com
CREATE TABLE adresse.referencer_com (
    id_com integer NOT NULL,
    id_com_deleguee integer NOT NULL,
    action text,
    date_action date
);


-- voie_id_voie_seq
CREATE SEQUENCE adresse.voie_id_voie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- voie_id_voie_seq
ALTER SEQUENCE adresse.voie_id_voie_seq OWNED BY adresse.voie.id_voie;


-- commune id_com
ALTER TABLE ONLY adresse.commune ALTER COLUMN id_com SET DEFAULT nextval('adresse.commune_id_com_seq'::regclass);


-- commune_deleguee id_com_del
ALTER TABLE ONLY adresse.commune_deleguee ALTER COLUMN id_com_del SET DEFAULT nextval('adresse.commune_deleguee_id_com_del_seq'::regclass);


-- document id_doc
ALTER TABLE ONLY adresse.document ALTER COLUMN id_doc SET DEFAULT nextval('adresse.document_id_doc_seq'::regclass);


-- metadata id
ALTER TABLE ONLY adresse.metadata ALTER COLUMN id SET DEFAULT nextval('adresse.metadata_id_seq'::regclass);


-- parcelle fid
ALTER TABLE ONLY adresse.parcelle ALTER COLUMN fid SET DEFAULT nextval('adresse.parcelle_fid_seq'::regclass);


-- point_adresse id_point
ALTER TABLE ONLY adresse.point_adresse ALTER COLUMN id_point SET DEFAULT nextval('adresse.point_adresse_id_point_seq'::regclass);


-- voie id_voie
ALTER TABLE ONLY adresse.voie ALTER COLUMN id_voie SET DEFAULT nextval('adresse.voie_id_voie_seq'::regclass);


--
-- PostgreSQL database dump complete
--

