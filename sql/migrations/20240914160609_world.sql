DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240914160609');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240914160609');
-- Add your query below.


-- Add missing spawns for creature Longsnout.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (113, 119, 0, 0, 0, 0, -9788.9, 646.32, 35.616, 0.376152, 120, 120, 15, 100, 100, 1, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (189, 119, 0, 0, 0, 0, -9848.83, 648.454, 39.7502, 2.28436, 120, 120, 15, 100, 100, 1, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (190, 119, 0, 0, 0, 0, -9876.36, 688.972, 35.3996, 5.31748, 120, 120, 15, 100, 100, 1, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (703, 119, 0, 0, 0, 0, -9932.71, 660.869, 32.7262, 5.23372, 120, 120, 15, 100, 100, 1, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`) VALUES (1448, 119, 0, 0, 0, 0, -9957.65, 675.479, 32.483, 3.74679, 120, 120, 15, 100, 100, 1, 0, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
