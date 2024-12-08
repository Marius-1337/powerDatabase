START TRANSACTION;
SET SCHEMA 'mapping';

CREATE TABLE if not exists mapping.entsoe_fueltype (
    entsoecode varchar(3),
    fuel_id serial4,
	name varchar NOT NULL
);
COMMIT;
