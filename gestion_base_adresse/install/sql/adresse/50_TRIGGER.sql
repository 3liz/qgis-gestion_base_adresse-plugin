--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)
-- Dumped by pg_dump version 11.6 (Ubuntu 11.6-1.pgdg19.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- point_adresse nb_point
CREATE TRIGGER nb_point AFTER INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- voie nom_complet
CREATE TRIGGER nom_complet BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet();


-- voie trigger_longueur
CREATE TRIGGER trigger_longueur BEFORE INSERT OR UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.longueur_voie();


-- point_adresse trigger_point_adr
CREATE TRIGGER trigger_point_adr BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.trigger_point_adr();


-- point_adresse update_modif_create
CREATE TRIGGER update_modif_create BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.modif_update();


-- voie update_modif_create
CREATE TRIGGER update_modif_create BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.modif_update();


--
-- PostgreSQL database dump complete
--

