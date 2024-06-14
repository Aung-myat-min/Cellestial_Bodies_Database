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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(80) NOT NULL,
    age_billion_years integer NOT NULL,
    number_of_planets integer NOT NULL,
    "mass_in_m⊕" numeric(4,2) NOT NULL,
    one_fact text,
    can_live_there boolean NOT NULL
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
    name character varying(80) NOT NULL,
    diameter_in_km integer,
    "mass_in_m⊕" numeric(4,2),
    age_billion_years integer,
    one_fact text,
    can_live_there boolean NOT NULL,
    planet_id integer
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
    name character varying(80) NOT NULL,
    diameter_in_km integer NOT NULL,
    "mass_in_m⊕" numeric(4,2) NOT NULL,
    age_billion_years integer,
    one_fact text,
    can_live_there boolean NOT NULL,
    star_id integer
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
    name character varying(80) NOT NULL,
    "mass_in_m⊕" numeric(4,2) NOT NULL,
    diameter_in_km integer,
    age_billion_years integer,
    one_fact text,
    can_live_there boolean NOT NULL,
    galaxy_id integer
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13, 100, 15.00, 'Contains our Solar System', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 150, 12.00, 'Nearest major galaxy to the Milky Way', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12, 50, 9.00, 'Third-largest in the Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8, 80, 8.00, 'Famous for its spiral structure', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 11, 60, 7.00, 'Bright central bulge', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 9, 120, 11.00, 'One of the largest galaxies', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 0.01, 5, 'Our natural satellite', false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 0.00, 5, 'One of Mars moons', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 0.00, 5, 'Another moon of Mars', false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 3122, 0.01, 5, 'Ice-covered moon of Jupiter', false, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5262, 0.02, 5, 'Largest moon in the Solar System', false, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 5150, 0.02, 5, 'Has a thick atmosphere', false, 4);
INSERT INTO public.moon VALUES (7, 'Enceladus', 504, 0.00, 5, 'Has geysers of water ice', false, 4);
INSERT INTO public.moon VALUES (8, 'Triton', 2706, 0.00, 5, 'Largest moon of Neptune', false, 5);
INSERT INTO public.moon VALUES (9, 'Charon', 1212, 0.00, 5, 'Largest moon of Pluto', false, 5);
INSERT INTO public.moon VALUES (10, 'Proxima Centauri c', 1510, 0.00, 5, 'Exomoon of Proxima b', false, 6);
INSERT INTO public.moon VALUES (11, 'Alpha Centauri Bc', 1230, 0.00, 5, 'Exomoon of Alpha Centauri Bb', false, 7);
INSERT INTO public.moon VALUES (12, 'Kepler-22b I', 800, 0.00, 4, 'Exomoon of Kepler-22b', false, 8);
INSERT INTO public.moon VALUES (13, 'TRAPPIST-1d I', 1100, 0.00, 8, 'Exomoon of TRAPPIST-1d', false, 9);
INSERT INTO public.moon VALUES (14, 'Kepler-452b I', 1000, 0.00, 6, 'Exomoon of Kepler-452b', false, 10);
INSERT INTO public.moon VALUES (15, 'HD 189733 b I', 950, 0.00, 6, 'Exomoon of HD 189733 b', false, 11);
INSERT INTO public.moon VALUES (16, 'Gliese 581g I', 870, 0.00, 8, 'Exomoon of Gliese 581g', false, 12);
INSERT INTO public.moon VALUES (17, 'Pandora', 1440, 0.00, 5, 'Moon of Saturn', false, 4);
INSERT INTO public.moon VALUES (18, 'Miranda', 472, 0.00, 5, 'Moon of Uranus', false, 5);
INSERT INTO public.moon VALUES (19, 'Oberon', 1522, 0.00, 5, 'Another moon of Uranus', false, 5);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1469, 0.02, 5, 'Has a unique two-tone coloration', false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 1.00, 5, 'Our home planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, 0.11, 5, 'The Red Planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 139820, 1.90, 5, 'Largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 116460, 0.57, 5, 'Known for its rings', false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 49244, 0.17, 5, 'Farthest known planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (6, 'Proxima b', 12000, 1.27, 5, 'Closest exoplanet to the Solar System', false, 4);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 14200, 1.10, 5, 'Orbits Alpha Centauri B', false, 4);
INSERT INTO public.planet VALUES (8, 'Kepler-22b', 28000, 2.40, 4, 'Potentially habitable exoplanet', false, 5);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 10400, 0.41, 8, 'In the habitable zone of TRAPPIST-1', false, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 30000, 5.00, 6, 'Earth 2.0', false, 2);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 115000, 1.14, 6, 'Has blue skies and glass rain', false, 2);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 17500, 3.10, 8, 'Potentially habitable', false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 1392000, 5, 'The star of our Solar System', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2.02, 2370000, 0, 'Brightest star in the night sky', false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 16.50, 887000000, 9, 'Red supergiant in Orion', false, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.12, 201400, 5, 'Closest known star to the Sun', false, 2);
INSERT INTO public.star VALUES (5, 'Vega', 2.10, 2640000, 0, 'Brightest star in the Lyra constellation', false, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 18.50, 77400000, 8, 'Blue supergiant in Orion', false, 4);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Milky Way', 'Our home galaxy, containing the Solar System and numerous stars and planets.');
INSERT INTO public.universe VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way, located about 2.537 million light-years away.');
INSERT INTO public.universe VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group, about 3 million light-years from Earth.');
INSERT INTO public.universe VALUES (4, 'Whirlpool', 'Known for its spiral structure and interacting with its companion galaxy NGC 5195.');
INSERT INTO public.universe VALUES (5, 'Sombrero', 'Distinctive galaxy with a large central bulge and a prominent dust lane in its disk.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

