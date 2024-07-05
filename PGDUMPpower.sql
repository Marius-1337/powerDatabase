--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-03 09:25:51 CEST

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
-- TOC entry 3442 (class 1262 OID 16388)
-- Name: power; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE power WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE power OWNER TO postgres;

\connect power

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

CREATE SCHEMA area;
ALTER SCHEMA area OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 16393)
-- Name: border; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA border;
ALTER SCHEMA border OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 16391)
-- Name: common; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA common;
ALTER SCHEMA common OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16394)
-- Name: unit; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA unit;
ALTER SCHEMA unit OWNER TO postgres;

SET default_tablespace = '';
SET default_table_access_method = heap;


-- TOC entry 222 (class 1259 OID 16547)
-- Name: area; Type: TABLE; Schema: common; Owner: postgres

CREATE TABLE common.area (
    id integer NOT NULL,
    eic character varying(16) NOT NULL,
    name character varying NOT NULL,
    countrycode character(2) NOT NULL,
    bzn boolean,
    bza boolean,
    cta boolean,
    mba boolean,
    iba boolean,
    ipa boolean,
    lfa boolean,
    lfb boolean,
    reg boolean,
    sca boolean,
    sna boolean
);
ALTER TABLE common.area OWNER TO postgres;

-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN area.bzn; Type: COMMENT; Schema: common; Owner: postgres

COMMENT ON COLUMN common.area.bzn IS 'BZN — Bidding Zone';
COMMENT ON COLUMN common.area.bza IS 'BZA — Bidding Zone Aggregation';
COMMENT ON COLUMN common.area.cta IS 'CTA — Control Area';
COMMENT ON COLUMN common.area.mba IS 'MBA — Market Balance Area';
COMMENT ON COLUMN common.area.iba IS 'IBA — Imbalance Area';
COMMENT ON COLUMN common.area.ipa IS 'IPA — Imbalance Price Area';
COMMENT ON COLUMN common.area.lfa IS 'LFA — Load Frequency Control Area';
COMMENT ON COLUMN common.area.lfb IS 'LFB — Load Frequency Control Block';
COMMENT ON COLUMN common.area.reg IS 'REG — Region';
COMMENT ON COLUMN common.area.sca IS 'SCA — Scheduling Area';
COMMENT ON COLUMN common.area.sna IS 'SNA — Synchronous Area';

CREATE SEQUENCE common.area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE common.area_id_seq OWNER TO postgres;
ALTER SEQUENCE common.area_id_seq OWNED BY common.area.id;

CREATE TABLE common.border (
    id integer NOT NULL,
    name character varying NOT NULL,
    fromarea character varying(16) NOT NULL,
    toarea character varying(16) NOT NULL,
    validfrom date,
    validthrough date,
    status character varying,
    capacity smallint,
    voltage integer,
    datasource integer NOT NULL,
    lastupdate timestamp with time zone NOT NULL
);

ALTER TABLE common.border OWNER TO postgres;

CREATE SEQUENCE common.border_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE common.border_id_seq OWNER TO postgres;
ALTER SEQUENCE common.border_id_seq OWNED BY common.border.id;

CREATE TABLE common.continent (
    code character(2) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying
);


ALTER TABLE common.continent OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN continent.code; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON COLUMN common.continent.code IS 'Continent code';
COMMENT ON COLUMN common.continent.name IS 'Continent name';

CREATE TABLE common.country (
    code character(2) NOT NULL,
    name character varying(128) NOT NULL,
    full_name character varying(256),
    iso3 character(3),
    iso_number smallint,
    continent character(2) NOT NULL
);


ALTER TABLE common.country OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN country.code; Type: COMMENT; Schema: common; Owner: postgres
--

COMMENT ON COLUMN common.country.code IS 'Two-letter country code (ISO 3166-1 alpha-2)';
COMMENT ON COLUMN common.country.name IS 'English country name';
COMMENT ON COLUMN common.country.full_name IS 'Full English country name';
COMMENT ON COLUMN common.country.iso3 IS 'Three-letter country code (ISO 3166-1 alpha-3)';
COMMENT ON COLUMN common.country.iso_number IS 'Three-letter country code (ISO 3166-1 numeric)';

CREATE TABLE common.datasource (
    id integer NOT NULL,
    name character varying NOT NULL,
    fullname character varying,
    url character varying,
    owner character varying NOT NULL,
    lastupdate timestamp with time zone NOT NULL
);

ALTER TABLE common.datasource OWNER TO postgres;

-- TOC entry 223 (class 1259 OID 16629)
-- Name: datasource_id_seq; Type: SEQUENCE; Schema: common; Owner: postgres

CREATE SEQUENCE common.datasource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE common.datasource_id_seq OWNER TO postgres;
ALTER SEQUENCE common.datasource_id_seq OWNED BY common.datasource.id;

-- TOC entry 226 (class 1259 OID 16832)
-- Name: fueltype; Type: TABLE; Schema: common; Owner: postgres

CREATE TABLE common.fueltype (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);

ALTER TABLE common.fueltype OWNER TO postgres;

-- TOC entry 225 (class 1259 OID 16831)
-- Name: fueltype_id_seq; Type: SEQUENCE; Schema: common; Owner: postgres

CREATE SEQUENCE common.fueltype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE common.fueltype_id_seq OWNER TO postgres;
ALTER SEQUENCE common.fueltype_id_seq OWNED BY common.fueltype.id;

-- TOC entry 228 (class 1259 OID 16855)
-- Name: powerplant; Type: TABLE; Schema: common; Owner: postgres

CREATE TABLE common.powerplant (
    id integer NOT NULL,
    eic character varying(16) NOT NULL,
    name character varying NOT NULL,
    validfrom date NOT NULL,
    validthrough date,
    status character varying,
    fueltype integer NOT NULL,
    location character varying,
    capacity smallint,
    ctlarea integer NOT NULL,
    bidarea integer NOT NULL,
    voltage integer,
    datasource integer NOT NULL,
    lastupdate timestamp with time zone NOT NULL
);

ALTER TABLE common.powerplant OWNER TO postgres;

-- TOC entry 227 (class 1259 OID 16854)
-- Name: powerplant_id_seq; Type: SEQUENCE; Schema: common; Owner: postgres

CREATE SEQUENCE common.powerplant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE common.powerplant_id_seq OWNER TO postgres;
ALTER SEQUENCE common.powerplant_id_seq OWNED BY common.powerplant.id;

-- TOC entry 230 (class 1259 OID 16939)
-- Name: unit; Type: TABLE; Schema: common; Owner: postgres

CREATE TABLE common.unit (
    id integer NOT NULL,
    eic character varying(16) NOT NULL,
    powerplant character varying(16) NOT NULL,
    name character varying NOT NULL,
    validfrom date NOT NULL,
    validthrough date,
    status character varying,
    fueltype integer NOT NULL,
    location character varying,
    capacity smallint,
    datasource integer NOT NULL,
    lastupdate timestamp with time zone NOT NULL
);


ALTER TABLE common.unit OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16938)
-- Name: unit_id_seq; Type: SEQUENCE; Schema: common; Owner: postgres
--

CREATE SEQUENCE common.unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE common.unit_id_seq OWNER TO postgres;
ALTER SEQUENCE common.unit_id_seq OWNED BY common.unit.id;

ALTER TABLE ONLY common.area ALTER COLUMN id SET DEFAULT nextval('common.area_id_seq'::regclass);
ALTER TABLE ONLY common.border ALTER COLUMN id SET DEFAULT nextval('common.border_id_seq'::regclass);
ALTER TABLE ONLY common.datasource ALTER COLUMN id SET DEFAULT nextval('common.datasource_id_seq'::regclass);
ALTER TABLE ONLY common.fueltype ALTER COLUMN id SET DEFAULT nextval('common.fueltype_id_seq'::regclass);
ALTER TABLE ONLY common.powerplant ALTER COLUMN id SET DEFAULT nextval('common.powerplant_id_seq'::regclass);
ALTER TABLE ONLY common.unit ALTER COLUMN id SET DEFAULT nextval('common.unit_id_seq'::regclass);

