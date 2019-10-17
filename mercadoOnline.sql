--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-10-16 12:17:53 BRT

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
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 42106)
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
-- TOC entry 182 (class 1259 OID 42109)
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
-- TOC entry 183 (class 1259 OID 42115)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    nm_nome character varying(500),
    nm_marca character varying(500),
    id_sessao integer,
    id_produto integer NOT NULL,
    dt_promocao timestamp with time zone,
    vl_unidade numeric,
    vl_promocao numeric,
    ds_descricao character varying(100),
    ft_produto bytea,
    extensao character varying
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 42121)
-- Name: sessao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessao (
    nm_nome character varying(500),
    id_sessao integer NOT NULL
);


ALTER TABLE sessao OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 42127)
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
-- TOC entry 187 (class 1259 OID 42155)
-- Name: sq_ftproduto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sq_ftproduto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sq_ftproduto OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 42129)
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
-- TOC entry 2162 (class 0 OID 42106)
-- Dependencies: 181
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin (nm_nome, nr_cpf, ds_senha, nr_telefone, id) FROM stdin;
Joana	11122233344	123456789	998741520	152
\.


--
-- TOC entry 2163 (class 0 OID 42109)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (nr_telefone, nr_cpf, nr_rg, ds_senha, ds_email, endereco, nm_nome, id) FROM stdin;
\.


--
-- TOC entry 2164 (class 0 OID 42115)
-- Dependencies: 183
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto (nm_nome, nm_marca, id_sessao, id_produto, dt_promocao, vl_unidade, vl_promocao, ds_descricao, ft_produto, extensao) FROM stdin;
Leite desnatado	Parmalat	10	3	2019-04-12 00:00:00-03	4.90	5.90	Leite Parmalat 1L	\N	\N
Mortadela defumada 	Sadia	10	4	2019-04-12 00:00:00-03	3.90	2.90	Mortadela defumada Kg	\N	\N
Queijo Branco	Minas	10	2	2019-04-12 00:00:00-03	6.90	4.90	Queijo Minas artesanal	\N	\N
Iorgute	Vigor	10	1	2019-04-12 00:00:00-03	12.90	9.90	Iorgute de morango 1L	\N	image/jpeg
\.


--
-- TOC entry 2165 (class 0 OID 42121)
-- Dependencies: 184
-- Data for Name: sessao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessao (nm_nome, id_sessao) FROM stdin;
Bebidas	20
Frutas	30
Higiene	40
Verduras	50
enlatados	60
frioselaticínios	10
\.


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_admin; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_admin', 2, true);


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 187
-- Name: sq_ftproduto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_ftproduto', 2, true);


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 2, true);


--
-- TOC entry 2044 (class 2606 OID 42148)
-- Name: id_produto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT id_produto PRIMARY KEY (id_produto);


--
-- TOC entry 2046 (class 2606 OID 42146)
-- Name: id_sessao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT id_sessao PRIMARY KEY (id_sessao);


--
-- TOC entry 2039 (class 2606 OID 42132)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 42134)
-- Name: pk_idc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_idc PRIMARY KEY (id);


--
-- TOC entry 2042 (class 1259 OID 42154)
-- Name: fki_id_sessao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_sessao ON produto USING btree (id_sessao);


--
-- TOC entry 2047 (class 2606 OID 42149)
-- Name: id_sessao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT id_sessao FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao);


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-16 12:17:54 BRT

--
-- PostgreSQL database dump complete
--

