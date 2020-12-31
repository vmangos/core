DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200729174533');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200729174533');
-- Add your query below.


-- update redridge blackrock orks
UPDATE `creature` SET `position_x` = -9170.93, `position_y` = -2400.95, `position_z` = 104.074, `orientation` = 5.65487 WHERE `guid` = 31810;

UPDATE `creature_movement` SET `script_id` = 3180901 WHERE `id` = 31809 AND `point` = 1;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3180901, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackrock Outrunner 31809 - Run');

UPDATE `creature_movement` SET `waittime` = 0 WHERE `id` = 31809 AND `point` = 1;
UPDATE `creature_movement` SET `waittime` = 10000 WHERE `id` = 31809 AND `point` = 10;

UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 31811;

DELETE FROM `creature` WHERE `guid` IN (31807, 31832);

UPDATE `creature` SET `position_x` = -9156.65, `position_y` = -2513.65, `position_z` = 115.993, `movement_type` = 2 WHERE `guid` = 31833;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3183301, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackrock Outrunner 31833 - Run');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(31833, 1, -9156.65, -2513.65, 115.981, 100, 45000, 0, 3183301),
(31833, 2, -9145.41, -2490.14, 116.751, 100, 0, 0, 0),
(31833, 3, -9156.75, -2454.84, 113.282, 100, 0, 0, 0),
(31833, 4, -9161.11, -2446.5, 111.148, 100, 0, 0, 0),
(31833, 5, -9158.61, -2434.5, 106.876, 100, 0, 0, 0),
(31833, 6, -9164.96, -2420.6, 105.319, 100, 0, 0, 0),
(31833, 7, -9174.89, -2403.74, 104.491, 100, 45000, 0, 0),
(31833, 8, -9169.39, -2420.48, 106.004, 100, 0, 0, 0),
(31833, 9, -9174.43, -2442.38, 114.408, 100, 0, 0, 0),
(31833, 10, -9170.5, -2448.17, 116.441, 100, 0, 0, 0),
(31833, 11, -9158.07, -2465.67, 115.888, 100, 0, 0, 0),
(31833, 12, -9149.25, -2478.14, 115.365, 100, 0, 0, 0),
(31833, 13, -9145.26, -2487.65, 116.262, 100, 0, 0, 0),
(31833, 14, -9146.04, -2503.76, 117.915, 100, 0, 0, 0),
(31833, 15, -9148.71, -2512.97, 117.126, 100, 0, 0, 0),
(31833, 16, -9150.03, -2530.85, 112.715, 100, 0, 0, 0),
(31833, 17, -9149.43, -2549.46, 116.085, 100, 0, 0, 0),
(31833, 18, -9144.39, -2564.02, 116.783, 100, 45000, 0, 0),
(31833, 19, -9138.87, -2560.73, 116.532, 100, 0, 0, 0),
(31833, 20, -9142.3, -2532.23, 114.6, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
