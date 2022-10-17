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
    number_guesses integer,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50),
    best_game integer,
    games_played integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 401, 1);
INSERT INTO public.games VALUES (4, 385, 2);
INSERT INTO public.games VALUES (5, 11, 3);
INSERT INTO public.games VALUES (6, 864, 4);
INSERT INTO public.games VALUES (7, 705, 5);
INSERT INTO public.games VALUES (8, 596, 6);
INSERT INTO public.games VALUES (8, 842, 7);
INSERT INTO public.games VALUES (9, 755, 8);
INSERT INTO public.games VALUES (9, 259, 9);
INSERT INTO public.games VALUES (8, 588, 10);
INSERT INTO public.games VALUES (8, 863, 11);
INSERT INTO public.games VALUES (8, 20, 12);
INSERT INTO public.games VALUES (10, 754, 13);
INSERT INTO public.games VALUES (10, 244, 14);
INSERT INTO public.games VALUES (11, 884, 15);
INSERT INTO public.games VALUES (11, 516, 16);
INSERT INTO public.games VALUES (10, 727, 17);
INSERT INTO public.games VALUES (10, 307, 18);
INSERT INTO public.games VALUES (10, 677, 19);
INSERT INTO public.games VALUES (5, 9, 20);
INSERT INTO public.games VALUES (12, 386, 21);
INSERT INTO public.games VALUES (12, 276, 22);
INSERT INTO public.games VALUES (13, 415, 23);
INSERT INTO public.games VALUES (13, 944, 24);
INSERT INTO public.games VALUES (12, 780, 25);
INSERT INTO public.games VALUES (12, 804, 26);
INSERT INTO public.games VALUES (12, 276, 27);
INSERT INTO public.games VALUES (14, 717, 28);
INSERT INTO public.games VALUES (14, 511, 29);
INSERT INTO public.games VALUES (15, 408, 30);
INSERT INTO public.games VALUES (15, 95, 31);
INSERT INTO public.games VALUES (14, 420, 32);
INSERT INTO public.games VALUES (14, 56, 33);
INSERT INTO public.games VALUES (14, 399, 34);
INSERT INTO public.games VALUES (16, 949, 35);
INSERT INTO public.games VALUES (16, 947, 36);
INSERT INTO public.games VALUES (17, 349, 37);
INSERT INTO public.games VALUES (17, 804, 38);
INSERT INTO public.games VALUES (16, 550, 39);
INSERT INTO public.games VALUES (16, 889, 40);
INSERT INTO public.games VALUES (16, 802, 41);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (5, 'Iisak', 9, 1);
INSERT INTO public.users VALUES (2, 'user_1666035354508', 308, 0);
INSERT INTO public.users VALUES (1, 'user_1666035354509', 46, 0);
INSERT INTO public.users VALUES (13, 'user_1666036624526', 415, 2);
INSERT INTO public.users VALUES (4, 'user_1666035572477', 385, 0);
INSERT INTO public.users VALUES (12, 'user_1666036624527', 276, 5);
INSERT INTO public.users VALUES (3, 'user_1666035572478', 33, 0);
INSERT INTO public.users VALUES (15, 'user_1666036739087', 95, 2);
INSERT INTO public.users VALUES (7, 'user_1666035894911', 203, 0);
INSERT INTO public.users VALUES (6, 'user_1666035894912', 146, 0);
INSERT INTO public.users VALUES (14, 'user_1666036739088', 56, 5);
INSERT INTO public.users VALUES (9, 'user_1666036143874', 259, 0);
INSERT INTO public.users VALUES (8, 'user_1666036143875', 20, 0);
INSERT INTO public.users VALUES (17, 'user_1666036745225', 349, 2);
INSERT INTO public.users VALUES (16, 'user_1666036745226', 550, 5);
INSERT INTO public.users VALUES (11, 'user_1666036535708', 516, 2);
INSERT INTO public.users VALUES (10, 'user_1666036535709', 244, 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 41, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

