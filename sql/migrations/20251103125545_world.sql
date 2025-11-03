DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251103132426');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251103132426');
-- Add your query below.


-- Warsong Gulch Herald
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (93762, 14645, 0, 0, 0, 0, 489, 1452.99, 1395.65, 355.476, 1.51844, 1000, 1000, 0, 100, 100, 0, 0, 0, 3, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (93763, 14645, 0, 0, 0, 0, 489, 1259.1, 1415.26, 312.358, 0.139626, 1000, 1000, 0, 100, 100, 0, 0, 0, 3, 10);

-- PvP CTF Credit Marker
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (93764, 14732, 0, 0, 0, 0, 489, 1234.84, 1598.22, 313.684, 0.05236, 1000, 1000, 0, 100, 100, 0, 0, 0, 3, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
