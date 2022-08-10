DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220205202111');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220205202111');
-- Add your query below.


SET @LUNAR_FESTIVAL_ELDERS_CGUID = 52364;
SET @LUNAR_FESTIVAL_REVELER = 18581;
SET @CHINESE_NEW_YEAR_EVENT_GGUID = 88093;
SET @LUNAR_FESTIVAL_GGUID = 13642;
SET @LUNAR_FESTIVAL_EVENT = 7;
SET @CHINESE_NEW_YEAR_EVENT = 38;

UPDATE `game_event` SET `description`='Lunar Festival: Minions of Omen' WHERE `entry`=43;

-- If you try to teleport to one of your enemies' cities, it should port you to the Moonglade teleport position.
UPDATE `spell_scripts` SET `datalong`=26451 WHERE `datalong`=26471;

UPDATE `creature_template` SET `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=256 WHERE entry IN (15549,15556,15557,15558,15559,15560,15561,15562,15563,15564,15565,15566,15567,15568,15569,15570,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15585,15586,15587,15588,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15871);
UPDATE `creature_template` SET `display_scale1`=1.35, `display_scale2`=1.25, `display_scale4`=1.35, `display_scale3`=1.25, `gossip_menu_id`=6935, `level_min`=55, `level_max`=55, `health_min`=2614, `health_max`=2614, `npc_flags`=1, `speed_walk`=1, `unit_flags`=512, `ai_name`='EventAI' WHERE `entry`=15917;

-- Delete old Elders from Event.
DELETE FROM `game_event_creature` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE id IN (15549,15556,15557,15558,15559,15560,15561,15562,15563,15564,15565,15566,15567,15568,15569,15570,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15585,15586,15587,15588,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15871));

-- Delete old Elders.
DELETE FROM `creature` WHERE id IN (15549,15556,15557,15558,15559,15560,15561,15562,15563,15564,15565,15566,15567,15568,15569,15570,15572,15573,15574,15575,15576,15577,15578,15579,15580,15581,15582,15583,15584,15585,15586,15587,15588,15592,15593,15594,15595,15596,15597,15598,15599,15600,15601,15602,15603,15604,15605,15606,15607,15871);

-- Lunar Festival Reveler gossip.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6935, 8224, 0, 0);
-- INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES (8224, 11685, 1, 11686, 1, 11687, 1, 11688, 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Lunar Festival Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15917;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1591701, 15917, 0, 1, 0, 100, 0, 30000, 45000, 30000, 45000, 1591701, 0, 0, 'Lunar Festival Reveler - OneShotCheerNoSheathe');

DELETE FROM `creature_ai_scripts` WHERE `id`=1591701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1591701, 0, 0, 1, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Reveler - OneShotCheerNoSheathe');

-- Lunar Festival Reveler from the "Firework Event".
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
    (@LUNAR_FESTIVAL_REVELER+1, 15917, 0, 0, 0, 1, 7562, -2496.44, 456.051, 0.261799, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+2, 15917, 0, 0, 0, 1, 7562.65, -2492.78, 455.536, 0.226893, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+3, 15917, 0, 0, 0, 1, 7605.83, -2434.08, 453.447, 5.53269, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+4, 15917, 0, 0, 0, 1, 7609.15, -2432.92, 454.07, 5.51524, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+5, 15917, 0, 0, 0, 1, 7696.41, -2380.51, 456.675, 4.27606, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+6, 15917, 0, 0, 0, 1, 7699.31, -2378.45, 456.25, 4.27606, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+7, 15917, 0, 0, 0, 1, 7720.24, -2800.1, 457.022, 4.85202, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+8, 15917, 0, 0, 0, 1, 7722.82, -2800.13, 457.393, 3.63028, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+9, 15917, 0, 0, 0, 1, 7725.86, -2798.65, 457.365, 3.26377, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+10, 15917, 0, 0, 0, 1, 7761.18, -2562.38, 476.494, 2.42601, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+11, 15917, 0, 0, 0, 1, 7761.47, -2557.42, 476.012, 2.46091, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+12, 15917, 0, 0, 0, 1, 7789.94, -2805.3, 455.839, 1.48353, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+13, 15917, 0, 0, 0, 1, 7792.77, -2806.8, 456.11, 1.55334, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+14, 15917, 0, 0, 0, 1, 7876.45, -2759, 480.762, 2.98451, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+15, 15917, 0, 0, 0, 1, 7518.27, -2590.84, 456.007, 0.383972, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+16, 15917, 0, 0, 0, 1, 7520.05, -2587.39, 456.376, 4.86947, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+17, 15917, 0, 0, 0, 1, 7546.61, -2523.47, 455.782, 0.453786, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+18, 15917, 0, 0, 0, 1, 7547.03, -2517.01, 456.756, 0.418879, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+19, 15917, 0, 0, 0, 1, 7547.99, -2519.92, 455.821, 5.49779, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+20, 15917, 0, 0, 0, 1, 7573.81, -2465.29, 454.215, 6.19592, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+21, 15917, 0, 0, 0, 1, 7654.72, -2415.8, 455.192, 4.66003, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+22, 15917, 0, 0, 0, 1, 7657.82, -2412.89, 455.257, 4.64258, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+23, 15917, 0, 0, 0, 1, 7747.98, -2416.24, 487.85, 3.87463, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+24, 15917, 0, 0, 0, 1, 7748.75, -2418.83, 487.834, 3.85718, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+25, 15917, 0, 0, 0, 1, 7757.48, -2776.26, 456.102, 5.39307, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+26, 15917, 0, 0, 0, 1, 7759.67, -2779.19, 456.464, 2.11185, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_REVELER+27, 15917, 0, 0, 0, 1, 7762.35, -2781.49, 456.091, 0.925025, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10);
INSERT INTO `game_event_creature` SELECT creature.guid, @CHINESE_NEW_YEAR_EVENT FROM `creature` WHERE creature.guid BETWEEN @LUNAR_FESTIVAL_REVELER+1 AND @LUNAR_FESTIVAL_REVELER+27;

INSERT INTO `creature_addon` (`guid`, `patch`, `display_id`, `mount_display_id`, `equipment_id`, `stand_state`, `sheath_state`, `emote_state`, `auras`) VALUES
    (@LUNAR_FESTIVAL_REVELER+1, 7, 15876, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+2, 7, 15863, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+3, 7, 15875, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+4, 7, 15876, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+5, 7, 15876, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+6, 7, 15877, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+7, 7, 15875, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+8, 7, 15863, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+9, 7, 15877, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+10, 7, 15876, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+11, 7, 15863, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+12, 7, 15863, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+13, 7, 15875, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+14, 7, 15877, -1, -1, 0, 1, 0, NULL),
    (@LUNAR_FESTIVAL_REVELER+15, 7, 15877, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+16, 7, 15875, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+17, 7, 15876, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+18, 7, 15875, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+19, 7, 15877, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+20, 7, 15863, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+21, 7, 15863, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+22, 7, 15863, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+23, 7, 15877, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+24, 7, 15877, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+25, 7, 15877, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+26, 7, 15875, -1, -1, 0, 1, 0, 26520),
    (@LUNAR_FESTIVAL_REVELER+27, 7, 15876, -1, -1, 0, 1, 0, 26520);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
    (@CHINESE_NEW_YEAR_EVENT_GGUID+1, 180766, 1, 7491.38, -2633.52, 450.941, 0.226892, 0, 0, 0.113203, 0.993572, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+2, 180766, 1, 7524.86, -2600.55, 450.8, 5.93412, 0, 0, -0.173648, 0.984808, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+3, 180766, 1, 7543.83, -2567.73, 450.712, 3.15906, 0, 0, -0.999962, 0.00873464, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+4, 180766, 1, 7553.67, -2536.97, 451.032, 5.88176, 0, 0, -0.199368, 0.979925, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+5, 180766, 1, 7559.13, -2514.58, 450.875, 2.60054, 0, 0, 0.96363, 0.267241, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+6, 180766, 1, 7573.77, -2501.15, 450.273, 0.890117, 0, 0, 0.430511, 0.902586, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+7, 180766, 1, 7581.16, -2474.46, 451.712, 4.59022, 0, 0, -0.748956, 0.66262, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+8, 180766, 1, 7594.1, -2450.5, 451.038, 3.82227, 0, 0, -0.942641, 0.333808, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+9, 180766, 1, 7608.72, -2440.05, 451.532, 4.08407, 0, 0, -0.891006, 0.453991, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+10, 180766, 1, 7641.8, -2430.87, 450.337, 3.63029, 0, 0, -0.970295, 0.241925, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+11, 180766, 1, 7665.79, -2415.59, 451.304, 5.65487, 0, 0, -0.309016, 0.951057, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+12, 180766, 1, 7669.55, -2773.71, 452.108, 5.23599, 0, 0, -0.5, 0.866025, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+13, 180766, 1, 7674.59, -2401.74, 450.919, 1.8675, 0, 0, 0.803857, 0.594823, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+14, 180766, 1, 7696.71, -2776.5, 452.153, 4.29351, 0, 0, -0.83867, 0.54464, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+15, 180766, 1, 7708.89, -2383.89, 450.981, 1.5708, 0, 0, 0.707107, 0.707107, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+16, 180766, 1, 7715.85, -2786.95, 451.679, 0.453785, 0, 0, 0.224951, 0.97437, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+17, 180766, 1, 7734.81, -2771.74, 451.385, 4.25861, 0, 0, -0.848047, 0.529921, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+18, 180766, 1, 7739.33, -2412.93, 483.204, 4.83456, 0, 0, -0.66262, 0.748956, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+19, 180766, 1, 7744.6, -2424.32, 483.682, 5.02655, 0, 0, -0.587785, 0.809017, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+20, 180766, 1, 7747.68, -2437.37, 481.161, 5.96903, 0, 0, -0.156434, 0.987688, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+21, 180766, 1, 7753.63, -2464.1, 446.87, 0.157079, 0, 0, 0.0784588, 0.996917, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+22, 180766, 1, 7757.9, -2450.46, 482.305, 2.04204, 0, 0, 0.85264, 0.522499, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+23, 180766, 1, 7758.63, -2558.44, 474.783, 5.02655, 0, 0, -0.587785, 0.809017, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+24, 180766, 1, 7768.39, -2589.85, 455.688, 6.26573, 0, 0, -0.00872612, 0.999962, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+25, 180766, 1, 7768.81, -2468.57, 475.611, 1.74533, 0, 0, 0.766044, 0.642789, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+26, 180766, 1, 7797.82, -2529.2, 476.852, 3.33359, 0, 0, -0.995396, 0.0958512, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+27, 180766, 1, 7798.89, -2801.79, 452.867, 5.68977, 0, 0, -0.292372, 0.956305, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+28, 180766, 1, 7800.93, -2508.49, 483.081, 5.5676, 0, 0, -0.350207, 0.936672, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+29, 180766, 1, 7807.66, -2641.6, 461.649, 0.157079, 0, 0, 0.0784588, 0.996917, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+30, 180766, 1, 7861.41, -2753.02, 471.127, 5.61996, 0, 0, -0.325567, 0.945519, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+31, 180766, 1, 7889.64, -2712.69, 467.247, 5.8294, 0, 0, -0.224951, 0.97437, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+32, 180766, 1, 7949.07, -2627.79, 493.044, 4.4855, 0, 0, -0.782608, 0.622515, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+33, 180766, 1, 7951.32, -2617.37, 493.063, 4.60767, 0, 0, -0.743144, 0.669131, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+34, 180768, 1, 7520.31, -2617.54, 450.199, 3.33359, 0, 0, -0.995396, 0.0958512, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+35, 180768, 1, 7536.02, -2586.88, 449.646, 5.98648, 0, 0, -0.147809, 0.989016, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+36, 180768, 1, 7550.19, -2547.8, 451.576, 1.85005, 0, 0, 0.798635, 0.601815, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+37, 180768, 1, 7554.98, -2528.14, 451.427, 4.08407, 0, 0, -0.891006, 0.453991, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+38, 180768, 1, 7563.56, -2504.97, 452.644, 3.57793, 0, 0, -0.976295, 0.216442, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+39, 180768, 1, 7563.9, -2478.81, 452.568, 4.67748, 0, 0, -0.719339, 0.694659, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+40, 180768, 1, 7584.67, -2461.98, 451.824, 1.20428, 0, 0, 0.566406, 0.824126, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+41, 180768, 1, 7620.65, -2441.09, 451.071, 0.541051, 0, 0, 0.267238, 0.963631, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+42, 180768, 1, 7631.89, -2440.19, 450.678, 2.93214, 0, 0, 0.994521, 0.104536, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+43, 180768, 1, 7648.09, -2801.97, 449.723, 0.471238, 0, 0, 0.233445, 0.97237, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+44, 180768, 1, 7656.54, -2423.35, 451.308, 3.21142, 0, 0, -0.999391, 0.0349061, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+45, 180768, 1, 7685.03, -2772.6, 452.9, 1.55334, 0, 0, 0.700909, 0.713251, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+46, 180768, 1, 7694.72, -2392.29, 451.447, 0.715585, 0, 0, 0.350207, 0.936672, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+47, 180768, 1, 7725.27, -2427.91, 458.98, 4.97419, 0, 0, -0.608761, 0.793354, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+48, 180768, 1, 7735.74, -2347.46, 452.902, 3.59538, 0, 0, -0.97437, 0.224951, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+49, 180768, 1, 7738.66, -2385.33, 471.091, 6.23083, 0, 0, -0.0261765, 0.999657, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+50, 180768, 1, 7739.56, -2460.69, 463.761, 4.71239, 0, 0, -0.707107, 0.707107, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+51, 180768, 1, 7745.25, -2566.8, 462.147, 3.64774, 0, 0, -0.968147, 0.250381, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+52, 180768, 1, 7752.75, -2764.29, 450.983, 0.750491, 0, 0, 0.366501, 0.930418, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+53, 180768, 1, 7779.55, -2786.56, 452.142, 3.29869, 0, 0, -0.996917, 0.0784664, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+54, 180768, 1, 7787.35, -2497.64, 478.413, 2.65289, 0, 0, 0.970295, 0.241925, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+55, 180768, 1, 7794.49, -2468.43, 481.132, 5.3058, 0, 0, -0.469471, 0.882948, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+56, 180768, 1, 7873.27, -2765.15, 478.988, 3.63029, 0, 0, -0.970295, 0.241925, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+57, 180768, 1, 7877.13, -2755.78, 480.833, 4.86947, 0, 0, -0.649447, 0.760406, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+58, 180768, 1, 7877.18, -2616.02, 453.095, 6.14356, 0, 0, -0.0697556, 0.997564, 120, 120, 100, 1, 0, 0, 7, 10),
    (@CHINESE_NEW_YEAR_EVENT_GGUID+59, 180768, 1, 7893.55, -2691.9, 454.543, 4.32842, 0, 0, -0.829037, 0.559194, 120, 120, 100, 1, 0, 0, 7, 10);
INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @CHINESE_NEW_YEAR_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @CHINESE_NEW_YEAR_EVENT_GGUID+1 AND @CHINESE_NEW_YEAR_EVENT_GGUID+59;

-- Respawn Elders.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
    (@LUNAR_FESTIVAL_ELDERS_CGUID+1, 15573, 0, 0, 0, 1, -9579.68, -2723.7, 13.9323, 5.53269, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+2, 15583, 0, 0, 0, 1, -7845.33, -1330.45, -264.405, 3.15905, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+3, 15586, 0, 0, 0, 1, -7155.9, -3769.91, 9.1562, 2.37365, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+4, 15599, 0, 0, 0, 1, -6832.99, 831.573, 49.5379, 2.61799, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+5, 15570, 0, 0, 0, 1, -6233.34, 1733.29, 5.12093, 3.7001, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+6, 15604, 0, 0, 0, 1, -6226.63, -3917.87, -59.7434, 1.18682, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+7, 15584, 0, 0, 0, 1, -5435.71, -2431.92, 89.3615, 5.42797, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+8, 15581, 0, 0, 0, 1, -4122.6, 110.454, 75.8846, 5.77704, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+9, 15587, 0, 0, 0, 1, -3806.54, 1093.72, 132.053, 6.26573, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+10, 15588, 0, 0, 0, 1, -2297.67, -1948.05, 96.3634, 3.61283, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+11, 15575, 0, 0, 0, 1, -2103.06, -438.984, -7.22764, 1.44862, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+12, 15580, 0, 0, 0, 1, -1012.62, -245.095, 159.361, 0.244346, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+13, 15582, 0, 0, 0, 1, -869.85, -3725.6, 24.4655, 4.62512, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+14, 15597, 0, 0, 0, 1, -460.237, -2586.04, 99.476, 5.13127, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+15, 15572, 0, 0, 0, 1, 269.454, -4777.18, 11.9039, 1.6057, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+16, 15579, 0, 0, 0, 1, 1957.36, -4257.51, 31.384, 1.23918, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+17, 15600, 0, 0, 0, 1, 2465.04, -6955.1, 112.323, 1.76278, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+18, 15605, 0, 0, 0, 1, 2793.03, -349.605, 108.471, 2.21657, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+19, 15603, 0, 0, 0, 1, 5101.41, -527.394, 334.471, 4.53786, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+20, 15601, 0, 0, 0, 1, 6292.08, 530.671, 16.3725, 5.61996, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+21, 15606, 0, 0, 0, 1, 6466.88, -4265.45, 663.761, 0.767945, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+22, 15574, 0, 0, 0, 1, 6746.22, -4679.31, 725.611, 1.5708, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+23, 15595, 0, 0, 0, 1, 9768.04, 895.38, 1297.14, 1.25664, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+24, 15598, 0, 0, 0, 1, 10137.4, 2583.92, 1325.58, 4.38078, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+25, 15576, 0, 0, 0, 0, -14327.7, 458.502, 8.04239, 2.6529, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+26, 15596, 0, 0, 0, 0, -11954.2, -1168.82, 77.7486, 0.506145, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+27, 15563, 0, 0, 0, 0, -11721.4, -3209.99, 6.88361, 6.26573, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+28, 15577, 0, 0, 0, 0, -10498.7, 1034.05, 95.6965, 1.43117, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+29, 15565, 0, 0, 0, 0, -9413.27, 154.286, 57.1548, 2.14675, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+30, 15562, 0, 0, 0, 0, -8761.99, 1092.71, 94.8771, 5.13127, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+31, 15557, 0, 0, 0, 0, -7938.57, -2674.64, 209.226, 3.75246, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+32, 15585, 0, 0, 0, 0, -7500.86, -2154.59, 145.989, 2.72271, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+33, 15567, 0, 0, 0, 0, -7276.75, -797.924, 296.582, 5.8294, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+34, 15569, 0, 0, 0, 0, -5571.58, -503.608, 403.093, 1.91986, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+35, 15558, 0, 0, 0, 0, -5343.72, -2912.94, 345.191, 4.43314, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+36, 15871, 0, 0, 0, 0, -4659.2, -944.427, 500.461, 4.24115, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+37, 15559, 0, 0, 0, 0, 233.456, -3499.97, 161.033, 0.785398, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+38, 15561, 0, 0, 0, 0, 514.754, 1560.97, 130.145, 4.39823, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+39, 15594, 0, 0, 0, 0, 1261.16, -2558.27, 118.29, 0.506145, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+40, 15564, 0, 0, 0, 0, 1633.3, 233.931, 62.6749, 0.401426, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+41, 15592, 0, 0, 0, 0, 1853.99, -3721.45, 162.308, 1.27409, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+42, 15602, 0, 0, 0, 0, 1995.88, -2420.17, 59.3823, 2.72271, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+43, 15568, 0, 0, 0, 0, 2215.43, 237.536, 34.7272, 1.69297, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+44, 15566, 0, 0, 0, 0, 2237.86, -5340.41, 84.7113, 1.13446, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+45, 15560, 0, 0, 0, 229, 67.8133, -537.544, 32.1637, 2.63545, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+46, 15607, 0, 0, 0, 329, 3705.22, -3466.81, 130.794, 0, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+47, 15593, 0, 0, 0, 109, -414.836, 5.38781, -90.772, 2.11185, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+48, 15549, 0, 0, 0, 230, 596.586, -188.771, -54.0721, 0.10472, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+49, 15578, 0, 0, 0, 209, 1689.04, 1147.57, 8.96011, 2.37365, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_ELDERS_CGUID+50, 15556, 0, 0, 0, 349, -139.935, -363.996, -170.336, 6.16101, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10);
INSERT INTO `game_event_creature` SELECT creature.guid, @LUNAR_FESTIVAL_EVENT FROM `creature` WHERE creature.guid BETWEEN @LUNAR_FESTIVAL_ELDERS_CGUID+1 AND @LUNAR_FESTIVAL_ELDERS_CGUID+44;

-- Fix all Launcher animations "(`requiresSpellFocus`=1351 OR `requiresSpellFocus`=1352) AND (`effect1`=86 OR `effect2`=86) GROUP BY entry".
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectMiscValue`, `Comment`) VALUES
    (26286, 0, 4, 'Fix Launcher animation for Small Red Rocket'),
    (26291, 1, 4, 'Fix Launcher animation for Small Blue Rocket'),
    (26292, 0, 4, 'Fix Launcher animation for Small Green Rocket'),
    (26293, 0, 4, 'Fix Launcher animation for Small Purple Rocket'),
    (26294, 0, 4, 'Fix Launcher animation for Small White Rocket'),
    (26295, 0, 4, 'Fix Launcher animation for Small Yellow Rocket'),
    (26304, 0, 4, 'Fix Launcher animation for Blue Firework Cluster'),
    (26325, 0, 4, 'Fix Launcher animation for Green Firework Cluster'),
    (26326, 0, 4, 'Fix Launcher animation for Purple Firework Cluster'),
    (26327, 0, 4, 'Fix Launcher animation for Red Firework Cluster'),
    (26328, 0, 4, 'Fix Launcher animation for White Firework Cluster'),
    (26329, 0, 4, 'Fix Launcher animation for Yellow Firework Cluster'),
    (26333, 0, 4, 'Fix Launcher animation for Large Blue Rocket'),
    (26334, 0, 4, 'Fix Launcher animation for Large Green Rocket'),
    (26335, 0, 4, 'Fix Launcher animation for Large Purple Rocket'),
    (26336, 0, 4, 'Fix Launcher animation for Large Red Rocket'),
    (26337, 0, 4, 'Fix Launcher animation for Large White Rocket'),
    (26338, 0, 4, 'Fix Launcher animation for Large Yellow Rocket'),
    (26488, 0, 4, 'Fix Launcher animation for Large Blue Firework Cluster'),
    (26490, 0, 4, 'Fix Launcher animation for Large Green Firework Cluster'),
    (26516, 0, 4, 'Fix Launcher animation for Large Purple Firework Cluster'),
    (26517, 0, 4, 'Fix Launcher animation for Large Red Firework Cluster'),
    (26518, 0, 4, 'Fix Launcher animation for Large White Firework Cluster'),
    (26519, 0, 4, 'Fix Launcher animation for Large Yellow Firework Cluster'),
    (26521, 0, 4, 'Fix Launcher animation for Lucky Lunar Rocket');

