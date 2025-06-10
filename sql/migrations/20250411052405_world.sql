DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250411052405');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250411052405');
-- Add your query below.


-- Add waypoints for Dalaran Wizard.
UPDATE `creature` SET `movement_type`=2, `wander_distance`=0, `position_x`=31.3336, `position_y`=793.583, `position_z`=64.9399, `orientation`=1.92567 WHERE `guid`=17751;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(17751, 1, 31.333551, 793.582703, 64.939934, 100.000000, 0, 0.000000, 0),
(17751, 2, 32.742165, 789.781433, 64.951569, 100.000000, 0, 0.000000, 0),
(17751, 3, 32.609329, 786.525452, 64.951523, 100.000000, 0, 0.000000, 0),
(17751, 4, 19.151802, 785.979736, 64.951523, 100.000000, 0, 0.000000, 0),
(17751, 5, 27.391720, 785.569763, 64.951515, 100.000000, 0, 0.000000, 0),
(17751, 6, 31.333479, 785.707825, 64.951523, 100.000000, 0, 0.000000, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
