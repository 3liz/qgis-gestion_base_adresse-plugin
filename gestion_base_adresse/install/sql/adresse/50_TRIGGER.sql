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

-- point_adresse bilan_pt_com
CREATE TRIGGER bilan_pt_com AFTER INSERT OR UPDATE OF geom ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.f_bilan_pt_com();


-- point_adresse bilan_pt_parcelle
CREATE TRIGGER bilan_pt_parcelle AFTER INSERT OR UPDATE OF geom ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.f_bilan_pt_parcelle();


-- voie bilan_voie_com
CREATE TRIGGER bilan_voie_com AFTER INSERT OR UPDATE OF geom ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.f_bilan_voie_com();


-- point_adresse c_erreur_parite
CREATE TRIGGER c_erreur_parite BEFORE INSERT OR UPDATE OF geom, numero ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.c_erreur_parite();


-- voie controle_commune_repet_nom_voie
CREATE TRIGGER controle_commune_repet_nom_voie BEFORE INSERT OR UPDATE OF nom ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.f_commune_repet_nom_voie();


-- voie controle_longueur_nom
CREATE TRIGGER controle_longueur_nom BEFORE INSERT OR UPDATE OF nom ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.f_controle_longueur_nom();


-- point_adresse controle_point_voie_distant
CREATE TRIGGER controle_point_voie_distant BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.f_point_voie_distant();


-- voie controle_voie_double_saisie
CREATE TRIGGER controle_voie_double_saisie BEFORE INSERT OR UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.f_voie_double_saisie();


-- voie controle_voie_erreur_trace
CREATE TRIGGER controle_voie_erreur_trace BEFORE INSERT OR UPDATE OF geom ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.f_voie_erreur_trace();


-- point_adresse createur_insert
CREATE TRIGGER createur_insert BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.modif_createur();


-- voie createur_insert
CREATE TRIGGER createur_insert BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.modif_createur();


-- point_adresse creation_adresse
CREATE TRIGGER creation_adresse BEFORE INSERT ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.creation_adresse();


-- v_point_adresse edit_point_adresse_from_view
CREATE TRIGGER edit_point_adresse_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.edit_point_adresse();


-- point_adresse get_code_postal
CREATE TRIGGER get_code_postal BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_code_postal();


-- point_adresse get_parcelle
CREATE TRIGGER get_parcelle BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_parcelle();


-- lieux_dits infos_lieux_dits
CREATE TRIGGER infos_lieux_dits BEFORE INSERT OR UPDATE ON adresse.lieux_dits FOR EACH ROW EXECUTE PROCEDURE adresse.lieux_dits();


-- point_adresse nb_point
CREATE TRIGGER nb_point AFTER INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- point_adresse nb_point_delete
CREATE TRIGGER nb_point_delete AFTER DELETE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.calcul_point_voie();


-- voie nom_complet
CREATE TRIGGER nom_complet BEFORE INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet();


-- voie nom_complet_maj
CREATE TRIGGER nom_complet_maj BEFORE INSERT OR UPDATE ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.voie_nom_complet_maj();


-- point_adresse point_adresse_get_commune
CREATE TRIGGER point_adresse_get_commune BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_commune();


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


-- voie voie_get_commune
CREATE TRIGGER voie_get_commune AFTER INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.update_appartenir_com();


--
-- PostgreSQL database dump complete
--


COMMIT;
