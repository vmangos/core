INSERT INTO `migrations` VALUES ('20170423200012');

-- Ranks of Rip are missing the bleed mechanic in Spell.dbc, add the column to spell_mod
ALTER TABLE `spell_mod` ADD COLUMN `Mechanic` INT(2) NULL DEFAULT -1 AFTER `SpellFamilyFlags`;
INSERT INTO `spell_mod` (`Id`, `Mechanic`, `Comment`) VALUES ('9894', '15', 'Rip (Rank 5) MECHANIC_BLEED');
INSERT INTO `spell_mod` (`Id`, `Mechanic`, `Comment`) VALUES ('9752', '15', 'Rip (Rank 4) MECHANIC_BLEED');
INSERT INTO `spell_mod` (`Id`, `Mechanic`, `Comment`) VALUES ('9493', '15', 'Rip (Rank 3) MECHANIC_BLEED');
INSERT INTO `spell_mod` (`Id`, `Mechanic`, `Comment`) VALUES ('9492', '15', 'Rip (Rank 2) MECHANIC_BLEED');