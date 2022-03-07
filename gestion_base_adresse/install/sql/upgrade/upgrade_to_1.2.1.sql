BEGIN;

DROP VIEW IF EXISTS adresse.v_lieux_dits;
CREATE VIEW adresse.v_lieux_dits AS
 SELECT ld.id_ld,
    ld.geom,
    ld.nom_ld,
    ld.numero,
    ld.integration_ban,
    ld.id_com,
    ld.date_der_maj,
    c.commune_nom,
    c.insee_code,
    cdr.commune_deleguee_nom,
    cdr.commune_deleguee_insee
   FROM adresse.lieux_dits ld
   JOIN adresse.commune c ON c.id_com = ld.id_com
   LEFT JOIN (
        SELECT
			rc.id_com,
			cd.id_com_del,
			cd.insee_code AS commune_deleguee_insee,
			cd.commune_deleguee_nom,
			cd.geom
		FROM (
			adresse.referencer_com rc JOIN adresse.commune_deleguee cd ON cd.id_com_del = rc.id_com_deleguee
		)
   ) cdr ON c.id_com = cdr.id_com AND public.st_contains(cdr.geom, ld.geom);

COMMENT ON VIEW adresse.v_lieux_dits IS 'Vue éditable sur les lieux dits';
CREATE TRIGGER edit_lieux_dits_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_lieux_dits FOR EACH ROW EXECUTE PROCEDURE adresse.edit_lieux_dits();

DROP VIEW IF EXISTS adresse.v_point_adresse;
CREATE VIEW adresse.v_point_adresse AS
 SELECT p.id_point,
    p.numero,
    p.suffixe,
    p.adresse_complete,
    p.code_postal,
    p.type_pos,
    p.achat_plaque_numero,
    p.createur,
    p.date_creation,
    p.modificateur,
    p.date_modif,
    p.erreur,
    p.commentaire,
    p.geom,
    p.id_voie,
    p.id_commune,
    p.id_parcelle,
    p.valide,
    p.verif_terrain,
    p.complement_adresse,
    p.lieudit_complement_nom,
    p.creation_adresse,
    c.commune_nom,
    c.insee_code,
    cdr.commune_deleguee_nom,
    cdr.commune_deleguee_insee
   FROM adresse.point_adresse p
   JOIN adresse.commune c ON ((c.id_com = p.id_commune))
   LEFT JOIN (
        SELECT
			rc.id_com,
			cd.id_com_del,
			cd.insee_code AS commune_deleguee_insee,
			cd.commune_deleguee_nom,
			cd.geom
		FROM (
			adresse.referencer_com rc JOIN adresse.commune_deleguee cd ON cd.id_com_del = rc.id_com_deleguee
		)
   ) cdr ON c.id_com = cdr.id_com AND public.st_contains(cdr.geom, p.geom)
   ;

COMMENT ON VIEW adresse.v_lieux_dits IS 'Vue éditable sur les lieux dits';
CREATE TRIGGER edit_point_adresse_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.edit_point_adresse();

COMMIT;
