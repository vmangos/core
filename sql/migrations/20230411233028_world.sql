DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230411233028');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230411233028');
-- Add your query below.


-- Generic script for Creature Crimson Gallant (Entry: 10424 Guid: 222)
DELETE FROM `generic_scripts` WHERE `id`=1042401;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042401, 1, 0, 3, 0, 2266, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3601.81, -3099.76, 134.157, 0, 117, 'Crimson Gallant - Move'),
(1042401, 2, 0, 3, 0, 997, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3602.59, -3102.34, 134.157, 0, 117, 'Crimson Gallant - Move');

-- Generic script for Creature Crimson Gallant (Entry: 10424 Guid: 223)
DELETE FROM `generic_scripts` WHERE `id`=1042402;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042402, 1, 0, 3, 0, 503, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3593.44, -3086.3, 135.757, 0, 117, 'Crimson Gallant - Move'),
(1042402, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6379, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Say Text'),
(1042402, 2, 0, 3, 0, 918, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3599.14, -3095.8, 135.42, 0, 117, 'Crimson Gallant - Move');

-- 54089: Source Is Part Of Creature Group With Leader Guid 54089
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54089, 57, 54089, 0, 0, 0, 0);
-- 54090: (302: Source's Creature Group Is Dead) And (54089: Source Is Part Of Creature Group With Leader Guid 54089)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54090, -1, 302, 54089, 0, 0, 0);

-- Events list for Crimson Initiate
DELETE FROM `creature_ai_events` WHERE `creature_id`=10420;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042001, 10420, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1042001, 0, 0, 'Crimson Initiate - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042002, 10420, 54055, 6, 0, 100, 0, 0, 0, 0, 0, 1042002, 0, 0, 'Crimson Initiate - Spawn Undead on Group Dead');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042003, 10420, 54090, 6, 0, 100, 0, 0, 0, 0, 0, 1042003, 0, 0, 'Crimson Initiate - Spawn Crimson Gallants on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042003, 0, 10, 10424, 60000, 0, 0, 0, 0, 0, 0, 0, 1042401, -1, 1, 3593.44, -3086.3, 135.748, 0.122173, 0, 'Summon Creature Crimson Gallant'),
(1042003, 0, 10, 10424, 60000, 0, 0, 0, 0, 0, 0, 0, 1042402, -1, 1, 3591.47, -3087.67, 135.748, 2.37365, 0, 'Summon Creature Crimson Gallant');

-- This text should be yelled to zone.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6379;

-- Undead Group 2.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `spawn_flags`) VALUES 
(52130, 10391, 329, 3558.37, -3011.21, 125.084, 3.63028, 7200, 7200, 0, 2, 2),
(52131, 10391, 329, 3555.54, -3010.96, 125.085, 0.715585, 7200, 7200, 0, 0, 2),
(52132, 10390, 329, 3557.25, -3014.85, 125.084, 3.85718, 7200, 7200, 0, 0, 2),
(52133, 10390, 329, 3549.89, -3014.29, 125.085, 2.86234, 7200, 7200, 0, 0, 2),
(52134, 10390, 329, 3551.44, -3017.64, 125.085, 5.63741, 7200, 7200, 0, 0, 2);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(52130, 1, 3553.655029, -3014.454346, 125.157318, 100.000000, 0, 0.000000, 0),
(52130, 2, 3548.007813, -3018.338379, 125.157310, 100.000000, 0, 0.000000, 0),
(52130, 3, 3553.664795, -3014.733398, 125.157310, 100.000000, 0, 0.000000, 0),
(52130, 4, 3563.919922, -3007.840332, 125.407303, 100.000000, 0, 0.000000, 0),
(52130, 5, 3576.169922, -2999.340332, 125.407303, 100.000000, 0, 0.000000, 0),
(52130, 6, 3581.887207, -2995.126953, 125.407272, 100.000000, 0, 0.000000, 0),
(52130, 7, 3572.887207, -2982.126953, 125.407272, 100.000000, 0, 0.000000, 0),
(52130, 8, 3567.132080, -2973.609375, 125.000916, 100.000000, 1000, 0.000000, 52124);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52130, 52130, 0, 0, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52130, 52131, 2.83, 2.6, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52130, 52132, 3.8, 3.64, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52130, 52133, 9, 2.85, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52130, 52134, 9.4, 3.35, 3);

-- This text should be yelled to zone.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6438;

