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
CREATE SCHEMA IF NOT EXISTS area; ALTER SCHEMA area OWNER to poweradmin;
CREATE SCHEMA IF NOT EXISTS border; ALTER SCHEMA border OWNER to poweradmin;
CREATE SCHEMA IF NOT EXISTS common; ALTER SCHEMA common OWNER to poweradmin;
CREATE SCHEMA IF NOT EXISTS unit; ALTER SCHEMA unit OWNER to poweradmin;
CREATE SCHEMA IF NOT EXISTS market; ALTER SCHEMA market OWNER to poweradmin;

COMMIT;