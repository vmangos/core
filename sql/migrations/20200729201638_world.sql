DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200729201638');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200729201638');
-- Add your query below.


-- gina lang summon imp
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 5750;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (575001, 5750, 0, 11, 0, 100, 0, 0, 0, 0, 0, 575001, 0, 0, 'Gina Lang - Summon Imp on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (575001, 0, 15, 11939, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gina Lang - Summon Imp on Spawn');

-- allow doreen beltis to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 31918;

-- allow jamie nore to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 31921;

-- allow shelene rhobart to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 38289;

-- set oliver dwor orientation
UPDATE `creature` SET `orientation` = 4.72669 WHERE `guid` = 38290;

-- remove incorrect deathguard elite
DELETE FROM `creature` WHERE `guid` = 14369;

-- junior apothecary holland - say OOC
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10665;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1066501, 10665, 0, 1, 0, 100, 1, 10000, 20000, 40000, 60000, 1066501, 0, 0, 'Junior Apothecary Holland - Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066501, 0, 39, 1066501, 1066502, 0, 0, 0, 0, 0, 4, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5955, 5956, 5957, 5958, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1066502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5959, 5960, 5961, 5962, 0, 0, 0, 0, 0, 'Junior Apothecary Holland - Talk');

-- add creature 44663 waypoints
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 44663;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(44663, 1, 2670.4, 299.348, 28.1209, 100, 0, 0, 0),
(44663, 2, 2659, 308.383, 28.1209, 100, 10000, 0, 0),
(44663, 4, 2694.44, 284.565, 28.1151, 100, 0, 0, 0),
(44663, 5, 2711.32, 279.584, 28.1184, 100, 0, 0, 0),
(44663, 6, 2727.12, 277.08, 28.1184, 100, 0, 0, 0),
(44663, 7, 2740.19, 275.201, 28.1198, 100, 0, 0, 0),
(44663, 8, 2754.3, 273.36, 28.1338, 100, 0, 0, 0),
(44663, 9, 2768.79, 271.439, 28.1206, 100, 0, 0, 0),
(44663, 10, 2782.44, 270.605, 28.1205, 100, 0, 0, 0),
(44663, 11, 2793.84, 271.129, 28.1198, 100, 0, 0, 0),
(44663, 12, 2802.25, 278.473, 28.1451, 100, 0, 0, 0),
(44663, 13, 2806.9, 291.665, 29.6271, 100, 0, 0, 0),
(44663, 14, 2804.57, 283.452, 28.1978, 100, 0, 0, 0),
(44663, 15, 2798.09, 273.742, 28.1256, 100, 0, 0, 0),
(44663, 16, 2787.49, 270.564, 28.1214, 100, 0, 0, 0),
(44663, 17, 2774.76, 270.973, 28.1196, 100, 0, 0, 0),
(44663, 18, 2761.13, 272.343, 28.1236, 100, 0, 0, 0),
(44663, 19, 2746.7, 274.236, 28.145, 100, 0, 0, 0),
(44663, 20, 2732.86, 276.238, 28.1288, 100, 0, 0, 0),
(44663, 21, 2718.18, 278.28, 28.1206, 100, 0, 0, 0),
(44663, 22, 2701.65, 282.296, 28.1206, 100, 0, 0, 0),
(44663, 23, 2687.91, 287.727, 28.1183, 100, 0, 0, 0),
(44663, 25, 2675.35, 295.453, 28.1183, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
