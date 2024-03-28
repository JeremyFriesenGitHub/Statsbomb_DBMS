--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-27 23:14:30

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 25107)
-- Name: competitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competitions (
    competition_id integer NOT NULL,
    name character varying(255),
    country_name character varying(255),
    gender character varying(50),
    youth boolean,
    international boolean
);


ALTER TABLE public.competitions OWNER TO postgres;

--
-- TOC entry 4832 (class 0 OID 25107)
-- Dependencies: 215
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competitions (competition_id, name, country_name, gender, youth, international) FROM stdin;
9	1. Bundesliga	Germany	male	f	f
16	Champions League	Europe	male	f	f
87	Copa del Rey	Spain	male	f	f
37	FA Women's Super League	England	female	f	f
1470	FIFA U20 World Cup	International	male	f	f
43	FIFA World Cup	International	male	f	t
1238	Indian Super league	India	male	f	f
11	La Liga	Spain	male	f	f
81	Liga Profesional	Argentina	male	f	f
7	Ligue 1	France	male	f	f
116	North American League	North and Central America	male	f	f
49	NWSL	United States of America	female	f	f
2	Premier League	England	male	f	f
12	Serie A	Italy	male	f	f
55	UEFA Euro	Europe	male	f	t
35	UEFA Europa League	Europe	male	f	f
53	UEFA Women's Euro	Europe	female	f	t
72	Women's World Cup	International	female	f	t
\.


--
-- TOC entry 4688 (class 2606 OID 25113)
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (competition_id);


-- Completed on 2024-03-27 23:14:40

--
-- PostgreSQL database dump complete
--

