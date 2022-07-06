DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220617120610');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220617120610');
-- Add your query below.


-- Remove effect mod of Gnomish Battle Chicken to fix summon duration.
DELETE FROM `spell_effect_mod` WHERE `Id`=23133;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
