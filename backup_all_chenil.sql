--
-- PostgreSQL database cluster dump
--

\restrict rf582QAQAJaWtO6ojQ5BWdmwTuaycEaj2dX9qnvm6zGUa2R3kbnxfrONQR3kUWf

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE antoine;
ALTER ROLE antoine WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:EDEAwfEhciHxXWWQ5f3hig==$FFtt1eMfBUzWnyfcZTKLs7Cw6Wqq+jevcUEOausIdc0=:J4kpUAokD6ubWTc4RA7G72UNfz+ZRuPBFoB3pXeno48=';
CREATE ROLE cassandra;
ALTER ROLE cassandra WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:OTD0cMyR/i+cm6/LKasBiA==$lYkM6/XXhRby0xkP/2Q9udaXCd7JMeB3J0CV8TqjEv4=:uEBJ/b2qOz7GBzr2Id8kyShdFlOC4OuMvLDT791P+GM=';
CREATE ROLE daniel;
ALTER ROLE daniel WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:2OICOfY9GA9MB/2bApiw5Q==$Xnr2wzvYUGCBRQjQqpNaYKpGynl94dleJULQcFeCja4=:Mss6qeFXHbQbG47Rg6T5LLJaJhWivFEFiAVpD2qY7Bo=';
CREATE ROLE data_analyst;
ALTER ROLE data_analyst WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE data_engineer;
ALTER ROLE data_engineer WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE nathalie;
ALTER ROLE nathalie WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE vincent;
ALTER ROLE vincent WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:WdeG+QNwymOhaeH+EiKhAw==$SLQy+7qIg1+3c2f9pXQ/wWPg74+8s3JLiVl4hYXIMsI=:hoFA7B+6/scYWCtp4CTaRdkL/m5qseONoDSv5ZO4dj4=';

--
-- User Configurations
--


--
-- Role memberships
--

GRANT data_analyst TO antoine WITH INHERIT TRUE GRANTED BY daniel;
GRANT data_engineer TO cassandra WITH INHERIT TRUE GRANTED BY daniel;
GRANT data_engineer TO vincent WITH INHERIT TRUE GRANTED BY daniel;






\unrestrict rf582QAQAJaWtO6ojQ5BWdmwTuaycEaj2dX9qnvm6zGUa2R3kbnxfrONQR3kUWf

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict 3wmWJYb1MAB0sC9xx3fAxrczO9GGALXa5ENidhxb4QD1OqmIKvlacaAaL4SeLLm

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- PostgreSQL database dump complete
--

\unrestrict 3wmWJYb1MAB0sC9xx3fAxrczO9GGALXa5ENidhxb4QD1OqmIKvlacaAaL4SeLLm

--
-- Database "chenil_v1" dump
--

