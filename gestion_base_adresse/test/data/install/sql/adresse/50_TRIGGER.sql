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

-- point_adresse nb_point
CREATE TRIGGER nb_point AFTER INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- voie nom_complet
CREATE TRIGGER nom_complet BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet();


-- point_adresse trigger_point_adr
CREATE TRIGGER trigger_point_adr BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.trigger_point_adr();


--
-- PostgreSQL database dump complete
--

