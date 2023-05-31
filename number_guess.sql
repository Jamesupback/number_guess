--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_user_id_seq OWNER TO freecodecamp;

--
-- Name: games_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_user_id_seq OWNED BY public.games.user_id;


--
-- Name: time; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public."time" (
    username character varying(22) NOT NULL,
    guesses integer
);


ALTER TABLE public."time" OWNER TO freecodecamp;

--
-- Name: games user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN user_id SET DEFAULT nextval('public.games_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (10, 'user_1685515966427', 5);
INSERT INTO public.games VALUES (1, 'user_1685514828763', 5);
INSERT INTO public.games VALUES (2, 'user_1685514828762', 5);
INSERT INTO public.games VALUES (3, 'yu', 5);
INSERT INTO public.games VALUES (4, 'user_1685515694634', 5);
INSERT INTO public.games VALUES (5, 'user_1685515694633', 5);
INSERT INTO public.games VALUES (6, 'user_1685515772162', 5);
INSERT INTO public.games VALUES (7, 'user_1685515772161', 5);
INSERT INTO public.games VALUES (8, 'user_1685515919791', 5);
INSERT INTO public.games VALUES (9, 'user_1685515919790', 5);
INSERT INTO public.games VALUES (11, 'user_1685515966426', 5);


--
-- Data for Name: time; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public."time" VALUES ('user_1685514828763', 372);
INSERT INTO public."time" VALUES ('user_1685514828763', 888);
INSERT INTO public."time" VALUES ('user_1685514828762', 255);
INSERT INTO public."time" VALUES ('user_1685514828762', 327);
INSERT INTO public."time" VALUES ('user_1685514828763', 69);
INSERT INTO public."time" VALUES ('user_1685514828763', 467);
INSERT INTO public."time" VALUES ('user_1685514828763', 965);
INSERT INTO public."time" VALUES ('user_1685515694634', 785);
INSERT INTO public."time" VALUES ('user_1685515694634', 683);
INSERT INTO public."time" VALUES ('user_1685515694633', 795);
INSERT INTO public."time" VALUES ('user_1685515694633', 916);
INSERT INTO public."time" VALUES ('user_1685515694634', 988);
INSERT INTO public."time" VALUES ('user_1685515694634', 875);
INSERT INTO public."time" VALUES ('user_1685515694634', 470);
INSERT INTO public."time" VALUES ('yu', 1);
INSERT INTO public."time" VALUES ('user_1685515772162', 290);
INSERT INTO public."time" VALUES ('user_1685515772162', 587);
INSERT INTO public."time" VALUES ('user_1685515772161', 604);
INSERT INTO public."time" VALUES ('user_1685515772161', 343);
INSERT INTO public."time" VALUES ('user_1685515772162', 269);
INSERT INTO public."time" VALUES ('user_1685515772162', 51);
INSERT INTO public."time" VALUES ('user_1685515772162', 220);
INSERT INTO public."time" VALUES ('yu', 15);
INSERT INTO public."time" VALUES ('user_1685515919791', 783);
INSERT INTO public."time" VALUES ('user_1685515919791', 1001);
INSERT INTO public."time" VALUES ('user_1685515919790', 770);
INSERT INTO public."time" VALUES ('user_1685515919790', 704);
INSERT INTO public."time" VALUES ('user_1685515919791', 929);
INSERT INTO public."time" VALUES ('user_1685515919791', 660);
INSERT INTO public."time" VALUES ('user_1685515919791', 699);
INSERT INTO public."time" VALUES ('user_1685515966427', 670);
INSERT INTO public."time" VALUES ('user_1685515966427', 874);
INSERT INTO public."time" VALUES ('user_1685515966426', 864);
INSERT INTO public."time" VALUES ('user_1685515966426', 802);
INSERT INTO public."time" VALUES ('user_1685515966427', 901);
INSERT INTO public."time" VALUES ('user_1685515966427', 683);
INSERT INTO public."time" VALUES ('user_1685515966427', 107);


--
-- Name: games_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (user_id);


--
-- Name: games uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT uniq UNIQUE (username);


--
-- Name: time time_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_username_fkey FOREIGN KEY (username) REFERENCES public.games(username);


--
-- PostgreSQL database dump complete
--

