--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-30 23:17:58

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
-- TOC entry 222 (class 1259 OID 25270)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    card_id integer NOT NULL,
    player_id integer,
    match_id integer,
    card_type character varying(255),
    card_time text
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25269)
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_card_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 221
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- TOC entry 215 (class 1259 OID 25209)
-- Name: competitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competitions (
    competition_id integer NOT NULL,
    competition_name character varying(255),
    country_name character varying(255),
    gender character varying(50),
    youth boolean,
    international boolean
);


ALTER TABLE public.competitions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25252)
-- Name: player_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_positions (
    player_id integer NOT NULL,
    position_id integer NOT NULL,
    match_id integer NOT NULL,
    from_time text NOT NULL,
    to_time text,
    from_period integer,
    to_period integer,
    start_reason text,
    end_reason text
);


ALTER TABLE public.player_positions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25240)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    player_name text NOT NULL,
    player_nickname text,
    jersey_number integer,
    country_id integer,
    country_name text,
    team_id integer
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25233)
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    position_id integer NOT NULL,
    position_name text NOT NULL
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25216)
-- Name: seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seasons (
    season_id integer NOT NULL,
    competition_id integer NOT NULL,
    season_name character varying(255),
    match_updated timestamp without time zone,
    match_available timestamp without time zone
);


ALTER TABLE public.seasons OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25226)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team_name text NOT NULL,
    country_id integer,
    country_name text
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 4712 (class 2604 OID 25273)
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- TOC entry 4882 (class 0 OID 25270)
-- Dependencies: 222
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (card_id, player_id, match_id, card_type, card_time) FROM stdin;
1	6839	15946	Yellow Card	09:15
2	6855	15946	Yellow Card	40:46
3	6760	15956	Yellow Card	48:43
4	6839	15946	Yellow Card	09:15
5	6855	15946	Yellow Card	40:46
6	6760	15956	Yellow Card	48:43
7	6734	15973	Yellow Card	25:38
8	11674	15973	Yellow Card	86:08
9	5492	15978	Yellow Card	86:32
10	6351	15986	Yellow Card	15:05
11	6572	15986	Yellow Card	60:25
12	6573	15986	Yellow Card	38:07
13	6579	15986	Yellow Card	67:22
14	6582	15986	Yellow Card	68:23
15	3991	15998	Yellow Card	87:15
16	6301	15998	Yellow Card	91:16
17	6598	15998	Yellow Card	48:02
18	6599	15998	Yellow Card	39:31
19	5203	16010	Yellow Card	88:25
20	5470	16010	Yellow Card	77:11
21	5503	16010	Yellow Card	93:53
22	3501	16023	Yellow Card	57:20
23	5246	16023	Yellow Card	40:39
24	11541	16029	Yellow Card	61:25
25	5563	16056	Yellow Card	23:53
26	6648	16056	Yellow Card	68:13
27	6658	16056	Yellow Card	65:52
28	5198	16073	Yellow Card	70:45
29	5484	16073	Yellow Card	38:22
30	5487	16073	Yellow Card	47:46
31	6320	16073	Yellow Card	86:31
32	6765	16073	Yellow Card	85:27
33	6737	16079	Yellow Card	90:12
34	6752	16079	Yellow Card	10:35
35	6762	16079	Yellow Card	25:45
36	6764	16079	Yellow Card	89:23
37	6691	16095	Yellow Card	58:48
38	6807	16095	Yellow Card	24:07
39	6809	16095	Red Card	75:31
40	5217	16109	Yellow Card	44:56
41	4546	16120	Yellow Card	14:30
42	6627	16120	Yellow Card	60:45
43	6635	16120	Yellow Card	68:06
44	6901	16120	Yellow Card	76:26
45	6700	16131	Yellow Card	41:37
46	4447	16136	Yellow Card	07:09
47	5830	16136	Yellow Card	29:16
48	17818	16136	Yellow Card	21:52
49	6351	16149	Yellow Card	88:33
50	6572	16149	Yellow Card	67:54
51	6573	16149	Yellow Card	28:34
52	6573	16149	Second Yellow	50:28
53	6785	16149	Yellow Card	51:07
54	5203	16173	Yellow Card	77:23
55	6826	16173	Yellow Card	71:17
56	6760	16182	Yellow Card	10:14
57	11301	16182	Yellow Card	69:02
58	11303	16182	Yellow Card	32:58
59	3610	16190	Yellow Card	89:38
60	5534	16190	Yellow Card	79:34
61	6719	16190	Yellow Card	69:15
62	6720	16190	Yellow Card	82:11
63	7040	16190	Yellow Card	48:08
64	8068	16190	Yellow Card	56:59
65	5201	16196	Yellow Card	60:08
66	5719	16196	Yellow Card	81:14
67	5721	16196	Yellow Card	88:03
68	4346	16205	Yellow Card	88:39
69	17054	16205	Yellow Card	67:15
70	5563	16215	Yellow Card	16:00
71	6569	16231	Yellow Card	92:32
72	6758	16231	Yellow Card	68:14
73	6770	16231	Yellow Card	72:28
74	22287	16231	Yellow Card	86:18
75	4629	16240	Yellow Card	46:14
76	6762	16240	Yellow Card	35:17
77	6762	16240	Second Yellow	85:22
78	11385	16240	Yellow Card	90:47
79	5198	16248	Red Card	27:33
80	5249	16248	Yellow Card	29:38
81	5259	16248	Yellow Card	27:54
82	6381	16248	Yellow Card	70:30
83	6383	16248	Yellow Card	26:08
84	6581	16275	Yellow Card	32:13
85	6622	16275	Yellow Card	93:08
86	6923	16275	Yellow Card	55:08
87	6592	16289	Yellow Card	57:20
88	6672	16289	Yellow Card	82:28
89	6680	16289	Yellow Card	55:37
90	4546	16306	Yellow Card	36:46
91	6634	16306	Yellow Card	92:45
92	7104	16306	Yellow Card	50:46
93	6705	16317	Yellow Card	78:58
94	6712	16317	Yellow Card	81:48
95	6778	16317	Yellow Card	32:30
96	8555	16317	Yellow Card	43:03
97	5492	303377	Yellow Card	48:28
98	17304	303377	Yellow Card	81:24
99	30756	303377	Yellow Card	84:17
100	5203	303400	Yellow Card	51:14
101	5213	303400	Yellow Card	09:27
102	5492	303400	Yellow Card	42:16
103	5203	303430	Yellow Card	89:36
104	5487	303430	Yellow Card	46:33
105	6379	303430	Yellow Card	24:51
106	17304	303430	Yellow Card	81:25
107	5211	303470	Yellow Card	18:05
108	5503	303470	Yellow Card	84:48
109	5203	303473	Yellow Card	88:04
110	5213	303473	Yellow Card	83:51
111	5246	303473	Yellow Card	63:30
112	5477	303473	Yellow Card	53:25
113	5477	303473	Red Card	86:57
114	6374	303473	Yellow Card	38:03
115	32480	303473	Red Card	86:27
116	5203	303479	Yellow Card	87:15
117	5213	303479	Yellow Card	60:30
118	5503	303479	Yellow Card	41:17
119	6826	303479	Yellow Card	15:03
120	5203	303487	Yellow Card	86:59
121	5492	303487	Yellow Card	23:56
122	5503	303487	Yellow Card	39:51
123	6379	303487	Yellow Card	51:00
124	6397	303493	Yellow Card	60:59
125	6782	303504	Yellow Card	51:09
126	5217	303516	Yellow Card	88:38
127	6799	303516	Yellow Card	33:05
128	11388	303516	Yellow Card	60:18
129	5211	303517	Yellow Card	87:07
130	5492	303517	Yellow Card	66:47
131	5213	303524	Yellow Card	31:19
132	5470	303524	Yellow Card	50:53
133	6826	303524	Yellow Card	64:13
134	17304	303524	Yellow Card	17:33
135	5470	303532	Yellow Card	91:56
136	5492	303532	Yellow Card	82:27
137	6826	303532	Yellow Card	83:41
138	17304	303532	Yellow Card	88:38
139	24841	303532	Yellow Card	83:19
140	5211	303548	Yellow Card	72:16
141	8206	303548	Yellow Card	40:59
142	5246	303596	Yellow Card	39:06
143	5470	303596	Yellow Card	20:41
144	6826	303596	Yellow Card	44:16
145	11301	303600	Yellow Card	78:06
146	17027	303600	Yellow Card	66:58
147	22020	303600	Yellow Card	44:29
148	30756	303615	Red Card	48:23
149	23213	303634	Red Card	74:42
150	24085	303634	Yellow Card	63:43
151	8118	303652	Yellow Card	65:04
152	8118	303652	Second Yellow	74:11
153	5246	303664	Yellow Card	73:07
154	8866	303666	Yellow Card	86:33
155	16249	303666	Yellow Card	48:49
156	26009	303666	Yellow Card	47:33
157	5203	303674	Yellow Card	48:05
158	5213	303674	Yellow Card	38:25
159	5211	303680	Yellow Card	77:29
160	6826	303680	Yellow Card	39:39
161	5213	303696	Yellow Card	17:39
162	5503	303696	Yellow Card	60:02
163	20055	303696	Yellow Card	16:14
164	5687	303700	Yellow Card	87:10
165	6707	303700	Yellow Card	23:20
166	6867	303700	Yellow Card	23:09
167	6910	303700	Yellow Card	89:06
168	13107	303700	Yellow Card	81:28
169	5203	303707	Yellow Card	56:05
170	6379	303707	Yellow Card	28:10
171	6826	303707	Yellow Card	03:25
172	6826	303707	Second Yellow	78:22
173	8206	303707	Yellow Card	31:41
174	5203	303715	Yellow Card	31:40
175	8206	303715	Yellow Card	89:10
176	6712	303731	Yellow Card	63:27
177	6867	303731	Yellow Card	83:57
178	6826	3764661	Yellow Card	56:33
179	5211	3773372	Yellow Card	82:07
180	5213	3773372	Yellow Card	81:55
181	39073	3773372	Yellow Card	57:47
182	5211	3773377	Yellow Card	90:47
183	5487	3773377	Yellow Card	12:22
184	6826	3773377	Yellow Card	90:41
185	43728	3773377	Yellow Card	55:12
186	5203	3773386	Yellow Card	43:12
187	5503	3773386	Yellow Card	39:05
188	6826	3773386	Yellow Card	43:20
189	6668	3773387	Yellow Card	77:56
190	32673	3773387	Yellow Card	66:28
191	5211	3773403	Yellow Card	49:57
192	8118	3773403	Yellow Card	46:06
193	6908	3773415	Yellow Card	81:49
194	23970	3773415	Yellow Card	84:30
195	5211	3773428	Yellow Card	85:31
196	6826	3773428	Yellow Card	59:58
197	6799	3773457	Yellow Card	87:31
198	75546	3773457	Yellow Card	50:16
199	5523	3773466	Yellow Card	68:31
200	6585	3773466	Yellow Card	74:50
201	11388	3773466	Yellow Card	47:03
202	11389	3773466	Yellow Card	92:27
203	16555	3773466	Yellow Card	38:09
204	4447	3773474	Yellow Card	83:30
205	5487	3773474	Yellow Card	27:40
206	43728	3773474	Yellow Card	42:17
207	6648	3773477	Yellow Card	30:45
208	6648	3773477	Red Card	57:05
209	11538	3773477	Yellow Card	43:49
210	5211	3773497	Yellow Card	83:40
211	5213	3773497	Yellow Card	94:05
212	30486	3773497	Yellow Card	22:03
213	32480	3773497	Yellow Card	25:44
214	5203	3773523	Yellow Card	39:56
215	13599	3773523	Yellow Card	92:33
216	22390	3773523	Yellow Card	87:06
217	5203	3773565	Yellow Card	80:54
218	5211	3773565	Yellow Card	86:01
219	43728	3773565	Yellow Card	48:26
220	22020	3773571	Yellow Card	76:24
221	5202	3773585	Yellow Card	36:15
222	5539	3773585	Yellow Card	18:37
223	3991	3773587	Yellow Card	72:01
224	6809	3773587	Yellow Card	27:42
225	7104	3773587	Yellow Card	92:25
226	11550	3773587	Yellow Card	26:25
227	4447	3773597	Yellow Card	87:22
228	5203	3773597	Yellow Card	26:13
229	5477	3773625	Yellow Card	81:10
230	5503	3773625	Yellow Card	40:58
231	5203	3773631	Yellow Card	73:04
232	5477	3773631	Yellow Card	63:53
233	8118	3773631	Yellow Card	46:40
234	17303	3773660	Yellow Card	41:02
235	6947	3773672	Yellow Card	76:30
236	5203	3773689	Yellow Card	81:44
237	5487	3773689	Yellow Card	49:21
238	43728	3773689	Yellow Card	92:21
239	20055	3773695	Yellow Card	64:06
240	15042	3749052	Yellow Card	30:35
241	20015	3749068	Yellow Card	90:44
242	24972	3749079	Yellow Card	06:22
243	15042	3749108	Yellow Card	79:46
244	15515	3749108	Yellow Card	67:22
245	38412	3749108	Yellow Card	38:55
246	15754	3749117	Yellow Card	53:49
247	24972	3749117	Yellow Card	21:49
248	40222	3749117	Yellow Card	43:56
249	15515	3749133	Yellow Card	54:39
250	40221	3749153	Yellow Card	19:09
251	40411	3749192	Yellow Card	56:43
252	24972	3749196	Yellow Card	09:17
253	15519	3749233	Red Card	89:21
254	38552	3749233	Yellow Card	59:05
255	40217	3749233	Yellow Card	83:26
256	20302	3749246	Yellow Card	73:14
257	12529	3749253	Yellow Card	32:33
258	24972	3749253	Yellow Card	35:57
259	40243	3749257	Yellow Card	45:59
260	15637	3749274	Yellow Card	41:23
261	24972	3749274	Yellow Card	79:08
262	15516	3749276	Yellow Card	89:55
263	40222	3749276	Yellow Card	58:48
264	15515	3749278	Yellow Card	53:07
265	15516	3749278	Yellow Card	62:50
266	40336	3749296	Yellow Card	63:38
267	40339	3749296	Yellow Card	45:33
268	40221	3749360	Yellow Card	65:46
269	12529	3749403	Yellow Card	61:16
270	40303	3749434	Yellow Card	06:25
271	40257	3749448	Yellow Card	82:10
272	24758	3749454	Yellow Card	74:01
273	38552	3749454	Yellow Card	48:49
274	40219	3749454	Yellow Card	74:50
275	40220	3749454	Yellow Card	54:56
276	40397	3749465	Yellow Card	52:03
277	15515	3749493	Yellow Card	40:16
278	15637	3749493	Red Card	24:23
279	15515	3749522	Yellow Card	75:00
280	40255	3749522	Yellow Card	72:32
281	20286	3749526	Yellow Card	33:40
282	40227	3749528	Yellow Card	65:12
283	15515	3749552	Yellow Card	77:43
284	15515	3749552	Second Yellow	79:51
285	15654	3749552	Yellow Card	60:20
286	38412	3749552	Yellow Card	53:07
287	38556	3749590	Yellow Card	49:51
288	40412	3749603	Yellow Card	88:39
289	15515	3749631	Yellow Card	37:02
290	24972	3749631	Yellow Card	62:12
\.


