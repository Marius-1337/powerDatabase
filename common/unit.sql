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

CREATE TABLE IF NOT EXISTS common.unit (
  id serial4 NOT NULL,
  eic varchar(16) NOT NULL,
  powerplant_id serial4 NOT NULL,
  name varchar NOT NULL,
  validfrom date NULL,
  validthrough date NULL,
  status varchar NULL,
  fueltype int4 NOT NULL,
  location varchar,
  capacity float,
  voltage float,
  datasource int4 NOT NULL, 
  lastupdate TIMESTAMPTZ NOT NULL,
  CONSTRAINT unit_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX IF NOT EXISTS eic_uniqueunit_index ON unit(eic);

ALTER TABLE common.unit DROP CONSTRAINT IF EXISTS powerplant_id;
ALTER TABLE common.unit ADD CONSTRAINT unit_powerplant_id FOREIGN KEY (powerplant_id) REFERENCES common.powerplant(id);

ALTER TABLE common.unit DROP CONSTRAINT IF EXISTS unit_fueltype_fk;
ALTER TABLE common.unit ADD CONSTRAINT unit_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);

ALTER TABLE common.unit DROP CONSTRAINT IF EXISTS unit_datasource_fk;
ALTER TABLE common.unit ADD CONSTRAINT unit_datasource_fk FOREIGN KEY(datasource) REFERENCES common.datasource(id);

COMMIT;
