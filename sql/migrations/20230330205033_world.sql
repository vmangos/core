DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230330205033');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230330205033');
-- Add your query below.


-- Remove custom changes to spells assigned to items.
DELETE FROM `spell_effect_mod` WHERE `Id` IN (9082, 9095);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`, `conditionId`) VALUES (9012, 1, 6492, 0, 6492);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`, `conditionId`) VALUES (9095, 1, 6492, 0, 0);
UPDATE `spell_script_target` SET `type`=1, `conditionId`=6492 WHERE `entry`=9082;

-- 6492: Target's Health Is Equal Or Less Than 5 Percent
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6492, 41, 5, 2, 0, 0, 0);

-- 9095:  Not (Source Has Aura 9095 Index 0)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9095, 1, 9095, 0, 0, 0, 3);

-- Events list for Rift Spawn
DELETE FROM `creature_ai_events` WHERE `creature_id`=6492;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649201, 6492, 0, 2, 6, 100, 0, 5, 0, 0, 0, 649201, 0, 0, 'Rift Spawn - Stop Attacking at 1 HP (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649202, 6492, 0, 27, 5, 100, 1, 9032, 1, 1000, 1000, 649202, 0, 0, 'Rift Spawn - Despawn on Missing Stun Aura (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649203, 6492, 0, 7, 5, 100, 0, 0, 0, 0, 0, 649202, 0, 0, 'Rift Spawn - Despawn on Evade (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649204, 6492, 0, 8, 5, 100, 1, 9012, -1, 10000, 10000, 649204, 0, 0, 'Rift Spawn - Spawn Filled Contained Coffer on Hit By Spell Attract Rift Spawn (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649205, 6492, 0, 11, 0, 100, 1, 0, 0, 0, 0, 649205, 0, 0, 'Rift Spawn - Set Phase on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649206, 6492, 0, 8, 6, 100, 0, 9095, -1, 0, 0, 649206, 0, 0, 'Rift Spawn - Cast Spell Rift Spawn Manifestation on Hit By Spell Cantation of Manifestation (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (649207, 6492, 9095, 4, 6, 100, 0, 0, 0, 0, 0, 649207, 0, 0, 'Rift Spawn - Cast Spell Rift Spawn Becomes Visible on Aggro (Phase 0)');
DELETE FROM `creature_ai_scripts` WHERE `id`=649201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649201, 0, 0, 15, 9032, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Cast Spell Self Stun 30 seconds'),
(649201, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Add Not Selectable Unit Flag'),
(649201, 0, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Set Phase to 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=649202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2564, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Say Emoted Text'),
(649202, 0, 1, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Despawn Creature');
DELETE FROM `creature_ai_scripts` WHERE `id`=649204;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649204, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Set Phase to 2'),
(649204, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Combat Stop'),
(649204, 0, 2, 14, 9032, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Remove Aura Self Stun 30 seconds'),
(649204, 0, 3, 15, 9010, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Cast Spell Create Filled Containment Coffer'),
(649204, 0, 4, 4, 46, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Add Immune To Player Flag'),
(649204, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2553, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Say Emoted Text'),
(649204, 0, 6, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Remove Invincibility'),
(649204, 0, 7, 39, 649204, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Start Script to Despawn');
DELETE FROM `generic_scripts` WHERE `id`=649204;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649204, 2, 0, 41, 0, 0, 0, 0, 122088, 10, 11, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Containment Coffer - Despawn GameObject'),
(649204, 3, 0, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Despawn Creature');
DELETE FROM `creature_ai_scripts` WHERE `id`=649205;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649205, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Set Phase to 0'),
(649205, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Set Invincibility'),
(649205, 0, 0, 4, 46, 33554688, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Remove Immune to Player and Not Selectable Flags');
DELETE FROM `creature_ai_scripts` WHERE `id`=649206;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649206, 0, 0, 14, 9093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Remove Aura Rift Spawn Invisibility'),
(649206, 0, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Start Attack'),
(649206, 0, 2, 15, 9096, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Cast Spell Rift Spawn Manifestation');
DELETE FROM `creature_ai_scripts` WHERE `id`=649207;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(649207, 0, 0, 15, 9738, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Cast Spell Rift Spawn Becomes Visible'),
(649207, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3074, 0, 0, 0, 0, 0, 0, 0, 0, 'Rift Spawn - Say Emoted Text');
UPDATE `creature_template` SET `auras`='9093' WHERE `entry`=6492;

-- Add missing Rift Spawn spawns in Stormwind.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(7744, 6492, 0, 0, 0, 0, 0, -9065.556, 845.8416, 109.2805, 5.168339, 300, 300, 0, 100, 100, 2, 0, 0, 0, 10),
(7745, 6492, 0, 0, 0, 0, 0, -9082.514, 836.6629, 108.505, 2.286381, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10),
(7746, 6492, 0, 0, 0, 0, 0, -9107.48, 832.1802, 105.5042, 6.012402, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10),
(7747, 6492, 0, 0, 0, 0, 0, -9103.703, 833.5841, 97.7137, 0.01745329, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10),
(7748, 6492, 0, 0, 0, 0, 0, -9092.251, 832.2851, 115.7525, 5.718488, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10),
(7749, 6492, 0, 0, 0, 0, 0, -9086.18, 820.727, 115.693, 4.49025, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7744, 1, -9058.52, 829.761, 109.197, 100, 0, 0, 0),
(7744, 2, -9065.37, 846.327, 109.197, 100, 0, 0, 0);

-- Add missing Rift Spawn spawns in Undercity.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES
(7750, 6492, 0, 1412.499, 380.679, -65.9445, 2.530727, 5, 1, 60, 60),
(7751, 6492, 0, 1397.444, 383.548, -65.9455, 3.163141, 5, 1, 60, 60),
(7752, 6492, 0, 1411.855, 363.8642, -65.93619, 3.468994, 5, 1, 60, 60),
(7753, 6492, 0, 1392.18, 375.0114, -65.94598, 5.142109, 5, 1, 60, 60);

-- Add Mana Rift Disturbance object near Rift Spawn creatures.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(99860, 103708, 0, -9074.96, 832.35, 108.41, 0, 0, 0, 0, 0, 180, 180, 0, 1, 0, 0, 0, 10),
(99861, 103708, 0, 1403.17, 377.12, -66, 0, 0, 0, 0, 0, 180, 180, 0, 1, 0, 0, 0, 10);

-- Containment Coffer TRAP should be invisible.
UPDATE `gameobject_template` SET `data8`=1, `data9`=0 WHERE `entry`=103575;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