--
-- TOC entry 4875 (class 0 OID 25209)
-- Dependencies: 215
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competitions (competition_id, competition_name, country_name, gender, youth, international) FROM stdin;
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
-- TOC entry 4880 (class 0 OID 25252)
-- Dependencies: 220
-- Data for Name: player_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_positions (player_id, position_id, match_id, from_time, to_time, from_period, to_period, start_reason, end_reason) FROM stdin;
6566	16	15946	67:52	67:53	2	2	Substitution - On (Tactical)	Tactical Shift
6566	22	15946	67:53	\N	2	\N	Tactical Shift	Final Whistle
6581	16	15946	00:00	67:52	1	2	Starting XI	Substitution - Off (Tactical)
6612	6	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6613	23	15946	00:00	67:53	1	2	Starting XI	Tactical Shift
6613	24	15946	67:53	70:30	2	2	Tactical Shift	Substitution - Off (Injury)
6615	3	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6617	12	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6618	2	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6624	24	15946	70:30	\N	2	\N	Substitution - On (Injury)	Final Whistle
6626	13	15946	00:00	67:53	1	2	Starting XI	Tactical Shift
6626	9	15946	67:53	\N	2	\N	Tactical Shift	Final Whistle
6629	1	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6632	15	15946	00:00	67:53	1	2	Starting XI	Tactical Shift
6632	11	15946	67:53	\N	2	\N	Tactical Shift	Final Whistle
6839	10	15946	00:00	67:48	1	2	Starting XI	Substitution - Off (Tactical)
6855	5	15946	00:00	\N	1	\N	Starting XI	Final Whistle
6935	10	15946	67:48	67:53	2	2	Substitution - On (Tactical)	Tactical Shift
6935	16	15946	67:53	\N	2	\N	Tactical Shift	Final Whistle
6742	10	15956	63:46	66:55	2	2	Substitution - On (Tactical)	Tactical Shift
6742	12	15956	66:55	\N	2	\N	Tactical Shift	Final Whistle
6760	22	15956	00:00	69:51	1	2	Starting XI	Substitution - Off (Tactical)
7699	16	15956	86:07	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8419	22	15956	69:51	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11291	19	15956	00:00	66:55	1	2	Starting XI	Tactical Shift
11291	16	15956	66:55	86:07	2	2	Tactical Shift	Substitution - Off (Tactical)
11293	5	15956	00:00	\N	1	\N	Starting XI	Final Whistle
11294	10	15956	00:00	63:46	1	2	Starting XI	Substitution - Off (Tactical)
11296	24	15956	00:00	\N	1	\N	Starting XI	Final Whistle
11297	2	15956	00:00	\N	1	\N	Starting XI	Final Whistle
11298	6	15956	00:00	\N	1	\N	Starting XI	Final Whistle
11300	15	15956	00:00	66:55	1	2	Starting XI	Tactical Shift
11300	11	15956	66:55	\N	2	\N	Tactical Shift	Final Whistle
11302	1	15956	00:00	\N	1	\N	Starting XI	Final Whistle
11303	13	15956	00:00	66:55	1	2	Starting XI	Tactical Shift
11303	9	15956	66:55	\N	2	\N	Tactical Shift	Final Whistle
11304	3	15956	00:00	\N	1	\N	Starting XI	Final Whistle
6734	6	15973	00:00	\N	1	\N	Starting XI	Final Whistle
6788	5	15973	00:00	\N	1	\N	Starting XI	Final Whistle
6857	12	15973	64:27	64:42	2	2	Substitution - On (Tactical)	Tactical Shift
6857	3	15973	64:42	\N	2	\N	Tactical Shift	Final Whistle
9747	1	15973	00:00	\N	1	\N	Starting XI	Final Whistle
11669	11	15973	00:00	\N	1	\N	Starting XI	Final Whistle
11671	24	15973	00:00	57:06	1	2	Starting XI	Tactical Shift
11671	23	15973	57:06	70:58	2	2	Tactical Shift	Substitution - Off (Tactical)
11672	22	15973	00:00	57:05	1	2	Starting XI	Substitution - Off (Tactical)
11673	12	15973	00:00	64:27	1	2	Starting XI	Substitution - Off (Tactical)
11674	9	15973	00:00	\N	1	\N	Starting XI	Final Whistle
11675	16	15973	00:00	57:06	1	2	Starting XI	Tactical Shift
11675	19	15973	57:06	\N	2	\N	Tactical Shift	Final Whistle
11676	2	15973	00:00	64:42	1	2	Starting XI	Tactical Shift
11676	12	15973	64:42	\N	2	\N	Tactical Shift	Final Whistle
11677	3	15973	00:00	64:42	1	2	Starting XI	Tactical Shift
11677	2	15973	64:42	\N	2	\N	Tactical Shift	Final Whistle
11678	23	15973	70:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12554	22	15973	57:05	57:06	2	2	Substitution - On (Tactical)	Tactical Shift
12554	16	15973	57:06	\N	2	\N	Tactical Shift	Final Whistle
3501	2	15978	45:00	46:57	2	2	Substitution - On (Tactical)	Tactical Shift
3501	15	15978	46:57	78:57	2	2	Tactical Shift	Tactical Shift
3501	21	15978	78:57	\N	2	\N	Tactical Shift	Final Whistle
5203	13	15978	56:12	59:41	2	2	Substitution - On (Tactical)	Tactical Shift
5203	10	15978	59:41	\N	2	\N	Tactical Shift	Final Whistle
5211	6	15978	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	15978	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	15978	00:00	\N	1	\N	Starting XI	Final Whistle
5470	10	15978	00:00	59:41	1	2	Starting XI	Tactical Shift
5470	13	15978	59:41	\N	2	\N	Tactical Shift	Final Whistle
5477	21	15978	00:00	76:33	1	2	Starting XI	Substitution - Off (Tactical)
5492	5	15978	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	15978	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	15978	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6379	13	15978	00:00	46:57	1	2	Starting XI	Tactical Shift
6379	2	15978	46:57	\N	2	\N	Tactical Shift	Final Whistle
6998	15	15978	00:00	46:57	1	2	Starting XI	Tactical Shift
6998	13	15978	46:57	56:12	2	2	Tactical Shift	Substitution - Off (Tactical)
8206	21	15978	76:33	78:57	2	2	Substitution - On (Tactical)	Tactical Shift
8206	15	15978	78:57	\N	2	\N	Tactical Shift	Final Whistle
20055	1	15978	00:00	\N	1	\N	Starting XI	Final Whistle
6351	24	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6560	8	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6565	10	15986	00:00	73:08	1	2	Starting XI	Tactical Shift
6565	13	15986	73:08	\N	2	\N	Tactical Shift	Final Whistle
6567	15	15986	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6570	13	15986	00:00	71:08	1	2	Starting XI	Substitution - Off (Tactical)
6572	5	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6573	4	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6574	13	15986	71:08	73:08	2	2	Substitution - On (Tactical)	Tactical Shift
6574	10	15986	73:08	\N	2	\N	Tactical Shift	Final Whistle
6578	7	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6579	3	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6582	22	15986	00:00	84:06	1	2	Starting XI	Substitution - Off (Tactical)
6785	1	15986	00:00	\N	1	\N	Starting XI	Final Whistle
6888	15	15986	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
17276	22	15986	84:06	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3991	17	15998	84:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6301	23	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6598	4	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6599	15	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6601	5	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6608	17	15998	00:00	84:18	1	2	Starting XI	Substitution - Off (Tactical)
6610	1	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6666	13	15998	81:11	\N	2	\N	Substitution - On (Injury)	Final Whistle
6667	13	15998	00:00	81:11	1	2	Starting XI	Substitution - Off (Injury)
6738	7	15998	00:00	\N	1	\N	Starting XI	Final Whistle
6834	21	15998	73:28	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11730	8	15998	00:00	\N	1	\N	Starting XI	Final Whistle
16212	21	15998	00:00	73:28	1	2	Starting XI	Substitution - Off (Tactical)
17818	3	15998	00:00	\N	1	\N	Starting XI	Final Whistle
3501	21	16010	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	16010	50:13	57:07	2	2	Substitution - On (Tactical)	Tactical Shift
5203	9	16010	57:07	\N	2	\N	Tactical Shift	Final Whistle
5211	6	16010	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	16010	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	16010	00:00	\N	1	\N	Starting XI	Final Whistle
5470	15	16010	00:00	57:07	1	2	Starting XI	Tactical Shift
5470	11	16010	57:07	\N	2	\N	Tactical Shift	Final Whistle
5477	17	16010	00:00	79:23	1	2	Starting XI	Substitution - Off (Tactical)
5503	13	16010	54:32	57:07	2	2	Substitution - On (Tactical)	Tactical Shift
5503	19	16010	57:07	\N	2	\N	Tactical Shift	Final Whistle
6374	2	16010	00:00	\N	1	\N	Starting XI	Final Whistle
6379	10	16010	00:00	50:13	1	2	Starting XI	Substitution - Off (Tactical)
6616	17	16010	79:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6826	5	16010	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	16010	00:00	54:32	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	16010	00:00	\N	1	\N	Starting XI	Final Whistle
3501	21	16023	00:00	83:02	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	16023	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	16023	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	16023	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	16023	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	16023	00:00	\N	1	\N	Starting XI	Final Whistle
5477	21	16023	83:02	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	17	16023	00:00	\N	1	\N	Starting XI	Final Whistle
6332	5	16023	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	16023	00:00	\N	1	\N	Starting XI	Final Whistle
6998	15	16023	87:17	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11392	15	16023	00:00	87:17	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	16023	00:00	\N	1	\N	Starting XI	Final Whistle
3610	20	16029	68:34	78:04	2	2	Substitution - On (Tactical)	Tactical Shift
3610	14	16029	78:04	\N	2	\N	Tactical Shift	Final Whistle
5218	22	16029	00:00	78:00	1	2	Starting XI	Substitution - Off (Tactical)
5504	10	16029	00:00	54:07	1	2	Starting XI	Tactical Shift
5504	14	16029	54:07	78:04	2	2	Tactical Shift	Tactical Shift
5504	20	16029	78:04	\N	2	\N	Tactical Shift	Final Whistle
5534	4	16029	00:00	53:58	1	2	Starting XI	Substitution - Off (Tactical)
5742	4	16029	53:58	54:07	2	2	Substitution - On (Tactical)	Tactical Shift
5742	3	16029	54:07	\N	2	\N	Tactical Shift	Final Whistle
6334	22	16029	78:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6719	15	16029	00:00	54:07	1	2	Starting XI	Tactical Shift
6719	20	16029	54:07	68:34	2	2	Tactical Shift	Substitution - Off (Tactical)
6720	13	16029	00:00	54:07	1	2	Starting XI	Tactical Shift
6720	18	16029	54:07	\N	2	\N	Tactical Shift	Final Whistle
6723	24	16029	00:00	\N	1	\N	Starting XI	Final Whistle
6804	5	16029	00:00	\N	1	\N	Starting XI	Final Whistle
6821	7	16029	00:00	\N	1	\N	Starting XI	Final Whistle
6825	3	16029	00:00	54:07	1	2	Starting XI	Tactical Shift
6825	4	16029	54:07	\N	2	\N	Tactical Shift	Final Whistle
6919	8	16029	00:00	\N	1	\N	Starting XI	Final Whistle
11541	1	16029	00:00	\N	1	\N	Starting XI	Final Whistle
3313	19	16056	00:00	62:17	1	2	Starting XI	Tactical Shift
3313	21	16056	62:17	86:04	2	2	Tactical Shift	Substitution - Off (Tactical)
5214	11	16056	00:00	\N	1	\N	Starting XI	Final Whistle
5563	9	16056	00:00	\N	1	\N	Starting XI	Final Whistle
5687	21	16056	86:04	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6648	3	16056	00:00	\N	1	\N	Starting XI	Final Whistle
6651	24	16056	00:00	61:13	1	2	Starting XI	Substitution - Off (Tactical)
6657	23	16056	75:13	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6658	7	16056	00:00	\N	1	\N	Starting XI	Final Whistle
6673	24	16056	61:13	62:17	2	2	Substitution - On (Tactical)	Tactical Shift
6673	17	16056	62:17	\N	2	\N	Tactical Shift	Final Whistle
6777	5	16056	00:00	\N	1	\N	Starting XI	Final Whistle
6792	1	16056	00:00	\N	1	\N	Starting XI	Final Whistle
7068	4	16056	00:00	\N	1	\N	Starting XI	Final Whistle
7910	22	16056	00:00	62:17	1	2	Starting XI	Tactical Shift
7910	23	16056	62:17	75:13	2	2	Tactical Shift	Substitution - Off (Tactical)
17304	8	16056	00:00	\N	1	\N	Starting XI	Final Whistle
3245	16	16073	00:00	63:21	1	2	Starting XI	Substitution - Off (Tactical)
5198	24	16073	00:00	79:25	1	2	Starting XI	Substitution - Off (Injury)
5199	12	16073	00:00	81:33	1	2	Starting XI	Tactical Shift
5199	15	16073	81:33	\N	2	\N	Tactical Shift	Final Whistle
5484	5	16073	00:00	\N	1	\N	Starting XI	Final Whistle
5487	22	16073	00:00	\N	1	\N	Starting XI	Final Whistle
5696	2	16073	00:00	\N	1	\N	Starting XI	Final Whistle
6320	6	16073	00:00	\N	1	\N	Starting XI	Final Whistle
6376	3	16073	00:00	\N	1	\N	Starting XI	Final Whistle
6377	24	16073	79:25	\N	2	\N	Substitution - On (Injury)	Final Whistle
6378	1	16073	00:00	\N	1	\N	Starting XI	Final Whistle
6381	15	16073	00:00	81:33	1	2	Starting XI	Tactical Shift
6381	12	16073	81:33	\N	2	\N	Tactical Shift	Final Whistle
6765	13	16073	00:00	\N	1	\N	Starting XI	Final Whistle
6841	16	16073	63:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3551	23	16079	78:37	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5688	13	16079	66:12	71:12	2	2	Substitution - On (Tactical)	Tactical Shift
5688	16	16079	71:12	\N	2	\N	Tactical Shift	Final Whistle
6737	6	16079	00:00	\N	1	\N	Starting XI	Final Whistle
6752	5	16079	00:00	\N	1	\N	Starting XI	Final Whistle
6753	13	16079	87:14	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6755	1	16079	00:00	\N	1	\N	Starting XI	Final Whistle
6762	3	16079	00:00	\N	1	\N	Starting XI	Final Whistle
6764	16	16079	00:00	71:12	1	2	Starting XI	Tactical Shift
6764	15	16079	71:12	\N	2	\N	Tactical Shift	Final Whistle
6766	23	16079	00:00	78:37	1	2	Starting XI	Substitution - Off (Tactical)
6771	13	16079	00:00	66:12	1	2	Starting XI	Substitution - Off (Tactical)
6772	2	16079	00:00	\N	1	\N	Starting XI	Final Whistle
11385	10	16079	00:00	\N	1	\N	Starting XI	Final Whistle
11386	15	16079	00:00	71:12	1	2	Starting XI	Tactical Shift
11386	13	16079	71:12	87:14	2	2	Tactical Shift	Substitution - Off (Tactical)
16335	12	16079	00:00	\N	1	\N	Starting XI	Final Whistle
3501	21	16086	67:57	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	16086	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	16086	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	16086	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	16086	00:00	78:46	1	2	Starting XI	Substitution - Off (Tactical)
5470	15	16086	00:00	81:36	1	2	Starting XI	Substitution - Off (Tactical)
5477	21	16086	00:00	67:57	1	2	Starting XI	Substitution - Off (Tactical)
5503	17	16086	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	16086	00:00	\N	1	\N	Starting XI	Final Whistle
6609	15	16086	81:36	81:55	2	2	Substitution - On (Tactical)	Tactical Shift
6609	13	16086	81:55	\N	2	\N	Tactical Shift	Final Whistle
6616	23	16086	78:46	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6826	5	16086	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	16086	00:00	81:55	1	2	Starting XI	Tactical Shift
8206	15	16086	81:55	\N	2	\N	Tactical Shift	Final Whistle
20055	1	16086	00:00	\N	1	\N	Starting XI	Final Whistle
4407	4	16095	69:02	70:21	2	2	Substitution - On (Tactical)	Tactical Shift
4407	9	16095	70:21	\N	2	\N	Tactical Shift	Final Whistle
6668	24	16095	00:00	70:21	1	2	Starting XI	Tactical Shift
6668	22	16095	70:21	78:05	2	2	Tactical Shift	Tactical Shift
6668	2	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
6672	19	16095	68:38	70:21	2	2	Substitution - On (Tactical)	Tactical Shift
6672	2	16095	70:21	78:05	2	2	Tactical Shift	Tactical Shift
6672	3	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
6678	22	16095	00:00	61:21	1	2	Starting XI	Substitution - Off (Tactical)
6680	19	16095	00:00	68:38	1	2	Starting XI	Substitution - Off (Tactical)
6682	4	16095	00:00	69:02	1	2	Starting XI	Substitution - Off (Tactical)
6688	9	16095	00:00	70:21	1	2	Starting XI	Tactical Shift
6688	16	16095	70:21	78:05	2	2	Tactical Shift	Tactical Shift
6688	11	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
6691	7	16095	00:00	70:21	1	2	Starting XI	Tactical Shift
6691	12	16095	70:21	\N	2	\N	Tactical Shift	Final Whistle
6692	1	16095	00:00	\N	1	\N	Starting XI	Final Whistle
6782	11	16095	00:00	78:05	1	2	Starting XI	Tactical Shift
6782	16	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
6784	8	16095	00:00	70:21	1	2	Starting XI	Tactical Shift
6784	6	16095	70:21	\N	2	\N	Tactical Shift	Final Whistle
6807	5	16095	00:00	\N	1	\N	Starting XI	Final Whistle
6809	3	16095	00:00	78:05	1	2	Starting XI	Tactical Shift
6809	19	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
21147	22	16095	61:21	70:21	2	2	Substitution - On (Tactical)	Tactical Shift
21147	24	16095	70:21	78:05	2	2	Tactical Shift	Tactical Shift
21147	23	16095	78:05	\N	2	\N	Tactical Shift	Final Whistle
3625	16	16109	00:00	51:56	1	2	Starting XI	Tactical Shift
3625	21	16109	51:56	75:04	2	2	Tactical Shift	Substitution - Off (Tactical)
5217	22	16109	00:00	51:41	1	2	Starting XI	Substitution - Off (Injury)
5516	21	16109	75:04	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6297	24	16109	00:00	51:56	1	2	Starting XI	Tactical Shift
6297	23	16109	51:56	\N	2	\N	Tactical Shift	Final Whistle
6795	1	16109	00:00	\N	1	\N	Starting XI	Final Whistle
6798	9	16109	45:00	51:56	2	2	Substitution - On (Tactical)	Tactical Shift
6798	11	16109	51:56	\N	2	\N	Tactical Shift	Final Whistle
6799	12	16109	00:00	51:56	1	2	Starting XI	Tactical Shift
6799	17	16109	51:56	\N	2	\N	Tactical Shift	Final Whistle
6805	2	16109	00:00	\N	1	\N	Starting XI	Final Whistle
6852	11	16109	00:00	51:56	1	2	Starting XI	Tactical Shift
6852	9	16109	51:56	\N	2	\N	Tactical Shift	Final Whistle
6876	6	16109	00:00	\N	1	\N	Starting XI	Final Whistle
11388	3	16109	00:00	\N	1	\N	Starting XI	Final Whistle
11389	22	16109	51:41	51:56	2	2	Substitution - On (Injury)	Tactical Shift
11389	19	16109	51:56	\N	2	\N	Tactical Shift	Final Whistle
12555	9	16109	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
17804	5	16109	00:00	74:59	1	2	Starting XI	Player Off
17804	5	16109	75:24	\N	2	\N	Player On	Final Whistle
4546	12	16120	00:00	57:00	1	2	Starting XI	Substitution - Off (Tactical)
4712	24	16120	73:27	77:35	2	2	Substitution - On (Tactical)	Tactical Shift
4712	16	16120	77:35	\N	2	\N	Tactical Shift	Final Whistle
6611	22	16120	00:00	57:06	1	2	Starting XI	Tactical Shift
6611	24	16120	57:06	73:27	2	2	Tactical Shift	Substitution - Off (Tactical)
6619	6	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6627	2	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6630	12	16120	57:00	57:06	2	2	Substitution - On (Tactical)	Tactical Shift
6630	22	16120	57:06	77:35	2	2	Tactical Shift	Tactical Shift
6630	24	16120	77:35	\N	2	\N	Tactical Shift	Final Whistle
6634	3	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6635	5	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6722	1	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6863	11	16120	00:00	\N	1	\N	Starting XI	Final Whistle
6873	16	16120	00:00	57:06	1	2	Starting XI	Tactical Shift
6873	12	16120	57:06	83:35	2	2	Tactical Shift	Substitution - Off (Tactical)
6901	9	16120	00:00	\N	1	\N	Starting XI	Final Whistle
11550	24	16120	00:00	57:06	1	2	Starting XI	Tactical Shift
11550	16	16120	57:06	77:35	2	2	Tactical Shift	Tactical Shift
11550	22	16120	77:35	\N	2	\N	Tactical Shift	Final Whistle
18721	12	16120	83:35	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6700	23	16131	00:00	82:23	1	2	Starting XI	Substitution - Off (Tactical)
6701	19	16131	00:00	76:32	1	2	Starting XI	Tactical Shift
6701	11	16131	76:32	\N	2	\N	Tactical Shift	Final Whistle
6705	6	16131	00:00	\N	1	\N	Starting XI	Final Whistle
6709	3	16131	00:00	\N	1	\N	Starting XI	Final Whistle
6710	2	16131	00:00	\N	1	\N	Starting XI	Final Whistle
6711	9	16131	76:28	76:32	2	2	Substitution - On (Tactical)	Tactical Shift
6711	19	16131	76:32	\N	2	\N	Tactical Shift	Final Whistle
6712	9	16131	00:00	76:28	1	2	Starting XI	Substitution - Off (Tactical)
6867	11	16131	00:00	76:32	1	2	Starting XI	Tactical Shift
6867	9	16131	76:32	\N	2	\N	Tactical Shift	Final Whistle
7105	17	16131	00:00	\N	1	\N	Starting XI	Final Whistle
7907	5	16131	00:00	\N	1	\N	Starting XI	Final Whistle
8555	21	16131	63:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
10763	1	16131	00:00	\N	1	\N	Starting XI	Final Whistle
13108	23	16131	82:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17620	21	16131	00:00	63:29	1	2	Starting XI	Substitution - Off (Tactical)
3991	7	16136	00:00	\N	1	\N	Starting XI	Final Whistle
4447	23	16136	00:00	45:00	1	2	Starting XI	Tactical Shift
4447	24	16136	45:00	77:29	2	2	Tactical Shift	Substitution - Off (Tactical)
5830	4	16136	00:00	\N	1	\N	Starting XI	Final Whistle
6301	21	16136	00:00	45:00	1	2	Starting XI	Tactical Shift
6301	22	16136	45:00	\N	2	\N	Tactical Shift	Final Whistle
6580	9	16136	00:00	45:00	1	2	Starting XI	Tactical Shift
6580	10	16136	45:00	\N	2	\N	Tactical Shift	Final Whistle
6603	5	16136	00:00	\N	1	\N	Starting XI	Final Whistle
6606	15	16136	85:26	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6608	13	16136	85:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6610	1	16136	00:00	\N	1	\N	Starting XI	Final Whistle
6667	11	16136	00:00	45:00	1	2	Starting XI	Tactical Shift
6667	15	16136	45:00	85:26	2	2	Tactical Shift	Substitution - Off (Tactical)
11730	8	16136	00:00	\N	1	\N	Starting XI	Final Whistle
11745	24	16136	77:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
16212	17	16136	00:00	45:00	1	2	Starting XI	Tactical Shift
16212	13	16136	45:00	85:23	2	2	Tactical Shift	Substitution - Off (Tactical)
17818	3	16136	00:00	\N	1	\N	Starting XI	Final Whistle
6351	22	16149	00:00	52:28	1	2	Starting XI	Tactical Shift
6351	24	16149	52:28	\N	2	\N	Tactical Shift	Final Whistle
6565	10	16149	00:00	\N	1	\N	Starting XI	Final Whistle
6570	15	16149	00:00	85:11	1	2	Starting XI	Substitution - Off (Tactical)
6572	5	16149	00:00	\N	1	\N	Starting XI	Final Whistle
6573	4	16149	00:00	52:28	1	2	Starting XI	Tactical Shift
6573	19	16149	52:28	\N	2	\N	Tactical Shift	Final Whistle
6574	13	16149	69:36	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6579	3	16149	00:00	\N	1	\N	Starting XI	Final Whistle
6582	24	16149	00:00	52:28	1	2	Starting XI	Tactical Shift
6582	22	16149	52:28	79:58	2	2	Tactical Shift	Substitution - Off (Tactical)
6785	1	16149	00:00	\N	1	\N	Starting XI	Final Whistle
6888	13	16149	00:00	69:36	1	2	Starting XI	Substitution - Off (Tactical)
7578	22	16149	79:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11292	7	16149	00:00	52:28	1	2	Starting XI	Tactical Shift
11292	2	16149	52:28	\N	2	\N	Tactical Shift	Final Whistle
22129	8	16149	00:00	52:28	1	2	Starting XI	Tactical Shift
22129	6	16149	52:28	\N	2	\N	Tactical Shift	Final Whistle
23264	15	16149	85:11	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3437	13	16157	00:00	71:29	1	2	Starting XI	Substitution - Off (Tactical)
5186	16	16157	00:00	47:15	1	2	Starting XI	Tactical Shift
5186	24	16157	47:15	\N	2	\N	Tactical Shift	Final Whistle
5718	22	16157	00:00	78:25	1	2	Starting XI	Substitution - Off (Tactical)
6401	24	16157	00:00	29:46	1	1	Starting XI	Player Off
6401	24	16157	30:49	35:55	1	1	Player On	Player Off
6401	24	16157	39:13	39:26	1	1	Player On	Substitution - Off (Injury)
6587	6	16157	00:00	\N	1	\N	Starting XI	Final Whistle
6589	13	16157	71:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6590	1	16157	00:00	\N	1	\N	Starting XI	Final Whistle
6594	22	16157	78:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6595	15	16157	00:00	\N	1	\N	Starting XI	Final Whistle
6746	5	16157	00:00	\N	1	\N	Starting XI	Final Whistle
6748	24	16157	39:26	47:15	1	2	Substitution - On (Injury)	Tactical Shift
6748	16	16157	47:15	\N	2	\N	Tactical Shift	Final Whistle
6797	12	16157	00:00	\N	1	\N	Starting XI	Final Whistle
6891	3	16157	00:00	\N	1	\N	Starting XI	Final Whistle
11634	2	16157	00:00	\N	1	\N	Starting XI	Final Whistle
3501	21	16173	00:00	74:22	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	16173	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	16173	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	16173	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	16173	00:00	14:39	1	1	Starting XI	Tactical Shift
5470	15	16173	14:39	\N	1	\N	Tactical Shift	Final Whistle
5477	21	16173	74:22	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	17	16173	00:00	\N	1	\N	Starting XI	Final Whistle
6332	5	16173	86:54	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6374	6	16173	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	16173	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	16173	00:00	86:54	1	2	Starting XI	Substitution - Off (Tactical)
8206	15	16173	00:00	14:39	1	1	Starting XI	Tactical Shift
8206	13	16173	14:39	62:53	1	2	Tactical Shift	Substitution - Off (Tactical)
13599	13	16173	62:53	\N	2	\N	Substitution - On (Tactical)	Final Whistle
20055	1	16173	00:00	\N	1	\N	Starting XI	Final Whistle
6742	22	16182	78:10	80:58	2	2	Substitution - On (Tactical)	Tactical Shift
6742	19	16182	80:58	\N	2	\N	Tactical Shift	Final Whistle
6760	22	16182	00:00	78:10	1	2	Starting XI	Substitution - Off (Tactical)
7699	19	16182	00:00	66:27	1	2	Starting XI	Substitution - Off (Tactical)
11291	19	16182	66:27	75:32	2	2	Substitution - On (Tactical)	Substitution - Off (Injury)
11293	5	16182	00:00	\N	1	\N	Starting XI	Final Whistle
11298	8	16182	00:00	\N	1	\N	Starting XI	Final Whistle
11301	11	16182	00:00	\N	1	\N	Starting XI	Final Whistle
11302	1	16182	00:00	\N	1	\N	Starting XI	Final Whistle
11303	9	16182	00:00	\N	1	\N	Starting XI	Final Whistle
11304	4	16182	00:00	\N	1	\N	Starting XI	Final Whistle
17027	24	16182	00:00	\N	1	\N	Starting XI	Final Whistle
18164	7	16182	00:00	\N	1	\N	Starting XI	Final Whistle
22020	3	16182	00:00	\N	1	\N	Starting XI	Final Whistle
23492	19	16182	75:32	80:58	2	2	Substitution - On (Injury)	Tactical Shift
23492	22	16182	80:58	\N	2	\N	Tactical Shift	Final Whistle
3610	11	16190	61:04	66:41	2	2	Substitution - On (Tactical)	Tactical Shift
3610	21	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
5504	9	16190	00:00	66:41	1	2	Starting XI	Tactical Shift
5504	11	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
5534	3	16190	00:00	66:41	1	2	Starting XI	Tactical Shift
5534	4	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
5742	2	16190	00:00	50:24	1	2	Starting XI	Substitution - Off (Tactical)
6719	2	16190	50:24	51:43	2	2	Substitution - On (Tactical)	Tactical Shift
6719	12	16190	51:43	57:26	2	2	Tactical Shift	Tactical Shift
6719	19	16190	57:26	66:41	2	2	Tactical Shift	Tactical Shift
6719	9	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
6720	19	16190	00:00	57:26	1	2	Starting XI	Tactical Shift
6720	12	16190	57:26	66:41	2	2	Tactical Shift	Tactical Shift
6720	17	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
6723	23	16190	00:00	\N	1	\N	Starting XI	Final Whistle
6804	5	16190	00:00	\N	1	\N	Starting XI	Final Whistle
6821	12	16190	00:00	51:43	1	2	Starting XI	Tactical Shift
6821	2	16190	51:43	66:41	2	2	Tactical Shift	Tactical Shift
6821	7	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
7040	11	16190	00:00	61:04	1	2	Starting XI	Substitution - Off (Tactical)
8068	6	16190	00:00	57:05	1	2	Starting XI	Substitution - Off (Injury)
11332	6	16190	57:05	66:41	2	2	Substitution - On (Injury)	Tactical Shift
11332	3	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
11541	1	16190	00:00	\N	1	\N	Starting XI	Final Whistle
13360	16	16190	00:00	66:41	1	2	Starting XI	Tactical Shift
13360	8	16190	66:41	\N	2	\N	Tactical Shift	Final Whistle
3509	1	16196	00:00	\N	1	\N	Starting XI	Final Whistle
4926	10	16196	75:00	75:07	2	2	Substitution - On (Tactical)	Tactical Shift
4926	19	16196	75:07	\N	2	\N	Tactical Shift	Final Whistle
5201	5	16196	00:00	\N	1	\N	Starting XI	Final Whistle
5463	13	16196	00:00	\N	1	\N	Starting XI	Final Whistle
5485	3	16196	00:00	\N	1	\N	Starting XI	Final Whistle
5539	10	16196	00:00	75:00	1	2	Starting XI	Substitution - Off (Tactical)
5574	15	16196	00:00	54:58	1	2	Starting XI	Substitution - Off (Tactical)
5719	17	16196	60:51	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5721	2	16196	00:00	\N	1	\N	Starting XI	Final Whistle
6399	17	16196	00:00	60:51	1	2	Starting XI	Substitution - Off (Tactical)
6773	15	16196	54:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
18395	21	16196	00:00	\N	1	\N	Starting XI	Final Whistle
18620	6	16196	00:00	\N	1	\N	Starting XI	Final Whistle
19677	23	16196	00:00	\N	1	\N	Starting XI	Final Whistle
4346	9	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
4346	13	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
5521	7	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
5521	2	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
6652	5	16205	00:00	63:19	1	2	Starting XI	Substitution - Off (Tactical)
6924	4	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
6924	5	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
7900	17	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
7900	12	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
11535	5	16205	63:19	63:42	2	2	Substitution - On (Tactical)	Tactical Shift
11535	15	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
11538	8	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
11538	6	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
11539	16	16205	79:28	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12192	21	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
12192	16	16205	63:42	79:28	2	2	Tactical Shift	Substitution - Off (Tactical)
12194	11	16205	00:00	63:42	1	2	Starting XI	Tactical Shift
12194	10	16205	63:42	\N	2	\N	Tactical Shift	Final Whistle
16209	23	16205	00:00	\N	1	\N	Starting XI	Final Whistle
17054	3	16205	00:00	\N	1	\N	Starting XI	Final Whistle
21397	1	16205	00:00	\N	1	\N	Starting XI	Final Whistle
3313	22	16215	00:00	66:56	1	2	Starting XI	Substitution - Off (Tactical)
3990	24	16215	00:00	\N	1	\N	Starting XI	Final Whistle
5214	10	16215	00:00	74:27	1	2	Starting XI	Substitution - Off (Tactical)
5563	15	16215	00:00	77:12	1	2	Starting XI	Tactical Shift
5563	13	16215	77:12	\N	2	\N	Tactical Shift	Final Whistle
6648	3	16215	00:00	\N	1	\N	Starting XI	Final Whistle
6651	7	16215	00:00	66:43	1	2	Starting XI	Substitution - Off (Tactical)
6658	8	16215	00:00	\N	1	\N	Starting XI	Final Whistle
6673	13	16215	00:00	77:12	1	2	Starting XI	Tactical Shift
6673	15	16215	77:12	\N	2	\N	Tactical Shift	Final Whistle
6777	5	16215	00:00	\N	1	\N	Starting XI	Final Whistle
6792	1	16215	00:00	\N	1	\N	Starting XI	Final Whistle
7068	4	16215	00:00	\N	1	\N	Starting XI	Final Whistle
7910	10	16215	74:27	76:40	2	2	Substitution - On (Tactical)	Tactical Shift
7910	19	16215	76:40	\N	2	\N	Tactical Shift	Final Whistle
22915	22	16215	66:56	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23522	7	16215	66:43	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6569	7	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6758	10	16231	00:00	77:49	1	2	Starting XI	Substitution - Off (Tactical)
6767	22	16231	65:02	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6768	1	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6769	4	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6770	13	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6790	5	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6866	15	16231	00:00	\N	1	\N	Starting XI	Final Whistle
6902	22	16231	00:00	65:02	1	2	Starting XI	Substitution - Off (Tactical)
10323	10	16231	77:49	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11391	24	16231	00:00	63:08	1	2	Starting XI	Substitution - Off (Tactical)
22287	8	16231	00:00	\N	1	\N	Starting XI	Final Whistle
22919	3	16231	00:00	\N	1	\N	Starting XI	Final Whistle
23343	24	16231	63:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3497	21	16240	00:00	\N	1	\N	Starting XI	Final Whistle
3551	23	16240	00:00	73:18	1	2	Starting XI	Substitution - Off (Tactical)
4629	4	16240	00:00	\N	1	\N	Starting XI	Final Whistle
5688	23	16240	73:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6737	8	16240	00:00	\N	1	\N	Starting XI	Final Whistle
6752	5	16240	00:00	\N	1	\N	Starting XI	Final Whistle
6755	1	16240	00:00	\N	1	\N	Starting XI	Final Whistle
6762	3	16240	00:00	\N	1	\N	Starting XI	Final Whistle
6772	7	16240	00:00	\N	1	\N	Starting XI	Final Whistle
6827	17	16240	86:36	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11384	9	16240	00:00	62:24	1	2	Starting XI	Substitution - Off (Tactical)
21147	12	16289	83:45	\N	2	\N	Tactical Shift	Final Whistle
11385	9	16240	62:24	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11386	15	16240	00:00	\N	1	\N	Starting XI	Final Whistle
16335	17	16240	00:00	86:36	1	2	Starting XI	Substitution - Off (Tactical)
3477	6	16248	57:37	58:44	2	2	Substitution - On (Tactical)	Tactical Shift
3477	24	16248	58:44	\N	2	\N	Tactical Shift	Final Whistle
5198	24	16248	00:00	42:53	1	1	Starting XI	Tactical Shift
5198	19	16248	42:53	\N	1	\N	Tactical Shift	Final Whistle
5199	12	16248	00:00	42:53	1	1	Starting XI	Tactical Shift
5199	13	16248	42:53	\N	1	\N	Tactical Shift	Final Whistle
5249	5	16248	00:00	\N	1	\N	Starting XI	Final Whistle
5259	3	16248	00:00	\N	1	\N	Starting XI	Final Whistle
5487	22	16248	00:00	58:44	1	2	Starting XI	Tactical Shift
5487	15	16248	58:44	\N	2	\N	Tactical Shift	Final Whistle
5696	2	16248	00:00	34:26	1	1	Starting XI	Substitution - Off (Tactical)
6320	6	16248	00:00	57:37	1	2	Starting XI	Substitution - Off (Tactical)
6375	10	16248	88:17	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6377	2	16248	34:26	42:53	1	1	Substitution - On (Tactical)	Tactical Shift
6377	24	16248	42:53	58:44	1	2	Tactical Shift	Tactical Shift
6377	22	16248	58:44	\N	2	\N	Tactical Shift	Final Whistle
6378	1	16248	00:00	\N	1	\N	Starting XI	Final Whistle
6381	16	16248	00:00	42:53	1	1	Starting XI	Tactical Shift
6381	15	16248	42:53	58:44	1	2	Tactical Shift	Tactical Shift
6381	6	16248	58:44	\N	2	\N	Tactical Shift	Final Whistle
6383	9	16248	00:00	42:53	1	1	Starting XI	Tactical Shift
6383	2	16248	42:53	\N	1	\N	Tactical Shift	Final Whistle
6765	11	16248	00:00	33:56	1	1	Starting XI	Player Off
6765	11	16248	34:40	42:53	1	1	Player On	Tactical Shift
6765	10	16248	42:53	88:17	1	2	Tactical Shift	Substitution - Off (Tactical)
3501	21	16265	71:22	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	15	16265	55:55	55:58	2	2	Substitution - On (Tactical)	Tactical Shift
5203	10	16265	55:58	\N	2	\N	Tactical Shift	Final Whistle
5211	6	16265	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	16265	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	16265	00:00	\N	1	\N	Starting XI	Final Whistle
5470	10	16265	00:00	55:58	1	2	Starting XI	Tactical Shift
5470	15	16265	55:58	\N	2	\N	Tactical Shift	Final Whistle
5477	21	16265	00:00	71:22	1	2	Starting XI	Substitution - Off (Tactical)
5503	17	16265	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	16265	00:00	\N	1	\N	Starting XI	Final Whistle
6379	13	16265	89:31	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6826	5	16265	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	16265	00:00	89:31	1	2	Starting XI	Substitution - Off (Tactical)
11392	15	16265	00:00	55:55	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	16265	00:00	\N	1	\N	Starting XI	Final Whistle
6038	21	16275	80:22	81:55	2	2	Substitution - On (Tactical)	Tactical Shift
6038	22	16275	81:55	\N	2	\N	Tactical Shift	Final Whistle
6566	23	16275	00:00	81:55	1	2	Starting XI	Tactical Shift
6566	24	16275	81:55	\N	2	\N	Tactical Shift	Final Whistle
6581	21	16275	00:00	80:22	1	2	Starting XI	Substitution - Off (Tactical)
6604	17	16275	45:00	70:39	2	2	Substitution - On (Tactical)	Tactical Shift
6604	13	16275	70:39	\N	2	\N	Tactical Shift	Final Whistle
6612	8	16275	00:00	70:39	1	2	Starting XI	Tactical Shift
6612	6	16275	70:39	\N	2	\N	Tactical Shift	Final Whistle
6615	3	16275	00:00	\N	1	\N	Starting XI	Final Whistle
6622	15	16275	00:00	\N	1	\N	Starting XI	Final Whistle
6626	13	16275	00:00	70:39	1	2	Starting XI	Tactical Shift
6626	10	16275	70:39	81:55	2	2	Tactical Shift	Tactical Shift
6626	16	16275	81:55	\N	2	\N	Tactical Shift	Final Whistle
6629	1	16275	00:00	\N	1	\N	Starting XI	Final Whistle
6636	4	16275	00:00	70:30	1	2	Starting XI	Substitution - Off (Tactical)
6739	17	16275	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6856	7	16275	00:00	70:39	1	2	Starting XI	Tactical Shift
6856	2	16275	70:39	\N	2	\N	Tactical Shift	Final Whistle
6923	5	16275	00:00	\N	1	\N	Starting XI	Final Whistle
12190	4	16275	70:30	70:39	2	2	Substitution - On (Tactical)	Tactical Shift
12190	17	16275	70:39	81:55	2	2	Tactical Shift	Tactical Shift
12190	12	16275	81:55	\N	2	\N	Tactical Shift	Final Whistle
6592	3	16289	00:00	\N	1	\N	Starting XI	Final Whistle
6668	16	16289	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6672	2	16289	00:00	\N	1	\N	Starting XI	Final Whistle
6675	6	16289	00:00	\N	1	\N	Starting XI	Final Whistle
6680	13	16289	00:00	83:03	1	2	Starting XI	Substitution - Off (Tactical)
6684	13	16289	83:03	83:45	2	2	Substitution - On (Tactical)	Tactical Shift
6684	23	16289	83:45	\N	2	\N	Tactical Shift	Final Whistle
6688	15	16289	00:00	64:54	1	2	Starting XI	Tactical Shift
6688	10	16289	64:54	\N	2	\N	Tactical Shift	Final Whistle
6691	12	16289	00:00	83:45	1	2	Starting XI	Tactical Shift
6691	13	16289	83:45	\N	2	\N	Tactical Shift	Final Whistle
6782	10	16289	64:18	64:54	2	2	Substitution - On (Tactical)	Tactical Shift
6782	15	16289	64:54	\N	2	\N	Tactical Shift	Final Whistle
6807	5	16289	00:00	\N	1	\N	Starting XI	Final Whistle
17303	10	16289	00:00	64:18	1	2	Starting XI	Substitution - Off (Tactical)
18163	16	16289	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
21147	23	16289	00:00	83:45	1	2	Starting XI	Tactical Shift
23344	1	16289	00:00	\N	1	\N	Starting XI	Final Whistle
4546	12	16306	00:00	74:42	1	2	Starting XI	Substitution - Off (Tactical)
4712	12	16306	74:42	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5693	16	16306	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6611	24	16306	00:00	85:40	1	2	Starting XI	Substitution - Off (Tactical)
6627	2	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6630	22	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6634	3	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6635	5	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6722	1	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6863	11	16306	00:00	\N	1	\N	Starting XI	Final Whistle
6873	16	16306	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6901	9	16306	00:00	\N	1	\N	Starting XI	Final Whistle
7104	6	16306	00:00	\N	1	\N	Starting XI	Final Whistle
7621	24	16306	85:40	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6698	1	16317	00:00	\N	1	\N	Starting XI	Final Whistle
6700	22	16317	00:00	65:18	1	2	Starting XI	Substitution - Off (Tactical)
6701	11	16317	00:00	\N	1	\N	Starting XI	Final Whistle
6705	6	16317	00:00	\N	1	\N	Starting XI	Final Whistle
6707	24	16317	00:00	84:37	1	2	Starting XI	Substitution - Off (Tactical)
6708	3	16317	00:00	\N	1	\N	Starting XI	Final Whistle
6711	22	16317	65:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6712	9	16317	00:00	\N	1	\N	Starting XI	Final Whistle
6778	5	16317	00:00	76:37	1	2	Starting XI	Substitution - Off (Tactical)
7105	12	16317	00:00	\N	1	\N	Starting XI	Final Whistle
8555	2	16317	00:00	\N	1	\N	Starting XI	Final Whistle
13107	5	16317	76:37	\N	2	\N	Substitution - On (Tactical)	Final Whistle
13108	24	16317	84:37	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17620	16	16317	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303377	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303377	00:00	21:22	1	1	Starting XI	Substitution - Off (Injury)
5213	3	303377	00:00	\N	1	\N	Starting XI	Final Whistle
5470	15	303377	74:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	23	303377	00:00	84:29	1	2	Starting XI	Tactical Shift
5487	24	303377	84:29	\N	2	\N	Tactical Shift	Final Whistle
5492	5	303377	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	303377	00:00	84:29	1	2	Starting XI	Tactical Shift
5503	22	303377	84:29	\N	2	\N	Tactical Shift	Final Whistle
6379	2	303377	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	303377	00:00	\N	1	\N	Starting XI	Final Whistle
8206	21	303377	84:26	84:29	2	2	Substitution - On (Tactical)	Tactical Shift
8206	19	303377	84:29	\N	2	\N	Tactical Shift	Final Whistle
11392	15	303377	00:00	74:08	1	2	Starting XI	Substitution - Off (Tactical)
17304	6	303377	21:22	\N	1	\N	Substitution - On (Injury)	Final Whistle
20055	1	303377	00:00	\N	1	\N	Starting XI	Final Whistle
30756	21	303377	00:00	84:26	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	303400	00:00	\N	1	\N	Starting XI	Final Whistle
5211	8	303400	00:00	\N	1	\N	Starting XI	Final Whistle
5213	4	303400	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	303400	84:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	24	303400	00:00	\N	1	\N	Starting XI	Final Whistle
5492	5	303400	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	303400	00:00	\N	1	\N	Starting XI	Final Whistle
6379	3	303400	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	303400	00:00	84:19	1	2	Starting XI	Substitution - Off (Tactical)
8206	15	303400	55:35	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11392	15	303400	00:00	55:35	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	303400	00:00	\N	1	\N	Starting XI	Final Whistle
24949	7	303400	84:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	7	303400	00:00	84:19	1	2	Starting XI	Substitution - Off (Tactical)
4447	21	303421	77:13	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	303421	00:00	58:01	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303421	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303421	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	303421	00:00	\N	1	\N	Starting XI	Final Whistle
6374	5	303421	49:42	49:48	2	2	Substitution - On (Injury)	Tactical Shift
6374	2	303421	49:48	\N	2	\N	Tactical Shift	Final Whistle
6379	2	303421	00:00	49:48	1	2	Starting XI	Tactical Shift
6379	13	303421	49:48	\N	2	\N	Tactical Shift	Final Whistle
6590	1	303421	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303421	00:00	46:38	1	2	Starting XI	Player Off
6826	5	303421	49:39	49:42	2	2	Player On	Substitution - Off (Injury)
8118	10	303421	58:01	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8206	13	303421	00:00	49:48	1	2	Starting XI	Tactical Shift
8206	5	303421	49:48	\N	2	\N	Tactical Shift	Final Whistle
24841	15	303421	00:00	\N	1	\N	Starting XI	Final Whistle
30756	21	303421	00:00	77:13	1	2	Starting XI	Substitution - Off (Tactical)
32480	3	303421	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303430	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303430	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303430	00:00	77:19	1	2	Starting XI	Substitution - Off (Tactical)
5477	17	303430	45:00	\N	2	\N	Substitution - On (Injury)	Final Whistle
5487	21	303430	00:00	77:20	1	2	Starting XI	Tactical Shift
5487	23	303430	77:20	\N	2	\N	Tactical Shift	Final Whistle
5503	17	303430	00:00	28:25	1	1	Starting XI	Player Off
5503	17	303430	31:13	45:00	1	2	Player On	Substitution - Off (Injury)
6374	2	303430	00:00	\N	1	\N	Starting XI	Final Whistle
6379	13	303430	00:00	62:18	1	2	Starting XI	Substitution - Off (Tactical)
6826	5	303430	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	303430	62:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11392	15	303430	00:00	\N	1	\N	Starting XI	Final Whistle
17304	6	303430	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303430	00:00	\N	1	\N	Starting XI	Final Whistle
30756	23	303430	77:19	77:20	2	2	Substitution - On (Tactical)	Tactical Shift
30756	21	303430	77:20	\N	2	\N	Tactical Shift	Final Whistle
8654	24	303451	00:00	58:23	1	2	Starting XI	Tactical Shift
8654	22	303451	58:23	84:09	2	2	Tactical Shift	Substitution - Off (Tactical)
11671	15	303451	58:11	58:23	2	2	Substitution - On (Tactical)	Tactical Shift
11671	24	303451	58:23	\N	2	\N	Tactical Shift	Final Whistle
23986	22	303451	00:00	58:23	1	2	Starting XI	Tactical Shift
23986	16	303451	58:23	\N	2	\N	Tactical Shift	Final Whistle
24067	22	303451	84:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24072	15	303451	00:00	58:11	1	2	Starting XI	Substitution - Off (Tactical)
24083	1	303451	00:00	\N	1	\N	Starting XI	Final Whistle
24084	3	303451	00:00	\N	1	\N	Starting XI	Final Whistle
24086	5	303451	00:00	\N	1	\N	Starting XI	Final Whistle
24087	13	303451	00:00	58:23	1	2	Starting XI	Tactical Shift
24087	15	303451	58:23	70:14	2	2	Tactical Shift	Substitution - Off (Tactical)
24088	16	303451	00:00	58:23	1	2	Starting XI	Tactical Shift
24088	13	303451	58:23	\N	2	\N	Tactical Shift	Final Whistle
24089	6	303451	00:00	79:33	1	2	Starting XI	Player Off
24089	6	303451	79:58	\N	2	\N	Player On	Final Whistle
24576	2	303451	00:00	\N	1	\N	Starting XI	Final Whistle
27342	15	303451	70:14	\N	2	\N	Substitution - On (Tactical)	Final Whistle
31090	12	303451	00:00	\N	1	\N	Starting XI	Final Whistle
4447	12	303470	69:06	70:01	2	2	Substitution - On (Tactical)	Tactical Shift
4447	17	303470	70:01	\N	2	\N	Tactical Shift	Final Whistle
5203	11	303470	00:00	70:01	1	2	Starting XI	Tactical Shift
5203	10	303470	70:01	\N	2	\N	Tactical Shift	Final Whistle
5211	6	303470	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303470	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	303470	79:56	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	24	303470	00:00	70:01	1	2	Starting XI	Tactical Shift
5487	21	303470	70:01	80:04	2	2	Tactical Shift	Substitution - Off (Tactical)
5492	5	303470	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	303470	00:00	70:01	1	2	Starting XI	Tactical Shift
5503	23	303470	70:01	\N	2	\N	Tactical Shift	Final Whistle
6374	2	303470	00:00	\N	1	\N	Starting XI	Final Whistle
8118	16	303470	00:00	70:01	1	2	Starting XI	Tactical Shift
8118	15	303470	70:01	\N	2	\N	Tactical Shift	Final Whistle
8206	12	303470	00:00	69:06	1	2	Starting XI	Substitution - Off (Tactical)
11392	9	303470	00:00	70:01	1	2	Starting XI	Tactical Shift
11392	13	303470	70:01	79:56	2	2	Tactical Shift	Substitution - Off (Tactical)
20055	1	303470	00:00	\N	1	\N	Starting XI	Final Whistle
30756	21	303470	80:04	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	15	303473	64:13	64:24	2	2	Substitution - On (Tactical)	Tactical Shift
5203	10	303473	64:24	90:47	2	2	Tactical Shift	Tactical Shift
5203	3	303473	90:47	\N	2	\N	Tactical Shift	Final Whistle
5213	5	303473	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303473	00:00	90:47	1	2	Starting XI	Tactical Shift
5246	16	303473	90:47	\N	2	\N	Tactical Shift	Final Whistle
5470	13	303473	69:20	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5477	21	303473	00:00	90:47	1	2	Starting XI	Tactical Shift
5477	22	303473	90:47	\N	2	\N	Tactical Shift	Final Whistle
5503	17	303473	00:00	90:47	1	2	Starting XI	Tactical Shift
5503	12	303473	90:47	\N	2	\N	Tactical Shift	Final Whistle
6374	6	303473	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	303473	00:00	\N	1	\N	Starting XI	Final Whistle
8118	10	303473	00:00	64:24	1	2	Starting XI	Tactical Shift
8118	15	303473	64:24	\N	2	\N	Tactical Shift	Final Whistle
8206	13	303473	00:00	69:20	1	2	Starting XI	Substitution - Off (Tactical)
11392	15	303473	00:00	64:13	1	2	Starting XI	Substitution - Off (Tactical)
11532	3	303473	00:00	72:48	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	303473	00:00	\N	1	\N	Starting XI	Final Whistle
32480	3	303473	72:48	90:47	2	2	Substitution - On (Tactical)	Tactical Shift
32480	24	303473	90:47	\N	2	\N	Tactical Shift	Final Whistle
4447	21	303479	00:00	86:51	1	2	Starting XI	Tactical Shift
4447	17	303479	86:51	87:58	2	2	Tactical Shift	Substitution - Off (Tactical)
5203	10	303479	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303479	00:00	89:36	1	2	Starting XI	Tactical Shift
5211	16	303479	89:36	\N	2	\N	Tactical Shift	Final Whistle
5213	3	303479	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	303479	00:00	73:25	1	2	Starting XI	Substitution - Off (Tactical)
5487	17	303479	00:00	84:38	1	2	Starting XI	Substitution - Off (Tactical)
5503	23	303479	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303479	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303479	00:00	\N	1	\N	Starting XI	Final Whistle
8118	15	303479	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	303479	73:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17304	17	303479	87:58	89:36	2	2	Substitution - On (Tactical)	Tactical Shift
17304	6	303479	89:36	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303479	00:00	\N	1	\N	Starting XI	Final Whistle
30756	17	303479	84:38	86:51	2	2	Substitution - On (Tactical)	Tactical Shift
30756	21	303479	86:51	89:36	2	2	Tactical Shift	Tactical Shift
30756	12	303479	89:36	\N	2	\N	Tactical Shift	Final Whistle
5203	2	303487	22:12	22:13	1	1	Substitution - On (Injury)	Tactical Shift
5203	10	303487	22:13	\N	1	\N	Tactical Shift	Final Whistle
5213	3	303487	00:00	\N	1	\N	Starting XI	Final Whistle
5246	21	303487	72:28	72:54	2	2	Substitution - On (Tactical)	Tactical Shift
5246	23	303487	72:54	\N	2	\N	Tactical Shift	Final Whistle
5477	21	303487	45:00	45:27	2	2	Substitution - On (Tactical)	Tactical Shift
5477	17	303487	45:27	72:54	2	2	Tactical Shift	Tactical Shift
5477	21	303487	72:54	\N	2	\N	Tactical Shift	Final Whistle
5487	23	303487	00:00	45:27	1	2	Starting XI	Tactical Shift
5487	21	303487	45:27	72:28	2	2	Tactical Shift	Substitution - Off (Tactical)
5492	5	303487	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	303487	00:00	45:27	1	2	Starting XI	Tactical Shift
5503	23	303487	45:27	72:54	2	2	Tactical Shift	Tactical Shift
5503	17	303487	72:54	\N	2	\N	Tactical Shift	Final Whistle
6374	2	303487	00:00	22:12	1	1	Starting XI	Substitution - Off (Injury)
6379	10	303487	00:00	22:13	1	1	Starting XI	Tactical Shift
6379	2	303487	22:13	\N	1	\N	Tactical Shift	Final Whistle
8118	13	303487	00:00	\N	1	\N	Starting XI	Final Whistle
11392	15	303487	00:00	\N	1	\N	Starting XI	Final Whistle
17304	6	303487	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303487	00:00	\N	1	\N	Starting XI	Final Whistle
30756	21	303487	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6387	21	303493	00:00	56:55	1	2	Starting XI	Substitution - Off (Tactical)
6391	19	303493	77:56	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6392	17	303493	00:00	68:58	1	2	Starting XI	Substitution - Off (Tactical)
6393	23	303493	00:00	68:59	1	2	Starting XI	Substitution - Off (Tactical)
6397	3	303493	00:00	\N	1	\N	Starting XI	Final Whistle
6649	2	303493	00:00	\N	1	\N	Starting XI	Final Whistle
6667	11	303493	00:00	\N	1	\N	Starting XI	Final Whistle
6699	17	303493	68:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6775	9	303493	56:52	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6789	6	303493	00:00	\N	1	\N	Starting XI	Final Whistle
6842	21	303493	56:55	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6877	5	303493	00:00	\N	1	\N	Starting XI	Final Whistle
11746	9	303493	00:00	56:52	1	2	Starting XI	Substitution - Off (Tactical)
11748	1	303493	00:00	\N	1	\N	Starting XI	Final Whistle
30225	19	303493	00:00	77:56	1	2	Starting XI	Substitution - Off (Tactical)
32953	23	303493	68:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6592	5	303504	00:00	\N	1	\N	Starting XI	Final Whistle
6668	22	303504	00:00	81:51	1	2	Starting XI	Substitution - Off (Tactical)
6680	16	303504	61:26	64:56	2	2	Substitution - On (Tactical)	Tactical Shift
6680	12	303504	64:56	91:06	2	2	Tactical Shift	Tactical Shift
6680	22	303504	91:06	\N	2	\N	Tactical Shift	Final Whistle
6682	3	303504	00:00	\N	1	\N	Starting XI	Final Whistle
6688	12	303504	00:00	64:56	1	2	Starting XI	Tactical Shift
6688	16	303504	64:56	87:03	2	2	Tactical Shift	Substitution - Off (Tactical)
6782	16	303504	00:00	61:26	1	2	Starting XI	Substitution - Off (Tactical)
6796	9	303504	00:00	\N	1	\N	Starting XI	Final Whistle
6809	16	303504	87:03	91:06	2	2	Substitution - On (Tactical)	Tactical Shift
6809	12	303504	91:06	\N	2	\N	Tactical Shift	Final Whistle
11669	11	303504	00:00	\N	1	\N	Starting XI	Final Whistle
11676	2	303504	00:00	\N	1	\N	Starting XI	Final Whistle
17303	22	303504	81:51	91:06	2	2	Substitution - On (Tactical)	Tactical Shift
17303	16	303504	91:06	\N	2	\N	Tactical Shift	Final Whistle
21147	24	303504	00:00	\N	1	\N	Starting XI	Final Whistle
23344	1	303504	00:00	\N	1	\N	Starting XI	Final Whistle
23948	6	303504	00:00	\N	1	\N	Starting XI	Final Whistle
5194	24	303516	00:00	60:08	1	2	Starting XI	Substitution - Off (Tactical)
5217	22	303516	00:00	80:15	1	2	Starting XI	Tactical Shift
5217	23	303516	80:15	\N	2	\N	Tactical Shift	Final Whistle
6310	13	303516	59:04	60:15	2	2	Substitution - On (Tactical)	Tactical Shift
6310	10	303516	60:15	80:15	2	2	Tactical Shift	Tactical Shift
6310	15	303516	80:15	\N	2	\N	Tactical Shift	Final Whistle
6585	4	303516	72:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6594	8	303516	80:14	80:15	2	2	Substitution - On (Tactical)	Tactical Shift
6594	18	303516	80:15	\N	2	\N	Tactical Shift	Final Whistle
6609	15	303516	00:00	80:15	1	2	Starting XI	Tactical Shift
6609	8	303516	80:15	\N	2	\N	Tactical Shift	Final Whistle
6724	24	303516	60:08	80:15	2	2	Substitution - On (Tactical)	Tactical Shift
6724	20	303516	80:15	\N	2	\N	Tactical Shift	Final Whistle
6795	1	303516	00:00	\N	1	\N	Starting XI	Final Whistle
6799	13	303516	00:00	59:04	1	2	Starting XI	Substitution - Off (Tactical)
6998	10	303516	59:15	60:15	2	2	Substitution - On (Tactical)	Tactical Shift
6998	13	303516	60:15	\N	2	\N	Tactical Shift	Final Whistle
11388	4	303516	00:00	72:18	1	2	Starting XI	Substitution - Off (Tactical)
12555	10	303516	00:00	59:15	1	2	Starting XI	Substitution - Off (Tactical)
16555	3	303516	00:00	\N	1	\N	Starting XI	Final Whistle
22029	7	303516	00:00	\N	1	\N	Starting XI	Final Whistle
24273	5	303516	00:00	\N	1	\N	Starting XI	Final Whistle
41116	8	303516	00:00	80:14	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	303517	00:00	78:52	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303517	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303517	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303517	00:00	84:38	1	2	Starting XI	Substitution - Off (Tactical)
5487	21	303517	00:00	86:38	1	2	Starting XI	Tactical Shift
5487	23	303517	86:38	\N	2	\N	Tactical Shift	Final Whistle
5492	5	303517	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	303517	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303517	84:39	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6379	2	303517	00:00	84:39	1	2	Starting XI	Substitution - Off (Tactical)
8118	10	303517	78:52	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8206	13	303517	00:00	\N	1	\N	Starting XI	Final Whistle
13599	15	303517	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303517	00:00	\N	1	\N	Starting XI	Final Whistle
25006	23	303517	84:38	86:38	2	2	Substitution - On (Tactical)	Tactical Shift
25006	21	303517	86:38	\N	2	\N	Tactical Shift	Final Whistle
5213	3	303524	00:00	79:05	1	2	Starting XI	Player Off
5213	3	303524	79:54	82:02	2	2	Player On	Substitution - Off (Injury)
5246	23	303524	00:00	\N	1	\N	Starting XI	Final Whistle
5470	10	303524	00:00	\N	1	\N	Starting XI	Final Whistle
5487	21	303524	00:00	\N	1	\N	Starting XI	Final Whistle
5492	3	303524	82:02	\N	2	\N	Substitution - On (Injury)	Final Whistle
5503	17	303524	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	303524	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303524	00:00	\N	1	\N	Starting XI	Final Whistle
8118	15	303524	00:00	28:25	1	1	Starting XI	Tactical Shift
8118	13	303524	28:25	76:23	1	2	Tactical Shift	Tactical Shift
8118	15	303524	76:23	\N	2	\N	Tactical Shift	Final Whistle
8206	15	303524	73:01	76:23	2	2	Substitution - On (Tactical)	Tactical Shift
8206	13	303524	76:23	\N	2	\N	Tactical Shift	Final Whistle
11392	13	303524	00:00	28:25	1	1	Starting XI	Tactical Shift
11392	15	303524	28:25	73:01	1	2	Tactical Shift	Substitution - Off (Tactical)
17304	6	303524	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303524	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303532	00:00	62:21	1	2	Starting XI	Substitution - Off (Tactical)
5213	3	303532	00:00	57:58	1	2	Starting XI	Player Off
5213	3	303532	59:29	72:29	2	2	Player On	Substitution - Off (Tactical)
5246	21	303532	53:11	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5470	13	303532	00:00	\N	1	\N	Starting XI	Final Whistle
5487	23	303532	00:00	\N	1	\N	Starting XI	Final Whistle
5492	3	303532	72:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	17	303532	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303532	52:57	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6379	2	303532	00:00	52:57	1	2	Starting XI	Substitution - Off (Tactical)
6826	5	303532	00:00	\N	1	\N	Starting XI	Final Whistle
8206	10	303532	62:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11392	15	303532	00:00	72:23	1	2	Starting XI	Substitution - Off (Tactical)
17304	6	303532	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303532	00:00	\N	1	\N	Starting XI	Final Whistle
24841	15	303532	72:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	21	303532	00:00	53:11	1	2	Starting XI	Substitution - Off (Tactical)
4447	21	303548	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303548	00:00	70:22	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303548	00:00	85:11	1	2	Starting XI	Tactical Shift
5211	15	303548	85:11	\N	2	\N	Tactical Shift	Final Whistle
5213	3	303548	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303548	56:44	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5470	13	303548	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	23	303548	00:00	56:44	1	2	Starting XI	Substitution - Off (Tactical)
5503	17	303548	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303548	70:15	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6379	2	303548	00:00	70:15	1	2	Starting XI	Substitution - Off (Tactical)
8118	15	303548	00:00	83:50	1	2	Starting XI	Substitution - Off (Tactical)
8206	13	303548	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
11392	10	303548	70:22	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17304	15	303548	83:50	85:11	2	2	Substitution - On (Tactical)	Tactical Shift
17304	6	303548	85:11	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303548	00:00	\N	1	\N	Starting XI	Final Whistle
32480	5	303548	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303596	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303596	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303596	00:00	\N	1	\N	Starting XI	Final Whistle
5470	10	303596	00:00	\N	1	\N	Starting XI	Final Whistle
5487	21	303596	00:00	82:01	1	2	Starting XI	Substitution - Off (Tactical)
5503	17	303596	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303596	00:00	54:58	1	2	Starting XI	Substitution - Off (Tactical)
6379	13	303596	00:00	55:00	1	2	Starting XI	Tactical Shift
6379	2	303596	55:00	\N	2	\N	Tactical Shift	Final Whistle
6826	5	303596	00:00	83:11	1	2	Starting XI	Player Off
6826	5	303596	83:49	\N	2	\N	Player On	Final Whistle
8118	15	303596	00:00	\N	1	\N	Starting XI	Final Whistle
8206	2	303596	54:58	55:00	2	2	Substitution - On (Tactical)	Tactical Shift
8206	13	303596	55:00	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303596	00:00	\N	1	\N	Starting XI	Final Whistle
30756	21	303596	82:01	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6760	19	303600	65:47	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11292	7	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
11292	2	303600	32:59	\N	1	\N	Tactical Shift	Final Whistle
11296	19	303600	00:00	65:47	1	2	Starting XI	Substitution - Off (Tactical)
11298	8	303600	00:00	32:03	1	1	Starting XI	Substitution - Off (Tactical)
11301	9	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
11301	13	303600	32:59	56:40	1	2	Tactical Shift	Tactical Shift
11301	15	303600	56:40	\N	2	\N	Tactical Shift	Final Whistle
11302	1	303600	00:00	\N	1	\N	Starting XI	Final Whistle
11303	11	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
11303	15	303600	32:59	52:42	1	2	Tactical Shift	Substitution - Off (Tactical)
11304	4	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
11304	3	303600	32:59	\N	1	\N	Tactical Shift	Final Whistle
12073	15	303600	52:42	56:40	2	2	Substitution - On (Tactical)	Tactical Shift
12073	12	303600	56:40	\N	2	\N	Tactical Shift	Final Whistle
17027	22	303600	00:00	56:40	1	2	Starting XI	Tactical Shift
17027	23	303600	56:40	\N	2	\N	Tactical Shift	Final Whistle
17520	5	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
17520	6	303600	32:59	\N	1	\N	Tactical Shift	Final Whistle
22020	3	303600	00:00	32:59	1	1	Starting XI	Tactical Shift
22020	10	303600	32:59	56:40	1	2	Tactical Shift	Tactical Shift
22020	13	303600	56:40	\N	2	\N	Tactical Shift	Final Whistle
24777	24	303600	00:00	56:40	1	2	Starting XI	Tactical Shift
24777	16	303600	56:40	\N	2	\N	Tactical Shift	Final Whistle
30519	8	303600	32:03	32:59	1	1	Substitution - On (Tactical)	Tactical Shift
30519	5	303600	32:59	55:15	1	2	Tactical Shift	Player Off
30519	5	303600	55:48	\N	2	\N	Player On	Final Whistle
5203	10	303610	00:00	\N	1	\N	Starting XI	Final Whistle
5211	8	303610	00:00	\N	1	\N	Starting XI	Final Whistle
5213	4	303610	00:00	\N	1	\N	Starting XI	Final Whistle
5470	15	303610	00:00	70:21	1	2	Starting XI	Substitution - Off (Tactical)
5487	24	303610	00:00	\N	1	\N	Starting XI	Final Whistle
5492	5	303610	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	303610	00:00	\N	1	\N	Starting XI	Final Whistle
6379	3	303610	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	303610	00:00	82:51	1	2	Starting XI	Substitution - Off (Tactical)
11392	13	303610	82:51	\N	2	\N	Substitution - On (Tactical)	Final Whistle
20055	1	303610	00:00	\N	1	\N	Starting XI	Final Whistle
24841	15	303610	70:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
25006	7	303610	78:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	7	303610	00:00	78:58	1	2	Starting XI	Substitution - Off (Tactical)
4447	24	303615	81:40	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	303615	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303615	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303615	00:00	\N	1	\N	Starting XI	Final Whistle
5246	24	303615	00:00	81:40	1	2	Starting XI	Substitution - Off (Tactical)
5470	13	303615	00:00	91:21	1	2	Starting XI	Substitution - Off (Tactical)
5487	22	303615	00:00	70:35	1	2	Starting XI	Substitution - Off (Tactical)
5503	19	303615	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303615	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6379	15	303615	00:00	45:05	1	2	Starting XI	Tactical Shift
6379	2	303615	45:05	\N	2	\N	Tactical Shift	Final Whistle
6826	5	303615	00:00	\N	1	\N	Starting XI	Final Whistle
8206	22	303615	70:35	71:00	2	2	Substitution - On (Tactical)	Tactical Shift
8206	15	303615	71:00	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303615	00:00	\N	1	\N	Starting XI	Final Whistle
30756	2	303615	45:00	45:05	2	2	Substitution - On (Tactical)	Tactical Shift
30756	15	303615	45:05	71:00	2	2	Tactical Shift	Tactical Shift
30756	22	303615	71:00	\N	2	\N	Tactical Shift	Final Whistle
32480	13	303615	91:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6587	8	303634	91:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6591	7	303634	00:00	\N	1	\N	Starting XI	Final Whistle
6604	13	303634	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6693	4	303634	00:00	\N	1	\N	Starting XI	Final Whistle
6735	24	303634	00:00	69:44	1	2	Starting XI	Substitution - Off (Tactical)
6810	22	303634	00:00	70:07	1	2	Starting XI	Substitution - Off (Tactical)
23213	22	303634	70:07	80:05	2	2	Substitution - On (Tactical)	Tactical Shift
23213	19	303634	80:05	\N	2	\N	Tactical Shift	Final Whistle
23944	13	303634	45:00	50:03	2	2	Substitution - On (Tactical)	Tactical Shift
23944	10	303634	50:03	\N	2	\N	Tactical Shift	Final Whistle
23945	15	303634	00:00	\N	1	\N	Starting XI	Final Whistle
23947	13	303634	84:41	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23950	5	303634	00:00	\N	1	\N	Starting XI	Final Whistle
24085	8	303634	00:00	91:18	1	2	Starting XI	Substitution - Off (Tactical)
24211	1	303634	00:00	\N	1	\N	Starting XI	Final Whistle
24212	3	303634	00:00	\N	1	\N	Starting XI	Final Whistle
24315	24	303634	69:44	80:05	2	2	Substitution - On (Tactical)	Tactical Shift
24315	23	303634	80:05	\N	2	\N	Tactical Shift	Final Whistle
30277	10	303634	00:00	50:03	1	2	Starting XI	Tactical Shift
30277	13	303634	50:03	84:41	2	2	Tactical Shift	Substitution - Off (Tactical)
5203	10	303652	00:00	80:03	1	2	Starting XI	Tactical Shift
5203	11	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
5211	6	303652	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303652	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303652	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	303652	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5487	21	303652	00:00	79:17	1	2	Starting XI	Substitution - Off (Tactical)
5503	17	303652	00:00	80:03	1	2	Starting XI	Tactical Shift
5503	12	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
6374	21	303652	79:17	80:03	2	2	Substitution - On (Tactical)	Tactical Shift
6374	2	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
6379	2	303652	00:00	80:03	1	2	Starting XI	Tactical Shift
6379	9	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
6590	1	303652	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303652	00:00	\N	1	\N	Starting XI	Final Whistle
8118	15	303652	00:00	80:03	1	2	Starting XI	Tactical Shift
8118	19	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
8206	13	303652	45:00	80:03	2	2	Substitution - On (Tactical)	Tactical Shift
8206	16	303652	80:03	\N	2	\N	Tactical Shift	Final Whistle
5203	10	303664	00:00	72:56	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303664	00:00	73:19	1	2	Starting XI	Substitution - Off (Tactical)
5213	3	303664	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303664	00:00	\N	1	\N	Starting XI	Final Whistle
5470	13	303664	00:00	78:41	1	2	Starting XI	Substitution - Off (Tactical)
5487	21	303664	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	303664	00:00	\N	1	\N	Starting XI	Final Whistle
6374	6	303664	73:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6379	2	303664	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303664	00:00	\N	1	\N	Starting XI	Final Whistle
8118	15	303664	00:00	76:03	1	2	Starting XI	Tactical Shift
8118	10	303664	76:03	\N	2	\N	Tactical Shift	Final Whistle
8206	13	303664	78:41	\N	2	\N	Substitution - On (Tactical)	Final Whistle
13599	10	303664	72:56	76:03	2	2	Substitution - On (Tactical)	Tactical Shift
13599	15	303664	76:03	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303664	00:00	\N	1	\N	Starting XI	Final Whistle
6982	9	303666	82:48	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8866	23	303666	56:59	\N	2	\N	Substitution - On (Injury)	Final Whistle
11501	21	303666	00:00	61:28	1	2	Starting XI	Substitution - Off (Tactical)
16249	9	303666	00:00	82:48	1	2	Starting XI	Substitution - Off (Tactical)
23807	3	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24126	17	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24127	19	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24133	2	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24134	5	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24140	1	303666	00:00	\N	1	\N	Starting XI	Final Whistle
24143	21	303666	61:28	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24144	11	303666	00:00	43:59	1	1	Starting XI	Player Off
24144	11	303666	44:36	\N	1	\N	Player On	Final Whistle
25702	6	303666	00:00	\N	1	\N	Starting XI	Final Whistle
26009	23	303666	00:00	56:59	1	2	Starting XI	Substitution - Off (Injury)
4447	16	303674	00:00	62:18	1	2	Starting XI	Substitution - Off (Tactical)
5203	13	303674	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303674	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303674	00:00	\N	1	\N	Starting XI	Final Whistle
5246	24	303674	00:00	\N	1	\N	Starting XI	Final Whistle
5470	15	303674	00:00	87:58	1	2	Starting XI	Substitution - Off (Tactical)
5487	12	303674	78:12	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	22	303674	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303674	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303674	00:00	89:41	1	2	Starting XI	Player Off
6826	5	303674	89:52	\N	2	\N	Player On	Final Whistle
8206	12	303674	00:00	78:12	1	2	Starting XI	Substitution - Off (Tactical)
11392	16	303674	62:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
20055	1	303674	00:00	\N	1	\N	Starting XI	Final Whistle
24841	15	303674	87:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	303680	00:00	58:22	1	2	Starting XI	Tactical Shift
5203	11	303680	58:22	73:36	2	2	Tactical Shift	Substitution - Off (Tactical)
5211	6	303680	00:00	74:30	1	2	Starting XI	Tactical Shift
5211	8	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
5213	3	303680	00:00	74:30	1	2	Starting XI	Tactical Shift
5213	4	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
5246	24	303680	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5470	15	303680	56:34	58:22	2	2	Substitution - On (Tactical)	Tactical Shift
5470	9	303680	58:22	74:30	2	2	Tactical Shift	Tactical Shift
5470	10	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
5487	24	303680	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5503	22	303680	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303680	00:00	74:30	1	2	Starting XI	Tactical Shift
6374	7	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
6379	13	303680	00:00	58:22	1	2	Starting XI	Tactical Shift
6379	16	303680	58:22	74:30	2	2	Tactical Shift	Tactical Shift
6379	15	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
6826	5	303680	00:00	56:27	1	2	Starting XI	Substitution - Off (Tactical)
8206	19	303680	00:00	58:22	1	2	Starting XI	Tactical Shift
8206	12	303680	58:22	74:30	2	2	Tactical Shift	Tactical Shift
8206	13	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
17304	11	303680	73:36	74:30	2	2	Substitution - On (Tactical)	Tactical Shift
17304	5	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
20055	1	303680	00:00	\N	1	\N	Starting XI	Final Whistle
24841	15	303680	00:00	56:34	1	2	Starting XI	Substitution - Off (Tactical)
32480	5	303680	56:27	74:30	2	2	Substitution - On (Tactical)	Tactical Shift
32480	3	303680	74:30	\N	2	\N	Tactical Shift	Final Whistle
6592	5	303682	00:00	\N	1	\N	Starting XI	Final Whistle
6668	22	303682	00:00	59:14	1	2	Starting XI	Substitution - Off (Tactical)
6680	12	303682	00:00	\N	1	\N	Starting XI	Final Whistle
6682	3	303682	00:00	\N	1	\N	Starting XI	Final Whistle
6684	24	303682	00:00	59:31	1	2	Starting XI	Tactical Shift
6684	22	303682	59:31	\N	2	\N	Tactical Shift	Final Whistle
6688	16	303682	00:00	59:31	1	2	Starting XI	Tactical Shift
6688	11	303682	59:31	\N	2	\N	Tactical Shift	Final Whistle
6782	9	303682	77:17	\N	2	\N	Substitution - On (Injury)	Final Whistle
6784	6	303682	00:00	\N	1	\N	Starting XI	Final Whistle
11669	9	303682	00:00	58:50	1	2	Starting XI	Substitution - Off (Tactical)
11676	2	303682	00:00	\N	1	\N	Starting XI	Final Whistle
12020	9	303682	58:50	59:31	2	2	Substitution - On (Tactical)	Tactical Shift
12020	16	303682	59:31	\N	2	\N	Tactical Shift	Final Whistle
17303	11	303682	00:00	59:31	1	2	Starting XI	Tactical Shift
17303	9	303682	59:31	77:17	2	2	Tactical Shift	Substitution - Off (Injury)
21147	22	303682	59:14	59:31	2	2	Substitution - On (Tactical)	Tactical Shift
21147	24	303682	59:31	\N	2	\N	Tactical Shift	Final Whistle
23344	1	303682	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303696	00:00	84:30	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303696	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303696	00:00	\N	1	\N	Starting XI	Final Whistle
5246	24	303696	00:00	\N	1	\N	Starting XI	Final Whistle
5470	15	303696	00:00	62:36	1	2	Starting XI	Substitution - Off (Tactical)
5487	13	303696	89:57	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	22	303696	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303696	00:00	\N	1	\N	Starting XI	Final Whistle
6379	15	303696	62:36	85:03	2	2	Substitution - On (Tactical)	Tactical Shift
6379	10	303696	85:03	\N	2	\N	Tactical Shift	Final Whistle
6826	5	303696	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	303696	00:00	89:57	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	303696	00:00	\N	1	\N	Starting XI	Final Whistle
24841	19	303696	00:00	85:03	1	2	Starting XI	Tactical Shift
24841	15	303696	85:03	\N	2	\N	Tactical Shift	Final Whistle
30756	10	303696	84:30	85:03	2	2	Substitution - On (Tactical)	Tactical Shift
30756	19	303696	85:03	\N	2	\N	Tactical Shift	Final Whistle
5687	22	303700	70:49	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6698	1	303700	00:00	\N	1	\N	Starting XI	Final Whistle
6700	22	303700	00:00	70:49	1	2	Starting XI	Substitution - Off (Tactical)
6705	6	303700	00:00	\N	1	\N	Starting XI	Final Whistle
6707	24	303700	00:00	78:42	1	2	Starting XI	Substitution - Off (Tactical)
6708	3	303700	00:00	\N	1	\N	Starting XI	Final Whistle
6709	5	303700	00:00	\N	1	\N	Starting XI	Final Whistle
6711	24	303700	78:42	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6867	15	303700	00:00	\N	1	\N	Starting XI	Final Whistle
6907	12	303700	00:00	62:37	1	2	Starting XI	Substitution - Off (Tactical)
6910	12	303700	62:37	\N	2	\N	Substitution - On (Tactical)	Final Whistle
7105	16	303700	00:00	\N	1	\N	Starting XI	Final Whistle
8555	2	303700	00:00	\N	1	\N	Starting XI	Final Whistle
13107	13	303700	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	303707	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	303707	56:13	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5470	24	303707	88:47	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	24	303707	00:00	88:47	1	2	Starting XI	Substitution - Off (Tactical)
5492	3	303707	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	303707	00:00	\N	1	\N	Starting XI	Final Whistle
6374	2	303707	00:00	\N	1	\N	Starting XI	Final Whistle
6379	13	303707	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	303707	00:00	\N	1	\N	Starting XI	Final Whistle
8118	15	303707	00:00	\N	1	\N	Starting XI	Final Whistle
8206	19	303707	00:00	56:13	1	2	Starting XI	Substitution - Off (Tactical)
11392	19	303707	56:13	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17304	6	303707	00:00	56:13	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	303707	00:00	\N	1	\N	Starting XI	Final Whistle
5203	11	303715	00:00	56:18	1	2	Starting XI	Substitution - Off (Tactical)
5213	3	303715	00:00	\N	1	\N	Starting XI	Final Whistle
5246	23	303715	00:00	\N	1	\N	Starting XI	Final Whistle
5470	11	303715	56:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5477	17	303715	00:00	23:01	1	1	Starting XI	Tactical Shift
5477	21	303715	23:01	69:02	1	2	Tactical Shift	Tactical Shift
5477	17	303715	69:02	\N	2	\N	Tactical Shift	Final Whistle
5487	21	303715	00:00	23:01	1	1	Starting XI	Tactical Shift
5487	17	303715	23:01	56:27	1	2	Tactical Shift	Substitution - Off (Tactical)
5492	5	303715	00:00	\N	1	\N	Starting XI	Final Whistle
5503	19	303715	00:00	\N	1	\N	Starting XI	Final Whistle
5674	2	303715	00:00	\N	1	\N	Starting XI	Final Whistle
8118	9	303715	00:00	69:01	1	2	Starting XI	Substitution - Off (Tactical)
8206	17	303715	56:27	69:02	2	2	Substitution - On (Tactical)	Tactical Shift
8206	9	303715	69:02	\N	2	\N	Tactical Shift	Final Whistle
17304	6	303715	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303715	00:00	\N	1	\N	Starting XI	Final Whistle
30756	9	303715	69:01	69:02	2	2	Substitution - On (Tactical)	Tactical Shift
30756	21	303715	69:02	\N	2	\N	Tactical Shift	Final Whistle
4447	10	303725	71:33	72:23	2	2	Substitution - On (Tactical)	Tactical Shift
4447	23	303725	72:23	\N	2	\N	Tactical Shift	Final Whistle
5203	10	303725	00:00	71:33	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	303725	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	303725	00:00	81:50	1	2	Starting XI	Substitution - Off (Tactical)
5246	24	303725	00:00	59:21	1	2	Starting XI	Substitution - Off (Tactical)
5470	2	303725	59:23	59:26	2	2	Substitution - On (Tactical)	Tactical Shift
5470	15	303725	59:26	72:23	2	2	Tactical Shift	Tactical Shift
5470	10	303725	72:23	\N	2	\N	Tactical Shift	Final Whistle
5487	22	303725	00:00	59:26	1	2	Starting XI	Tactical Shift
5487	24	303725	59:26	71:32	2	2	Tactical Shift	Substitution - Off (Tactical)
5503	19	303725	00:00	59:26	1	2	Starting XI	Tactical Shift
5503	22	303725	59:26	72:23	2	2	Tactical Shift	Tactical Shift
5503	17	303725	72:23	\N	2	\N	Tactical Shift	Final Whistle
6374	2	303725	00:00	59:23	1	2	Starting XI	Substitution - Off (Tactical)
6379	15	303725	00:00	59:26	1	2	Starting XI	Tactical Shift
6379	2	303725	59:26	\N	2	\N	Tactical Shift	Final Whistle
6826	5	303725	00:00	\N	1	\N	Starting XI	Final Whistle
8206	13	303725	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	303725	00:00	\N	1	\N	Starting XI	Final Whistle
24841	24	303725	59:21	59:26	2	2	Substitution - On (Tactical)	Tactical Shift
24841	19	303725	59:26	72:23	2	2	Tactical Shift	Tactical Shift
24841	15	303725	72:23	\N	2	\N	Tactical Shift	Final Whistle
30756	24	303725	71:32	72:23	2	2	Substitution - On (Tactical)	Tactical Shift
30756	21	303725	72:23	\N	2	\N	Tactical Shift	Final Whistle
32480	3	303725	81:50	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5687	21	303731	00:00	65:09	1	2	Starting XI	Substitution - Off (Tactical)
6698	1	303731	00:00	\N	1	\N	Starting XI	Final Whistle
6700	23	303731	00:00	65:29	1	2	Starting XI	Substitution - Off (Tactical)
6705	6	303731	00:00	\N	1	\N	Starting XI	Final Whistle
6709	5	303731	00:00	\N	1	\N	Starting XI	Final Whistle
6712	19	303731	00:00	\N	1	\N	Starting XI	Final Whistle
6867	9	303731	00:00	\N	1	\N	Starting XI	Final Whistle
6910	11	303731	00:00	82:34	1	2	Starting XI	Substitution - Off (Tactical)
7105	17	303731	00:00	\N	1	\N	Starting XI	Final Whistle
7154	11	303731	82:34	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8555	21	303731	65:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23803	3	303731	00:00	\N	1	\N	Starting XI	Final Whistle
23808	23	303731	65:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23981	2	303731	00:00	\N	1	\N	Starting XI	Final Whistle
4447	21	3764440	00:00	45:00	1	2	Starting XI	Tactical Shift
4447	23	3764440	45:00	75:18	2	2	Tactical Shift	Substitution - Off (Tactical)
5203	17	3764440	65:49	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5211	6	3764440	00:00	76:08	1	2	Starting XI	Substitution - Off (Tactical)
5213	3	3764440	00:00	75:33	1	2	Starting XI	Substitution - Off (Tactical)
5477	21	3764440	45:00	45:00	2	2	Tactical Shift	Substitution - On (Tactical)
5477	10	3764440	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	23	3764440	75:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5492	5	3764440	00:00	84:54	1	2	Starting XI	Player Off
5492	5	3764440	85:27	\N	2	\N	Player On	Final Whistle
5503	23	3764440	00:00	45:00	1	2	Starting XI	Tactical Shift
5503	19	3764440	45:00	\N	2	\N	Tactical Shift	Final Whistle
6826	3	3764440	75:33	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6947	10	3764440	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
8118	13	3764440	00:00	45:00	1	2	Starting XI	Tactical Shift
8118	15	3764440	45:00	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3764440	00:00	\N	1	\N	Starting XI	Final Whistle
21881	6	3764440	76:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
22390	17	3764440	00:00	65:49	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3764440	00:00	45:00	1	2	Starting XI	Tactical Shift
30486	13	3764440	45:00	\N	2	\N	Tactical Shift	Final Whistle
43728	2	3764440	00:00	\N	1	\N	Starting XI	Final Whistle
4447	17	3764661	74:26	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
5477	17	3764661	00:00	74:26	1	2	Starting XI	Substitution - Off (Tactical)
5487	21	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
5503	23	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3764661	00:00	74:21	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
32480	3	3764661	00:00	\N	1	\N	Starting XI	Final Whistle
43728	2	3764661	74:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
4447	23	3773369	84:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	9	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
5211	8	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
5477	23	3773369	00:00	84:21	1	2	Starting XI	Substitution - Off (Tactical)
5487	20	3773369	00:00	68:34	1	2	Starting XI	Substitution - Off (Tactical)
5503	18	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
8118	4	3773369	00:00	62:16	1	2	Starting XI	Substitution - Off (Tactical)
20055	1	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773369	00:00	68:35	1	2	Starting XI	Substitution - Off (Tactical)
22390	7	3773369	68:35	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24841	20	3773369	84:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	11	3773369	00:00	69:19	1	2	Starting XI	Tactical Shift
30486	20	3773369	69:19	84:29	2	2	Tactical Shift	Substitution - Off (Tactical)
32480	4	3773369	62:16	\N	2	\N	Substitution - On (Tactical)	Final Whistle
39073	20	3773369	68:34	69:19	2	2	Substitution - On (Tactical)	Tactical Shift
39073	11	3773369	69:19	\N	2	\N	Tactical Shift	Final Whistle
43728	3	3773369	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	3773372	00:00	30:59	1	1	Starting XI	Substitution - Off (Injury)
5211	8	3773372	00:00	76:26	1	2	Starting XI	Tactical Shift
5211	6	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
5213	4	3773372	00:00	76:26	1	2	Starting XI	Tactical Shift
5213	3	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
5477	7	3773372	74:43	76:26	2	2	Substitution - On (Tactical)	Tactical Shift
5477	17	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
5487	24	3773372	00:00	76:26	1	2	Starting XI	Tactical Shift
5487	21	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
5503	22	3773372	00:00	76:26	1	2	Starting XI	Tactical Shift
5503	23	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
6379	15	3773372	74:46	76:26	2	2	Substitution - On (Tactical)	Tactical Shift
6379	13	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773372	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	3773372	00:00	76:26	1	2	Starting XI	Tactical Shift
8118	15	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773372	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773372	00:00	74:43	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3773372	00:00	74:46	1	2	Starting XI	Substitution - Off (Tactical)
32480	3	3773372	45:00	76:26	2	2	Substitution - On (Tactical)	Tactical Shift
32480	2	3773372	76:26	\N	2	\N	Tactical Shift	Final Whistle
39073	10	3773372	30:59	\N	1	\N	Substitution - On (Injury)	Final Whistle
43728	3	3773372	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
3501	15	3773377	00:00	45:00	1	2	Starting XI	Tactical Shift
3501	21	3773377	45:00	78:21	2	2	Tactical Shift	Substitution - Off (Tactical)
4447	16	3773377	00:00	45:00	1	2	Starting XI	Tactical Shift
4447	23	3773377	45:00	78:22	2	2	Tactical Shift	Tactical Shift
4447	21	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
5203	10	3773377	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773377	00:00	78:22	1	2	Starting XI	Tactical Shift
5211	8	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
5487	12	3773377	00:00	45:00	1	2	Starting XI	Tactical Shift
5487	19	3773377	45:00	72:46	2	2	Tactical Shift	Substitution - Off (Tactical)
5503	23	3773377	00:00	45:00	1	2	Starting XI	Tactical Shift
5503	17	3773377	45:00	72:48	2	2	Tactical Shift	Tactical Shift
5503	19	3773377	72:48	78:22	2	2	Tactical Shift	Tactical Shift
5503	23	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
6826	21	3773377	78:21	78:22	2	2	Substitution - On (Tactical)	Tactical Shift
6826	5	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
6947	13	3773377	85:05	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	15	3773377	45:00	45:00	2	2	Tactical Shift	Substitution - On (Tactical)
8118	10	3773377	45:00	72:48	2	2	Substitution - On (Tactical)	Tactical Shift
8118	15	3773377	72:48	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773377	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773377	00:00	78:22	1	2	Starting XI	Tactical Shift
21881	7	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
22390	19	3773377	72:46	72:48	2	2	Substitution - On (Tactical)	Tactical Shift
22390	17	3773377	72:48	\N	2	\N	Tactical Shift	Final Whistle
30486	13	3773377	00:00	45:00	1	2	Starting XI	Tactical Shift
30486	9	3773377	45:00	78:22	2	2	Tactical Shift	Tactical Shift
30486	13	3773377	78:22	85:05	2	2	Tactical Shift	Substitution - Off (Tactical)
32480	3	3773377	00:00	78:22	1	2	Starting XI	Tactical Shift
32480	4	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
43728	5	3773377	00:00	78:22	1	2	Starting XI	Tactical Shift
43728	3	3773377	78:22	\N	2	\N	Tactical Shift	Final Whistle
4447	21	3773386	77:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	9	3773386	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773386	00:00	68:15	1	2	Starting XI	Substitution - Off (Tactical)
5213	3	3773386	00:00	\N	1	\N	Starting XI	Final Whistle
5477	17	3773386	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5487	23	3773386	00:00	\N	1	\N	Starting XI	Final Whistle
5503	19	3773386	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	3773386	00:00	\N	1	\N	Starting XI	Final Whistle
6590	1	3773386	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773386	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
6947	9	3773386	45:00	\N	2	\N	Tactical Shift	Final Whistle
8118	11	3773386	00:00	45:00	1	2	Starting XI	Tactical Shift
8118	5	3773386	45:00	\N	2	\N	Tactical Shift	Final Whistle
21881	6	3773386	68:15	\N	2	\N	Substitution - On (Tactical)	Final Whistle
22390	17	3773386	45:00	\N	2	\N	Tactical Shift	Final Whistle
30486	11	3773386	45:00	45:00	2	2	Tactical Shift	Substitution - On (Tactical)
30486	5	3773386	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	21	3773386	00:00	77:18	1	2	Starting XI	Substitution - Off (Tactical)
5598	5	3773387	00:00	60:49	1	2	Starting XI	Substitution - Off (Tactical)
6592	3	3773387	00:00	\N	1	\N	Starting XI	Final Whistle
6657	22	3773387	74:41	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6668	24	3773387	00:00	60:53	1	2	Starting XI	Tactical Shift
6668	16	3773387	60:53	89:15	2	2	Tactical Shift	Substitution - Off (Tactical)
6672	2	3773387	74:28	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6684	22	3773387	00:00	74:41	1	2	Starting XI	Substitution - Off (Tactical)
6782	16	3773387	00:00	60:25	1	2	Starting XI	Substitution - Off (Tactical)
6784	6	3773387	00:00	\N	1	\N	Starting XI	Final Whistle
6807	9	3773387	00:00	60:53	1	2	Starting XI	Tactical Shift
6807	5	3773387	60:53	\N	2	\N	Tactical Shift	Final Whistle
11669	11	3773387	00:00	\N	1	\N	Starting XI	Final Whistle
11676	2	3773387	00:00	74:28	1	2	Starting XI	Substitution - Off (Tactical)
23344	1	3773387	00:00	\N	1	\N	Starting XI	Final Whistle
23966	5	3773387	60:49	60:53	2	2	Substitution - On (Tactical)	Tactical Shift
23966	9	3773387	60:53	\N	2	\N	Tactical Shift	Final Whistle
30593	16	3773387	60:25	60:53	2	2	Substitution - On (Tactical)	Tactical Shift
30593	24	3773387	60:53	\N	2	\N	Tactical Shift	Final Whistle
32673	12	3773387	00:00	\N	1	\N	Starting XI	Final Whistle
41202	16	3773387	89:15	\N	2	\N	Substitution - On (Tactical)	Final Whistle
4447	13	3773403	86:28	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5211	6	3773403	00:00	83:41	1	2	Starting XI	Tactical Shift
5211	8	3773403	83:41	\N	2	\N	Tactical Shift	Final Whistle
5477	17	3773403	00:00	83:41	1	2	Starting XI	Tactical Shift
5477	13	3773403	83:41	86:28	2	2	Tactical Shift	Substitution - Off (Tactical)
5487	21	3773403	00:00	83:40	1	2	Starting XI	Substitution - Off (Tactical)
5492	5	3773403	00:00	83:41	1	2	Starting XI	Tactical Shift
5492	4	3773403	83:41	\N	2	\N	Tactical Shift	Final Whistle
5503	23	3773403	00:00	\N	1	\N	Starting XI	Final Whistle
6379	9	3773403	66:16	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6826	21	3773403	83:40	83:41	2	2	Substitution - On (Tactical)	Tactical Shift
6826	5	3773403	83:41	\N	2	\N	Tactical Shift	Final Whistle
6947	9	3773403	00:00	66:16	1	2	Starting XI	Substitution - Off (Tactical)
8118	11	3773403	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3773403	00:00	\N	1	\N	Starting XI	Final Whistle
30486	19	3773403	00:00	83:41	1	2	Starting XI	Tactical Shift
30486	15	3773403	83:41	\N	2	\N	Tactical Shift	Final Whistle
32480	3	3773403	00:00	\N	1	\N	Starting XI	Final Whistle
43728	2	3773403	00:00	83:41	1	2	Starting XI	Tactical Shift
43728	7	3773403	83:41	\N	2	\N	Tactical Shift	Final Whistle
6613	13	3773415	00:00	58:22	1	2	Starting XI	Tactical Shift
6613	16	3773415	58:22	75:17	2	2	Tactical Shift	Tactical Shift
6613	24	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
6908	12	3773415	61:43	75:17	2	2	Substitution - On (Injury)	Tactical Shift
6908	7	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
7578	23	3773415	58:15	75:17	2	2	Substitution - On (Tactical)	Tactical Shift
7578	22	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
20542	23	3773415	00:00	58:15	1	2	Starting XI	Substitution - Off (Tactical)
23811	15	3773415	00:00	75:13	1	2	Starting XI	Substitution - Off (Tactical)
23934	3	3773415	00:00	75:17	1	2	Starting XI	Tactical Shift
23934	4	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
23967	16	3773415	57:58	58:22	2	2	Substitution - On (Tactical)	Tactical Shift
23967	13	3773415	58:22	75:17	2	2	Tactical Shift	Tactical Shift
23967	15	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
23970	10	3773415	57:57	75:17	2	2	Substitution - On (Tactical)	Tactical Shift
23970	13	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
23971	16	3773415	00:00	57:58	1	2	Starting XI	Substitution - Off (Tactical)
23973	12	3773415	00:00	03:53	1	1	Starting XI	Player Off (Off Camera)
23973	12	3773415	04:02	61:43	1	2	Player On (Off Camera)	Substitution - Off (Injury)
24322	2	3773415	00:00	52:30	1	2	Starting XI	Player Off
24322	2	3773415	52:36	75:17	2	2	Player On	Tactical Shift
24322	3	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
24593	5	3773415	00:00	\N	1	\N	Starting XI	Final Whistle
24616	6	3773415	00:00	75:17	1	2	Starting XI	Tactical Shift
24616	8	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
24712	10	3773415	00:00	57:57	1	2	Starting XI	Substitution - Off (Tactical)
29198	1	3773415	00:00	\N	1	\N	Starting XI	Final Whistle
30370	15	3773415	75:13	75:17	2	2	Substitution - On (Tactical)	Tactical Shift
30370	10	3773415	75:17	\N	2	\N	Tactical Shift	Final Whistle
3501	21	3773428	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
4447	23	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
5203	9	3773428	00:00	77:01	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
5477	21	3773428	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	19	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
5503	17	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
6947	9	3773428	77:01	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	11	3773428	00:00	47:18	1	2	Starting XI	Tactical Shift
8118	3	3773428	47:18	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773428	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773428	00:00	76:54	1	2	Starting XI	Substitution - Off (Tactical)
22390	2	3773428	76:54	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	3	3773428	45:00	47:18	2	2	Substitution - On (Tactical)	Tactical Shift
30486	11	3773428	47:18	\N	2	\N	Tactical Shift	Final Whistle
43728	3	3773428	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5217	22	3773457	00:00	77:44	1	2	Starting XI	Substitution - Off (Tactical)
6594	24	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
6609	15	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
6724	16	3773457	00:00	68:34	1	2	Starting XI	Substitution - Off (Tactical)
6757	6	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
6799	12	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
11388	3	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
11389	13	3773457	00:00	92:24	1	2	Starting XI	Substitution - Off (Tactical)
22029	2	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
28658	16	3773457	68:34	\N	2	\N	Substitution - On (Tactical)	Final Whistle
39598	22	3773457	77:44	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40890	1	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
75546	5	3773457	00:00	\N	1	\N	Starting XI	Final Whistle
117025	13	3773457	92:24	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5217	24	3773466	00:00	32:14	1	1	Starting XI	Tactical Shift
5217	22	3773466	32:14	35:42	1	1	Tactical Shift	Tactical Shift
5217	24	3773466	35:42	37:16	1	1	Tactical Shift	Tactical Shift
5217	22	3773466	37:16	47:49	1	2	Tactical Shift	Tactical Shift
5217	24	3773466	47:49	59:43	2	2	Tactical Shift	Tactical Shift
5217	19	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
5523	10	3773466	00:00	59:43	1	2	Starting XI	Tactical Shift
5523	11	3773466	59:43	64:36	2	2	Tactical Shift	Tactical Shift
5523	9	3773466	64:36	74:06	2	2	Tactical Shift	Substitution - Off (Tactical)
6585	4	3773466	00:00	47:49	1	2	Starting XI	Tactical Shift
6585	5	3773466	47:49	67:39	2	2	Tactical Shift	Tactical Shift
6585	3	3773466	67:39	71:50	2	2	Tactical Shift	Tactical Shift
6585	5	3773466	71:50	\N	2	\N	Tactical Shift	Final Whistle
6594	22	3773466	59:16	59:43	2	2	Substitution - On (Tactical)	Tactical Shift
6594	23	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
6609	15	3773466	00:00	59:43	1	2	Starting XI	Tactical Shift
6609	13	3773466	59:43	64:36	2	2	Tactical Shift	Tactical Shift
6609	15	3773466	64:36	\N	2	\N	Tactical Shift	Final Whistle
6724	7	3773466	59:04	59:43	2	2	Substitution - On (Tactical)	Tactical Shift
6724	21	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
6803	22	3773466	00:00	32:14	1	1	Starting XI	Tactical Shift
6803	24	3773466	32:14	35:42	1	1	Tactical Shift	Tactical Shift
6803	22	3773466	35:42	37:16	1	1	Tactical Shift	Tactical Shift
6803	24	3773466	37:16	47:49	1	2	Tactical Shift	Tactical Shift
6803	22	3773466	47:49	59:16	2	2	Tactical Shift	Substitution - Off (Tactical)
6805	7	3773466	00:00	47:49	1	2	Starting XI	Tactical Shift
6805	3	3773466	47:49	59:43	2	2	Tactical Shift	Tactical Shift
6805	2	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
11388	8	3773466	31:40	32:01	1	1	Substitution - On (Injury)	Tactical Shift
11388	5	3773466	32:01	47:49	1	2	Tactical Shift	Tactical Shift
11388	4	3773466	47:49	59:43	2	2	Tactical Shift	Tactical Shift
11388	3	3773466	59:43	67:39	2	2	Tactical Shift	Tactical Shift
11388	5	3773466	67:39	71:50	2	2	Tactical Shift	Tactical Shift
11388	3	3773466	71:50	\N	2	\N	Tactical Shift	Final Whistle
11389	9	3773466	74:06	\N	2	\N	Substitution - On (Tactical)	Final Whistle
16555	3	3773466	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
24730	5	3773466	00:00	32:01	1	1	Starting XI	Tactical Shift
24730	8	3773466	32:01	59:43	1	2	Tactical Shift	Tactical Shift
24730	6	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
35000	8	3773466	00:00	31:40	1	1	Starting XI	Substitution - Off (Injury)
39598	3	3773466	45:00	47:49	2	2	Substitution - On (Tactical)	Tactical Shift
39598	13	3773466	47:49	59:43	2	2	Tactical Shift	Tactical Shift
39598	17	3773466	59:43	\N	2	\N	Tactical Shift	Final Whistle
40890	1	3773466	00:00	\N	1	\N	Starting XI	Final Whistle
47447	13	3773466	00:00	47:49	1	2	Starting XI	Tactical Shift
47447	7	3773466	47:49	59:04	2	2	Tactical Shift	Substitution - Off (Tactical)
4447	10	3773474	62:50	63:38	2	2	Substitution - On (Tactical)	Tactical Shift
4447	23	3773474	63:38	\N	2	\N	Tactical Shift	Final Whistle
5203	9	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
5203	10	3773474	45:00	62:50	2	2	Tactical Shift	Substitution - Off (Tactical)
5211	8	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
5211	6	3773474	45:00	\N	2	\N	Tactical Shift	Final Whistle
5477	23	3773474	00:00	63:38	1	2	Starting XI	Tactical Shift
5477	21	3773474	63:38	\N	2	\N	Tactical Shift	Final Whistle
5487	20	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
5487	16	3773474	45:00	62:47	2	2	Tactical Shift	Substitution - Off (Tactical)
5503	18	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
5503	12	3773474	45:00	63:38	2	2	Tactical Shift	Tactical Shift
5503	17	3773474	63:38	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773474	00:00	\N	1	\N	Starting XI	Final Whistle
8118	4	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
8118	13	3773474	45:00	63:38	2	2	Tactical Shift	Tactical Shift
8118	10	3773474	63:38	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773474	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
21881	2	3773474	45:00	86:33	2	2	Tactical Shift	Substitution - Off (Tactical)
22390	16	3773474	62:47	63:38	2	2	Substitution - On (Tactical)	Tactical Shift
22390	13	3773474	63:38	\N	2	\N	Tactical Shift	Final Whistle
24841	2	3773474	86:33	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	11	3773474	00:00	45:00	1	2	Starting XI	Tactical Shift
30486	15	3773474	45:00	76:15	2	2	Tactical Shift	Substitution - Off (Tactical)
32480	3	3773474	62:44	\N	2	\N	Substitution - On (Tactical)	Final Whistle
39073	15	3773474	76:15	\N	2	\N	Substitution - On (Tactical)	Final Whistle
43728	3	3773474	00:00	62:44	1	2	Starting XI	Substitution - Off (Tactical)
4691	1	3773477	00:00	\N	1	\N	Starting XI	Final Whistle
5214	13	3773477	00:00	\N	1	\N	Starting XI	Final Whistle
6648	3	3773477	00:00	62:21	1	2	Starting XI	Tactical Shift
6648	19	3773477	62:21	\N	2	\N	Tactical Shift	Final Whistle
6651	17	3773477	00:00	61:50	1	2	Starting XI	Substitution - Off (Tactical)
6658	21	3773477	00:00	61:51	1	2	Starting XI	Substitution - Off (Tactical)
6673	19	3773477	00:00	62:21	1	2	Starting XI	Tactical Shift
6673	15	3773477	62:21	72:12	2	2	Tactical Shift	Tactical Shift
6673	21	3773477	72:12	85:37	2	2	Tactical Shift	Substitution - Off (Tactical)
6752	21	3773477	61:51	62:21	2	2	Substitution - On (Tactical)	Tactical Shift
6752	5	3773477	62:21	\N	2	\N	Tactical Shift	Final Whistle
6851	17	3773477	61:50	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6880	23	3773477	00:00	70:47	1	2	Starting XI	Substitution - Off (Tactical)
7068	5	3773477	00:00	62:21	1	2	Starting XI	Tactical Shift
7068	3	3773477	62:21	\N	2	\N	Tactical Shift	Final Whistle
7910	23	3773477	70:47	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11538	6	3773477	00:00	\N	1	\N	Starting XI	Final Whistle
23522	2	3773477	00:00	\N	1	\N	Starting XI	Final Whistle
26404	15	3773477	00:00	62:21	1	2	Starting XI	Tactical Shift
26404	21	3773477	62:21	72:12	2	2	Tactical Shift	Tactical Shift
26404	15	3773477	72:12	\N	2	\N	Tactical Shift	Final Whistle
41083	21	3773477	85:37	\N	2	\N	Substitution - On (Tactical)	Final Whistle
4447	7	3773497	80:39	80:42	2	2	Substitution - On (Tactical)	Tactical Shift
4447	24	3773497	80:42	\N	2	\N	Tactical Shift	Final Whistle
5203	9	3773497	00:00	49:31	1	2	Starting XI	Tactical Shift
5203	10	3773497	49:31	63:41	2	2	Tactical Shift	Substitution - Off (Tactical)
5211	8	3773497	00:00	\N	1	\N	Starting XI	Final Whistle
5477	23	3773497	00:00	49:31	1	2	Starting XI	Tactical Shift
5477	7	3773497	49:31	80:39	2	2	Tactical Shift	Substitution - Off (Tactical)
5487	7	3773497	45:00	49:31	2	2	Substitution - On (Tactical)	Tactical Shift
5487	24	3773497	49:31	80:42	2	2	Tactical Shift	Tactical Shift
5487	15	3773497	80:42	\N	2	\N	Tactical Shift	Final Whistle
5503	17	3773497	00:00	49:31	1	2	Starting XI	Tactical Shift
5503	22	3773497	49:31	\N	2	\N	Tactical Shift	Final Whistle
6379	10	3773497	63:41	80:42	2	2	Substitution - On (Tactical)	Tactical Shift
6379	7	3773497	80:42	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773497	00:00	\N	1	\N	Starting XI	Final Whistle
8118	11	3773497	00:00	49:31	1	2	Starting XI	Tactical Shift
8118	13	3773497	49:31	80:42	2	2	Tactical Shift	Tactical Shift
8118	10	3773497	80:42	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773497	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773497	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
22390	15	3773497	80:41	80:42	2	2	Substitution - On (Tactical)	Tactical Shift
22390	13	3773497	80:42	\N	2	\N	Tactical Shift	Final Whistle
30486	21	3773497	00:00	49:31	1	2	Starting XI	Tactical Shift
30486	15	3773497	49:31	80:41	2	2	Tactical Shift	Substitution - Off (Tactical)
32480	4	3773497	00:00	71:24	1	2	Starting XI	Substitution - Off (Tactical)
39073	4	3773497	71:24	\N	2	\N	Substitution - On (Tactical)	Final Whistle
43728	3	3773497	00:00	\N	1	\N	Starting XI	Final Whistle
4447	21	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
5203	9	3773523	00:00	66:04	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
5487	17	3773523	00:00	65:30	1	2	Starting XI	Substitution - Off (Tactical)
5503	23	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773523	79:02	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6947	19	3773523	73:54	75:53	2	2	Substitution - On (Tactical)	Tactical Shift
6947	10	3773523	75:53	\N	2	\N	Tactical Shift	Final Whistle
8118	11	3773523	00:00	75:53	1	2	Starting XI	Tactical Shift
8118	15	3773523	75:53	\N	2	\N	Tactical Shift	Final Whistle
13599	9	3773523	66:04	75:53	2	2	Substitution - On (Tactical)	Tactical Shift
13599	13	3773523	75:53	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
22390	17	3773523	65:30	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	19	3773523	00:00	73:54	1	2	Starting XI	Substitution - Off (Tactical)
32480	3	3773523	00:00	\N	1	\N	Starting XI	Final Whistle
43728	5	3773523	00:00	79:02	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	3773526	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5477	21	3773526	80:27	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	21	3773526	00:00	80:27	1	2	Starting XI	Substitution - Off (Tactical)
5492	5	3773526	45:00	45:00	2	2	Tactical Shift	Substitution - On (Tactical)
5492	10	3773526	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	23	3773526	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773526	00:00	45:00	1	2	Starting XI	Tactical Shift
6826	3	3773526	45:00	\N	2	\N	Tactical Shift	Final Whistle
6947	10	3773526	71:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	3	3773526	00:00	45:00	1	2	Starting XI	Tactical Shift
8118	10	3773526	45:00	71:25	2	2	Tactical Shift	Substitution - Off (Tactical)
17304	6	3773526	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3773526	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773526	71:26	\N	2	\N	Substitution - On (Tactical)	Final Whistle
22390	17	3773526	00:00	\N	1	\N	Starting XI	Final Whistle
24841	15	3773526	00:00	\N	1	\N	Starting XI	Final Whistle
30486	13	3773526	63:54	\N	2	\N	Substitution - On (Tactical)	Final Whistle
39073	13	3773526	00:00	63:54	1	2	Starting XI	Substitution - Off (Tactical)
43728	2	3773526	00:00	71:26	1	2	Starting XI	Substitution - Off (Tactical)
6581	16	3773547	00:00	22:30	1	1	Starting XI	Substitution - Off (Injury)
6591	2	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
6604	15	3773547	63:07	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6693	5	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
6830	6	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
8654	24	3773547	00:00	73:59	1	2	Starting XI	Substitution - Off (Tactical)
23213	24	3773547	73:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23943	22	3773547	00:00	73:59	1	2	Starting XI	Substitution - Off (Tactical)
23944	13	3773547	00:00	63:05	1	2	Starting XI	Substitution - Off (Tactical)
23945	15	3773547	00:00	63:07	1	2	Starting XI	Substitution - Off (Tactical)
23947	13	3773547	63:05	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23949	3	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
24172	16	3773547	22:30	\N	1	\N	Substitution - On (Injury)	Final Whistle
24211	1	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
24315	22	3773547	73:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30277	12	3773547	00:00	\N	1	\N	Starting XI	Final Whistle
4447	23	3773552	00:00	80:35	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	3773552	00:00	74:31	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
5477	21	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
5487	23	3773552	80:35	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5503	17	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
6947	10	3773552	74:31	81:10	2	2	Substitution - On (Tactical)	Tactical Shift
6947	13	3773552	81:10	\N	2	\N	Tactical Shift	Final Whistle
8118	13	3773552	00:00	81:10	1	2	Starting XI	Tactical Shift
8118	10	3773552	81:10	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773552	00:00	74:17	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
32480	3	3773552	00:00	\N	1	\N	Starting XI	Final Whistle
43728	2	3773552	74:17	\N	2	\N	Substitution - On (Tactical)	Final Whistle
4447	23	3773565	64:33	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
5477	17	3773565	00:00	72:23	1	2	Starting XI	Substitution - Off (Tactical)
5487	21	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
5492	5	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
5503	23	3773565	00:00	64:33	1	2	Starting XI	Substitution - Off (Tactical)
6947	13	3773565	64:53	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	13	3773565	00:00	64:53	1	2	Starting XI	Substitution - Off (Tactical)
17304	2	3773565	80:22	\N	2	\N	Substitution - On (Tactical)	Final Whistle
20055	1	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
21881	2	3773565	00:00	80:22	1	2	Starting XI	Substitution - Off (Tactical)
22390	15	3773565	71:49	75:28	2	2	Substitution - On (Tactical)	Tactical Shift
22390	17	3773565	75:28	\N	2	\N	Tactical Shift	Final Whistle
24841	17	3773565	72:23	75:28	2	2	Substitution - On (Tactical)	Tactical Shift
24841	15	3773565	75:28	\N	2	\N	Tactical Shift	Final Whistle
30486	15	3773565	00:00	71:49	1	2	Starting XI	Substitution - Off (Tactical)
43728	3	3773565	00:00	\N	1	\N	Starting XI	Final Whistle
3610	13	3773571	56:27	\N	2	\N	Substitution - On (Tactical)	Final Whistle
7105	12	3773571	56:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11291	24	3773571	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11296	16	3773571	00:00	56:08	1	2	Starting XI	Substitution - Off (Tactical)
11298	6	3773571	00:00	\N	1	\N	Starting XI	Final Whistle
11300	15	3773571	00:00	78:10	1	2	Starting XI	Tactical Shift
11300	5	3773571	78:10	\N	2	\N	Tactical Shift	Final Whistle
11301	13	3773571	00:00	56:27	1	2	Starting XI	Substitution - Off (Tactical)
11302	1	3773571	00:00	\N	1	\N	Starting XI	Final Whistle
12073	2	3773571	00:00	62:35	1	2	Starting XI	Player Off
12073	2	3773571	65:31	\N	2	\N	Player On	Final Whistle
17027	15	3773571	78:10	78:10	2	2	Tactical Shift	Substitution - On (Tactical)
17027	5	3773571	78:10	\N	2	\N	Substitution - On (Tactical)	Final Whistle
21225	5	3773571	00:00	78:10	1	2	Starting XI	Substitution - Off (Tactical)
22020	3	3773571	00:00	\N	1	\N	Starting XI	Final Whistle
23627	12	3773571	00:00	56:59	1	2	Starting XI	Substitution - Off (Tactical)
29310	22	3773571	00:00	03:50	1	1	Starting XI	Player Off
29310	22	3773571	04:27	\N	1	\N	Player On (Off Camera)	Final Whistle
31235	24	3773571	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
40881	16	3773571	56:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3509	1	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
3804	6	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
5200	2	3773585	42:06	\N	1	\N	Substitution - On (Injury)	Final Whistle
5201	5	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
5202	2	3773585	00:00	42:06	1	1	Starting XI	Substitution - Off (Injury)
5463	13	3773585	68:28	\N	2	\N	Substitution - On (Injury)	Final Whistle
5485	3	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
5539	10	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
5574	15	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
5719	17	3773585	00:00	81:20	1	2	Starting XI	Substitution - Off (Tactical)
6773	13	3773585	00:00	68:28	1	2	Starting XI	Substitution - Off (Injury)
18395	21	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
19677	23	3773585	00:00	\N	1	\N	Starting XI	Final Whistle
25104	17	3773585	81:20	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	3773586	00:00	80:15	1	2	Starting XI	Substitution - Off (Tactical)
5211	8	3773586	00:00	73:06	1	2	Starting XI	Tactical Shift
5211	6	3773586	73:06	\N	2	\N	Tactical Shift	Final Whistle
5213	4	3773586	00:00	73:06	1	2	Starting XI	Tactical Shift
5213	3	3773586	73:06	\N	2	\N	Tactical Shift	Final Whistle
5477	3	3773586	71:47	73:06	2	2	Substitution - On (Tactical)	Tactical Shift
5477	12	3773586	73:06	80:21	2	2	Tactical Shift	Tactical Shift
5477	21	3773586	80:21	\N	2	\N	Tactical Shift	Final Whistle
5487	24	3773586	00:00	73:06	1	2	Starting XI	Tactical Shift
5487	16	3773586	73:06	80:21	2	2	Tactical Shift	Tactical Shift
5487	23	3773586	80:21	\N	2	\N	Tactical Shift	Final Whistle
5492	5	3773586	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	3773586	00:00	73:06	1	2	Starting XI	Tactical Shift
5503	23	3773586	73:06	80:21	2	2	Tactical Shift	Tactical Shift
5503	19	3773586	80:21	\N	2	\N	Tactical Shift	Final Whistle
6379	7	3773586	00:00	73:06	1	2	Starting XI	Tactical Shift
6379	2	3773586	73:06	\N	2	\N	Tactical Shift	Final Whistle
8118	13	3773586	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3773586	00:00	\N	1	\N	Starting XI	Final Whistle
22390	10	3773586	80:15	80:21	2	2	Substitution - On (Tactical)	Tactical Shift
22390	17	3773586	80:21	\N	2	\N	Tactical Shift	Final Whistle
30486	15	3773586	71:49	\N	2	\N	Substitution - On (Tactical)	Final Whistle
39073	15	3773586	00:00	71:49	1	2	Starting XI	Substitution - Off (Tactical)
43728	3	3773586	00:00	71:47	1	2	Starting XI	Substitution - Off (Tactical)
3991	12	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
6627	2	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
6634	3	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
6722	1	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
6760	22	3773587	70:48	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6786	24	3773587	88:49	92:40	2	2	Substitution - On (Tactical)	Tactical Shift
6786	11	3773587	92:40	\N	2	\N	Tactical Shift	Final Whistle
6809	5	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
6863	11	3773587	00:00	92:40	1	2	Starting XI	Tactical Shift
6863	9	3773587	92:40	\N	2	\N	Tactical Shift	Final Whistle
6901	9	3773587	00:00	92:40	1	2	Starting XI	Tactical Shift
6901	24	3773587	92:40	94:19	2	2	Tactical Shift	Substitution - Off (Tactical)
7104	6	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
11550	22	3773587	00:00	70:48	1	2	Starting XI	Substitution - Off (Tactical)
11671	24	3773587	00:00	88:49	1	2	Starting XI	Substitution - Off (Tactical)
17620	16	3773587	00:00	\N	1	\N	Starting XI	Final Whistle
23211	24	3773587	94:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
3501	19	3773593	00:00	69:21	1	2	Starting XI	Substitution - Off (Tactical)
5203	9	3773593	00:00	77:34	1	2	Starting XI	Substitution - Off (Tactical)
5211	6	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
5477	21	3773593	69:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	17	3773593	00:00	77:23	1	2	Starting XI	Substitution - Off (Tactical)
5503	23	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
6590	1	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
6947	9	3773593	77:34	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	11	3773593	00:00	\N	1	\N	Starting XI	Final Whistle
22390	17	3773593	77:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	19	3773593	69:21	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	21	3773593	00:00	69:09	1	2	Starting XI	Substitution - Off (Tactical)
4447	23	3773597	78:46	84:14	2	2	Substitution - On (Tactical)	Tactical Shift
4447	24	3773597	84:14	\N	2	\N	Tactical Shift	Final Whistle
5203	9	3773597	00:00	66:36	1	2	Starting XI	Substitution - Off (Tactical)
5211	8	3773597	00:00	\N	1	\N	Starting XI	Final Whistle
5477	23	3773597	00:00	78:46	1	2	Starting XI	Substitution - Off (Tactical)
5487	20	3773597	00:00	84:12	1	2	Starting XI	Substitution - Off (Tactical)
5503	18	3773597	00:00	84:14	1	2	Starting XI	Tactical Shift
5503	22	3773597	84:14	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773597	00:00	\N	1	\N	Starting XI	Final Whistle
8118	4	3773597	00:00	67:04	1	2	Starting XI	Tactical Shift
8118	9	3773597	67:04	84:14	2	2	Tactical Shift	Tactical Shift
8118	10	3773597	84:14	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773597	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773597	00:00	83:53	1	2	Starting XI	Substitution - Off (Tactical)
22390	7	3773597	83:53	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24841	20	3773597	84:12	84:14	2	2	Substitution - On (Tactical)	Tactical Shift
24841	13	3773597	84:14	\N	2	\N	Tactical Shift	Final Whistle
30486	11	3773597	00:00	67:03	1	2	Starting XI	Substitution - Off (Tactical)
32480	9	3773597	66:36	67:04	2	2	Substitution - On (Tactical)	Tactical Shift
32480	4	3773597	67:04	\N	2	\N	Tactical Shift	Final Whistle
39073	11	3773597	67:03	84:14	2	2	Substitution - On (Tactical)	Tactical Shift
39073	15	3773597	84:14	\N	2	\N	Tactical Shift	Final Whistle
43728	3	3773597	00:00	\N	1	\N	Starting XI	Final Whistle
4447	24	3773625	81:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5203	10	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
5211	8	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
5213	4	3773625	00:00	66:51	1	2	Starting XI	Substitution - Off (Tactical)
5477	24	3773625	00:00	81:19	1	2	Starting XI	Substitution - Off (Tactical)
5492	4	3773625	80:59	\N	2	\N	Substitution - On (Injury)	Final Whistle
5503	22	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
6826	5	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
30486	15	3773625	00:00	70:38	1	2	Starting XI	Substitution - Off (Injury)
32480	4	3773625	66:51	80:59	2	2	Substitution - On (Tactical)	Substitution - Off (Injury)
39073	15	3773625	70:38	\N	2	\N	Substitution - On (Injury)	Final Whistle
43728	3	3773625	00:00	\N	1	\N	Starting XI	Final Whistle
4447	21	3773631	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
5203	10	3773631	00:00	56:57	1	2	Starting XI	Tactical Shift
5203	9	3773631	56:57	76:57	2	2	Tactical Shift	Substitution - Off (Tactical)
5211	6	3773631	00:00	\N	1	\N	Starting XI	Final Whistle
5477	17	3773631	00:00	\N	1	\N	Starting XI	Final Whistle
5487	23	3773631	00:00	\N	1	\N	Starting XI	Final Whistle
5492	9	3773631	76:57	76:59	2	2	Substitution - On (Tactical)	Tactical Shift
5492	5	3773631	76:59	\N	2	\N	Tactical Shift	Final Whistle
5503	15	3773631	56:33	56:57	2	2	Substitution - On (Tactical)	Tactical Shift
5503	19	3773631	56:57	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773631	00:00	76:59	1	2	Starting XI	Tactical Shift
6826	3	3773631	76:59	\N	2	\N	Tactical Shift	Final Whistle
6947	13	3773631	00:00	56:33	1	2	Starting XI	Substitution - Off (Tactical)
8118	3	3773631	11:00	76:59	1	2	Substitution - On (Injury)	Tactical Shift
8118	9	3773631	76:59	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773631	00:00	\N	1	\N	Starting XI	Final Whistle
22390	13	3773631	56:33	56:57	2	2	Substitution - On (Tactical)	Tactical Shift
22390	21	3773631	56:57	\N	2	\N	Tactical Shift	Final Whistle
24841	15	3773631	00:00	56:33	1	2	Starting XI	Substitution - Off (Tactical)
30486	21	3773631	45:00	56:57	2	2	Substitution - On (Tactical)	Tactical Shift
30486	15	3773631	56:57	\N	2	\N	Tactical Shift	Final Whistle
32480	3	3773631	00:00	11:00	1	1	Starting XI	Substitution - Off (Injury)
43728	2	3773631	00:00	\N	1	\N	Starting XI	Final Whistle
3501	21	3773656	56:29	83:33	2	2	Substitution - On (Tactical)	Tactical Shift
3501	15	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
4447	11	3773656	82:39	83:33	2	2	Substitution - On (Tactical)	Tactical Shift
4447	23	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
5211	6	3773656	00:00	\N	1	\N	Starting XI	Final Whistle
5213	3	3773656	00:00	61:19	1	2	Starting XI	Substitution - Off (Injury)
5477	17	3773656	00:00	83:33	1	2	Starting XI	Tactical Shift
5477	16	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
5487	23	3773656	00:00	82:33	1	2	Starting XI	Substitution - Off (Tactical)
5503	19	3773656	00:00	83:33	1	2	Starting XI	Tactical Shift
5503	13	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
6379	2	3773656	00:00	61:22	1	2	Starting XI	Tactical Shift
6379	9	3773656	61:22	83:33	2	2	Tactical Shift	Tactical Shift
6379	10	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773656	00:00	\N	1	\N	Starting XI	Final Whistle
6947	9	3773656	00:00	61:22	1	2	Starting XI	Tactical Shift
6947	11	3773656	61:22	82:39	2	2	Tactical Shift	Substitution - Off (Tactical)
8118	11	3773656	00:00	61:22	1	2	Starting XI	Tactical Shift
8118	3	3773656	61:22	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773656	00:00	\N	1	\N	Starting XI	Final Whistle
21881	3	3773656	61:19	61:22	2	2	Substitution - On (Injury)	Tactical Shift
21881	2	3773656	61:22	\N	2	\N	Tactical Shift	Final Whistle
22390	23	3773656	82:33	83:33	2	2	Substitution - On (Tactical)	Tactical Shift
22390	12	3773656	83:33	\N	2	\N	Tactical Shift	Final Whistle
30486	21	3773656	00:00	56:29	1	2	Starting XI	Substitution - Off (Tactical)
6592	5	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
6657	16	3773660	81:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6668	24	3773660	66:56	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6672	2	3773660	00:00	66:45	1	2	Starting XI	Substitution - Off (Tactical)
6682	3	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
6684	24	3773660	00:00	66:56	1	2	Starting XI	Substitution - Off (Tactical)
6796	9	3773660	67:24	\N	2	\N	Substitution - On (Tactical)	Final Whistle
11669	16	3773660	00:00	81:09	1	2	Starting XI	Substitution - Off (Tactical)
11676	2	3773660	66:45	\N	2	\N	Substitution - On (Tactical)	Final Whistle
17303	9	3773660	00:00	67:24	1	2	Starting XI	Substitution - Off (Tactical)
23344	1	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
23948	6	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
23966	11	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
30492	12	3773660	81:11	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30593	22	3773660	00:00	\N	1	\N	Starting XI	Final Whistle
32673	12	3773660	00:00	81:11	1	2	Starting XI	Substitution - Off (Tactical)
6611	23	3773661	00:00	62:27	1	2	Starting XI	Substitution - Off (Tactical)
6627	2	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
6634	3	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
6681	10	3773661	00:00	75:51	1	2	Starting XI	Substitution - Off (Tactical)
6722	1	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
6760	23	3773661	62:27	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6863	15	3773661	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6901	15	3773661	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
13599	13	3773661	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
17620	6	3773661	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
31090	21	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
35287	5	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
41107	13	3773661	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
71519	17	3773661	00:00	\N	1	\N	Starting XI	Final Whistle
79498	6	3773661	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
105762	10	3773661	75:51	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6581	24	3773665	61:10	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6591	2	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
6735	16	3773665	70:06	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6930	22	3773665	00:00	70:00	1	2	Starting XI	Substitution - Off (Tactical)
8654	22	3773665	70:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12419	9	3773665	00:00	83:16	1	2	Starting XI	Substitution - Off (Tactical)
23213	12	3773665	83:17	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23943	16	3773665	00:00	70:06	1	2	Starting XI	Substitution - Off (Tactical)
23944	9	3773665	83:16	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23947	12	3773665	00:00	83:17	1	2	Starting XI	Substitution - Off (Tactical)
23950	5	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
24211	1	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
24212	3	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
24315	24	3773665	00:00	61:10	1	2	Starting XI	Substitution - Off (Tactical)
30277	11	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
33339	6	3773665	00:00	\N	1	\N	Starting XI	Final Whistle
3501	19	3773672	00:00	74:36	1	2	Starting XI	Substitution - Off (Tactical)
5203	13	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
5211	6	3773672	00:00	74:34	1	2	Starting XI	Substitution - Off (Tactical)
5213	5	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
5487	17	3773672	00:00	60:12	1	2	Starting XI	Substitution - Off (Tactical)
5503	23	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
6379	2	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
6590	1	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
6947	19	3773672	74:36	\N	2	\N	Substitution - On (Tactical)	Final Whistle
8118	15	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
21881	6	3773672	74:34	\N	2	\N	Substitution - On (Tactical)	Final Whistle
22390	17	3773672	60:12	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30486	21	3773672	60:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
30756	21	3773672	00:00	60:25	1	2	Starting XI	Substitution - Off (Tactical)
32480	3	3773672	00:00	\N	1	\N	Starting XI	Final Whistle
5203	10	3773689	00:00	87:14	1	2	Starting XI	Substitution - Off (Tactical)
5211	8	3773689	00:00	\N	1	\N	Starting XI	Final Whistle
5213	4	3773689	00:00	\N	1	\N	Starting XI	Final Whistle
5477	24	3773689	79:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
5487	24	3773689	00:00	79:25	1	2	Starting XI	Substitution - Off (Tactical)
5503	22	3773689	00:00	\N	1	\N	Starting XI	Final Whistle
6379	7	3773689	45:00	87:15	2	2	Substitution - On (Tactical)	Tactical Shift
6379	13	3773689	87:15	\N	2	\N	Tactical Shift	Final Whistle
6826	5	3773689	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	3773689	00:00	87:15	1	2	Starting XI	Tactical Shift
8118	10	3773689	87:15	\N	2	\N	Tactical Shift	Final Whistle
20055	1	3773689	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773689	00:00	45:00	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3773689	00:00	63:29	1	2	Starting XI	Substitution - Off (Tactical)
32480	10	3773689	87:14	87:15	2	2	Substitution - On (Tactical)	Tactical Shift
32480	3	3773689	87:15	\N	2	\N	Tactical Shift	Final Whistle
39073	15	3773689	63:29	\N	2	\N	Substitution - On (Tactical)	Final Whistle
43728	3	3773689	00:00	87:15	1	2	Starting XI	Tactical Shift
43728	7	3773689	87:15	\N	2	\N	Tactical Shift	Final Whistle
5203	10	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
5211	8	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
5213	4	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
5487	24	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
5503	22	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
6379	7	3773695	74:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
6826	5	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
8118	13	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
20055	1	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
21881	7	3773695	00:00	74:08	1	2	Starting XI	Substitution - Off (Tactical)
30486	15	3773695	00:00	74:06	1	2	Starting XI	Substitution - Off (Tactical)
32480	3	3773695	00:00	\N	1	\N	Starting XI	Final Whistle
39073	15	3773695	74:06	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12529	6	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749052	00:00	55:00	1	2	Starting XI	Substitution - Off (Tactical)
15515	9	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749052	55:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26014	11	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
38412	3	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
40221	12	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749052	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749068	00:00	80:30	1	2	Starting XI	Substitution - Off (Tactical)
15515	15	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749068	80:30	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24972	12	3749068	00:00	66:42	1	2	Starting XI	Substitution - Off (Tactical)
26014	12	3749068	66:42	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
40221	13	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749068	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749079	65:54	71:02	2	2	Substitution - On (Tactical)	Tactical Shift
15042	12	3749079	71:02	\N	2	\N	Tactical Shift	Final Whistle
15512	22	3749079	00:00	65:54	1	2	Starting XI	Substitution - Off (Tactical)
15516	24	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749079	00:00	90:43	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
24971	12	3749079	65:49	71:02	2	2	Substitution - On (Tactical)	Tactical Shift
24971	22	3749079	71:02	\N	2	\N	Tactical Shift	Final Whistle
24972	12	3749079	00:00	65:49	1	2	Starting XI	Substitution - Off (Tactical)
26014	15	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
26194	16	3749079	90:43	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
40221	13	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749079	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749108	66:18	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15512	22	3749108	00:00	66:18	1	2	Starting XI	Substitution - Off (Tactical)
15515	11	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749108	00:00	78:22	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
24972	12	3749108	78:22	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
40221	9	3749108	00:00	71:36	1	2	Starting XI	Player Off
40221	9	3749108	71:51	\N	2	\N	Player On	Final Whistle
40222	2	3749108	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
15515	11	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749117	00:00	11:00	1	1	Starting XI	Player Off
15754	12	3749117	11:35	88:05	1	2	Player On (Off Camera)	Substitution - Off (Tactical)
19312	16	3749117	00:00	81:03	1	2	Starting XI	Tactical Shift
19312	22	3749117	81:03	\N	2	\N	Tactical Shift	Final Whistle
20015	1	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
24971	22	3749117	00:00	80:58	1	2	Starting XI	Substitution - Off (Tactical)
24972	9	3749117	00:00	88:11	1	2	Starting XI	Tactical Shift
24972	12	3749117	88:11	\N	2	\N	Tactical Shift	Final Whistle
26014	22	3749117	80:58	81:03	2	2	Substitution - On (Tactical)	Tactical Shift
26014	16	3749117	81:03	\N	2	\N	Tactical Shift	Final Whistle
26194	5	3749117	00:00	\N	1	\N	Starting XI	Final Whistle
38412	2	3749117	00:00	10:58	1	1	Starting XI	Player Off
38412	2	3749117	11:37	19:51	1	1	Player On	Substitution - Off (Injury)
40221	12	3749117	88:05	88:11	2	2	Substitution - On (Tactical)	Tactical Shift
40221	9	3749117	88:11	\N	2	\N	Tactical Shift	Final Whistle
40222	2	3749117	19:51	\N	1	\N	Substitution - On (Injury)	Final Whistle
12529	6	3749133	00:00	\N	1	\N	Starting XI	Final Whistle
15515	9	3749133	00:00	77:38	1	2	Starting XI	Tactical Shift
15515	10	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
15516	24	3749133	00:00	77:38	1	2	Starting XI	Tactical Shift
15516	21	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
15637	3	3749133	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749133	00:00	76:04	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749133	00:00	76:10	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749133	00:00	\N	1	\N	Starting XI	Final Whistle
24971	22	3749133	00:00	76:15	1	2	Starting XI	Substitution - Off (Tactical)
24972	22	3749133	76:15	77:38	2	2	Substitution - On (Tactical)	Tactical Shift
24972	17	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
26014	16	3749133	76:10	77:38	2	2	Substitution - On (Tactical)	Tactical Shift
26014	15	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
26194	5	3749133	00:00	\N	1	\N	Starting XI	Final Whistle
38412	12	3749133	76:04	77:38	2	2	Substitution - On (Tactical)	Tactical Shift
38412	23	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
40221	11	3749133	00:00	46:00	1	1	Starting XI	Player Off
40221	11	3749133	46:03	77:38	1	2	Player On	Tactical Shift
40221	13	3749133	77:38	\N	2	\N	Tactical Shift	Final Whistle
40222	2	3749133	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
15515	9	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749153	00:00	72:20	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749153	00:00	67:00	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
24971	22	3749153	45:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24972	12	3749153	72:20	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26014	16	3749153	67:00	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26194	5	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
40221	11	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749153	00:00	\N	1	\N	Starting XI	Final Whistle
40255	22	3749153	00:00	44:29	1	1	Starting XI	Player Off
40255	22	3749153	45:28	\N	1	\N	Player On	Final Whistle
15036	1	3749192	00:00	\N	1	\N	Starting XI	Final Whistle
20505	23	3749192	00:00	75:35	1	2	Starting XI	Substitution - Off (Tactical)
38566	15	3749192	00:00	10:40	1	1	Starting XI	Tactical Shift
38566	13	3749192	10:40	\N	1	\N	Tactical Shift	Final Whistle
40407	17	3749192	00:00	04:32	1	1	Starting XI	Tactical Shift
40407	21	3749192	04:32	\N	1	\N	Tactical Shift	Final Whistle
40408	2	3749192	00:00	\N	1	\N	Starting XI	Final Whistle
40409	21	3749192	00:00	04:32	1	1	Starting XI	Tactical Shift
40409	17	3749192	04:32	\N	1	\N	Tactical Shift	Final Whistle
40410	23	3749192	75:35	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40411	19	3749192	00:00	\N	1	\N	Starting XI	Final Whistle
40412	13	3749192	00:00	10:40	1	1	Starting XI	Tactical Shift
40412	15	3749192	10:40	\N	1	\N	Tactical Shift	Final Whistle
40413	5	3749192	00:00	10:40	1	1	Starting XI	Tactical Shift
40413	3	3749192	10:40	\N	1	\N	Tactical Shift	Final Whistle
40414	6	3749192	00:00	\N	1	\N	Starting XI	Final Whistle
40415	3	3749192	00:00	10:40	1	1	Starting XI	Tactical Shift
40415	5	3749192	10:40	\N	1	\N	Tactical Shift	Final Whistle
12529	6	3749196	00:00	\N	1	\N	Starting XI	Final Whistle
15042	15	3749196	60:26	61:39	2	2	Substitution - On (Tactical)	Tactical Shift
15042	13	3749196	61:39	89:20	2	2	Tactical Shift	Tactical Shift
15042	24	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
15516	24	3749196	00:00	29:13	1	1	Starting XI	Player Off
15516	24	3749196	30:27	89:20	1	2	Player On	Tactical Shift
15516	22	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
15637	5	3749196	00:00	61:39	1	2	Starting XI	Tactical Shift
15637	3	3749196	61:39	\N	2	\N	Tactical Shift	Final Whistle
15754	12	3749196	00:00	61:39	1	2	Starting XI	Tactical Shift
15754	15	3749196	61:39	89:20	2	2	Tactical Shift	Tactical Shift
15754	12	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
19312	16	3749196	00:00	61:39	1	2	Starting XI	Tactical Shift
19312	19	3749196	61:39	89:20	2	2	Tactical Shift	Tactical Shift
19312	16	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
20015	1	3749196	00:00	\N	1	\N	Starting XI	Final Whistle
24971	22	3749196	00:00	85:05	1	2	Starting XI	Substitution - Off (Tactical)
24972	13	3749196	00:00	61:39	1	2	Starting XI	Tactical Shift
24972	10	3749196	61:39	89:20	2	2	Tactical Shift	Tactical Shift
24972	13	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
26014	22	3749196	85:05	89:20	2	2	Substitution - On (Tactical)	Tactical Shift
26014	15	3749196	89:20	\N	2	\N	Tactical Shift	Final Whistle
26194	2	3749196	60:22	61:39	2	2	Substitution - On (Tactical)	Tactical Shift
26194	5	3749196	61:39	\N	2	\N	Tactical Shift	Final Whistle
38412	3	3749196	00:00	61:39	1	2	Starting XI	Tactical Shift
38412	2	3749196	61:39	\N	2	\N	Tactical Shift	Final Whistle
40221	15	3749196	00:00	60:26	1	2	Starting XI	Substitution - Off (Tactical)
40222	2	3749196	00:00	60:22	1	2	Starting XI	Substitution - Off (Tactical)
15399	15	3749233	75:19	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15407	13	3749233	75:56	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15519	23	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
19636	15	3749233	00:00	75:19	1	2	Starting XI	Substitution - Off (Tactical)
20329	1	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
20447	3	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
24758	6	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
38465	13	3749233	00:00	75:56	1	2	Starting XI	Substitution - Off (Tactical)
38551	18	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
38552	10	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
40215	2	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
40217	20	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
40218	5	3749233	00:00	\N	1	\N	Starting XI	Final Whistle
15042	16	3749246	85:11	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15515	9	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749246	00:00	81:54	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749246	00:00	85:11	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
20302	6	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749246	00:00	77:02	1	2	Starting XI	Substitution - Off (Tactical)
26014	11	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
26194	12	3749246	81:54	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
40221	22	3749246	77:02	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40222	2	3749246	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
15512	22	3749253	72:11	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15516	24	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
24972	9	3749253	00:00	11:46	1	1	Starting XI	Tactical Shift
24972	12	3749253	11:46	\N	1	\N	Tactical Shift	Final Whistle
26014	12	3749253	00:00	11:46	1	1	Starting XI	Tactical Shift
26014	9	3749253	11:46	\N	1	\N	Tactical Shift	Final Whistle
38412	3	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
40221	11	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749253	00:00	\N	1	\N	Starting XI	Final Whistle
40255	22	3749253	00:00	72:11	1	2	Starting XI	Substitution - Off (Tactical)
15049	9	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
15173	12	3749257	00:00	75:27	1	2	Starting XI	Substitution - Off (Tactical)
24798	5	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40235	1	3749257	77:42	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40236	1	3749257	00:00	77:42	1	2	Starting XI	Substitution - Off (Tactical)
40237	16	3749257	00:00	77:45	1	2	Starting XI	Tactical Shift
40237	12	3749257	77:45	\N	2	\N	Tactical Shift	Final Whistle
40238	11	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40239	6	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40240	24	3749257	00:00	85:15	1	2	Starting XI	Substitution - Off (Tactical)
40241	3	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40242	22	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40243	2	3749257	00:00	\N	1	\N	Starting XI	Final Whistle
40244	24	3749257	85:15	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40245	12	3749257	75:27	77:45	2	2	Substitution - On (Tactical)	Tactical Shift
40245	16	3749257	77:45	\N	2	\N	Tactical Shift	Final Whistle
12529	6	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
15515	11	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749274	00:00	89:57	1	2	Starting XI	Tactical Shift
15516	16	3749274	89:57	\N	2	\N	Tactical Shift	Final Whistle
15637	5	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
15654	16	3749274	89:10	89:57	2	2	Substitution - On (Tactical)	Tactical Shift
15654	12	3749274	89:57	\N	2	\N	Tactical Shift	Final Whistle
15754	16	3749274	00:00	25:43	1	1	Starting XI	Player Off
15754	16	3749274	26:09	60:59	1	2	Player On	Tactical Shift
15754	12	3749274	60:59	89:53	2	2	Tactical Shift	Substitution - Off (Tactical)
20015	1	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749274	00:00	60:59	1	2	Starting XI	Tactical Shift
23816	16	3749274	60:59	89:10	2	2	Tactical Shift	Substitution - Off (Tactical)
24971	12	3749274	60:53	60:59	2	2	Substitution - On (Tactical)	Tactical Shift
24971	22	3749274	60:59	\N	2	\N	Tactical Shift	Final Whistle
24972	9	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
38412	3	3749274	00:00	66:39	1	2	Starting XI	Player Off
38412	3	3749274	66:54	\N	2	\N	Player On	Final Whistle
40222	2	3749274	00:00	\N	1	\N	Starting XI	Final Whistle
40255	12	3749274	89:53	89:57	2	2	Substitution - On (Tactical)	Tactical Shift
40255	24	3749274	89:57	\N	2	\N	Tactical Shift	Final Whistle
376521	12	3749274	00:00	60:53	1	2	Starting XI	Substitution - Off (Tactical)
15042	24	3749276	00:00	77:54	1	2	Starting XI	Substitution - Off (Tactical)
15515	10	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
15516	22	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
15754	24	3749276	77:54	\N	2	\N	Substitution - On (Tactical)	Final Whistle
19312	8	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
20302	4	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
26014	15	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
38412	7	3749276	00:00	08:12	1	1	Starting XI	Tactical Shift
38412	5	3749276	08:12	\N	1	\N	Tactical Shift	Final Whistle
40221	13	3749276	00:00	\N	1	\N	Starting XI	Final Whistle
40222	5	3749276	00:00	08:12	1	1	Starting XI	Tactical Shift
40222	7	3749276	08:12	\N	1	\N	Tactical Shift	Final Whistle
15042	22	3749278	00:00	69:07	1	2	Starting XI	Substitution - Off (Tactical)
15515	13	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749278	00:00	79:01	1	2	Starting XI	Tactical Shift
15754	22	3749278	79:01	\N	2	\N	Tactical Shift	Final Whistle
19312	16	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
20302	6	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
24972	22	3749278	69:07	79:01	2	2	Substitution - On (Tactical)	Tactical Shift
24972	12	3749278	79:01	\N	2	\N	Tactical Shift	Final Whistle
26194	5	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
38412	2	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
40221	15	3749278	00:00	\N	1	\N	Starting XI	Final Whistle
15259	16	3749296	00:00	34:02	1	1	Starting XI	Substitution - Off (Tactical)
15410	22	3749296	00:00	91:14	1	2	Starting XI	Substitution - Off (Tactical)
15505	12	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
20402	6	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
20510	16	3749296	34:02	\N	1	\N	Substitution - On (Tactical)	Final Whistle
38403	1	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
40336	2	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
40337	24	3749296	00:00	71:59	1	2	Starting XI	Substitution - Off (Tactical)
40338	11	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
40339	3	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
40340	5	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
40341	22	3749296	91:14	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40342	24	3749296	71:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40343	9	3749296	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749310	00:00	72:59	1	2	Starting XI	Substitution - Off (Tactical)
15515	11	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749310	00:00	73:05	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749310	00:00	86:58	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
20302	6	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
24971	22	3749310	72:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24972	9	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
26014	12	3749310	73:05	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26194	5	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
38412	2	3749310	00:00	\N	1	\N	Starting XI	Final Whistle
40222	16	3749310	86:58	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12529	6	3749346	00:00	26:08	1	1	Starting XI	Player Off
12529	6	3749346	26:20	\N	1	\N	Player On	Final Whistle
15042	24	3749346	00:00	41:42	1	1	Starting XI	Tactical Shift
15042	22	3749346	41:42	75:59	1	2	Tactical Shift	Substitution - Off (Tactical)
15516	22	3749346	00:00	41:42	1	1	Starting XI	Tactical Shift
15516	24	3749346	41:42	\N	1	\N	Tactical Shift	Final Whistle
15637	5	3749346	00:00	41:42	1	1	Starting XI	Tactical Shift
15637	3	3749346	41:42	64:12	1	2	Tactical Shift	Tactical Shift
15637	5	3749346	64:12	\N	2	\N	Tactical Shift	Final Whistle
15754	12	3749346	00:00	70:50	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749346	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749346	00:00	\N	1	\N	Starting XI	Final Whistle
24972	9	3749346	00:00	72:48	1	2	Starting XI	Tactical Shift
24972	12	3749346	72:48	\N	2	\N	Tactical Shift	Final Whistle
26014	12	3749346	70:50	72:48	2	2	Substitution - On (Tactical)	Tactical Shift
26014	11	3749346	72:48	\N	2	\N	Tactical Shift	Final Whistle
38412	3	3749346	00:00	41:42	1	1	Starting XI	Tactical Shift
38412	5	3749346	41:42	64:12	1	2	Tactical Shift	Tactical Shift
38412	3	3749346	64:12	\N	2	\N	Tactical Shift	Final Whistle
40221	11	3749346	00:00	72:48	1	2	Starting XI	Tactical Shift
40221	9	3749346	72:48	\N	2	\N	Tactical Shift	Final Whistle
40222	2	3749346	00:00	\N	1	\N	Starting XI	Final Whistle
40255	22	3749346	75:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12529	6	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
15042	16	3749358	74:07	76:00	2	2	Substitution - On (Tactical)	Tactical Shift
15042	22	3749358	76:00	\N	2	\N	Tactical Shift	Final Whistle
15512	22	3749358	00:00	74:49	1	2	Starting XI	Substitution - Off (Tactical)
15515	9	3749358	00:00	76:00	1	2	Starting XI	Tactical Shift
15515	11	3749358	76:00	\N	2	\N	Tactical Shift	Final Whistle
15516	24	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749358	00:00	74:03	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749358	00:00	74:07	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
24972	22	3749358	74:49	76:00	2	2	Substitution - On (Tactical)	Tactical Shift
24972	12	3749358	76:00	\N	2	\N	Tactical Shift	Final Whistle
26014	12	3749358	74:03	76:00	2	2	Substitution - On (Tactical)	Tactical Shift
26014	16	3749358	76:00	\N	2	\N	Tactical Shift	Final Whistle
38412	3	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
40221	11	3749358	00:00	76:00	1	2	Starting XI	Tactical Shift
40221	9	3749358	76:00	\N	2	\N	Tactical Shift	Final Whistle
40222	2	3749358	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749360	00:00	73:39	1	2	Starting XI	Substitution - Off (Tactical)
15515	13	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749360	00:00	83:13	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
24972	22	3749360	73:39	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26014	12	3749360	83:13	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26194	5	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
38412	2	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
40221	15	3749360	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
15515	9	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749403	68:24	\N	2	\N	Substitution - On (Tactical)	Final Whistle
19312	16	3749403	00:00	87:53	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
26014	11	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
26194	16	3749403	87:53	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
40221	12	3749403	00:00	68:24	1	2	Starting XI	Substitution - Off (Tactical)
40222	2	3749403	00:00	\N	1	\N	Starting XI	Final Whistle
20059	2	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
20446	1	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
24799	11	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
26010	16	3749431	78:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38418	5	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40225	3	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40226	22	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40227	16	3749431	00:00	78:23	1	2	Starting XI	Substitution - Off (Tactical)
40228	12	3749431	78:08	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40229	12	3749431	00:00	78:08	1	2	Starting XI	Substitution - Off (Tactical)
40231	24	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40233	6	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40234	9	3749431	00:00	\N	1	\N	Starting XI	Final Whistle
40290	15	3749434	00:00	63:53	1	2	Starting XI	Tactical Shift
40290	13	3749434	63:53	\N	2	\N	Tactical Shift	Final Whistle
40291	22	3749434	86:30	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40292	1	3749434	00:00	\N	1	\N	Starting XI	Final Whistle
40293	2	3749434	00:00	\N	1	\N	Starting XI	Final Whistle
40294	16	3749434	84:55	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40295	21	3749434	00:00	63:53	1	2	Starting XI	Tactical Shift
40295	16	3749434	63:53	84:55	2	2	Tactical Shift	Substitution - Off (Tactical)
40296	3	3749434	00:00	\N	1	\N	Starting XI	Final Whistle
40297	17	3749434	00:00	63:53	1	2	Starting XI	Tactical Shift
40297	12	3749434	63:53	\N	2	\N	Tactical Shift	Final Whistle
40298	6	3749434	00:00	\N	1	\N	Starting XI	Final Whistle
40299	13	3749434	63:47	63:53	2	2	Substitution - On (Tactical)	Tactical Shift
40299	24	3749434	63:53	\N	2	\N	Tactical Shift	Final Whistle
40300	5	3749434	00:00	\N	1	\N	Starting XI	Final Whistle
40301	23	3749434	00:00	63:53	1	2	Starting XI	Tactical Shift
40301	22	3749434	63:53	86:30	2	2	Tactical Shift	Substitution - Off (Tactical)
40302	19	3749434	00:00	63:53	1	2	Starting XI	Tactical Shift
40302	15	3749434	63:53	\N	2	\N	Tactical Shift	Final Whistle
40303	13	3749434	00:00	63:47	1	2	Starting XI	Substitution - Off (Tactical)
15659	22	3749448	00:00	65:25	1	2	Starting XI	Substitution - Off (Tactical)
15665	24	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
19109	11	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
19735	22	3749448	65:25	\N	2	\N	Substitution - On (Tactical)	Final Whistle
34386	6	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
34388	2	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
34389	5	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
34390	1	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
34391	16	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
38454	12	3749448	84:16	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38522	9	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
40254	3	3749448	00:00	\N	1	\N	Starting XI	Final Whistle
40257	12	3749448	00:00	84:16	1	2	Starting XI	Substitution - Off (Tactical)
15042	22	3749453	00:00	72:39	1	2	Starting XI	Substitution - Off (Tactical)
15512	12	3749453	00:00	72:40	1	2	Starting XI	Tactical Shift
15512	16	3749453	72:40	\N	2	\N	Tactical Shift	Final Whistle
15515	9	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749453	00:00	72:05	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
20302	6	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749453	72:39	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24972	16	3749453	72:05	72:40	2	2	Substitution - On (Tactical)	Tactical Shift
24972	12	3749453	72:40	\N	2	\N	Tactical Shift	Final Whistle
26014	11	3749453	68:44	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749453	00:00	\N	1	\N	Starting XI	Final Whistle
40221	11	3749453	00:00	64:04	1	2	Starting XI	Player Off
40221	11	3749453	65:06	68:44	2	2	Player On	Substitution - Off (Tactical)
40222	2	3749453	00:00	48:19	1	2	Starting XI	Player Off
40222	2	3749453	49:51	\N	2	\N	Player On	Final Whistle
15399	9	3749454	79:14	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15409	1	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
15519	24	3749454	00:00	68:57	1	2	Starting XI	Tactical Shift
15519	22	3749454	68:57	\N	2	\N	Tactical Shift	Final Whistle
19636	9	3749454	00:00	79:14	1	2	Starting XI	Substitution - Off (Tactical)
24758	6	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
38551	12	3749454	00:00	79:09	1	2	Starting XI	Substitution - Off (Tactical)
38552	11	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
40215	2	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
40216	12	3749454	79:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40217	16	3749454	00:00	68:57	1	2	Starting XI	Tactical Shift
40217	24	3749454	68:57	\N	2	\N	Tactical Shift	Final Whistle
40218	5	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
40219	22	3749454	67:58	68:57	2	2	Substitution - On (Tactical)	Tactical Shift
40219	16	3749454	68:57	\N	2	\N	Tactical Shift	Final Whistle
40220	3	3749454	00:00	\N	1	\N	Starting XI	Final Whistle
40223	22	3749454	00:00	67:58	1	2	Starting XI	Substitution - Off (Tactical)
12529	6	3749462	00:00	\N	1	\N	Starting XI	Final Whistle
15042	12	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
15042	13	3749462	46:36	75:45	2	2	Tactical Shift	Tactical Shift
15042	17	3749462	75:45	90:09	2	2	Tactical Shift	Substitution - Off (Tactical)
15515	9	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
15515	15	3749462	46:36	\N	2	\N	Tactical Shift	Final Whistle
15516	22	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
15516	23	3749462	46:36	\N	2	\N	Tactical Shift	Final Whistle
15637	5	3749462	00:00	\N	1	\N	Starting XI	Final Whistle
15654	17	3749462	90:09	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15754	16	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
15754	17	3749462	46:36	69:00	2	2	Tactical Shift	Substitution - Off (Tactical)
19312	17	3749462	69:00	75:45	2	2	Substitution - On (Tactical)	Tactical Shift
19312	13	3749462	75:45	\N	2	\N	Tactical Shift	Final Whistle
20015	1	3749462	00:00	\N	1	\N	Starting XI	Final Whistle
23816	24	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
23816	21	3749462	46:36	78:40	2	2	Tactical Shift	Substitution - Off (Tactical)
38412	3	3749462	00:00	\N	1	\N	Starting XI	Final Whistle
40221	11	3749462	00:00	46:36	1	2	Starting XI	Tactical Shift
40221	10	3749462	46:36	\N	2	\N	Tactical Shift	Final Whistle
40222	2	3749462	00:00	\N	1	\N	Starting XI	Final Whistle
40255	21	3749462	78:40	\N	2	\N	Substitution - On (Tactical)	Final Whistle
15095	9	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
15095	11	3749465	05:10	07:58	1	1	Tactical Shift	Tactical Shift
15095	9	3749465	07:58	\N	1	\N	Tactical Shift	Final Whistle
15272	3	3749465	83:49	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24766	22	3749465	72:02	\N	2	\N	Substitution - On (Tactical)	Final Whistle
24767	22	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
24767	24	3749465	05:10	\N	1	\N	Tactical Shift	Final Whistle
38464	1	3749465	00:00	\N	1	\N	Starting XI	Final Whistle
40353	16	3749465	76:38	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40354	2	3749465	00:00	\N	1	\N	Starting XI	Final Whistle
40355	5	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40355	3	3749465	05:10	83:49	1	2	Tactical Shift	Substitution - Off (Tactical)
40356	3	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40356	5	3749465	05:10	\N	1	\N	Tactical Shift	Final Whistle
40357	11	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40357	12	3749465	05:10	\N	1	\N	Tactical Shift	Final Whistle
40395	6	3749465	00:00	\N	1	\N	Starting XI	Final Whistle
40396	24	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40396	22	3749465	05:10	72:02	1	2	Tactical Shift	Substitution - Off (Tactical)
40397	16	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40397	9	3749465	05:10	07:58	1	1	Tactical Shift	Tactical Shift
40397	11	3749465	07:58	\N	1	\N	Tactical Shift	Final Whistle
40398	12	3749465	00:00	05:10	1	1	Starting XI	Tactical Shift
40398	16	3749465	05:10	76:38	1	2	Tactical Shift	Substitution - Off (Tactical)
12529	6	3749493	00:00	\N	1	\N	Starting XI	Final Whistle
15512	22	3749493	00:00	30:09	1	1	Starting XI	Substitution - Off (Tactical)
15515	9	3749493	00:00	07:36	1	1	Starting XI	Player Off
15515	9	3749493	08:36	12:52	1	1	Player On	Tactical Shift
15515	11	3749493	12:52	\N	1	\N	Tactical Shift	Final Whistle
15516	24	3749493	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749493	00:00	30:22	1	1	Starting XI	Tactical Shift
15637	22	3749493	30:22	\N	1	\N	Tactical Shift	Final Whistle
15654	22	3749493	30:09	30:22	1	1	Substitution - On (Tactical)	Tactical Shift
15654	5	3749493	30:22	46:17	1	2	Tactical Shift	Tactical Shift
15654	3	3749493	46:17	\N	2	\N	Tactical Shift	Final Whistle
15754	12	3749493	00:00	70:58	1	2	Starting XI	Tactical Shift
15754	16	3749493	70:58	\N	2	\N	Tactical Shift	Final Whistle
19312	16	3749493	00:00	69:47	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749493	00:00	\N	1	\N	Starting XI	Final Whistle
24972	16	3749493	69:47	70:58	2	2	Substitution - On (Tactical)	Tactical Shift
24972	12	3749493	70:58	\N	2	\N	Tactical Shift	Final Whistle
38412	3	3749493	00:00	46:17	1	2	Starting XI	Tactical Shift
38412	5	3749493	46:17	\N	2	\N	Tactical Shift	Final Whistle
40221	11	3749493	00:00	12:52	1	1	Starting XI	Tactical Shift
40221	9	3749493	12:52	\N	1	\N	Tactical Shift	Final Whistle
40222	2	3749493	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749522	00:00	76:21	1	2	Starting XI	Tactical Shift
15042	12	3749522	76:21	\N	2	\N	Tactical Shift	Final Whistle
15515	11	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
15637	3	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749522	00:00	71:20	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749522	00:00	71:32	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
20302	6	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
24972	9	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
26014	12	3749522	71:20	76:21	2	2	Substitution - On (Tactical)	Tactical Shift
26014	16	3749522	76:21	\N	2	\N	Tactical Shift	Final Whistle
26194	5	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
38412	2	3749522	00:00	\N	1	\N	Starting XI	Final Whistle
40255	16	3749522	71:32	76:21	2	2	Substitution - On (Tactical)	Tactical Shift
40255	22	3749522	76:21	\N	2	\N	Tactical Shift	Final Whistle
13808	2	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
20153	15	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
20286	13	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
20549	24	3749526	75:50	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40374	22	3749526	46:11	\N	1	\N	Substitution - On (Injury)	Final Whistle
40375	22	3749526	00:00	46:11	1	1	Starting XI	Substitution - Off (Injury)
40376	16	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40377	6	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40378	1	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40379	12	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40380	5	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40381	3	3749526	00:00	\N	1	\N	Starting XI	Final Whistle
40382	24	3749526	00:00	75:50	1	2	Starting XI	Substitution - Off (Tactical)
20059	2	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
20326	15	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
20446	1	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
24799	12	3749528	71:41	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40225	5	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
40226	22	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
40227	16	3749528	00:00	80:17	1	2	Starting XI	Substitution - Off (Tactical)
40228	12	3749528	00:00	71:41	1	2	Starting XI	Substitution - Off (Tactical)
40229	16	3749528	80:17	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40230	3	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
40231	24	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
40232	13	3749528	88:57	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40233	6	3749528	00:00	\N	1	\N	Starting XI	Final Whistle
40234	13	3749528	00:00	88:57	1	2	Starting XI	Substitution - Off (Tactical)
12529	6	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749552	00:00	79:01	1	2	Starting XI	Player Off
15042	22	3749552	79:18	81:39	2	2	Player On	Substitution - Off (Tactical)
15515	11	3749552	00:00	81:54	1	2	Starting XI	Tactical Shift
15515	22	3749552	81:54	\N	2	\N	Tactical Shift	Final Whistle
15516	24	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
15654	3	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
15754	16	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
24972	12	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
26014	22	3749552	81:39	81:54	2	2	Substitution - On (Tactical)	Tactical Shift
26014	11	3749552	81:54	\N	2	\N	Tactical Shift	Final Whistle
38412	5	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
40221	9	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749552	00:00	\N	1	\N	Starting XI	Final Whistle
15049	9	3749590	00:00	58:38	1	2	Starting XI	Substitution - Off (Tactical)
38556	24	3749590	00:00	75:57	1	2	Starting XI	Substitution - Off (Tactical)
38569	3	3749590	00:00	\N	1	\N	Starting XI	Final Whistle
40236	1	3749590	00:00	\N	1	\N	Starting XI	Final Whistle
40237	12	3749590	00:00	76:06	1	2	Starting XI	Tactical Shift
40237	24	3749590	76:06	\N	2	\N	Tactical Shift	Final Whistle
40239	16	3749590	00:00	58:39	1	2	Starting XI	Tactical Shift
40239	11	3749590	58:39	76:06	2	2	Tactical Shift	Tactical Shift
40239	16	3749590	76:06	\N	2	\N	Tactical Shift	Final Whistle
40240	22	3749590	66:23	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40242	22	3749590	00:00	66:23	1	2	Starting XI	Substitution - Off (Tactical)
45969	24	3749590	75:57	76:06	2	2	Substitution - On (Tactical)	Tactical Shift
45969	12	3749590	76:06	\N	2	\N	Tactical Shift	Final Whistle
375886	9	3749590	58:38	58:39	2	2	Substitution - On (Tactical)	Tactical Shift
375886	16	3749590	58:39	76:06	2	2	Tactical Shift	Tactical Shift
375886	11	3749590	76:06	\N	2	\N	Tactical Shift	Final Whistle
375887	5	3749590	00:00	\N	1	\N	Starting XI	Final Whistle
375888	2	3749590	00:00	\N	1	\N	Starting XI	Final Whistle
375889	6	3749590	00:00	73:17	1	2	Starting XI	Player Off
375889	6	3749590	73:35	\N	2	\N	Player On	Final Whistle
375890	11	3749590	00:00	58:39	1	2	Starting XI	Tactical Shift
375890	9	3749590	58:39	\N	2	\N	Tactical Shift	Final Whistle
15036	1	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
38466	15	3749603	57:52	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40407	16	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40408	2	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40409	15	3749603	00:00	57:52	1	2	Starting XI	Substitution - Off (Tactical)
40411	14	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40412	13	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40420	6	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40421	3	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40422	5	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40423	12	3749603	00:00	57:40	1	2	Starting XI	Substitution - Off (Tactical)
40424	23	3749603	00:00	\N	1	\N	Starting XI	Final Whistle
40425	12	3749603	57:40	\N	2	\N	Substitution - On (Tactical)	Final Whistle
12529	6	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
15515	11	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
19312	16	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
20015	1	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
20302	22	3749631	73:38	\N	2	\N	Substitution - On (Tactical)	Final Whistle
23816	22	3749631	00:00	73:38	1	2	Starting XI	Substitution - Off (Tactical)
24972	12	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
38412	3	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
40221	9	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
40222	2	3749631	00:00	\N	1	\N	Starting XI	Final Whistle
12529	6	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
15042	22	3749642	00:00	73:42	1	2	Starting XI	Substitution - Off (Tactical)
15515	9	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
15516	24	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
15637	5	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
15754	12	3749642	00:00	73:53	1	2	Starting XI	Substitution - Off (Tactical)
19312	16	3749642	00:00	87:59	1	2	Starting XI	Substitution - Off (Tactical)
20015	1	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
23816	22	3749642	73:42	\N	2	\N	Substitution - On (Tactical)	Final Whistle
26014	11	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
26194	16	3749642	87:59	\N	2	\N	Substitution - On (Tactical)	Final Whistle
38412	3	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
40221	12	3749642	73:53	\N	2	\N	Substitution - On (Tactical)	Final Whistle
40222	2	3749642	00:00	\N	1	\N	Starting XI	Final Whistle
\.


