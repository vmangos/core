DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210926112414');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210926112414');
-- Add your query below.

 SET @LOVE_IS_IN_THE_AIR_CGUID = 3484;
 
-- Missing NPCs

INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `patch_min`) VALUES
(@LOVE_IS_IN_THE_AIR_CGUID+1, 16005, 0, -8813.1, 613.857, 95.2532, 3.15905, 120, 120, 0, 0, 7);

-- Gossip Fixes

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
