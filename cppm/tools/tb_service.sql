--
-- PostgreSQL database dump
--

\restrict nMJVpb8mzQhiImTYCuNRnHUPbP0xS3PVh0h5ApzuWSxBVoAZWRd4FjkmZTJeuM3

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
-- Data for Name: tb_service; Type: TABLE DATA; Schema: public; Owner: cppoltp
--

INSERT INTO public.tb_service VALUES (1, 'TOMCAT-CONSOLE', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'TOMCAT-AGENT', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'FILESERVER-HTTPS', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'FILESERVER-HTTP', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'CLUSTER-MANAGER', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NOSQL-CONFIGSVR1', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NOSQL-CONFIGSVR2', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NOSQL-CONFIGSVR3', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'SCHEDULER', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'BATCH-PROCESSOR', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'EPPCMD', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'YUM', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NTP', true, NULL, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'TOMCAT-AUTH', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'FILESERVER-UPLOAD', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'LBCONSOLE', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'LBAGENT', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'LBAUTH', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'LBDIST-HTTP', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'LBDIST-HTTPS', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'DB-EPPOLTP', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'CONNECTOR-EPPOLTP', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NOSQL-MONGOS', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'NOSQL-SHARDSVR', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'CACHED', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'KAFKA-CONSUMER', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'SYSLOG-SENDER', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');
INSERT INTO public.tb_service VALUES (1, 'KAFKA', true, true, 'ABNORMAL', '2026-08-13 16:19:34.288625');


--
-- PostgreSQL database dump complete
--

\unrestrict nMJVpb8mzQhiImTYCuNRnHUPbP0xS3PVh0h5ApzuWSxBVoAZWRd4FjkmZTJeuM3

