BEGIN;

DROP VIEW IF EXISTS adresse.export_bal;
CREATE OR REPLACE VIEW adresse.export_bal
 AS
 SELECT p.id_point,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
        END AS cle_interop,
    ''::text AS uid_adresse,
    v.nom_complet AS voie_nom,
    p.numero,
    p.suffixe,
    c.commune_nom,
    p.type_pos AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    st_x(st_transform(p.geom, 4326)) AS long,
    st_y(st_transform(p.geom, 4326)) AS lat,
    ''::text AS source,
    p.date_modif AS date_derniere_maj,
    c.insee_code AS code_insee
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
  WHERE p.id_commune = c.id_com AND p.id_voie = v.id_voie;

DROP VIEW IF EXISTS adresse.vue_com;
CREATE OR REPLACE VIEW adresse.vue_com
   AS
   SELECT c.insee_code::integer AS insee_code,
      c.commune_nom
     FROM adresse.commune c
     ORDER BY c.commune_nom;

CREATE OR REPLACE FUNCTION adresse.get_parcelle() RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
BEGIN
    NEW.id_parcelle = (SELECT p.fid FROM adresse.parcelle p WHERE ST_intersects(NEW.geom, p.geom));
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS get_parcelle ON adresse.point_adresse;
CREATE TRIGGER get_parcelle
    BEFORE INSERT OR UPDATE
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.get_parcelle();

ALTER TABLE adresse.parcelle ALTER COLUMN id TYPE text;
ALTER TABLE adresse.parcelle ALTER COLUMN created set default now();
ALTER TABLE adresse.parcelle ALTER COLUMN updated set default now();
ALTER TABLE adresse.commune ADD COLUMN adresse_mairie text;
ALTER TABLE adresse.commune ADD COLUMN code_postal text;
ALTER TABLE adresse.commune ADD COLUMN maire text;

COMMIT;
