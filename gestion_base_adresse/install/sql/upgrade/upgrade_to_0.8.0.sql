BEGIN;

--
-- Début FONCTIONS
--


-- check_impair(nombre integer)
CREATE OR REPLACE FUNCTION adresse.check_impair(
	nombre integer)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
/* Cette fonction retourne true (vrai) si le nombre passé en argument est impair 
 
   Exemple :  SELECT checkimpair(12);
              false
*/
BEGIN
 return nombre % 2!=0;
END;
$BODY$;



-- voie_nom_complet_maj()
CREATE FUNCTION adresse.voie_nom_complet_maj()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.nom_complet_maj = Translate(Upper(Concat(NEW.typologie, ' ', NEW.nom)), 'ÀÉÈÊËÏÎÔÖÜÛÇ'::text, 'AEEEEIIOOUUC'::text);
    RETURN NEW;
END;
$BODY$;




-- lieux_dits
CREATE FUNCTION adresse.lieux_dits()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.id_com = (SELECT c.id_com FROM adresse.commune c 
					  WHERE ST_intersects(NEW.geom, c.geom));
	NEW.commune_nom = (SELECT c.commune_nom FROM adresse.commune c
					  WHERE ST_Intersects(NEW.geom, c.geom));
	NEW.id_com_del = (SELECT d.id_com_del FROM adresse.commune_deleguee d
					  WHERE ST_intersects(NEW.geom, d.geom));
	NEW.commune_deleguee_nom = (SELECT d.commune_deleguee_nom FROM adresse.commune_deleguee d
					  WHERE ST_Intersects(NEW.geom, d.geom));
	NEW.numero = 99999 ;
	NEW.date_der_maj = NOW();
RETURN NEW;
END;
$BODY$;


-- adresse.get_code_postal
CREATE FUNCTION adresse.get_code_postal()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.code_postal = (SELECT a.cp FROM adresse.codes_postaux a WHERE ST_intersects(NEW.geom, a.geom));
    RETURN NEW;
END;
$BODY$;



-- adresse.get_commune_deleguee
CREATE FUNCTION adresse.get_commune_deleguee()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.commune_deleguee_nom = (SELECT a.commune_deleguee_nom FROM adresse.commune_deleguee a 
					   WHERE ST_intersects(NEW.geom, a.geom));
	NEW.commune_deleguee_insee = (SELECT b.insee_code FROM adresse.commune_deleguee b
					  WHERE ST_Intersects(NEW.geom, b.geom));					  
RETURN NEW;
END;
$BODY$;


-- adresse.get_commune_insee
CREATE FUNCTION adresse.get_commune_insee()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN
    NEW.commune_insee = (SELECT a.insee_code FROM adresse.commune a 
					   WHERE ST_intersects(NEW.geom, a.geom));
	NEW.commune_nom = (SELECT b.commune_nom FROM adresse.commune b
					  WHERE ST_Intersects(NEW.geom, b.geom));
	
RETURN NEW;
END;
$BODY$;


-- adresse.creation_adresse
CREATE FUNCTION adresse.creation_adresse()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE
BEGIN

    NEW.creation_adresse = 'true';

RETURN NEW;
END;
$BODY$;


--
-- Fin FONCTION
--

--
-- Début TABLE_sequence
--
--alerte_ddfip_id_seq

CREATE SEQUENCE adresse.alerte_ddfip_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;




--codes postaux

CREATE TABLE adresse.codes_postaux
(
    id bigint NOT NULL,
    geom geometry(MultiPolygon,2154),
    cp integer,
    CONSTRAINT codes_postaux_pkey PRIMARY KEY (id)
);





-- commune

ALTER TABLE adresse.commune
    ADD COLUMN calvados_ingenierie boolean;

ALTER TABLE adresse.commune
    ADD COLUMN filtrage character varying(255) COLLATE pg_catalog."default";

ALTER TABLE adresse.commune
    ADD COLUMN diffusion_sna boolean;

ALTER TABLE adresse.commune
    ADD COLUMN date_sna date;

ALTER TABLE adresse.commune
    ADD COLUMN courrier_president character varying(255) COLLATE pg_catalog."default";

