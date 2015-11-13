--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.0
-- Dumped by pg_dump version 9.3.0
-- Started on 2014-09-24 16:36:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 172 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 172
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 188967)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    nome character varying(50),
    id bigint NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 188972)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_id_seq OWNER TO postgres;

--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 171
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 1823 (class 2604 OID 188974)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 1933 (class 0 OID 188967)
-- Dependencies: 170
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (nome, id) FROM stdin;
deivid	1
deivid	2
deivid	3
deivid	4
deivid	5
deivid	6
deivid	7
deivid	8
deivid	9
deivid	10
deivid	11
deivid	12
deivid	13
deivid	14
deivid	15
deivid	16
deivid	17
deivid	18
deivid	19
deivid	20
deivid	21
deivid	22
deivid	23
deivid	24
deivid	25
deivid	26
deivid	27
deivid	28
deivid	29
deivid	30
deivid	31
deivid	32
deivid	33
deivid	34
deivid	35
deivid	36
deivid	37
deivid	38
deivid	39
deivid	40
deivid	41
deivid	42
deivid	43
deivid	44
deivid	45
deivid	46
deivid	47
deivid	48
deivid	49
deivid	50
deivid	51
deivid	52
deivid	53
deivid	54
deivid	55
deivid	56
deivid	57
deivid	58
deivid	59
deivid	60
deivid	61
deivid	62
deivid	63
deivid	64
deivid	65
deivid	66
deivid	67
deivid	68
deivid	69
deivid	70
deivid	71
deivid	72
deivid	73
deivid	74
deivid	75
deivid	76
deivid	77
deivid	78
deivid	79
deivid	80
deivid	81
deivid	82
deivid	83
deivid	84
deivid	85
deivid	86
deivid	87
deivid	88
deivid	89
deivid	90
deivid	91
deivid	92
deivid	93
deivid	94
deivid	95
deivid	96
deivid	97
deivid	98
deivid	99
deivid	100
deivid	101
deivid	102
deivid	103
deivid	104
deivid	105
deivid	106
deivid	107
deivid	108
deivid	109
deivid	110
deivid	111
deivid	112
deivid	113
deivid	114
deivid	115
deivid	116
deivid	117
deivid	118
deivid	119
deivid	120
deivid	121
deivid	122
deivid	123
deivid	124
deivid	125
deivid	126
deivid	127
deivid	128
deivid	129
deivid	130
deivid	131
deivid	132
deivid	133
deivid	134
deivid	135
deivid	136
deivid	137
deivid	138
deivid	139
deivid	140
deivid	141
deivid	142
deivid	143
deivid	144
deivid	145
deivid	146
deivid	147
deivid	148
deivid	149
deivid	150
deivid	151
deivid	152
deivid	153
deivid	154
deivid	155
deivid	156
deivid	157
deivid	158
deivid	159
deivid	160
deivid	161
deivid	162
deivid	163
deivid	164
deivid	165
deivid	166
deivid	167
deivid	168
deivid	169
deivid	170
deivid	171
deivid	172
deivid	173
deivid	174
deivid	175
deivid	176
deivid	177
deivid	178
deivid	179
deivid	180
deivid	181
deivid	182
deivid	183
deivid	184
deivid	185
deivid	186
deivid	187
deivid	188
deivid	189
deivid	190
deivid	191
deivid	192
deivid	193
deivid	194
deivid	195
deivid	196
deivid	197
deivid	198
deivid	199
deivid	200
deivid	201
deivid	202
deivid	203
deivid	204
deivid	205
deivid	206
deivid	207
deivid	208
deivid	209
deivid	210
deivid	211
deivid	212
deivid	213
deivid	214
deivid	215
deivid	216
deivid	217
deivid	218
deivid	219
deivid	220
deivid	221
deivid	222
deivid	223
deivid	224
deivid	225
\.


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 171
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 225, true);


--
-- TOC entry 1825 (class 2606 OID 188979)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-09-24 16:36:59

--
-- PostgreSQL database dump complete
--


