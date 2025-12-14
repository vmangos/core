DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240915143011');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240915143011');
-- Add your query below.


-- Add missing Mystlash Flayer spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(5230, 3722, 1, 3866.89, 1300.01, -79.1456, 0.767945, 0, 0, 600, 600),
(5231, 3722, 1, 3733.39, 1299.97, -81.413, 4.64258, 0, 0, 600, 600),
(5232, 3722, 1, 3449.02, 1308.51, -60.2656, 1.53031, 30, 1, 600, 600),
(5233, 3722, 1, 3924.17, 1241.18, -44.137, 2.33822, 30, 1, 600, 600),
(5234, 3722, 1, 3343.69, 1308.61, -15.9832, 5.79809, 30, 1, 600, 600),
(5235, 3722, 1, 3988.73, 1289.33, -26.2588, 0.157889, 30, 1, 600, 600);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
