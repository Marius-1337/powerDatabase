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
  powerplant varchar(16) NOT NULL,
  name varchar NOT NULL,
  validfrom date NOT NULL,
  validthrough date NULL,
  status varchar NULL,
  fueltype int4 NOT NULL,
  location varchar,
  capacity int2,
  Datasource int4 NOT NULL, 
  lastupdate TIMESTAMPTZ NOT NULL,
  CONSTRAINT unit_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX IF NOT EXISTS eic_uniqueunit_index ON unit(eic);

ALTER TABLE common.unit DROP CONSTRAINT IF EXISTS unit_plant_fk;
ALTER TABLE common.unit ADD CONSTRAINT unit_plant_fk FOREIGN KEY (powerplant) REFERENCES common.powerplant(eic);

ALTER TABLE common.unit DROP CONSTRAINT IF EXISTS unit_fueltype_fk;
ALTER TABLE common.unit ADD CONSTRAINT unit_fueltype_fk FOREIGN KEY (fueltype) REFERENCES common.fueltype(id);

COMMIT;
