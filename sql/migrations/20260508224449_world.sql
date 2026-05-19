DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260508224449');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260508224449');
-- Add your query below.


-- Assign script to quest.
UPDATE `quest_template` SET `StartScript`=219 WHERE `entry`=219;

-- Start script for quest Missing In Action.
DELETE FROM `quest_start_scripts` WHERE `id`=219;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(219, 0, 0, 61, 219, 900, 0, 0, 0, 0, 0, 8, 0, 21901, 1014, 21902, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Start Scripted Map Event'),
(219, 1, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Remove Quest Giver Flag'),
(219, 1, 0, 22, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Set Faction to Escortee'),
(219, 1, 0, 20, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Start Waypoints');

-- Success script for quest Missing In Action.
DELETE FROM `generic_scripts` WHERE `id`=21901;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21901, 0, 0, 7, 219, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action Success: Complete Quest');
-- Failure script for quest Missing In Action.
DELETE FROM `generic_scripts` WHERE `id`=21902;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(21902, 0, 0, 70, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action Failed: Fail Quest'),
(21902, 0, 0, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action Failed: Corporal Keeshan - Respawn');

-- Waypoints for Corporal Keeshan.
DELETE FROM `script_waypoint` WHERE `entry`=349;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(349, 1, -8756.774414, -2187.117188, 139.975235, 2.96706, 8000, 0.000000, 34901),
(349, 2, -8764.498047, -2186.200195, 141.255325, 100.000000, 0, 0.000000, 0),
(349, 3, -8771.663086, -2188.857910, 141.467651, 100.000000, 0, 0.000000, 0),
(349, 4, -8777.026367, -2194.626465, 140.929031, 100.000000, 0, 0.000000, 0),
(349, 5, -8802.437500, -2186.836182, 141.779022, 100.000000, 0, 0.000000, 0),
(349, 6, -8818.007813, -2185.770996, 139.119141, 100.000000, 0, 0.000000, 0),
(349, 7, -8827.189453, -2199.761230, 139.602493, 100.000000, 0, 0.000000, 0),
(349, 8, -8819.643555, -2216.624512, 143.475601, 100.000000, 0, 0.000000, 0),
(349, 9, -8809.780273, -2229.332031, 143.393463, 100.000000, 0, 0.000000, 0),
(349, 10, -8798.468750, -2240.022461, 146.572479, 100.000000, 0, 0.000000, 0),
(349, 11, -8795.835938, -2247.290039, 146.632980, 100.000000, 0, 0.000000, 0),
(349, 12, -8791.724609, -2253.318115, 146.518097, 100.000000, 0, 0.000000, 0),
(349, 13, -8781.047852, -2258.273193, 148.384613, 100.000000, 0, 0.000000, 0),
(349, 14, -8769.336914, -2259.917236, 150.166519, 100.000000, 0, 0.000000, 0),
(349, 15, -8758.278320, -2256.572998, 151.804001, 100.000000, 0, 0.000000, 0),
(349, 16, -8750.838867, -2253.874512, 152.853973, 100.000000, 0, 0.000000, 0),
(349, 17, -8743.175781, -2251.614502, 154.052948, 100.000000, 0, 0.000000, 0),
(349, 18, -8713.074219, -2246.052979, 154.705551, 100.000000, 0, 0.000000, 0),
(349, 19, -8699.220703, -2241.554688, 153.391769, 100.000000, 0, 0.000000, 0),
(349, 20, -8685.156250, -2242.143311, 154.900909, 100.000000, 0, 0.000000, 0),
(349, 21, -8667.739258, -2251.729004, 155.023972, 100.000000, 0, 0.000000, 0),
(349, 22, -8667.250977, -2258.356934, 155.869400, 100.000000, 0, 0.000000, 0),
(349, 23, -8672.578125, -2268.921387, 156.249405, 100.000000, 0, 0.000000, 0),
(349, 24, -8674.071289, -2284.658691, 155.968658, 100.000000, 0, 0.000000, 0),
(349, 25, -8678.271484, -2302.951172, 156.041306, 100.000000, 45000, 0.000000, 34925),
-- 0 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) updates stand_state to 1 (UNIT_STAND_STATE_SIT).
-- 0 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) says text id 26: "Ah, fresh air at last! I need a moment to rest, $N."
(349, 26, -8678.271484, -2302.951172, 156.041306, 4.4, 0, 0.000000, 34929),
-- 0 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) says text id 27: "The Blackrock infestation is thick in these parts.  I will do my best to keep the pace, $N.  Let's go!"
(349, 27, -8681.604492, -2314.644043, 156.041306, 100.000000, 0, 0.000000, 0),
(349, 28, -8684.482422, -2322.194824, 156.041306, 100.000000, 0, 0.000000, 0),
(349, 29, -8706.987305, -2344.317627, 156.041321, 100.000000, 0, 0.000000, 0),
(349, 30, -8731.033203, -2359.067627, 156.640259, 100.000000, 0, 0.000000, 0),
(349, 31, -8748.250000, -2369.453857, 157.902924, 100.000000, 0, 0.000000, 0),
(349, 32, -8759.797852, -2380.400391, 156.656189, 100.000000, 0, 0.000000, 0),
(349, 33, -8768.086914, -2398.629883, 156.122101, 100.000000, 0, 0.000000, 0),
(349, 34, -8777.184570, -2416.556641, 156.597412, 100.000000, 0, 0.000000, 0),
(349, 35, -8785.366211, -2441.523438, 147.629089, 100.000000, 0, 0.000000, 0),
(349, 36, -8795.291992, -2469.578369, 135.789413, 100.000000, 0, 0.000000, 0),
(349, 37, -8818.275391, -2484.539063, 132.978073, 100.000000, 0, 0.000000, 0),
(349, 38, -8841.510742, -2500.103027, 131.892944, 100.000000, 0, 0.000000, 0),
(349, 39, -8862.218750, -2524.448486, 134.248489, 100.000000, 0, 0.000000, 0),
(349, 40, -8870.515625, -2546.190674, 130.735840, 100.000000, 0, 0.000000, 0),
(349, 41, -8885.909180, -2556.921143, 130.621429, 100.000000, 0, 0.000000, 0),
(349, 42, -8900.654297, -2566.798096, 130.758728, 100.000000, 0, 0.000000, 0),
(349, 43, -8914.742188, -2579.256348, 132.500290, 100.000000, 500, 0.000000, 34943),
-- 0 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) says text id 28: "So close to blessed Lakeshire.  By the Light, let my legs carry me a bit further!"
(349, 44, -8930.737305, -2590.250000, 132.553955, 100.000000, 0, 0.000000, 0),
(349, 45, -8939.149414, -2594.907227, 132.570755, 100.000000, 0, 0.000000, 0),
(349, 46, -8957.661133, -2601.201416, 132.510574, 100.000000, 0, 0.000000, 0),
(349, 47, -8976.698242, -2605.013916, 132.306412, 100.000000, 0, 0.000000, 0),
(349, 48, -8986.180664, -2605.864258, 131.836151, 100.000000, 0, 0.000000, 0),
(349, 49, -9004.048828, -2601.884766, 128.325989, 100.000000, 0, 0.000000, 0),
(349, 50, -9019.043945, -2590.051758, 126.610672, 100.000000, 0, 0.000000, 0),
(349, 51, -9026.456055, -2583.892090, 126.035851, 100.000000, 0, 0.000000, 0),
(349, 52, -9045.887695, -2563.315674, 124.455009, 100.000000, 0, 0.000000, 0),
(349, 53, -9060.849609, -2551.826172, 123.816978, 100.000000, 0, 0.000000, 0),
(349, 54, -9077.220703, -2541.970215, 121.284126, 100.000000, 0, 0.000000, 0),
(349, 55, -9104.367188, -2515.371582, 117.201836, 100.000000, 0, 0.000000, 0),
(349, 56, -9117.097656, -2500.597412, 116.753403, 100.000000, 0, 0.000000, 0),
(349, 57, -9135.351563, -2467.191650, 112.999771, 100.000000, 0, 0.000000, 0),
(349, 58, -9143.421875, -2449.995850, 109.516495, 100.000000, 0, 0.000000, 0),
(349, 59, -9153.425781, -2433.835938, 106.704918, 100.000000, 0, 0.000000, 0),
(349, 60, -9155.898438, -2408.700684, 103.662605, 100.000000, 0, 0.000000, 0),
(349, 61, -9155.791992, -2390.610596, 99.748459, 100.000000, 0, 0.000000, 0),
(349, 62, -9173.935547, -2372.349365, 93.060570, 100.000000, 0, 0.000000, 0),
(349, 63, -9200.840820, -2346.670654, 86.107567, 100.000000, 0, 0.000000, 0),
(349, 64, -9225.755859, -2317.485596, 80.530731, 100.000000, 0, 0.000000, 0),
(349, 65, -9239.875000, -2305.052979, 76.854408, 100.000000, 0, 0.000000, 0),
(349, 66, -9256.875977, -2298.223145, 72.580376, 100.000000, 0, 0.000000, 0),
(349, 67, -9277.176758, -2296.198730, 68.187759, 100.000000, 35000, 0.000000, 34967),
-- 5 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) says text id 29: "Marshal Marris, sir.  Corporal Keeshan of the 12th Sabre Regiment returned from battle and reporting for duty!"
-- 8 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) says text id 30: "Brave $c, thank you for rescuing me! I am sure Marshal Marris will reward your kind deed, $N."
-- 11 SECONDS LATER: Creature Corporal Keeshan (Guid: 51 Entry: 349) despawns or goes out range.
(349, 68, -9277.176758, -2296.198730, 68.187759, 100.000000, 0, 0.000000, 0);

