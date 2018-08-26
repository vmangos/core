DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180715222503');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180715222503');
-- Add your query below.


-- Sources
-- https://youtu.be/DHPascB50tg?t=2m25s
-- https://www.youtube.com/watch?v=G89A9ITuTfs

-- Assign the scripts.
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=4983;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=4980;
UPDATE `quest_template` SET `StartScript`=1273 WHERE `entry`=1273;

-- Correct faction and equipment of involved NPCs.
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35, `AIName`='EventAI', `equipment_id`=`entry` WHERE `entry` IN (5044, 5045, 5046);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (5044, 1899, 1984, 0);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (5045, 1896, 0, 5258);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (5046, 3364, 0, 0);

-- Add emotes to texts.
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1675;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1708;
UPDATE `broadcast_text` SET `EmoteId0`=25 WHERE `ID`=1710;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1711;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1731;
UPDATE `broadcast_text` SET `EmoteId0`=5 WHERE `ID`=1714;
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1720;
UPDATE `broadcast_text` SET `EmoteId0`=25 WHERE `ID`=1723;

-- Delete custom text entries for old hardcoded script.
DELETE FROM `script_texts` WHERE `entry` IN (-1000452, -1000453, -1000454, -1000455, -1000456, -1000457, -1000458, -1000459, -1000460, -1000461, -1000462, -1000463, -1000464, -1000465, -1000466, -1000467, -1000468, -1000469, -1000470, -1000471);

-- Delete waypoints for old hardcoded script.
DELETE FROM `script_waypoint` WHERE `entry`=4983;

-- Waypoints for Ogron when Questioning Reethe starts.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(49830, 1, -3322.65, -3124.63, 33.842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 2, -3326.34, -3126.83, 34.426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 3, -3336.98, -3129.61, 30.692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 4, -3342.6, -3132.15, 30.422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 5, -3355.83, -3140.95, 29.534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 6, -3365.83, -3144.28, 35.176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 7, -3368.9, -3147.27, 36.091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 8, -3369.36, -3169.83, 36.325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 9, -3377.23, -3191.9, 35.562, 5000, 0, 1670, 0, 0, 0, 0, 0, 0, 6.25, 0, 0),
(49830, 10, -3371.07, -3190.93, 34.281, 0, 4983010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0),
(49830, 11, -3366.26, -3210.22, 33.837, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 4.68, 0, 0),
(49830, 12, -3366.26, -3210.22, 33.837, 10000, 4983012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0);

-- Return waypoints for Ogron.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `orientation`, `model1`, `model2`) VALUES
(49831, 1, -3368.53, -3198.21, 34.926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 2, -3373.82, -3190.86, 34.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 3, -3371.44, -3183.91, 33.454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 4, -3369.36, -3169.83, 36.325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 5, -3368.9, -3147.27, 36.091, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 6, -3365.83, -3144.28, 35.176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 7, -3355.83, -3140.95, 29.534, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 8, -3342.6, -3132.15, 30.422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 9, -3336.98, -3129.61, 30.692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 10, -3326.34, -3126.83, 34.426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 11, -3322.65, -3124.63, 33.842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49831, 12, -3317.64, -3125.36, 33.0284, 0, 4983112, 0, 0, 0, 0, 0, 0, 0, 3.38594, 0, 0);

-- Events list for Theramore Skirmisher
DELETE FROM `creature_ai_events` WHERE `creature_id`=5044;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504401, 5044, 0, 31, 0, 100, 0, 1273, 1, 0, 0, 504401, 0, 0, 'Theramore Skirmisher - Start Attack on Map Event');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504402, 5044, 0, 2, 0, 100, 0, 20, 1, 0, 0, 504402, 0, 0, 'Theramore Skirmisher - Flee at 20% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=504401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504401, 0, 22, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Set Faction to Theramore');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504401, 0, 26, 0, 0, 0, 0, 1273, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Attack Ogron');
DELETE FROM `creature_ai_scripts` WHERE `id`=504402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504402, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Skirmisher - Flee');

-- Events list for Private Hallan
DELETE FROM `creature_ai_events` WHERE `creature_id`=5045;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504501, 5045, 0, 31, 0, 100, 0, 1273, 1, 0, 0, 504501, 0, 0, 'Private Hallan - Start Attack on Map Event');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504502, 5045, 0, 2, 0, 100, 0, 20, 1, 0, 0, 504502, 0, 0, 'Private Hallan - Flee at 20% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=504501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504501, 0, 22, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Set Faction to Theramore');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504501, 0, 26, 0, 0, 0, 0, 1273, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Attack Ogron');
DELETE FROM `creature_ai_scripts` WHERE `id`=504502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504502, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hallan - Flee');