-- Thanks to TC bruteforced Gameobjects, we have now the real names for the traps (The missing space must be a typo by Blizzard).
UPDATE `gameobject_template` SET `name`='Port to Moonglade TRAP' WHERE `entry`=180891;
UPDATE `gameobject_template` SET `name`='Port to StormwindTRAP' WHERE `entry`=180892;
UPDATE `gameobject_template` SET `name`='Port to Ironforge TRAP' WHERE `entry`=180893;
UPDATE `gameobject_template` SET `name`='Port to Darnassus TRAP' WHERE `entry`=180894;
UPDATE `gameobject_template` SET `name`='Port to OrgrimmarTRAP' WHERE `entry`=180895;
UPDATE `gameobject_template` SET `name`='Port to Undercity TRAP' WHERE `entry`=180896;
UPDATE `gameobject_template` SET `name`='Port to Thunder Bluff TRAP' WHERE `entry`=180897;

UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Orgrimmar - Port Alliance Player to Moonglade' WHERE `id`=26414 AND `comments`='Lunar Teleport Cap: Orgrimmar - Send Error to Alliance Player';
UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Thunderbluff - Port Alliance Player to Moonglade' WHERE `id`=26412 AND `comments`='Lunar Teleport Cap: Thunderbluff - Send Error to Alliance Player';
UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Undercity - Port Alliance Player to Moonglade' WHERE `id`=26410 AND `comments`='Lunar Teleport Cap: Undercity - Send Error to Alliance Player';
UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Darnassus - Port Horde Player to Moonglade' WHERE `id`=26409 AND `comments`='Lunar Teleport Cap: Darnassus - Send Error to Horde Player';
UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Ironforge - Port Horde Player to Moonglade' WHERE `id`=26408 AND `comments`='Lunar Teleport Cap: Ironforge - Send Error to Horde Player';
UPDATE `spell_scripts` SET `comments`='Lunar Teleport Cap: Stormwind - Port Horde Player to Moonglade' WHERE `id`=26406 AND `comments`='Lunar Teleport Cap: Stormwind - Send Error to Horde Player';

