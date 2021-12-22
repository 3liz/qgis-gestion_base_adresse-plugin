BEGIN;

CREATE FUNCTION adresse.reset_referencer_com() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

DROP INDEX IF EXISTS adresse.idx_tmp_centroide_communes;
CREATE INDEX idx_tmp_centroide_communes ON adresse.commune_deleguee (ST_PointOnSurface(geom));
TRUNCATE adresse.referencer_com RESTART IDENTITY;

INSERT INTO adresse.referencer_com
SELECT
	c.id_com AS id_com,
	cd.id_com_del AS id_com_del
FROM adresse.commune_deleguee cd
JOIN adresse.commune AS c
	ON St_Contains(c.geom, ST_PointOnSurface(cd.geom))
;

DROP INDEX IF EXISTS adresse.idx_tmp_centroide_communes;
END;
$$;

COMMENT ON FUNCTION adresse.reset_referencer_com IS 'Permet la réinitialisation de la table adresse.referencer_com en faisant une intersection entre adresse.commune_deleguee et adresse.commune';

COMMIT;