-- Events list for Lieutenant Caldwell
DELETE FROM `creature_ai_events` WHERE `creature_id`=5046;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504601, 5046, 0, 29, 0, 100, 0, 8, 1, 0, 0, 504601, 0, 0, 'Lieutenant Caldwell - Start Script on Reached Point');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504602, 5046, 0, 31, 0, 100, 0, 1273, 1, 0, 0, 504602, 0, 0, 'Lieutenant Caldwell - Start Attack on Map Event');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504603, 5046, 0, 6, 0, 100, 0, 0, 0, 0, 0, 504603, 0, 0, 'Lieutenant Caldwell - Complete Event on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (504604, 5046, 0, 2, 0, 100, 0, 20, 1, 0, 0, 504604, 0, 0, 'Lieutenant Caldwell - Flee at 20% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=504601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504601, 0, 39, 12738, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Start Script');
DELETE FROM `creature_ai_scripts` WHERE `id`=504602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504602, 0, 22, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Set Faction to Theramore');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504602, 0, 26, 0, 0, 0, 0, 1273, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Attack Ogron');
DELETE FROM `creature_ai_scripts` WHERE `id`=504603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504603, 0, 62, 1273, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Complete Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=504604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504604, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Caldwell - Flee');

-- Events list for Paval Reethe
DELETE FROM `creature_ai_events` WHERE `creature_id`=4980;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (498001, 4980, 0, 8, 0, 100, 1, 7105, -1, 10000, 10000, 498001, 0, 0, 'Paval Reethe - Start Script on Hit by Fake Shot');
DELETE FROM `creature_ai_scripts` WHERE `id`=498001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1732, 0, 0, 0, 0, 0, 0, 0, 0, 'Paval Reethe - Say Emote Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498001, 0, 39, 12740, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Paval Reethe - Start Script');

-- Events list for Ogron
DELETE FROM `creature_ai_events` WHERE `creature_id`=4983;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (498301, 4983, 0, 21, 3, 100, 0, 0, 0, 0, 0, 498301, 0, 0, 'Ogron - Start Script on Reached Home');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (498302, 4983, 0, 6, 0, 100, 0, 0, 0, 0, 0, 498302, 0, 0, 'Ogron - Reset Home Position on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (498303, 4983, 0, 11, 0, 100, 1, 0, 0, 0, 0, 498303, 0, 0, 'Ogron - Add Quest Giver Flag on Respawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=498301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498301, 0, 39, 12741, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Start Script');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498301, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=498302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498302, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Reset Home Position');
DELETE FROM `creature_ai_scripts` WHERE `id`=498303;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498303, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Add Quest Giver Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (498303, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Set Phase to 0');

-- Script when quest Questioning Reethe is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=1273;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 61, 1273, 600, 0, 0, 0, 0, 0, 8, 0, 12731, 6303, 12732, 0, 0, 0, 0, 0, 'Questioning Reethe: Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Set Walk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 49830, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Start Waypoint Movement');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1669, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Set Phase to 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1273, 0, 71, 0, 0, 0, 0, 31654, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Respawn');

-- Script when event for quest Questioning Reethe is completed.
DELETE FROM `event_scripts` WHERE `id`=12731;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12731, 0, 7, 1273, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Completed: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12731, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Completed: Ogron - Set Phase to 2');

-- Script when event for quest Questioning Reethe fails.
DELETE FROM `event_scripts` WHERE `id`=12732;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12732, 0, 70, 1273, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Fail Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12732, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Ogron - Reset Home Position');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12732, 1, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Ogron - Respawn');
DELETE FROM `event_scripts` WHERE `id`=12737;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12737, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Despawn Self');
DELETE FROM `event_scripts` WHERE `id`=12742;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12742, 0, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Paval Reethe - Stop Emoting');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12742, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Paval Reethe - Stand Up');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12742, 1, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe Failed: Paval Reethe - Respawn');

-- Script when Ogron nears Paval Reethe.
DELETE FROM `creature_movement_scripts` WHERE `id`=4983010;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983010, 0, 63, 1273, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 12742, 0, 0, 0, 0, 0, 'Questioning Reethe: Add Paval Reethe to Event');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983010, 1, 35, 0, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Face Ogron');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983010, 1, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1674, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983010, 2, 1, 27, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Emote Combat');

-- Script when Ogron reaches Paval Reethe.
DELETE FROM `creature_movement_scripts` WHERE `id`=4983012;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 0, 35, 0, 0, 0, 0, 4980, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Face Paval Reethe');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 0, 35, 0, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Face Ogron');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 1, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1675, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1707, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 8, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1708, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1709, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 14, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1710, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text 3');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 15, 10, 5046, 120000, 0, 0, 0, 0, 0, 0, 0, 12733, 6, 9, -3385.821, -3205.173, 35.617, 5.9, 0, 'Questioning Reethe: Summon Lieutenant Caldwell');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 15, 10, 5044, 120000, 0, 0, 0, 0, 0, 0, 0, 12734, 6, 9, -3389.176, -3203.495, 35.392, 5.9, 0, 'Questioning Reethe: Summon Theramore Skirmisher 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 15, 10, 5044, 120000, 0, 0, 0, 0, 0, 0, 0, 12735, 6, 9, -3390.044, -3199.333, 35.16, 6, 0, 'Questioning Reethe: Summon Theramore Skirmisher 2');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 15, 10, 5045, 120000, 0, 0, 0, 0, 0, 0, 0, 12736, 6, 9, -3392.702, -3205.964, 34.287, 5.9, 0, 'Questioning Reethe: Summon Private Hallan');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 18, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1711, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text 4');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983012, 22, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1731, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text 5');

