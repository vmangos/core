DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180212154254');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180212154254');
-- Add your query below.

-- Update Skeram combat reach so he can reach over the raised sections of the platform
UPDATE `creature_model_info` SET `combat_reach` = 13.5, `bounding_radius` = 8.8 WHERE `modelid` = 15345;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