ALTER TABLE adresse.commune
    ADD COLUMN poste text COLLATE pg_catalog."default";

ALTER TABLE adresse.commune
    ADD COLUMN nb_locaux integer;

ALTER TABLE adresse.commune
    ADD COLUMN osm boolean;


--import_ban

CREATE TABLE adresse.import_ban
(
    id_ban_position text COLLATE pg_catalog."default",
    id_ban_adresse text COLLATE pg_catalog."default",
    cle_interop text COLLATE pg_catalog."default",
    id_ban_group text COLLATE pg_catalog."default",
    id_fantoir text COLLATE pg_catalog."default",
    numero smallint,
    suffixe text COLLATE pg_catalog."default",
    nom_voie text COLLATE pg_catalog."default",
    code_postal text COLLATE pg_catalog."default",
    nom_commune text COLLATE pg_catalog."default",
    code_insee text COLLATE pg_catalog."default",
    nom_complementaire text COLLATE pg_catalog."default",
    x double precision,
    y double precision,
    lon text COLLATE pg_catalog."default",
    lat text COLLATE pg_catalog."default",
    typ_loc text COLLATE pg_catalog."default",
    source text COLLATE pg_catalog."default",
    date_der_maj text COLLATE pg_catalog."default",
    geom geometry(Point,2154)
);




--import_ban_etat_commune

CREATE TABLE adresse.import_ban_etat_commune
(
    region smallint,
    departement smallint,
    code_commune integer,
    nom_commune text COLLATE pg_catalog."default",
    population bigint,
    type_composition text COLLATE pg_catalog."default",
    nb_lieux_dits integer,
    nb_voies integer,
    nb_numeros integer,
    analyse_adressage_nb_adresses_attendues integer,
    analyse_adressage_ratio integer,
    analyse_adressage_deficit_adresses smallint
);



--import_ban_lo

CREATE TABLE adresse.import_ban_lo
(
    id text COLLATE pg_catalog."default",
    numero text COLLATE pg_catalog."default",
    rep text COLLATE pg_catalog."default",
    nom_voie text COLLATE pg_catalog."default",
    code_postal text COLLATE pg_catalog."default",
    code_insee text COLLATE pg_catalog."default",
    nom_commune text COLLATE pg_catalog."default",
    x text COLLATE pg_catalog."default",
    y text COLLATE pg_catalog."default",
    geom geometry(Point,2154)
);


--lieux_dits_id_ld_seq

CREATE SEQUENCE adresse.lieux_dits_id_ld_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--lieux_dits

CREATE TABLE adresse.lieux_dits
(
    id_ld integer NOT NULL DEFAULT nextval('adresse.lieux_dits_id_ld_seq'::regclass),
    geom geometry(Point,2154),
    nom_ld text COLLATE pg_catalog."default",
    numero integer,
    integration_ban boolean,
    id_com integer NOT NULL,
    commune_nom text COLLATE pg_catalog."default",
    date_der_maj date,
    id_com_del integer,
    commune_deleguee_nom text COLLATE pg_catalog."default",
    CONSTRAINT lieux_dits1_pkey PRIMARY KEY (id_ld),
    CONSTRAINT lieux_dits_id_com_fkey FOREIGN KEY (id_com)
        REFERENCES adresse.commune (id_com) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);



--lieux_dits_id_ld_seq
ALTER SEQUENCE adresse.lieux_dits_id_ld_seq OWNED BY adresse.lieux_dits.id_ld;




-- parcelle_fid_seq
ALTER SEQUENCE adresse.parcelle_fid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- parcelle_fid_seq
ALTER SEQUENCE adresse.parcelle_fid_seq OWNED BY adresse.parcelle.fid;




-- point_adresse
ALTER TABLE adresse.point_adresse
    ALTER COLUMN valide SET NOT NULL;

ALTER TABLE adresse.point_adresse
    ADD COLUMN verif_terrain boolean NOT NULL DEFAULT false;
ALTER TABLE adresse.point_adresse
    ADD COLUMN commune_insee character(5) COLLATE pg_catalog."default";

ALTER TABLE adresse.point_adresse
    ADD COLUMN commune_nom text COLLATE pg_catalog."default";

