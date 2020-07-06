DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200706205532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200706205532');
-- Add your query below.


-- grom gol base camp
-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94748, 1064, 0, 0, 0, 0, 0, 0, -12384.4, 173.336, 3.24808, 1.01615, 300, 300, 0, 100, 0, 2, 0, 0, 0, 10);

-- add grom gol grunt waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(94748, 1, -12369, 154.027, 2.97559, 100, 50000, 0, 0),
(94748, 2, -12371.6, 155.394, 2.81416, 100, 0, 0, 0),
(94748, 3, -12374.4, 156.719, 2.84573, 100, 0, 0, 0),
(94748, 4, -12380.2, 158.36, 2.84261, 100, 0, 0, 0),
(94748, 5, -12388.9, 157.468, 2.67425, 100, 0, 0, 0),
(94748, 6, -12393.7, 153.945, 2.73388, 100, 0, 0, 0),
(94748, 7, -12396.6, 148.972, 2.8709, 100, 0, 0, 0),
(94748, 8, -12396.6, 138.978, 3.66229, 100, 13000, 0, 0),
(94748, 9, -12397.1, 140.612, 3.55516, 100, 0, 0, 0),
(94748, 10, -12397.2, 146.16, 3.04669, 100, 0, 0, 0),
(94748, 11, -12396.1, 152.329, 2.80381, 100, 0, 0, 0),
(94748, 12, -12390.6, 163.016, 2.46791, 100, 0, 0, 0),
(94748, 13, -12384.4, 173.336, 3.14583, 100, 13000, 0, 0);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94749, 1064, 0, 0, 0, 0, 0, 0, -12372.8, 179.325, 3.28885, 2.89725, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94750, 1064, 0, 0, 0, 0, 0, 0, -12374, 184.474, 3.24808, 3.34054, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add correct waypoints to grom gol grunt
DELETE FROM `creature_movement` WHERE `id` = 610;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(610, 1, -12383.7, 227.084, 2.67865, 100, 13000, 0, 0),
(610, 2, -12384.2, 224.195, 2.64434, 100, 0, 0, 0),
(610, 3, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 4, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 5, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 6, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 7, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 8, -12391.9, 195.553, 1.84427, 3.03687, 78000, 0, 0),
(610, 9, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 10, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 11, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 12, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 13, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 14, -12384.2, 224.195, 2.64434, 100, 0, 0, 0);

-- commander aggro gosh should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 721;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
