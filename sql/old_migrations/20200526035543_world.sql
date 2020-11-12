DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200526035543');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200526035543');
-- Add your query below.


-- Update stats for Thorvald Deepforge and add missing objects around him.
UPDATE `creature_template` SET `faction`=55, `npc_flags`=2, `unit_flags`=512, `speed_walk`=1, `speed_run`=1.14286, `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE `entry`=6030;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416571, 34025, 0, -5855.88, -2643.32, 308.974, 2.62672, 0, 0, 0.967046, 0.254602, 255, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416572, 34026, 0, -5855.47, -2642.44, 308.974, 2.27765, 0, 0, 0.908142, 0.418662, 255, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416573, 34027, 0, -5852.75, -2644.09, 309.968, 4.37205, 0, 0, -0.816641, 0.577146, 255, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416574, 34028, 0, -5854.64, -2643.84, 308.974, 4.93928, 0, 0, -0.622514, 0.782609, 255, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416575, 34029, 0, -5853.54, -2643.08, 309.968, 3.63029, 0, 0, -0.970295, 0.241925, 255, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`) VALUES (416576, 34030, 0, -5852.02, -2647.87, 308.974, 4.06662, 0, 0, -0.894934, 0.446199, 255, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
