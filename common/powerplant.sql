SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET escape_string_warning=off;
SET default_tablespace = '';
SET default_table_access_method = heap;

START TRANSACTION;
SET SCHEMA 'common';
SET CONSTRAINTS ALL DEFERRED;

CREATE TABLE IF NOT EXISTS common.powerplant (
	id serial4 NOT NULL,
	eic varchar(16) NOT NULL,
	"name" varchar NOT NULL,
	validfrom date NOT NULL,
	validthrough date NULL,
	status varchar NULL,
	fueltype int4 NOT NULL,
	location point NULL,
	capacity int2,
	area int4 NOT NULL,
	voltage int4,
	datasource int4 NOT NULL,
	lastupdate TIMESTAMPTZ NOT NULL,
	CONSTRAINT powerplant_pk PRIMARY KEY (id)
);

-- common.powerplant foreign keys
CREATE UNIQUE INDEX IF NOT EXISTS eic_uniquepowerplant_index ON powerplant(eic);
ALTER TABLE common.powerplant DROP CONSTRAINT IF EXISTS "powerplant_fueltype_fk";
ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);
ALTER TABLE common.powerplant DROP CONSTRAINT IF EXISTS "powerplant_area_fk";
ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_area_fk FOREIGN KEY (area) REFERENCES common.area(id);
ALTER TABLE common.powerplant DROP CONSTRAINT IF EXISTS "powerplant_datasource_fk";
ALTER TABLE common.powerplant ADD CONSTRAINT powerplant_datasource_fk FOREIGN KEY(datasource) REFERENCES common.datasource(id);


COMMIT;