DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240925012737');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240925012737');
-- Add your query below.


-- Add missing Deep Sea Threshadon spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86872, 2188, 1, 8205.18, -942.167, -24.0992, 5.52606, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86881, 2188, 1, 8141.94, -932.122, -22.4119, 4.78307, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86895, 2188, 1, 8197.71, -1212.46, -51.4801, 4.93622, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86899, 2188, 1, 8287.17, -1227.98, -79.8464, 1.18987, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86900, 2188, 1, 8346.42, -1096.5, -82.6515, 3.75184, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86926, 2188, 1, 8283.3, -1096.47, -64.8594, 0.0400507, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (86933, 2188, 1, 8253.2, -1117.77, -59.4172, 1.84882, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (87016, 2188, 1, 8143.82, -1092.24, -18.2926, 4.04637, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (87017, 2188, 1, 8223.68, -971.797, -46.0062, 1.82997, 300, 300, 8, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES (87018, 2188, 1, 8059.41, -894.016, -23.4058, 5.15614, 300, 300, 8, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
