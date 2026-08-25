DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260717061219');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260717061219');
-- Add your query below.


-- Waypoints for Scarlet Inquisitor.
DELETE FROM `creature_addon` WHERE `guid`=90956;
UPDATE `creature` SET `movement_type`=2 WHERE `guid`=90956;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(90956, 1, 1589.982056, -5308.137695, 68.731827, 100.000000, 0, 0.000000, 0),
(90956, 2, 1593.141968, -5312.082520, 68.731926, 100.000000, 0, 0.000000, 90956),
(90956, 3, 1593.141968, -5312.082520, 68.731926, 5.759586, 8000, 0.000000, 0),
(90956, 4, 1593.795776, -5310.170898, 68.732399, 100.000000, 0, 0.000000, 0),
(90956, 5, 1598.138794, -5304.175293, 68.982216, 100.000000, 0, 0.000000, 0),
(90956, 6, 1604.135620, -5304.768066, 68.732506, 100.000000, 0, 0.000000, 90956),
(90956, 7, 1604.135620, -5304.768066, 68.732506, 4.485496, 6000, 0.000000, 0),
(90956, 8, 1602.254883, -5303.016602, 68.982254, 100.000000, 0, 0.000000, 0),
(90956, 9, 1590.874146, -5299.765137, 68.731995, 100.000000, 0, 0.000000, 0),
(90956, 10, 1590.667114, -5303.792969, 68.731750, 100.000000, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=90956;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(90956, 0, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Inquisitor - Emote Point');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
