INSERT INTO `migrations` VALUES ('20170403013711');

-- Add the passive attribute to argent dawn trinkets
DELETE FROM spell_mod WHERE Id IN (17670,24198,23930);
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (17670, 16777552, 'Argent Dawn Comission - Passive Spell');
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (24198, 16777424, 'Rune of the Dawn - Passive Spell');
INSERT INTO spell_mod (Id, Attributes, `Comment`) VALUES (23930, 16777424, 'Seal of the Dawn - Passive Spell');