DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250530191346');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250530191346');
-- Add your query below.


/*
World of Warcraft Client Patch 1.4.0 (2005-04-19)
- Increased the respawn time of Mok'rash in Stranglethorn Vale from 9 
  hours to 2 hours on average.
*/
DELETE FROM `creature` WHERE `id`=1493;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (1672, 1493, 0, 0, 0, 0, 0, -14236.2, 737.019, 2.43126, 3.67262, 32400, 32400, 10, 100, 0, 1, 0, 0, 0, 1);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (1881, 1493, 0, 0, 0, 0, 0, -14236.2, 737.019, 2.43126, 3.67262, 7200, 7200, 10, 100, 0, 1, 0, 0, 2, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