--
-- TOC entry 4879 (class 0 OID 25240)
-- Dependencies: 219
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, player_name, player_nickname, jersey_number, country_id, country_name, team_id) FROM stdin;
6566	Borja GonzÃ¡lez TomÃ¡s	Borja BastÃ³n	18	214	Spain	206
6581	Jonathan RodrÃ­guez MenÃ©ndez	Jony	23	214	Spain	206
6612	RubÃ©n Duarte SÃ¡nchez	RubÃ©n Duarte	3	214	Spain	206
6613	RubÃ©n Sobrino Pozuelo	RubÃ©n Sobrino	7	214	Spain	206
6615	VÃ­ctor Laguardia Cisneros	VÃ­ctor Laguardia	5	214	Spain	206
6617	Ibai GÃ³mez PÃ©rez	Ibai GÃ³mez	11	214	Spain	206
6618	MartÃ­n Aguirregabiria Padilla	MartÃ­n Aguirregabiria	21	214	Spain	206
6624	Jorge Franco Alviz	Burgui	14	214	Spain	206
6626	Mubarak Wakaso	\N	22	86	Ghana	206
6629	Fernando Pacheco Flores	Fernando Pacheco	1	214	Spain	206
6632	Manuel Alejandro GarcÃ­a SÃ¡nchez	Manu GarcÃ­a	19	214	Spain	206
6839	Daniel Alejandro Torres Rojas	Dani Torres	16	49	Colombia	206
6855	Guillermo Alfonso MaripÃ¡n Loaysa	Guillermo MaripÃ¡n	6	45	Chile	206
6923	JoaquÃ­n Navarro JimÃ©nez	Ximo Navarro	15	214	Spain	206
6935	AdriÃ¡n MarÃ­n GÃ³mez	AdriÃ¡n MarÃ­n	17	214	Spain	206
9748	Antonio Sivera SalvÃ¡	Antonio Sivera	13	214	Spain	206
12190	Patrick Twumasi	\N	24	86	Ghana	206
50547	Antonio Perera CalderÃ³n	Antonio Perera	27	214	Spain	206
6742	Sergio GontÃ¡n Gallardo	Keko	24	214	Spain	901
6760	Enes Ãœnal	\N	9	233	Turkey	901
7699	Daniele Verde	\N	11	112	Italy	901
8419	Duje ÄŒop	\N	20	56	Croatia	901
11291	Laureano Antonio Villa SuÃ¡rez	Toni SuÃ¡rez	19	214	Spain	901
11293	Fernando Calero Villa	Fernando Calero	5	214	Spain	901
11294	Borja FernÃ¡ndez FernÃ¡ndez	Borja FernÃ¡ndez	8	214	Spain	901
11296	Ã“scar Plano PedreÃ±o	Ã“scar Plano	10	214	Spain	901
11297	Javier Moyano Lujano	Javi Moyano	17	214	Spain	901
11298	JosÃ© Ignacio MartÃ­nez GarcÃ­a	Nacho MartÃ­nez	22	214	Spain	901
11300	RubÃ©n Alcaraz JimÃ©nez	RubÃ©n Alcaraz	14	214	Spain	901
11301	Miguel Alfonso Herrero Javaloyas	MÃ­chel	21	214	Spain	901
11302	Jordi Masip LÃ³pez	Jordi Masip	1	214	Spain	901
11303	Anuar Mohamed Tuhami	Anuar Tuhami	23	154	Morocco	901
11304	Francisco JosÃ© Olivas Alba	Kiko Olivas	4	214	Spain	901
18164	Antonio JesÃºs Regal Angulo	AntoÃ±ito	18	214	Spain	901
30519	Mohamed Salisu	\N	28	86	Ghana	901
41126	Samuel PÃ©rez FariÃ±a	Samuel PÃ©rez	26	214	Spain	901
6734	Luis Carlos Correia Pinto	Luisinho	16	183	Portugal	902
6788	Xabier Etxeita Gorritxategi	Xabier Etxeita	3	214	Spain	902
6857	Rúben Afonso Borges Semedo	Rúben Semedo	4	183	Portugal	902
9747	Axel Werner	\N	1	11	Argentina	902
11669	Gonzalo Julián Melero Manzanares	Gonzalo Melero	8	214	Spain	902
11670	David Ferreiro Quiroga	David Ferreiro	7	214	Spain	902
11671	Juan Camilo Hernández Suárez	Cucho Hernández	9	49	Colombia	902
11672	Samuele Longo	\N	12	112	Italy	902
11673	Alejandro Gallar Falguera	Álex Gallar	11	214	Spain	902
11674	Damián Marcelo Musto	Damián Musto	23	11	Argentina	902
11675	Moisés Gómez Bordonado	Moi Gómez	6	214	Spain	902
11676	Jorge Miramón Santagertrudis	Jorge Miramón	24	214	Spain	902
11677	Jorge Pulido Mayoral	Jorge Pulido	14	214	Spain	902
11678	Luis Ezequiel Ávila	Chimy Ávila	19	11	Argentina	902
12554	Serdar Gürler	\N	21	233	Turkey	902
19396	Lluis Sastre Reus	Lluis Sastre	22	214	Spain	902
21399	Pablo Ínsua Blanco	Pablo Ínsua	18	214	Spain	902
22332	Roberto Santamaría Cipriain	Roberto Santamaría	13	214	Spain	902
3501	Philippe Coutinho Correia	Philippe Coutinho	7	31	Brazil	217
5203	Sergio Busquets i Burgos	Sergio Busquets	5	214	Spain	217
5211	Jordi Alba Ramos	Jordi Alba	18	214	Spain	217
5213	Gerard Piqué Bernabéu	Gerard Piqué	3	214	Spain	217
5246	Luis Alberto Suárez Díaz	Luis Suárez	9	242	Uruguay	217
5470	Ivan Rakitić	\N	4	56	Croatia	217
5477	Ousmane Dembélé	\N	11	78	France	217
5492	Samuel Yves Umtiti	Samuel Umtiti	23	78	France	217
5503	Lionel Andrés Messi Cuccittini	Lionel Messi	10	11	Argentina	217
6332	Thomas Vermaelen	\N	24	22	Belgium	217
6374	Nélson Cabral Semedo	Nélson Semedo	2	183	Portugal	217
6379	Sergi Roberto Carnicer	Sergi Roberto	20	214	Spain	217
6616	Munir El Haddadi Mohamed	Munir El Haddadi	19	154	Morocco	217
6826	Clément Lenglet	\N	15	78	France	217
6998	Rafael Alcântara do Nascimento	Rafinha	12	31	Brazil	217
8206	Arturo Erasmo Vidal Pardo	Arturo Vidal	22	45	Chile	217
8652	Jasper Cillessen	\N	13	160	Netherlands	217
20055	Marc-André ter Stegen	Marc-André ter Stegen	1	85	Germany	217
6351	Cristhian Ricardo Stuani Curbelo	Cristhian Stuani	7	242	Uruguay	211
6560	Marc Muniesa Martínez	Marc Muniesa	20	214	Spain	211
6565	Pere Pons Riera	Pere Pons	8	214	Spain	211
6567	Borja García Freire	Borja García	10	214	Spain	211
6570	Alejandro Granell Nogué	Álex Granell	6	214	Spain	211
6572	Juan Pedro Ramírez López	Juanpe	15	214	Spain	211
6573	Bernardo José Espinosa Zúñiga	Bernardo Espinosa	2	49	Colombia	211
6574	Douglas Luiz Soares de Paulo	Douglas Luiz	12	31	Brazil	211
6576	Gorka Iraizoz Moreno	Gorka Iraizoz	1	214	Spain	211
6578	Francesc Aday Benítez Caraballo	Aday Benítez	11	214	Spain	211
6579	Pedro Alcalá Guirado	Pedro Alcalá	5	214	Spain	211
6582	Cristian Portugués Manzanera	Portu	9	214	Spain	211
6785	Yassine Bounou	\N	13	154	Morocco	211
6888	Aleix García Serrano	Aleix García	23	214	Spain	211
11292	Pedro Antonio Porro Sauceda	Pedro Porro	29	214	Spain	211
11295	Patrick Roberts	\N	17	68	England	211
17276	Seydou Doumbia	\N	22	55	Côte d'Ivoire	211
34694	Èric Montes Arce	Èric Montes	28	214	Spain	211
3246	Guido Marcelo Carrillo	Guido Carrillo	9	11	Argentina	205
3991	Allan Romeo Nyom	Allan Nyom	12	39	Cameroon	205
6301	Youssef En-Nesyri	\N	26	154	Morocco	205
6598	Unai Bustinza Martínez	Unai Bustinza	3	214	Spain	205
6599	Rubén Salvador Pérez Del Mármol	Rubén Pérez	21	214	Spain	205
6601	Raúl García Carnero	Raúl García	14	214	Spain	205
6608	Nabil El Zhar	\N	10	154	Morocco	205
6610	Iván Cuéllar Sacristán	Pichu	1	214	Spain	205
6666	Sabin Merino Zuloaga	Sabin Merino	18	214	Spain	205
6667	Mikel Vesga Arruti	Mikel Vesga	23	214	Spain	205
6738	Juan Francisco Moreno Fuertes	Juanfran	2	214	Spain	205
6739	Diego Alejandro Rolan Silva	Diego Rolán	4	242	Uruguay	205
6834	Gerard Gumbau Garriga	Gerard Gumbau	6	214	Spain	205
9879	Jon Ander Serantes Simon	Jon Ander Serantes	13	214	Spain	205
11730	Jonathan Cristian Silva	Jonathan Silva	5	11	Argentina	205
11745	Michael Nicolás Santos Rosadilla	Michael Santos	20	242	Uruguay	205
16212	Óscar Rodríguez Arnaiz	Óscar Rodríguez	27	214	Spain	205
17818	Rodrigo Tarín Higón	Rodri Tarín	28	214	Spain	205
11392	Arthur Henrique Ramos de Oliveira Melo	Arthur	8	31	Brazil	217
6609	Denis Suárez Fernández	Denis Suárez	6	214	Spain	217
3610	Roque Mesa Quevedo	Roque Mesa	7	214	Spain	213
5218	André Miguel Valente Silva	André Silva	12	183	Portugal	213
5504	Éver Maximiliano David Banega	Éver Banega	10	11	Argentina	213
5534	Simon Thorup Kjær	Simon Kjær	4	61	Denmark	213
5742	Gabriel Iván Mercado	Gabriel Mercado	25	11	Argentina	213
6334	Luis Fernando Muriel Fruto	Luis Muriel	14	49	Colombia	213
6400	Aleix Vidal Parreu	Aleix Vidal	11	214	Spain	213
6719	Franco Damián Vázquez	Franco Vázquez	22	11	Argentina	213
6720	Pablo Sarabia García	Pablo Sarabia	17	214	Spain	213
6723	Wissam Ben Yedder	\N	9	78	France	213
6724	Manuel Agudo Durán	Nolito	8	214	Spain	213
6804	Sergi Gómez Solà	Sergi Gómez	3	214	Spain	213
6821	Jesús Navas González	Jesús Navas	16	214	Spain	213
6825	Daniel Filipe Martins Carriço	Daniel Carriço	6	183	Portugal	213
6919	Guilherme Antonio Arana Lopes	Guilherme Arana	23	31	Brazil	213
11541	Tomáš Vaclík	\N	1	60	Czech Republic	213
13360	Quincy Anton Promes	Quincy Promes	21	160	Netherlands	213
23921	Juan Soriano Oropesa	Juan Soriano	13	214	Spain	213
3313	Giovani Lo Celso	\N	21	11	Argentina	218
5214	William Silva de Carvalho	William Carvalho	14	183	Portugal	218
5563	José Andrés Guardado Hernández	Andrés Guardado	18	147	Mexico	218
5687	Takashi Inui	\N	8	114	Japan	218
6647	Zouhair Feddal	\N	4	154	Morocco	218
6648	Aïssa Mandi	\N	23	4	Algeria	218
6651	Joaquín Sánchez Rodríguez	Joaquín	17	214	Spain	218
6657	Sergio León Limones	Sergio León	7	214	Spain	218
6658	Cristian Tello Herrera	Cristian Tello	11	214	Spain	218
6663	Antonio Barragán Fernández	Antonio Barragán	19	214	Spain	218
6673	Sergio Canales Madrazo	Sergio Canales	6	214	Spain	218
6777	Sidnei Rechel da Silva Júnior	Sidnei	12	31	Brazil	218
6792	Pau López Sabata	Pau López	13	214	Spain	218
6880	Arnaldo Antonio Sanabria Ayala	Antonio Sanabria	9	178	Paraguay	218
7068	Marc Bartra Aregall	Marc Bartra	5	214	Spain	218
7910	Lorenzo Jesús Morón García	Loren Morón	16	214	Spain	218
16309	Joel Robles Blázquez	Joel Robles	1	214	Spain	218
17304	Héctor Junior Firpo Adames	Junior Firpo	20	214	Spain	218
3245	Thomas Lemar	\N	11	78	France	212
5198	Diego da Silva Costa	Diego Costa	19	214	Spain	212
5199	Jorge Resurrección Merodio	Koke	6	214	Spain	212
5484	Lucas Hernández Pi	Lucas Hernandez	21	78	France	212
5487	Antoine Griezmann	\N	7	78	France	212
5696	Santiago Arias Naranjo	Santiago Arias	4	49	Colombia	212
5723	Gelson Dany Batalha Martins	Gelson Martins	18	183	Portugal	212
6320	Filipe Luís Kasmirski	Filipe Luis	3	31	Brazil	212
6376	Stefan Savić	\N	15	152	Montenegro	212
6377	Ángel Martín Correa	Ángel Correa	10	11	Argentina	212
6378	Jan Oblak	\N	13	208	Slovenia	212
6381	Saúl Ñíguez Esclapez	Saúl Ñíguez	8	214	Spain	212
6383	Thomas Teye Partey	Thomas Partey	5	86	Ghana	212
6654	Antonio Adán Garrido	Antonio Adán	1	214	Spain	212
6765	Rodrigo Hernández Cascante	Rodri	14	214	Spain	212
6841	Víctor Machín Pérez	Vitolo	23	214	Spain	212
7033	Nikola Kalinić	\N	9	56	Croatia	212
8136	Antonio Moya Vega	Toni Moya	43	214	Spain	212
3551	Karl Brillant Toko Ekambi	Karl Toko Ekambi	17	39	Cameroon	222
4629	José Ramiro Funes Mori	Ramiro Funes Mori	4	11	Argentina	222
5688	Carlos Arturo Bacca Ahumada	Carlos Bacca	9	49	Colombia	222
6737	Alfonso Pedraza Sag	Alfonso Pedraza	16	214	Spain	222
6752	Víctor Ruíz Torre	Víctor Ruíz	6	214	Spain	222
6753	Daniel Raba Antolín	Dani Raba	22	214	Spain	222
6755	Sergio Asenjo Andrés	Sergio Asenjo	1	214	Spain	222
6762	Álvaro González Soberón	Álvaro González	3	214	Spain	222
6764	Pablo Fornals Malla	Pablo Fornals	8	214	Spain	222
6766	Gerard Moreno Balaguero	Gerard Moreno	7	214	Spain	222
6771	Manuel Trigueros Muñoz	Manu Trigueros	14	214	Spain	222
6772	Mario Gaspar Pérez Martínez	Mario Gaspar	2	214	Spain	222
6828	Jaume Vicent Costa Jordá	Jaume Costa	11	214	Spain	222
8697	Andrés Eduardo Fernández Moreno	Andrés Fernández	13	214	Spain	222
11384	Manuel Morlanes Ariño	Manu Morlanes	28	214	Spain	222
11385	Santiago Cáseres	\N	5	11	Argentina	222
11386	Santiago Cazorla González	Santi Cazorla	19	214	Spain	222
16335	Samuel Chimerenka Chukwueze	Samuel Chukwueze	30	166	Nigeria	222
13599	Carles Aleña Castillo	Carles Aleñà	21	214	Spain	217
22197	Juan Miranda González	Juan Miranda	27	214	Spain	217
4407	Sanjin Prcić	\N	8	28	Bosnia and Herzegovina	221
6668	José Luis Morales Nogales	José Luis Morales	11	214	Spain	221
6672	Jorge Andújar Moreno	Coke	12	214	Spain	221
6678	Emmanuel Okyere Boateng	Emmanuel Boateng	21	86	Ghana	221
6680	Rubén Rochina Naixes	Rubén Rochina	16	214	Spain	221
6681	José Manuel Rodríguez Benito	Chema	6	214	Spain	221
6682	Sergio Postigo Redondo	Sergio Postigo	15	214	Spain	221
6684	Roger Martí Salvador	Roger Martí	9	214	Spain	221
6688	José Ángel Gómez Campaña	José Campaña	24	214	Spain	221
6691	David Remeseiro Salgueiro	Jason	23	214	Spain	221
6692	Oier Olazábal Paredes	Oier Olazábal	13	214	Spain	221
6782	Enis Bardhi	\N	10	135	Macedonia, Republic of	221
6784	Antonio García Aranda	Toño	3	214	Spain	221
6807	Roberto Suárez Pier	Rober	4	214	Spain	221
6809	Erick Cathriel Cabaco Almada	Erick Cabaco	18	242	Uruguay	221
18163	Moses Daddy-Ajala Simon	Moses Simon	7	166	Nigeria	221
21147	Borja Mayoral Moya	Borja Mayoral	2	214	Spain	221
23344	Aitor Fernández Abarisketa	Aitor Fernández	25	214	Spain	221
3625	Sofiane Boufal	\N	19	154	Morocco	209
5217	Iago Aspas Juncal	Iago Aspas	10	214	Spain	209
5516	Pione Sisto Ifolo Emirmija	Pione Sisto	11	61	Denmark	209
6297	Maximiliano Gómez González	Maxi Gómez	9	242	Uruguay	209
6794	Gustavo Daniel Cabral Cáceres	Gustavo Cabral	22	11	Argentina	209
6795	Rubén Blanco Veiga	Rubén Blanco	13	214	Spain	209
6798	Stanislav Lobotka	\N	14	207	Slovakia	209
6799	Brais Méndez Portela	Brais Méndez	23	214	Spain	209
6805	Hugo Mallo Novegil	Hugo Mallo	2	214	Spain	209
6852	Jozabed Sánchez Ruiz	Jozabed Sánchez	21	214	Spain	209
6876	Róbert Mazáň	\N	15	207	Slovakia	209
6884	Sergio Álvarez Conde	Sergio Álvarez	1	214	Spain	209
10759	Andrew Hjulsager	\N	16	61	Denmark	209
11388	Néstor Alejandro Araújo Razo	Néstor Araujo	4	147	Mexico	209
11389	Francisco José Beltrán Peinado	Fran Beltrán	8	214	Spain	209
12555	Okay Yokuşlu	\N	5	233	Turkey	209
17804	David Costas Cordal	David Costas	3	214	Spain	209
22029	Kevin Vázquez Comesaña	Kevin Vázquez	20	214	Spain	209
4546	Dimitri Foulquier	\N	24	91	Guadeloupe	216
4712	Samuel Sáiz Alonso	Samuel Sáiz	11	214	Spain	216
6611	Ángel Luis Rodríguez Díaz	Ángel Rodríguez	9	214	Spain	216
6619	Vitorino Gabriel Pacheco Antunes	Vitorino Antunes	3	183	Portugal	216
6627	Damián Nicolás Suárez Suárez	Damián Suárez	22	242	Uruguay	216
6630	Jorge Molina Vidal	Jorge Molina	19	214	Spain	216
6631	Mathieu Flamini	\N	16	78	France	216
6634	Djené Dakonam Ortega	Djene Dakonam	2	228	Togo	216
6635	Leandro Daniel Cabrera Sasía	Leandro Cabrera	6	242	Uruguay	216
6722	David Soria Solís	David Soria	13	214	Spain	216
6863	Mauro Wilney Arambarri Rosa	Mauro Arambarri	18	242	Uruguay	216
6872	Bruno González Cabrera	Bruno González	4	214	Spain	216
6873	Francisco Portillo Soler	Francisco Portillo	8	214	Spain	216
6901	Nemanja Maksimović	\N	20	203	Serbia	216
6931	Leandro Chichizola	\N	1	11	Argentina	216
7154	Sebastián Carlos Cristóforo Pepe	Sebastián Cristóforo	15	242	Uruguay	216
11550	Jaime Mata Arnaiz	Jaime Mata	7	214	Spain	216
18721	Robert Ibáñez Castro	Robert Ibáñez	17	214	Spain	216
6698	Marko Dmitrović	\N	1	203	Serbia	322
6700	Sergio Enrich Ametller	Sergi Enrich	9	214	Spain	322
6701	Joan Jordán Moreno	Joan Jordán	24	214	Spain	322
6705	José Ángel Valdés Díaz	Cote	15	214	Spain	322
6708	Paulo André Rodrigues de Oliveira	Paulo Oliveira	12	183	Portugal	322
6709	Anaitz Arbilla Zabala	Anaitz Arbilla	23	214	Spain	322
6710	Rubén Peña Jiménez	Rubén Peña	11	214	Spain	322
6711	Enrique García Martínez	Kike	17	214	Spain	322
6712	Gonzalo Escalante	\N	5	11	Argentina	322
6867	Papa Kouly Diop	Pape Diop	8	202	Senegal	322
7105	Fabián Ariel Orellana Valenzuela	Fabián Orellana	14	45	Chile	322
7907	Pedro Bigas Rigo	Pedro Bigas	3	214	Spain	322
8555	Pablo Ezequiel De Blasis	Pablo de Blasis	16	11	Argentina	322
10763	Asier Riesgo Unamuno	Asier Riesgo	13	214	Spain	322
12072	Pere Milla Peña	Pere Milla	22	214	Spain	322
13107	Sergio Álvarez Díaz	Sergio Álvarez	6	214	Spain	322
13108	Marc Cardona Rovira	Marc Cardona	7	214	Spain	322
17620	Marc Cucurella Saseta	Marc Cucurella	20	214	Spain	322
4447	Martin Braithwaite Christensen	Martin Braithwaite	25	61	Denmark	205
5830	Kenneth Josiah Omeruo	Kenneth Omeruo	24	166	Nigeria	205
6580	José Luis García del Pozo	Recio	8	214	Spain	205
6603	Dimitrios Siovas	\N	22	88	Greece	205
6606	Javier Eraso Goñi	Javi Eraso	17	214	Spain	205
21390	Andriy Lunin	\N	29	238	Ukraine	205
23561	Vasyl Kravets	\N	14	238	Ukraine	205
6887	Jonás Ramalho Chimeno	Jonás Ramalho	4	7	Angola	211
7578	Anthony Rubén Lozano Colón	Anthony Lozano	19	101	Honduras	211
22129	Valery Fernández Estrada	Valery Fernández	34	214	Spain	211
23264	Seung-Ho Paik	Paik Seung-Ho	35	121	Korea (South)	211
42283	Alejandro Pachón Párraga	Álex Pachón	37	214	Spain	211
3437	Francis Joseph Coquelin	\N	17	78	France	207
5186	Denis Cheryshev	\N	11	188	Russia	207
5718	Rodrigo Moreno Machado	Rodrigo	19	214	Spain	207
6401	Kevin Gameiro	Kévin Gameiro	9	78	France	207
6583	Carlos Soler Barragán	Carlos Soler	8	214	Spain	207
6587	Antonio Latorre Grueso	Toni Lato	15	214	Spain	207
6589	Geoffrey Kondogbia	\N	6	43	Central African Republic	207
6590	Norberto Murara Neto	Neto	13	31	Brazil	207
6594	Santiago Mina Lorenzo	Santi Mina	22	214	Spain	207
6595	Daniel Parejo Muñoz	Dani Parejo	10	214	Spain	207
6746	Gabriel Armando de Abreu	Gabriel Paulista	5	31	Brazil	207
6748	Ferrán Torres García	Ferrán Torres	20	214	Spain	207
6797	Daniel Wass	\N	18	61	Denmark	207
6830	Facundo Sebastián Roncaglia	Facundo Roncaglia	4	11	Argentina	207
6891	Ezequiel Marcelo Garay	Ezequiel Garay	24	11	Argentina	207
6898	Jaume Doménech Sánchez	Jaume Doménech	1	214	Spain	207
11634	Cristiano Piccini	\N	21	112	Italy	207
22740	Kang-In Lee	Lee Kang-In	16	121	Korea (South)	207
3109	Malcom Filipe Silva de Oliveira	Malcom	14	31	Brazil	217
6585	Jeison Fabián Murillo Cerón	Jeison Murillo	17	49	Colombia	217
8668	Kevin-Prince Boateng	\N	19	86	Ghana	217
37237	Ignacio Peña Sotorres	Iñaki Peña	30	214	Spain	217
10612	Yoel Rodríguez Oterino	Yoel	13	214	Spain	901
17027	Sergio Guardiola Navarro	Sergi Guardiola	12	214	Spain	901
22020	Joaquín Fernández Moreno	Joaquín Fernández	2	214	Spain	901
23492	Stiven Ricardo Plaza Castillo	Stiven Plaza	42	65	Ecuador	901
7040	Marko Rog	\N	20	56	Croatia	213
8068	Maximilian Wöber	\N	14	15	Austria	213
11332	Ibrahim Amadou	\N	5	78	France	213
3509	Thibaut Courtois	\N	25	22	Belgium	220
4926	Francisco Román Alarcón Suárez	Isco	22	214	Spain	220
5200	Lucas Vázquez Iglesias	Lucas Vázquez	17	214	Spain	220
5201	Sergio Ramos García	Sergio Ramos	4	214	Spain	220
5463	Luka Modrić	\N	10	56	Croatia	220
5485	Raphaël Varane	\N	5	78	France	220
5539	Carlos Henrique Casimiro	Casemiro	14	31	Brazil	220
5552	Marcelo Vieira da Silva Júnior	Marcelo	12	31	Brazil	220
5574	Toni Kroos	\N	8	85	Germany	220
5597	Keylor Navas Gamboa	Keylor Navas	1	54	Costa Rica	220
5719	Marco Asensio Willemsen	\N	20	214	Spain	220
5721	Daniel Carvajal Ramos	Daniel Carvajal	2	214	Spain	220
6399	Gareth Frank Bale	Gareth Bale	11	249	Wales	220
6697	Daniel Ceballos Fernández	Dani Ceballos	24	214	Spain	220
6773	Federico Santiago Valverde Dipetta	Federico Valverde	15	242	Uruguay	220
18395	Vinícius José Paixão de Oliveira Júnior	Vinícius Júnior	28	31	Brazil	220
18620	Sergio Reguilón Rodríguez	Sergio Reguilón	23	214	Spain	220
19677	Karim Benzema	\N	9	78	France	220
4346	Gilbert Gianelli Imbula Wanga	Giannelli Imbula	12	52	Congo, (Kinshasa)	360
5521	Luis Jan Piers Advíncula Castrillón	Luis Advíncula	17	179	Peru	360
6652	Jordi Amat Maas	Jordi Amat	16	214	Spain	360
6914	Roberto Román Triguero	Tito	2	214	Spain	360
6924	Alejandro Gálvez Jimena	Alejandro Gálvez	23	214	Spain	360
7900	Tiago Manuel Dias Correia	Bebé	14	41	Cape Verde	360
8512	Franco Matías Di Santo	Franco Di Santo	25	11	Argentina	360
11535	José Ángel Pozo la Rosa	José Ángel Pozo	22	214	Spain	360
11537	Alberto García Cabrera	Alberto García	1	214	Spain	360
11538	Alejandro Moreno Lopera	Moreno Lopera	7	214	Spain	360
11539	Adrián Embarba Blázquez	Adri Embarba	11	214	Spain	360
11540	Óscar Guido Trejo	Óscar Trejo	8	11	Argentina	360
12192	Álvaro García Rivera	Álvaro García	18	214	Spain	360
12194	Santiago Comesaña Veiga	Santi Comesaña	27	214	Spain	360
16209	Raúl de Tomás Gómez	Raúl de Tomás	9	214	Spain	360
17054	Emiliano Daniel Velázquez Maldonado	Emiliano Velázquez	20	242	Uruguay	360
21397	Stole Dimitrievski	\N	13	135	Macedonia, Republic of	360
23488	Mario Suárez Mata	Mario Suárez	15	214	Spain	360
3990	Jesé Rodríguez Ruiz	Jesé	10	214	Spain	218
22235	Wilfrid Jaures Kaptoum	Wilfrid Kaptoum	34	39	Cameroon	218
22915	Diego Lainez Leyva	Diego Lainez	22	147	Mexico	218
23522	Emerson Aparecido Leite de Souza Junior	Emerson Royal	24	31	Brazil	218
6569	Roberto José Rosales Altuve	Roberto Rosales	8	246	Venezuela (Bolivarian Republic)	214
6571	Roberto Jiménez Gago	Roberto Jiménez	1	214	Spain	214
6758	Víctor Sánchez Mata	Víctor Sánchez	4	214	Spain	214
6767	Sergio García De La Fuente	Sergio García	9	214	Spain	214
6768	Diego López Rodríguez	Diego López	13	214	Spain	214
6769	Edinaldo Gomes Pereira	Naldo	5	31	Brazil	214
6770	Esteban Félix Granero Molina	Esteban Granero	23	214	Spain	214
6790	Mario Hermoso Canseco	Mario Hermoso	22	214	Spain	214
6791	Javier López Rodríguez	Javi López	16	214	Spain	214
6838	Hernán Arsenio Pérez González	Hernán Pérez	17	178	Paraguay	214
6866	Marc Roca Junqué	Marc Roca	21	214	Spain	214
6886	Dídac Vilá Rosselló	Dídac Vilá	12	214	Spain	214
6902	Óscar Melendo Jiménez	Óscar Melendo	14	214	Spain	214
10323	Alfa Semedo Esteves	Alfa Semedo	2	96	Guinea-Bissau	214
11391	Borja Iglesias Quintas	Borja Iglesias	7	214	Spain	214
22287	Adrià Giner Pedrosa	Adrià Pedrosa	28	214	Spain	214
22919	Lluís López Mármol	Lluís López	27	214	Spain	214
23343	Lei Wu	Wu Lei	24	46	China	214
3497	Vicente Iborra De La Fuente	Vicente Iborra	10	214	Spain	222
6827	Daniele Bonera	\N	23	112	Italy	222
38552	Joey Barton	\N	24	68	England	36
24729	Xavier Quintillà Guasch	Xavi Quintillà	39	214	Spain	222
42275	Iván Martín Núñez	Iván Martín	37	214	Spain	222
3477	Álvaro Borja Morata Martín	Álvaro Morata	22	214	Spain	212
5249	Diego Roberto Godín Leal	Diego Godín	2	242	Uruguay	212
5259	José María Giménez de Vargas	José Giménez	24	242	Uruguay	212
6375	Juan Francisco Torres Belén	Juanfran	20	214	Spain	212
6038	John Guidetti	\N	10	220	Sweden	206
6604	Darko Brašanac	\N	20	203	Serbia	206
6622	Tomás Pina Isla	Tomás Pina	8	214	Spain	206
6636	Rodrigo Ely	\N	4	31	Brazil	206
6856	Carlos Martín Vigaray	Carlos Vigaray	2	214	Spain	206
6592	Rúben Miguel Nunes Vezo	Rúben Vezo	14	183	Portugal	221
6675	Antonio Manuel Luna Rodríguez	Antonio Luna	22	214	Spain	221
6787	Pedro López Muñoz	Pedro López	19	214	Spain	221
11305	Raphael Dwamena	Raphael	20	86	Ghana	221
17303	Nikola Vukčević	\N	17	152	Montenegro	221
5693	Gaku Shibasaki	\N	10	114	Japan	216
6741	Ignasi Miquel i Pons	Ignasi Miquel	21	214	Spain	216
7104	Mathías Olivera Miramontes	Mathías Olivera	17	242	Uruguay	216
7621	Hugo Duro Perales	Hugo Duro	27	214	Spain	216
6707	Charles Días Barbosa de Oliveira	Charles	19	31	Brazil	322
6778	Iván Ramis Barrios	Iván Ramis	4	214	Spain	322
6907	Pedro León Sánchez Gil	Pedro León	21	214	Spain	322
24948	Jordi Calavera Espinach	Jordi Calavera	2	214	Spain	322
8118	Frenkie de Jong	\N	21	160	Netherlands	217
23987	Rey Manaj	\N	41	3	Albania	217
30756	Anssumane Fati	Ansu Fati	31	214	Spain	217
32480	Ronald Federico Araújo da Silva	Ronald Araújo	33	242	Uruguay	217
24949	Álex Collado Gutiérrez	Álex Collado	30	214	Spain	217
24841	Ricard Puig Martí	Riqui Puig	28	214	Spain	217
39159	Arnau Tenas Ureña	Arnau Tenas	36	214	Spain	217
11532	Jean-Clair Todibo	\N	6	78	France	217
7361	Pablo Chavarría	\N	19	11	Argentina	1043
8654	Ante Budimir	\N	22	56	Croatia	1043
8689	Aleksandar Sedlar	\N	20	203	Serbia	1043
10277	Fabricio Martín Agosto Ramírez	Fabri	13	214	Spain	1043
23986	Aleix Febas Pérez	Aleix Febas	23	214	Spain	1043
24067	Abdón Prats Bastidas	Abdón Prats	9	214	Spain	1043
24072	Salvador Sevilla López	Salva Sevilla	8	214	Spain	1043
24083	Manuel Reina Rodríguez	Manolo Reina	1	214	Spain	1043
24084	Martin Valjent	\N	24	207	Slovakia	1043
24086	Antonio José Raillo Arenas	Antonio Raillo	21	214	Spain	1043
24087	Iddrisu Baba Mohammed	Iddrisu Baba	12	86	Ghana	1043
24088	Daniel José Rodríguez Vázquez	Dani Rodríguez	14	214	Spain	1043
24089	Joan Sastre Vanrell	Joan Sastre	2	214	Spain	1043
24576	Francisco Gámez López	Fran Gámez	15	214	Spain	1043
25061	Francisco Javier Campos Coll	Xisco Campos	5	214	Spain	1043
27342	Josep Señé Escudero	Josep Señé	4	214	Spain	1043
31090	Takefusa Kubo	\N	26	114	Japan	1043
6387	Iñigo Córdoba Kerejeta	Iñigo Córdoba	11	214	Spain	215
6389	Mikel San José Domínguez	Mikel San José	6	214	Spain	215
6391	Raúl García Escudero	Raúl García	22	214	Spain	215
6392	Íñigo Lekue Martínez	Iñigo Lekue	15	214	Spain	215
6393	Iñaki Williams Arthuer	Iñaki Williams	9	86	Ghana	215
6397	Unai Núñez Gestoso	Unai Núñez	3	214	Spain	215
6649	Óscar de Marcos Arana	De Marcos	18	214	Spain	215
6662	Iago Herrerín Buisán	Iago Herrerín	13	214	Spain	215
6665	Íñigo Martínez Berridi	Íñigo Martínez	4	214	Spain	215
6699	Ander Capa Rodríguez	Ander Capa	21	214	Spain	215
6775	Daniel García Carrillo	Dani García	14	214	Spain	215
6789	Mikel Balenziaga Oruesagasti	Mikel Balenziaga	24	214	Spain	215
6842	Iker Muniain Goñi	Iker Muniain	10	214	Spain	215
6877	Yeray Álvarez López	Yeray Álvarez	5	214	Spain	215
8540	Kenan Kodro	\N	23	28	Bosnia and Herzegovina	215
11746	Unai López Cabrera	Unai López	8	214	Spain	215
11748	Unai Simón Mendibil	Unai Simón	1	214	Spain	215
30225	Oihan Sancet Tirapu	Oihan Sancet	34	214	Spain	215
30715	Gaizka Larrazabal Goikoetxea	Gaizka Larrazabal	12	214	Spain	215
32953	Asier Villalibre Molina	Asier Villalibre	25	214	Spain	215
35473	Unai Vencedor Paris	Unai Vencedor	27	214	Spain	215
41542	Daniel Vivian Moreno	Dani Vivian	29	214	Spain	215
6796	Nemanja Radoja	\N	5	203	Serbia	221
12020	Hernâni Jorge Santos Fortes	Hernâni	8	183	Portugal	221
23948	Carlos Clerc Martínez	Carlos Clerc	19	214	Spain	221
38251	Daniel Cárdenas Lindez	Dani Cárdenas	26	214	Spain	221
4558	Pape Cheikh Diop Gueye	Pape Diop	24	202	Senegal	209
5194	Fyodor Smolov	\N	9	188	Russia	209
6310	Filip Bradarić	\N	14	56	Croatia	209
16555	Joseph Aidoo	\N	18	86	Ghana	209
24273	Jorge Sáenz de Miera Colmeiro	Jorge Sáenz	16	214	Spain	209
25014	Juan Hernández García	Juan Hernández	7	214	Spain	209
28194	Dragan Rosić	\N	40	203	Serbia	209
30294	Gabriel Matías Fernández Leites	Gabriel Fernández	19	242	Uruguay	209
32815	Sergio Bermejo Lillo	Sergio Bermejo	28	214	Spain	209
35000	José Manuel Fontán Mondragón	José Fontán	31	214	Spain	209
40890	Iván Villar Martínez	Iván Villar	25	214	Spain	209
41116	Jacobo González Rodrigañez	Jacobo González	29	214	Spain	209
25006	Carles Pérez Sayol	Carles Pérez	27	214	Spain	217
5674	Moussa Wagué	\N	16	202	Senegal	217
41122	Ramón Rodríguez Jiménez	Monchu	42	214	Spain	217
12073	Pablo Hervías Ruiz	Pablo Hervías	11	214	Spain	901
17520	Federico Barba	\N	3	112	Italy	901
24777	Waldo Rubio Martín	Waldo Rubio	23	214	Spain	901
32673	Jorge De Frutos Sebastián	Jorge De Frutos	12	214	Spain	901
41543	Jorge Cuenca Barreno	Jorge Cuenca	43	214	Spain	217
41641	Daniel Morer Cabrera	Dani Morer	35	214	Spain	217
6591	Ignacio Vidal Miralles	Nacho Vidal	2	214	Spain	422
6693	Raúl Rodríguez Navas	Raúl Navas	3	214	Spain	422
6730	Rubén Iván Martínez Andrade	Rubén Martínez	13	214	Spain	422
6735	Adrián López Álvarez	Adrián López	22	214	Spain	422
6810	José Manuel Arnáiz Díaz	José Arnáiz	16	214	Spain	422
23213	Enric Gallego Puigsech	Enric Gallego	11	214	Spain	422
23944	Oier Sanjurjo Mate	Oier	6	214	Spain	422
23945	Iñigo Pérez Soto	Iñigo Pérez	21	214	Spain	422
23947	Roberto Torres Morales	Roberto Torres	10	214	Spain	422
23950	David García Zubiría	David García	5	214	Spain	422
24085	Pervis Josué Estupiñán Tenorio	Pervis Estupiñán	30	65	Ecuador	422
24211	Sergio Herrera Pirón	Sergio Herrera	1	214	Spain	422
24212	Aridane Hernández Umpiérrez	Aridane Hernández	23	214	Spain	422
24315	Enrique Barja Afonso	Kike Barja	19	214	Spain	422
25062	Juan Manuel Pérez Ruiz	Juan Pérez	25	214	Spain	422
30277	Jon Moncayola Tollar	Jon Moncayola	27	214	Spain	422
40114	Javier Martínez Calvo	Javi Martínez	33	214	Spain	422
40115	Aimar Oroz	\N	34	214	Spain	422
41471	José Javier Hualde Zaratiegui	José Hualde	35	214	Spain	422
6982	Maxime Gonalons	\N	4	78	France	1049
8866	Carlos Fernández Luna	Carlos Fernández	24	214	Spain	1049
11501	Darwin Daniel Machís Marcano	Darwin Machís	23	246	Venezuela (Bolivarian Republic)	1049
16249	Yangel Clemente Herrera Ravelo	Yangel Herrera	21	246	Venezuela (Bolivarian Republic)	1049
16538	İsmail Köybaşı	\N	11	233	Turkey	1049
23807	Domingos Sousa Coutinho Meneses Duarte	Domingos Duarte	22	183	Portugal	1049
24126	José Antonio Rodríguez Díaz	Antonio Puertas	10	214	Spain	1049
24127	Ramon Olamilekan Azeez	Ramon Azeez	12	166	Nigeria	1049
24133	Víctor David Díaz Miguel	Víctor Díaz	16	214	Spain	1049
24134	Germán Sánchez Barahona	Germán Sánchez	6	214	Spain	1049
24140	Rui Tiago Dantas da Silva	Rui Silva	1	183	Portugal	1049
24142	José Antonio Martínez Gil	José Martínez	5	214	Spain	1049
24143	Álvaro Vadillo Cifuentes	Álvaro Vadillo	7	214	Spain	1049
24144	Ángel Montoro Sánchez	Ángel Montoro	19	214	Spain	1049
24324	Gustavo Adrián Ramos Vásquez	Adrián Ramos	20	49	Colombia	1049
25702	Carlos Neva Tey	Carlos Neva	15	214	Spain	1049
25704	Aarón Escandell Banacloche	Aarón Escandell	13	214	Spain	1049
26009	Roberto Soldado Rillo	Roberto Soldado	9	214	Spain	1049
41407	Juan Brandariz Movilla	Chumi	40	214	Spain	217
41408	Javier Enrique Delgado Saverio	Kike Saverio	38	65	Ecuador	217
5598	Óscar Esau Duarte Gaitán	Óscar Duarte	6	54	Costa Rica	221
6910	Eduardo Expósito Jaén	Edu Expósito	10	214	Spain	322
23808	Enrique González Casín	Quique	7	214	Spain	322
23981	Álvaro Tejero Sacristán	Álvaro Tejero	24	214	Spain	322
23803	Esteban Rodrigo Burgos	Esteban Burgos	2	11	Argentina	322
6947	Miralem Pjanić	\N	8	28	Bosnia and Herzegovina	217
21881	Sergino Dest	Sergiño Dest	2	241	United States of America	217
22390	Francisco António Machado Mota de Castro Trincão	Francisco Trincão	17	183	Portugal	217
29256	Matheus Fernandes Siqueira	Matheus Fernandes	19	31	Brazil	217
30486	Pedro González López	Pedri	16	214	Spain	217
39469	Konrad De La Fuente	Konrad De la Fuente	29	241	United States of America	217
43728	Óscar Mingueza García	Óscar Mingueza	28	214	Spain	217
39073	Moriba Kourouma Kourouma	Ilaix Moriba	27	95	Guinea	217
6683	Cheick Doukouré	\N	25	55	Côte d'Ivoire	221
23966	Mickaël Malsa	\N	12	143	Martinique	221
30492	Francisco Javier Hidalgo Gómez	Son	2	214	Spain	221
30593	Daniel Gómez Alcón	Dani Gómez	21	214	Spain	221
41202	Giorgi Kochorashvili	\N	43	84	Georgia	221
114272	Alejandro Cantero Sánchez	\N	29	214	Spain	221
6908	Iván Alejo Peralta	Iván Alejo	14	214	Spain	552
20542	Álvaro Negredo Sánchez	Álvaro Negredo	18	214	Spain	552
23811	Alberto Perea Correoso	Alberto Perea	10	214	Spain	552
23934	Rafael Jiménez Jarque	Fali Jiménez	3	214	Spain	552
23967	Alejandro Fernández Iglesias	Álex	8	214	Spain	552
23970	José María Martín-Bejarano Serrano	José Mari	6	214	Spain	552
23971	Jairo Izquierdo González	Jairo Izquierdo	25	214	Spain	552
23973	Salvador Sánchez Ponce	Salvi	7	214	Spain	552
24034	Jorge Marcos Pombo Escobar	Jorge Pombo	11	214	Spain	552
24270	Filip Malbašić	\N	24	203	Serbia	552
24322	Isaac Carcelén Valencia	Isaac Carcelén	20	214	Spain	552
24593	Marcos Mauro López Gutiérrez	Marcos Mauro	4	11	Argentina	552
24616	Luis Alfonso Espino García	Alfonso Espino	22	242	Uruguay	552
24712	Jon Ander Garrido Moracia	Jon Garrido	5	214	Spain	552
29198	Jeremías Ledesma	\N	1	11	Argentina	552
30370	Jens Jønsson	\N	2	61	Denmark	552
31793	David Gil Mohedano	David Gil	13	214	Spain	552
34532	Ivan Šaponjić	\N	12	203	Serbia	552
41176	Juan Flere Pizzuti	Juan Flere	26	11	Argentina	552
47344	José Alejandro Martín Valerón	Álex Martín	37	214	Spain	552
6757	Aarón Martín Caricol	Aarón Martín	19	214	Spain	209
6776	David Juncà Reñé	David Juncà	17	214	Spain	209
28658	Augusto Jorge Mateo Solari	Augusto Solari	21	11	Argentina	209
39598	Miguel Baeza Pérez	Miguel Baeza	27	214	Spain	209
75546	Carlos Domínguez Cáceres	Carlos Domínguez	40	214	Spain	209
97291	Patrick Gilmar Sequeira Mejías	\N	41	54	Costa Rica	209
117025	Hugo Sotelo	\N	44	214	Spain	209
5523	Renato Fabrizio Tapia Cortijo	Renato Tapia	14	179	Peru	209
6803	Emre Mor	\N	11	233	Turkey	209
24730	Lucas René Olaza Catrofe	Lucas Olaza	15	242	Uruguay	209
42907	Iago Domínguez Rodríguez	Iago Domínguez	26	214	Spain	209
47445	Miguel Rodríguez Vidal	Miguel Rodríguez	32	214	Spain	209
47447	Gabriel Veiga Novas	Gabri Veiga	31	214	Spain	209
48643	Raúl Blanco Juncal	Raúl Blanco	35	214	Spain	209
49531	Sergio Carreira Vilariño	Sergio Carreira	34	214	Spain	209
4691	Claudio Andrés Bravo Muñoz	Claudio Bravo	25	45	Chile	218
6593	Martín Montoya Torralbo	Martín Montoya	2	214	Spain	218
6851	Aitor Ruibal García	Aitor Ruibal	24	214	Spain	218
26404	Guido Rodríguez	\N	21	11	Argentina	218
37892	Carlos Marín Tomás	Carlos Marín	31	214	Spain	218
41083	Rodrigo Sánchez Rodriguez	Rodri	28	214	Spain	218
42282	Paul Edgar Akouokou	\N	4	55	Côte d'Ivoire	218
23943	Rubén García Santos	Rubén García	14	214	Spain	422
23949	Unai García Lugea	Unai García	4	214	Spain	422
24172	Álvaro Juan Cruz Armada	Juan Cruz	3	214	Spain	422
41573	Iñaki Álvarez Goñi	Iñaki Álvarez	26	214	Spain	422
7459	Jawad El Yamiq	\N	15	154	Morocco	901
21225	Javier Sánchez de Felipe	Javier Sánchez	5	214	Spain	901
23627	João Pedro Neves Filipe	Jota	40	183	Portugal	901
24141	Federico San Emeterio Díaz	Fede	20	214	Spain	901
24266	Luis Jesús Pérez Maqueda	Luis Pérez	2	214	Spain	901
29310	Shon Zalman Weissman	\N	9	111	Israel	901
31235	Marcos André de Sousa Mendonça	Maranhão	16	31	Brazil	901
40881	Enrique Pérez Muñoz	Kike Pérez	8	214	Spain	901
3804	Ferland Mendy	\N	23	78	France	220
5202	José Ignacio Fernández Iglesias	Nacho	6	214	Spain	220
6319	Luka Jović	\N	18	203	Serbia	220
13620	Éder Gabriel Militão	Éder Militão	3	31	Brazil	220
25104	Rodrygo Silva de Goes	Rodrygo	25	31	Brazil	220
38832	Luis Federico López Andúgar	Luis López	33	214	Spain	220
6786	David Timor Copoví	David Timor	24	214	Spain	216
23211	Víctor Mollejo Carpintero	Víctor Mollejo	26	214	Spain	216
28589	Ante Palaversa	\N	14	56	Croatia	216
31615	Orlando Rubén Yáñez Alabart	Rubén Yáñez	1	214	Spain	216
49301	Santiago Ramos Mingo	Santi Ramos Mingo	32	11	Argentina	217
10765	Jorge Ruiz Ojeda	Koke	1	214	Spain	221
8864	Darío Poveda Romera	Darío Poveda	19	214	Spain	216
35287	Sofian Chakla	Soufiane Chakla	21	154	Morocco	216
41107	Sabit Abdulai	\N	35	86	Ghana	216
71519	Juan Antonio Iglesias Sánchez	Juan Iglesias	29	214	Spain	216
75584	Mamor Niang	\N	39	214	Spain	216
79498	Amankwaa Akurugu	\N	40	86	Ghana	216
105762	José Antonio Miranda Boacho	Josete Miranda	32	69	Equatorial Guinea	216
6930	Jonathan Calleri	\N	16	11	Argentina	422
12419	Lucas Torró Marset	Lucas Torró	24	214	Spain	422
33339	Manuel Sánchez De La Peña	Manu Sánchez	39	214	Spain	422
52108	Iván Martínez Marqués	Iván Martínez	36	214	Spain	422
12529	Ashley Cole	\N	3	68	England	1
15042	Dennis Bergkamp	\N	10	160	Netherlands	1
15515	Patrick Vieira	\N	4	78	France	1
15516	Thierry Henry	\N	14	78	France	1
15637	Sulzeer Jeremiah ''Sol' Campbell	Sol Campbell	23	68	England	1
19312	Robert Pirès	\N	7	78	France	1
20015	Jens Lehmann	\N	1	85	Germany	1
23816	José Antonio Reyes Calderón	José Antonio Reyes	9	214	Spain	1
26014	Eduardo César Daude Gaspar	Edu Gaspar	17	31	Brazil	1
38412	Kolo Habib Touré	Kolo Touré	28	55	Côte d'Ivoire	1
40221	Gilberto Aparecido da Silva	Gilberto Silva	19	31	Brazil	1
40222	Laureano Bisan-Etame Mayer	Lauren	12	39	Cameroon	1
15654	Martin Keown	\N	5	68	England	1
20302	Gaël Clichy	\N	22	78	France	1
24972	Ray Parlour	\N	15	68	England	1
42458	Graham Stack	\N	33	109	Ireland	1
15512	Sylvain Wiltord	\N	11	78	France	1
24971	Nwankwo Christian Kanu	\N	0	166	Nigeria	1
26194	Pascal Cygan	\N	0	78	France	1
15754	Fredrik Ljungberg	\N	8	220	Sweden	1
40870	Stuart Taylor	\N	13	68	England	1
40255	Jérémie Aliadière	\N	30	78	France	1
41623	Rami Shaaban	\N	24	220	Sweden	1
15036	Edwin van der Sar	\N	1	160	Netherlands	55
20505	Louis Saha	\N	8	78	France	55
38566	Lee Clark	\N	10	68	England	55
40407	Steed Malbranque	\N	14	78	France	55
40408	Moritz Volz	\N	2	85	Germany	55
40409	Junichi Inamoto	\N	6	114	Japan	55
40410	Barry Hayles	\N	15	113	Jamaica	55
40411	Sylvain Legwinski	\N	5	78	France	55
40412	Sean Davis	\N	23	68	England	55
40413	Zat Knight	\N	16	68	England	55
40414	Jérôme Bonnissel	\N	18	78	France	55
40415	Andy Melville	\N	4	249	Wales	55
40422	Alain Goma	\N	24	78	France	55
40423	Martin Djetou	\N	17	78	France	55
45964	Mark Crossley	\N	12	249	Wales	55
45965	Facundo Sava	\N	9	11	Argentina	55
15399	Robbie Fowler	\N	8	68	England	36
15407	Steve McManaman	\N	20	68	England	36
15519	Nicolas Anelka	\N	39	78	France	36
19636	Paul Bosvelt	\N	26	160	Netherlands	36
20329	David James	\N	1	68	England	36
20447	Richard Dunne	\N	22	109	Ireland	36
24758	Michael Tarnat	\N	18	85	Germany	36
38465	Claudio Reyna	\N	6	241	United States of America	36
38551	Shaun Wright-Phillips	\N	29	68	England	36
40215	Jihai Sun	Sun Jihai	17	46	China	36
40217	Trevor Sinclair	\N	28	68	England	36
40218	Sylvain Distin	\N	5	78	France	36
15049	Billy McKinlay	\N	0	201	Scotland	22
15173	Steffen Freund	\N	0	85	Germany	22
24798	Nikos Dabizas	Nikolaos Dabizas	0	88	Greece	22
40235	Danny Coyne	\N	0	249	Wales	22
40236	Ian Walker	\N	1	68	England	22
40237	James Scowcroft	\N	0	68	England	22
40238	Lilian Nalis	\N	0	78	France	22
40239	Jordan Stewart	\N	0	68	England	22
40240	Paul Dickov	\N	0	201	Scotland	22
40241	Matt Heath	\N	0	68	England	22
40242	Marcus Bent	\N	0	68	England	22
40243	Frank Mohammed Sinclair	Frank Sinclair	0	113	Jamaica	22
40244	Trevor Benjamin	\N	0	113	Jamaica	22
40245	Paul Brooker	\N	0	68	England	22
45969	Keith Gillespie	\N	7	169	Northern Ireland	22
45970	Steve Guppy	\N	27	68	England	22
376521	David Bentley	\N	37	68	England	1
15259	Patrik Berger	\N	13	60	Czech Republic	105
15410	Teddy Sheringham	\N	10	68	England	105
15505	Steve Stone	\N	19	68	England	105
20402	Boris Živković	\N	4	56	Croatia	105
20510	Alexei Gennadyevich Smertin	Alexey Smertin	30	188	Russia	105
38403	Shaka Hislop	\N	1	231	Trinidad and Tobago	105
40336	Sébastien Schemmel	\N	28	78	France	105
40337	Yakubu Aiyegbeni	\N	20	166	Nigeria	105
40338	Nigel Quashie	\N	11	201	Scotland	105
40339	Arjan de Zeeuw	\N	6	160	Netherlands	105
40340	Dejan Stefanovic	\N	3	203	Serbia	105
40341	Tim Sherwood	\N	8	68	England	105
40342	Jason Roberts	\N	31	90	Grenada	105
40343	Amdy Moustapha Faye	Amdy Fayé	25	202	Senegal	105
20059	Aaron Hughes	\N	18	169	Northern Ireland	37
20446	Shay Given	\N	1	109	Ireland	37
24799	Gary Speed	\N	11	249	Wales	37
24801	Steve Harper	\N	12	68	England	37
26010	Hugo Miguel Ferreira Gomes Viana	Hugo Viana	45	183	Portugal	37
38418	Jonathan Woodgate	\N	27	68	England	37
40225	Andy O"Brien	\N	5	109	Ireland	37
40226	Craig Bellamy	\N	10	249	Wales	37
40227	Laurent Robert	\N	32	78	France	37
40228	Lee Bowyer	\N	29	68	England	37
40229	Darren Ambrose	\N	17	68	England	37
40230	Titus Malachi Bramble	Titus Bramble	19	68	England	37
40231	Alan Shearer	\N	9	68	England	37
40232	Shola Ameobi	\N	23	166	Nigeria	37
40233	Olivier Bernard	\N	35	78	France	37
40234	Jermaine Jenas	\N	7	68	England	37
40290	Robbie Savage	\N	0	249	Wales	54
40291	Clinton Morrison	\N	0	109	Ireland	54
40292	Maik Taylor	\N	0	169	Northern Ireland	54
40293	Damien Johnson	\N	0	169	Northern Ireland	54
40294	Bryan Hughes	\N	0	68	England	54
40295	Stan Lazaridis	\N	0	14	Australia	54
40296	Kenny Cunningham	\N	0	109	Ireland	54
40297	Stephen Clemence	\N	0	68	England	54
40298	Jamie Clapham	\N	0	68	England	54
40299	Stern John	\N	0	231	Trinidad and Tobago	54
40300	Matthew Upson	\N	0	68	England	54
40301	Mikael Forssell	\N	0	77	Finland	54
40302	David Dunn	\N	0	68	England	54
40303	Aliou Cissé	\N	0	202	Senegal	54
15659	Emile Heskey	\N	8	68	England	24
15665	Michael Owen	\N	10	68	England	24
19109	Steven Gerrard	\N	17	68	England	24
19735	Milan Baroš	\N	5	60	Czech Republic	24
34386	John Arne Semundseth Riise	John Arne Riise	18	171	Norway	24
34388	Jamie Carragher	\N	23	68	England	24
34389	Sami Hyypiä	\N	4	77	Finland	24
34390	Jerzy Dudek	\N	1	182	Poland	24
34391	Harry Kewell	\N	7	14	Australia	24
38454	Danny Murphy	\N	13	68	England	24
38522	Dietmar Hamann	\N	16	85	Germany	24
40254	Igor Bišćan	\N	25	56	Croatia	24
40257	El-Hadji Ousseynou Diouf	El-Hadji Diouf	9	202	Senegal	24
15409	David Seaman	\N	1	68	England	36
40216	Eyal Berkovic	\N	0	111	Israel	36
40219	Danny Tiatto	\N	0	14	Australia	36
40220	David Sommeil	\N	0	78	France	36
40223	Antoine Sibierski	\N	0	78	France	36
15095	Tugay Kerimoğlu	\N	8	233	Turkey	98
15272	Markus Babbel	\N	11	85	Germany	98
24766	Dwight Yorke	\N	19	231	Trinidad and Tobago	98
24767	Andy Cole	\N	9	68	England	98
38464	Brad Friedel	\N	1	241	United States of America	98
40353	Vratislav Greško	\N	3	207	Slovakia	98
40354	Lucas Neill	\N	2	14	Australia	98
40355	Andy Todd	\N	15	68	England	98
40356	Craig Short	\N	6	68	England	98
40357	Brett Emerton	\N	23	14	Australia	98
40395	Michael Gray	\N	33	68	England	98
40396	Matt Jansen	\N	10	68	England	98
40397	Martin Andresen	\N	25	171	Norway	98
40398	Jonathan Douglas	\N	26	109	Ireland	98
13808	Radostin Kishishev	\N	2	35	Bulgaria	75
20153	Claus Jensen	\N	10	61	Denmark	75
20286	Scott Parker	\N	7	68	England	75
20549	Jamal Julian Campbell-Ryce	Jamal Campbell-Ryce	22	113	Jamaica	75
40374	Jason Joseph Euell	Jason Euell	9	113	Jamaica	75
40375	Paolo Di Canio	\N	11	112	Italy	75
40376	Graham Stuart	\N	4	68	England	75
40377	Hermann Hreidarsson	\N	12	104	Iceland	75
40378	Dean Kiely	\N	1	109	Ireland	75
40379	Matt Holland	\N	8	109	Ireland	75
40380	Mark Fish	\N	6	211	South Africa	75
40381	Chris Perry	\N	36	68	England	75
40382	Jonatan Lillebror Johansson	Jonatan Johansson	21	77	Finland	75
20326	Kieron Dyer	\N	0	68	England	37
38556	Leslie Ferdinand	Les Ferdinand	9	68	England	22
38569	Steve Howey	\N	24	68	England	22
375885	Matt Elliott	\N	18	201	Scotland	22
375886	Craig Hignett	\N	5	68	England	22
375887	Riccardo Scimeca	\N	21	68	England	22
375888	Andy Impey	\N	2	68	England	22
375889	Ben Thatcher	\N	33	249	Wales	22
375890	Callum Davidson	\N	14	201	Scotland	22
38466	Brian McBride	\N	8	241	United States of America	55
40420	Carlos Manuel Bocanegra	Carlos Bocanegra	34	241	United States of America	55
40421	Ian Pearce	\N	35	68	England	55
40424	Luís Boa Morte Pereira	Luís Boa Morte	11	183	Portugal	55
40425	Collins John	\N	36	160	Netherlands	55
\.


