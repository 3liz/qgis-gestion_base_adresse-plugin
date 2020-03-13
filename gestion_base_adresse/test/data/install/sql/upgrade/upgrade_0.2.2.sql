BEGIN;


DROP INDEX IF EXISTS adresse.commune_geom_idx;
CREATE INDEX ON adresse.commune USING GIST (geom);

DROP INDEX IF EXISTS adresse.commune_deleguee_geom_idx;
CREATE INDEX ON adresse.commune_deleguee USING GIST (geom);

DROP INDEX IF EXISTS adresse.parcelle_geom_idx;
CREATE INDEX ON adresse.parcelle USING GIST (geom);

DROP INDEX IF EXISTS adresse.voie_geom_idx;
CREATE INDEX ON adresse.voie USING GIST (geom);

DROP INDEX IF EXISTS adresse.point_adresse_geom_idx;
CREATE INDEX ON adresse.point_adresse USING GIST (geom);

COMMIT;
