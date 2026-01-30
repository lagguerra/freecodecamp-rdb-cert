--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(75) NOT NULL,
    description text,
    distance_from_earth integer,
    galaxy_types_id integer NOT NULL,
    age_in_millions_of_years integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    notes character varying(100)
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(75) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_spherical boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(75) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    medium_temperature numeric(6,2),
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    notes character varying(100)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(75) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', 'Description 1', 1380, 3, 20500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 'Description 2', 4593, 5, 15397);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Description 3', 76895, 2, 65478);
INSERT INTO public.galaxy VALUES (4, 'Ambartsumians Knot', 'Description 4', 980564, 7, 98346);
INSERT INTO public.galaxy VALUES (5, 'Antennnae Galaxies', 'Description 5', 1345791, 6, 1256834);
INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 'Description 6', 7654834, 8, 3246781);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular', NULL);
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', NULL);
INSERT INTO public.galaxy_types VALUES (5, 'Active', NULL);
INSERT INTO public.galaxy_types VALUES (6, 'Seyfert', NULL);
INSERT INTO public.galaxy_types VALUES (7, 'Quasars', NULL);
INSERT INTO public.galaxy_types VALUES (8, 'Blazars', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', 'Description 1', 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Description 2', 1, true);
INSERT INTO public.moon VALUES (3, 'Amalthea', 'Description 3', 2, true);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Description 4', 2, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'Description 5', 2, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Description 6', 2, true);
INSERT INTO public.moon VALUES (7, 'Io', 'Description 7', 2, true);
INSERT INTO public.moon VALUES (8, 'Dione', 'Description 8', 5, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Description 9', 5, true);
INSERT INTO public.moon VALUES (10, 'Hyperion', 'Description 10', 5, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'Description 11', 5, true);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Description 12', 5, true);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Description 13', 5, true);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Description 14', 5, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Description 15', 5, true);
INSERT INTO public.moon VALUES (16, 'Titan', 'Description 16', 5, true);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Description 17', 7, true);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Description 18', 7, true);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Description 19', 7, true);
INSERT INTO public.moon VALUES (20, 'Titania', 'Description 20', 7, true);
INSERT INTO public.moon VALUES (21, 'Umbriel', 'Description 21', 7, true);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Description 22', 10, true);
INSERT INTO public.moon VALUES (23, 'Triton', 'Description 23', 10, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Description 1', false, true, 123456, 150.00, 1, 12);
INSERT INTO public.planet VALUES (2, 'Venus', 'Description 2', false, false, 212345, 300.00, 3, 15);
INSERT INTO public.planet VALUES (3, 'Mars', 'Description 3', true, true, 187659, 210.00, 5, 7);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Description 4', false, true, 156791, 400.00, 6, 10);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Description 5', false, true, 123468, 275.00, 2, 2);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Description 6', false, true, 165673, 500.00, 4, 12);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Description 7', false, true, 190987, 220.00, 5, 17);
INSERT INTO public.planet VALUES (8, 'CoRoT-7b', 'Description 8', false, true, 112314, 1000.00, 6, 8);
INSERT INTO public.planet VALUES (9, 'Gliese 581', 'Description 9', false, true, 213472, 100.00, 4, 18);
INSERT INTO public.planet VALUES (10, 'HIP 13044b', 'Description 10', false, true, 276547, 475.00, 6, 13);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Description 11', false, true, 213457, 640.00, 3, 10);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 'Description 12', false, true, 198976, 610.00, 4, 16);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Chthonian', NULL);
INSERT INTO public.planet_types VALUES (2, 'Carbon', NULL);
INSERT INTO public.planet_types VALUES (3, 'Coreless', NULL);
INSERT INTO public.planet_types VALUES (4, 'Desert', NULL);
INSERT INTO public.planet_types VALUES (5, 'Gas Dwarf', NULL);
INSERT INTO public.planet_types VALUES (6, 'Gas Giant', NULL);
INSERT INTO public.planet_types VALUES (7, 'Helium', NULL);
INSERT INTO public.planet_types VALUES (8, 'Hycean', NULL);
INSERT INTO public.planet_types VALUES (9, 'Ice', NULL);
INSERT INTO public.planet_types VALUES (10, 'Iron', NULL);
INSERT INTO public.planet_types VALUES (11, 'Lava', NULL);
INSERT INTO public.planet_types VALUES (12, 'Ocean', NULL);
INSERT INTO public.planet_types VALUES (13, 'Protoplanet', NULL);
INSERT INTO public.planet_types VALUES (14, 'Puffy', NULL);
INSERT INTO public.planet_types VALUES (15, 'Soot', NULL);
INSERT INTO public.planet_types VALUES (16, 'Steam', NULL);
INSERT INTO public.planet_types VALUES (17, 'Super-puff', NULL);
INSERT INTO public.planet_types VALUES (18, 'Silicate', NULL);
INSERT INTO public.planet_types VALUES (19, 'Terrestrial', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Description 1', 123456, 1);
INSERT INTO public.star VALUES (2, 'Canopus', 'Description 2', 467289, 2);
INSERT INTO public.star VALUES (3, 'Arcturus', 'Description 3', 362891, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 'Description 4', 980174, 4);
INSERT INTO public.star VALUES (5, 'Hadar', 'Description 5', 645781, 5);
INSERT INTO public.star VALUES (6, 'Antares', 'Description 6', 278196, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 8, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 23, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 19, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_key UNIQUE (name);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_key UNIQUE (name);


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
-- Name: galaxy_types type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT type_key UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type_id FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_type_id FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