ALTER TABLE adresse.point_adresse
    ADD COLUMN commune_deleguee_insee character(5) COLLATE pg_catalog."default";

ALTER TABLE adresse.point_adresse
    ADD COLUMN commune_deleguee_nom text COLLATE pg_catalog."default";

ALTER TABLE adresse.point_adresse
    ADD COLUMN complement_adresse character varying(255) COLLATE pg_catalog."default";


ALTER TABLE adresse.point_adresse
    ADD COLUMN lieudit_complement_nom character varying(255) COLLATE pg_catalog."default";


ALTER TABLE adresse.point_adresse
    ADD COLUMN creation_adresse boolean;


-- point_adresse_id_point_seq

ALTER SEQUENCE adresse.point_adresse_id_point_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- point_adresse_id_point_seq
ALTER SEQUENCE adresse.point_adresse_id_point_seq OWNED BY adresse.point_adresse.id_point;



-- voie

ALTER TABLE adresse.voie
    ALTER COLUMN statut_voie_num SET DEFAULT false;

ALTER TABLE adresse.voie
    ADD COLUMN nb_panneaux smallint;

ALTER TABLE adresse.voie
    ADD COLUMN nom_complet_maj text COLLATE pg_catalog."default";

-- voie_id_voie_seq
ALTER SEQUENCE adresse.voie_id_voie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- voie_id_voie_seq
ALTER SEQUENCE adresse.voie_id_voie_seq OWNED BY adresse.voie.id_voie;


-- commune id_com
ALTER TABLE ONLY adresse.commune ALTER COLUMN id_com SET DEFAULT nextval('adresse.commune_id_com_seq'::regclass);

-- commune_deleguee id_com_del
ALTER TABLE ONLY adresse.commune_deleguee ALTER COLUMN id_com_del SET DEFAULT nextval('adresse.commune_deleguee_id_com_del_seq'::regclass);


-- document id_doc
ALTER TABLE ONLY adresse.document ALTER COLUMN id_doc SET DEFAULT nextval('adresse.document_id_doc_seq'::regclass);


-- metadata id
ALTER TABLE ONLY adresse.metadata ALTER COLUMN id SET DEFAULT nextval('adresse.metadata_id_seq'::regclass);


-- parcelle fid
ALTER TABLE ONLY adresse.parcelle ALTER COLUMN fid SET DEFAULT nextval('adresse.parcelle_fid_seq'::regclass);


-- point_adresse id_point
ALTER TABLE ONLY adresse.point_adresse ALTER COLUMN id_point SET DEFAULT nextval('adresse.point_adresse_id_point_seq'::regclass);


-- voie id_voie
ALTER TABLE ONLY adresse.voie ALTER COLUMN id_voie SET DEFAULT nextval('adresse.voie_id_voie_seq'::regclass);

--
-- Fin TABLE_SEQUENCE
--
--
-- Début VIEW
--

-- v_commune
DROP VIEW IF EXISTS adresse.v_commune;
CREATE VIEW adresse.v_commune AS
 SELECT (c.insee_code)::integer AS insee_code,
    c.commune_nom
   FROM adresse.commune c
  ORDER BY c.commune_nom;




--v_export_bal

DROP VIEW IF EXISTS adresse.export_bal;

