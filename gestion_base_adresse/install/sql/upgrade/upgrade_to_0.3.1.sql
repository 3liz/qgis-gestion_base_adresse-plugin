BEGIN;

ALTER TABLE adresse.appartenir_com DROP CONSTRAINT appartenir_com_id_voie_fkey;
ALTER TABLE adresse.appartenir_com ADD CONSTRAINT appartenir_com_id_voie_fkey FOREIGN KEY (id_voie) REFERENCES adresse.voie(id_voie) ON DELETE CASCADE;

COMMIT;
