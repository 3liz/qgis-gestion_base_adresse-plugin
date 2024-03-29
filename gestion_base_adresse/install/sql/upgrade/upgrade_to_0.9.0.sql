BEGIN;

--v_export_bal

DROP VIEW IF EXISTS adresse.v_export_bal;

CREATE VIEW adresse.v_export_bal AS
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NULL) AND (v.code_fantoir IS NOT NULL)) THEN concat(c.insee_code, '_', (v.code_fantoir)::text, '_', lpad((p.numero)::text, 5, '0'::text))
            WHEN ((p.suffixe IS NOT NULL) AND (v.code_fantoir IS NULL)) THEN concat(c.insee_code, '_', 'xxxx', '_', lpad((p.numero)::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    c.insee_code AS commune_insee,
    c.commune_nom,
    cd.insee_code AS commune_deleguee_insee,
    cd.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    public.st_x(p.geom) AS x,
    public.st_y(p.geom) AS y,
    round((public.st_x(public.st_transform(p.geom, 4326)))::numeric, 10) AS long,
    round((public.st_y(public.st_transform(p.geom, 4326)))::numeric, 10) AS lat,
    g.id AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM (((((adresse.point_adresse p
     LEFT JOIN adresse.commune c ON ((p.id_commune = c.id_com)))
     LEFT JOIN adresse.referencer_com rc ON ((p.id_commune = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)))
     LEFT JOIN adresse.voie v ON ((p.id_voie = v.id_voie)))
     LEFT JOIN adresse.parcelle g ON ((p.id_parcelle = g.fid)))
UNION
 SELECT ''::text AS uid_adresse,
    concat(c.insee_code, '_', 'xxxx', '_', ld.numero) AS cle_interop,
    c.insee_code AS commune_insee,
    c.commune_nom,
    cd.insee_code AS commune_deleguee_insee,
    cd.commune_deleguee_nom,
    ld.nom_ld AS voie_nom,
    ''::character varying(255) AS lieudit_complement_nom,
    ld.numero,
    ''::text AS suffixe,
    ''::text AS "position",
    public.st_x(ld.geom) AS x,
    public.st_y(ld.geom) AS y,
    round((public.st_x(public.st_transform(ld.geom, 4326)))::numeric, 10) AS long,
    round((public.st_y(public.st_transform(ld.geom, 4326)))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    c.commune_nom AS source,
    ld.date_der_maj
   FROM (((adresse.lieux_dits ld
     LEFT JOIN adresse.commune c ON ((c.id_com = ld.id_com)))
     LEFT JOIN adresse.referencer_com rc ON ((ld.id_com = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)))
  WHERE (ld.integration_ban = true);


-- v_point_adresse

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
    cd.commune_deleguee_nom,
    cd.insee_code AS commune_deleguee_insee
   FROM (((adresse.point_adresse p
     JOIN adresse.commune c ON ((c.id_com = p.id_commune)))
     LEFT JOIN adresse.referencer_com rc ON ((p.id_commune = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)));
  

--v_point_adresse edit_point_adresse_from_view

CREATE TRIGGER edit_point_adresse_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.edit_point_adresse();


-- update lieux_dits

ALTER TABLE adresse.lieux_dits 
DROP COLUMN IF EXISTS commune_deleguee_nom;

ALTER TABLE adresse.lieux_dits 
DROP COLUMN IF EXISTS id_com_del;

ALTER TABLE adresse.lieux_dits 
DROP COLUMN IF EXISTS commune_nom;


-- v_lieux_dits

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
    cd.commune_deleguee_nom,
    cd.insee_code AS commune_deleguee_insee
   FROM (((adresse.lieux_dits ld
     JOIN adresse.commune c ON ((c.id_com = ld.id_com)))
     LEFT JOIN adresse.referencer_com rc ON ((ld.id_com = rc.id_com)))
     LEFT JOIN adresse.commune_deleguee cd ON ((cd.id_com_del = rc.id_com_deleguee)));



-- edit_lieux_dits()

CREATE FUNCTION adresse.edit_lieux_dits() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
 IF (TG_OP = 'INSERT') THEN
    INSERT INTO adresse.lieux_dits(
        geom,
        nom_ld,
        numero,
        integration_ban,
        id_com,
        date_der_maj
    ) VALUES(
        NEW.geom,
        NEW.nom_ld,
        NEW.numero,
        NEW.integration_ban,
        NEW.id_com,
        NEW.date_der_maj
    );
 ELSEIF (TG_OP = 'UPDATE') THEN
    UPDATE adresse.lieux_dits SET 
        geom=NEW.geom,
        nom_ld=NEW.nom_ld,
        numero=NEW.numero,
        integration_ban=NEW.integration_ban,
        id_com=NEW.id_com,
        date_der_maj=NEW.date_der_maj
    WHERE id_ld = OLD.id_ld;
 ELSEIF (TG_OP = 'DELETE') THEN
    DELETE FROM adresse.lieux_dits WHERE id_ld = OLD.id_ld;
 END IF;
RETURN NEW;
END;
$$;


-- v_lieux_dits_edit_lieux_dits_from_view

CREATE TRIGGER edit_lieux_dits_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_lieux_dits FOR EACH ROW EXECUTE PROCEDURE adresse.edit_lieux_dits();


-- function edit_com_lieux_dits()

DROP TRIGGER IF EXISTS infos_lieux_dits ON adresse.lieux_dits;

DROP FUNCTION adresse.lieux_dits();

CREATE OR REPLACE FUNCTION adresse.edit_com_lieux_dits() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    SELECT c.id_com into NEW.id_com
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, c.geom, 0.01);

	NEW.numero = 99999 ;
	NEW.date_der_maj = NOW();
RETURN NEW;
END;
$$;

CREATE TRIGGER infos_lieux_dits BEFORE INSERT OR UPDATE ON adresse.lieux_dits FOR EACH ROW EXECUTE PROCEDURE adresse.edit_com_lieux_dits();

COMMIT;
