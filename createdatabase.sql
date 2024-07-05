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

--
-- TOC entry 7 (class 2615 OID 16392)
-- Name: area; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA area; ALTER SCHEMA area OWNER to poweradmin;
CREATE SCHEMA border; ALTER SCHEMA border OWNER to poweradmin;
CREATE SCHEMA common; ALTER SCHEMA common OWNER to poweradmin;
CREATE SCHEMA unit; ALTER SCHEMA unit OWNER to poweradmin;
CREATE SCHEMA market; ALTER SCHEMA market OWNER to poweradmin;

SET default_tablespace = '';
SET default_table_access_method = heap;
