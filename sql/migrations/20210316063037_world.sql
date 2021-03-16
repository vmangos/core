DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210316063037');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210316063037');
-- Add your query below.


-- Remove PvP flag from some mobs that shouldn't have it.
UPDATE `creature_template` SET `flags_extra`= `flags_extra` - 524288 WHERE (`flags_extra` & 524288) && `entry` IN (3024, 3454, 3455, 10618, 10619, 10919, 11196, 11198, 11806, 11835, 14622, 15177, 16241, 16285, 16781, 17635, 17647);
UPDATE `creature_template` SET `flags_extra`= `flags_extra` - 8 WHERE (`flags_extra` & 8) && `entry` IN (3024, 3454, 3455, 10618, 10619, 10919, 11196, 11198, 11806, 11835, 14622, 15177, 16241, 16285, 16781, 17635, 17647);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
