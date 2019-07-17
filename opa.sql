--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-07-17 12:15:54 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 24996)
-- Name: administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE administrador (
    cd_administrador numeric(10,10) NOT NULL,
    nm_nome character varying(100),
    nr_cpf character varying(100),
    nr_telefone character varying(100),
    ds_senha character varying(100)
);


ALTER TABLE administrador OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 24978)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    nm_nome character varying(100) NOT NULL,
    nr_telefone character varying(100),
    nr_cpf character varying(100),
    nr_rg character varying(100),
    ds_senha character varying(100),
    ds_email character varying(100),
    endereco character varying(100)
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 24990)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 2144 (class 0 OID 24996)
-- Dependencies: 183
-- Data for Name: administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY administrador (cd_administrador, nm_nome, nr_cpf, nr_telefone, ds_senha) FROM stdin;
\.


--
-- TOC entry 2142 (class 0 OID 24978)
-- Dependencies: 181
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (nm_nome, nr_telefone, nr_cpf, nr_rg, ds_senha, ds_email, endereco) FROM stdin;
Jovanni	984102551	1740579820	15450087	123	\N	Rua da praioa
Daniel	996091552	17405478921	14520450540	123	danielvcs@gmail.com	Rua da praia
Hillary	999346500	174052103458	142055100	ficanapista	souzahillary@gmail.com	Centro
Cesar					filexicientista@gmail.com	
\.


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 182
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


--
-- TOC entry 2027 (class 2606 OID 25000)
-- Name: pk_administrador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY administrador
    ADD CONSTRAINT pk_administrador PRIMARY KEY (cd_administrador);


--
-- TOC entry 2025 (class 2606 OID 25002)
-- Name: pk_cliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_cliente PRIMARY KEY (nm_nome);


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-07-17 12:15:55 BRT

--
-- PostgreSQL database dump complete
--

