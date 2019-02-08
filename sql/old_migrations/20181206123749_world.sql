DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181206123749');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181206123749');
-- Add your query below.


-- Trok
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 0, `position_x` = 180.182, `position_y` = -2862.82, `position_z` = 93.2346 WHERE `guid` IN (13589, 13588, 13587, 13586);
DELETE FROM `creature_movement` WHERE `id` IN (13589, 13588, 13587, 13586);
DELETE FROM `creature_groups` WHERE `leader_guid` = 13178;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES 
(13178, 13178, 0, 0, 1),
(13178, 13589, 3, 30, 1),
(13178, 13588, 3, 60, 1),
(13178, 13587, 3, 330, 1),
(13178, 13586, 3, 300, 1);
UPDATE `creature_template` SET `speed_run` = 1.257143 WHERE `entry` = 14894;
DELETE FROM `creature_movement` WHERE `id` = 13178;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(13178, 1, 178.499, -2857.34, 93.849, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 2, 178.499, -2857.34, 93.849, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 3, 178.499, -2857.34, 93.849, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 4, 184.597, -2835.96, 93.453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 5, 198.418, -2819.86, 93.8766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 6, 220.168, -2814.64, 93.2075, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 7, 243.385, -2830.24, 91.6692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 8, 261.819, -2827.79, 91.6677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 9, 254.995, -2812.46, 91.6677, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 10, 232.858, -2803.37, 92.7026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 11, 209.538, -2795.58, 92.5157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 12, 187.199, -2796.61, 92.2436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 13, 168.673, -2810.94, 92.0277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 14, 161.353, -2831.43, 92.3402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 15, 163.975, -2853.26, 94.2934, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 16, 166.283, -2869.9, 93.1487, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 17, 172.251, -2894.95, 92.069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 18, 183.756, -2910.68, 93.3137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 19, 199.554, -2910.93, 92.5125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 20, 208.087, -2924.7, 92.2502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 21, 193.876, -2931.1, 93.1867, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 22, 189.428, -2912.61, 93.323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 23, 185.647, -2895.12, 92.5841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 24, 206.266, -2883.81, 92.2722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 25, 176.803, -2870.31, 92.9238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13178, 26, 166.825, -2871.93, 92.9655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 14872;
DELETE FROM `creature_ai_events` WHERE `id` = 1487201 AND `creature_id` = 14872;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1487201, 14872, 0, 1, 0, 100, 1, 10000, 20000, 10000, 20000, 1487201, 0, 0, "Trok - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 1487201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1487201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10259, 10260, 10261, 10262, 0, 0, 0, 0, 0, "Trok - Say Text");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
