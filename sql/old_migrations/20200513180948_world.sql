DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200513180948');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200513180948');
-- Add your query below.


-- Add waypoints for Kruban Darkblade.
UPDATE `creature` SET `movement_type`=2 WHERE `id`=14843;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(14843, 1, 1651.27, -4422.52, 16.14, 6.28295, 0, 0),
(14843, 2, 1665.54, -4412.53, 17.6, 0.795575, 0, 0),
(14843, 3, 1684, -4391.07, 22.67, 0.787724, 0, 0),
(14843, 4, 1699.06, -4375.93, 25.29, 0.787724, 0, 0),
(14843, 5, 1715.77, -4365.03, 27.7, 0.852127, 0, 0),
(14843, 6, 1719.09, -4348.59, 27.15, 1.44117, 0, 0),
(14843, 7, 1716.8, -4331.76, 23.33, 1.87236, 0, 0),
(14843, 8, 1706.47, -4317.06, 16.3, 2.18338, 0, 0),
(14843, 9, 1694.62, -4306.3, 10.01, 2.58943, 0, 0),
(14843, 10, 1685.44, -4300.33, 6.114, 2.78499, 0, 0),
(14843, 11, 1671.51, -4298.55, 2.532, 3.39839, 0, 0),
(14843, 12, 1655.96, -4304.22, 0.995, 3.5162, 0, 0),
(14843, 13, 1637.16, -4320.11, 0.825, 3.85392, 0, 0),
(14843, 14, 1627.85, -4327.88, 1.914, 3.83429, 0, 0),
(14843, 15, 1610.87, -4332.99, 1.813, 3.43373, 0, 0),
(14843, 16, 1591.96, -4344.33, 0.995, 3.67721, 0, 0),
(14843, 17, 1578.1, -4361.44, 1.349, 3.94424, 0, 0),
(14843, 18, 1567.52, -4376.67, 2.124, 4.10525, 0, 0),
(14843, 19, 1560.24, -4391.16, 4.642, 4.24662, 0, 0),
(14843, 20, 1559.32, -4405.13, 7.166, 4.64325, 0, 0),
(14843, 21, 1558.43, -4418.75, 8.334, 4.64717, 0, 0),
(14843, 22, 1578.43, -4435.01, 6.111, 5.59751, 0, 0),
(14843, 23, 1593.42, -4439.46, 6.09, 5.99413, 0, 0),
(14843, 24, 1608.4, -4435.44, 7.85, 0.26465, 0, 0),
(14843, 25, 1629.31, -4427.41, 13.73, 0.358897, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
