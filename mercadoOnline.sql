--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2019-11-13 12:41:54 BRST

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
-- TOC entry 2175 (class 0 OID 0)
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
    id_admin integer NOT NULL
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
    id_produto integer NOT NULL,
    dt_promocao timestamp with time zone,
    vl_unidade numeric,
    vl_promocao numeric,
    ds_descricao character varying(100),
    ft_produto bytea,
    extensao character varying,
    id_sessao integer
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 42248)
-- Name: sessao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sessao (
    id_sessao integer NOT NULL,
    nm_nome character varying(100)
);


ALTER TABLE sessao OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 42127)
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
-- TOC entry 186 (class 1259 OID 42155)
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
-- TOC entry 185 (class 1259 OID 42129)
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
-- TOC entry 2161 (class 0 OID 42106)
-- Dependencies: 181
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admin (nm_nome, nr_cpf, ds_senha, nr_telefone, id_admin) FROM stdin;
Eduarda	11122233345	1234	98727534	200
Ana	11122233347	12345	98726777	25
\.


--
-- TOC entry 2162 (class 0 OID 42109)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (nr_telefone, nr_cpf, nr_rg, ds_senha, ds_email, endereco, nm_nome, id) FROM stdin;
997439238	11122233344	123456789	123	jovani@gmail.com	Rua oi	Jovani	1
\.


--
-- TOC entry 2163 (class 0 OID 42115)
-- Dependencies: 183
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto (nm_nome, nm_marca, id_produto, dt_promocao, vl_unidade, vl_promocao, ds_descricao, ft_produto, extensao, id_sessao) FROM stdin;
Queijo Branco	Minas	2	\N	6.9	\N	Queijo Minas artesanal	\N	\N	10
Leite desnatado	Parmalat	3	\N	4.9	\N	Leite Parmalat 1L	\N	\N	10
Mortadela defumada 	Sadia	4	\N	3.9	\N	Mortadela defumada Kg	\N	\N	10
Iogurte	Vigor	1	\N	5.9	\N	Iogurte de morango 1L	\N	image/jpeg	10
\.


--
-- TOC entry 2167 (class 0 OID 42248)
-- Dependencies: 187
-- Data for Name: sessao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessao (id_sessao, nm_nome) FROM stdin;
10	frios e laticinios
\.


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 184
-- Name: sq_admin; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_admin', 4, true);


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 186
-- Name: sq_ftproduto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_ftproduto', 2, true);


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 185
-- Name: sq_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sq_usuario', 2, true);


--
-- TOC entry 2043 (class 2606 OID 42148)
-- Name: id_produto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT id_produto PRIMARY KEY (id_produto);


--
-- TOC entry 2038 (class 2606 OID 42132)
-- Name: pk_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT pk_id PRIMARY KEY (id_admin);


--
-- TOC entry 2040 (class 2606 OID 42134)
-- Name: pk_idc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT pk_idc PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 42252)
-- Name: pk_sessao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT pk_sessao PRIMARY KEY (id_sessao);


--
-- TOC entry 2041 (class 1259 OID 42258)
-- Name: fki_sessao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sessao ON produto USING btree (id_sessao);


--
-- TOC entry 2046 (class 2606 OID 42253)
-- Name: fk_sessao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT fk_sessao FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao);


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-11-13 12:41:55 BRST

--
-- PostgreSQL database dump complete
--

