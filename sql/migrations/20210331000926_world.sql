DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210331000926');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210331000926');
-- Add your query below.

DELETE FROM `spell_mod` WHERE `Id` = 22766;
DELETE FROM `spell_effect_mod` WHERE `Id` = 22766;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
