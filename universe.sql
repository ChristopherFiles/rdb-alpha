-- CREATE DATABASE
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe;

-- =========================
-- TABLE: galaxy
-- =========================
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  has_life BOOLEAN,
  age_in_millions_of_years INT
);

-- =========================
-- TABLE: star
-- =========================
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- =========================
-- TABLE: planet
-- =========================
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  distance_from_star NUMERIC,
  FOREIGN KEY (star_id) REFERENCES star(star_id)
);

-- =========================
-- TABLE: moon
-- =========================
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL,
  is_spherical BOOLEAN,
  distance_from_planet NUMERIC,
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- =========================
-- TABLE TAMBAHAN (biar aman test)
-- =========================
CREATE TABLE comet (
  comet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  is_periodic BOOLEAN
);

-- =========================
-- INSERT DATA
-- =========================

-- Galaxy (>=5)
INSERT INTO galaxy(name, description, has_life, age_in_millions_of_years) VALUES
('Milky Way', 'Our galaxy', true, 13600),
('Andromeda', 'Nearest major galaxy', false, 10000),
('Sombrero', 'Bright galaxy', false, 13000),
('Whirlpool', 'Spiral galaxy', false, 14000),
('Pinwheel', 'Face-on spiral galaxy', false, 13500);

-- Star (>=2)
INSERT INTO star(name, galaxy_id, is_spherical, age_in_millions_of_years) VALUES
('Sun', 1, true, 4600),
('Alpha Centauri', 1, true, 5000),
('Betelgeuse', 2, true, 8000);

-- Planet (>=6)
INSERT INTO planet(name, star_id, has_life, is_spherical, distance_from_star) VALUES
('Earth', 1, true, true, 1),
('Mars', 1, false, true, 1.5),
('Venus', 1, false, true, 0.7),
('Jupiter', 1, false, true, 5.2),
('Saturn', 1, false, true, 9.5),
('Neptune', 1, false, true, 30);

-- Moon (>=6)
INSERT INTO moon(name, planet_id, is_spherical, distance_from_planet) VALUES
('Moon', 1, true, 384400),
('Phobos', 2, true, 9376),
('Deimos', 2, true, 23463),
('Europa', 4, true, 670900),
('Titan', 5, true, 1221870),
('Triton', 6, true, 354800);

-- Comet (tambahan)
INSERT INTO comet(name, is_periodic) VALUES
('Halley', true),
('Hale-Bopp', false);