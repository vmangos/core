DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210731173049');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210731173049');
-- Add your query below.


-- Add an extra position after point 15 in Kaya Flathoof's path to reduce run back distance.
UPDATE `creature_movement_scripts` SET `id`=1185618 WHERE `id`=1185617;
UPDATE `creature_movement_scripts` SET `id`=1185620 WHERE `id`=1185619;
DELETE FROM `creature_movement_special` WHERE `id`=11856;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(11856, 1, 113.91, -350.13, 4.55, 0, 0, 0, 0),
(11856, 2, 109.54, -350.08, 3.74, 0, 0, 0, 0),
(11856, 3, 106.95, -353.4, 3.6, 0, 0, 0, 0),
(11856, 4, 100.28, -338.89, 2.97, 0, 0, 0, 0),
(11856, 5, 110.11, -320.26, 3.47, 0, 0, 0, 0),
(11856, 6, 109.78, -287.8, 5.3, 0, 0, 0, 0),
(11856, 7, 105.02, -269.71, 4.71, 0, 0, 0, 0),
(11856, 8, 86.71, -251.81, 5.34, 0, 0, 0, 0),
(11856, 9, 64.1, -246.38, 5.91, 0, 0, 0, 0),
(11856, 10, -2.55, -243.58, 6.3, 0, 0, 0, 0),
(11856, 11, -27.78, -267.53, -1.08, 0, 0, 0, 0),
(11856, 12, -31.27, -283.54, -4.36, 0, 0, 0, 0),
(11856, 13, -28.96, -322.44, -9.19, 0, 0, 0, 0),
(11856, 14, -35.63, -360.03, -16.59, 0, 0, 0, 0),
(11856, 15, -58.3, -412.26, -30.6, 0, 0, 0, 0),
(11856, 16, -61.09, -443.92, -37.56, 0, 0, 0, 0),
(11856, 17, -58.88, -474.17, -44.54, 0, 0, 0, 0),
(11856, 18, -45.92, -496.57, -46.26, 100, 5000, 0, 1185618),
(11856, 19, -40.25, -510.07, -46.05, 0, 0, 0, 0),
(11856, 20, -38.88, -520.72, -46.06, 100, 5000, 0, 1185620);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
