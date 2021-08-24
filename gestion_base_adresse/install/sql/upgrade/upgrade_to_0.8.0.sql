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
    SELECT c.id_com into NEW.id_com
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

    SELECT c.commune_nom into NEW.commune_nom 
    FROM adresse.commune c 
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

	SELECT d.id_com_del into NEW.id_com_del
    FROM adresse.commune_deleguee d
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

    SELECT  d.commune_deleguee_nom into NEW.commune_deleguee_nom
    FROM adresse.commune_deleguee d
	WHERE ST_DWithin(NEW.geom, d.geom, 0.01);

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
    SELECT a.cp into NEW.code_postal FROM adresse.codes_postaux a WHERE ST_intersects(NEW.geom, a.geom);
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

CREATE FUNCTION adresse.edit_point_adresse() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
 IF (TG_OP = 'INSERT') THEN
    INSERT INTO adresse.point_adresse(
        numero,
        suffixe,
        id_voie,
        adresse_complete,
        type_pos,
        achat_plaque_numero,
        valide,
        verif_terrain,
        createur,
        date_creation,
        modificateur,
        date_modif,
        erreur,
        commentaire,
        geom
    ) VALUES(
        NEW.numero,
        NEW.suffixe,
        NEW.id_voie,
        NEW.adresse_complete,
        NEW.type_pos,
        NEW.achat_plaque_numero,
        NEW.valide,
        NEW.verif_terrain,
        NEW.createur,
        NEW.date_creation,
        NEW.modificateur,
        NEW.date_modif,
        NEW.erreur,
        NEW.commentaire,
        NEW.geom
    );
 ELSEIF (TG_OP = 'UPDATE') THEN
    UPDATE adresse.point_adresse SET 
        numero=NEW.numero,
        suffixe=NEW.suffixe,
        id_voie=NEW.id_voie,
        adresse_complete=NEW.adresse_complete,
        type_pos=NEW.type_pos,
        achat_plaque_numero=NEW.achat_plaque_numero,
        valide=NEW.valide,
        verif_terrain=NEW.verif_terrain,
        createur=NEW.createur,
        date_creation=NEW.date_creation,
        modificateur=NEW.modificateur,
        date_modif=NEW.date_modif,
        erreur=NEW.erreur,
        commentaire=NEW.commentaire,
        geom=NEW.geom
    WHERE id_point = OLD.id_point;
 ELSEIF (TG_OP = 'DELETE') THEN
    DELETE FROM adresse.point_adresse WHERE id_point = OLD.id_point;
 END IF;
RETURN NEW;
END;
$$;


DROP FUNCTION IF EXISTS adresse.update_commune() CASCADE;
-- update_appartenir_com()
CREATE FUNCTION adresse.update_appartenir_com() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    leid integer;
BEGIN
    INSERT INTO adresse.appartenir_com(id_voie, id_com) SELECT NEW.id_voie, c.id_com from adresse.commune c where ST_intersects(NEW.geom, c.geom);
    RETURN NEW;
END;
$$;


-- get_commune()
CREATE FUNCTION adresse.get_commune() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    leid integer;
BEGIN
    SELECT c.id_com into leid FROM adresse.commune c WHERE st_intersects(New.geom,c.geom);
    NEW.id_commune = leid;
    RETURN NEW;
END;
$$;

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
    geom public.geometry(MultiPolygon,2154),
    cp text,
    CONSTRAINT codes_postaux_pkey PRIMARY KEY (id)
);





-- commune

ALTER TABLE adresse.commune
    ADD COLUMN acc_ingenierie_publique boolean;

ALTER TABLE adresse.commune
    ADD COLUMN key_lizmap_filter character varying(255) COLLATE pg_catalog."default";

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
    geom public.geometry(Point,2154)
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
    geom public.geometry(Point,2154)
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
    geom public.geometry(Point,2154),
    nom_ld text COLLATE pg_catalog."default",
    numero integer,
    integration_ban boolean,
    id_com integer NOT NULL,
    commune_nom text COLLATE pg_catalog."default",
    date_der_maj date,
    id_com_del integer,
    commune_deleguee_nom text COLLATE pg_catalog."default",
    CONSTRAINT lieux_dits_pkey PRIMARY KEY (id_ld),
    CONSTRAINT lieux_dits_id_com_fkey FOREIGN KEY (id_com)
        REFERENCES adresse.commune (id_com) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);



--lieux_dits_id_ld_seq
ALTER SEQUENCE adresse.lieux_dits_id_ld_seq OWNED BY adresse.lieux_dits.id_ld;

-- point_adresse
ALTER TABLE adresse.point_adresse
    ALTER COLUMN valide SET NOT NULL;

