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
    name character varying(30) NOT NULL,
    has_black_hole boolean,
    age_in_billions_of_years numeric(6,3),
    number_of_stars_in_billions character varying(20),
    escape_velocity_in_km_per_s integer,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer,
    mean_radius_in_km text,
    shape character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(20) NOT NULL,
    nebula_type character varying(30)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebulae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulae_id_seq OWNER TO freecodecamp;

--
-- Name: nebulae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulae_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean,
    star_id integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_id integer,
    has_planets boolean,
    lifecycle_stage text,
    star_class text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebulae_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Hercules A', true, NULL, NULL, 45, 'Supergiant Elliptical Galaxy');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 13.610, '100-400', 550, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Tadpole Galaxy', NULL, 0.100, NULL, 9217, 'Disrupted Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', true, 0.300, '300', NULL, 'Interacting Galaxies');
INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', true, 10.000, '1000', 470, 'Barred Spiral Galaxy');
INSERT INTO public.galaxy VALUES (6, 'ESO 383-776', NULL, NULL, NULL, 11353, 'Supergiant Elliptical Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, '1737.1', 'scalene ellipsoid');
INSERT INTO public.moon VALUES (2, 'Phobos', 35, '11.267', 'Irregular');
INSERT INTO public.moon VALUES (3, 'Deimos', 35, '6.2', 'Irregular');
INSERT INTO public.moon VALUES (4, 'Io', 36, '1821.6', 'Ellipsoid');
INSERT INTO public.moon VALUES (5, 'Europa', 36, '1560.8', 'Spherical');
INSERT INTO public.moon VALUES (6, 'Ganymede', 36, '2634.1', 'Spherical');
INSERT INTO public.moon VALUES (8, 'Callisto', 36, '2410.3', 'Spherical');
INSERT INTO public.moon VALUES (9, 'Amalthea', 36, '83.5', 'Irregular');
INSERT INTO public.moon VALUES (10, 'Himalia', 36, '69.8', 'Irregular');
INSERT INTO public.moon VALUES (11, 'Mimas', 37, '198.2', 'Spherical');
INSERT INTO public.moon VALUES (12, 'Tethys', 37, '533.1', 'Spherical');
INSERT INTO public.moon VALUES (13, 'Dione', 37, '561.4', 'Spherical');
INSERT INTO public.moon VALUES (14, 'Rhea', 37, '763.8', 'Spherical');
INSERT INTO public.moon VALUES (15, 'Titan', 37, '2574.7', 'Spherical');
INSERT INTO public.moon VALUES (16, 'Phoebe', 37, '106.5', 'Irregular');
INSERT INTO public.moon VALUES (17, 'Umbriel', 38, '58.7', 'Spherical');
INSERT INTO public.moon VALUES (18, 'Oberon', 38, '761.4', 'Spherical');
INSERT INTO public.moon VALUES (19, 'Miranda', 38, '235.8', 'Spherical');
INSERT INTO public.moon VALUES (20, 'Triton', 39, '1353.4', 'Spherical');
INSERT INTO public.moon VALUES (21, 'Actaea', 45, '142', 'Unknown');


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Eagle Nebula', 'H II Region');
INSERT INTO public.nebula VALUES (2, 'Omega Nebula', 'Emission Nebula');
INSERT INTO public.nebula VALUES (3, 'Crab Nebula', 'Supernova Remnant');
INSERT INTO public.nebula VALUES (4, 'Horsehead Nebula', 'Dark Nebula');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 3, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 3, 0);
INSERT INTO public.planet VALUES (34, 'Venus', false, 3, 0);
INSERT INTO public.planet VALUES (35, 'Mars', false, 3, 2);
INSERT INTO public.planet VALUES (36, 'Jupyter', false, 3, 95);
INSERT INTO public.planet VALUES (37, 'Saturn', false, 3, 145);
INSERT INTO public.planet VALUES (38, 'Uranus', false, 3, 27);
INSERT INTO public.planet VALUES (39, 'Neptune', false, 3, 14);
INSERT INTO public.planet VALUES (40, 'Proxima b', false, 7, 0);
INSERT INTO public.planet VALUES (41, 'HR 2562 B', false, 8, NULL);
INSERT INTO public.planet VALUES (42, 'Draugr', false, 9, NULL);
INSERT INTO public.planet VALUES (43, 'Poltergeist', false, 9, NULL);
INSERT INTO public.planet VALUES (44, 'Dimidium', false, 10, NULL);
INSERT INTO public.planet VALUES (45, 'Salacia', false, 3, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 1, false, 'Main-Sequence', 'A');
INSERT INTO public.star VALUES (2, 'Sirius B', 1, false, 'White Dwarf', 'B');
INSERT INTO public.star VALUES (3, 'Sun', 1, true, 'Main Sequence', 'G');
INSERT INTO public.star VALUES (4, 'Rigel', 1, true, 'Blue Supergiant', 'B');
INSERT INTO public.star VALUES (5, 'Beta Andromedae', 5, NULL, 'Red Giant', 'M');
INSERT INTO public.star VALUES (6, 'Aldebaran', 1, true, 'Red Giant', 'K');
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, true, 'Main Sequence', 'M');
INSERT INTO public.star VALUES (8, 'HR 2562', 1, true, 'Main-sequence', 'F');
INSERT INTO public.star VALUES (9, 'PSR B1257+12', 1, true, 'Neutron Star', NULL);
INSERT INTO public.star VALUES (10, '51 Pegasi', 1, true, 'Main-Sequence', 'G');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: nebulae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulae_id_seq', 4, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 45, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


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
-- Name: nebula nebulae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebulae_name_key UNIQUE (name);


--
-- Name: nebula nebulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebulae_pkey PRIMARY KEY (nebula_id);


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

