--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-02 12:12:41 BRT

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
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 33670)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admin (
    nm_nome character varying(100),
    nr_cpf character varying(100),
    ds_senha character varying(100),
    nr_telefone character varying(100),
    id integer NOT NULL
);


ALTER TABLE admin OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 33673)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    nr_telefone character varying(100),
    nr_cpf character varying(100),
    nr_rg character varying(100),
    ds_senha character varying(100),
    ds_email character varying(100),
    endereco character varying(100),
    nm_nome character varying(100),
    id integer NOT NULL
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33687)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    cd_produtos character varying(500) NOT NULL,
    nm_nome character varying(500),
    vl_unidade integer,
    nm_marca character varying(500),
    cd_sessao character varying(500),
    id integer
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 33692)
-- Name: sessao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessao (
    cd_sessao character varying(500) NOT NULL,
    nm_nome character varying(500)
);


ALTER TABLE sessao OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33679)
-- Name: sq_admin; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_admin
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_admin OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33681)
-- Name: sq_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_usuario OWNER TO postgres;

--
-- TOC entry 2160 (class 0 OID 33670)
-- Dependencies: 181
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2161 (class 0 OID 33673)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2164 (class 0 OID 33687)
-- Dependencies: 185
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2165 (class 0 OID 33692)
-- Dependencies: 186
-- Data for Name: sessao; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 183
-- Name: sq_admin; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_admin', 1, true);


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 2, true);


--
-- TOC entry 2037 (class 2606 OID 33684)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2039 (class 2606 OID 33686)
-- Name: pk_idc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_idc PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 33691)
-- Name: pk_produtos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT pk_produtos PRIMARY KEY (cd_produtos);


--
-- TOC entry 2044 (class 2606 OID 33702)
-- Name: pk_sessao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT pk_sessao PRIMARY KEY (cd_sessao);


--
-- TOC entry 2040 (class 1259 OID 33708)
-- Name: fki_cd_produto_cd_sessao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cd_produto_cd_sessao ON produto USING btree (cd_sessao);


--
-- TOC entry 2045 (class 2606 OID 33703)
-- Name: fk_cd_sessao_cd_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT fk_cd_sessao_cd_produto FOREIGN KEY (cd_sessao) REFERENCES produto(cd_produtos);


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-02 12:12:41 BRT

--
-- PostgreSQL database dump complete
--

