--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-15 20:19:55

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
-- TOC entry 4810 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


\connect postgres

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
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 4810
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 24601)
-- Name: materials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN materials.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.materials.name IS 'Наименование';


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN materials.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.materials.description IS 'Описание материала';


--
-- TOC entry 220 (class 1259 OID 24600)
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.materials ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 24591)
-- Name: motors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.motors (
    name character varying NOT NULL,
    id integer NOT NULL,
    power integer,
    amperage integer,
    ratedspeed integer,
    motor character varying,
    description character varying,
    price integer
);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.name IS 'Наименование';


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.power; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.power IS 'Мощность';


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.amperage; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.amperage IS 'Ток';


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.ratedspeed; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.ratedspeed IS 'Номинальная скорость';


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.motor; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.motor IS 'Мотор';


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.description IS 'Описание мотора';


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN motors.price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.motors.price IS 'Цена';


--
-- TOC entry 218 (class 1259 OID 24590)
-- Name: motors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.motors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.motors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 24577)
-- Name: pumps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pumps (
    name character varying,
    id integer NOT NULL,
    maxpressure integer,
    liquidtemp integer,
    motor integer,
    housingid integer,
    impellerid integer,
    description character varying,
    picture character varying,
    price integer,
    weight numeric
);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.name IS 'Название насоса';


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.maxpressure; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.maxpressure IS 'Максимальное давление';


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.liquidtemp; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.liquidtemp IS 'Температура жидкости';


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.motor; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.motor IS 'Мотор';


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.housingid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.housingid IS 'Материал корпуса';


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.impellerid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.impellerid IS 'Материал рабочего колеса';


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.description IS 'Описание';


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.picture; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.picture IS 'Фото';


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.price IS 'Цена';


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN pumps.weight; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pumps.weight IS 'Вес';


--
-- TOC entry 216 (class 1259 OID 24576)
-- Name: pumps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pumps ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pumps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4804 (class 0 OID 24601)
-- Dependencies: 221
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (7, 'Нержавеющая сталь AISI 321', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (8, 'Нержавеющая сталь AISI 316T', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (9, 'Нержавеющая сталь AISI 316', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (10, 'Нержавеющая сталь AISI 304', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (1, 'Сталь 40x', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (2, 'Чугун  bч50', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (3, 'Нержавеющая сталь AISI 3472', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (11, 'Нержавеющая сталь AISI 5321', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (12, 'Нержавеющая сталь AII 316T', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (13, 'Нержавеющая сталь AI12SI 316', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (14, 'Нержавеющая сталь AISI 3054', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (15, 'Сталь d2', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (16, 'Чугун ni', NULL);
INSERT INTO public.materials OVERRIDING SYSTEM VALUE VALUES (17, 'Нержавеющая сталь AIS51I 347', NULL);


--
-- TOC entry 4802 (class 0 OID 24591)
-- Dependencies: 219
-- Data for Name: motors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('Q6', 13, 220, 500, 200, '212', NULL, 22200);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('Q32', 14, 220, 5000, 500, '231', '', 50000);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('АИР', 1, 220, 10001, 100, '12', NULL, 100);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('АИС', 2, 220, 1000, 100, '12', NULL, 1220);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('4АМН', 3, 220, 1500, 90, '23', NULL, 520);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('АН', 4, 220, 1000, 80, '654', NULL, 400);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('RA', 5, 220, 2000, 404, '213', NULL, 1000);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('A', 6, 220, 500, 200, '212', NULL, 22200);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('IM B34', 7, 220, 5000, 500, '231', '', 50000);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('IM B34', 8, 220, 10001, 100, '12', NULL, 100);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('VEM', 9, 220, 1000, 100, '12', NULL, 1220);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('IE3', 10, 220, 1500, 90, '23', NULL, 520);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('WEG', 11, 220, 1000, 80, '654', NULL, 400);
INSERT INTO public.motors OVERRIDING SYSTEM VALUE VALUES ('W22', 12, 220, 2000, 404, '213', NULL, 1000);


--
-- TOC entry 4800 (class 0 OID 24577)
-- Dependencies: 217
-- Data for Name: pumps; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('POC 235/8 EM', 20, 37, 10, 5, 2, 1, NULL, NULL, 462, 1.1);
INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('RTEW 235/8 EM v3', 15, 22, 23, 1, 7, 7, 'd', 'RTEW_2358_EM_v3', 23, 22);
INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('NOC 25/8 EM', 16, 37, 10, 1, 1, 1, '', 'NOC_258_EM', 123, 22);
INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('REW 235/8 EM', 19, 37, 10, 4, 1, 2, '', 'REW_2358_EM', 672, 11);
INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('TNOC 125/8 EM', 17, 37, 10, 2, 2, 1, '', 'TNOC_1258_EM', 5643, 31);
INSERT INTO public.pumps OVERRIDING SYSTEM VALUE VALUES ('BOC 275/8 EM', 18, 37, 10, 3, 1, 2, '', 'BOC_2758_EM', 123, 44);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 220
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.materials_id_seq', 17, true);


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 218
-- Name: motors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.motors_id_seq', 14, true);


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 216
-- Name: pumps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pumps_id_seq', 20, true);


--
-- TOC entry 4652 (class 2606 OID 24607)
-- Name: materials materials_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pk PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 24609)
-- Name: motors motors_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.motors
    ADD CONSTRAINT motors_pk PRIMARY KEY (id);


--
-- TOC entry 4650 (class 2606 OID 24611)
-- Name: motors motors_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.motors
    ADD CONSTRAINT motors_unique UNIQUE (id);


--
-- TOC entry 4646 (class 2606 OID 24583)
-- Name: pumps pumps_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pumps
    ADD CONSTRAINT pumps_pk PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 24617)
-- Name: pumps pumps_materials_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pumps
    ADD CONSTRAINT pumps_materials_fk FOREIGN KEY (housingid) REFERENCES public.materials(id);


--
-- TOC entry 4654 (class 2606 OID 24622)
-- Name: pumps pumps_materials_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pumps
    ADD CONSTRAINT pumps_materials_fk_1 FOREIGN KEY (impellerid) REFERENCES public.materials(id);


--
-- TOC entry 4655 (class 2606 OID 24612)
-- Name: pumps pumps_motors_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pumps
    ADD CONSTRAINT pumps_motors_fk FOREIGN KEY (motor) REFERENCES public.motors(id);


-- Completed on 2024-04-15 20:19:55

--
-- PostgreSQL database dump complete
--

