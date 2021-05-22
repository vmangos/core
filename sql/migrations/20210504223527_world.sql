DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210504223527');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210504223527');
-- Add your query below.

-- Make sure Plagued Warrior creatures use the proper Cleave spell.
UPDATE `creature_spells` SET `spellId_1` = 15623 WHERE `entry` = 169840;
-- Crypt Guards shouldn't be immune to Stuns.
UPDATE `creature_template` SET `mechanic_immune_mask` = 1023391482 WHERE `entry` = 16573;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
