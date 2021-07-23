--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.16
-- Dumped by pg_dump version 9.6.16

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

-- appartenir_com appartenir_com_pkey
ALTER TABLE ONLY adresse.appartenir_com
    ADD CONSTRAINT appartenir_com_pkey PRIMARY KEY (id_voie, id_com);


-- commune_deleguee commune_deleguee_pkey
ALTER TABLE ONLY adresse.commune_deleguee
    ADD CONSTRAINT commune_deleguee_pkey PRIMARY KEY (id_com_del);


-- commune commune_pkey
ALTER TABLE ONLY adresse.commune
    ADD CONSTRAINT commune_pkey PRIMARY KEY (id_com);


-- document document_pkey
ALTER TABLE ONLY adresse.document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id_doc);


-- metadata metadata_me_version_key
ALTER TABLE ONLY adresse.metadata
    ADD CONSTRAINT metadata_me_version_key UNIQUE (me_version);


-- metadata metadata_pkey
ALTER TABLE ONLY adresse.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


-- parcelle parcelle_pkey
ALTER TABLE ONLY adresse.parcelle
    ADD CONSTRAINT parcelle_pkey PRIMARY KEY (fid);


-- point_adresse point_adresse_pkey
ALTER TABLE ONLY adresse.point_adresse
    ADD CONSTRAINT point_adresse_pkey PRIMARY KEY (id_point);


-- referencer_com referencer_com_pkey
ALTER TABLE ONLY adresse.referencer_com
    ADD CONSTRAINT referencer_com_pkey PRIMARY KEY (id_com, id_com_deleguee);


-- voie voie_pkey
ALTER TABLE ONLY adresse.voie
    ADD CONSTRAINT voie_pkey PRIMARY KEY (id_voie);


-- appartenir_com appartenir_com_id_com_fkey
ALTER TABLE ONLY adresse.appartenir_com
    ADD CONSTRAINT appartenir_com_id_com_fkey FOREIGN KEY (id_com) REFERENCES adresse.commune(id_com);


-- appartenir_com appartenir_com_id_voie_fkey
ALTER TABLE ONLY adresse.appartenir_com
    ADD CONSTRAINT appartenir_com_id_voie_fkey FOREIGN KEY (id_voie) REFERENCES adresse.voie(id_voie);


-- document document_id_commune_fkey
ALTER TABLE ONLY adresse.document
    ADD CONSTRAINT document_id_commune_fkey FOREIGN KEY (id_commune) REFERENCES adresse.commune(id_com);


-- point_adresse point_adresse_id_commune_fkey
ALTER TABLE ONLY adresse.point_adresse
    ADD CONSTRAINT point_adresse_id_commune_fkey FOREIGN KEY (id_commune) REFERENCES adresse.commune(id_com);


-- point_adresse point_adresse_id_parcelle_fkey
ALTER TABLE ONLY adresse.point_adresse
    ADD CONSTRAINT point_adresse_id_parcelle_fkey FOREIGN KEY (id_parcelle) REFERENCES adresse.parcelle(fid);


-- point_adresse point_adresse_id_voie_fkey
ALTER TABLE ONLY adresse.point_adresse
    ADD CONSTRAINT point_adresse_id_voie_fkey FOREIGN KEY (id_voie) REFERENCES adresse.voie(id_voie);


-- referencer_com referencer_com_id_com_deleguee_fkey
ALTER TABLE ONLY adresse.referencer_com
    ADD CONSTRAINT referencer_com_id_com_deleguee_fkey FOREIGN KEY (id_com_deleguee) REFERENCES adresse.commune_deleguee(id_com_del);


-- referencer_com referencer_com_id_com_fkey
ALTER TABLE ONLY adresse.referencer_com
    ADD CONSTRAINT referencer_com_id_com_fkey FOREIGN KEY (id_com) REFERENCES adresse.commune(id_com);


--
-- PostgreSQL database dump complete
--