-- 54147: Source Is Part Of Creature Group With Leader Guid 54147
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54147, 57, 54147, 0, 0, 0, 0);
-- 54148: (302: Source's Creature Group Is Dead) And (54147: Source Is Part Of Creature Group With Leader Guid 54147)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54148, -1, 302, 54147, 0, 0, 0);

-- Events list for Crimson Priest
DELETE FROM `creature_ai_events` WHERE `creature_id`=10423;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042301, 10423, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1042301, 0, 0, 'Crimson Priest - Cast Heal at 50% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042302, 10423, 54148, 6, 0, 100, 0, 0, 0, 0, 0, 1042302, 0, 0, 'Crimson Priest - Spawn Undead Group 2 on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042302, 0, 0, 0, 0, 0, 0, 0, 52129, 0, 9, 2, 6438, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1042302, 0, 0, 91, 52130, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Priest - Spawn Undead Group');

-- Events list for Crimson Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=10421;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042101, 10421, 0, 0, 0, 100, 0, 1000, 3000, 240000, 245000, 1042101, 0, 0, 'Crimson Defender - Cast Devotion Aura');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042102, 10421, 0, 9, 0, 100, 1, 0, 8, 16000, 25000, 1042102, 0, 0, 'Crimson Defender - Cast Hammer of Justice');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042103, 10421, 0, 0, 0, 100, 0, 17000, 25000, 21000, 30000, 1042103, 0, 0, 'Crimson Defender - Cast Divine Shield');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042104, 10421, 0, 14, 0, 100, 1, 3000, 40, 18000, 25000, 1042104, 0, 0, 'Crimson Defender - Cast Holy Light on Friendlies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042105, 10421, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1042105, 0, 0, 'Crimson Defender - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042106, 10421, 54148, 6, 0, 100, 0, 0, 0, 0, 0, 1042106, 0, 0, 'Crimson Defender - Spawn Undead Group 2 on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042106;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042106, 0, 0, 0, 0, 0, 0, 0, 52129, 0, 9, 2, 6438, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1042106, 0, 0, 91, 52130, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Defender - Spawn Undead Group');

-- Undead Group 3.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `spawn_flags`) VALUES 
(52135, 10391, 329, 3553.49, -3070.83, 135.08, 2.63545, 7200, 7200, 0, 2, 2),
(52147, 10391, 329, 3554.52, -3072.41, 135.08, 1.23918, 7200, 7200, 0, 0, 2),
(52150, 10391, 329, 3552.01, -3073.74, 135.08, 0.872665, 7200, 7200, 0, 0, 2),
(52226, 10390, 329, 3552.08, -3068.9, 135.08, 0.488692, 7200, 7200, 0, 0, 2),
(52230, 10390, 329, 3550.52, -3070.81, 135.08, 5.65487, 7200, 7200, 0, 0, 2);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(52135, 1, 3551.931396, -3070.964355, 135.368835, 100.000000, 0, 0.000000, 0),
(52135, 2, 3543.931396, -3072.964355, 135.368835, 100.000000, 0, 0.000000, 0),
(52135, 3, 3537.931396, -3063.214355, 135.868835, 100.000000, 0, 0.000000, 0),
(52135, 4, 3534.441650, -3058.123047, 135.509644, 100.000000, 0, 0.000000, 0),
(52135, 5, 3529.941650, -3050.623047, 135.509644, 100.000000, 0, 0.000000, 0),
(52135, 6, 3517.691650, -3060.623047, 135.509644, 100.000000, 0, 0.000000, 0),
(52135, 7, 3501.400146, -3073.532471, 135.261993, 100.000000, 1000, 0.000000, 52124);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52135, 52135, 0, 0, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52135, 52147, 1.89, 4.68, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52135, 52150, 3.26, 4.16, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52135, 52226, 2.39, 1.56, 3);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (52135, 52230, 2.96, 2.08, 3);

-- Add scarlet mobs to group so we can spawn undead on whole group dead.
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (54231, 54231, 0, 0, 2);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (54231, 54224, 3.48, 0, 2);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (54231, 54223, 3.48, 0, 2);

-- This text should be yelled to zone.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6439;

