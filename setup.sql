DROP DATABASE IF EXISTS bird;
CREATE DATABASE bird;
USE bird;

CREATE TABLE `Rank` (
    rank_id     INT NOT NULL AUTO_INCREMENT,
    rank_name   VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY (rank_id)
);

CREATE TABLE Taxon (
    taxon_id            BIGINT NOT NULL AUTO_INCREMENT,
    scientific_name     VARCHAR(50) NOT NULL,
    rank_id             INT NOT NULL,
    parent_taxon_id     BIGINT,
    PRIMARY KEY (taxon_id),
    FOREIGN KEY (rank_id) REFERENCES `Rank`(rank_id),
    FOREIGN KEY (parent_taxon_id) REFERENCES Taxon(taxon_id),
    UNIQUE (scientific_name, rank_id)
);

CREATE TABLE CommonName (
    name_id     BIGINT NOT NULL AUTO_INCREMENT,
    taxon_id    BIGINT NOT NULL,
    language    ENUM('en', 'es', 'fr'),
    name        VARCHAR(50),
    PRIMARY KEY (name_id),
    FOREIGN KEY (taxon_id) REFERENCES Taxon(taxon_id)
);

CREATE TABLE Bird (
    bird_id         BIGINT NOT NULL,
    wingspan_cm     INT,
    weight_g        INT,
    lifespan_yrs    INT,
    is_migratory    BOOLEAN,
    iucn_status     ENUM('EX', 'EW', 'CR', 'EN', 'VU', 'NT', 'LC', 'DD', 'NE'),
    PRIMARY KEY (bird_id),
    FOREIGN KEY (bird_id) REFERENCES Taxon(taxon_id)
);

CREATE TABLE BirdColor (
    bird_id BIGINT NOT NULL,
    area    ENUM('head', 'back', 'wings', 'underside', 'tail'),
    name    VARCHAR(30),
    PRIMARY KEY (bird_id, area),
    FOREIGN KEY (bird_id) REFERENCES Bird(bird_id)
);

CREATE TABLE Habitat (
    habitat_id  BIGINT NOT NULL AUTO_INCREMENT,
    name        VARCHAR(30),
    PRIMARY KEY (habitat_id)
);

CREATE TABLE BirdHabitat (
    bird_id     BIGINT NOT NULL,
    habitat_id  BIGINT NOT NULL,
    PRIMARY KEY (bird_id, habitat_id),
    FOREIGN KEY (bird_id) REFERENCES Bird(bird_id),
    FOREIGN KEY (habitat_id) REFERENCES Habitat(habitat_id)
);

CREATE TABLE Observer (
    observer_id BIGINT NOT NULL AUTO_INCREMENT,
    username    VARCHAR(25) NOT NULL,
    email       VARCHAR(50) UNIQUE,
    PRIMARY KEY (observer_id)
);

CREATE TABLE Location (
    location_id     BIGINT NOT NULL AUTO_INCREMENT,
    latitude        DECIMAL(8,6) NOT NULL,
    longitude       DECIMAL(9,6) NOT NULL,
    name            VARCHAR(50) NOT NULL,
    country         VARCHAR(30),
    habitat_id      BIGINT NOT NULL,
    PRIMARY KEY (location_id),
    FOREIGN KEY (habitat_id) REFERENCES Habitat(habitat_id)
);

CREATE TABLE Observation (
    observation_id  BIGINT NOT NULL AUTO_INCREMENT,
    observer_id     BIGINT NOT NULL,
    bird_id         BIGINT NOT NULL,
    location_id     BIGINT NOT NULL,
    observation_dt  DATETIME,
    count           INT,
    notes           VARCHAR(1000),
    PRIMARY KEY (observation_id),
    FOREIGN KEY (observer_id) REFERENCES Observer(observer_id),
    FOREIGN KEY (bird_id) REFERENCES Bird(bird_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Media (
    media_id        BIGINT NOT NULL AUTO_INCREMENT,
    media_type      ENUM('photo', 'audio'),
    bird_id         BIGINT NOT NULL,
    observer_id     BIGINT NOT NULL,
    observation_id  BIGINT,
    url             VARCHAR(250),
    PRIMARY KEY (media_id),
    FOREIGN KEY (bird_id) REFERENCES Taxon(taxon_id),
    FOREIGN KEY (observer_id) REFERENCES Observer(observer_id),
    FOREIGN KEY (observation_id) REFERENCES Observation(observation_id)
);