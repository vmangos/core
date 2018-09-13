DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180913154659');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180913154659');
-- Add your query below.


-- Prevent mage armors from stacking before 1.11.
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (168, 3, 34078720, 'Frost Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (6117, 3, 268435456, 'Mage Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (7300, 3, 34078720, 'Frost Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (7301, 3, 34078720, 'Frost Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (7302, 3, 34078720, 'Ice Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (7320, 3, 34078720, 'Ice Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (10219, 3, 34078720, 'Ice Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (10220, 3, 34078720, 'Ice Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (22782, 3, 268435456, 'Mage Armor');
INSERT INTO `spell_mod` (`ID`, `SpellFamilyName`, `SpellFamilyFlags`, `Comment`) VALUES (22783, 3, 268435456, 'Mage Armor');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
