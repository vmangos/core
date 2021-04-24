DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201101150417');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201101150417');
-- Add your query below.


-- Add missing Defias Bandit spawns at Thunder Falls.
INSERT INTO `creature` (`guid`, `id`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES
(285070, 116, 0, 0, 0, -9298.77, 625.395, 130.554, 5.20116, 270, 270, 0, 0),
(285071, 116, 0, 0, 0, -9293.34, 643.388, 130.519, 4.8116, 270, 270, 5, 1),
(285072, 116, 0, 0, 0, -9291.3, 656.225, 130.99, 0.630913, 270, 270, 5, 1),
(285073, 116, 0, 0, 0, -9277.15, 662.026, 132.451, 0.26963, 270, 270, 5, 1),
(285074, 116, 0, 0, 0, -9288.27, 666.714, 131.505, 3.53296, 270, 270, 0, 0),
(285075, 116, 0, 0, 0, -9291.1, 677.683, 131.778, 3.51333, 270, 270, 0, 0),
(285076, 116, 0, 0, 0, -9298.55, 679.901, 131.991, 0.756568, 270, 270, 5, 1),
(285077, 116, 0, 0, 0, -9290.11, 689.541, 132.747, 3.74108, 270, 270, 0, 0),
(285078, 116, 0, 0, 0, -9303.64, 707.446, 130.909, 4.21232, 270, 270, 0, 0),
(285079, 116, 0, 0, 0, -9306.15, 713.399, 131.02, 2.37449, 270, 270, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
