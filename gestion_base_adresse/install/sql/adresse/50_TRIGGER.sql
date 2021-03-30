--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- point_adresse createur_insert
CREATE TRIGGER createur_insert BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.modif_createur();


-- voie createur_insert
CREATE TRIGGER createur_insert BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.modif_createur();


-- point_adresse get_commune
CREATE TRIGGER get_commune BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.update_commune();


-- voie get_commune
CREATE TRIGGER get_commune AFTER INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.update_commune();


-- point_adresse get_parcelle
CREATE TRIGGER get_parcelle BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_parcelle();


-- point_adresse nb_point
CREATE TRIGGER nb_point AFTER INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- point_adresse nb_point_delete
CREATE TRIGGER nb_point_delete AFTER DELETE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- point_adresse
CREATE TRIGGER bilan_pt_com AFTER INSERT OR UPDATE OF geom ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.f_bilan_pt_com();


-- point_adresse
CREATE TRIGGER get_code_postal BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_code_postal();

-- point_adresse
CREATE TRIGGER get_commune_deleguee BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_commune_deleguee();


-- point_adresse
CREATE TRIGGER get_commune_insee BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_commune_insee();


-- point_adresse
CREATE TRIGGER creation_adresse BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.creation_adresse();


-- voie nom_complet
CREATE TRIGGER nom_complet BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet();

-- voie nom_complet_maj
CREATE TRIGGER nom_complet_maj BEFORE INSERT OR UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet_maj();


-- voie trigger_longueur
CREATE TRIGGER trigger_longueur BEFORE INSERT OR UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.longueur_voie();


-- point_adresse trigger_point_adr
CREATE TRIGGER trigger_point_adr BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.trigger_point_adr();


-- voie trigger_update_adr_complete
CREATE TRIGGER trigger_update_adr_complete AFTER UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.update_adr_complete();


-- voie trigger_update_name
CREATE TRIGGER trigger_update_name BEFORE UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.update_full_name();


-- point_adresse update_adr_complete
CREATE TRIGGER update_adr_complete BEFORE UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.update_adr_complete();


-- point_adresse update_modif_create
CREATE TRIGGER update_modif_create BEFORE UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.modif_update();


-- voie update_modif_create
CREATE TRIGGER update_modif_create BEFORE UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.modif_update();


-- commune nb_pts
CREATE TRIGGER nb_pts AFTER INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.nb_pts_communes();

-- lieux dits
CREATE TRIGGER infos_lieux_dits BEFORE INSERT OR UPDATE ON adresse.lieux_dits FOR EACH ROW EXECUTE PROCEDURE adresse.lieux_dits();


--
-- PostgreSQL database dump complete
--
