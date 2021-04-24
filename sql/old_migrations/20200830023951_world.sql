DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200830023951');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200830023951');
-- Add your query below.


-- Patch 1.12
UPDATE `spell_template` SET `effectBonusCoefficient1`=0.80 WHERE (`entry` IN (1454, 1455, 1456, 11687, 11688, 11689)) && `build` = 5875;
-- No spell power scaling in earlier patches.
UPDATE `spell_template` SET `effectBonusCoefficient1`=0 WHERE (`entry` IN (1454, 1455, 1456, 11687, 11688, 11689)) && `build` < 5875;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
