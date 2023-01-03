DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220822140033');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220822140033');
-- Add your query below.


-- Make Rune of Opening ignore LoS.
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (3407, 4, 'Rune of Opening - Rune of Opening');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
