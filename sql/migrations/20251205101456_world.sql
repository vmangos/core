DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251205101456');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251205101456');
-- Add your query below.


-- Add missing spawn points for Baron Vardus.
UPDATE `creature` SET `wander_distance`=1, `movement_type`=1 WHERE `guid`=16905;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16722, 2306, 0, 695.35, -905.476, 157.694, 0.174533, 1, 1, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16642, 2306, 0, 942.297, -844.993, 114.726, 3.89484, 1, 1, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16644, 2306, 0, 1000.85, -790.671, 108.668, 3.82933, 1, 1, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16571, 2306, 0, 1119.68, -719.64, 71.119, 1.49368, 1, 1, 300, 300);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (2139, 1, 'Baron Vardus - Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2306, 2139, 0, 'Baron Vardus', 0, 0, 10);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
