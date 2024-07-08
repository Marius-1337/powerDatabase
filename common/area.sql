-- Table: common.area
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

CREATE TABLE  IF NOT EXISTS "area" (
    id serial4 NOT NULL,
    eic varchar(16) NOT NULL,
    name varchar NOT NULL,
    countrycode char(2) NOT NULL,
    BZN boolean NULL,
    BZA boolean NULL,
    CTA boolean NULL,
    MBA boolean NULL,
    IBA boolean NULL,
    IPA boolean NULL,
    LFA boolean NULL,
    LFB boolean NULL,
    REG boolean NULL,
    SCA boolean NULL,
    SNA boolean NULL,
  	CONSTRAINT area_pk PRIMARY KEY (id)
);

COMMENT on column area.BZN is 'BZN — Bidding Zone';
COMMENT on column area.BZA is 'BZA — Bidding Zone Aggregation';
COMMENT on column area.CTA is 'CTA — Control Area';
COMMENT on column area.MBA is 'MBA — Market Balance Area';
COMMENT on column area.IBA is 'IBA — Imbalance Area';
COMMENT on column area.IPA is 'IPA — Imbalance Price Area';
COMMENT on column area.LFA is 'LFA — Load Frequency Control Area';
COMMENT on column area.LFB is 'LFB — Load Frequency Control Block';
COMMENT on column area.REG is 'REG — Region';
COMMENT on column area.SCA is 'SCA — Scheduling Area';
COMMENT on column area.SNA is 'SNA — Synchronous Area';

ALTER TABLE "area" DROP CONSTRAINT IF EXISTS "area_ibfk_1";
ALTER TABLE "area" ADD CONSTRAINT "area_ibfk_1" FOREIGN KEY ("countrycode") REFERENCES "country" ("code") ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX IF NOT EXISTS eic_unique_index ON area (eic);

COMMIT;