-- Script when Ogron returns to his home position.
DELETE FROM `creature_movement_scripts` WHERE `id`=4983112;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983112, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Set Phase to 0');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983112, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Add Quest Giver Flag');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983112, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Reset Home Position');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983112, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ogron - Set Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4983112, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.38594, 0, 'Ogron - Set Orientation');

-- Spawn script for Lieutenant Caldwell.
DELETE FROM `event_scripts` WHERE `id`=12733;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12733, 0, 63, 1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12737, 0, 0, 0, 0, 0, 'Questioning Reethe: Lieutenant Caldwell - Add Self to Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12733, 6, 3, 0, 0, 3, 3, 0, 0, 0, 0, 1, 0, 0, 0, -3372.956, -3210.854, 34.566, 5.9, 0, 'Questioning Reethe: Lieutenant Caldwell - Move to Camp');

-- Spawn script for Theramore Skirmisher 1.
DELETE FROM `event_scripts` WHERE `id`=12734;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12734, 0, 63, 1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12737, 0, 0, 0, 0, 0, 'Questioning Reethe: Theramore Skirmisher 1 - Add Self to Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12734, 6, 3, 0, 0, 3, 3, 0, 0, 0, 0, 1, 0, 0, 0, -3376.132, -3210.283, 35.012, 5.96, 0, 'Questioning Reethe: Theramore Skirmisher 1 - Move to Camp');

-- Spawn script for Theramore Skirmisher 2.
DELETE FROM `event_scripts` WHERE `id`=12735;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12735, 0, 63, 1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12737, 0, 0, 0, 0, 0, 'Questioning Reethe: Theramore Skirmisher 2 - Add Self to Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12735, 6, 3, 0, 0, 3, 3, 0, 0, 0, 0, 1, 0, 0, 0, -3375.480, -3207.636, 35.227, 5.77, 0, 'Questioning Reethe: Theramore Skirmisher 2 - Move to Camp');

-- Spawn script for Private Hallan.
DELETE FROM `event_scripts` WHERE `id`=12736;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12736, 0, 63, 1273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12737, 0, 0, 0, 0, 0, 'Questioning Reethe: Private Hallan - Add Self to Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12736, 6, 3, 0, 0, 3, 3, 0, 0, 0, 0, 1, 0, 0, 0, -3377.783, -3212.199, 35.063, 6.15, 0, 'Questioning Reethe: Private Hallan - Move to Camp');

-- Script when Lieutenant Caldwell reaches the camp.
DELETE FROM `event_scripts` WHERE `id`=12738;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1714, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Lieutenant Caldwell - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 1, 35, 0, 0, 0, 0, 4983, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Turn to Lieutenant Caldwell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 1, 35, 0, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Turn to Lieutenant Caldwell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1720, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Lieutenant Caldwell - Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 8, 0, 0, 0, 0, 0, 5045, 30, 8, 2, 1721, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Private Hallan - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 11, 39, 12739, 0, 0, 0, 5045, 30, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Private Hallan - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1723, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Lieutenant Caldwell - Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 17, 35, 0, 0, 0, 0, 4983, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Lieutenant Caldwell - Turn to Ogron');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 19, 66, 1273, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Send Map Event');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12738, 20, 0, 0, 0, 0, 0, 4983, 30, 8, 2, 1926, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text');

-- Script to make Private Hallan shoot at Paval Reethe.
DELETE FROM `event_scripts` WHERE `id`=12739;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12739, 0, 15, 7105, 4, 0, 0, 4980, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Private Hallan - Cast Fake Shot on Paval Reethe');

-- Script when Paval Reethe is hit by Fake Shot.
DELETE FROM `event_scripts` WHERE `id`=12740;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12740, 0, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Stop Emoting');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12740, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1722, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12740, 2, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Kneel');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12740, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12740, 5, 0, 0, 0, 0, 0, 1273, 0, 20, 2, 1724, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text');

-- Script after the fight.
DELETE FROM `event_scripts` WHERE `id`=12741;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 1, 35, 0, 0, 0, 0, 4980, 30, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Turn to Paval Reethe');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1726, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 1, 28, 0, 0, 0, 0, 4980, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Stand Up');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 4, 0, 0, 0, 0, 0, 4980, 30, 8, 2, 1725, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 7, 48, 100, 1, 0, 0, 4980, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Paval Reethe - Die');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1729, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1730, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Say Text 3');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 18, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12741, 19, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 49831, 0, 0, 0, 0, 0, 0, 0, 'Questioning Reethe: Ogron - Start Waypoints');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
