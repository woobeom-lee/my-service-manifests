--
-- PostgreSQL database dump
--

\restrict xISV77NR3aAsQqdSYvMn9rJv5zHn5cTHGm5i5qbDQCP8yhCFujCemzUzDRrICB7

-- Dumped from database version 15.14
-- Dumped by pg_dump version 15.14

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
-- Data for Name: tb_server; Type: TABLE DATA; Schema: public; Owner: cppoltp
--

INSERT INTO public.tb_server VALUES (1, 'MAIN', '10.128.88.28', 'wkdsksRNfjrl99!!', '2026-08-13 16:19:46.087604', 'NORMAL', '1.0.25.11-2', '1.0.25.11-2', NULL, NULL, NULL, NULL, NULL, NULL, true, NULL, NULL, NULL, NULL);


--
-- Name: tb_server_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cppoltp
--

SELECT pg_catalog.setval('public.tb_server_server_id_seq', 33, true);


--
-- PostgreSQL database dump complete
--

\unrestrict xISV77NR3aAsQqdSYvMn9rJv5zHn5cTHGm5i5qbDQCP8yhCFujCemzUzDRrICB7

