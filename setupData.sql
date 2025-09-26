INSERT INTO `Rank` (rank_name)
VALUES ('kingdom'),('phylum'),('class'),('order'),('family'),('genus'),('species');

SET @rk_kingdom := (SELECT rank_id FROM `Rank` WHERE rank_name='kingdom');
SET @rk_phylum  := (SELECT rank_id FROM `Rank` WHERE rank_name='phylum');
SET @rk_class   := (SELECT rank_id FROM `Rank` WHERE rank_name='class');
SET @rk_order   := (SELECT rank_id FROM `Rank` WHERE rank_name='order');
SET @rk_family  := (SELECT rank_id FROM `Rank` WHERE rank_name='family');
SET @rk_genus   := (SELECT rank_id FROM `Rank` WHERE rank_name='genus');
SET @rk_species := (SELECT rank_id FROM `Rank` WHERE rank_name='species');

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id)
VALUES ('Animalia', @rk_kingdom, NULL);
SET @animalia_id := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id)
VALUES ('Chordata', @rk_phylum, @animalia_id);
SET @chordata_id := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id)
VALUES ('Aves', @rk_class, @chordata_id);
SET @aves_id := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Passeriformes',   @rk_order, @aves_id); SET @ord_passeriformes   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Anseriformes',    @rk_order, @aves_id); SET @ord_anseriformes    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Accipitriformes', @rk_order, @aves_id); SET @ord_accipitriformes := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Falconiformes',   @rk_order, @aves_id); SET @ord_falconiformes   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Strigiformes',    @rk_order, @aves_id); SET @ord_strigiformes    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Columbiformes',   @rk_order, @aves_id); SET @ord_columbiformes   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Apodiformes',     @rk_order, @aves_id); SET @ord_apodiformes     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Sphenisciformes', @rk_order, @aves_id); SET @ord_sphenisciformes := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Turdidae',     @rk_family, @ord_passeriformes);    SET @fam_turdidae     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Paridae',      @rk_family, @ord_passeriformes);    SET @fam_paridae      := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Corvidae',     @rk_family, @ord_passeriformes);    SET @fam_corvidae     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Fringillidae', @rk_family, @ord_passeriformes);    SET @fam_fringillidae := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Anatidae',     @rk_family, @ord_anseriformes);     SET @fam_anatidae     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Accipitridae', @rk_family, @ord_accipitriformes);  SET @fam_accipitridae := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Falconidae',   @rk_family, @ord_falconiformes);    SET @fam_falconidae   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Strigidae',    @rk_family, @ord_strigiformes);     SET @fam_strigidae    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Columbidae',   @rk_family, @ord_columbiformes);    SET @fam_columbidae   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Trochilidae',  @rk_family, @ord_apodiformes);      SET @fam_trochilidae  := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Spheniscidae', @rk_family, @ord_sphenisciformes);  SET @fam_spheniscidae := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Turdus',      @rk_genus, @fam_turdidae);     SET @gen_turdus      := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Poecile',     @rk_genus, @fam_paridae);      SET @gen_poecile     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Corvus',      @rk_genus, @fam_corvidae);     SET @gen_corvus      := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Spinus',      @rk_genus, @fam_fringillidae); SET @gen_spinus      := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Anas',        @rk_genus, @fam_anatidae);     SET @gen_anas        := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Buteo',       @rk_genus, @fam_accipitridae); SET @gen_buteo       := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Falco',       @rk_genus, @fam_falconidae);   SET @gen_falco       := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Bubo',        @rk_genus, @fam_strigidae);    SET @gen_bubo        := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Zenaida',     @rk_genus, @fam_columbidae);   SET @gen_zenaida     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Archilochus', @rk_genus, @fam_trochilidae);  SET @gen_archilochus := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Aptenodytes', @rk_genus, @fam_spheniscidae); SET @gen_aptenodytes := LAST_INSERT_ID();

INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Turdus migratorius',    @rk_species, @gen_turdus);      SET @sp_robin        := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Poecile atricapillus',  @rk_species, @gen_poecile);     SET @sp_chickadee    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Corvus brachyrhynchos', @rk_species, @gen_corvus);      SET @sp_crow         := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Spinus tristis',        @rk_species, @gen_spinus);      SET @sp_goldfinch    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Anas platyrhynchos',    @rk_species, @gen_anas);        SET @sp_mallard      := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Buteo jamaicensis',     @rk_species, @gen_buteo);       SET @sp_redtail      := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Falco peregrinus',      @rk_species, @gen_falco);       SET @sp_peregrine    := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Bubo virginianus',      @rk_species, @gen_bubo);        SET @sp_great_horned := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Zenaida macroura',      @rk_species, @gen_zenaida);     SET @sp_mourning     := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Archilochus colubris',  @rk_species, @gen_archilochus); SET @sp_rubythroat   := LAST_INSERT_ID();
INSERT INTO Taxon (scientific_name, rank_id, parent_taxon_id) VALUES ('Aptenodytes forsteri',  @rk_species, @gen_aptenodytes); SET @sp_emperor      := LAST_INSERT_ID();

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'American Robin' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Zorzal americano' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Merle d’Amérique' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Black-capped Chickadee' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Carbonero cabecinegro' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Mésange à tête noire' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'American Crow' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Cuervo americano' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'American Goldfinch' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Jilguero americano' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Chardonneret jaune' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Mallard' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Ánade real' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Canard colvert' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Red-tailed Hawk' FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Ratonero de cola roja' FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Peregrine Falcon' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Halcón peregrino' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Faucon pèlerin' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Great Horned Owl' FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Búho cornudo' FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Mourning Dove' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Tórtola triste' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Ruby-throated Hummingbird' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'es', 'Colibrí gorgirrubí' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Colibri à gorge rubis' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species;

INSERT INTO CommonName (taxon_id, language, name)
SELECT taxon_id, 'en', 'Emperor Penguin' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'fr', 'Manchot empereur' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species;

INSERT INTO Bird (bird_id, wingspan_cm, weight_g, lifespan_yrs, is_migratory, iucn_status)
SELECT taxon_id, 39,   77,    6,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 20,   11,   12,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 100,  450,  8,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 23,   14,   9,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 95,   1100, 10, TRUE, 'LC' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 125,  1100, 20, TRUE, 'LC' FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 105,  900,  15, TRUE, 'LC' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 110,  1400, 13, FALSE,'LC' FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 46,   120,  5,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 11,   3,    5,  TRUE, 'LC' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 120,  30000,20, TRUE, 'NT' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'orange/red' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'orange' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'back', 'gray-brown' FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'black cap' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'white' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'back', 'gray' FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'black' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'wings', 'black' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'black' FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'black cap' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'wings', 'black with white bars' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'bright yellow' FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'green' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'wings', 'brown/gray' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'tail', 'black curl' FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'back', 'brown mottled' FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'tail', 'red' FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'slate-gray' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'barred white' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'wings', 'dark gray' FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'ear tufts' FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'barred brown' FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'gray-brown' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'pale buff' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'wings', 'gray with black spots' FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'head', 'ruby' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'back', 'green iridescent' FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species;

INSERT INTO BirdColor (bird_id, area, name)
SELECT taxon_id, 'back', 'black' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'underside', 'white' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species
UNION ALL SELECT taxon_id, 'head', 'black with yellow auriculars' FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species;

INSERT INTO Habitat (name)
VALUES ('Forest'),('Grassland'),('Wetland'),('Desert'),('Urban'),('Coastal'),('Mountain'),('Tundra'),('Farmland'),('Lake/River');

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Urban','Forest','Farmland')
WHERE t.scientific_name='Turdus migratorius' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Forest','Urban')
WHERE t.scientific_name='Poecile atricapillus' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Urban','Forest','Farmland','Grassland')
WHERE t.scientific_name='Corvus brachyrhynchos' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Grassland','Farmland','Urban')
WHERE t.scientific_name='Spinus tristis' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Wetland','Lake/River','Urban')
WHERE t.scientific_name='Anas platyrhynchos' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Grassland','Mountain','Farmland')
WHERE t.scientific_name='Buteo jamaicensis' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Coastal','Mountain','Urban')
WHERE t.scientific_name='Falco peregrinus' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Forest','Mountain')
WHERE t.scientific_name='Bubo virginianus' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Urban','Farmland','Grassland')
WHERE t.scientific_name='Zenaida macroura' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Forest')
WHERE t.scientific_name='Archilochus colubris' AND t.rank_id=@rk_species;

