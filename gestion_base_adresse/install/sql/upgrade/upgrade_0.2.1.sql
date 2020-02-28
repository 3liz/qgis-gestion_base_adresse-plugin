BEGIN;

ALTER TABLE adresse.point_adresse RENAME COLUMN date_modif_point TO date_modif;
ALTER TABLE adresse.point_adresse RENAME COLUMN createur_point TO createur;
ALTER TABLE adresse.point_adresse RENAME COLUMN modificateur_point TO modificateur;
ALTER TABLE adresse.point_adresse RENAME COLUMN date_creation_point TO date_creation;

COMMIT;
