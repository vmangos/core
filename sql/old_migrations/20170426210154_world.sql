INSERT INTO `migrations` VALUES ('20170426210154');

-- Regrowth DoT: ((15/15)(15/15) / (2/3.5 + 15/15)) / 7
UPDATE spell_bonus_data SET dot_bonus=0.09091 WHERE entry=8936;

-- Tranquility: (3.5/3.5/3) / 5
UPDATE spell_bonus_data SET dot_bonus=0.06666 WHERE entry=740;

-- Volley: 1/3/6
INSERT INTO spell_bonus_data (entry, dot_bonus, comments) 
VALUES (1510, 0.05555, 'Hunter - Volley');

-- Mend Pet: (3.5/3.5) / 5
INSERT INTO spell_bonus_data (entry, dot_bonus, comments) 
VALUES (136, 0.2, 'Hunter - Mend Pet');
