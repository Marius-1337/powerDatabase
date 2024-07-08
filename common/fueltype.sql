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

CREATE TABLE IF NOT EXISTS common.fueltype (
	id serial4 NOT NULL,
	name varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT fueltype_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX IF NOT EXISTS fuelname ON fueltype(name);

COMMIT;