--
-- TOC entry 4878 (class 0 OID 25233)
-- Dependencies: 218
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (position_id, position_name) FROM stdin;
16	Left Midfield
22	Right Center Forward
6	Left Back
23	Center Forward
24	Left Center Forward
3	Right Center Back
12	Right Midfield
2	Right Back
13	Right Center Midfield
9	Right Defensive Midfield
1	Goalkeeper
15	Left Center Midfield
11	Left Defensive Midfield
10	Center Defensive Midfield
5	Left Center Back
19	Center Attacking Midfield
21	Left Wing
17	Right Wing
8	Left Wing Back
4	Center Back
7	Right Wing Back
20	Left Attacking Midfield
14	Center Midfield
18	Right Attacking Midfield
\.


--
-- TOC entry 4876 (class 0 OID 25216)
-- Dependencies: 216
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seasons (season_id, competition_id, season_name, match_updated, match_available) FROM stdin;
27	9	2015/2016	2023-08-17 23:51:11.837478	2023-08-17 23:51:11.837478
4	16	2018/2019	2023-03-07 12:20:48.11825	2023-03-07 12:20:48.11825
1	16	2017/2018	2021-08-27 11:26:39.802832	2021-01-23 21:55:30.42533
2	16	2016/2017	2021-08-27 11:26:39.802832	2020-07-29 05:00:00
27	16	2015/2016	2021-08-27 11:26:39.802832	2020-07-29 05:00:00
26	16	2014/2015	2021-08-27 11:26:39.802832	2020-07-29 05:00:00
25	16	2013/2014	2021-08-27 11:26:39.802832	2020-07-29 05:00:00
24	16	2012/2013	2021-08-27 11:26:39.802832	2021-07-10 13:41:45.751
23	16	2011/2012	2021-08-27 11:26:39.802832	2020-07-29 05:00:00
22	16	2010/2011	2022-01-26 21:07:11.033473	2022-01-26 21:07:11.033473
21	16	2009/2010	2022-11-15 17:26:10.871011	2022-11-15 17:26:10.871011
41	16	2008/2009	2021-11-07 14:20:01.699993	2021-11-07 14:20:01.699993
39	16	2006/2007	2021-03-31 04:18:30.43706	2021-03-31 04:18:30.43706
37	16	2004/2005	2021-04-01 06:18:57.459032	2021-04-01 06:18:57.459032
44	16	2003/2004	2022-11-24 21:06:10.454916	2022-11-24 21:06:10.454916
76	16	1999/2000	2020-07-29 05:00:00	2020-07-29 05:00:00
277	16	1972/1973	2023-07-06 12:49:07.467625	2023-07-06 12:49:07.467625
71	16	1971/1972	2020-07-29 05:00:00	2020-07-29 05:00:00
276	16	1970/1971	2023-07-06 12:50:01.961048	2023-07-06 12:50:01.961048
84	87	1983/1984	2020-07-29 05:00:00	2020-07-29 05:00:00
268	87	1982/1983	2023-06-11 02:51:59.941964	2023-06-11 02:51:59.941964
279	87	1977/1978	2023-06-26 10:36:15.442581	2023-06-26 10:36:15.442581
90	37	2020/2021	2023-02-25 14:52:09.326729	2023-02-25 14:52:09.326729
42	37	2019/2020	2023-07-25 01:08:03.214566	2023-07-25 01:08:03.214566
4	37	2018/2019	2023-07-24 19:50:20.881595	2023-07-24 19:50:20.881595
274	1470	1979	2023-06-28 10:55:11.501179	2023-06-28 10:55:11.501179
106	43	2022	2023-08-12 16:44:27.619465	2023-08-12 16:44:27.619465
3	43	2018	2023-07-24 13:09:34.513519	2023-07-24 13:09:34.513519
55	43	1990	2023-06-28 10:58:20.137929	2023-06-28 10:58:20.137929
54	43	1986	2023-06-28 11:20:34.252935	2023-06-28 11:20:34.252935
51	43	1974	2023-07-17 23:19:58.853207	2023-07-17 23:19:58.853207
272	43	1970	2023-07-17 23:24:45.579886	2023-07-17 23:24:45.579886
270	43	1962	2023-06-26 10:38:00.323984	2023-06-26 10:38:00.323984
269	43	1958	2023-06-26 10:33:08.214831	2023-06-26 10:33:08.214831
108	1238	2021/2022	2023-03-31 02:14:09.896947	2023-03-31 02:14:09.896947
90	11	2020/2021	2023-07-26 14:11:01.312143	2023-07-26 14:11:01.312143
42	11	2019/2020	2023-07-25 00:16:32.999467	2023-07-25 00:16:32.999467
4	11	2018/2019	2023-08-03 02:24:43.761907	2023-08-03 02:24:43.761907
1	11	2017/2018	2023-07-24 13:03:48.574627	2023-07-24 13:03:48.574627
2	11	2016/2017	2023-07-25 00:14:55.260536	2023-07-25 00:14:55.260536
27	11	2015/2016	2023-07-24 21:52:42.890908	2023-07-24 21:52:42.890908
26	11	2014/2015	2023-07-24 21:50:15.215072	2023-07-24 21:50:15.215072
25	11	2013/2014	2022-07-23 12:18:49.547396	2022-07-23 12:18:49.547396
24	11	2012/2013	2022-09-25 20:52:24.444609	2022-09-25 20:52:24.444609
23	11	2011/2012	2022-12-01 14:10:17.791769	2022-12-01 14:10:17.791769
22	11	2010/2011	2023-04-19 10:48:44.07983	2023-04-19 10:48:44.07983
21	11	2009/2010	2023-04-19 10:48:01.770383	2023-04-19 10:48:01.770383
41	11	2008/2009	2023-04-19 10:46:29.203565	2023-04-19 10:46:29.203565
40	11	2007/2008	2023-04-19 10:42:35.284291	2023-04-19 10:42:35.284291
39	11	2006/2007	2023-03-26 23:19:39.125951	2023-03-26 23:19:39.125951
38	11	2005/2006	2022-07-03 12:34:31.749038	2022-07-03 12:34:31.749038
37	11	2004/2005	2020-07-29 05:00:00	2020-07-29 05:00:00
278	11	1973/1974	2023-07-06 12:50:48.80782	2023-07-06 12:50:48.80782
48	81	1997/1998	2023-06-28 11:19:54.593488	2023-06-28 11:19:54.593488
275	81	1981	2023-06-28 11:31:57.152298	2023-06-28 11:31:57.152298
27	7	2015/2016	2023-08-17 21:35:27.554258	2023-08-17 21:35:27.554258
68	116	1977	2023-07-24 09:06:54.144896	2023-07-24 09:06:54.144896
3	49	2018	2023-07-24 13:01:22.094587	2023-07-24 13:01:22.094587
27	2	2015/2016	2023-07-12 13:59:45.191483	2023-07-12 13:59:45.191483
44	2	2003/2004	2023-03-11 10:52:12.57923	2023-03-11 10:52:12.57923
27	12	2015/2016	2023-08-18 19:37:53.599961	2023-08-18 19:37:53.599961
86	12	1986/1987	2023-06-18 01:55:53.343752	2023-06-18 01:55:53.343752
43	55	2020	2023-02-24 21:26:47.128979	2023-02-24 21:26:47.128979
75	35	1988/1989	2023-06-18 19:28:39.443883	2023-06-18 19:28:39.443883
106	53	2022	2023-07-17 21:19:03.032991	2023-07-17 21:19:03.032991
30	72	2019	2023-07-27 10:33:48.273734	2023-07-27 10:33:48.273734
\.


