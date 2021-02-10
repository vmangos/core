DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201002171825');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201002171825');
-- Add your query below.


-- The Dark Portal spawns
-- Spawn Felguard Elite
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203275, 8717, -11835.7, -3253.5, -25.9082, 5.2709, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203278, 8717, -11817.6, -3237.61, -29.7055, 5.8294, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203291, 8717, -11843.4, -3229.34, -26.4251, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203279, 8717, -11803.8, -3217.06, -30.651, 6.03884, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203282, 8717, -11802.3, -3192.65, -29.7192, 0.0698132, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203298, 8717, -11805.5, -3170.9, -30.4301, 0.436332, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203303, 8717, -11815.9, -3148.64, -27.1289, 0.541052, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203307, 8717, -11832.4, -3133.45, -26.8395, 5.23599, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203306, 8717, -11853.6, -3158.95, -27.7374, 0.0523599, 0, 0);

-- Spawn Doomguard Commander
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203289, 12396, -11850.3, -3250.76, -27.4681, 0.523599, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203290, 12396, -11858.5, -3236.31, -24.6962, 0.279253, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203308, 12396, -11873.2, -3165.44, -27.055, 5.91667, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203309, 12396, -11863.4, -3146.96, -25.6828, 5.55015, 0, 0);

-- Spawn Manahound
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203281, 8718, -11824.3, -3215.66, -30.9589, 5.23638, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`) VALUES (203304, 8718, -11827.2, -3154.9, -29.7552, 4.30938, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
