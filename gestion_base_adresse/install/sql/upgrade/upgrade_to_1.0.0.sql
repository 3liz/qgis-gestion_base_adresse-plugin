BEGIN;

-- DROP TRIGGER point_adresse get_parcelle
DROP TRIGGER IF EXISTS get_parcelle ON adresse.point_adresse;

-- DROP FUNCTION get_parcelle()
DROP FUNCTION IF EXISTS adresse.get_parcelle();

-- CREATE FUNCTION get_parcelle() with upgrade
CREATE FUNCTION adresse.get_parcelle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
    NEW.id_parcelle = (SELECT p.fid FROM adresse.parcelle p WHERE ST_intersects(NEW.geom, p.geom) LIMIT 1);
    RETURN NEW;
END;
$$;

-- CREATE TRIGGER point_adresse get_parcelle
CREATE TRIGGER get_parcelle BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_parcelle();

-- Drop views to change field type
DROP VIEW adresse.v_point_adresse;
DROP VIEW adresse.v_export_bal;

ALTER TABLE adresse.point_adresse
ALTER COLUMN complement_adresse TYPE text;

ALTER TABLE adresse.point_adresse
ALTER COLUMN lieudit_complement_nom TYPE text;

ALTER TABLE adresse.commune
ALTER COLUMN key_lizmap_filter TYPE text;

ALTER TABLE adresse.commune
ALTER COLUMN courrier_president TYPE text;

ALTER TABLE adresse.parcelle
ALTER COLUMN commune TYPE text;

ALTER TABLE adresse.parcelle
ALTER COLUMN prefixe TYPE text;

ALTER TABLE adresse.parcelle
ALTER COLUMN section TYPE text;

ALTER TABLE adresse.parcelle
ALTER COLUMN numero TYPE text;

--recreate views and trigger
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

-- v_point_adresse edit_point_adresse_from_view
CREATE TRIGGER edit_point_adresse_from_view INSTEAD OF INSERT OR DELETE OR UPDATE ON adresse.v_point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.edit_point_adresse();

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

-- parcelle parcelle_id_key
ALTER TABLE ONLY adresse.parcelle
    ADD CONSTRAINT parcelle_id_key UNIQUE (id);

ALTER TABLE adresse.parcelle ALTER COLUMN id SET NOT NULL;

ALTER TABLE adresse.point_adresse ALTER COLUMN valide SET DEFAULT true;
ALTER TABLE adresse.point_adresse ALTER COLUMN valide SET NOT NULL;

ALTER TABLE adresse.point_adresse ALTER COLUMN erreur SET DEFAULT false;
ALTER TABLE adresse.point_adresse ALTER COLUMN erreur SET NOT NULL;

ALTER TABLE adresse.point_adresse ALTER COLUMN achat_plaque_numero SET DEFAULT false;
ALTER TABLE adresse.point_adresse ALTER COLUMN achat_plaque_numero SET NOT NULL;

ALTER TABLE adresse.point_adresse ALTER COLUMN verif_terrain SET DEFAULT false;
ALTER TABLE adresse.point_adresse ALTER COLUMN verif_terrain SET NOT NULL;

COMMIT;