--
-- TOC entry 4877 (class 0 OID 25226)
-- Dependencies: 217
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, team_name, country_id, country_name) FROM stdin;
217	Barcelona	\N	\N
206	Deportivo AlavÃ©s	\N	\N
901	Real Valladolid	\N	\N
902	Huesca	\N	\N
210	Real Sociedad	\N	\N
211	Girona	\N	\N
205	Leganés	\N	\N
215	Athletic Club	\N	\N
207	Valencia	\N	\N
213	Sevilla	\N	\N
218	Real Betis	\N	\N
212	Atlético Madrid	\N	\N
222	Villarreal	\N	\N
214	Espanyol	\N	\N
221	Levante UD	\N	\N
209	Celta Vigo	\N	\N
216	Getafe	\N	\N
322	Eibar	\N	\N
220	Real Madrid	\N	\N
360	Rayo Vallecano	\N	\N
1043	Mallorca	\N	\N
1049	Granada	\N	\N
422	Osasuna	\N	\N
1042	Elche	\N	\N
552	Cádiz	\N	\N
46	Wolverhampton Wanderers	\N	\N
1	Arsenal	\N	\N
38	Tottenham Hotspur	\N	\N
33	Chelsea	\N	\N
59	Aston Villa	\N	\N
29	Everton	\N	\N
47	Middlesbrough	\N	\N
55	Fulham	\N	\N
36	Manchester City	\N	\N
39	Manchester United	\N	\N
24	Liverpool	\N	\N
22	Leicester City	\N	\N
105	Portsmouth	\N	\N
328	Bolton Wanderers	\N	\N
25	Southampton	\N	\N
101	Leeds United	\N	\N
98	Blackburn Rovers	\N	\N
37	Newcastle United	\N	\N
54	Birmingham City	\N	\N
75	Charlton Athletic	\N	\N
\.


