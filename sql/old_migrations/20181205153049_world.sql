DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181205153049');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181205153049');
-- Add your query below.


-- Horde Laborers
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` IN (14429, 14431, 14432, 14430, 14428) AND `id` = 14718; 
DELETE FROM `creature_movement` WHERE `id` IN (14429, 14431, 14432, 14430, 14428);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(14429, 1, 1029.83, -2154.75, 123.049, 180000, 1471801, 1.19849),
(14431, 1, 1019.54, -2142.49, 124.767, 174000, 1471802, 0.882199),
(14432, 1, 1015.51, -2138.34, 125.82, 166000, 1471803, 0.753775),
(14430, 1, 1010.26, -2134.29, 126.945, 170000, 1471804, 0.612264),
(14428, 1, 1034.29, -2112.98, 122.946, 0, 0, 0),
(14428, 2, 1034.5, -2115.07, 122.946, 0, 0, 0),
(14428, 3, 1034.06, -2125.55, 122.953, 0, 0, 0),
(14428, 4, 1033.47, -2136.03, 122.94, 0, 0, 0),
(14428, 5, 1033.66, -2148.56, 122.9, 0, 0, 0),
(14428, 6, 1032.68, -2152.52, 122.948, 0, 0, 0),
(14428, 7, 1030.98, -2152.07, 122.97, 0, 0, 0),
(14428, 8, 1029.92, -2150.68, 123.052, 20000, 1471805, 2.228497),
(14428, 9, 1033.3, -2150.87, 122.922, 0, 0, 0),
(14428, 10, 1035.12, -2146.2, 122.907, 0, 0, 0),
(14428, 11, 1034.46, -2142.76, 122.858, 0, 0, 0),
(14428, 12, 1033.41, -2135.26, 122.941, 0, 0, 0),
(14428, 13, 1039.67, -2130.72, 123.491, 0, 0, 0),
(14428, 14, 1044.52, -2130.13, 124.082, 32000, 1471806, 0),
(14428, 15, 1044.52, -2130.13, 124.082, 0, 0, 0),
(14428, 16, 1034.41, -2128.47, 122.967, 0, 0, 0),
(14428, 17, 1034.34, -2124.97, 122.987, 0, 0, 0),
(14428, 18, 1034.2, -2114.47, 122.947, 0, 0, 0),
(14428, 19, 1032.9, -2106.12, 122.947, 0, 0, 0),
(14428, 20, 1029.66, -2104.47, 122.947, 60000, 1471807, 3.104217);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1471801, 1471802, 1471803, 1471804, 1471805, 1471806, 1471807);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1471801, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.39941, 0, 'Horde Laborer - Set Orientation'),
(1471801, 3, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471801, 121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471801, 122, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.19849, 0, 'Horde Laborer - Set Orientation'),
(1471802, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.17085, 0, 'Horde Laborer - Set Orientation'),
(1471802, 3, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471802, 124, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471802, 125, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.882199, 0, 'Horde Laborer - Set Orientation'),
(1471803, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.137014, 0, 'Horde Laborer - Set Orientation'),
(1471803, 3, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471803, 127, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471803, 128, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.753775, 0, 'Horde Laborer - Set Orientation'),
(1471804, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.943022, 0, 'Horde Laborer - Set Orientation'),
(1471804, 3, 1, 173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471804, 119, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471804, 120, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.612264, 0, 'Horde Laborer - Set Orientation'),
(1471805, 3, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471805, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471805, 18, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471806, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.08029, 0, 'Horde Laborer - Set Orientation'),
(1471806, 3, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471806, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471806, 16, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.8455, 0, 'Horde Laborer - Set Orientation'),
(1471806, 18, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471806, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471806, 29, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471807, 3, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471807, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote'),
(1471807, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Play Emote');

-- Events list for Horde Laborer
DELETE FROM `creature_ai_events` WHERE `creature_id`=14718;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1471801, 14718, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1471801, 0, 0, 'Horde Laborer - Call for Help on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1471802, 14718, 0, 2, 0, 100, 0, 15, 1, 0, 0, 1471802, 0, 0, 'Horde Laborer - Flee on 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=1471801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6311, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471801, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 0, 'Horde Laborer - Call for Help');
DELETE FROM `creature_ai_scripts` WHERE `id`=1471802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471802, 0, 47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Flee');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=14718;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