--
-- TOC entry 3426 (class 0 OID 16547)
-- Dependencies: 222
-- Data for Name: area; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO common.area VALUES (14, '10Y1001A1001A65H', 'DK', 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (106, '10Y1001C--00095L', 'SWE', 'SE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (72, '10Y1001A1001A83F', 'DE', 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (76, '10Y1001A1001A877', 'IT-Malta', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (77, '10Y1001A1001A885', 'IT-SACOAC', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (79, '10Y1001A1001A92E', 'UK', 'GB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (1, '10Y1001A1001A016', 'NIE', 'IE', NULL, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (2, '10Y1001A1001A39I', 'EE', 'EE', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (3, '10Y1001A1001A44P', 'SE1', 'SE', true, NULL, NULL, true, NULL, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (4, '10Y1001A1001A45N', 'SE2', 'SE', true, NULL, NULL, true, NULL, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (5, '10Y1001A1001A46L', 'SE3', 'SE', true, NULL, NULL, true, NULL, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (6, '10Y1001A1001A47J', 'SE4', 'SE', true, NULL, NULL, true, NULL, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (7, '10Y1001A1001A48H', 'NO', 'NO', true, NULL, NULL, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (13, '10Y1001A1001A64J', 'NO10A', 'NO', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (15, '10Y1001A1001A66F', 'IT-GR', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (16, '10Y1001A1001A67D', 'IT-North-SI', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (17, '10Y1001A1001A68B', 'IT-North', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (18, '10Y1001A1001A699', 'IT-Brindisi', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (78, '10Y1001A1001A893', 'IT-SACODC', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (80, '10Y1001A1001A93C', 'Malta', 'MT', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (81, '10Y1001A1001A990', 'MD', 'MD', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (82, '10Y1001A1001B004', 'AM', 'AM', true, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (83, '10Y1001A1001B012', 'GE', 'GE', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (84, '10Y1001A1001B05V', 'AZ', 'AZ', true, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (85, '10Y1001C--00003F', 'UA', 'UA', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (86, '10Y1001C--000182', 'UA-IPS', 'UA', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (151, '10YNO-0--------C', 'NO', 'NO', NULL, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (8, '10Y1001A1001A49F', 'RU', 'RU', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (9, '10Y1001A1001A50U', 'RU-KGD', 'RU', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (10, '10Y1001A1001A51S', 'BY', 'BY', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (11, '10Y1001A1001A59C', 'IE(SEM)', 'IE', true, NULL, NULL, true, NULL, NULL, NULL, true, NULL, true, true);
INSERT INTO common.area VALUES (12, '10Y1001A1001A63L', 'DE-AT-LU', 'DE', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (19, '10Y1001A1001A70O', 'IT-Centre-North', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (20, '10Y1001A1001A71M', 'IT-Centre-South', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (21, '10Y1001A1001A72K', 'IT-Foggia', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (22, '10Y1001A1001A73I', 'IT-North', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (23, '10Y1001A1001A74G', 'IT-Sardinia', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (24, '10Y1001A1001A75E', 'IT-Sicily', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (25, '10Y1001A1001A76C', 'IT-Z-Priolo', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (26, '10Y1001A1001A77A', 'IT-Rossano', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (27, '10Y1001A1001A788', 'IT-South', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (68, '10Y1001A1001A796', 'DK', 'DK', NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (69, '10Y1001A1001A80L', 'IT-North-AT', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (70, '10Y1001A1001A81J', 'IT-North-FR', 'IT', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (71, '10Y1001A1001A82H', 'DE-LU', 'DE', true, NULL, NULL, true, NULL, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (73, '10Y1001A1001A84D', 'IT-MACRZONENORTH', 'IT', NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (74, '10Y1001A1001A85B', 'IT-MACRZONESOUTH', 'IT', NULL, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (75, '10Y1001A1001A869', 'UA-DobTPP', 'UA', true, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (87, '10Y1001C--00038X', 'CZ-DE-SK-LT-SE4', 'CZ', NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (107, '10Y1001C--00096J', 'IT-Calabria', 'IT', true, NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (108, '10Y1001C--00098F', 'GB(IFA)', 'GB', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (109, '10Y1001C--00100H', 'XK', 'XK', true, NULL, true, true, NULL, NULL, true, true, NULL, NULL, NULL);
INSERT INTO common.area VALUES (110, '10Y1001C--001219', 'NO2A', 'NO', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (111, '10Y1001C--00137V', 'ITALYNORTH', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL);
INSERT INTO common.area VALUES (112, '10Y1001C--00138T', 'GRIT', 'GR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL);
INSERT INTO common.area VALUES (113, '10YAL-KESH-----5', 'AL', 'AL', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (114, '10YAT-APG------L', 'AT', 'AT', true, NULL, true, true, NULL, true, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (115, '10YBA-JPCC-----D', 'BA', 'BA', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (116, '10YBE----------2', 'BE', 'BE', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (117, '10YCA-BULGARIA-R', 'BG', 'BG', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (118, '10YCB-GERMANY--8', 'DE_DK1_LU', 'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, true, NULL);
INSERT INTO common.area VALUES (119, '10YCB-JIEL-----9', 'RS_MK_ME', 'RS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO common.area VALUES (120, '10YCB-POLAND---Z', 'PL', 'PL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO common.area VALUES (121, '10YCB-SI-HR-BA-3', 'SI-HR_BA', 'SI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL);
INSERT INTO common.area VALUES (122, '10YCH-SWISSGRIDZ', 'CH', 'CH', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (123, '10YCS-CG-TSO---S', 'ME', 'ME', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (124, '10YCS-SERBIATSOV', 'RS', 'RS', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (125, '10YCY-1001A0003J', 'CY', 'CY', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (126, '10YCZ-CEPS-----N', 'CZ', 'CZ', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (127, '10YDE-ENBW-----N', 'DE(TransnetBW)', 'DE', NULL, NULL, true, NULL, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (128, '10YDE-EON------1', 'DE(TenneT)', 'DE', NULL, NULL, true, NULL, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (129, '10YDE-RWENET---I', 'DE(Amprion)', 'DE', NULL, NULL, true, NULL, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (130, '10YDE-VE-------2', 'DE(50Hertz)', 'DE', NULL, NULL, true, NULL, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (131, '10YDK-1-------AA', 'DK1A', 'DK', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (132, '10YDK-1--------W', 'DK1', 'DK', true, NULL, NULL, true, true, true, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (133, '10YDK-2--------M', 'DK2', 'DK', true, NULL, NULL, true, true, true, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (134, '10YDOM-1001A082L', 'PL-CZ', 'PL', NULL, true, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (135, '10YDOM-CZ-DE-SKK', 'CZ-DE-SK', 'CZ', true, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (136, '10YDOM-PL-SE-LT2', 'LT-SE4', 'LT', NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (137, '10YES-REE------0', 'ES', 'ES', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (138, '10YFI-1--------U', 'FI', 'FI', true, NULL, true, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (139, '10YFR-RTE------C', 'FR', 'FR', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (140, '10YGB----------A', 'GB', 'GB', true, NULL, true, true, NULL, NULL, true, true, NULL, true, true);
INSERT INTO common.area VALUES (141, '10YGR-HTSO-----Y', 'GR', 'GR', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (142, '10YHR-HEP------M', 'HR', 'HR', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (143, '10YHU-MAVIR----U', 'HU', 'HU', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (144, '10YIE-1001A00010', 'IE', 'IE', NULL, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (145, '10YIT-GRTN-----B', 'IT', 'IT', NULL, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (146, '10YLT-1001A0008Q', 'LT', 'LT', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (147, '10YLU-CEGEDEL-NQ', 'LU', 'LU', NULL, NULL, true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (148, '10YLV-1001A00074', 'LV', 'LV', true, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (149, '10YMK-MEPSO----8', 'MK', 'MK', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (150, '10YNL----------L', 'NL', 'NL', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (152, '10YNO-1--------2', 'NO1', 'NO', true, NULL, NULL, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (153, '10YNO-2--------T', 'NO2', 'NO', true, NULL, NULL, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (154, '10YNO-3--------J', 'NO3', 'NO', true, NULL, NULL, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (155, '10YNO-4--------9', 'NO4', 'NO', true, NULL, NULL, true, true, true, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (156, '10YPL-AREA-----S', 'PL', 'PL', true, true, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (157, '10YPT-REN------W', 'PT', 'PT', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (158, '10YRO-TEL------P', 'RO', 'RO', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (159, '10YSE-1--------K', 'SE', 'SE', NULL, NULL, true, true, NULL, NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (160, '10YSI-ELES-----O', 'SI', 'SI', true, NULL, true, true, NULL, NULL, true, NULL, NULL, true, NULL);
INSERT INTO common.area VALUES (161, '10YSK-SEPS-----K', 'SK', 'SK', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (162, '10YTR-TEIAS----W', 'TR', 'TR', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (163, '10YUA-WEPS-----0', 'UA-BEI', 'UA', true, NULL, true, true, NULL, NULL, true, true, NULL, true, NULL);
INSERT INTO common.area VALUES (164, '11Y0-0000-0265-K', 'GB(IFA2)', 'GB', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (165, '46Y000000000007M', 'DK1-NO1', 'DK', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO common.area VALUES (166, '50Y0JVU59B4JWQCU', 'NO2NSL', 'NO', true, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3436 (class 0 OID 17027)
-- Dependencies: 232
-- Data for Name: border; Type: TABLE DATA; Schema: common; Owner: postgres
--

INSERT INTO common.border VALUES (140, 'AL-GR', '10YAL-KESH-----5', '10YGR-HTSO-----Y', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (141, 'AL-ME', '10YAL-KESH-----5', '10YCS-CG-TSO---S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (142, 'AL-RS', '10YAL-KESH-----5', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (143, 'AL-XK', '10YAL-KESH-----5', '10Y1001C--00100H', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (144, 'AT-CH', '10YAT-APG------L', '10YCH-SWISSGRIDZ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (145, 'AT-CZ', '10YAT-APG------L', '10YCZ-CEPS-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (146, 'AT-DE(Amprion)', '10YAT-APG------L', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (147, 'AT-DE(TenneT)', '10YAT-APG------L', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (148, 'AT-DE(TransnetBW)', '10YAT-APG------L', '10YDE-ENBW-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (149, 'AT-HU', '10YAT-APG------L', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (150, 'AT-IT', '10YAT-APG------L', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (151, 'AT-SI', '10YAT-APG------L', '10YSI-ELES-----O', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (152, 'BE-DE(Amprion)', '10YBE----------2', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (153, 'BE-FR', '10YBE----------2', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (154, 'BE-GB', '10YBE----------2', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (155, 'BE-LU', '10YBE----------2', '10YLU-CEGEDEL-NQ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (156, 'BE-NL', '10YBE----------2', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (157, 'BA-HR', '10YBA-JPCC-----D', '10YHR-HEP------M', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (158, 'BA-ME', '10YBA-JPCC-----D', '10YCS-CG-TSO---S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (159, 'BA-RS', '10YBA-JPCC-----D', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (160, 'BG-GR', '10YCA-BULGARIA-R', '10YGR-HTSO-----Y', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (161, 'BG-MK', '10YCA-BULGARIA-R', '10YMK-MEPSO----8', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (162, 'BG-RO', '10YCA-BULGARIA-R', '10YRO-TEL------P', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (163, 'BG-RS', '10YCA-BULGARIA-R', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (164, 'BG-TR', '10YCA-BULGARIA-R', '10YTR-TEIAS----W', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (165, 'HR-BA', '10YHR-HEP------M', '10YBA-JPCC-----D', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (166, 'HR-HU', '10YHR-HEP------M', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (167, 'HR-RS', '10YHR-HEP------M', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (168, 'HR-SI', '10YHR-HEP------M', '10YSI-ELES-----O', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (169, 'CZ-AT', '10YCZ-CEPS-----N', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (170, 'CZ-DE(50Hertz)', '10YCZ-CEPS-----N', '10YDE-VE-------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (171, 'CZ-DE(TenneT)', '10YCZ-CEPS-----N', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (172, 'CZ-PL', '10YCZ-CEPS-----N', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (173, 'CZ-SK', '10YCZ-CEPS-----N', '10YSK-SEPS-----K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (174, 'PL-DE(50Hertz)', '10YPL-AREA-----S', '10YDE-VE-------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (175, 'DK-DE(50Hertz)', '10Y1001A1001A796', '10YDE-VE-------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (176, 'DK-DE(TenneT)', '10Y1001A1001A796', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (177, 'DK-GB', '10Y1001A1001A796', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (178, 'DK-NL', '10Y1001A1001A796', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (179, 'DK-NO', '10Y1001A1001A796', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (180, 'DK-SE', '10Y1001A1001A796', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (181, 'EE-FI', '10Y1001A1001A39I', '10YFI-1--------U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (182, 'EE-LV', '10Y1001A1001A39I', '10YLV-1001A00074', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (183, 'EE-RU', '10Y1001A1001A39I', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (184, 'FI-EE', '10YFI-1--------U', '10Y1001A1001A39I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (185, 'FI-NO', '10YFI-1--------U', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (186, 'FI-RU', '10YFI-1--------U', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (187, 'FI-SE', '10YFI-1--------U', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (188, 'FR-BE', '10YFR-RTE------C', '10YBE----------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (189, 'FR-CH', '10YFR-RTE------C', '10YCH-SWISSGRIDZ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (190, 'FR-DE(Amprion)', '10YFR-RTE------C', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (191, 'FR-DE(TransnetBW)', '10YFR-RTE------C', '10YDE-ENBW-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (192, 'FR-ES', '10YFR-RTE------C', '10YES-REE------0', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (193, 'FR-GB', '10YFR-RTE------C', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (194, 'FR-IT', '10YFR-RTE------C', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (195, 'GE-AM', '10Y1001A1001B012', '10Y1001A1001B004', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (196, 'GE-AZ', '10Y1001A1001B012', '10Y1001A1001B05V', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (197, 'GE-RU', '10Y1001A1001B012', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (198, 'GE-TR', '10Y1001A1001B012', '10YTR-TEIAS----W', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (199, 'DE(50Hertz)-CZ', '10YDE-VE-------2', '10YCZ-CEPS-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (200, 'DE(50Hertz)-DK', '10YDE-VE-------2', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (201, 'DE(50Hertz)-PL', '10YDE-VE-------2', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (202, 'DE(Amprion)-AT', '10YDE-RWENET---I', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (203, 'DE(Amprion)-BE', '10YDE-RWENET---I', '10YBE----------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (204, 'DE(Amprion)-CH', '10YDE-RWENET---I', '10YCH-SWISSGRIDZ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (205, 'DE(Amprion)-FR', '10YDE-RWENET---I', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (206, 'DE(Amprion)-LU', '10YDE-RWENET---I', '10YLU-CEGEDEL-NQ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (207, 'DE(Amprion)-NL', '10YDE-RWENET---I', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (208, 'DE(TenneT)-AT', '10YDE-EON------1', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (209, 'DE(TenneT)-CZ', '10YDE-EON------1', '10YCZ-CEPS-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (210, 'DE(TenneT)-DK', '10YDE-EON------1', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (211, 'DE(TenneT)-NL', '10YDE-EON------1', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (212, 'DE(TenneT)-NO', '10YDE-EON------1', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (213, 'DE(TenneT)-SE', '10YDE-EON------1', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (214, 'DE(TransnetBW)-AT', '10YDE-ENBW-----N', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (215, 'DE(TransnetBW)-CH', '10YDE-ENBW-----N', '10YCH-SWISSGRIDZ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (216, 'DE(TransnetBW)-FR', '10YDE-ENBW-----N', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (217, 'GR-AL', '10YGR-HTSO-----Y', '10YAL-KESH-----5', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (218, 'GR-BG', '10YGR-HTSO-----Y', '10YCA-BULGARIA-R', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (219, 'GR-IT', '10YGR-HTSO-----Y', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (220, 'GR-MK', '10YGR-HTSO-----Y', '10YMK-MEPSO----8', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (221, 'GR-TR', '10YGR-HTSO-----Y', '10YTR-TEIAS----W', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (222, 'HU-AT', '10YHU-MAVIR----U', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (223, 'HU-HR', '10YHU-MAVIR----U', '10YHR-HEP------M', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (224, 'HU-RO', '10YHU-MAVIR----U', '10YRO-TEL------P', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (225, 'HU-RS', '10YHU-MAVIR----U', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (226, 'HU-SI', '10YHU-MAVIR----U', '10YSI-ELES-----O', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (227, 'HU-SK', '10YHU-MAVIR----U', '10YSK-SEPS-----K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (228, 'HU-UA', '10YHU-MAVIR----U', '10YUA-WEPS-----0', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (229, 'HU-UA', '10YHU-MAVIR----U', '10Y1001C--000182', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (230, 'IE-GB', '10YIE-1001A00010', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (231, 'IE-NIE', '10YIE-1001A00010', '10Y1001A1001A016', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (232, 'IT-AT', '10YIT-GRTN-----B', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (233, 'IT-CH', '10YIT-GRTN-----B', '10YCH-SWISSGRIDZ', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (234, 'IT-FR', '10YIT-GRTN-----B', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (235, 'IT-GR', '10YIT-GRTN-----B', '10YGR-HTSO-----Y', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (236, 'IT-ME', '10YIT-GRTN-----B', '10YCS-CG-TSO---S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (237, 'IT-MT', '10YIT-GRTN-----B', '10Y1001A1001A93C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (238, 'IT-SI', '10YIT-GRTN-----B', '10YSI-ELES-----O', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (239, 'XK-AL', '10Y1001C--00100H', '10YAL-KESH-----5', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (240, 'XK-ME', '10Y1001C--00100H', '10YCS-CG-TSO---S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (241, 'XK-MK', '10Y1001C--00100H', '10YMK-MEPSO----8', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (242, 'XK-RS', '10Y1001C--00100H', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (243, 'LV-EE', '10YLV-1001A00074', '10Y1001A1001A39I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (244, 'LV-LT', '10YLV-1001A00074', '10YLT-1001A0008Q', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (245, 'LV-RU', '10YLV-1001A00074', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (246, 'LT-BY', '10YLT-1001A0008Q', '10Y1001A1001A51S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (247, 'LT-LV', '10YLT-1001A0008Q', '10YLV-1001A00074', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (248, 'LT-PL', '10YLT-1001A0008Q', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (249, 'LT-RU', '10YLT-1001A0008Q', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (250, 'LT-SE', '10YLT-1001A0008Q', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (251, 'LU-BE', '10YLU-CEGEDEL-NQ', '10YBE----------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (252, 'LU-DE(Amprion)', '10YLU-CEGEDEL-NQ', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (253, 'MT-IT', '10Y1001A1001A93C', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (254, 'MD-RO', '10Y1001A1001A990', '10YRO-TEL------P', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (255, 'MD-UA', '10Y1001A1001A990', '10Y1001C--000182', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (256, 'ME-AL', '10YCS-CG-TSO---S', '10YAL-KESH-----5', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (257, 'ME-BA', '10YCS-CG-TSO---S', '10YBA-JPCC-----D', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (258, 'ME-IT', '10YCS-CG-TSO---S', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (259, 'ME-RS', '10YCS-CG-TSO---S', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (260, 'ME-XK', '10YCS-CG-TSO---S', '10Y1001C--00100H', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (261, 'NL-BE', '10YNL----------L', '10YBE----------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (262, 'NL-DE(Amprion)', '10YNL----------L', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (263, 'NL-DE(TenneT)', '10YNL----------L', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (264, 'NL-DK', '10YNL----------L', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (265, 'NL-GB', '10YNL----------L', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (266, 'NL-NO', '10YNL----------L', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (267, 'MK-BG', '10YMK-MEPSO----8', '10YCA-BULGARIA-R', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (268, 'MK-GR', '10YMK-MEPSO----8', '10YGR-HTSO-----Y', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (269, 'MK-RS', '10YMK-MEPSO----8', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (270, 'MK-XK', '10YMK-MEPSO----8', '10Y1001C--00100H', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (271, 'NO-DE(TenneT)', '10YNO-0--------C', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (272, 'NO-DK', '10YNO-0--------C', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (273, 'NO-FI', '10YNO-0--------C', '10YFI-1--------U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (274, 'NO-GB', '10YNO-0--------C', '10YGB----------A', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (275, 'NO-NL', '10YNO-0--------C', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (276, 'NO-SE', '10YNO-0--------C', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (277, 'PL-CZ', '10YPL-AREA-----S', '10YCZ-CEPS-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (278, 'PL-LT', '10YPL-AREA-----S', '10YLT-1001A0008Q', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (279, 'PL-SE', '10YPL-AREA-----S', '10YSE-1--------K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (280, 'PL-SK', '10YPL-AREA-----S', '10YSK-SEPS-----K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (281, 'PL-UA', '10YPL-AREA-----S', '10Y1001A1001A869', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (282, 'PT-ES', '10YPT-REN------W', '10YES-REE------0', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (283, 'RO-BG', '10YRO-TEL------P', '10YCA-BULGARIA-R', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (284, 'RO-HU', '10YRO-TEL------P', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (285, 'RO-MD', '10YRO-TEL------P', '10Y1001A1001A990', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (286, 'RO-RS', '10YRO-TEL------P', '10YCS-SERBIATSOV', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (287, 'RO-UA', '10YRO-TEL------P', '10YUA-WEPS-----0', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (288, 'RS-AL', '10YCS-SERBIATSOV', '10YAL-KESH-----5', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (289, 'RS-BA', '10YCS-SERBIATSOV', '10YBA-JPCC-----D', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (290, 'RS-BG', '10YCS-SERBIATSOV', '10YCA-BULGARIA-R', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (291, 'RS-HR', '10YCS-SERBIATSOV', '10YHR-HEP------M', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (292, 'RS-HU', '10YCS-SERBIATSOV', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (293, 'RS-ME', '10YCS-SERBIATSOV', '10YCS-CG-TSO---S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (294, 'RS-MK', '10YCS-SERBIATSOV', '10YMK-MEPSO----8', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (295, 'RS-RO', '10YCS-SERBIATSOV', '10YRO-TEL------P', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (296, 'RS-XK', '10YCS-SERBIATSOV', '10Y1001C--00100H', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (297, 'SK-CZ', '10YSK-SEPS-----K', '10YCZ-CEPS-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (298, 'SK-HU', '10YSK-SEPS-----K', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (299, 'SK-PL', '10YSK-SEPS-----K', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (300, 'SK-UA', '10YSK-SEPS-----K', '10YUA-WEPS-----0', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (301, 'SI-AT', '10YSI-ELES-----O', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (302, 'SI-HR', '10YSI-ELES-----O', '10YHR-HEP------M', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (303, 'SI-HU', '10YSI-ELES-----O', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (304, 'SI-IT', '10YSI-ELES-----O', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (305, 'ES-FR', '10YES-REE------0', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (306, 'ES-PT', '10YES-REE------0', '10YPT-REN------W', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (307, 'SE-DE(TenneT)', '10YSE-1--------K', '10YDE-EON------1', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (308, 'SE-DK', '10YSE-1--------K', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (309, 'SE-FI', '10YSE-1--------K', '10YFI-1--------U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (310, 'SE-LT', '10YSE-1--------K', '10YLT-1001A0008Q', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (311, 'SE-NO', '10YSE-1--------K', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (312, 'SE-PL', '10YSE-1--------K', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (313, 'CH-AT', '10YCH-SWISSGRIDZ', '10YAT-APG------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (314, 'CH-DE(Amprion)', '10YCH-SWISSGRIDZ', '10YDE-RWENET---I', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (315, 'CH-DE(TransnetBW)', '10YCH-SWISSGRIDZ', '10YDE-ENBW-----N', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (316, 'CH-FR', '10YCH-SWISSGRIDZ', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (317, 'CH-IT', '10YCH-SWISSGRIDZ', '10YIT-GRTN-----B', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (318, 'TR-BG', '10YTR-TEIAS----W', '10YCA-BULGARIA-R', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (319, 'TR-GE', '10YTR-TEIAS----W', '10Y1001A1001B012', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (320, 'TR-GR', '10YTR-TEIAS----W', '10YGR-HTSO-----Y', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (321, 'UA-BY', '10Y1001C--000182', '10Y1001A1001A51S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (322, 'UA-HU', '10Y1001C--000182', '10YHU-MAVIR----U', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (323, 'UA-MD', '10Y1001C--000182', '10Y1001A1001A990', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (324, 'UA-PL', '10Y1001C--000182', '10YPL-AREA-----S', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (325, 'UA-RO', '10Y1001C--000182', '10YRO-TEL------P', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (326, 'UA-RU', '10Y1001C--000182', '10Y1001A1001A49F', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (327, 'UA-SK', '10Y1001C--000182', '10YSK-SEPS-----K', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (328, 'GB-BE', '10YGB----------A', '10YBE----------2', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (329, 'GB-DK', '10YGB----------A', '10Y1001A1001A796', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (330, 'GB-FR', '10YGB----------A', '10YFR-RTE------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (331, 'GB-IE', '10YGB----------A', '10YIE-1001A00010', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (332, 'GB-NIE', '10YGB----------A', '10Y1001A1001A016', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (333, 'GB-NL', '10YGB----------A', '10YNL----------L', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');
INSERT INTO common.border VALUES (334, 'GB-NO', '10YGB----------A', '10YNO-0--------C', NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 22:00:00+00');

-- TOC entry 3423 (class 0 OID 16518)
-- Dependencies: 219
-- Data for Name: continent; Type: TABLE DATA; Schema: common; Owner: postgres

INSERT INTO common.continent VALUES ('AF', 'Africa');
INSERT INTO common.continent VALUES ('AN', 'Antarctica');
INSERT INTO common.continent VALUES ('AS', 'Asia');
INSERT INTO common.continent VALUES ('EU', 'Europe');
INSERT INTO common.continent VALUES ('NA', 'North America');
INSERT INTO common.continent VALUES ('OC', 'Oceania');
INSERT INTO common.continent VALUES ('SA', 'South America');

-- TOC entry 3424 (class 0 OID 16526)
-- Dependencies: 220
-- Data for Name: country; Type: TABLE DATA; Schema: common; Owner: postgres

INSERT INTO common.country VALUES ('AD', 'Andorra', 'Principality of Andorra', 'AND', 20, 'EU');
INSERT INTO common.country VALUES ('AE', 'United Arab Emirates', 'United Arab Emirates', 'ARE', 784, 'AS');
INSERT INTO common.country VALUES ('AF', 'Afghanistan', 'Islamic Republic of Afghanistan', 'AFG', 4, 'AS');
INSERT INTO common.country VALUES ('AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'ATG', 28, 'NA');
INSERT INTO common.country VALUES ('AI', 'Anguilla', 'Anguilla', 'AIA', 660, 'NA');
INSERT INTO common.country VALUES ('AL', 'Albania', 'Republic of Albania', 'ALB', 8, 'EU');
INSERT INTO common.country VALUES ('AM', 'Armenia', 'Republic of Armenia', 'ARM', 51, 'AS');
INSERT INTO common.country VALUES ('AN', 'Netherlands Antilles', 'Netherlands Antilles', 'ANT', 530, 'NA');
INSERT INTO common.country VALUES ('AO', 'Angola', 'Republic of Angola', 'AGO', 24, 'AF');
INSERT INTO common.country VALUES ('AQ', 'Antarctica', 'Antarctica (the territory South of 60 deg S)', 'ATA', 10, 'AN');
INSERT INTO common.country VALUES ('AR', 'Argentina', 'Argentine Republic', 'ARG', 32, 'SA');
INSERT INTO common.country VALUES ('AS', 'American Samoa', 'American Samoa', 'ASM', 16, 'OC');
INSERT INTO common.country VALUES ('AT', 'Austria', 'Republic of Austria', 'AUT', 40, 'EU');
INSERT INTO common.country VALUES ('AU', 'Australia', 'Commonwealth of Australia', 'AUS', 36, 'OC');
INSERT INTO common.country VALUES ('AW', 'Aruba', 'Aruba', 'ABW', 533, 'NA');
INSERT INTO common.country VALUES ('AX', 'Åland', 'Åland Islands', 'ALA', 248, 'EU');
INSERT INTO common.country VALUES ('AZ', 'Azerbaijan', 'Republic of Azerbaijan', 'AZE', 31, 'AS');
INSERT INTO common.country VALUES ('BA', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BIH', 70, 'EU');
INSERT INTO common.country VALUES ('BB', 'Barbados', 'Barbados', 'BRB', 52, 'NA');
INSERT INTO common.country VALUES ('BD', 'Bangladesh', 'People''s Republic of Bangladesh', 'BGD', 50, 'AS');
INSERT INTO common.country VALUES ('BE', 'Belgium', 'Kingdom of Belgium', 'BEL', 56, 'EU');
INSERT INTO common.country VALUES ('BF', 'Burkina Faso', 'Burkina Faso', 'BFA', 854, 'AF');
INSERT INTO common.country VALUES ('BG', 'Bulgaria', 'Republic of Bulgaria', 'BGR', 100, 'EU');
INSERT INTO common.country VALUES ('BH', 'Bahrain', 'Kingdom of Bahrain', 'BHR', 48, 'AS');
INSERT INTO common.country VALUES ('BI', 'Burundi', 'Republic of Burundi', 'BDI', 108, 'AF');
INSERT INTO common.country VALUES ('BJ', 'Benin', 'Republic of Benin', 'BEN', 204, 'AF');
INSERT INTO common.country VALUES ('BL', 'Saint Barthélemy', 'Saint Barthelemy', 'BLM', 652, 'NA');
INSERT INTO common.country VALUES ('BM', 'Bermuda', 'Bermuda', 'BMU', 60, 'NA');
INSERT INTO common.country VALUES ('BN', 'Brunei Darussalam', 'Brunei Darussalam', 'BRN', 96, 'AS');
INSERT INTO common.country VALUES ('BO', 'Bolivia', 'Republic of Bolivia', 'BOL', 68, 'SA');
INSERT INTO common.country VALUES ('BR', 'Brazil', 'Federative Republic of Brazil', 'BRA', 76, 'SA');
INSERT INTO common.country VALUES ('BS', 'Bahamas', 'Commonwealth of the Bahamas', 'BHS', 44, 'NA');
INSERT INTO common.country VALUES ('BT', 'Bhutan', 'Kingdom of Bhutan', 'BTN', 64, 'AS');
INSERT INTO common.country VALUES ('BV', 'Bouvet Island', 'Bouvet Island (Bouvetoya)', 'BVT', 74, 'AN');
INSERT INTO common.country VALUES ('BW', 'Botswana', 'Republic of Botswana', 'BWA', 72, 'AF');
INSERT INTO common.country VALUES ('BY', 'Belarus', 'Republic of Belarus', 'BLR', 112, 'EU');
INSERT INTO common.country VALUES ('BZ', 'Belize', 'Belize', 'BLZ', 84, 'NA');
INSERT INTO common.country VALUES ('CA', 'Canada', 'Canada', 'CAN', 124, 'NA');
INSERT INTO common.country VALUES ('CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'CCK', 166, 'AS');
INSERT INTO common.country VALUES ('CD', 'Congo (Kinshasa)', 'Democratic Republic of the Congo', 'COD', 180, 'AF');
INSERT INTO common.country VALUES ('CF', 'Central African Republic', 'Central African Republic', 'CAF', 140, 'AF');
INSERT INTO common.country VALUES ('CG', 'Congo (Brazzaville)', 'Republic of the Congo', 'COG', 178, 'AF');
INSERT INTO common.country VALUES ('CH', 'Switzerland', 'Swiss Confederation', 'CHE', 756, 'EU');
INSERT INTO common.country VALUES ('CI', 'Côte d''Ivoire', 'Republic of Cote d''Ivoire', 'CIV', 384, 'AF');
INSERT INTO common.country VALUES ('CK', 'Cook Islands', 'Cook Islands', 'COK', 184, 'OC');
INSERT INTO common.country VALUES ('CL', 'Chile', 'Republic of Chile', 'CHL', 152, 'SA');
INSERT INTO common.country VALUES ('CM', 'Cameroon', 'Republic of Cameroon', 'CMR', 120, 'AF');
INSERT INTO common.country VALUES ('CN', 'China', 'People''s Republic of China', 'CHN', 156, 'AS');
INSERT INTO common.country VALUES ('CO', 'Colombia', 'Republic of Colombia', 'COL', 170, 'SA');
INSERT INTO common.country VALUES ('CR', 'Costa Rica', 'Republic of Costa Rica', 'CRI', 188, 'NA');
INSERT INTO common.country VALUES ('CU', 'Cuba', 'Republic of Cuba', 'CUB', 192, 'NA');
INSERT INTO common.country VALUES ('CV', 'Cape Verde', 'Republic of Cape Verde', 'CPV', 132, 'AF');
INSERT INTO common.country VALUES ('CX', 'Christmas Island', 'Christmas Island', 'CXR', 162, 'AS');
INSERT INTO common.country VALUES ('CY', 'Cyprus', 'Republic of Cyprus', 'CYP', 196, 'AS');
INSERT INTO common.country VALUES ('CZ', 'Czech Republic', 'Czech Republic', 'CZE', 203, 'EU');
INSERT INTO common.country VALUES ('DE', 'Germany', 'Federal Republic of Germany', 'DEU', 276, 'EU');
INSERT INTO common.country VALUES ('DJ', 'Djibouti', 'Republic of Djibouti', 'DJI', 262, 'AF');
INSERT INTO common.country VALUES ('DK', 'Denmark', 'Kingdom of Denmark', 'DNK', 208, 'EU');
INSERT INTO common.country VALUES ('DM', 'Dominica', 'Commonwealth of Dominica', 'DMA', 212, 'NA');
INSERT INTO common.country VALUES ('DO', 'Dominican Republic', 'Dominican Republic', 'DOM', 214, 'NA');
INSERT INTO common.country VALUES ('DZ', 'Algeria', 'People''s Democratic Republic of Algeria', 'DZA', 12, 'AF');
INSERT INTO common.country VALUES ('EC', 'Ecuador', 'Republic of Ecuador', 'ECU', 218, 'SA');
INSERT INTO common.country VALUES ('EE', 'Estonia', 'Republic of Estonia', 'EST', 233, 'EU');
INSERT INTO common.country VALUES ('EG', 'Egypt', 'Arab Republic of Egypt', 'EGY', 818, 'AF');
INSERT INTO common.country VALUES ('EH', 'Western Sahara', 'Western Sahara', 'ESH', 732, 'AF');
INSERT INTO common.country VALUES ('ER', 'Eritrea', 'State of Eritrea', 'ERI', 232, 'AF');
INSERT INTO common.country VALUES ('ES', 'Spain', 'Kingdom of Spain', 'ESP', 724, 'EU');
INSERT INTO common.country VALUES ('ET', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 'ETH', 231, 'AF');
INSERT INTO common.country VALUES ('FI', 'Finland', 'Republic of Finland', 'FIN', 246, 'EU');
INSERT INTO common.country VALUES ('FJ', 'Fiji', 'Republic of the Fiji Islands', 'FJI', 242, 'OC');
INSERT INTO common.country VALUES ('FK', 'Falkland Islands', 'Falkland Islands (Malvinas)', 'FLK', 238, 'SA');
INSERT INTO common.country VALUES ('FM', 'Micronesia', 'Federated States of Micronesia', 'FSM', 583, 'OC');
INSERT INTO common.country VALUES ('FO', 'Faroe Islands', 'Faroe Islands', 'FRO', 234, 'EU');
INSERT INTO common.country VALUES ('FR', 'France', 'French Republic', 'FRA', 250, 'EU');
INSERT INTO common.country VALUES ('GA', 'Gabon', 'Gabonese Republic', 'GAB', 266, 'AF');
INSERT INTO common.country VALUES ('GB', 'United Kingdom', 'United Kingdom of Great Britain & Northern Ireland', 'GBR', 826, 'EU');
INSERT INTO common.country VALUES ('GD', 'Grenada', 'Grenada', 'GRD', 308, 'NA');
INSERT INTO common.country VALUES ('GE', 'Georgia', 'Georgia', 'GEO', 268, 'AS');
INSERT INTO common.country VALUES ('GF', 'French Guiana', 'French Guiana', 'GUF', 254, 'SA');
INSERT INTO common.country VALUES ('GG', 'Guernsey', 'Bailiwick of Guernsey', 'GGY', 831, 'EU');
INSERT INTO common.country VALUES ('GH', 'Ghana', 'Republic of Ghana', 'GHA', 288, 'AF');
INSERT INTO common.country VALUES ('GI', 'Gibraltar', 'Gibraltar', 'GIB', 292, 'EU');
INSERT INTO common.country VALUES ('GL', 'Greenland', 'Greenland', 'GRL', 304, 'NA');
INSERT INTO common.country VALUES ('GM', 'Gambia', 'Republic of the Gambia', 'GMB', 270, 'AF');
INSERT INTO common.country VALUES ('GN', 'Guinea', 'Republic of Guinea', 'GIN', 324, 'AF');
INSERT INTO common.country VALUES ('GP', 'Guadeloupe', 'Guadeloupe', 'GLP', 312, 'NA');
INSERT INTO common.country VALUES ('GQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', 'GNQ', 226, 'AF');
INSERT INTO common.country VALUES ('GR', 'Greece', 'Hellenic Republic Greece', 'GRC', 300, 'EU');
INSERT INTO common.country VALUES ('GS', 'South Georgia and South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'SGS', 239, 'AN');
INSERT INTO common.country VALUES ('GT', 'Guatemala', 'Republic of Guatemala', 'GTM', 320, 'NA');
INSERT INTO common.country VALUES ('GU', 'Guam', 'Guam', 'GUM', 316, 'OC');
INSERT INTO common.country VALUES ('GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'GNB', 624, 'AF');
INSERT INTO common.country VALUES ('GY', 'Guyana', 'Co-operative Republic of Guyana', 'GUY', 328, 'SA');
INSERT INTO common.country VALUES ('HK', 'Hong Kong', 'Hong Kong Special Administrative Region of China', 'HKG', 344, 'AS');
INSERT INTO common.country VALUES ('HM', 'Heard and McDonald Islands', 'Heard Island and McDonald Islands', 'HMD', 334, 'AN');
INSERT INTO common.country VALUES ('HN', 'Honduras', 'Republic of Honduras', 'HND', 340, 'NA');
INSERT INTO common.country VALUES ('HR', 'Croatia', 'Republic of Croatia', 'HRV', 191, 'EU');
INSERT INTO common.country VALUES ('HT', 'Haiti', 'Republic of Haiti', 'HTI', 332, 'NA');
INSERT INTO common.country VALUES ('HU', 'Hungary', 'Republic of Hungary', 'HUN', 348, 'EU');
INSERT INTO common.country VALUES ('ID', 'Indonesia', 'Republic of Indonesia', 'IDN', 360, 'AS');
INSERT INTO common.country VALUES ('IE', 'Ireland', 'Ireland', 'IRL', 372, 'EU');
INSERT INTO common.country VALUES ('IL', 'Israel', 'State of Israel', 'ISR', 376, 'AS');
INSERT INTO common.country VALUES ('IM', 'Isle of Man', 'Isle of Man', 'IMN', 833, 'EU');
INSERT INTO common.country VALUES ('IN', 'India', 'Republic of India', 'IND', 356, 'AS');
INSERT INTO common.country VALUES ('IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory (Chagos Archipelago)', 'IOT', 86, 'AS');
INSERT INTO common.country VALUES ('IQ', 'Iraq', 'Republic of Iraq', 'IRQ', 368, 'AS');
INSERT INTO common.country VALUES ('IR', 'Iran', 'Islamic Republic of Iran', 'IRN', 364, 'AS');
INSERT INTO common.country VALUES ('IS', 'Iceland', 'Republic of Iceland', 'ISL', 352, 'EU');
INSERT INTO common.country VALUES ('IT', 'Italy', 'Italian Republic', 'ITA', 380, 'EU');
INSERT INTO common.country VALUES ('JE', 'Jersey', 'Bailiwick of Jersey', 'JEY', 832, 'EU');
INSERT INTO common.country VALUES ('JM', 'Jamaica', 'Jamaica', 'JAM', 388, 'NA');
INSERT INTO common.country VALUES ('JO', 'Jordan', 'Hashemite Kingdom of Jordan', 'JOR', 400, 'AS');
INSERT INTO common.country VALUES ('JP', 'Japan', 'Japan', 'JPN', 392, 'AS');
INSERT INTO common.country VALUES ('KE', 'Kenya', 'Republic of Kenya', 'KEN', 404, 'AF');
INSERT INTO common.country VALUES ('KG', 'Kyrgyzstan', 'Kyrgyz Republic', 'KGZ', 417, 'AS');
INSERT INTO common.country VALUES ('KH', 'Cambodia', 'Kingdom of Cambodia', 'KHM', 116, 'AS');
INSERT INTO common.country VALUES ('KI', 'Kiribati', 'Republic of Kiribati', 'KIR', 296, 'OC');
INSERT INTO common.country VALUES ('KM', 'Comoros', 'Union of the Comoros', 'COM', 174, 'AF');
INSERT INTO common.country VALUES ('KN', 'Saint Kitts and Nevis', 'Federation of Saint Kitts and Nevis', 'KNA', 659, 'NA');
INSERT INTO common.country VALUES ('KP', 'Korea, North', 'Democratic People''s Republic of Korea', 'PRK', 408, 'AS');
INSERT INTO common.country VALUES ('KR', 'Korea, South', 'Republic of Korea', 'KOR', 410, 'AS');
INSERT INTO common.country VALUES ('KW', 'Kuwait', 'State of Kuwait', 'KWT', 414, 'AS');
INSERT INTO common.country VALUES ('KY', 'Cayman Islands', 'Cayman Islands', 'CYM', 136, 'NA');
INSERT INTO common.country VALUES ('KZ', 'Kazakhstan', 'Republic of Kazakhstan', 'KAZ', 398, 'AS');
INSERT INTO common.country VALUES ('LA', 'Laos', 'Lao People''s Democratic Republic', 'LAO', 418, 'AS');
INSERT INTO common.country VALUES ('LB', 'Lebanon', 'Lebanese Republic', 'LBN', 422, 'AS');
INSERT INTO common.country VALUES ('LC', 'Saint Lucia', 'Saint Lucia', 'LCA', 662, 'NA');
INSERT INTO common.country VALUES ('LI', 'Liechtenstein', 'Principality of Liechtenstein', 'LIE', 438, 'EU');
INSERT INTO common.country VALUES ('LK', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 'LKA', 144, 'AS');
INSERT INTO common.country VALUES ('LR', 'Liberia', 'Republic of Liberia', 'LBR', 430, 'AF');
INSERT INTO common.country VALUES ('LS', 'Lesotho', 'Kingdom of Lesotho', 'LSO', 426, 'AF');
INSERT INTO common.country VALUES ('LT', 'Lithuania', 'Republic of Lithuania', 'LTU', 440, 'EU');
INSERT INTO common.country VALUES ('LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 'LUX', 442, 'EU');
INSERT INTO common.country VALUES ('LV', 'Latvia', 'Republic of Latvia', 'LVA', 428, 'EU');
INSERT INTO common.country VALUES ('LY', 'Libya', 'Libyan Arab Jamahiriya', 'LBY', 434, 'AF');
INSERT INTO common.country VALUES ('MA', 'Morocco', 'Kingdom of Morocco', 'MAR', 504, 'AF');
INSERT INTO common.country VALUES ('MC', 'Monaco', 'Principality of Monaco', 'MCO', 492, 'EU');
INSERT INTO common.country VALUES ('MD', 'Moldova', 'Republic of Moldova', 'MDA', 498, 'EU');
INSERT INTO common.country VALUES ('ME', 'Montenegro', 'Republic of Montenegro', 'MNE', 499, 'EU');
INSERT INTO common.country VALUES ('MF', 'Saint Martin (French part)', 'Saint Martin', 'MAF', 663, 'NA');
INSERT INTO common.country VALUES ('MG', 'Madagascar', 'Republic of Madagascar', 'MDG', 450, 'AF');
INSERT INTO common.country VALUES ('MH', 'Marshall Islands', 'Republic of the Marshall Islands', 'MHL', 584, 'OC');
INSERT INTO common.country VALUES ('MK', 'Macedonia', 'Republic of Macedonia', 'MKD', 807, 'EU');
INSERT INTO common.country VALUES ('ML', 'Mali', 'Republic of Mali', 'MLI', 466, 'AF');
INSERT INTO common.country VALUES ('MM', 'Myanmar', 'Union of Myanmar', 'MMR', 104, 'AS');
INSERT INTO common.country VALUES ('MN', 'Mongolia', 'Mongolia', 'MNG', 496, 'AS');
INSERT INTO common.country VALUES ('MO', 'Macau', 'Macao Special Administrative Region of China', 'MAC', 446, 'AS');
INSERT INTO common.country VALUES ('MP', 'Northern Mariana Islands', 'Commonwealth of the Northern Mariana Islands', 'MNP', 580, 'OC');
INSERT INTO common.country VALUES ('MQ', 'Martinique', 'Martinique', 'MTQ', 474, 'NA');
INSERT INTO common.country VALUES ('MR', 'Mauritania', 'Islamic Republic of Mauritania', 'MRT', 478, 'AF');
INSERT INTO common.country VALUES ('MS', 'Montserrat', 'Montserrat', 'MSR', 500, 'NA');
INSERT INTO common.country VALUES ('MT', 'Malta', 'Republic of Malta', 'MLT', 470, 'EU');
INSERT INTO common.country VALUES ('MU', 'Mauritius', 'Republic of Mauritius', 'MUS', 480, 'AF');
INSERT INTO common.country VALUES ('MV', 'Maldives', 'Republic of Maldives', 'MDV', 462, 'AS');
INSERT INTO common.country VALUES ('MW', 'Malawi', 'Republic of Malawi', 'MWI', 454, 'AF');
INSERT INTO common.country VALUES ('MX', 'Mexico', 'United Mexican States', 'MEX', 484, 'NA');
INSERT INTO common.country VALUES ('MY', 'Malaysia', 'Malaysia', 'MYS', 458, 'AS');
INSERT INTO common.country VALUES ('MZ', 'Mozambique', 'Republic of Mozambique', 'MOZ', 508, 'AF');
INSERT INTO common.country VALUES ('NA', 'Namibia', 'Republic of Namibia', 'NAM', 516, 'AF');
INSERT INTO common.country VALUES ('NC', 'New Caledonia', 'New Caledonia', 'NCL', 540, 'OC');
INSERT INTO common.country VALUES ('NE', 'Niger', 'Republic of Niger', 'NER', 562, 'AF');
INSERT INTO common.country VALUES ('NF', 'Norfolk Island', 'Norfolk Island', 'NFK', 574, 'OC');
INSERT INTO common.country VALUES ('NG', 'Nigeria', 'Federal Republic of Nigeria', 'NGA', 566, 'AF');
INSERT INTO common.country VALUES ('NI', 'Nicaragua', 'Republic of Nicaragua', 'NIC', 558, 'NA');
INSERT INTO common.country VALUES ('NL', 'Netherlands', 'Kingdom of the Netherlands', 'NLD', 528, 'EU');
INSERT INTO common.country VALUES ('NO', 'Norway', 'Kingdom of Norway', 'NOR', 578, 'EU');
INSERT INTO common.country VALUES ('NP', 'Nepal', 'State of Nepal', 'NPL', 524, 'AS');
INSERT INTO common.country VALUES ('NR', 'Nauru', 'Republic of Nauru', 'NRU', 520, 'OC');
INSERT INTO common.country VALUES ('NU', 'Niue', 'Niue', 'NIU', 570, 'OC');
INSERT INTO common.country VALUES ('NZ', 'New Zealand', 'New Zealand', 'NZL', 554, 'OC');
INSERT INTO common.country VALUES ('OM', 'Oman', 'Sultanate of Oman', 'OMN', 512, 'AS');
INSERT INTO common.country VALUES ('PA', 'Panama', 'Republic of Panama', 'PAN', 591, 'NA');
INSERT INTO common.country VALUES ('PE', 'Peru', 'Republic of Peru', 'PER', 604, 'SA');
INSERT INTO common.country VALUES ('PF', 'French Polynesia', 'French Polynesia', 'PYF', 258, 'OC');
INSERT INTO common.country VALUES ('PG', 'Papua New Guinea', 'Independent State of Papua New Guinea', 'PNG', 598, 'OC');
INSERT INTO common.country VALUES ('PH', 'Philippines', 'Republic of the Philippines', 'PHL', 608, 'AS');
INSERT INTO common.country VALUES ('PK', 'Pakistan', 'Islamic Republic of Pakistan', 'PAK', 586, 'AS');
INSERT INTO common.country VALUES ('PL', 'Poland', 'Republic of Poland', 'POL', 616, 'EU');
INSERT INTO common.country VALUES ('PM', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'SPM', 666, 'NA');
INSERT INTO common.country VALUES ('PN', 'Pitcairn', 'Pitcairn Islands', 'PCN', 612, 'OC');
INSERT INTO common.country VALUES ('PR', 'Puerto Rico', 'Commonwealth of Puerto Rico', 'PRI', 630, 'NA');
INSERT INTO common.country VALUES ('PS', 'Palestine', 'Occupied Palestinian Territory', 'PSE', 275, 'AS');
INSERT INTO common.country VALUES ('PT', 'Portugal', 'Portuguese Republic', 'PRT', 620, 'EU');
INSERT INTO common.country VALUES ('PW', 'Palau', 'Republic of Palau', 'PLW', 585, 'OC');
INSERT INTO common.country VALUES ('PY', 'Paraguay', 'Republic of Paraguay', 'PRY', 600, 'SA');
INSERT INTO common.country VALUES ('QA', 'Qatar', 'State of Qatar', 'QAT', 634, 'AS');
INSERT INTO common.country VALUES ('RE', 'Reunion', 'Reunion', 'REU', 638, 'AF');
INSERT INTO common.country VALUES ('RO', 'Romania', 'Romania', 'ROU', 642, 'EU');
INSERT INTO common.country VALUES ('RS', 'Serbia', 'Republic of Serbia', 'SRB', 688, 'EU');
INSERT INTO common.country VALUES ('RU', 'Russian Federation', 'Russian Federation', 'RUS', 643, 'EU');
INSERT INTO common.country VALUES ('RW', 'Rwanda', 'Republic of Rwanda', 'RWA', 646, 'AF');
INSERT INTO common.country VALUES ('SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'SAU', 682, 'AS');
INSERT INTO common.country VALUES ('SB', 'Solomon Islands', 'Solomon Islands', 'SLB', 90, 'OC');
INSERT INTO common.country VALUES ('SC', 'Seychelles', 'Republic of Seychelles', 'SYC', 690, 'AF');
INSERT INTO common.country VALUES ('SD', 'Sudan', 'Republic of Sudan', 'SDN', 736, 'AF');
INSERT INTO common.country VALUES ('SE', 'Sweden', 'Kingdom of Sweden', 'SWE', 752, 'EU');
INSERT INTO common.country VALUES ('SG', 'Singapore', 'Republic of Singapore', 'SGP', 702, 'AS');
INSERT INTO common.country VALUES ('SH', 'Saint Helena', 'Saint Helena', 'SHN', 654, 'AF');
INSERT INTO common.country VALUES ('SI', 'Slovenia', 'Republic of Slovenia', 'SVN', 705, 'EU');
INSERT INTO common.country VALUES ('SJ', 'Svalbard and Jan Mayen Islands', 'Svalbard & Jan Mayen Islands', 'SJM', 744, 'EU');
INSERT INTO common.country VALUES ('SK', 'Slovakia', 'Slovakia (Slovak Republic)', 'SVK', 703, 'EU');
INSERT INTO common.country VALUES ('SL', 'Sierra Leone', 'Republic of Sierra Leone', 'SLE', 694, 'AF');
INSERT INTO common.country VALUES ('SM', 'San Marino', 'Republic of San Marino', 'SMR', 674, 'EU');
INSERT INTO common.country VALUES ('SN', 'Senegal', 'Republic of Senegal', 'SEN', 686, 'AF');
INSERT INTO common.country VALUES ('SO', 'Somalia', 'Somali Republic', 'SOM', 706, 'AF');
INSERT INTO common.country VALUES ('SR', 'Suriname', 'Republic of Suriname', 'SUR', 740, 'SA');
INSERT INTO common.country VALUES ('ST', 'Sao Tome and Principe', 'Democratic Republic of Sao Tome and Principe', 'STP', 678, 'AF');
INSERT INTO common.country VALUES ('SV', 'El Salvador', 'Republic of El Salvador', 'SLV', 222, 'NA');
INSERT INTO common.country VALUES ('SY', 'Syria', 'Syrian Arab Republic', 'SYR', 760, 'AS');
INSERT INTO common.country VALUES ('SZ', 'Swaziland', 'Kingdom of Swaziland', 'SWZ', 748, 'AF');
INSERT INTO common.country VALUES ('TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'TCA', 796, 'NA');
INSERT INTO common.country VALUES ('TD', 'Chad', 'Republic of Chad', 'TCD', 148, 'AF');
INSERT INTO common.country VALUES ('TF', 'French Southern Lands', 'French Southern Territories', 'ATF', 260, 'AN');
INSERT INTO common.country VALUES ('TG', 'Togo', 'Togolese Republic', 'TGO', 768, 'AF');
INSERT INTO common.country VALUES ('TH', 'Thailand', 'Kingdom of Thailand', 'THA', 764, 'AS');
INSERT INTO common.country VALUES ('TJ', 'Tajikistan', 'Republic of Tajikistan', 'TJK', 762, 'AS');
INSERT INTO common.country VALUES ('TK', 'Tokelau', 'Tokelau', 'TKL', 772, 'OC');
INSERT INTO common.country VALUES ('TL', 'Timor-Leste', 'Democratic Republic of Timor-Leste', 'TLS', 626, 'AS');
INSERT INTO common.country VALUES ('TM', 'Turkmenistan', 'Turkmenistan', 'TKM', 795, 'AS');
INSERT INTO common.country VALUES ('TN', 'Tunisia', 'Tunisian Republic', 'TUN', 788, 'AF');
INSERT INTO common.country VALUES ('TO', 'Tonga', 'Kingdom of Tonga', 'TON', 776, 'OC');
INSERT INTO common.country VALUES ('TR', 'Turkey', 'Republic of Turkey', 'TUR', 792, 'AS');
INSERT INTO common.country VALUES ('TT', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 'TTO', 780, 'NA');
INSERT INTO common.country VALUES ('TV', 'Tuvalu', 'Tuvalu', 'TUV', 798, 'OC');
INSERT INTO common.country VALUES ('TW', 'Taiwan', 'Taiwan', 'TWN', 158, 'AS');
INSERT INTO common.country VALUES ('TZ', 'Tanzania', 'United Republic of Tanzania', 'TZA', 834, 'AF');
INSERT INTO common.country VALUES ('UA', 'Ukraine', 'Ukraine', 'UKR', 804, 'EU');
INSERT INTO common.country VALUES ('UG', 'Uganda', 'Republic of Uganda', 'UGA', 800, 'AF');
INSERT INTO common.country VALUES ('UM', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', 'UMI', 581, 'OC');
INSERT INTO common.country VALUES ('US', 'United States of America', 'United States of America', 'USA', 840, 'NA');
INSERT INTO common.country VALUES ('UY', 'Uruguay', 'Eastern Republic of Uruguay', 'URY', 858, 'SA');
INSERT INTO common.country VALUES ('UZ', 'Uzbekistan', 'Republic of Uzbekistan', 'UZB', 860, 'AS');
INSERT INTO common.country VALUES ('VA', 'Vatican City', 'Holy See (Vatican City State)', 'VAT', 336, 'EU');
INSERT INTO common.country VALUES ('VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'VCT', 670, 'NA');
INSERT INTO common.country VALUES ('VE', 'Venezuela', 'Bolivarian Republic of Venezuela', 'VEN', 862, 'SA');
INSERT INTO common.country VALUES ('VG', 'Virgin Islands, British', 'British Virgin Islands', 'VGB', 92, 'NA');
INSERT INTO common.country VALUES ('VI', 'Virgin Islands, U.S.', 'United States Virgin Islands', 'VIR', 850, 'NA');
INSERT INTO common.country VALUES ('VN', 'Vietnam', 'Socialist Republic of Vietnam', 'VNM', 704, 'AS');
INSERT INTO common.country VALUES ('VU', 'Vanuatu', 'Republic of Vanuatu', 'VUT', 548, 'OC');
INSERT INTO common.country VALUES ('WF', 'Wallis and Futuna Islands', 'Wallis and Futuna', 'WLF', 876, 'OC');
INSERT INTO common.country VALUES ('WS', 'Samoa', 'Independent State of Samoa', 'WSM', 882, 'OC');
INSERT INTO common.country VALUES ('YE', 'Yemen', 'Yemen', 'YEM', 887, 'AS');
INSERT INTO common.country VALUES ('YT', 'Mayotte', 'Mayotte', 'MYT', 175, 'AF');
INSERT INTO common.country VALUES ('ZA', 'South Africa', 'Republic of South Africa', 'ZAF', 710, 'AF');
INSERT INTO common.country VALUES ('ZM', 'Zambia', 'Republic of Zambia', 'ZMB', 894, 'AF');
INSERT INTO common.country VALUES ('ZW', 'Zimbabwe', 'Republic of Zimbabwe', 'ZWE', 716, 'AF');
INSERT INTO common.country VALUES ('BQ', 'Bonaire', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 'NA');
INSERT INTO common.country VALUES ('CW', 'Curaçao', 'Curaçao', 'CUW', 531, 'NA');
INSERT INTO common.country VALUES ('SS', 'South Sudan', 'South Sudan', 'SSD', 728, 'AF');
INSERT INTO common.country VALUES ('SX', 'Sint Maarten', 'Sint Maarten (Dutch part)', 'SXM', 534, 'NA');
INSERT INTO common.country VALUES ('XK', 'Kosovo', 'Kosovo', '   ', 0, 'EU');

-- TOC entry 3428 (class 0 OID 16630)
-- Dependencies: 224
-- Data for Name: datasource; Type: TABLE DATA; Schema: common; Owner: postgres

INSERT INTO common.datasource VALUES (1, 'ENTSO-E', 'ENTSO-E', 'https://transparency.entsoe.eu', 'MK', '2024-05-27 22:00:00+00');

INSERT INTO common.fueltype VALUES (1, 'Mixed', NULL);
INSERT INTO common.fueltype VALUES (2, 'Generation', NULL);
INSERT INTO common.fueltype VALUES (3, 'Load', NULL);
INSERT INTO common.fueltype VALUES (4, 'Biomass', NULL);
INSERT INTO common.fueltype VALUES (5, 'Fossil Brown coal/Lignite', NULL);
INSERT INTO common.fueltype VALUES (6, 'Fossil Coal-derived gas', NULL);
INSERT INTO common.fueltype VALUES (7, 'Fossil Gas', NULL);
INSERT INTO common.fueltype VALUES (8, 'Fossil Hard coal', NULL);
INSERT INTO common.fueltype VALUES (9, 'Fossil Oil', NULL);
INSERT INTO common.fueltype VALUES (10, 'Fossil Oil shale', NULL);
INSERT INTO common.fueltype VALUES (11, 'Fossil Peat', NULL);
INSERT INTO common.fueltype VALUES (12, 'Geothermal', NULL);
INSERT INTO common.fueltype VALUES (13, 'Hydro Pumped Storage', NULL);
INSERT INTO common.fueltype VALUES (14, 'Hydro Run-of-river and poundage', NULL);
INSERT INTO common.fueltype VALUES (15, 'Hydro Water Reservoir', NULL);
INSERT INTO common.fueltype VALUES (16, 'Marine', NULL);
INSERT INTO common.fueltype VALUES (17, 'Nuclear', NULL);
INSERT INTO common.fueltype VALUES (18, 'Other renewable', NULL);
INSERT INTO common.fueltype VALUES (19, 'Solar', NULL);
INSERT INTO common.fueltype VALUES (20, 'Waste', NULL);
INSERT INTO common.fueltype VALUES (21, 'Wind Offshore', NULL);
INSERT INTO common.fueltype VALUES (22, 'Wind Onshore', NULL);
INSERT INTO common.fueltype VALUES (23, 'Other', NULL);
INSERT INTO common.fueltype VALUES (24, 'AC Link', NULL);
INSERT INTO common.fueltype VALUES (25, 'DC Link', NULL);
INSERT INTO common.fueltype VALUES (26, 'Substation', NULL);

SELECT pg_catalog.setval('common.area_id_seq', 166, true);
SELECT pg_catalog.setval('common.border_id_seq', 334, true);
SELECT pg_catalog.setval('common.datasource_id_seq', 1, true);
SELECT pg_catalog.setval('common.fueltype_id_seq', 26, true);
SELECT pg_catalog.setval('common.powerplant_id_seq', 1, false);
SELECT pg_catalog.setval('common.unit_id_seq', 1, false);
