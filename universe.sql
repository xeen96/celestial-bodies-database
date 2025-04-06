--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    center_of_galaxy boolean
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    radius_in_light_years integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_radius_in_km numeric,
    planet_id integer,
    albedo numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_radius_in_km numeric,
    star_id integer,
    satelites integer,
    atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    radius_in_km integer,
    type character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1, true);
INSERT INTO public.black_hole VALUES (2, 'Andromeda SMBH', 2, true);
INSERT INTO public.black_hole VALUES (3, 'Triangulum BH-1', 3, false);
INSERT INTO public.black_hole VALUES (4, 'Sombrero Nucleus', 4, true);
INSERT INTO public.black_hole VALUES (5, 'Whirlpool X-1', 5, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 52850, 'The Milky Way is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 152000, 'The Andromeda Galaxy is a barred spiral galaxy and is the nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 30000, 'The Triangulum Galaxy is a spiral galaxy in the Local Group, known for its active star formation');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 49000, 'The Sombrero Galaxy is a spiral galaxy with a prominent dust lane and a bright central bulge');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 60000, 'The Whirlpool Galaxy is a grand-design spiral galaxy interacting with a smaller companion galaxy');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 60000, 'Centaurus A is a peculiar elliptical galaxy with a strong radio source and a prominent dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.4, 1, 0.12);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.1, 2, 0.07);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 2, 0.08);
INSERT INTO public.moon VALUES (4, 'Betelgeuse II-M1', 1500, 6, 0.15);
INSERT INTO public.moon VALUES (5, 'Betelgeuse II-M2', 800, 6, 0.10);
INSERT INTO public.moon VALUES (6, 'Betelgeuse II-M3', 2000, 6, 0.20);
INSERT INTO public.moon VALUES (7, 'Sirius A-1-M1', 1200, 7, 0.14);
INSERT INTO public.moon VALUES (8, 'Sirius A-3-M1', 1800, 9, 0.18);
INSERT INTO public.moon VALUES (9, 'Sirius A-3-M2', 900, 9, 0.11);
INSERT INTO public.moon VALUES (10, 'Sirius A-3-M3', 2500, 9, 0.25);
INSERT INTO public.moon VALUES (11, 'Sirius A-3-M4', 600, 9, 0.09);
INSERT INTO public.moon VALUES (12, 'Andromeda I-A-M1', 1400, 10, 0.13);
INSERT INTO public.moon VALUES (13, 'Andromeda I-A-M2', 700, 10, 0.08);
INSERT INTO public.moon VALUES (14, 'Andromeda I-C-M1', 1600, 12, 0.16);
INSERT INTO public.moon VALUES (15, 'Andromeda II-A-M1', 1300, 13, 0.12);
INSERT INTO public.moon VALUES (16, 'Andromeda II-A-M2', 850, 13, 0.10);
INSERT INTO public.moon VALUES (17, 'Andromeda II-A-M3', 1900, 13, 0.19);
INSERT INTO public.moon VALUES (18, 'Andromeda II-B-M1', 1100, 14, 0.14);
INSERT INTO public.moon VALUES (19, 'Triangulum A-2-M1', 1700, 16, 0.17);
INSERT INTO public.moon VALUES (20, 'Triangulum A-2-M2', 950, 16, 0.11);
INSERT INTO public.moon VALUES (21, 'Triangulum B-1-M1', 2000, 18, 0.22);
INSERT INTO public.moon VALUES (22, 'Triangulum B-1-M2', 1200, 18, 0.15);
INSERT INTO public.moon VALUES (23, 'Triangulum B-1-M3', 3000, 18, 0.30);
INSERT INTO public.moon VALUES (24, 'Triangulum B-1-M4', 800, 18, 0.09);
INSERT INTO public.moon VALUES (25, 'Triangulum B-1-M5', 1500, 18, 0.13);
INSERT INTO public.moon VALUES (26, 'Sombrero P-1-M1', 1400, 20, 0.16);
INSERT INTO public.moon VALUES (27, 'Sombrero P-1-M2', 650, 20, 0.08);
INSERT INTO public.moon VALUES (28, 'Sombrero P-3-M1', 1800, 22, 0.20);
INSERT INTO public.moon VALUES (29, 'Sombrero P-3-M2', 1000, 22, 0.12);
INSERT INTO public.moon VALUES (30, 'Sombrero P-3-M3', 2200, 22, 0.25);
INSERT INTO public.moon VALUES (31, 'Whirlpool X-1-M1', 1300, 23, 0.14);
INSERT INTO public.moon VALUES (32, 'Whirlpool X-3-M1', 1900, 25, 0.18);
INSERT INTO public.moon VALUES (33, 'Whirlpool X-3-M2', 900, 25, 0.10);
INSERT INTO public.moon VALUES (34, 'Whirlpool X-3-M3', 2600, 25, 0.27);
INSERT INTO public.moon VALUES (35, 'Whirlpool X-3-M4', 700, 25, 0.09);
INSERT INTO public.moon VALUES (36, 'Whirlpool Y-1-M1', 1500, 26, 0.15);
INSERT INTO public.moon VALUES (37, 'Whirlpool Y-1-M2', 800, 26, 0.11);
INSERT INTO public.moon VALUES (38, 'Whirlpool Y-3-M1', 1700, 28, 0.17);
INSERT INTO public.moon VALUES (39, 'Whirlpool Y-4-M1', 2100, 29, 0.23);
INSERT INTO public.moon VALUES (40, 'Whirlpool Y-4-M2', 1100, 29, 0.13);
INSERT INTO public.moon VALUES (41, 'Whirlpool Y-4-M3', 2800, 29, 0.28);
INSERT INTO public.moon VALUES (42, 'Whirlpool Y-4-M4', 950, 29, 0.10);
INSERT INTO public.moon VALUES (43, 'Whirlpool Y-4-M5', 1600, 29, 0.16);
INSERT INTO public.moon VALUES (44, 'Whirlpool Y-4-M6', 3000, 29, 0.31);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371, 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 3390, 1, 2, true);
INSERT INTO public.planet VALUES (3, 'Venus', 6052, 1, 0, true);
INSERT INTO public.planet VALUES (4, 'Mercury', 2439, 1, 0, false);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 4500, 2, 0, false);
INSERT INTO public.planet VALUES (6, 'Betelgeuse II', 12000, 2, 3, true);
INSERT INTO public.planet VALUES (7, 'Sirius A-1', 7800, 3, 1, true);
INSERT INTO public.planet VALUES (8, 'Sirius A-2', 3200, 3, 0, false);
INSERT INTO public.planet VALUES (9, 'Sirius A-3', 15000, 3, 4, true);
INSERT INTO public.planet VALUES (10, 'Andromeda I-A', 5600, 4, 2, true);
INSERT INTO public.planet VALUES (11, 'Andromeda I-B', 2800, 4, 0, false);
INSERT INTO public.planet VALUES (12, 'Andromeda I-C', 8900, 4, 1, true);
INSERT INTO public.planet VALUES (13, 'Andromeda II-A', 6700, 5, 3, true);
INSERT INTO public.planet VALUES (14, 'Andromeda II-B', 4300, 5, 1, false);
INSERT INTO public.planet VALUES (15, 'Triangulum A-1', 5200, 6, 0, true);
INSERT INTO public.planet VALUES (16, 'Triangulum A-2', 9500, 6, 2, true);
INSERT INTO public.planet VALUES (17, 'Triangulum A-3', 3100, 6, 0, false);
INSERT INTO public.planet VALUES (18, 'Triangulum B-1', 13000, 7, 5, true);
INSERT INTO public.planet VALUES (19, 'Triangulum B-2', 4700, 7, 1, false);
INSERT INTO public.planet VALUES (20, 'Sombrero P-1', 6900, 8, 2, true);
INSERT INTO public.planet VALUES (21, 'Sombrero P-2', 3400, 8, 0, false);
INSERT INTO public.planet VALUES (22, 'Sombrero P-3', 11000, 8, 3, true);
INSERT INTO public.planet VALUES (23, 'Whirlpool X-1', 5800, 9, 1, true);
INSERT INTO public.planet VALUES (24, 'Whirlpool X-2', 2700, 9, 0, false);
INSERT INTO public.planet VALUES (25, 'Whirlpool X-3', 14000, 9, 4, true);
INSERT INTO public.planet VALUES (26, 'Whirlpool Y-1', 7200, 10, 2, true);
INSERT INTO public.planet VALUES (27, 'Whirlpool Y-2', 3900, 10, 0, false);
INSERT INTO public.planet VALUES (28, 'Whirlpool Y-3', 9800, 10, 1, true);
INSERT INTO public.planet VALUES (29, 'Whirlpool Y-4', 16000, 10, 6, true);
INSERT INTO public.planet VALUES (30, 'Whirlpool Y-5', 4500, 10, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 696000, 'G-type main-sequence');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 617000000, 'Red supergiant');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 1190000, 'A-type main-sequence');
INSERT INTO public.star VALUES (4, 'Andromeda I', 2, 850000, 'K-type giant');
INSERT INTO public.star VALUES (5, 'Andromeda II', 2, 430000000, 'Red supergiant');
INSERT INTO public.star VALUES (6, 'Triangulum A', 3, 980000, 'F-type main-sequence');
INSERT INTO public.star VALUES (7, 'Triangulum B', 3, 25000000, 'Blue supergiant');
INSERT INTO public.star VALUES (8, 'Sombrero Star', 4, 720000, 'G-type main-sequence');
INSERT INTO public.star VALUES (9, 'Whirlpool X', 5, 1500000, 'B-type main-sequence');
INSERT INTO public.star VALUES (10, 'Whirlpool Y', 5, 300000000, 'Red giant');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 44, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 30, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: black_hole black_hole_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name UNIQUE (name);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

