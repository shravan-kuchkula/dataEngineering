--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: shravan
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.departments OWNER TO shravan;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: shravan
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    salary integer,
    department_id integer
);


ALTER TABLE public.employees OWNER TO shravan;

--
-- Name: employees_projects; Type: TABLE; Schema: public; Owner: shravan
--

CREATE TABLE public.employees_projects (
    project_id integer,
    employee_id integer
);


ALTER TABLE public.employees_projects OWNER TO shravan;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: shravan
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying NOT NULL,
    start_date date,
    end_date date,
    budget integer
);


ALTER TABLE public.projects OWNER TO shravan;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: shravan
--

COPY public.departments (id, name) FROM stdin;
1	Reporting
2	Engineering
3	Marketing
4	Biz Dev
5	Silly Walks
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: shravan
--

COPY public.employees (id, first_name, last_name, salary, department_id) FROM stdin;
1	John	Smith	20000	1
2	Ava	Muffinson	10000	5
3	Cailin	Ninson	30000	2
4	Mike	Peterson	20000	2
5	Ian	Peterson	80000	2
6	John	Mills	50000	3
\.


--
-- Data for Name: employees_projects; Type: TABLE DATA; Schema: public; Owner: shravan
--

COPY public.employees_projects (project_id, employee_id) FROM stdin;
2	1
3	2
1	3
1	4
1	5
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: shravan
--

COPY public.projects (id, title, start_date, end_date, budget) FROM stdin;
1	Build a cool site	2011-10-28	2012-01-26	1000000
2	Update TPS Reports	2011-07-20	2011-10-28	100000
3	Design 3 New Silly Walks	2009-05-11	2009-08-19	100
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: shravan
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: shravan
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: shravan
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