CREATE VIEW adresse.v_export_bal AS
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    p.commune_insee,
    c.commune_nom,
    p.commune_deleguee_insee,
    p.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    round(st_x(st_transform(p.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(p.geom, 4326))::numeric, 10) AS lat,
    g.geo_parcelle AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v,
    cadastre.geo_parcelle g
  WHERE p.id_commune = c.id_com AND st_intersects(g.geom, p.geom) AND p.id_voie = v.id_voie
UNION
 SELECT ''::text AS uid_adresse,
    concat(commune.insee_code, '_', 'xxxx', '_', ld.numero) AS cle_interop,
    commune.insee_code AS commune_insee,
    ld.commune_nom,
    commune_deleguee.insee_code AS commune_deleguee_insee,
    ld.commune_deleguee_nom,
    ld.nom_ld AS voie_nom,
    ''::character varying(255) AS lieudit_complement_nom,
    ld.numero,
    ''::text AS suffixe,
    ''::text AS "position",
    st_x(ld.geom) AS x,
    st_y(ld.geom) AS y,
    round(st_x(st_transform(ld.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(ld.geom, 4326))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    ld.commune_nom AS source,
    ld.date_der_maj
   FROM adresse.lieux_dits ld
     LEFT JOIN adresse.commune_deleguee ON commune_deleguee.id_com_del = ld.id_com_del
     LEFT JOIN adresse.commune ON commune.id_com = ld.id_com
  WHERE ld.integration_ban = true
UNION
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            ELSE NULL::text
        END AS cle_interop,
    p.commune_insee,
    c.commune_nom,
    p.commune_deleguee_insee,
    p.commune_deleguee_nom,
    v.nom_complet AS voie_nom,
    p.lieudit_complement_nom,
    p.numero,
    p.suffixe,
    p.type_pos AS "position",
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    round(st_x(st_transform(p.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(p.geom, 4326))::numeric, 10) AS lat,
    ''::text AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM adresse.commune c,
    adresse.point_adresse p,
    adresse.voie v
  WHERE p.id_parcelle IS NULL AND p.id_commune = c.id_com AND p.id_voie = v.id_voie;
  
    ALTER VIEW adresse.vue_com RENAME TO v_commune;





--v_export_pts

CREATE OR REPLACE VIEW adresse.v_export_pts
 AS
 SELECT pa.commune_insee AS "Code INSEE",
    pa.commune_nom AS "Commune",
    pa.commune_deleguee_insee AS "Code INSEE commune déléguée",
    pa.commune_deleguee_nom AS "Commune déléguée",
    pa.numero AS "Numéro",
    pa.suffixe AS "Suffixe",
    voie.typologie AS "Typologie",
    voie.nom AS "Nom de la voie",
    voie.nom_complet AS "Nom complet",
    pa.adresse_complete AS "Adresse complète",
    pa.lieudit_complement_nom AS "Lieu-dit",
    pa.code_postal AS "Code postal",
    pa.type_pos AS "Position",
    pa.valide AS "Point validé",
    pa.achat_plaque_numero AS "Achat de la plaque",
    pa.commune_nom AS "Source",
    pa.date_modif AS "Date dernière modification",
    st_x(pa.geom) AS "X",
    st_y(pa.geom) AS "Y",
    st_x(st_transform(pa.geom, 4326)) AS "Longitude",
    st_y(st_transform(pa.geom, 4326)) AS "Latitude"
   FROM adresse.point_adresse pa
     LEFT JOIN adresse.voie ON voie.id_voie = pa.id_voie
  WHERE pa.commune_insee = '14660'::bpchar
  ORDER BY voie.nom_complet, pa.numero;



--v_export_voies


CREATE OR REPLACE VIEW adresse.v_export_voies
 AS
 SELECT DISTINCT voie.id_voie AS "ID",
    pa.commune_insee AS "Code INSEE",
    pa.commune_nom AS "Commune",
    pa.commune_deleguee_insee AS "Code INSEE Commune déléguée",
    pa.commune_deleguee_nom AS "Commune déléguée",
    voie.typologie AS "Typologie",
    voie.nom AS "Nom de la voie",
    voie.nom_complet AS "Nom complet",
    voie.nom_complet_maj AS "Nom complet majuscule",
    voie.type_num AS "Type numérotation",
    voie.nb_point AS "Nombre de points",
    voie.longueur AS "Longueur",
    voie.date_modif AS "Date dernière modification",
    voie.achat_plaque_voie AS "Achat du panneau",
    voie.nb_panneaux AS "Nombre de panneaux"
   FROM adresse.point_adresse pa
     LEFT JOIN adresse.voie ON voie.id_voie = pa.id_voie
     LEFT JOIN adresse.commune ON commune.id_com = pa.id_commune
  WHERE commune.insee_code = '14660'::bpchar AND st_intersects(commune.geom, pa.geom) OR pa.commune_insee = '14528'::bpchar AND st_within(commune.geom, voie.geom)
UNION
 SELECT DISTINCT voie.id_voie AS "ID",
    commune.insee_code AS "Code INSEE",
    commune.commune_nom AS "Commune",
    commune_deleguee.insee_code AS "Code INSEE Commune déléguée",
    commune_deleguee.commune_deleguee_nom AS "Commune déléguée",
    voie.typologie AS "Typologie",
    voie.nom AS "Nom de la voie",
    voie.nom_complet AS "Nom complet",
    voie.nom_complet_maj AS "Nom complet majuscule",
    voie.type_num AS "Type numérotation",
    voie.nb_point AS "Nombre de points",
    voie.longueur AS "Longueur",
    voie.date_modif AS "Date dernière modification",
    voie.achat_plaque_voie AS "Achat du panneau",
    voie.nb_panneaux AS "Nombre de panneaux"
   FROM adresse.voie
     LEFT JOIN adresse.commune ON st_intersects(commune.geom, voie.geom)
     LEFT JOIN adresse.commune_deleguee ON st_intersects(commune_deleguee.geom, voie.geom)
  WHERE commune.insee_code = '14660'::bpchar AND (voie.nb_point IS NULL OR voie.nb_point = 0)
  ORDER BY 9;


--
-- Fin VIEW
--

--
-- Début INDEX
--


CREATE INDEX sidx_codes_postaux_geom
    ON adresse.codes_postaux USING gist
    (geom)
    ;


CREATE INDEX sidx_lieux_dits1_geom
    ON adresse.lieux_dits USING gist
    (geom)
    ;

CREATE INDEX sidx_parcelle2_geom
    ON adresse.parcelle USING gist
    (geom)
    ;


--
-- Fin INDEX
--
--
-- Début TRIGGER

CREATE TRIGGER infos_lieux_dits
    BEFORE INSERT OR UPDATE 
    ON adresse.lieux_dits
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.lieux_dits();

CREATE TRIGGER get_code_postal
    BEFORE INSERT OR UPDATE 
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.get_code_postal();


CREATE TRIGGER get_commune_deleguee
    BEFORE INSERT OR UPDATE 
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.get_commune_deleguee();

CREATE TRIGGER get_commune_insee
    BEFORE INSERT OR UPDATE 
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.get_commune_insee();

CREATE TRIGGER creation_adresse
    BEFORE INSERT
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.creation_adresse();


DROP TRIGGER get_commune ON adresse.point_adresse;
CREATE TRIGGER get_commune
    BEFORE INSERT OR UPDATE 
    ON adresse.point_adresse
    FOR EACH ROW 
    EXECUTE PROCEDURE adresse.update_commune();

CREATE TRIGGER nom_complet_maj
    BEFORE INSERT OR UPDATE 
    ON adresse.voie
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.voie_nom_complet_maj();


--
-- FIN TRIGGER
--
--
-- Début COMMENT
--


-- commune.id_com
COMMENT ON COLUMN adresse.commune.id_com IS 'Identifiant unique de la commune';


-- commune.commune_nom
COMMENT ON COLUMN adresse.commune.commune_nom IS 'Nom de la commune';


-- commune.insee_code
COMMENT ON COLUMN adresse.commune.insee_code IS 'Code INSEE de la commune';


-- commune.intercom
COMMENT ON COLUMN adresse.commune.intercom IS 'Intercommunalité dans laquelle la commune se trouve';


-- commune.fibre
COMMENT ON COLUMN adresse.commune.fibre IS 'Situation de la commune dans le déploiement de la fibre';


-- commune.phase_fibre
COMMENT ON COLUMN adresse.commune.phase_fibre IS 'Numéro de phase du déploiement de la fibre sur la commune';


-- commune.actif
COMMENT ON COLUMN adresse.commune.actif IS 'Si la commune se fait accompagner par le département';


-- commune.nom_referent
COMMENT ON COLUMN adresse.commune.nom_referent IS 'Nom et Prénom de la personne référente sur le projet d’adressage dans la commune';


-- commune.tel_referent
COMMENT ON COLUMN adresse.commune.tel_referent IS 'Numéro de téléphone de la personne référente sur le projet d’adressage dans la commune';


-- commune.mail_referent
COMMENT ON COLUMN adresse.commune.mail_referent IS 'Adresse mail de la personne référente sur le projet d’adressage dans la commune';


-- commune.situation
COMMENT ON COLUMN adresse.commune.situation IS 'État d’avancement du projet d’adressage de la commune';


-- commune.commenter
COMMENT ON COLUMN adresse.commune.commenter IS 'Commentaires généraux sur le projet de la commune, l’avancement, le dernier contact, le prochain rendez-vous';


-- commune.date_delib
COMMENT ON COLUMN adresse.commune.date_delib IS 'Date à laquelle la délibération sur les dénominations des voies a été prise.';


-- commune.diffusion_dgfip
COMMENT ON COLUMN adresse.commune.diffusion_dgfip IS 'Les adresses ont-elles été envoyées à la DGFIP ?';


-- commune.date_dgfip
COMMENT ON COLUMN adresse.commune.date_dgfip IS 'Date d’envoi des données à la DGFIP.';


-- commune.diffusion_ban
COMMENT ON COLUMN adresse.commune.diffusion_ban IS 'Les adresses ont-elles été remontées dans la Base Adresse Nationale ?';


-- commune.date_ban
COMMENT ON COLUMN adresse.commune.date_ban IS 'Date d’envoi des données dans la BAN.';


-- commune.geom
COMMENT ON COLUMN adresse.commune.geom IS 'Geometrie de l''objet';

-- commune.id_com
COMMENT ON COLUMN adresse.commune.id_com   IS 'Identifiant unique de la commune';

-- commune.id_com
COMMENT ON COLUMN adresse.commune.id_com   IS 'Geometrie de l''objet';

-- document.lien
COMMENT ON COLUMN adresse.document.lien IS 'Chemin de stockage du document';

-- metadata
COMMENT ON TABLE adresse.metadata IS 'Métadonnée de la structure du schéma, en lien avec la version du plugin QGIS. C''est utilisé pour les scripts de migration de la structure entre 2 versions.';


-- metadata.id
COMMENT ON COLUMN adresse.metadata.id IS 'Identifiant de la version';


-- metadata.me_version
COMMENT ON COLUMN adresse.metadata.me_version IS 'Version. Ex: 1.0.2';


-- metadata.me_version_date
COMMENT ON COLUMN adresse.metadata.me_version_date IS 'Date de la version. Ex: 2019-06-01';


-- point_adresse.id_point
COMMENT ON COLUMN adresse.point_adresse.id_point IS 'Identifiant unique du point adresse';


-- point_adresse.numero
COMMENT ON COLUMN adresse.point_adresse.numero IS 'Numéro de l’adresse';


-- point_adresse.suffixe
COMMENT ON COLUMN adresse.point_adresse.suffixe IS 'Extension du numéro (bis, ter, A, B...)';


-- point_adresse.adresse_complete
COMMENT ON COLUMN adresse.point_adresse.adresse_complete IS 'Concaténation du numéro, de l’extension, de la typologie et du nom de la voie';


-- point_adresse.code_postal
COMMENT ON COLUMN adresse.point_adresse.code_postal IS 'Code postal auquel appartient de point adresse';


-- point_adresse.type_pos
COMMENT ON COLUMN adresse.point_adresse.type_pos IS 'Type de positionnement du point adresse';


-- point_adresse.achat_plaque_numero
COMMENT ON COLUMN adresse.point_adresse.achat_plaque_numero IS 'Achat de la plaque nécessaire ou non ?';


-- point_adresse.createur
COMMENT ON COLUMN adresse.point_adresse.createur IS 'Nom de l’utilisateur qui a créé le point';


-- point_adresse.date_creation
COMMENT ON COLUMN adresse.point_adresse.date_creation IS 'Date et heure à laquelle le point adresse a été créé';


-- point_adresse.modificateur
COMMENT ON COLUMN adresse.point_adresse.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';


-- point_adresse.date_modif
COMMENT ON COLUMN adresse.point_adresse.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche du point a été apportée';


-- point_adresse.erreur
COMMENT ON COLUMN adresse.point_adresse.erreur IS 'Présence d’une erreur ou non';


-- point_adresse.commentaire
COMMENT ON COLUMN adresse.point_adresse.commentaire IS 'Commentaire';


-- point_adresse.geom
COMMENT ON COLUMN adresse.point_adresse.geom IS 'Géométrie de l’objet';


-- point_adresse.id_voie
COMMENT ON COLUMN adresse.point_adresse.id_voie IS 'Identifiant de la voie à laquelle appartient le point adresse';


-- point_adresse.id_commune
COMMENT ON COLUMN adresse.point_adresse.id_commune IS 'Identifiant de la commune à laquelle appartient le point adresse';


-- point_adresse.id_parcelle
COMMENT ON COLUMN adresse.point_adresse.id_parcelle IS 'Identifiant de la parcelle à laquelle appartient le point adresse';


-- point_adresse.valide
COMMENT ON COLUMN adresse.point_adresse.valide IS 'Le point d''adresse est valide ou non';


-- point_adresse.verif_terrain
COMMENT ON COLUMN adresse.point_adresse.verif_terrain IS 'la saisie du point adresse nécessite une vérification terrain';


-- point_adresse.complement_adresse
COMMENT ON COLUMN adresse.point_adresse.complement_adresse IS 'En minuculte et sans espace (ex : lesmimosas)';


-- point_adresse.lieudit_complement_nom
COMMENT ON COLUMN adresse.point_adresse.lieudit_complement_nom IS 'Nom du hameau ou lieu-dit local';



-- voie.id_voie
COMMENT ON COLUMN adresse.voie.id_voie IS 'Identifiant unique de la voie';


-- voie.typologie
COMMENT ON COLUMN adresse.voie.typologie IS 'Typologie de la voie';


-- voie.nom
COMMENT ON COLUMN adresse.voie.nom IS 'Nom de la voie';


-- voie.nom_complet
COMMENT ON COLUMN adresse.voie.nom_complet IS 'Concaténation de la typologie et du nom de la voie';


-- voie.type_num
COMMENT ON COLUMN adresse.voie.type_num IS 'Type de numérotation de la voie';


-- voie.statut_voie_num
COMMENT ON COLUMN adresse.voie.statut_voie_num IS 'Statut accordé à la voie permettant son verrouillage ou son déverrouillage pour la saisie d’une adresse';


-- voie.statut_voie
COMMENT ON COLUMN adresse.voie.statut_voie IS 'Statut accordé à la voie au niveau du plan d’adressage';


-- voie.sens_numerotation
COMMENT ON COLUMN adresse.voie.sens_numerotation IS 'Si les nombres pairs sont à droite ou à gauche de la voie par rapport au sens de dessin';


-- voie.achat_plaque_voie
COMMENT ON COLUMN adresse.voie.achat_plaque_voie IS 'Achat de la plaque nécessaire ou non ?';


-- voie.nb_point
COMMENT ON COLUMN adresse.voie.nb_point IS 'Nombre de points adresses rattachés à cette voie';


-- voie.createur
COMMENT ON COLUMN adresse.voie.createur IS 'Nom de l’utilisateur qui a créé la voie';


-- voie.date_creation
COMMENT ON COLUMN adresse.voie.date_creation IS 'Date et heure à laquelle la voie a été créée';


-- voie.modificateur
COMMENT ON COLUMN adresse.voie.modificateur IS 'Nom de l’utilisateur qui a effectué la dernière modification';


-- voie.date_modif
COMMENT ON COLUMN adresse.voie.date_modif IS 'Date et heure à laquelle la dernière modification sur la fiche de la voie a été apportéee';


-- voie.longueur
COMMENT ON COLUMN adresse.voie.longueur IS 'Longueur de la voie en mètres';


-- voie.code_fantoir
COMMENT ON COLUMN adresse.voie.code_fantoir IS 'Code fantoir pour de la DGFIP';


-- voie.delib
COMMENT ON COLUMN adresse.voie.delib IS 'Spécifie si la commune souhaite délibérer sur la voie';


-- voie.geom
COMMENT ON COLUMN adresse.voie.geom IS 'Géométrie de l’objet';


--
-- Fin COMMENT
--

COMMIT;
