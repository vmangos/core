DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190907220235');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190907220235');
-- Add your query below.


UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE `entry` IN (8024, 8025);
UPDATE `creature_template` SET `scale` = 0.6, `speed_walk` = 2, `inhabit_type` = 4 WHERE `entry` = 8023;
UPDATE `creature_template` SET `faction`=534, `speed_walk` = 2, `inhabit_type` = 4 WHERE `entry` IN (8024, 8025);
UPDATE `creature` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60, `position_x` = -256.241, `position_y` = -3630.208, `position_z` = 238.918, `spawnFlags` = 1 WHERE `guid` = 92997 AND `id` = 8023;
UPDATE `gameobject_template` SET `data2` = 14407001 WHERE `entry` = 144070;

DELETE FROM `creature_ai_events` WHERE `creature_id` IN (8024, 8025);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(802401, 8024, 0, 11, 0, 100, 0, 0, 0, 0, 0, 802401, 0, 0, "Sharpbeak's Father - Just Spawned - Start Script"),

(802501, 8025, 0, 11, 0, 100, 0, 0, 0, 0, 0, 802501, 0, 0, "Sharpbeak's Mother - Just Spawned - Start Script");

DELETE FROM `creature_ai_scripts` WHERE `id` IN (802401, 802501);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(802401, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 8024, 0, 0, 0, 0, 0, 0, 0, 0, "Sharpbeak's Father - Start Waypoints"),

(802501, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 8025, 0, 0, 0, 0, 0, 0, 0, 0, "Sharpbeak's Mother - Start Waypoints");

DELETE FROM `event_scripts` WHERE `id` = 14407001;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(14407001, 0, 77, 0, 0, 0, 0, 92997, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sharpbeak - Disable Flying'),
(14407001, 1, 2, 138, 0, 0, 0, 92997, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8023, "Sharpbeak's Cage - Set Unit Field Bytes 1 (0) (Creature 8023)"),
(14407001, 2, 60, 3, 0, 0, 1, 92997, 0, 9, 2, 8023, 0, 0, 0, 0, 0, 0, 0, 8023, "Sharpbeak's Cage - On Script - Start Waypoints (Creature 8023)");

DELETE FROM `conditions` WHERE `condition_entry` = 8023;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(8023, 20, 8023, 5, 0, 0, 0);

DELETE FROM `creature_movement_special` WHERE `id` IN (8023, 8024, 8025);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(8023, 1, -241.789764, -3628.514648, 235.425, 100, 2000, 0),
(8023, 2, -229.494385, -3623.708740, 237.462433, 100, 28000, 802302),
(8023, 3, -239.480209, -3631.803955, 235.384, 0, 0, 0),
(8023, 4, -243.595398, -3640.100098, 236.735, 100, 6000, 0),
(8023, 5, -235.899063, -3630.083496, 235.725, 0, 0, 0),
(8023, 6, -227.817123, -3626.056152, 237.199, 100, 3000, 802306),
(8023, 7, -209.788559, -3599.589844, 237.986, 0, 0, 802307),
(8023, 8, -177.785049, -3605.625732, 245.908, 0, 0, 0),
(8023, 9, -169.861572, -3571.378418, 246.925, 0, 0, 0),
(8023, 10, -116.445145, -3503.8479, 255.179169, 0, 0, 0),

(8024, 1, -211.492615, -3606.02832, 242.895477, 0, 0, 0),
(8024, 2, -230.034515, -3627.350098, 237.616638, 0, 0, 0),
(8024, 3, -244.359818, -3638.187500, 236.659546, 100, 6000, 0),
(8024, 4, -227.883606, -3624.622314, 237.235733, 0, 0, 0),
(8024, 5, -122.637520, -3502.211914, 256.078064, 0, 0, 4),

(8025, 1, -227.634903, -3616.755371, 250.167419, 0, 0, 0),
(8025, 2, -233.638092, -3627.403320, 239.791321, 0, 0, 0),
(8025, 3, -247.67189, -3641.660889, 236.830139, 100, 6000, 0),
(8025, 4, -231.124161, -3623.168457, 237.391418, 0, 0, 0),
(8025, 5, -125.879181, -3498.73999, 256.601318, 0, 0, 4);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (802302, 802306, 802307);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(802302, 0, 10, 8024, 120000, 0, 0, 0, 0, 0, 4, 2, 0, 6, 3, -150.362, -3511.23, 274.173, 4.0628, 0, "Sharpbeak - Summon Creature 'Sharpbeak's Father'"),
(802302, 1, 10, 8025, 120000, 0, 0, 0, 0, 0, 4, 2, 0, 6, 3, -168.569, -3509.42, 276.239, 4.32085, 0, "Sharpbeak - Summon Creature 'Sharpbeak's Mother'"),

(802306, 0, 77, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sharpbeak - Enable Flying'),
(802306, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.661951, 0, "Sharpbeak - Set Orientation (3.661951)"),
(802306, 2, 0, 2, 0, 0, 0, 50, 0, 25, 0, 4138, 0, 0, 0, 0, 0, 0, 0, 0, "Sharpbeak - Say Text"),

(802307, 0, 18, 18000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Sharpbeak - Despawn (18000 ms)");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