-- 54231: Source Is Part Of Creature Group With Leader Guid 54231
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54231, 57, 54231, 0, 0, 0, 0);
-- 54232: (302: Source's Creature Group Is Dead) And (54231: Source Is Part Of Creature Group With Leader Guid 54231)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (54232, -1, 302, 54231, 0, 0, 0);

-- This text should be yelled to zone.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=6380;

-- 52144: Source Is Part Of Creature Group With Leader Guid 52144
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (52144, 57, 52144, 0, 0, 0, 0);
-- 52145: (302: Source's Creature Group Is Dead) And (52144: Source Is Part Of Creature Group With Leader Guid 52144)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (52145, -1, 302, 52144, 0, 0, 0);

-- Generic script for Creature Crimson Monk (Entry: 11043 Guid: 308)
DELETE FROM `generic_scripts` WHERE `id`=1104301;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1104301, 1, 0, 3, 0, 2922, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3444.71, -3086.1, 135.244, 0, 117, 'Crimson Monk - Move'),
(1104301, 2, 0, 3, 0, 0, 5, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3460.75, -3075.24, 135.157, 0, 117, 'Crimson Monk - Move');

-- Generic script for Creature Crimson Monk (Entry: 11043 Guid: 309)
DELETE FROM `generic_scripts` WHERE `id`=1104302;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1104302, 1, 0, 3, 0, 2070, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3435.82, -3066.75, 136.557, 0, 117, 'Crimson Monk - Move'),
(1104302, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6380, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Monk - Say Text'),
(1104302, 2, 0, 3, 0, 0, 5, 2, 0, 0, 0, 4, 0, 0, 0, 0, 3459.01, -3073, 135, 0, 117, 'Crimson Monk - Move');

-- Correct spawns before final boss room.
REPLACE INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`, `spawn_flags`) VALUES 
(54229, 10424, 329, 3441.98, -3092.17, 135.086, 1.309, 7200, 7200, 0, 0, 0),
(54170, 10424, 329, 3438.29, -3086.37, 135.085, 6.19592, 7200, 7200, 0, 0, 0),
(52144, 10425, 329, 3436.74, -3090.19, 135.085, 0.471239, 7200, 7200, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=54233;

-- Events list for Crimson Gallant
DELETE FROM `creature_ai_events` WHERE `creature_id`=10424;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042401, 10424, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1042401, 0, 0, 'Crimson Gallant - Cast Retribution Aura on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042402, 10424, 0, 9, 0, 100, 1, 0, 5, 9100, 9100, 1042402, 0, 0, 'Crimson Gallant - Cast Crusader Strike');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042403, 10424, 54148, 6, 0, 100, 0, 0, 0, 0, 0, 1042403, 0, 0, 'Crimson Gallant - Spawn Undead Group 2 on Group Dead');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042404, 10424, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1042404, 0, 0, 'Crimson Gallant - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042405, 10424, 54232, 6, 0, 100, 0, 0, 0, 0, 0, 1042405, 0, 0, 'Crimson Gallant - Spawn Undead Group 3 on Group Dead');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042406, 10424, 52145, 6, 0, 100, 0, 0, 0, 0, 0, 1042406, 0, 0, 'Crimson Gallant - Summon Crimson Monks on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042403, 0, 0, 0, 0, 0, 0, 0, 52129, 0, 9, 2, 6438, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1042403, 0, 0, 91, 52130, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Defender - Spawn Undead Group');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042405;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042405, 0, 0, 0, 0, 0, 0, 0, 52129, 0, 9, 2, 6439, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1042405, 0, 0, 91, 52135, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Defender - Spawn Undead Group');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042406;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042406, 0, 10, 11043, 60000, 0, 0, 0, 0, 0, 0, 0, 1104302, -1, 1, 3434.52, -3064.54, 136.592, 1.0821, 0, 'Summon Creature Crimson Monk'),
(1042406, 0, 10, 11043, 60000, 0, 0, 0, 0, 0, 0, 0, 1104301, -1, 1, 3436.83, -3068.48, 136.612, 2.75762, 0, 'Summon Creature Crimson Monk');

-- Events list for Crimson Battle Mage
DELETE FROM `creature_ai_events` WHERE `creature_id`=10425;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042501, 10425, 0, 9, 0, 100, 1, 0, 8, 9000, 14000, 1042501, 0, 0, 'Crimson Battle Mage - Cast Arcane Explosion');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042502, 10425, 54232, 6, 0, 100, 0, 0, 0, 0, 0, 1042502, 0, 0, 'Crimson Battle Mage - Spawn Undead Group 3 on Group Dead');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042503, 10425, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1042503, 0, 0, 'Crimson Battle Mage - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042504, 10425, 52145, 6, 0, 100, 0, 0, 0, 0, 0, 1042504, 0, 0, 'Crimson Battle Mage - Summon Crimson Monks on Group Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042502, 0, 0, 0, 0, 0, 0, 0, 52129, 0, 9, 2, 6439, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1042502, 0, 0, 91, 52135, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Defender - Spawn Undead Group');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042504;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1042504, 0, 10, 11043, 60000, 0, 0, 0, 0, 0, 0, 0, 1104302, -1, 1, 3434.52, -3064.54, 136.592, 1.0821, 0, 'Summon Creature Crimson Monk'),
(1042504, 0, 10, 11043, 60000, 0, 0, 0, 0, 0, 0, 0, 1104301, -1, 1, 3436.83, -3068.48, 136.612, 2.75762, 0, 'Summon Creature Crimson Monk');

-- Events list for Crimson Monk
DELETE FROM `creature_ai_events` WHERE `creature_id`=11043;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1104301, 11043, 0, 4, 0, 50, 0, 0, 0, 0, 0, 1104301, 0, 0, 'Crimson Monk - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1104301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1104301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2627, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Monk - Say Text');

-- Remove custom stuff.
UPDATE `creature` SET `id`=10424 WHERE `id` IN (160000, 160001, 160002);
UPDATE `creature` SET `id`=10425 WHERE `id` IN (160003, 160004, 160005);
DELETE FROM `creature` WHERE `id` IN (160010, 160011);
DELETE FROM `creature_template` WHERE `entry` IN (160000, 160001, 160002, 160003, 160004, 160005, 160010, 160011);
DELETE FROM `creature_ai_events` WHERE `creature_id` IN (160000, 160001, 160002);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (16000003, 16000103, 16000203);
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14646;
DELETE FROM `script_texts` WHERE `entry`=-1900114;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
