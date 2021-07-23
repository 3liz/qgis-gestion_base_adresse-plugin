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

-- metadata
COMMENT ON TABLE adresse.metadata IS 'Métadonnée de la structure du schéma, en lien avec la version du plugin QGIS. C''est utilisé pour les scripts de migration de la structure entre 2 versions.';


-- metadata.id
COMMENT ON COLUMN adresse.metadata.id IS 'Identifiant de la version';


-- metadata.me_version
COMMENT ON COLUMN adresse.metadata.me_version IS 'Version. Ex: 1.0.2';


-- metadata.me_version_date
COMMENT ON COLUMN adresse.metadata.me_version_date IS 'Date de la version. Ex: 2019-06-01';


--
-- PostgreSQL database dump complete
--