--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 221
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 290, true);


--
-- TOC entry 4726 (class 2606 OID 25277)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- TOC entry 4714 (class 2606 OID 25215)
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (competition_id);


--
-- TOC entry 4724 (class 2606 OID 25258)
-- Name: player_positions player_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_positions
    ADD CONSTRAINT player_positions_pkey PRIMARY KEY (player_id, position_id, match_id, from_time);


--
-- TOC entry 4722 (class 2606 OID 25246)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- TOC entry 4720 (class 2606 OID 25239)
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (position_id);


--
-- TOC entry 4716 (class 2606 OID 25220)
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (season_id, competition_id);


--
-- TOC entry 4718 (class 2606 OID 25232)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- TOC entry 4731 (class 2606 OID 25278)
-- Name: cards cards_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 4729 (class 2606 OID 25259)
-- Name: player_positions player_positions_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_positions
    ADD CONSTRAINT player_positions_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 4730 (class 2606 OID 25264)
-- Name: player_positions player_positions_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_positions
    ADD CONSTRAINT player_positions_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(position_id);


--
-- TOC entry 4728 (class 2606 OID 25247)
-- Name: players players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- TOC entry 4727 (class 2606 OID 25221)
-- Name: seasons seasons_competition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_competition_id_fkey FOREIGN KEY (competition_id) REFERENCES public.competitions(competition_id);


-- Completed on 2024-03-30 23:18:01

--
-- PostgreSQL database dump complete
--

