--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE user_db;
--
-- Name: user_db; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE user_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE user_db OWNER TO freecodecamp;

\connect user_db

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1679507501159', 2, 175);
INSERT INTO public.users VALUES ('user_1679507616843', 2, 512);
INSERT INTO public.users VALUES ('user_1679507501160', 4, 135);
INSERT INTO public.users VALUES ('user_1679507739253', 2, 216);
INSERT INTO public.users VALUES ('user_1679507616844', 4, 139);
INSERT INTO public.users VALUES ('user_1679507511968', 2, 246);
INSERT INTO public.users VALUES ('user_1679507511969', 4, 59);
INSERT INTO public.users VALUES ('user_1679507739254', 5, 384);
INSERT INTO public.users VALUES ('user_1679507640518', 2, 396);
INSERT INTO public.users VALUES ('user_1679507525478', 2, 16);
INSERT INTO public.users VALUES ('user_1679507640519', 5, 15);
INSERT INTO public.users VALUES ('user_1679507525479', 4, 167);
INSERT INTO public.users VALUES ('user_1679507752722', 2, 341);
INSERT INTO public.users VALUES ('user_1679507559203', 2, 145);
INSERT INTO public.users VALUES ('user_1679507677194', 2, 521);
INSERT INTO public.users VALUES ('user_1679507752723', 5, 102);
INSERT INTO public.users VALUES ('user_1679507559204', 5, 114);
INSERT INTO public.users VALUES ('user_1679507677195', 5, 138);
INSERT INTO public.users VALUES ('user_1679507574902', 2, 442);
INSERT INTO public.users VALUES ('user_1679507862665', 1, 758);
INSERT INTO public.users VALUES ('user_1679507686533', 1, 978);
INSERT INTO public.users VALUES ('user_1679507574903', 5, 296);
INSERT INTO public.users VALUES ('user_1679507862666', 4, 47);
INSERT INTO public.users VALUES ('user_1679507686534', 5, 46);
INSERT INTO public.users VALUES ('user_1679507700916', 2, 29);
INSERT INTO public.users VALUES ('user_1679508129723', 2, 295);
INSERT INTO public.users VALUES ('user_1679507700917', 4, 677);
INSERT INTO public.users VALUES ('user_1679508129724', 5, 28);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

