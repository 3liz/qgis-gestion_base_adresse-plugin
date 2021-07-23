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

-- alerte_ddfip_id_seq
CREATE SEQUENCE adresse.alerte_ddfip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

-- appartenir_com
CREATE TABLE adresse.appartenir_com (
    id_voie integer NOT NULL,
    id_com integer NOT NULL
);


-- codes_postaux
CREATE TABLE adresse.codes_postaux (
    id bigint NOT NULL,
    geom public.geometry(MultiPolygon,2154),
    cp text
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
    maire text,
    acc_ingenierie_publique boolean,
    key_lizmap_filter character varying(255),
    diffusion_sna boolean,
    date_sna date,
    courrier_president character varying(255),
    poste text,
    nb_locaux integer,
    osm boolean
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


-- import_ban
CREATE TABLE adresse.import_ban (
    id_ban_position text,
    id_ban_adresse text,
    cle_interop text,
    id_ban_group text,
    id_fantoir text,
    numero smallint,
    suffixe text,
    nom_voie text,
    code_postal text,
    nom_commune text,
    code_insee text,
    nom_complementaire text,
    x double precision,
    y double precision,
    lon text,
    lat text,
    typ_loc text,
    source text,
    date_der_maj text,
    geom public.geometry(Point,2154)
);


-- import_ban_etat_commune
CREATE TABLE adresse.import_ban_etat_commune (
    region smallint,
    departement smallint,
    code_commune integer,
    nom_commune text,
    population bigint,
    type_composition text,
    nb_lieux_dits integer,
    nb_voies integer,
    nb_numeros integer,
    analyse_adressage_nb_adresses_attendues integer,
    analyse_adressage_ratio integer,
    analyse_adressage_deficit_adresses smallint
);


-- import_ban_lo
CREATE TABLE adresse.import_ban_lo (
    id text,
    numero text,
    rep text,
    nom_voie text,
    code_postal text,
    code_insee text,
    nom_commune text,
    x text,
    y text,
    geom public.geometry(Point,2154)
);


-- lieux_dits
CREATE TABLE adresse.lieux_dits (
    id_ld integer NOT NULL,
    geom public.geometry(Point,2154),
    nom_ld text,
    numero integer,
    integration_ban boolean,
    id_com integer NOT NULL,
    commune_nom text,
    date_der_maj date,
    id_com_del integer,
    commune_deleguee_nom text
);


-- lieux_dits_id_ld_seq
CREATE SEQUENCE adresse.lieux_dits_id_ld_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- lieux_dits_id_ld_seq
ALTER SEQUENCE adresse.lieux_dits_id_ld_seq OWNED BY adresse.lieux_dits.id_ld;


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
    valide boolean DEFAULT true NOT NULL,
    verif_terrain boolean DEFAULT false NOT NULL,
    complement_adresse character varying(255),
    lieudit_complement_nom character varying(255),
    creation_adresse boolean
);


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


-- voie
CREATE TABLE adresse.voie (
    id_voie integer NOT NULL,
    typologie text NOT NULL,
    nom text NOT NULL,
    nom_complet text,
    type_num text,
    statut_voie_num boolean DEFAULT false NOT NULL,
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
    geom public.geometry(LineString,2154),
    nb_panneaux smallint,
    nom_complet_maj text
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


-- lieux_dits id_ld
ALTER TABLE ONLY adresse.lieux_dits ALTER COLUMN id_ld SET DEFAULT nextval('adresse.lieux_dits_id_ld_seq'::regclass);


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


COMMIT;