-- Fix Questgiver flag for some Horde npcs.
DELETE FROM `creature_ai_events` WHERE `id`=1589202;
DELETE FROM `creature_ai_scripts` WHERE `id`=1589202;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1589202, 15892, 260, 1, 0, 100, 0, 0, 0, 0, 0, 1589202, 0, 0, 'Lunar Festival Emissary - Modify Flags on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1589102, 15891, 261, 1, 0, 100, 0, 0, 0, 0, 0, 1589102, 0, 0, 'Lunar Festival Herald - Modify Flags on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589202, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Emissary - Modify Flags');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1589102, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Herald - Modify Flags');
DELETE FROM `conditions` WHERE `condition_entry`=260;
DELETE FROM `conditions` WHERE `condition_entry`=261;
DELETE FROM `conditions` WHERE `condition_entry`=262;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (260, 52, 12469, 12460, 12526, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (261, 52, 12478, 12496, 12487, 0, 1);

-- 1111:  Not (Source's Entry Is 15882)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1111, 16, 15882, 0, 0, 0, 1);

INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26347, 0, 180771, 1111, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26347, 0, 180868, 1111, 0, 5086, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26347, 0, 180850, 1111, 0, 5086, 5875);

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1590505, 1590507);

-- Events list for Darnassus Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15905;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590501, 15905, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1590501, 0, 0, 'Darnassus Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590502, 15905, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1590502, 0, 0, 'Darnassus Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590503, 15905, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1590503, 0, 0, 'Darnassus Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590504, 15905, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1590504, 0, 0, 'Darnassus Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590506, 15905, 15905, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1590506, 0, 0, 'Darnassus Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590508, 15905, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590508, 0, 0, 'Darnassus Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590509, 15905, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1590509, 0, 0, 'Darnassus Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590510, 15905, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1590510, 0, 0, 'Darnassus Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590503, 0, 0, 39, 1590501, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Cast Spell Rocket, RED'),
(1590503, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1590501;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590501, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Cast Rocket, RED (Moonglade Only)'),
(1590501, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590509;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590509, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Set Phase to 2 (Moonglade Only)'),
(1590509, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590510;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590510, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1590510, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Reset Phase to 0 (Moonglade Only)');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1571905, 1571907);

-- Events list for Thunder Bluff Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15719;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571901, 15719, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1571901, 0, 0, 'Thunder Bluff Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571902, 15719, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1571902, 0, 0, 'Thunder Bluff Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571903, 15719, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1571903, 0, 0, 'Thunder Bluff Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571904, 15719, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1571904, 0, 0, 'Thunder Bluff Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571906, 15719, 15719, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1571906, 0, 0, 'Thunder Bluff Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571908, 15719, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1571908, 0, 0, 'Thunder Bluff Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571909, 15719, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1571909, 0, 0, 'Thunder Bluff Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571910, 15719, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1571910, 0, 0, 'Thunder Bluff Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1571903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1571903, 0, 0, 39, 1571901, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Cast Spell Rocket, RED'),
(1571903, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1571901;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1571901, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Cast Rocket, RED (Moonglade Only)'),
(1571901, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1571909;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1571909, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Set Phase to 2 (Moonglade Only)'),
(1571909, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1571910;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1571910, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1571910, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Reset Phase to 0 (Moonglade Only)');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1569405, 1569407);

-- Events list for Stormwind Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15694;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569401, 15694, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1569401, 0, 0, 'Stormwind Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569402, 15694, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1569402, 0, 0, 'Stormwind Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569403, 15694, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1569403, 0, 0, 'Stormwind Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569404, 15694, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1569404, 0, 0, 'Stormwind Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569406, 15694, 15694, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1569406, 0, 0, 'Stormwind Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569408, 15694, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1569408, 0, 0, 'Stormwind Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569409, 15694, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1569409, 0, 0, 'Stormwind Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569410, 15694, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1569410, 0, 0, 'Stormwind Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1569403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1569403, 0, 0, 39, 1569401, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Cast Spell Rocket, RED'),
(1569403, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1569401;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1569401, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Cast Rocket, RED (Moonglade Only)'),
(1569401, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1569409;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1569409, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Set Phase to 2 (Moonglade Only)'),
(1569409, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1569410;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1569410, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1569410, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Reset Phase to 0 (Moonglade Only)');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1590605, 1590607);

-- Events list for Ironforge Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15906;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590601, 15906, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1590601, 0, 0, 'Ironforge Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590602, 15906, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1590602, 0, 0, 'Ironforge Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590603, 15906, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1590603, 0, 0, 'Ironforge Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590604, 15906, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1590604, 0, 0, 'Ironforge Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590606, 15906, 15906, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1590606, 0, 0, 'Ironforge Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590608, 15906, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590608, 0, 0, 'Ironforge Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590609, 15906, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1590609, 0, 0, 'Ironforge Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590610, 15906, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1590610, 0, 0, 'Ironforge Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590603, 0, 0, 39, 1590601, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Cast Spell Rocket, RED'),
(1590603, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1590601;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590601, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Cast Rocket, RED (Moonglade Only)'),
(1590601, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590609;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590609, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Set Phase to 2 (Moonglade Only)'),
(1590609, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590610;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590610, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1590610, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Reset Phase to 0 (Moonglade Only)');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1590705, 1590707);

-- Events list for Undercity Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15907;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590701, 15907, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1590701, 0, 0, 'Undercity Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590702, 15907, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1590702, 0, 0, 'Undercity Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590703, 15907, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1590703, 0, 0, 'Undercity Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590704, 15907, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1590704, 0, 0, 'Undercity Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590706, 15907, 15907, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1590706, 0, 0, 'Undercity Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590708, 15907, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590708, 0, 0, 'Undercity Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590709, 15907, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1590709, 0, 0, 'Undercity Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590710, 15907, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1590710, 0, 0, 'Undercity Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590703, 0, 0, 39, 1590701, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Cast Spell Rocket, RED'),
(1590703, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1590701;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590701, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Cast Rocket, RED (Moonglade Only)'),
(1590701, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590709;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590709, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Set Phase to 2 (Moonglade Only)'),
(1590709, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590710;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590710, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1590710, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Reset Phase to 0 (Moonglade Only)');

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1590805, 1590807);

-- Events list for Orgrimmar Reveler
DELETE FROM `creature_ai_events` WHERE `creature_id`=15908;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590801, 15908, 70, 22, 0, 100, 1, 34, 0, 0, 0, 1590801, 0, 0, 'Orgrimmar Reveler - Buff and Dance on received Dance emote (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590802, 15908, 113, 22, 0, 100, 1, 58, 0, 0, 0, 1590802, 0, 0, 'Orgrimmar Reveler - Emote Shy on received Kiss emote.');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590803, 15908, 69, 1, 6, 100, 1, 1000, 1000, 1000, 1000, 1590803, 0, 0, 'Orgrimmar Reveler - Cast Rocket Red OOC (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590804, 15908, 70, 1, 0, 100, 1, 0, 20000, 35000, 40000, 1590804, 0, 0, 'Orgrimmar Reveler - Emote Cheer OOC (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590806, 15908, 15908, 1, 0, 100, 1, 0, 20000, 60000, 180000, 1590806, 0, 0, 'Orgrimmar Reveler - Emote Talk (Not in Moonglade)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590808, 15908, 69, 11, 0, 100, 1, 0, 0, 0, 0, 1590808, 0, 0, 'Orgrimmar Reveler - Set Gossip Menu Id (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590809, 15908, 0, 1, 1, 100, 1, 5000, 45000, 5000, 45000, 1590809, 0, 0, 'Orgrimmar Reveler - Emote STATE_DANCE (10) (Moonglade Only)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590810, 15908, 0, 1, 3, 100, 1, 15000, 30000, 15000, 30000, 1590810, 0, 0, 'Orgrimmar Reveler - Emote ONESHOT_NONE (0) (Moonglade Only) - Copy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590803, 0, 0, 39, 1590801, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Cast Spell Rocket, RED'),
(1590803, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Change to Phase 1');

DELETE FROM `generic_scripts` WHERE `id`=1590801;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590801, 1, 0, 15, 26347, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Cast Rocket, RED (Moonglade Only)'),
(1590801, 4, 0, 1, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Emote: OneShotLaughNoSheathe (153)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590809;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590809, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Set Phase to 2 (Moonglade Only)'),
(1590809, 0, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Emote STATE_DANCE (10) (Moonglade Only)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1590810;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1590810, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Emote ONESHOT_NONE (0) (Moonglade Only)'),
(1590810, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Reset Phase to 0 (Moonglade Only)');

-- Delete wrongly added Mailbox.
DELETE FROM `gameobject` WHERE `guid`=64628;

-- Missing Lunar Gameobjects.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
    (@LUNAR_FESTIVAL_GGUID+1, 180755, 0, -8483.79, 526.233, 105.781, 2.21656, 0, 0, 0.894934, 0.446199, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+2, 180755, 0, -8439.11, 625.298, 97.3484, 5.72468, 0, 0, -0.275637, 0.961262, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+3, 180755, 0, -5001.95, -1242, 511.28, 0.680677, 0, 0, 0.333806, 0.942642, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+4, 180755, 0, -4896.44, -980.974, 506.799, 2.26892, 0, 0, 0.906307, 0.422619, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+5, 180755, 0, -4866.29, -1148.22, 504.77, 0.471238, 0, 0, 0.233445, 0.97237, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+6, 180755, 0, -4834.15, -861.966, 505.343, 3.24635, 0, 0, -0.998629, 0.0523532, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+7, 180755, 0, -4633.95, -932.176, 507.625, 3.83973, 0, 0, -0.939692, 0.342021, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+8, 180756, 0, -5007.57, -1235.2, 511.254, 0.680677, 0, 0, 0.333806, 0.942642, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+9, 180756, 0, -4900.82, -984.625, 506.779, 2.25147, 0, 0, 0.902585, 0.430512, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+10, 180756, 0, -4825.68, -1289.34, 504.257, 1.48353, 0, 0, 0.67559, 0.737278, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+11, 180756, 0, -4802.89, -1180.28, 504.932, 1.5708, 0, 0, 0.707107, 0.707107, 120, 120, 100, 1, 0, 0, 7, 10),
    (@LUNAR_FESTIVAL_GGUID+12, 180756, 0, -4633.86, -932.095, 506.451, 3.83973, 0, 0, -0.939692, 0.342021, 120, 120, 100, 1, 0, 0, 7, 10);
INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @LUNAR_FESTIVAL_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @LUNAR_FESTIVAL_GGUID+1 AND @LUNAR_FESTIVAL_GGUID+12;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
