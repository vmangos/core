DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190613155759');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190613155759');
-- Add your query below.


-- Remove mod of Itch spells.
DELETE FROM `spell_mod` WHERE `Id`=25185;
DELETE FROM `spell_effect_mod` WHERE `Id`=25185;
DELETE FROM `spell_effect_mod` WHERE `Id`=26077;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