ALTER TABLE adresse.point_adresse
    ADD COLUMN verif_terrain boolean NOT NULL DEFAULT false;
-- ALTER TABLE adresse.point_adresse
--     ADD COLUMN commune_insee character(5) COLLATE pg_catalog."default";

-- ALTER TABLE adresse.point_adresse
--     ADD COLUMN commune_nom text COLLATE pg_catalog."default";

-- ALTER TABLE adresse.point_adresse
--     ADD COLUMN commune_deleguee_insee character(5) COLLATE pg_catalog."default";

-- ALTER TABLE adresse.point_adresse
--     ADD COLUMN commune_deleguee_nom text COLLATE pg_catalog."default";

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



--
-- Fin TABLE_SEQUENCE
--
--
-- Début VIEW
--



--v_point_adresse
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
   FROM adresse.point_adresse p
    INNER JOIN adresse.commune c ON st_intersects(c.geom, p.geom)
	LEFT JOIN adresse.commune_deleguee cd ON st_intersects(cd.geom, p.geom);


--v_export_bal

DROP VIEW IF EXISTS adresse.v_export_bal;

CREATE VIEW adresse.v_export_bal AS
 SELECT ''::text AS uid_adresse,
        CASE
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NULL AND v.code_fantoir IS NOT NULL THEN concat(c.insee_code, '_', v.code_fantoir::text, '_', lpad(p.numero::text, 5, '0'::text))
            WHEN p.suffixe IS NOT NULL AND v.code_fantoir IS NULL THEN concat(c.insee_code, '_', 'xxxx', '_', lpad(p.numero::text, 5, '0'::text), '_', p.suffixe)
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
    st_x(p.geom) AS x,
    st_y(p.geom) AS y,
    round(st_x(st_transform(p.geom, 4326))::numeric, 10) AS long,
    round(st_y(st_transform(p.geom, 4326))::numeric, 10) AS lat,
    g.id AS cad_parcelles,
    c.commune_nom AS source,
    p.date_modif AS date_der_maj
   FROM adresse.point_adresse p
    LEFT JOIN adresse.commune_deleguee cd ON (st_intersects(cd.geom, p.geom))
    LEFT JOIN adresse.commune c ON (p.id_commune = c.id_com)
    LEFT JOIN adresse.voie v ON (p.id_voie = v.id_voie)
    LEFT JOIN adresse.parcelle g ON (st_intersects(g.geom, p.geom))
UNION
 SELECT ''::text AS uid_adresse,
    concat(c.insee_code, '_', 'xxxx', '_', ld.numero) AS cle_interop,
    c.insee_code AS commune_insee,
    ld.commune_nom,
    cd.insee_code AS commune_deleguee_insee,
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
     LEFT JOIN adresse.commune_deleguee cd ON cd.id_com_del = ld.id_com_del
     LEFT JOIN adresse.commune c ON c.id_com = ld.id_com
  WHERE ld.integration_ban = true;
  
ALTER VIEW IF EXISTS adresse.vue_com RENAME TO v_commune;


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


CREATE INDEX sidx_lieux_dits_geom
    ON adresse.lieux_dits USING gist
    (geom)
    ;

CREATE INDEX sidx_parcelle_geom
    ON adresse.parcelle USING gist
    (geom)
    ;


--
-- Fin INDEX
--
--
-- Début TRIGGER

CREATE TRIGGER edit_point_adresse_from_view
    INSTEAD OF INSERT OR UPDATE OR DELETE
    ON adresse.v_point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.edit_point_adresse();

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


CREATE TRIGGER creation_adresse
    BEFORE INSERT
    ON adresse.point_adresse
    FOR EACH ROW
    EXECUTE PROCEDURE adresse.creation_adresse();

DROP TRIGGER IF EXISTS get_commune ON adresse.point_adresse;
DROP TRIGGER IF EXISTS point_adresse_get_commune ON adresse.point_adresse;
CREATE TRIGGER point_adresse_get_commune BEFORE INSERT OR UPDATE ON adresse.point_adresse FOR EACH ROW EXECUTE PROCEDURE adresse.get_commune();


DROP TRIGGER IF EXISTS get_commune ON adresse.voie;
DROP TRIGGER IF EXISTS voie_get_commune ON adresse.voie;
CREATE TRIGGER voie_get_commune AFTER INSERT ON adresse.voie FOR EACH ROW EXECUTE PROCEDURE adresse.update_appartenir_com();

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
COMMENT ON COLUMN adresse.point_adresse.complement_adresse IS 'En minuscule et sans espace (ex : lesmimosas)';


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
