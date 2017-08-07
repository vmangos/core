INSERT INTO `migrations` VALUES ('20170420135725');

-- DRUID --

-- Entangling Roots: (1.5/3.5 * 0.95) / 9
UPDATE spell_bonus_data SET dot_bonus=0.04524 WHERE entry=339;

-- Hurricane: (3.5/3.5*0.95/3) / 10
UPDATE spell_bonus_data SET dot_bonus=0.03166 WHERE entry=16914;

-- Insect Swarm: (12/15/0.95) / 6
UPDATE spell_bonus_data SET dot_bonus=0.14035 WHERE entry=5570;

-- Regrowth DoT: ((15/15)(15/15) / (2/3.5 + 15/15)) / 7
UPDATE spell_bonus_data SET dot_bonus=0.09091 WHERE entry=8936;

-- Tranquility: (3.5/3.5/3) / 5
UPDATE spell_bonus_data SET dot_bonus=0.06666 WHERE entry=8936;

-- Healing Touch: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=5185;

-- Wrath: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=5176;


-- MAGE --

-- Arcane Missiles: (3.5/3.5) / 5
UPDATE spell_bonus_data SET direct_bonus=0.2 WHERE entry=7269;

-- Blast Wave: 1.5/3.5/3*0.95
UPDATE spell_bonus_data SET direct_bonus=0.13571 WHERE entry=11113;

-- Cone of Cold: 1.5/3.5/3*0.95
UPDATE spell_bonus_data SET direct_bonus=0.13571 WHERE entry=120;

-- Frostbolt: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=116;

-- Flamestrike Direct: (3/3.5)(3/3.5) / (3/3.5 + 8/15) / 3
UPDATE spell_bonus_data SET direct_bonus=0.17612 WHERE entry=2120;

-- Flamestrike DoT: ((8/15)*(8/15) / (3/3.5 + 8/15) / 3) / 4
UPDATE spell_bonus_data SET dot_bonus=0.01704 WHERE entry=2120;

-- Mana Shield: Should have 0 coefficient
DELETE FROM spell_bonus_data WHERE entry=1463;

-- Pyroblast DoT: 0.7 / 4
UPDATE spell_bonus_data SET dot_bonus=0.175 WHERE entry=11366;


-- PRIEST --

-- Holy Nova: 1.5/3.5/3*0.8
UPDATE spell_bonus_data SET direct_bonus=0.11428 WHERE entry IN (15237,27779,23455,23458,23459,27803,27804,27805);

-- Mana Burn: Should have 0 coefficient
UPDATE spell_bonus_data SET direct_bonus=0 WHERE entry=8129;


-- SHAMAN --

-- Healing Stream: 0.65 / 30
UPDATE spell_bonus_data SET dot_bonus=0.02166 WHERE entry=5672;

-- Healing Wave: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=331;

-- Lightning Bolt: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=403;

-- Magma Totem: (1 / 3) / 10
UPDATE spell_bonus_data SET direct_bonus=0.03333 WHERE entry IN (8187,10579,10580,10581);

-- Searing Totem: 0.08
UPDATE spell_bonus_data SET direct_bonus=0.08 WHERE entry IN (3606,6350,6351,6352,10435,10436);


-- WARLOCK --

-- Hellfire: (3.5/3.5/3) / 15
UPDATE spell_bonus_data SET dot_bonus=0.0222 WHERE entry=1949;

-- Immolate Direct: (2/3.5)(2/3.5) / (2/3.5 + 15/15)
UPDATE spell_bonus_data SET direct_bonus=0.20779 WHERE entry=348;

-- Immolate DoT: ((15/15)(15/15) / (2/3.5 + 15/15)) / 5
UPDATE spell_bonus_data SET dot_bonus=0.12727 WHERE entry=348;

-- Shadow Bolt: Variable cast time - handled by code
DELETE FROM spell_bonus_data WHERE entry=686;
