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


CREATE TABLE  IF NOT EXISTS common.border (
    id serial4 NOT NULL,
	"name" varchar NOT NULL,
    fromarea varchar(16) NOT NULL,
    toarea varchar(16) NOT NULL,
    validfrom date NULL,
	validthrough date NULL,
	status varchar NULL,
    capacity int2,
    voltage int4,
    datasource int4 NOT NULL,
    lastupdate TIMESTAMPTZ NOT NULL,
    CONSTRAINT unique_border UNIQUE(fromarea,toarea),
    CONSTRAINT border_pk PRIMARY KEY (id)
);

-- common.border foreign keys
ALTER TABLE "border" DROP CONSTRAINT IF EXISTS "area_from_fk";
ALTER TABLE "border" ADD CONSTRAINT area_from_fk FOREIGN KEY (fromarea) REFERENCES common.area(eic);
ALTER TABLE "border" DROP CONSTRAINT IF EXISTS "area_to_fk";
ALTER TABLE "border" ADD CONSTRAINT area_to_fk FOREIGN KEY (toarea) REFERENCES common.area(eic);
ALTER TABLE "border" DROP CONSTRAINT IF EXISTS "border_datasource_fk";
ALTER TABLE "border" ADD CONSTRAINT border_datasource_fk FOREIGN KEY(datasource) REFERENCES common.datasource(id);

COMMIT;