-- Waypoint scripts for Corporal Keeshan.
DELETE FROM `creature_movement_scripts` WHERE `id`=34901;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34901, 0, 0, 0, 0, 0, 0, 0, 219, 0, 23, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=34925;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34925, 0, 0, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Set Stand State to Sit'),
(34925, 0, 0, 0, 0, 0, 0, 0, 219, 0, 23, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=34929;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34929, 0, 0, 0, 0, 0, 0, 0, 219, 0, 23, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text'),
(34929, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Set Stand State to Stand');
DELETE FROM `creature_movement_scripts` WHERE `id`=34943;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text'),
(34943, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Set Run');
DELETE FROM `creature_movement_scripts` WHERE `id`=34967;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34967, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Move Idle'),
(34967, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text'),
(34967, 10, 0, 0, 0, 0, 0, 0, 219, 0, 23, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Say Text'),
(34967, 10, 0, 62, 219, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - End Scripted Map Event'),
(34967, 30, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Missing In Action: Corporal Keeshan - Despawn');

-- Events list for Corporal Keeshan
DELETE FROM `creature_ai_events` WHERE `creature_id`=349;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(34901, 349, 0, 4, 0, 100, 0, 0, 0, 0, 0, 34901, 0, 0, 'Corporal Keeshan - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=34901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(34901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 496, 497, 0, 0, 0, 0, 0, 0, 0, 'Corporal Keeshan - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (3490, 'Redridge - Corporal Keeshan', 11972, 100, 1, 0, 0, 256, 4, 12, 4, 12, 0, 21008, 100, 1, 0, 0, 0, 0, 8, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=3490, `ai_name`='EventAI', `script_name`='' WHERE `entry`=349;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
