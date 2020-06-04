--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Debian 10.6-1.pgdg90+1)
-- Dumped by pg_dump version 10.6 (Debian 10.6-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

-- commune_deleguee_geom_idx
CREATE INDEX commune_deleguee_geom_idx ON adresse.commune_deleguee USING gist (geom);


-- commune_geom_idx
CREATE INDEX commune_geom_idx ON adresse.commune USING gist (geom);


-- index_com_adr
CREATE INDEX index_com_adr ON adresse.point_adresse USING btree (id_commune);


-- index_com_comdel
CREATE INDEX index_com_comdel ON adresse.referencer_com USING btree (id_com);


-- index_com_voie
CREATE INDEX index_com_voie ON adresse.appartenir_com USING btree (id_com);


-- index_comdel_com
CREATE INDEX index_comdel_com ON adresse.referencer_com USING btree (id_com_deleguee);


-- index_parcelle_adr
CREATE INDEX index_parcelle_adr ON adresse.point_adresse USING btree (id_parcelle);


-- index_voie_adr
CREATE INDEX index_voie_adr ON adresse.point_adresse USING btree (id_voie);


-- index_voie_com
CREATE INDEX index_voie_com ON adresse.appartenir_com USING btree (id_voie);


-- parcelle_geom_idx
CREATE INDEX parcelle_geom_idx ON adresse.parcelle USING gist (geom);


-- point_adresse_geom_idx
CREATE INDEX point_adresse_geom_idx ON adresse.point_adresse USING gist (geom);


-- voie_geom_idx
CREATE INDEX voie_geom_idx ON adresse.voie USING gist (geom);


--
-- PostgreSQL database dump complete
--