INSERT INTO BirdHabitat (bird_id, habitat_id)
SELECT t.taxon_id, h.habitat_id FROM Taxon t JOIN Habitat h ON h.name IN ('Coastal','Tundra')
WHERE t.scientific_name='Aptenodytes forsteri' AND t.rank_id=@rk_species;

INSERT INTO Observer (username, email)
VALUES
  ('birdnerd', 'birdnerd@example.com'),
  ('skywatch', 'skywatch@example.com'),
  ('duckdoc',  'duckdoc@example.com'),
  ('owlnight', 'owlnight@example.com'),
  ('ethanW',   'ethan@example.com');

INSERT INTO Location (latitude, longitude, name, country, habitat_id)
VALUES
  (40.76078, -111.89105, 'Liberty Park',        'USA', (SELECT habitat_id FROM Habitat WHERE name='Urban')),
  (40.34309, -111.64930, 'Utah Lake State Park', 'USA', (SELECT habitat_id FROM Habitat WHERE name='Lake/River')),
  (40.57700, -111.65500, 'Wasatch Foothills',   'USA', (SELECT habitat_id FROM Habitat WHERE name='Mountain')),
  (41.00000, -111.90000, 'Farm Fields North',   'USA', (SELECT habitat_id FROM Habitat WHERE name='Farmland')),
  (40.25000, -111.65000, 'City Creek',          'USA', (SELECT habitat_id FROM Habitat WHERE name='Urban')),
  (48.85661,   2.35222, 'Seine Riverside',      'France', (SELECT habitat_id FROM Habitat WHERE name='Urban')),
  (51.50735,  -0.12776, 'Hyde Park',            'UK', (SELECT habitat_id FROM Habitat WHERE name='Urban')),
  (34.01945, -118.49119, 'Santa Monica Beach',  'USA', (SELECT habitat_id FROM Habitat WHERE name='Coastal')),
  (64.20084, -149.49367, 'Alaskan Tundra',      'USA', (SELECT habitat_id FROM Habitat WHERE name='Tundra')),
  (-77.84190, 166.68630, 'Ross Ice Shelf Edge', 'Antarctica', (SELECT habitat_id FROM Habitat WHERE name='Coastal'));

