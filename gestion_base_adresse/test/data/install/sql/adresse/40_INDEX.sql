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

-- commune_deleguee_geom_idx
CREATE INDEX commune_deleguee_geom_idx ON adresse.commune_deleguee USING gist (geom);


-- commune_geom_idx
CREATE INDEX commune_geom_idx ON adresse.commune USING gist (geom);


-- parcelle_geom_idx
CREATE INDEX parcelle_geom_idx ON adresse.parcelle USING gist (geom);


-- point_adresse_geom_idx
CREATE INDEX point_adresse_geom_idx ON adresse.point_adresse USING gist (geom);


-- voie_geom_idx
CREATE INDEX voie_geom_idx ON adresse.voie USING gist (geom);


--
-- PostgreSQL database dump complete
--

