DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251205104239');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251205104239');
-- Add your query below.


-- These spawn points Strahbrad should be shared.
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17018;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17015;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17022;
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17021;
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17017;
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17004;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17007;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17011;
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17010;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17012;
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17013;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17023;
UPDATE `creature` SET `id`=2242, `id2`=2319 WHERE `guid`=17025;

-- Assign random movement to spawns in Strahnbrad.
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17026;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17024;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17015;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17019;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17014;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17016;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17007;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17008;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17013;
UPDATE `creature` SET `wander_distance`=1.5, `movement_type`=1 WHERE `guid`=17001;

-- Add missing spawns in Strahnbrad.
INSERT INTO `creature` (`guid`, `id`, `id2`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (17172, 2242, 2319, 0, 686.508, -913.333, 165.031, 5.46288, 2, 1, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `id2`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (17173, 2242, 2319, 0, 743.018, -947.871, 166.228, 0.218435, 2, 1, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `id2`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (17174, 2242, 2319, 0, 749.019, -953.928, 166.228, 3.34455, 1, 1, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (17175, 2242, 0, 658.819, -860.63, 158.498, 0.430102, 5, 1, 300, 480);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