INSERT INTO Observation (observer_id, bird_id, location_id, observation_dt, count, notes)
VALUES
  ((SELECT observer_id FROM Observer WHERE username='birdnerd'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Liberty Park'),
   '2025-05-10 08:15:00', 3, 'Foraging on lawn'),
  ((SELECT observer_id FROM Observer WHERE username='birdnerd'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Liberty Park'),
   '2025-05-10 08:20:00', 5, 'Males bright yellow'),
  ((SELECT observer_id FROM Observer WHERE username='skywatch'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Wasatch Foothills'),
   '2025-06-01 11:30:00', 1, 'Soaring over ridge'),
  ((SELECT observer_id FROM Observer WHERE username='duckdoc'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Utah Lake State Park'),
   '2025-04-22 07:45:00', 12, 'Mixed flock near boat ramp'),
  ((SELECT observer_id FROM Observer WHERE username='owlnight'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Wasatch Foothills'),
   '2025-03-15 21:10:00', 1, 'Heard hooting'),
  ((SELECT observer_id FROM Observer WHERE username='ethanW'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='City Creek'),
   '2025-02-10 09:05:00', 7, 'Very vocal'),
  ((SELECT observer_id FROM Observer WHERE username='ethanW'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Poecile atricapillus' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Hyde Park'),
   '2025-07-12 10:25:00', 2, 'At feeder area'),
  ((SELECT observer_id FROM Observer WHERE username='skywatch'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Santa Monica Beach'),
   '2025-08-03 16:40:00', 1, 'Dive near pier'),
  ((SELECT observer_id FROM Observer WHERE username='duckdoc'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Farm Fields North'),
   '2025-05-19 06:55:00', 9, 'Feeding on ground'),
  ((SELECT observer_id FROM Observer WHERE username='skywatch'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Seine Riverside'),
   '2025-06-20 13:00:00', 1, 'At red flowers'),
  ((SELECT observer_id FROM Observer WHERE username='birdnerd'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Ross Ice Shelf Edge'),
   '2025-01-10 12:00:00', 40, 'Large colony on ice'),
  ((SELECT observer_id FROM Observer WHERE username='ethanW'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Hyde Park'),
   '2025-07-12 10:35:00', 4, 'Bathing in pond'),
  ((SELECT observer_id FROM Observer WHERE username='owlnight'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='City Creek'),
   '2025-06-18 18:10:00', 1, 'Perched on building'),
  ((SELECT observer_id FROM Observer WHERE username='duckdoc'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Utah Lake State Park'),
   '2025-04-22 08:10:00', 6, 'Second group near reeds'),
  ((SELECT observer_id FROM Observer WHERE username='skywatch'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Liberty Park'),
   '2025-05-15 09:00:00', 3, 'At seed heads'),
  ((SELECT observer_id FROM Observer WHERE username='birdnerd'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Liberty Park'),
   '2025-05-10 08:10:00', 6, 'Scavenging near bins'),
  ((SELECT observer_id FROM Observer WHERE username='ethanW'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Wasatch Foothills'),
   '2025-06-01 12:05:00', 1, 'Hover over hillside'),
  ((SELECT observer_id FROM Observer WHERE username='owlnight'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Wasatch Foothills'),
   '2025-03-16 05:30:00', 1, 'Pre-dawn silhouette'),
  ((SELECT observer_id FROM Observer WHERE username='duckdoc'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Farm Fields North'),
   '2025-05-20 07:10:00', 4, 'On fence line'),
  ((SELECT observer_id FROM Observer WHERE username='ethanW'),
   (SELECT taxon_id FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species),
   (SELECT location_id FROM Location WHERE name='Seine Riverside'),
   '2025-06-20 13:10:00', 1, 'Hover feed');

INSERT INTO Media (media_type, bird_id, observer_id, observation_id, url)
VALUES
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Turdus migratorius' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='birdnerd'),
    (SELECT observation_id FROM Observation WHERE notes='Foraging on lawn' LIMIT 1),
    'https://s3.example.com/media/robin_lawn_1.jpg'),
  ('audio',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Spinus tristis' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='birdnerd'),
    (SELECT observation_id FROM Observation WHERE notes='Males bright yellow' LIMIT 1),
    'https://s3.example.com/media/goldfinch_song_1.mp3'),
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Buteo jamaicensis' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='skywatch'),
    (SELECT observation_id FROM Observation WHERE notes='Soaring over ridge' LIMIT 1),
    'https://s3.example.com/media/redtail_soar.jpg'),
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Anas platyrhynchos' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='duckdoc'),
    (SELECT observation_id FROM Observation WHERE notes='Mixed flock near boat ramp' LIMIT 1),
    'https://s3.example.com/media/mallards_group.jpg'),
  ('audio',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Bubo virginianus' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='owlnight'),
    (SELECT observation_id FROM Observation WHERE notes='Heard hooting' LIMIT 1),
    'https://s3.example.com/media/gh_owl_hoot.mp3'),
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Falco peregrinus' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='owlnight'),
    NULL,
    'https://s3.example.com/media/peregrine_urban_perch.jpg'),
  ('audio',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Corvus brachyrhynchos' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='ethanW'),
    (SELECT observation_id FROM Observation WHERE notes='Very vocal' LIMIT 1),
    'https://s3.example.com/media/crow_calls_city.mp3'),
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Aptenodytes forsteri' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='birdnerd'),
    (SELECT observation_id FROM Observation WHERE notes='Large colony on ice' LIMIT 1),
    'https://s3.example.com/media/emperor_penguins_colony.jpg'),
  ('photo',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Zenaida macroura' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='duckdoc'),
    NULL,
    'https://s3.example.com/media/mourning_dove_fence.jpg'),
  ('audio',
    (SELECT taxon_id FROM Taxon WHERE scientific_name='Archilochus colubris' AND rank_id=@rk_species),
    (SELECT observer_id FROM Observer WHERE username='skywatch'),
    (SELECT observation_id FROM Observation WHERE notes='At red flowers' LIMIT 1),
    'https://s3.example.com/media/ruby_throated_hum_buzz.mp3');