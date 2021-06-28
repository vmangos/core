DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210529122700');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210529122700');
-- Add your query below.


-- Move Orb of Domination spawn out of the guid range we are going to use.
UPDATE `gameobject` SET `guid`=66885 WHERE `guid`=67867;

-- =============================================
-- World Invasion
-- =============================================

-- Fix for quest 9364 condition issues with scourge minions
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9365, -1, 85, 9364, 0, 0, 0);
UPDATE `creature_ai_events` SET `condition_id`=9365 WHERE `condition_id`=9364;

-- Fix some Creatures.
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=3052, `health_max`=3052, `detection_range`=0, `call_for_help_range`=0, `unit_flags`=256, `faction`=1630, `speed_run`=1, `auras`='28346', `flags_extra`=198658, `script_name`='scourge_invasion_necrotic_shard' WHERE `entry` IN (16172,16136);
UPDATE `creature_template` SET `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `flags_extra`=64, `health_min`=42, `health_max`=42, `unit_flags`=33554432, `movement_type`=0, `level_min`=1, `level_max`=1 WHERE `entry` IN (16401,16421,16398,16386);
UPDATE `creature_template` SET `speed_run`=0.992063 WHERE `entry`=16398;
UPDATE `creature_template` SET `armor`=950 WHERE `entry`=16421;
UPDATE `creature_template` SET `script_name`='scourge_invasion_necropolis' WHERE `entry`=16401;
UPDATE `creature_template` SET `regeneration`=0, `script_name`='scourge_invasion_necropolis_health' WHERE `entry`=16421;
UPDATE `creature_template` SET `script_name`='scourge_invasion_necropolis_proxy' WHERE `entry`=16398;
UPDATE `creature_template` SET `script_name`='scourge_invasion_necropolis_relay' WHERE `entry`=16386;
UPDATE `creature_template` SET `level_min`=55, `level_max`=55, `health_min`=5228, `health_max`=5228, `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000 WHERE entry IN (16285,16361,16281,16395,16436,16434,16433,16435,16384,16787,16359,16255,16786);
UPDATE `creature_template` SET `unit_flags`=33280, `faction`=794, `npc_flags`=2 WHERE `entry`=16786;
UPDATE `creature_template` SET `unit_flags`=512, `faction`=814, `npc_flags`=2 WHERE `entry` IN (16787,16281,16361);
UPDATE `creature_template` SET `unit_flags`=512, `faction`=814, `npc_flags`=1 WHERE `entry`=16285;
UPDATE `creature_template` SET `display_scale1`=0, `level_min`=60, `level_max`=60, `health_min`=91560, `health_max`=91560, `faction`=1634, `dmg_min`=249, `dmg_max`=413, `speed_walk`=0.8, `speed_run`=1.14286, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=64, `auras`='28126', `movement_type`=1, `inhabit_type`=1, `regeneration`=0 WHERE `entry` IN (16394,16382);
UPDATE `creature_template` SET `health_min`=3052, `health_max`=3052, `npc_flags`=2, `speed_run`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=262400, `auras`='29826', `civilian`=1, `flags_extra`=198658 WHERE `entry` IN (16531,16431);
UPDATE `creature_template` SET `level_min`=53, `level_max`=55, `health_min`=24530, `health_max`=26140, `armor`=3271, `faction`=1634, `dmg_min`=91, `dmg_max`=123, `base_attack_time`=2000, `ranged_attack_time`=2000, `auras`='28330', `regeneration`=0, `inhabit_type`=1, `script_name`='scourge_invasion_minion' WHERE `entry`=16383;
UPDATE `creature_template` SET `script_name`='' WHERE `entry` IN (16431, 16531);

-- Gossip menu for Argent Dawn Reward Givers.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7200, 16, 16433, 16434, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7201, 16, 16436, 16395, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7202, 16, 16384, 16435, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(7230, 8525, 7200),
(7230, 8526, 7201),
(7230, 8527, 7202);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(7230, 0, 0, 'Give me one of your magic items.', 12302, 1, 1, -1, 0, 72301, 0, 0, NULL, 0, 7200),
(7230, 1, 0, 'Give me one of your magic items.', 12302, 1, 1, -1, 0, 72302, 0, 0, NULL, 0, 7201),
(7230, 2, 0, 'Give me one of your magic items.', 12302, 1, 1, -1, 0, 72303, 0, 0, NULL, 0, 7202);
DELETE FROM `gossip_scripts` WHERE `id`=72301;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (72301, 0, 15, 28321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Dawn Reward Giver - Cast Spell Create Greater Mark of the Dawn');
DELETE FROM `gossip_scripts` WHERE `id`=72302;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (72302, 0, 15, 28320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Dawn Reward Giver - Cast Spell Create Mark of the Dawn');
DELETE FROM `gossip_scripts` WHERE `id`=72303;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (72303, 0, 15, 28319, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Dawn Reward Giver - Cast Spell Create Lesser Mark of the Dawn');
UPDATE `creature_template` SET `gossip_menu_id`=7230, `movement_type`=0, `unit_flags`=512, `script_name`='' WHERE entry IN (16395,16436,16434,16433,16384,16435);

-- Delete some custom Nostalrius waypoint npcs
DELETE FROM `creature_template` WHERE `entry` IN (20099,20100,20101,20102);

-- Fix Camp Spawners
UPDATE `creature_template` SET `unit_flags`=33554432, `base_attack_time`=2000, `ranged_attack_time`=2000, `movement_type`=0, `script_name`='scourge_invasion_minion_spawner' WHERE `entry` IN (16338,16336,16306);
UPDATE `creature_template` SET `unit_flags`=33554432, `health_min`=42, `health_max`=42 WHERE `entry`=16356;
UPDATE `creature_template` SET `level_min`=60, `health_min`=3052, `speed_walk`=1, `speed_run`=0.992063, `movement_type`=0, `unit_flags`=33555200, `script_name`='scourge_invasion_mouth' WHERE `entry`=16995;

-- Fix Minions
UPDATE `creature_template` SET `movement_type`=1, `faction`=1630, `base_attack_time`=2000, `ranged_attack_time`=2000, `detection_range`=4, `call_for_help_range`=1, `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_id4`=0, `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (16299,16141,16298,14697,16380,16379);
UPDATE `creature_template` SET `unit_flags`=0, `auras`='28090 28126' WHERE `entry` IN (16299,16141);
UPDATE `creature_template` SET `unit_flags`=64, `auras`='28292 28126' WHERE `entry` IN (14697,16380,16379);
UPDATE `creature_template` SET `dmg_min`=159, `dmg_max`=210, `dmg_multiplier`=1 WHERE `entry`=16380;
UPDATE `creature_template` SET `health_min`=8489, `health_max`=8489, `dmg_min`=159, `dmg_max`=210, `dmg_multiplier`=1 WHERE `entry`=14697;
UPDATE `creature_template` SET `speed_run`=0.992063, `dmg_min`=159, `dmg_max`=210, `dmg_multiplier`=1 WHERE `entry`=16379;
UPDATE `creature_template` SET `speed_walk`=1.11111, `unit_flags`=0, `auras`='28090 28126 674' WHERE `entry`=16298;
UPDATE `creature_template` SET `speed_walk`=0.777776, `armor`=3791, `dmg_min`=102, `dmg_max`=138 WHERE `entry`=16141;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.19048, `armor`=3791, `dmg_min`=101, `dmg_max`=137 WHERE `entry`=16299;

UPDATE `creature_template` SET `spell_list_id`=162990 WHERE `entry`=16299;
UPDATE `creature_template` SET `spell_list_id`=161410 WHERE `entry`=16141;
UPDATE `creature_template` SET `spell_list_id`=162980 WHERE `entry`=16298;
UPDATE `creature_template` SET `spell_list_id`=146970 WHERE `entry`=14697;
UPDATE `creature_template` SET `spell_list_id`=163800 WHERE `entry`=16380;
UPDATE `creature_template` SET `spell_list_id`=163790 WHERE `entry`=16379;
UPDATE `creature_template` SET `spell_list_id`=164380 WHERE `entry`=16438;

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (12398, 28, 1, 0, 0, 0, 1);

-- Events list for Ghoul Berserker
DELETE FROM `creature_ai_events` WHERE `creature_id`=16141;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614101, 16141, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1614101, 0, 0, 'Ghoul Berserker - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614102, 16141, 0, 2, 0, 100, 1, 20, 1, 5000, 10000, 1614102, 0, 0, 'Ghoul Berserker - Enrage at 20% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614103, 16141, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1614103, 0, 0, 'Ghoul Berserker - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614104, 16141, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1614104, 0, 0, 'Ghoul Berserker - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1614101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1614101, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ghoul Berserker - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1614102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1614102, 0, 15, 8599, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ghoul Berserker - Cast Spell Enrage');
DELETE FROM `creature_ai_scripts` WHERE `id`=1614103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1614103, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ghoul Berserker - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1614104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1614104, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Ghoul Berserker - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (161410, 'Scourge Invasion - Ghoul Berserker', 7367, 50, 1, 0, 0, 32, 6, 12, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Skeletal Shocktrooper
DELETE FROM `creature_ai_events` WHERE `creature_id`=16299;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629901, 16299, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1629901, 0, 0, 'Skeletal Shocktrooper - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629902, 16299, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1629902, 0, 0, 'Skeletal Shocktrooper - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629903, 16299, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1629903, 0, 0, 'Skeletal Shocktrooper - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629901, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Shocktrooper - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629902, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Shocktrooper - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629903, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Skeletal Shocktrooper - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (162990, 'Scourge Invasion - Skeletal Shocktrooper', 17014, 100, 0, 0, 0, 34, 0, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Spectral Soldier
DELETE FROM `creature_ai_events` WHERE `creature_id`=16298;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629801, 16298, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1629801, 0, 0, 'Spectral Soldier - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629802, 16298, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1629802, 0, 0, 'Spectral Soldier - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1629803, 16298, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1629803, 0, 0, 'Spectral Soldier - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629801, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Soldier - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629802, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Soldier - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1629803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1629803, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Spectral Soldier - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (162980, 'Scourge Invasion - Spectral Soldier', 16244, 50, 1, 0, 0, 32, 0, 20, 20, 20, 0, 21081, 50, 1, 0, 0, 96, 6, 12, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Lumbering Horror
DELETE FROM `creature_ai_events` WHERE `creature_id`=14697;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1469701, 14697, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1469701, 0, 0, 'Lumbering Horror - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1469702, 14697, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1469702, 0, 0, 'Lumbering Horror - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1469703, 14697, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1469703, 0, 0, 'Lumbering Horror - Cast Scourge Strike');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1469704, 14697, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1469704, 0, 0, 'Lumbering Horror - Cast Aura of Fear');
DELETE FROM `creature_ai_scripts` WHERE `id`=1469701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1469701, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lumbering Horror - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1469702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1469702, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lumbering Horror - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1469703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1469703, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Lumbering Horror - Cast Spell Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1469704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1469704, 0, 74, 28313, 8, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lumbering Horror - Add Aura Aura of Fear');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146970, 'Scourge Invasion - Lumbering Horror', 16790, 100, 1, 0, 0, 0, 0, 17, 17, 17, 0, 5568, 100, 0, 0, 0, 0, 5, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Bone Witch
DELETE FROM `creature_ai_events` WHERE `creature_id`=16380;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638001, 16380, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1638001, 0, 0, 'Bone Witch - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638002, 16380, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1638002, 0, 0, 'Bone Witch - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638003, 16380, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1638003, 0, 0, 'Bone Witch - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1638001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1638001, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Witch - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1638002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1638002, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Witch - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1638003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1638003, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Bone Witch - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (163800, 'Scourge Invasion - Bone Witch', 17014, 50, 0, 0, 0, 34, 1, 8, 8, 19, 0, 20720, 100, 1, 0, 0, 136, 1, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Spirit of the Damned
DELETE FROM `creature_ai_events` WHERE `creature_id`=16379;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1637901, 16379, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1637901, 0, 0, 'Spirit of the Damned - Cast Zap Crystal on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1637902, 16379, 0, 8, 0, 100, 0, 17680, -1, 0, 0, 1637902, 0, 0, 'Spirit of the Damned - Despawn on Hit by Spirit Spawn-out');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1637903, 16379, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1637903, 0, 0, 'Spirit of the Damned - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1637901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1637901, 0, 15, 28032, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of the Damned - Cast Spell Zap Crystal');
DELETE FROM `creature_ai_scripts` WHERE `id`=1637902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1637902, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of the Damned - Despawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1637903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1637903, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Spirit of the Damned - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (163790, 'Scourge Invasion - Spirit of the Damned', 16243, 100, 1, 0, 0, 32, 1, 6, 3, 6, 0, 22884, 100, 1, 0, 0, 32, 1, 12, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Skeletal Trooper
DELETE FROM `creature_ai_events` WHERE `creature_id`=16438;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1643801, 16438, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1643801, 0, 0, 'Skeletal Trooper - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1643801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1643801, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Skeletal Trooper - Cast Spell Scourge Strike');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (164380, 'Scourge Invasion - Skeletal Trooper', 589, 100, 1, 0, 0, 32, 1, 9, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Spectral Spirit
DELETE FROM `creature_ai_events` WHERE `creature_id`=16437;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1643701, 16437, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1643701, 0, 0, 'Spectral Spirit - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1643701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1643701, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Spectral Spirit - Cast Spell Scourge Strike');

-- Events list for Skeletal Soldier
DELETE FROM `creature_ai_events` WHERE `creature_id`=16422;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1642201, 16422, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1642201, 0, 0, 'Skeletal Soldier - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1642201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1642201, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Skeletal Soldier - Cast Spell Scourge Strike');

-- Events list for Spectral Apparition
DELETE FROM `creature_ai_events` WHERE `creature_id`=16423;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1642301, 16423, 0, 9, 0, 100, 1, 0, 30, 5000, 10000, 1642301, 0, 0, 'Spectral Apparition - Cast Scourge Strike');
DELETE FROM `creature_ai_scripts` WHERE `id`=1642301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1642301, 0, 15, 28265, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12398, 'Spectral Apparition - Cast Spell Scourge Strike');

-- Royal Dreadguard used more ranged shoots in sniffs
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (138390, 'Undercity - Royal Dreadguard', 14516, 100, 1, 0, 0, 0, 7, 10, 7, 10, 0, 9080, 100, 1, 0, 0, 32, 0, 0, 6, 9, 0, 16100, 100, 1, 0, 0, 0, 0, 4, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `npc_flags`=0, `unit_flags`=0 WHERE `entry`=13839;

-- Stormwind Elite Guard
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=9156, `health_max`=9156, `armor`=3791, `faction`=11, `dmg_min`=417, `dmg_max`=551, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=32768, `spell_list_id`=163960, `movement_type`=0 WHERE `entry`=16396;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (163960, 'Stormwind City - Stormwind Elite Guard', 14516, 100, 1, 0, 0, 0, 0, 10, 10, 10, 0, 9080, 100, 1, 0, 0, 32, 0, 10, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Undercity Elite Guardian
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=9156, `health_max`=9156, `armor`=3791, `faction`=71, `dmg_min`=417, `dmg_max`=551, `unit_flags`=32768, `auras`='18951', `spell_list_id`=164320, `flags_extra`=524288 WHERE `entry`=16432;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (164320, 'Undercity - Undercity Elite Guardian', 7160, 100, 1, 0, 0, 0, 0, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Undercity Guardian
UPDATE `creature_template` SET `dmg_min`=95, `dmg_max`=123 WHERE `entry`=5624;

-- Deathguard Elite
UPDATE `creature_template` SET `dmg_min`=188, `dmg_max`=249 WHERE `entry`=7980;

-- Fix Cultist Engineer
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (22484, 2, 22484, 8, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7166, 8436);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7166, 0, 0, 'Use 8 necrotic runes and disrupt his ritual.', 12112, 1, 1, -1, 0, 7166, 0, 0, NULL, 0, 22484);
DELETE FROM `gossip_scripts` WHERE `id`=7166;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7166, 0, 85, 7166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Summon Shadow of Doom');
UPDATE `creature_template` SET `gossip_menu_id`=7166, `health_min`=3052, `health_max`=3052, `faction`=190, `speed_walk`=1, `base_attack_time`=2000, `ranged_attack_time`=2000, `unit_flags`=768, `auras`='29826', `flags_extra`=198658, `script_name`='scourge_invasion_cultist_engineer' WHERE `entry`=16230;

-- Fix Shadow of Doom
UPDATE `creature_template` SET `level_min`=60, `level_max`=60, `health_min`=48840, `health_max`=48840, `mana_min`=2434, `mana_max`=2434, `faction`=1630, `armor`=3075, `dmg_min`=871, `dmg_max`=1153, `unit_flags`=320, `auras`='28126', `movement_type`=0, `detection_range`=4, `call_for_help_range`=1, `script_name`='scourge_invasion_minion' WHERE `entry`=16143;

-- Fix Low level Minions
UPDATE `creature_template` SET `movement_type`=1, `speed_run`=0.857143, `auras`='28126', `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (16438,16437,16422,16423);
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry` IN (16437,16423);
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry` IN (16422,16438);
UPDATE `creature_template` SET `armor`=426, `dmg_min`=11, `dmg_max`=16, `spell_id2`=0 WHERE `entry`=16438;
UPDATE `creature_template` SET `armor`=239, `dmg_min`=7, `dmg_max`=12, `auras`='28126 674', `spell_id1`=0 WHERE `entry`=16422;
UPDATE `creature_template` SET `armor`=239, `dmg_min`=8, `dmg_max`=13 WHERE `entry`=16423;

-- After completing quest 9154 (Light's Hope Chapel) you should receive this item in your mailbox: 22723 (A Letter from the Keeper of the Rolls) source: https://classic.wowhead.com/guides/wow-classic-scourge-invasions
UPDATE `quest_template` SET `RewMailTemplateId`=171 WHERE `entry`=9154;

-- Argent NPC's do not have random emotes
DELETE FROM `creature_ai_events` WHERE `id` IN (1624101, 1624102, 1625501, 1625502);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1624101, 1624102, 1625501, 1625502);
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` IN (16241,16255);

-- Add Argent Outfitter Quests
INSERT INTO `quest_greeting` (`entry`, `content_default`, `emote_id`) VALUES (16281, 'The Argent Dawn will turn away none who are willing to sacrifice for our cause.', 1);
INSERT INTO `quest_greeting` (`entry`, `content_default`, `emote_id`) VALUES (16787, 'Greetings, $n. If you bring me necrotic stones from the undead invaders, I can give you access to the stores of the Argent Dawn.', 66);

INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
    (16787, 9094, 9, 10),
    (16787, 9317, 9, 10),
    (16787, 9318, 9, 10),
    (16787, 9320, 9, 10),
    (16787, 9321, 9, 10),
    (16787, 9341, 9, 10);

INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
    (16787, 9094, 9, 10),
    (16787, 9317, 9, 10),
    (16787, 9318, 9, 10),
    (16787, 9320, 9, 10),
    (16787, 9321, 9, 10),
    (16787, 9341, 9, 10);

-- Remove wrong stuff.
DELETE FROM `spell_effect_mod` WHERE `id` IN (28373,28351,28032,28365,28281,28349,31315,28056,28367,28326,28366,28041,27894);
DELETE FROM `spell_script_target` WHERE `entry` IN (28373,28351,28032,28365,28281,28349,31315,28056,28367,28326,28366,28041,27894,28364);

-- Fix Spells.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES
    (28365, 1, 16398, 0, 0, 5464, 5875),
    (28281, 1, 16386, 0, 0, 5464, 5875),
    (28373, 1, 16398, 0, 0, 5464, 5875),
    (28373, 0, 181154, 0, 0, 5464, 5875),
    (31315, 1, 16230, 0, 0, 5464, 5875),
    (28056, 1, 16172, 0, 0, 5464, 5875),
    (28367, 1, 16401, 0, 0, 5464, 5875),
    (28326, 1, 16172, 0, 0, 5464, 5875),
    (28326, 1, 16136, 0, 0, 5464, 5875),
    (28032, 1, 16136, 0, 0, 5464, 5875),
    (28366, 1, 16386, 0, 0, 5464, 5875),
    (28373, 0, 181215, 0, 0, 5464, 5875),
    (28373, 0, 181223, 0, 0, 5464, 5875),
    (28373, 0, 181373, 0, 0, 5464, 5875),
    (28373, 0, 181374, 0, 0, 5464, 5875),
    (27894, 1, 16230, 0, 0, 5464, 5875),
    (28364, 1, 1756, 0, 0, 5464, 5875),
    (28364, 1, 13839, 0, 0, 5464, 5875);

-- Fix GameObjects
UPDATE `gameobject_template` SET `script_name`='scourge_invasion_go_circle', `faction`=114 WHERE `entry`=181136;
UPDATE `gameobject_template` SET `faction`=114, `flags`=32 WHERE `entry` IN (181154,181373,181374,181215,181223,181172);
UPDATE `gameobject_template` SET `script_name`='scourge_invasion_go_necropolis' WHERE `entry` IN (181154,181373,181374,181215,181223);

-- Events
DELETE FROM `game_event` WHERE `entry` IN (80,90,91,92,93,94,95,96,97,98,99);
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES
    (90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Winterspring', 1, 1, 9, 10),
    (91, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Tanaris', 1, 1, 9, 10),
    (92, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Azshara', 1, 1, 9, 10),
    (93, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Blasted Lands', 1, 1, 9, 10),
    (94, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Eastern Plaguelands', 1, 1, 9, 10),
    (95, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Attacking Burning Steppes', 1, 1, 9, 10),
    (96, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - 50 Invasions Done', 1, 1, 9, 10),
    (97, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - 100 Invasions Done', 1, 1, 9, 10),
 -- following events should stay for (1814400 / 60 / 60 / 24) = 21 days - 3 weeks
    (98, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1814400, 0, 'Scourge Invasion - 150 Invasions Done', 1, 1, 9, 10),
    (99, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1814400, 0, 'Scourge Invasion - Invasions Done', 1, 1, 9, 10);

SET @SCOURGE_INVASION_GUID = 67002;
SET @SCOURGE_INVASION_EVENT = 17;
SET @WINTERSPRING_EVENT = 90;
SET @WINTERSPRING_GUID = 67233;
SET @TANARIS_EVENT = 91;
SET @TANARIS_GUID = 67497;
SET @AZSHARA_EVENT = 92;
SET @AZSHARA_GUID = 67774;
SET @BLASTED_LANDS_EVENT = 93;
SET @BLASTED_LANDS_GUID = 67959;
SET @EASTERN_PLAGUELANDS_EVENT = 94;
SET @EASTERN_PLAGUELANDS_GUID = 68144;
SET @BURNING_STEPPES_EVENT = 95;
SET @BURNING_STEPPES_GUID = 65607;
SET @FIFTY_INVASIONS_EVENT = 96;
SET @FIFTY_INVASIONS_GUID = 65787;
SET @HUNDRED_INVASIONS_EVENT = 97;
SET @HUNDRED_INVASIONS_GUID = 65794;
SET @HUNDREDFIFTY_INVASIONS_EVENT = 98;
SET @HUNDREDFIFTY_INVASIONS_GUID = 65801;
SET @INVASIONS_DONE_EVENT = 99;
SET @INVASIONS_DONE_GUID = 65808;

UPDATE `game_event` SET `disabled`=0 WHERE `entry` IN (@EVENT, 81, 129, 130);

DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=129);
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `game_event_gameobject` WHERE `event`=129);
DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=130);
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `game_event_gameobject` WHERE `event`=130);
DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=80);
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `game_event_gameobject` WHERE `event`=80);
DELETE FROM `creature` WHERE `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=17);
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `game_event_gameobject` WHERE `event`=17);

DELETE FROM `game_event_gameobject` WHERE `event` = 129;
DELETE FROM `game_event_creature` WHERE `event` = 129;
DELETE FROM `game_event_gameobject` WHERE `event` = 130;
DELETE FROM `game_event_creature` WHERE `event` = 130;
DELETE FROM `game_event_gameobject` WHERE `event` = 17;
DELETE FROM `game_event_creature` WHERE `event` = 17;
DELETE FROM `game_event_gameobject` WHERE `event` = 80;
DELETE FROM `game_event_creature` WHERE `event` = 80;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@SCOURGE_INVASION_GUID+1, 16422, 0, -9226.02, 355.318, 73.5737, 2.4289, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+2, 16422, 0, -9224.34, 255.678, 72.4395, 5.62633, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+3, 16422, 0, -9222.33, 322.447, 73.4483, 6.01974, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+4, 16422, 0, -9214.36, 360.779, 72.6132, 2.03618, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+5, 16422, 0, -9210.93, 354.044, 73.7966, 3.19647, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+6, 16422, 0, -9208.84, 324.118, 73.6612, 4.13374, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+7, 16422, 0, -9207.43, 254.061, 73.6988, 3.40682, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+8, 16422, 0, -9206.31, 426.363, 89.4222, 0.360574, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+9, 16422, 0, -9188.8, 425.887, 91.9341, 0.0458394, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+10, 16422, 0, -9172.39, 408.574, 89.669, 0.600246, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+11, 16422, 0, -9156.01, 408.665, 92.177, 4.84357, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+12, 16422, 0, -9153.51, 409.589, 92.5872, 0.704101, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+13, 16422, 0, -9143.34, 341.835, 91.1759, 2.79632, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+14, 16422, 0, -9126.51, 307.143, 93.9812, 3.30256, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+15, 16422, 0, -9108.86, 356.679, 93.5544, 5.85659, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+16, 16422, 0, -9108.03, 326.059, 93.3303, 0.853827, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+17, 16422, 0, -9107.83, 343.079, 93.597, 1.86821, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+18, 16422, 0, -9095.39, 307.972, 94.9549, 0.470641, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+19, 16422, 0, -9076.53, 355.622, 94.0187, 4.85548, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+20, 16422, 0, -9074.67, 304.957, 92.7716, 4.81266, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+21, 16422, 0, -9074.08, 340.362, 93.1564, 4.05603, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+22, 16422, 0, -9066.52, 324.993, 93.4538, 1.60096, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+23, 16422, 0, -9060.78, 341.519, 93.8333, 5.90134, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+24, 16422, 0, 1958, 308.122, 40.4944, 1.57873, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+25, 16422, 0, 1975.64, 342.893, 41.4203, 6.1029, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+26, 16422, 0, 1977.22, 324.735, 39.7658, 6.1215, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+27, 16422, 0, 1991.77, 291.626, 45.7274, 1.46072, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+28, 16422, 0, 2008.15, 308.223, 44.5671, 4.24219, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+29, 16422, 0, 2009.81, 278.13, 47.6319, 1.00346, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+30, 16422, 0, 2012.05, 321.216, 43.5201, 4.58103, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+31, 16422, 0, 2012.62, 345.44, 41.6383, 5.02611, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+32, 16422, 0, 2024.47, 308.414, 47.8877, 4.03457, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+33, 16422, 0, 2024.48, 291.35, 50.525, 1.92633, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+34, 16423, 0, -9241.49, 322.719, 74.4671, 5.11785, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+35, 16423, 0, -9225.75, 307.178, 74.493, 5.6749, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+36, 16423, 0, -9225.51, 374.533, 73.2577, 1.87504, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+37, 16423, 0, -9224.33, 406.949, 85.9524, 1.18412, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+38, 16423, 0, -9221.77, 339.037, 73.7161, 3.63145, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+39, 16423, 0, -9219.44, 365.277, 72.2192, 5.93848, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+40, 16423, 0, -9208.7, 307.137, 74.7611, 5.65496, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+41, 16423, 0, -9207.46, 340.779, 72.7192, 5.69767, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+42, 16423, 0, -9193.47, 356.819, 74.9054, 4.89093, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+43, 16423, 0, -9191.11, 371.744, 74.4371, 5.74828, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+44, 16423, 0, -9173.08, 390.755, 85.5224, 6.20636, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+45, 16423, 0, -9128.23, 322.498, 93.5566, 0.998882, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+46, 16423, 0, -9126.62, 338.942, 93.9827, 6.08246, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+47, 16423, 0, -9124.92, 354.712, 93.4381, 2.50851, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+48, 16423, 0, -9107.05, 307.769, 94.0905, 1.85795, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+49, 16423, 0, -9091.76, 341.154, 94.3548, 4.53484, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+50, 16423, 0, -9091.45, 327.674, 94.2434, 5.32423, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+51, 16423, 0, -9058.75, 357.296, 93.0833, 4.77855, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+52, 16423, 0, -9050, 341.666, 94.8333, 2.65302, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+53, 16423, 0, -9045.64, 355.102, 94.3333, 1.32197, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+54, 16423, 0, -9045.26, 322.609, 93.5216, 3.44483, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+55, 16423, 0, 1955.65, 342.09, 39.4003, 0.779187, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+56, 16423, 0, 1958.36, 324.792, 38.9771, 0.595435, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+57, 16423, 0, 1975.52, 310.347, 41.0158, 0.69975, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+58, 16423, 0, 1977.69, 290.124, 41.7582, 3.06724, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+59, 16423, 0, 1989.75, 277.586, 46.4966, 4.39469, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+60, 16423, 0, 1989.92, 347.112, 39.9151, 0.521888, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+61, 16423, 0, 1992, 308.211, 41.8138, 5.51092, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+62, 16423, 0, 1997.95, 299.77, 44.6081, 0.692723, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+63, 16423, 0, 2001.88, 329.076, 40.9497, 5.48828, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+64, 16423, 0, 2010.49, 289.417, 48.1567, 4.27896, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+65, 16423, 0, 2025.32, 326.248, 46.449, 5.62722, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+66, 16423, 0, 2040.02, 326.791, 49.7356, 5.46741, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+67, 16437, 0, -5210.28, -574.285, 401.21, 1.09142, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+68, 16437, 0, -5193.85, -607.42, 398.401, 3.07554, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+69, 16437, 0, -5193.39, -638.081, 402.874, 1.41293, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+70, 16437, 0, -5193.12, -558.696, 396.158, 4.62661, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+71, 16437, 0, -5192.87, -574.929, 398.666, 2.19642, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+72, 16437, 0, -5175.58, -625.294, 396.434, 5.02485, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+73, 16437, 0, -5170.58, -667.436, 408.427, 5.21706, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+74, 16437, 0, -5159.05, -658.798, 401.207, 1.70136, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+75, 16437, 0, -5158.7, -607.255, 399.501, 6.26115, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+76, 16437, 0, -5156.75, -588.141, 398.983, 3.46036, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+77, 16437, 0, -5144.27, -622.65, 396.525, 5.57244, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+78, 16437, 0, -5139.87, -641.965, 396.458, 0.984984, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+79, 16437, 0, -5127.95, -672.584, 408.148, 3.42099, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+80, 16437, 0, -5125.79, -573.421, 402.436, 2.73605, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+81, 16437, 0, -5124.48, -608.451, 398.77, 3.07629, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+82, 16438, 0, -5210.48, -612.784, 405.833, 3.97622, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+83, 16438, 0, -5210.41, -609.386, 405.456, 1.57275, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+84, 16438, 0, -5193.67, -589.219, 398.733, 3.81448, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+85, 16438, 0, -5192.42, -625.459, 400.093, 4.04793, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+86, 16438, 0, -5191.67, -662.5, 414.177, 5.11023, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+87, 16438, 0, -5177.41, -590.895, 397.783, 2.31427, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+88, 16438, 0, -5177.37, -551.866, 398.436, 5.11992, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+89, 16438, 0, -5176.08, -646.345, 400.252, 0.983005, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+90, 16438, 0, -5173.44, -574.82, 396.753, 1.12966, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+91, 16438, 0, -5172.56, -607.505, 397.494, 4.21382, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+92, 16438, 0, -5159.18, -644.22, 396.346, 5.2308, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+93, 16438, 0, -5156.71, -574.003, 399.162, 1.82337, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+94, 16438, 0, -5153.88, -621.489, 397.326, 0.640997, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+95, 16438, 0, -5145.44, -585.312, 399.916, 1.11381, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+96, 16438, 0, -5144.87, -609.601, 398.966, 1.86269, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+97, 16438, 0, -5142.01, -657.807, 401.127, 2.25399, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+98, 16437, 1, -1578.75, 46.7944, -0.276304, 2.45322, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+99, 16437, 1, -1576.99, 79.1048, -7.79199, 2.80811, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+100, 16437, 1, -1576.34, 21.8083, 4.11118, 3.06223, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+101, 16437, 1, -1558.21, 41.7244, 7.006, 3.73856, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+102, 16437, 1, -1558.07, -22.8598, 8.72535, 4.14684, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+103, 16437, 1, -1544.19, 56.8785, 3.72579, 0.48621, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+104, 16437, 1, -1543.07, 89.1463, -1.02182, 3.75402, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+105, 16437, 1, -1542.7, 22.5761, 12.6096, 4.52993, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+106, 16437, 1, -1523.34, 54.2973, 6.26851, 3.97724, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+107, 16437, 1, -1522.45, 42.5859, 10.2521, 4.84039, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+108, 16437, 1, -1509.13, 91.329, 3.28095, 2.1149, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+109, 16437, 1, -1507.26, 75.9874, 6.12133, 1.99775, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+110, 16437, 1, -1491.41, 58.6448, 12.222, 1.1226, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+111, 16437, 1, -1488.16, 90.9718, 6.64971, 6.13179, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+112, 16437, 1, -1473.9, 7.46469, 26.5528, 6.02447, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+113, 16437, 1, 1150.2, -4321.03, 22.7075, 0.87625, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+114, 16437, 1, 1156.39, -4343.29, 25.8017, 2.92237, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+115, 16437, 1, 1173.86, -4308.96, 20.815, 1.98371, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+116, 16437, 1, 1174.7, -4344.56, 25.6529, 5.77738, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+117, 16437, 1, 1186.8, -4321.39, 21.4574, 3.28781, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+118, 16437, 1, 1188.69, -4285.91, 21.0814, 4.34768, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+119, 16437, 1, 1190.49, -4357.67, 27.6661, 1.40023, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+120, 16437, 1, 1204.72, -4339.25, 25.6081, 5.98775, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+121, 16437, 1, 1210.71, -4286.73, 22.7048, 0.574138, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+122, 16437, 1, 1211.41, -4323.13, 23.3408, 2.01871, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+123, 16437, 1, 1218.33, -4331.81, 24.9515, 5.08237, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+124, 16437, 1, 1225.59, -4324.97, 25.3374, 5.88451, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+125, 16437, 1, 1227.29, -4308.43, 25.1762, 0.17582, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+126, 16437, 1, 1231.62, -4348.39, 28.4913, 3.41079, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+127, 16437, 1, 1242.39, -4357.71, 30.6207, 3.8617, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+128, 16437, 1, 1242.56, -4308.21, 28.429, 4.31106, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+129, 16437, 1, 1258.11, -4374.13, 28.588, 3.96191, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+130, 16437, 1, 9872.9, 1883.79, 1325.45, 2.09144, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+131, 16437, 1, 9872.99, 1861.08, 1319.67, 2.91279, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+132, 16437, 1, 9892.92, 1875.01, 1320.86, 0.452621, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+133, 16437, 1, 9908.33, 1841.67, 1319.84, 0.960879, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+134, 16437, 1, 9908.53, 1891.84, 1323.88, 0.329424, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+135, 16437, 1, 9922.27, 1908.42, 1327.6, 6.22045, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+136, 16437, 1, 9925.14, 1820.71, 1324.91, 4.7371, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+137, 16437, 1, 9926.36, 1876.09, 1324.61, 5.09425, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+138, 16437, 1, 9927.31, 1858.23, 1321.93, 5.20576, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+139, 16437, 1, 9938.65, 1955.29, 1336.42, 2.54292, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+140, 16437, 1, 9939.11, 1924.38, 1329.64, 3.78738, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+141, 16437, 1, 9940.93, 1939.54, 1330.78, 3.94131, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+142, 16437, 1, 9943.21, 1888.18, 1326.98, 5.12812, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+143, 16437, 1, 9954.81, 1943.21, 1328.8, 0.0523599, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+144, 16437, 1, 9957.45, 1924.71, 1327.55, 3.36631, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+145, 16438, 1, -1592.76, 22.4356, 0.012507, 3.54203, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+146, 16438, 1, -1591.95, 55.8362, -7.80011, 0.827901, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+147, 16438, 1, -1591.9, 41.9846, -3.43123, 0.662242, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+148, 16438, 1, -1575.94, 59.0271, -3.27203, 2.71816, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+149, 16438, 1, -1558.68, 23.9335, 8.83424, 2.15245, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+150, 16438, 1, -1556.82, 56.6898, 2.50258, 5.94845, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+151, 16438, 1, -1553.38, 77.7055, -2.7479, 0.245245, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+152, 16438, 1, -1546.34, 44.5896, 7.67769, 3.6027, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+153, 16438, 1, -1541.32, -22.4478, 13.2005, 5.42589, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+154, 16438, 1, -1540.62, 79.1732, -0.0488024, 4.40609, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+155, 16438, 1, -1525.98, 76.689, 3.23604, 2.9442, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+156, 16438, 1, -1522.57, 25.0606, 14.5405, 1.52191, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+157, 16438, 1, -1511.19, 44.4072, 10.7153, 3.88514, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+158, 16438, 1, -1507.85, 58.3478, 8.65653, 1.13075, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+159, 16438, 1, -1486.11, 78.2133, 9.39133, 6.20492, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+160, 16438, 1, 1153.95, -4311.1, 21.2066, 4.59858, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+161, 16438, 1, 1173.02, -4326.63, 21.9703, 4.02125, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+162, 16438, 1, 1174.92, -4283.89, 20.7536, 1.8932, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+163, 16438, 1, 1176.26, -4357.65, 26.903, 0.143743, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+164, 16438, 1, 1187.63, -4343.88, 25.8638, 0.815536, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+165, 16438, 1, 1190.38, -4307.78, 21.0777, 3.57796, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+166, 16438, 1, 1209.4, -4357.45, 27.4607, 3.16367, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+167, 16438, 1, 1209.81, -4311.33, 22.9447, 3.54018, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+168, 16438, 1, 1221.86, -4355.1, 27.3357, 2.34134, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+169, 16438, 1, 1224.19, -4343.23, 26.6115, 3.68794, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+170, 16438, 1, 1224.77, -4287.22, 23.2609, 5.71377, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+171, 16438, 1, 1226.6, -4372.58, 28.6284, 0.21173, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+172, 16438, 1, 1230.64, -4338.64, 27.7799, 4.26455, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+173, 16438, 1, 1239.68, -4324.44, 29.6129, 6.25975, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+174, 16438, 1, 1244.76, -4377.22, 28.0458, 4.49004, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+175, 16438, 1, 1245.25, -4385.99, 28.4208, 3.2261, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+176, 16438, 1, 9871.48, 1870.95, 1323.4, 5.74333, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+177, 16438, 1, 9890.74, 1860.21, 1317.64, 2.43782, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+178, 16438, 1, 9891.17, 1843.88, 1320.27, 0.695035, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+179, 16438, 1, 9907.85, 1873.27, 1320.55, 2.39892, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+180, 16438, 1, 9908.26, 1861.27, 1320.29, 1.43934, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+181, 16438, 1, 9920.85, 1891.94, 1325.92, 3.02152, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+182, 16438, 1, 9924.21, 1959.22, 1339.25, 1.36163, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+183, 16438, 1, 9926.32, 1941.66, 1332.73, 1.1099, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+184, 16438, 1, 9926.72, 1839.86, 1323.4, 5.22598, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+185, 16438, 1, 9940.06, 1874.92, 1325.51, 3.21356, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+186, 16438, 1, 9942.25, 1858.63, 1324.19, 3.70847, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+187, 16438, 1, 9957.29, 1906.26, 1327.01, 2.48012, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+188, 16438, 1, 9959.38, 1873.7, 1324.71, 2.36249, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+189, 16438, 1, 9971.04, 1924.89, 1327.05, 1.48134, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+190, 16438, 1, 9973.05, 1942.32, 1327.21, 1.75474, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+191, 16438, 1, 9976.26, 1942.55, 1326.42, 0.0850052, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+192, 16438, 1, 9976.3, 1942.98, 1326.32, 0.984199, 120, 120, 1, 3, 9),
    (@SCOURGE_INVASION_GUID+193, 16484, 0, -5027.18, -806.981, 496.484, 3.00197, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+194, 16995, 0, -4978.74, -886.326, 501.719, 4.11898, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+195, 16995, 0, 1805.6, 238.504, 62.837, 4.41568, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+196, 16490, 1, -1346.69, 192.28, 61.5736, 4.38078, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+197, 16255, 0, 1578.88, 238.562, -61.994, 3.03687, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+198, 16359, 0, 1578.8, 241.731, -61.994, 2.93215, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+199, 16494, 0, 1736.87, 239.556, 62.7903, 6.26573, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+200, 16787, 0, 1579.84, 245.186, -61.994, 3.29867, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+201, 16241, 0, -8832.87, 642.782, 94.81, 4.45059, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+202, 16285, 0, -8830.83, 640.758, 94.528, 4.2237, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+203, 16478, 0, -8955.32, 523.414, 96.44, 3.78736, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+204, 16786, 0, -8835.75, 644.276, 95.6074, 4.18879, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+205, 16995, 0, -8955.74, 570.615, 93.878, 0.0872665, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+206, 16241, 0, -4928.73, -982.986, 501.552, 2.05949, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+207, 16241, 0, -4894.5, -949.382, 501.554, 2.44303, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+208, 16285, 0, -4930.03, -985.018, 501.548, 2.23402, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+209, 16285, 0, -4894.93, -951.747, 501.553, 2.61756, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+210, 16786, 0, -4926.95, -981.718, 501.55, 2.00713, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+211, 16786, 0, -4893.32, -947.538, 501.552, 2.39067, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+212, 16255, 1, 1584.58, -4416.35, 8.29802, 3.38594, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+213, 16359, 1, 1585.22, -4420.51, 8.32929, 3.45575, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+214, 16493, 1, 1512.33, -4403.79, 19.5269, 5.77704, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+215, 16787, 1, 1586.28, -4425.21, 7.9557, 3.05433, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+216, 16995, 1, 1488.39, -4415.53, 23.7461, 5.06145, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+217, 16255, 1, -1258.69, 67.8713, 127.656, 1.51844, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+218, 16359, 1, -1261.02, 67.5688, 127.552, 0.820305, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+219, 16787, 1, -1255.95, 67.0851, 127.594, 1.79769, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+220, 16995, 1, -1300.34, 173.278, 68.6351, 4.18879, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+221, 16241, 1, 9918.36, 2520.6, 1317.57, 3.31613, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+222, 16241, 1, 9919.14, 2510.43, 1317.62, 4.39823, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+223, 16285, 1, 9918.94, 2518.57, 1317.64, 3.47321, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+224, 16495, 1, 9939.37, 2114.4, 1328.61, 6.10865, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+225, 16786, 1, 9917.67, 2524.46, 1317.53, 3.87463, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+226, 16995, 1, 9952.88, 2246.56, 1334.5, 4.24115, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+227, 16786, 0, 2257.84, -5322.27, 81.8893, 2.80998, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+228, 16787, 0, 2263.72, -5313.31, 81.9193, 3.52556, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+229, 16281, 0, 2242.44, -5317.31, 82.2506, 1.41372, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+230, 16361, 0, 2240.87, -5317.26, 82.2506, 1.67552, 120, 120, 0, 0, 9),
    (@SCOURGE_INVASION_GUID+231, 16285, 0, 2247.79, -5317.31, 82.1935, 1.5708, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @SCOURGE_INVASION_EVENT FROM `creature` WHERE creature.guid BETWEEN @SCOURGE_INVASION_GUID+1 AND @SCOURGE_INVASION_GUID+231;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@SCOURGE_INVASION_GUID+1, 181172, 0, -5122.8, -725, 505.467, 0.0349062, 0, 0, 0.0174522, 0.999848, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+2, 181172, 0, 1852.46, 266.873, 114.815, 0.541051, 0, 0, 0.267238, 0.963631, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+3, 181172, 1, -1511.83, 101.722, 108.569, 1.83259, 0, 0, 0.793353, 0.608762, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+4, 181172, 1, 9972.62, 1993.28, 1406.15, 4.34587, 0, 0, -0.824126, 0.566406, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+5, 181172, 0, -9159.77, 345.552, 156.401, 3.56047, 0, 0, -0.978148, 0.207912, 100, 1, 120, 120, 9),
    -- (@SCOURGE_INVASION_GUID+6, 181172, 0, -5122.8, -697.666, 505.467, 0.0349062, 0, 0, 0.0174522, 0.999848, 100, 1, 120, 120, 9), There is already a necropolis on this position.
    (@SCOURGE_INVASION_GUID+7, 181172, 1, 1210.92, -4315.13, 88.0662, 3.80482, 0, 0, -0.945518, 0.325568, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+8, 181227, 0, -9183.83, 416.188, 89.9123, 0.401425, 0, 0, 0.199367, 0.979925, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+9, 181227, 1, 9948.02, 1932.39, 1328.69, 3.68265, 0, 0, -0.96363, 0.267241, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+10, 181227, 1, 9914.18, 1864.66, 1321.26, 2.91469, 0, 0, 0.993571, 0.113208, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+11, 181227, 1, -1545.47, 51.2859, 5.39412, 0.628317, 0, 0, 0.309016, 0.951057, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+12, 181227, 0, 1980.01, 305.231, 41.1893, 0.436332, 0, 0, 0.216439, 0.976296, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+13, 181227, 1, 1217.81, -4339.42, 25.9249, 4.01426, 0, 0, -0.906307, 0.422619, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+14, 181227, 1, 1169.62, -4320.03, 20.8739, 0.575957, 0, 0, 0.284015, 0.95882, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+15, 181227, 0, -9061.46, 349.666, 93.1098, 4.57276, 0, 0, -0.754709, 0.656059, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+16, 181227, 0, -5175.25, -588.093, 397.984, 2.51327, 0, 0, 0.951056, 0.309017, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+17, 181227, 0, -9218.1, 318.785, 73.865, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+18, 181227, 0, -5163.2, -645.852, 396.992, 0.0523589, 0, 0, 0.0261765, 0.999657, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+19, 181227, 0, -9118.92, 330.1, 93.198, 3.00195, 0, 0, 0.997563, 0.0697661, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+20, 181254, 0, -4926.4, -986.524, 501.455, 2.23402, 0, 0, 0.898793, 0.438373, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+21, 181254, 0, -4891.02, -951.788, 501.468, 2.61756, 0, 0, 0.96587, 0.259028, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+22, 181254, 1, 1587.87, -4417.88, 8.70726, 3.29869, 0, 0, -0.996917, 0.0784664, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+23, 181254, 1, -1259.05, 64.1729, 127.804, 1.48353, 0, 0, 0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+24, 181254, 1, 9921.07, 2521.54, 1318.1, 3.42085, 0, 0, -0.990268, 0.139175, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+25, 181254, 0, -8828.51, 644.644, 94.479, 3.71755, 0, 0, -0.958819, 0.284016, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+26, 181254, 0, 1583.41, 240.46, -62.0773, 3.03684, 0, 0, 0.998629, 0.0523532, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+27, 181255, 1, 9920.94, 2525.91, 1318.96, 1.23918, 0, 0, 0.580703, 0.814116, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+28, 181255, 1, 9920.85, 2526.06, 1318.47, 0.977383, 0, 0, 0.469471, 0.882948, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+29, 181255, 1, -1263.56, 62.3682, 127.785, 1.41372, 0, 0, 0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+30, 181255, 1, -1263.47, 62.4772, 127.278, 1.25664, 0, 0, 0.587785, 0.809017, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+31, 181255, 1, 1587.94, -4413.6, 8.88919, 2.86233, 0, 0, 0.990268, 0.139175, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+32, 181255, 1, 1588.21, -4413.59, 8.40226, 6.26573, 0, 0, -0.00872612, 0.999962, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+33, 181255, 0, -4894.13, -954.969, 501.461, 2.47793, 0, 0, 0.945448, 0.325773, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+34, 181255, 0, -4894.36, -954.946, 501.907, 2.63501, 0, 0, 0.968093, 0.250591, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+35, 181255, 0, -8824.93, 644.94, 94.3843, 1.95477, 0, 0, 0.829038, 0.559193, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+36, 181255, 0, 1582.24, 236.144, -62.0773, 0.087266, 0, 0, 0.0436192, 0.999048, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+37, 181255, 0, -4930.68, -988.202, 501.907, 2.25147, 0, 0, 0.902585, 0.430512, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+38, 181255, 0, -4930.49, -988.305, 501.455, 2.09439, 0, 0, 0.866025, 0.500001, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+39, 181255, 0, 1582.52, 236.04, -62.0773, 3.35105, 0, 0, -0.994521, 0.104535, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+40, 181255, 0, -8824.84, 644.905, 94.8185, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+41, 181256, 0, 1582.02, 244.991, -62.0773, 2.19912, 0, 0, 0.891007, 0.453991, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+42, 181256, 0, 1580.11, 236.901, -62.0773, 3.6652, 0, 0, -0.965925, 0.258821, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+43, 181256, 1, -1254.96, 64.9045, 127.597, 0.872664, 0, 0, 0.422618, 0.906308, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+44, 181256, 1, -1263.03, 65.4217, 127.295, 2.07694, 0, 0, 0.861628, 0.507539, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+45, 181256, 1, 9918.63, 2525.05, 1317.79, 2.51327, 0, 0, 0.951056, 0.309017, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+46, 181256, 1, 1586.84, -4422.45, 8.26005, 3.22886, 0, 0, -0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+47, 181256, 1, 1585.44, -4414.01, 8.08963, 3.3685, 0, 0, -0.993571, 0.113208, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+48, 181256, 0, -8833.52, 645.745, 95.3211, 3.90954, 0, 0, -0.927183, 0.374608, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+49, 181256, 0, -8829.5, 640.266, 94.3804, 3.71755, 0, 0, -0.958819, 0.284016, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+50, 181256, 0, -4891.85, -947.068, 501.468, 2.5652, 0, 0, 0.958758, 0.284223, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+51, 181256, 0, -4895.76, -953.432, 501.465, 2.61756, 0, 0, 0.96587, 0.259028, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+52, 181256, 0, -4925.42, -981.831, 501.466, 2.18166, 0, 0, 0.887011, 0.461749, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+53, 181256, 0, -4931.42, -986.271, 501.462, 2.23402, 0, 0, 0.898793, 0.438373, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+54, 181256, 1, 9920.85, 2516.86, 1317.96, 4.10152, 0, 0, -0.887011, 0.461749, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+55, 181256, 0, 2238.91, -5318.67, 82.1523, 1.55334, 0, 0, 0.700909, 0.713251, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+56, 181256, 0, 2248.47, -5318.94, 82.1143, 1.5708, 0, 0, 0.707107, 0.707107, 100, 1, 120, 120, 9),
    (@SCOURGE_INVASION_GUID+57, 181254, 0, 2243.86, -5321.14, 82.1673, 1.48353, 0, 0, 0.67559, 0.737278, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @SCOURGE_INVASION_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @SCOURGE_INVASION_GUID+1 AND @SCOURGE_INVASION_GUID+57;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@INVASIONS_DONE_GUID+1 , 16787, 1, 1583.22, -4412.06, 7.73177, 2.37365, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+2 , 16787, 0, 1585.96, 249.99, -61.994, 2.26893, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+3 , 16787, 1, -1256.72, 76.7393, 128.049, 4.41568, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+4 , 16786, 1, 9907.45, 2519.83, 1316.41, 0.15708, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+5 , 16786, 0, -8836.57, 647.61, 96.3019, 3.90954, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+6 , 16786, 0, -4885.84, -945.795, 501.547, 2.72228, 120, 120, 0, 0, 9),
    (@INVASIONS_DONE_GUID+7 , 16786, 0, 2253.82, -5310.68, 82.2506, 1.8675, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @INVASIONS_DONE_EVENT FROM `creature` WHERE creature.guid BETWEEN @INVASIONS_DONE_GUID+1 AND @INVASIONS_DONE_GUID+7;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@INVASIONS_DONE_GUID+1, 181256, 1, 1585.55, -4409.76, 7.27701, 3.03684, 0, 0, 0.998629, 0.0523532, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+2, 181256, 0, 1584.6, 245.848, -62.0773, 3.12412, 0, 0, 0.999962, 0.00873464, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+3, 181256, 1, -1258.73, 78.1247, 128.035, 4.62512, 0, 0, -0.737277, 0.675591, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+4, 181256, 0, -4884.69, -943.904, 501.462, 1.83216, 0, 0, 0.793221, 0.608933, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+5, 181256, 0, -8836.66, 644.879, 95.692, 3.9619, 0, 0, -0.91706, 0.39875, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+6, 181256, 1, 9909.79, 2516.55, 1316.68, 5.11382, 0, 0, -0.551936, 0.833886, 100, 1, 120, 120, 9),
    (@INVASIONS_DONE_GUID+7, 181256, 0, 2250.87, -5312.69, 82.1539, 2.89724, 0, 0, 0.992546, 0.12187, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @INVASIONS_DONE_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @INVASIONS_DONE_GUID+1 AND @INVASIONS_DONE_GUID+7;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@FIFTY_INVASIONS_GUID+1, 16395, 0, -8834.53, 643.027, 95.2532, 4.32842, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+2, 16395, 0, -4888.24, -945.974, 501.549, 2.86191, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+3, 16395, 0, 2251.9, -5310.87, 82.2506, 2.37365, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+4, 16395, 1, 9908.96, 2521.1, 1316.48, 0.122173, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+5, 16384, 0, 1584.52, 248.001, -61.994, 3.08923, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+6, 16384, 1, -1256.82, 75.1629, 127.892, 4.18879, 120, 120, 0, 0, 9),
    (@FIFTY_INVASIONS_GUID+7, 16384, 1, 1581.37, -4411.9, 7.4357, 2.47837, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @FIFTY_INVASIONS_EVENT FROM `creature` WHERE creature.guid BETWEEN @FIFTY_INVASIONS_GUID+1 AND @FIFTY_INVASIONS_GUID+7;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@HUNDRED_INVASIONS_GUID+1, 16433, 0, -8834.53, 643.027, 95.2532, 4.32842, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+2, 16433, 0, -4888.24, -945.974, 501.549, 2.86191, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+3, 16433, 0, 2251.9, -5310.87, 82.2506, 2.37365, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+4, 16433, 1, 9908.96, 2521.1, 1316.48, 0.122173, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+5, 16435, 0, 1584.52, 248.001, -61.994, 3.08923, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+6, 16435, 1, -1256.82, 75.1629, 127.892, 4.18879, 120, 120, 0, 0, 9),
    (@HUNDRED_INVASIONS_GUID+7, 16435, 1, 1581.37, -4411.9, 7.4357, 2.47837, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @HUNDRED_INVASIONS_EVENT FROM `creature` WHERE creature.guid BETWEEN @HUNDRED_INVASIONS_GUID+1 AND @HUNDRED_INVASIONS_GUID+7;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@HUNDREDFIFTY_INVASIONS_GUID+1, 16434, 0, -8834.53, 643.027, 95.2532, 4.32842, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+2, 16434, 0, -4888.24, -945.974, 501.549, 2.86191, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+3, 16434, 0, 2251.9, -5310.87, 82.2506, 2.37365, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+4, 16434, 1, 9908.96, 2521.1, 1316.48, 0.122173, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+5, 16436, 0, 1584.52, 248.001, -61.994, 3.08923, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+6, 16436, 1, -1256.82, 75.1629, 127.892, 4.18879, 120, 120, 0, 0, 9),
    (@HUNDREDFIFTY_INVASIONS_GUID+7, 16436, 1, 1581.37, -4411.9, 7.4357, 2.47837, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @HUNDREDFIFTY_INVASIONS_EVENT FROM `creature` WHERE creature.guid BETWEEN @HUNDREDFIFTY_INVASIONS_GUID+1 AND @HUNDREDFIFTY_INVASIONS_GUID+7;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@WINTERSPRING_GUID+1, 181136, 1, 6052.6, -4749.63, 785.534, 1.27409, 0, 0, 0.594822, 0.803857, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+2, 181136, 1, 7939.65, -3870.93, 695.403, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+3, 181136, 1, 7822.94, -4220.18, 675.491, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+4, 181136, 1, 7687.87, -3877.74, 687.153, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+5, 181136, 1, 6782, -3585.64, 712.276, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+6, 181136, 1, 6742.24, -3352.34, 688.37, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+7, 181136, 1, 6547.4, -3482.4, 643.628, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+8, 181136, 1, 6284.69, -4782.17, 757.315, 2.33874, 0, 0, 0.920505, 0.390732, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+9, 181136, 1, 6072.11, -5040.12, 789.939, 5.13127, 0, 0, -0.544639, 0.838671, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+10, 181173, 1, 7688.84, -3892.03, 689.552, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+11, 181173, 1, 7677.07, -3887.32, 687.06, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+12, 181173, 1, 7675.17, -3868.89, 685.395, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+13, 181173, 1, 6791.23, -3586.77, 712.718, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+14, 181173, 1, 6787.01, -3575.92, 708.803, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+15, 181173, 1, 6783.48, -3595.3, 715.923, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+16, 181173, 1, 6773.85, -3579.55, 710.883, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+17, 181173, 1, 6773.62, -3590.98, 714.233, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+18, 181173, 1, 6752.31, -3349.22, 685.869, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+19, 181173, 1, 7689.83, -3862.5, 686.37, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+20, 181173, 1, 7701.99, -3880.54, 687.945, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+21, 181173, 1, 7811.98, -4226.34, 677.521, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+22, 181173, 1, 7951.54, -3875.18, 694.948, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+23, 181173, 1, 7945.81, -3859.84, 695.185, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+24, 181173, 1, 7939.62, -3882.95, 695.515, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+25, 181173, 1, 7932.25, -3861.72, 695.668, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+26, 181173, 1, 7926.75, -3878.23, 695.294, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+27, 181173, 1, 7840.28, -4217.08, 675.564, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+28, 181173, 1, 7830.69, -4208.48, 675.725, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+29, 181173, 1, 7822.53, -4234.33, 680.112, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+30, 181173, 1, 7815.5, -4209.39, 675.145, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+31, 181173, 1, 6751.79, -3360.8, 684.975, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+32, 181173, 1, 6740.9, -3342.74, 686.804, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+33, 181173, 1, 6737.26, -3361.34, 687.013, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+34, 181173, 1, 6080.37, -5030.69, 788.598, 3.7001, 0, 0, -0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+35, 181173, 1, 6070.33, -5052.18, 794.006, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+36, 181173, 1, 6065.6, -5029.23, 785.481, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+37, 181173, 1, 6063.71, -4749.12, 778.662, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+38, 181173, 1, 6061.29, -5044.73, 790.336, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+39, 181173, 1, 6056.9, -4757.58, 785.737, 4.32842, 0, 0, -0.829037, 0.559194, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+40, 181173, 1, 6053.48, -4740.55, 785.28, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+41, 181173, 1, 6047.01, -4754.71, 790.205, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+42, 181173, 1, 6046.73, -4744.43, 789.809, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+43, 181173, 1, 6081.69, -5044.22, 792.539, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+44, 181173, 1, 6275.49, -4782.48, 756.862, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+45, 181173, 1, 6280.31, -4772.92, 756.073, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+46, 181173, 1, 6732.46, -3350.71, 687.625, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+47, 181173, 1, 6557.24, -3474.46, 645.709, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+48, 181173, 1, 6553.72, -3489.82, 647.38, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+49, 181173, 1, 6547, -3471.53, 639.958, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+50, 181173, 1, 6540.5, -3491.92, 643.55, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+51, 181173, 1, 6536.37, -3480.21, 639.161, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+52, 181173, 1, 6293.4, -4783.96, 758.477, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+53, 181173, 1, 6291, -4774.14, 756.714, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+54, 181173, 1, 6284.65, -4791.1, 758.13, 4.32842, 0, 0, -0.829037, 0.559194, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+55, 181174, 1, 7688.84, -3892.03, 689.552, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+56, 181174, 1, 7677.07, -3887.32, 687.06, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+57, 181174, 1, 7675.17, -3868.89, 685.395, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+58, 181174, 1, 6791.23, -3586.77, 712.718, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+59, 181174, 1, 6787.01, -3575.92, 708.803, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+60, 181174, 1, 6783.48, -3595.3, 715.923, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+61, 181174, 1, 6773.85, -3579.55, 710.883, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+62, 181174, 1, 6773.62, -3590.98, 714.233, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+63, 181174, 1, 6752.31, -3349.22, 685.869, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+64, 181174, 1, 6751.79, -3360.8, 684.975, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+65, 181174, 1, 7689.83, -3862.5, 686.37, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+66, 181174, 1, 7701.99, -3880.54, 687.945, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+67, 181174, 1, 7945.81, -3859.84, 695.185, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+68, 181174, 1, 7939.62, -3882.95, 695.515, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+69, 181174, 1, 7932.25, -3861.72, 695.668, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+70, 181174, 1, 7926.75, -3878.23, 695.294, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+71, 181174, 1, 7840.28, -4217.08, 675.564, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+72, 181174, 1, 7830.69, -4208.48, 675.725, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+73, 181174, 1, 7822.53, -4234.33, 680.112, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+74, 181174, 1, 7815.5, -4209.39, 675.145, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+75, 181174, 1, 7811.98, -4226.34, 677.521, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+76, 181174, 1, 7951.54, -3875.18, 694.948, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+77, 181174, 1, 6740.9, -3342.74, 686.804, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+78, 181174, 1, 6737.26, -3361.34, 687.013, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+79, 181174, 1, 6080.37, -5030.69, 788.598, 3.7001, 0, 0, -0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+80, 181174, 1, 6070.33, -5052.18, 794.006, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+81, 181174, 1, 6065.6, -5029.23, 785.481, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+82, 181174, 1, 6063.71, -4749.12, 778.662, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+83, 181174, 1, 6061.29, -5044.73, 790.336, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+84, 181174, 1, 6056.9, -4757.58, 785.737, 4.32842, 0, 0, -0.829037, 0.559194, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+85, 181174, 1, 6053.48, -4740.55, 785.28, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+86, 181174, 1, 6047.01, -4754.71, 790.205, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+87, 181174, 1, 6046.73, -4744.43, 789.809, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+88, 181174, 1, 6081.69, -5044.22, 792.539, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+89, 181174, 1, 6275.49, -4782.48, 756.862, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+90, 181174, 1, 6280.31, -4772.92, 756.073, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+91, 181174, 1, 6732.46, -3350.71, 687.625, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+92, 181174, 1, 6557.24, -3474.46, 645.709, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+93, 181174, 1, 6553.72, -3489.82, 647.38, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+94, 181174, 1, 6547, -3471.53, 639.958, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+95, 181174, 1, 6540.5, -3491.92, 643.55, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+96, 181174, 1, 6536.37, -3480.21, 639.161, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+97, 181174, 1, 6293.4, -4783.96, 758.477, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+98, 181174, 1, 6291, -4774.14, 756.714, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+99, 181174, 1, 6284.65, -4791.1, 758.13, 4.32842, 0, 0, -0.829037, 0.559194, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+100, 181191, 1, 6280.72, -4792.69, 757.879, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+101, 181191, 1, 6285.01, -4810.11, 758.283, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+102, 181191, 1, 6303.22, -4754.17, 762.843, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+103, 181191, 1, 6305.35, -4812.15, 755.291, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+104, 181191, 1, 7703.84, -3876.46, 687.837, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+105, 181191, 1, 6523.63, -3485.76, 637.073, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+106, 181191, 1, 6279.96, -4792.25, 757.774, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+107, 181191, 1, 6277.27, -4771.49, 755.742, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+108, 181191, 1, 6270.84, -4755.31, 753.638, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+109, 181191, 1, 6253.66, -4755.55, 753.513, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+110, 181191, 1, 6239.76, -4810.6, 757.662, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+111, 181191, 1, 6118.95, -5038.25, 791.291, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+112, 181191, 1, 7814.2, -4236.19, 680.603, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+113, 181191, 1, 7829.87, -4199.46, 676.699, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+114, 181191, 1, 7700.66, -3858.5, 688.053, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+115, 181191, 1, 6543.6, -3473.05, 638.964, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+116, 181191, 1, 7700.63, -3853.92, 688.848, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+117, 181191, 1, 6770.72, -3588.42, 713.462, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+118, 181191, 1, 6780.09, -3552.03, 702.982, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+119, 181191, 1, 6780.31, -3608.75, 719.072, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+120, 181191, 1, 6787.05, -3565.61, 706.188, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+121, 181191, 1, 6733, -3376.66, 680.377, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+122, 181191, 1, 6727.33, -3325.57, 681.35, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+123, 181191, 1, 7652.7, -3868.06, 684.898, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+124, 181191, 1, 6573.9, -3483.82, 658.282, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+125, 181191, 1, 7672.77, -3879.24, 686.063, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+126, 181191, 1, 6572, -3461.13, 650.298, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+127, 181191, 1, 6559.69, -3485.18, 649.252, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+128, 181191, 1, 7680.09, -3866.85, 685.594, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+129, 181191, 1, 7681.38, -3868.22, 685.793, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+130, 181191, 1, 6771.26, -3589.5, 713.749, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+131, 181191, 1, 7922.56, -3866.16, 696.966, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+132, 181191, 1, 7947.38, -3862.14, 695.209, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+133, 181191, 1, 6036.04, -5017.71, 781.846, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+134, 181191, 1, 6027.04, -5037.71, 783.62, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+135, 181191, 1, 7941.17, -3886.24, 695.238, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+136, 181191, 1, 6079.17, -5018.45, 786.023, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+137, 181191, 1, 7941.02, -3855.58, 695.078, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+138, 181191, 1, 6038.32, -4735.53, 793.959, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+139, 181191, 1, 6095.61, -4756.99, 758.707, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+140, 181192, 1, 6037.22, -4760.02, 794.969, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+141, 181192, 1, 6022.51, -5022.58, 781.851, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+142, 181192, 1, 6723.63, -3357.09, 686.36, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+143, 181192, 1, 6023.65, -4723.44, 799.217, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+144, 181192, 1, 7839.97, -4227.98, 676.906, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+145, 181192, 1, 6049.41, -4739.42, 787.897, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+146, 181192, 1, 7680.05, -3869.54, 685.765, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+147, 181192, 1, 7944.12, -3887.76, 694.885, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+148, 181192, 1, 7945.83, -3886.93, 694.836, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+149, 181192, 1, 7947.08, -3858.18, 695.113, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+150, 181192, 1, 6735.44, -3344.8, 686.807, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+151, 181192, 1, 6773.27, -3334.44, 676.92, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+152, 181192, 1, 6767.33, -3617.96, 720.119, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+153, 181192, 1, 6773.92, -3334.25, 676.696, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+154, 181192, 1, 6759.59, -3356.03, 682.107, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+155, 181192, 1, 6759.39, -3578.55, 709.409, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+156, 181192, 1, 6759.25, -3559.23, 702.179, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+157, 181192, 1, 6752.2, -3323.48, 677.893, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+158, 181192, 1, 7954.69, -3871.91, 695.201, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+159, 181192, 1, 6748.73, -3341.29, 685.584, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+160, 181192, 1, 6012.84, -4774.02, 799.936, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+161, 181192, 1, 6790.12, -3610.6, 719.965, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+162, 181192, 1, 6808.92, -3588.39, 715.136, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+163, 181192, 1, 6044.28, -5031.84, 783.654, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+164, 181192, 1, 6539.98, -3504.23, 646.37, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+165, 181192, 1, 7922.72, -3884.97, 694.782, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+166, 181192, 1, 7830.32, -4196.79, 677.141, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+167, 181192, 1, 6275.72, -4772.13, 755.884, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+168, 181192, 1, 7922.17, -3870.31, 696.454, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+169, 181192, 1, 6254.01, -4754.98, 753.513, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+170, 181192, 1, 6071.98, -4998.29, 782.531, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+171, 181192, 1, 7837.79, -4229.47, 677.319, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+172, 181192, 1, 7815.1, -4232.74, 679.616, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+173, 181192, 1, 7825.49, -4240.33, 681.8, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+174, 181192, 1, 7825.88, -4237.19, 680.884, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+175, 181192, 1, 7827.11, -4238.12, 681.061, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+176, 181192, 1, 6773.77, -3573.25, 708.462, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+177, 181192, 1, 7701.28, -3857.09, 688.463, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+178, 181192, 1, 6049.59, -4723.78, 784.482, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+179, 181192, 1, 6526.9, -3506.54, 644.309, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+180, 181192, 1, 6310.08, -4811.32, 754.724, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+181, 181192, 1, 7929.03, -3839.96, 697.334, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+182, 181192, 1, 7928.2, -3838.52, 697.282, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+183, 181192, 1, 6534.08, -3467.39, 632.624, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+184, 181192, 1, 6526.48, -3511.82, 645.865, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+185, 181193, 1, 7688.64, -3887.38, 687.983, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+186, 181193, 1, 7956.02, -3872.67, 695.24, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+187, 181193, 1, 6774.77, -3571.34, 707.807, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+188, 181193, 1, 7831.1, -4197.87, 677.076, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+189, 181193, 1, 7681.06, -3866.14, 685.673, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+190, 181193, 1, 7813.87, -4234.42, 680.098, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+191, 181193, 1, 6779.28, -3365.8, 671.606, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+192, 181193, 1, 7668.84, -3879.69, 685.915, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+193, 181193, 1, 7812.46, -4213.05, 675.142, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+194, 181193, 1, 7807.12, -4222.25, 676.505, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+195, 181193, 1, 7806.42, -4222.62, 676.601, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+196, 181193, 1, 7670.92, -3881.04, 686.056, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+197, 181193, 1, 7923.6, -3885.66, 694.762, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+198, 181193, 1, 7927.77, -3842.22, 697.657, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+199, 181193, 1, 7704.6, -3875.36, 687.847, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+200, 181193, 1, 6761.1, -3345.33, 681.59, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+201, 181193, 1, 6059.8, -5063.97, 803.037, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+202, 181193, 1, 6559.08, -3486.38, 649.274, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+203, 181193, 1, 6553.16, -3511.32, 654.066, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+204, 181193, 1, 6552.37, -3512.79, 654.12, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+205, 181193, 1, 6061.17, -4741.01, 780.119, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+206, 181193, 1, 6548.6, -3457.54, 636.978, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+207, 181193, 1, 7812.17, -4236.05, 680.415, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+208, 181193, 1, 6524.11, -3485.38, 637.018, 0.0698117, 0, 0, 0.0348988, 0.999391, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+209, 181193, 1, 6314.06, -4784.79, 755.291, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+210, 181193, 1, 6062.72, -4765.63, 784.29, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+211, 181193, 1, 6083.31, -4740.33, 766.961, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+212, 181193, 1, 6117.96, -5039.05, 791.338, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+213, 181193, 1, 6105.89, -5004.39, 788.874, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+214, 181193, 1, 6094.67, -4758.38, 759.308, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+215, 181193, 1, 6054.86, -5035.81, 785.729, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+216, 181193, 1, 6572.7, -3480.62, 656.029, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+217, 181193, 1, 6760.55, -3606.53, 716.882, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+218, 181193, 1, 6010.73, -5045.85, 787.062, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+219, 181193, 1, 6746.21, -3367.38, 684.331, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+220, 181193, 1, 6746.08, -3380.7, 681.023, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+221, 181193, 1, 6018.93, -4736.45, 803.017, 0.0698117, 0, 0, 0.0348988, 0.999391, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+222, 181193, 1, 6049.14, -4723.7, 784.812, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+223, 181193, 1, 6742.03, -3566.77, 701.938, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+224, 181193, 1, 6037.43, -4760.56, 794.89, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+225, 181193, 1, 6039.19, -5054.72, 795.048, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+226, 181194, 1, 6050.72, -5008.29, 781.027, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+227, 181194, 1, 7954.38, -3870.54, 695.227, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+228, 181194, 1, 7938.94, -3887.57, 695.173, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+229, 181194, 1, 6094.3, -5053.53, 795.275, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+230, 181194, 1, 6093.83, -4756.6, 759.822, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+231, 181194, 1, 6793.19, -3594.2, 715.44, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+232, 181194, 1, 6075.96, -4781.22, 773.205, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+233, 181194, 1, 7841.32, -4210.41, 676.247, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+234, 181194, 1, 7922, -3868.02, 696.827, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+235, 181194, 1, 6014.15, -4773.88, 799.724, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+236, 181194, 1, 6061.72, -4741.88, 779.778, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+237, 181194, 1, 6060.76, -5063.9, 803.047, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+238, 181194, 1, 6525.25, -3457.35, 626.526, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+239, 181194, 1, 6104.99, -5004.92, 788.723, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+240, 181194, 1, 6105.01, -5025.15, 790.674, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+241, 181194, 1, 7679.69, -3852.65, 686.282, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+242, 181194, 1, 6720.69, -3342.35, 684.403, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+243, 181194, 1, 6724.2, -3358.49, 686.193, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+244, 181194, 1, 6724.7, -3357.41, 686.361, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+245, 181194, 1, 7650.75, -3870.34, 684.878, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+246, 181194, 1, 6810.17, -3588.13, 715.463, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+247, 181194, 1, 6745.25, -3367.39, 684.424, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+248, 181194, 1, 6781.15, -3551.25, 702.816, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+249, 181194, 1, 6749.57, -3342.13, 685.646, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+250, 181194, 1, 6753.27, -3587.21, 710.209, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+251, 181194, 1, 6560.25, -3486.85, 650.214, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+252, 181194, 1, 6549.6, -3456.65, 637.663, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+253, 181194, 1, 7812.75, -4214.37, 675.185, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+254, 181194, 1, 6257.11, -4778.2, 754.555, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+255, 181194, 1, 7824.72, -4201.28, 676.084, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+256, 181194, 1, 6260.07, -4803.59, 758.109, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+257, 181194, 1, 6279.65, -4793.17, 757.857, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+258, 181194, 1, 6284.16, -4809.84, 758.301, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+259, 181194, 1, 7701.83, -3855.88, 688.818, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+260, 181194, 1, 7697.07, -3866.02, 687.001, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+261, 181194, 1, 6240.71, -4811.52, 757.896, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+262, 181223, 1, 6646.69, -3442.36, 792.916, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+263, 181223, 1, 7755.75, -4030.91, 786.496, 0.471238, 0, 0, 0.233445, 0.97237, 100, 1, 120, 120, 9),
    (@WINTERSPRING_GUID+264, 181373, 1, 6184.28, -4913.32, 807.676, 6.0912, 0, 0, -0.0958452, 0.995396, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @WINTERSPRING_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @WINTERSPRING_GUID+1 AND @WINTERSPRING_GUID+264;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@WINTERSPRING_GUID+1, 16356, 1, 7803.92, -4223.38, 676.976, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+2, 16356, 1, 7692.21, -3843.77, 688.606, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+3, 16356, 1, 7688.04, -3897.73, 694.276, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+4, 16356, 1, 7682.71, -3885.57, 687.503, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+5, 16356, 1, 7680.04, -3872.52, 686.097, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+6, 16356, 1, 7678.66, -3914.82, 692.927, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+7, 16356, 1, 7677, -3857.65, 685.728, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+8, 16356, 1, 7667.13, -3911.85, 689.31, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+9, 16356, 1, 7652.64, -3903.16, 686.687, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+10, 16356, 1, 6809.51, -3588.19, 715.367, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+11, 16356, 1, 6803.28, -3609.97, 724.075, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+12, 16356, 1, 7692.97, -3869.9, 686.828, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+13, 16356, 1, 7693.95, -3855.77, 687.262, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+14, 16356, 1, 7795.84, -4235.55, 680.31, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+15, 16356, 1, 7795.27, -4208.93, 676.937, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+16, 16356, 1, 7795.15, -4252.16, 684.127, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+17, 16356, 1, 7789.24, -4224.77, 678.404, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+18, 16356, 1, 7788.19, -4196.17, 678.94, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+19, 16356, 1, 7722.49, -3863.91, 692.282, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+20, 16356, 1, 7709.28, -3870.56, 688.726, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+21, 16356, 1, 7707.08, -3889.23, 688.648, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+22, 16356, 1, 7706.35, -3854.83, 690.143, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+23, 16356, 1, 7696.09, -3920.77, 696.934, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+24, 16356, 1, 6798.58, -3567.63, 707.992, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+25, 16356, 1, 6798.46, -3596.05, 715.951, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+26, 16356, 1, 6795.1, -3623.55, 723.573, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+27, 16356, 1, 6767.9, -3597.28, 715.526, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+28, 16356, 1, 6765.78, -3312.03, 670.013, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+29, 16356, 1, 6761.73, -3369.84, 680.471, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+30, 16356, 1, 6759.54, -3586.78, 711.38, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+31, 16356, 1, 6758.04, -3387.27, 681.821, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+32, 16356, 1, 6757.12, -3329.69, 679.008, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+33, 16356, 1, 6755.89, -3355.38, 684.195, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+34, 16356, 1, 6755.18, -3542.83, 695.273, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+35, 16356, 1, 6751.6, -3343.63, 685.362, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+36, 16356, 1, 6750.93, -3596.03, 712.466, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+37, 16356, 1, 6768.14, -3343.88, 679.026, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+38, 16356, 1, 6768.48, -3608.16, 718.727, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+39, 16356, 1, 6793.59, -3582.59, 711.24, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+40, 16356, 1, 6792.82, -3333.73, 672.688, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+41, 16356, 1, 6781.79, -3605.28, 718.212, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+42, 16356, 1, 6781.78, -3572.2, 707.945, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+43, 16356, 1, 6780.61, -3388.83, 670.426, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+44, 16356, 1, 6776.84, -3327.48, 675.283, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+45, 16356, 1, 6773.43, -3359.75, 674.856, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+46, 16356, 1, 6770.59, -3539.92, 696.328, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+47, 16356, 1, 6768.67, -3576.22, 709.911, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+48, 16356, 1, 6768.63, -3558.32, 703.155, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+49, 16356, 1, 6748.63, -3577.6, 706.911, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+50, 16356, 1, 7806.19, -4247.15, 682.155, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+51, 16356, 1, 7965.54, -3861.22, 694.937, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+52, 16356, 1, 7945.12, -3861.87, 695.372, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+53, 16356, 1, 7943.79, -3893.78, 694.071, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+54, 16356, 1, 7941.25, -3838.65, 695.45, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+55, 16356, 1, 7939.44, -3824.62, 694.276, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+56, 16356, 1, 7937.52, -3907.76, 691.837, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+57, 16356, 1, 7936.22, -3851.07, 695.79, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+58, 16356, 1, 7933.96, -3880.2, 695.511, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+59, 16356, 1, 7930.05, -3865.68, 696.047, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+60, 16356, 1, 7928.04, -3895.8, 693.936, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+61, 16356, 1, 7927.97, -3839.86, 697.547, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+62, 16356, 1, 7947.64, -3849.3, 695.279, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+63, 16356, 1, 7949.9, -3877.03, 694.952, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+64, 16356, 1, 7965.36, -3899.19, 690.591, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+65, 16356, 1, 7963.28, -3831.76, 695.148, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+66, 16356, 1, 7962, -3877.56, 694.392, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+67, 16356, 1, 7959.24, -3852.64, 695.212, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+68, 16356, 1, 7957.85, -3866.2, 695.307, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+69, 16356, 1, 7957.6, -3842.41, 695.523, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+70, 16356, 1, 7956.16, -3890.51, 692.989, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+71, 16356, 1, 7956.12, -3823.11, 694.151, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+72, 16356, 1, 7954.25, -3903.53, 692.432, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+73, 16356, 1, 7951.07, -3833.49, 694.815, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+74, 16356, 1, 7919.76, -3859.64, 697.67, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+75, 16356, 1, 7919.69, -3876.01, 695.881, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+76, 16356, 1, 7911.53, -3892.2, 694.113, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+77, 16356, 1, 7828.07, -4212.5, 675.284, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+78, 16356, 1, 7824.58, -4198.73, 676.44, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+79, 16356, 1, 7823.87, -4236.39, 680.851, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+80, 16356, 1, 7823.81, -4183.98, 678.287, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+81, 16356, 1, 7819.69, -4253.9, 683.877, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+82, 16356, 1, 7819.46, -4228.16, 678.039, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+83, 16356, 1, 7814.38, -4215.36, 675.235, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+84, 16356, 1, 7810.57, -4187.36, 679.448, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+85, 16356, 1, 7808.61, -4236.62, 680.346, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+86, 16356, 1, 7807.68, -4200.73, 676.644, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+87, 16356, 1, 7830.36, -4226.16, 676.592, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+88, 16356, 1, 7830.58, -4248.46, 683.335, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+89, 16356, 1, 7906.08, -3869.86, 697.101, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+90, 16356, 1, 7898.49, -3883.67, 695.912, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+91, 16356, 1, 7862.23, -4231.88, 680.239, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+92, 16356, 1, 7859.19, -4210.56, 677.92, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+93, 16356, 1, 7848.99, -4251.67, 682.438, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+94, 16356, 1, 7845.04, -4220.46, 676.056, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+95, 16356, 1, 7843.34, -4239.35, 680.186, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+96, 16356, 1, 7837.27, -4205.74, 676.506, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+97, 16356, 1, 7834.89, -4191.34, 678.831, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+98, 16356, 1, 7833.12, -4264.02, 685.045, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+99, 16356, 1, 7806.81, -4258.37, 684.659, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+100, 16356, 1, 6744.93, -3365.14, 685.487, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+101, 16356, 1, 6267.61, -4741.21, 752.306, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+102, 16356, 1, 6097.15, -4760.67, 757.799, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+103, 16356, 1, 6095.58, -5003.05, 786.695, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+104, 16356, 1, 6094.11, -4743.58, 760.271, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+105, 16356, 1, 6091.63, -4773.75, 767.684, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+106, 16356, 1, 6088.08, -4715.84, 748.35, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+107, 16356, 1, 6084.75, -4788.65, 767.875, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+108, 16356, 1, 6082.92, -4760.65, 768.08, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+109, 16356, 1, 6082.63, -5087.32, 826.216, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+110, 16356, 1, 6077.83, -5007.27, 784.157, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+111, 16356, 1, 6074.85, -4773.89, 773.899, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+112, 16356, 1, 6099.65, -5034.8, 791.309, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+113, 16356, 1, 6101.9, -5048.42, 793.883, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+114, 16356, 1, 6266.41, -4760.14, 754.315, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+115, 16356, 1, 6264.28, -4779.01, 755.461, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+116, 16356, 1, 6261.85, -4815.35, 756.9, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+117, 16356, 1, 6260.05, -4793.75, 756.794, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+118, 16356, 1, 6245.98, -4805.58, 757.178, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+119, 16356, 1, 6244.2, -4822.47, 758.176, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+120, 16356, 1, 6115.64, -5055.81, 794.876, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+121, 16356, 1, 6114.28, -5035.89, 791.659, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+122, 16356, 1, 6111.27, -5071.46, 809.851, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+123, 16356, 1, 6107.5, -5018.22, 790.313, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+124, 16356, 1, 6074.01, -5025.43, 786.359, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+125, 16356, 1, 6066.06, -5051.1, 793.402, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+126, 16356, 1, 6065.56, -5072.04, 807.075, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+127, 16356, 1, 6038.34, -5052.79, 793.367, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+128, 16356, 1, 6034.1, -5016.35, 781.757, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+129, 16356, 1, 6032.58, -4761.92, 796.403, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+130, 16356, 1, 6030.76, -4794.53, 783.93, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+131, 16356, 1, 6030.33, -4747.28, 800.217, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+132, 16356, 1, 6029.56, -5033.75, 783.063, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+133, 16356, 1, 6028.84, -5069.67, 798.821, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+134, 16356, 1, 6026.22, -5049.34, 787.266, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+135, 16356, 1, 6023.85, -4776.91, 796.595, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+136, 16356, 1, 6019.6, -4757.41, 803.772, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+137, 16356, 1, 6043.09, -4722.28, 788.435, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+138, 16356, 1, 6044.18, -5030.07, 783.474, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+139, 16356, 1, 6064.33, -4785.45, 776.044, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+140, 16356, 1, 6063.3, -4997.71, 781.419, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+141, 16356, 1, 6061.17, -4742.39, 780.267, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+142, 16356, 1, 6060.16, -5034.83, 786.358, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+143, 16356, 1, 6058.75, -5016.88, 782.489, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+144, 16356, 1, 6051.28, -5047.69, 789.502, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+145, 16356, 1, 6049.2, -5003.04, 780.38, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+146, 16356, 1, 6048.68, -5063.69, 803.729, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+147, 16356, 1, 6047.73, -4760.52, 791.407, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+148, 16356, 1, 6046.94, -4713.09, 780.627, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+149, 16356, 1, 6019.56, -4732.35, 802.346, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+150, 16356, 1, 6274.75, -4790.02, 757.197, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+151, 16356, 1, 6744.9, -3380.01, 681.274, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+152, 16356, 1, 6710.2, -3323.17, 675.236, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+153, 16356, 1, 6710, -3337.31, 680.159, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+154, 16356, 1, 6707.89, -3378.02, 672.704, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+155, 16356, 1, 6697.96, -3353.05, 678.908, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+156, 16356, 1, 6592.46, -3487.51, 668.623, 4.06662, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+157, 16356, 1, 6585.37, -3473.38, 661.758, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+158, 16356, 1, 6582.48, -3498.92, 668.396, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+159, 16356, 1, 6571.48, -3482.74, 656.277, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+160, 16356, 1, 6569.58, -3465.98, 650.354, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+161, 16356, 1, 6566.26, -3496.04, 657.436, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+162, 16356, 1, 6714.63, -3360.29, 685.129, 5.53269, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+163, 16356, 1, 6722.37, -3390.24, 670.368, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+164, 16356, 1, 6743.57, -3622.55, 716.376, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+165, 16356, 1, 6743.03, -3307.84, 673.46, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+166, 16356, 1, 6740.54, -3392.55, 681.018, 4.20625, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+167, 16356, 1, 6738.41, -3327.87, 681.681, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+168, 16356, 1, 6735.53, -3341.49, 686.324, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+169, 16356, 1, 6732.38, -3355.74, 687.47, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+170, 16356, 1, 6729.42, -3370.34, 682.625, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+171, 16356, 1, 6725.51, -3317.41, 676.774, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+172, 16356, 1, 6724.65, -3332.95, 682.82, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+173, 16356, 1, 6722.6, -3345.27, 685.512, 1.95477, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+174, 16356, 1, 6566.17, -3515.59, 664.822, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+175, 16356, 1, 6555.9, -3442.93, 639.3, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+176, 16356, 1, 6275.42, -4772.54, 756.038, 5.63741, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+177, 16356, 1, 6507.96, -3520.64, 646.056, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+178, 16356, 1, 6328, -4811.45, 754.255, 4.03171, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+179, 16356, 1, 6321.46, -4795.62, 751.583, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+180, 16356, 1, 6316.25, -4825.19, 752.389, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+181, 16356, 1, 6315.73, -4777.7, 756.809, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+182, 16356, 1, 6300.74, -4746.35, 763.063, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+183, 16356, 1, 6300.34, -4823.2, 755.121, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+184, 16356, 1, 6293.97, -4810.5, 757.794, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+185, 16356, 1, 6278.87, -4805.42, 758.657, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+186, 16356, 1, 6278.3, -4822.49, 753.667, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+187, 16356, 1, 6518.95, -3487.36, 636.76, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+188, 16356, 1, 6524.56, -3475.16, 631.954, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+189, 16356, 1, 6555.51, -3507.44, 654.253, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+190, 16356, 1, 6554.91, -3494.86, 649.53, 1.8675, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+191, 16356, 1, 6554.11, -3471.91, 643.641, 5.20108, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+192, 16356, 1, 6550.84, -3458.72, 638.834, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+193, 16356, 1, 6545.69, -3522.92, 654.758, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+194, 16356, 1, 6544.11, -3447.51, 631.453, 3.14159, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+195, 16356, 1, 6538.32, -3507.86, 647.232, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+196, 16356, 1, 6536.56, -3488.23, 642.123, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+197, 16356, 1, 6532.16, -3437.84, 620.91, 1.85005, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+198, 16356, 1, 6530.19, -3521.71, 651.428, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+199, 16356, 1, 6525.9, -3499.27, 642.475, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+200, 16386, 1, 7878.21, -3923.94, 725.313, 0.715585, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+201, 16386, 1, 7797.48, -4146.13, 715.934, 2.60054, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+202, 16386, 1, 7703.4, -3912.95, 708.642, 2.60054, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+203, 16386, 1, 6752.62, -3553.76, 729.794, 2.60054, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+204, 16386, 1, 6713.44, -3379.66, 720.502, 0.767945, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+205, 16386, 1, 6596.59, -3462.38, 716.452, 3.52556, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+206, 16386, 1, 6237.09, -4843.21, 780.975, 0.925025, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+207, 16386, 1, 6107.43, -4999.62, 794.913, 3.9968, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+208, 16386, 1, 6103.93, -4813.46, 792.546, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+209, 16398, 1, 7815.69, -3978.53, 754.773, 0.733038, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+210, 16398, 1, 7777.75, -4086.5, 749.041, 5.11381, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+211, 16398, 1, 7722.3, -3953.9, 734.255, 4.10152, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+212, 16398, 1, 6701.14, -3500.28, 757.474, 5.11381, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+213, 16398, 1, 6677.47, -3414.77, 760.265, 4.10152, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+214, 16398, 1, 6615.65, -3459.45, 738.292, 3.50811, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+215, 16398, 1, 6213.64, -4873.82, 792.298, 0.925025, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+216, 16398, 1, 6156.84, -4878.55, 798.983, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+217, 16398, 1, 6145.26, -4957.15, 800.845, 3.97935, 120, 120, 0, 0, 9),
    -- (@WINTERSPRING_GUID+218, 16995, 1, 7736.56, -4033.75, 696.327, 5.51524, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+219, 16356, 1, 7641.33, -3886.13, 685.196, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+220, 16356, 1, 7646.42, -3869.21, 684.996, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+221, 16356, 1, 7649.19, -3855.19, 685.153, 1.37881, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+222, 16356, 1, 7656.79, -3884.09, 685.892, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+223, 16356, 1, 7662.29, -3869.07, 685.412, 2.23402, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+224, 16356, 1, 7664.56, -3850.75, 686.131, 5.49779, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+225, 16356, 1, 7677.6, -3841.15, 687.133, 2.80997, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+226, 16356, 1, 7711.92, -3840.43, 700.432, 4.06663, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+227, 16356, 1, 7723.1, -3902.68, 691.732, 3.03684, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+228, 16356, 1, 7669.45, -3886.25, 686.572, 2.00713, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+229, 16401, 1, 6184.28, -4913.32, 807.76, 6.0912, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+230, 16401, 1, 6646.69, -3442.36, 793, 4.86947, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+231, 16401, 1, 7755.75, -4030.91, 786.58, 0.471238, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+232, 16421, 1, 6184.28, -4913.32, 807.76, 6.0912, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+233, 16421, 1, 6646.69, -3442.36, 793, 4.86947, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+234, 16421, 1, 7755.75, -4030.91, 786.58, 0.471238, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+235, 16356, 1, 6244, -4779.69, 751.865, 5.81195, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+236, 16356, 1, 6074.43, -4722.75, 756.323, 1.09956, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+237, 16356, 1, 6248.46, -4755.08, 752.166, 4.46804, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+238, 16356, 1, 6734.2, -3572.91, 704.114, 4.06663, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+239, 16356, 1, 6743.76, -3605.07, 718.871, 4.03172, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+240, 16356, 1, 6745.98, -3560.78, 700.922, 4.04917, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+241, 16356, 1, 6756.25, -3610.65, 717.194, 1.88495, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+242, 16356, 1, 6772.13, -3621.32, 721.724, 0.506145, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+243, 16356, 1, 6817.91, -3615.72, 729.997, 3.26377, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+244, 16356, 1, 6819.23, -3570.4, 727.156, 0.226893, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+245, 16356, 1, 7694.82, -3881.97, 688.048, 5.20109, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+246, 16356, 1, 7708.42, -3907.95, 691.825, 6.24828, 120, 120, 0, 0, 9),
    (@WINTERSPRING_GUID+247, 16356, 1, 7720.34, -3881.16, 690.539, 1.85005, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @WINTERSPRING_EVENT FROM `creature` WHERE creature.guid BETWEEN @WINTERSPRING_GUID+1 AND @WINTERSPRING_GUID+247;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@TANARIS_GUID+1, 181136, 1, -8833.58, -2600.38, 21.7275, 3.17653, 0, 0, -0.999847, 0.0174693, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+2, 181136, 1, -7246.02, -3543.61, 13.5918, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+3, 181136, 1, -7328.86, -3970.19, 11.0381, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+4, 181136, 1, -7632.01, -3732.97, 20.6804, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+5, 181136, 1, -8169.93, -3803.55, 14.9479, 5.02655, 0, 0, -0.587785, 0.809017, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+6, 181136, 1, -8333.86, -4203.15, 12.3244, 5.02655, 0, 0, -0.587785, 0.809017, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+7, 181136, 1, -8476.23, -3826, 16.5777, 5.02655, 0, 0, -0.587785, 0.809017, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+8, 181136, 1, -8533.49, -2699.71, 21.2257, 3.17653, 0, 0, -0.999847, 0.0174693, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+9, 181136, 1, -8534.21, -2298.88, 28.635, 2.30383, 0, 0, 0.913545, 0.406738, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+10, 181173, 1, -7625.02, -3746.56, 19.273, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+11, 181173, 1, -7644.12, -3721.98, 22.1893, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+12, 181173, 1, -7647.7, -3742.95, 24.0148, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+13, 181173, 1, -8149.44, -3786.35, 12.6009, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+14, 181173, 1, -8149.45, -3812.64, 14.9879, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+15, 181173, 1, -8166.92, -3821.79, 14.3705, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+16, 181173, 1, -8173.21, -3784.46, 15.2138, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+17, 181173, 1, -8185.06, -3803.97, 13.6013, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+18, 181173, 1, -8316.71, -4193.08, 12.0411, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+19, 181173, 1, -7622.63, -3714.87, 18.3393, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+20, 181173, 1, -7613.95, -3732.19, 16.8296, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+21, 181173, 1, -7344.87, -3969.87, 9.37224, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+22, 181173, 1, -7225.1, -3539.17, 12.273, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+23, 181173, 1, -7229.49, -3562.56, 13.1128, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+24, 181173, 1, -7249.38, -3523.43, 12.6714, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+25, 181173, 1, -7252.48, -3563.27, 11.2089, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+26, 181173, 1, -7264.03, -3547.05, 11.4845, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+27, 181173, 1, -7315.42, -3965.14, 9.92329, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+28, 181173, 1, -7319.15, -3982.26, 12.0744, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+29, 181173, 1, -7334.18, -3985.1, 11.2661, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+30, 181173, 1, -7334.5, -3955.59, 9.67339, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+31, 181173, 1, -8319.12, -4214.37, 11.0459, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+32, 181173, 1, -8338.94, -4184.19, 12.7285, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+33, 181173, 1, -8340.59, -4217.98, 13.6852, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+34, 181173, 1, -8542.56, -2666.96, 27.2642, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+35, 181173, 1, -8546.62, -2280.9, 26.0423, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+36, 181173, 1, -8554.67, -2309.78, 27.2581, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+37, 181173, 1, -8558.21, -2700.35, 18.5581, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+38, 181173, 1, -8815.68, -2598.3, 19.8857, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+39, 181173, 1, -8833.35, -2582.71, 18.6093, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+40, 181173, 1, -8833.52, -2616.1, 23.621, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+41, 181173, 1, -8851.25, -2594.26, 20.4284, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+42, 181173, 1, -8851.98, -2613.53, 21.5255, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+43, 181173, 1, -8538.61, -2733.37, 16.2711, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+44, 181173, 1, -8533.27, -2320.92, 31.0943, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+45, 181173, 1, -8523.53, -2280.98, 27.4485, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+46, 181173, 1, -8351.69, -4199.87, 11.3947, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+47, 181173, 1, -8441.58, -3821.71, 11.9222, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+48, 181173, 1, -8454.52, -3852.54, 14.0437, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+49, 181173, 1, -8468.24, -3795.84, 10.7968, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+50, 181173, 1, -8491.68, -3848.15, 23.1257, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+51, 181173, 1, -8497.19, -3813.2, 22.0456, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+52, 181173, 1, -8506.62, -2712.38, 22.2848, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+53, 181173, 1, -8507.15, -2679.72, 29.649, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+54, 181173, 1, -8513.17, -2304.23, 30.8188, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+55, 181174, 1, -7625.02, -3746.56, 19.273, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+56, 181174, 1, -7644.12, -3721.98, 22.1893, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+57, 181174, 1, -7647.7, -3742.95, 24.0148, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+58, 181174, 1, -8149.44, -3786.35, 12.6009, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+59, 181174, 1, -8149.45, -3812.64, 14.9879, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+60, 181174, 1, -8166.92, -3821.79, 14.3705, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+61, 181174, 1, -8173.21, -3784.46, 15.2138, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+62, 181174, 1, -8185.06, -3803.97, 13.6013, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+63, 181174, 1, -8316.71, -4193.08, 12.0411, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+64, 181174, 1, -8319.12, -4214.37, 11.0459, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+65, 181174, 1, -7622.63, -3714.87, 18.3393, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+66, 181174, 1, -7613.95, -3732.19, 16.8296, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+67, 181174, 1, -7229.49, -3562.56, 13.1128, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+68, 181174, 1, -7249.38, -3523.43, 12.6714, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+69, 181174, 1, -7252.48, -3563.27, 11.2089, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+70, 181174, 1, -7264.03, -3547.05, 11.4845, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+71, 181174, 1, -7315.42, -3965.14, 9.92329, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+72, 181174, 1, -7319.15, -3982.26, 12.0744, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+73, 181174, 1, -7334.18, -3985.1, 11.2661, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+74, 181174, 1, -7334.5, -3955.59, 9.67339, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+75, 181174, 1, -7344.87, -3969.87, 9.37224, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+76, 181174, 1, -7225.1, -3539.17, 12.273, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+77, 181174, 1, -8338.94, -4184.19, 12.7285, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+78, 181174, 1, -8340.59, -4217.98, 13.6852, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+79, 181174, 1, -8542.56, -2666.96, 27.2642, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+80, 181174, 1, -8546.62, -2280.9, 26.0423, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+81, 181174, 1, -8554.67, -2309.78, 27.2581, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+82, 181174, 1, -8558.21, -2700.35, 18.5581, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+83, 181174, 1, -8815.68, -2598.3, 19.8857, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+84, 181174, 1, -8833.35, -2582.71, 18.6093, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+85, 181174, 1, -8833.52, -2616.1, 23.621, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+86, 181174, 1, -8851.25, -2594.26, 20.4284, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+87, 181174, 1, -8851.98, -2613.53, 21.5255, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+88, 181174, 1, -8538.61, -2733.37, 16.2711, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+89, 181174, 1, -8533.27, -2320.92, 31.0943, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+90, 181174, 1, -8523.53, -2280.98, 27.4485, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+91, 181174, 1, -8351.69, -4199.87, 11.3947, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+92, 181174, 1, -8441.58, -3821.71, 11.9222, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+93, 181174, 1, -8454.52, -3852.54, 14.0437, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+94, 181174, 1, -8468.24, -3795.84, 10.7968, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+95, 181174, 1, -8491.68, -3848.15, 23.1257, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+96, 181174, 1, -8497.19, -3813.2, 22.0456, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+97, 181174, 1, -8506.62, -2712.38, 22.2848, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+98, 181174, 1, -8507.15, -2679.72, 29.649, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+99, 181174, 1, -8513.17, -2304.23, 30.8188, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+100, 181191, 1, -8515.71, -2708.45, 22.0036, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+101, 181191, 1, -8520.69, -2720.47, 20.086, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+102, 181191, 1, -7627.38, -3723.27, 18.5083, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+103, 181191, 1, -8530.33, -2324.33, 31.8888, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+104, 181191, 1, -7619.05, -3718.65, 17.9488, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+105, 181191, 1, -7349.37, -3974.53, 9.24155, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+106, 181191, 1, -8543.66, -2275.98, 26.0279, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+107, 181191, 1, -8544.29, -2275.54, 25.9921, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+108, 181191, 1, -8552.64, -2714.94, 17.81, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+109, 181191, 1, -7313.57, -3968.96, 9.94525, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+110, 181191, 1, -8559.86, -2310.24, 26.8044, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+111, 181191, 1, -7644.84, -3725.11, 22.8912, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+112, 181191, 1, -7647.65, -3736.53, 24.4548, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+113, 181191, 1, -8295.47, -4194.36, 9.037, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+114, 181191, 1, -8315.76, -4222.67, 10.576, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+115, 181191, 1, -8326.11, -4168.15, 12.292, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+116, 181191, 1, -8330.96, -4231.78, 12.6973, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+117, 181191, 1, -8168.28, -3828.42, 13.3761, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+118, 181191, 1, -8353.97, -4180.1, 12.751, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+119, 181191, 1, -8360.75, -4219.06, 12.7648, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+120, 181191, 1, -8442.69, -3833.79, 12.2917, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+121, 181191, 1, -8459.11, -3837.16, 13.0731, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+122, 181191, 1, -8467.4, -3860.53, 17.3443, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+123, 181191, 1, -8293.62, -4193.97, 8.87366, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+124, 181191, 1, -7226.8, -3556.18, 13.1967, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+125, 181191, 1, -8835.51, -2579.87, 18.2914, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+126, 181191, 1, -7261.54, -3533.83, 13.0357, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+127, 181191, 1, -8841.23, -2614.51, 22.8541, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+128, 181191, 1, -8825.62, -2584.85, 18.1544, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+129, 181191, 1, -8848.11, -2587.75, 20.037, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+130, 181191, 1, -7276.38, -3541.23, 10.5185, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+131, 181191, 1, -8848.14, -2586.65, 19.9328, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+132, 181191, 1, -8820.26, -2613.15, 23.3564, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+133, 181191, 1, -7227.96, -3556.45, 13.2431, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+134, 181191, 1, -8565.92, -2708.38, 17.7712, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+135, 181191, 1, -8517.46, -2298.79, 29.9655, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+136, 181191, 1, -7231.64, -3530.56, 12.1301, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+137, 181192, 1, -8142.92, -3805.71, 13.4032, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+138, 181192, 1, -8472.31, -3808.9, 13.1103, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+139, 181192, 1, -7220.76, -3541.66, 11.9943, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+140, 181192, 1, -7645.66, -3724.43, 22.9962, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+141, 181192, 1, -7641.05, -3745.16, 22.8822, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+142, 181192, 1, -7640.63, -3744.2, 22.873, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+143, 181192, 1, -8492.48, -3824.91, 22.1804, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+144, 181192, 1, -8154.78, -3788.68, 13.1254, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+145, 181192, 1, -8313.8, -4205.24, 10.8326, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+146, 181192, 1, -8449.55, -3851.52, 13.5815, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+147, 181192, 1, -7251.92, -3518.77, 12.2586, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+148, 181192, 1, -8340.27, -4223.53, 13.5409, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+149, 181192, 1, -8326.34, -4167.37, 12.2286, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+150, 181192, 1, -8347.8, -4198.86, 11.6864, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+151, 181192, 1, -8190.24, -3791.99, 15.0187, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+152, 181192, 1, -8185.36, -3824.41, 10.7623, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+153, 181192, 1, -8164.15, -3795.79, 14.647, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+154, 181192, 1, -8162.89, -3796.32, 14.5938, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+155, 181192, 1, -8157.61, -3811.4, 15.3045, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+156, 181192, 1, -8492.51, -3840.79, 22.9963, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+157, 181192, 1, -8498.64, -2699.57, 25.9792, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+158, 181192, 1, -7621.97, -3745.74, 18.5694, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+159, 181192, 1, -7274.9, -3540.86, 10.76, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+160, 181192, 1, -7344.34, -3960.82, 9.07886, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+161, 181192, 1, -7339.83, -3979.17, 10.5015, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+162, 181192, 1, -7312.35, -3956.01, 10.4644, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+163, 181192, 1, -8544.66, -2297.59, 27.403, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+164, 181192, 1, -7328.62, -3983.62, 12.278, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+165, 181192, 1, -8548.03, -2675.35, 24.4387, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+166, 181192, 1, -7327.03, -3953.43, 10.0576, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+167, 181192, 1, -7320.23, -3979.14, 11.9099, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+168, 181192, 1, -8559.94, -2295.46, 25.5611, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+169, 181192, 1, -7622.35, -3744.29, 18.7069, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+170, 181192, 1, -8521.08, -2670.82, 29.0275, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+171, 181192, 1, -8521.03, -2312.31, 31.563, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+172, 181192, 1, -8515, -2693.34, 25.3124, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+173, 181192, 1, -8516.76, -2299.98, 30.151, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+174, 181192, 1, -8561.86, -2683.07, 20.4009, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+175, 181192, 1, -8518.84, -2733.52, 18.2613, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+176, 181192, 1, -8831.08, -2607.69, 22.7675, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+177, 181193, 1, -7610.96, -3734.53, 16.3485, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+178, 181193, 1, -7631.79, -3712.03, 19.1096, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+179, 181193, 1, -8153.53, -3822.95, 15.6909, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+180, 181193, 1, -8186.86, -3808.95, 12.5813, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+181, 181193, 1, -7326.09, -3954.75, 9.94265, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+182, 181193, 1, -8186.66, -3823.61, 10.6459, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+183, 181193, 1, -7262.65, -3533.37, 12.9806, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+184, 181193, 1, -7327.16, -3984.27, 12.3565, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+185, 181193, 1, -7631.23, -3748.74, 20.4292, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+186, 181193, 1, -7267.94, -3558.7, 9.20586, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+187, 181193, 1, -7339.14, -3993.28, 10.3943, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+188, 181193, 1, -7257.36, -3567.66, 9.99947, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+189, 181193, 1, -8142.86, -3805.25, 13.3441, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+190, 181193, 1, -7256.96, -3565.91, 10.2495, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+191, 181193, 1, -7258.46, -3566.65, 9.95873, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+192, 181193, 1, -8164.58, -3779.35, 13.619, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+193, 181193, 1, -7245.07, -3571.42, 11.1106, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+194, 181193, 1, -7341.67, -3950.58, 10.3941, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+195, 181193, 1, -8835.25, -2580.45, 18.3708, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+196, 181193, 1, -8855.68, -2612.29, 20.9845, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+197, 181193, 1, -8552.24, -2715.69, 17.7591, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+198, 181193, 1, -8491.93, -3823.43, 21.9661, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+199, 181193, 1, -8513.5, -2693.82, 25.418, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+200, 181193, 1, -8516.58, -2299.49, 30.091, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+201, 181193, 1, -8521.94, -2719.63, 19.9967, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+202, 181193, 1, -8559.66, -2311.28, 26.9071, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+203, 181193, 1, -8522.8, -2672.39, 28.4981, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+204, 181193, 1, -8529.68, -2279.74, 26.9854, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+205, 181193, 1, -8531.49, -2324.18, 31.6934, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+206, 181193, 1, -8547.42, -2676.08, 24.3664, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+207, 181193, 1, -8532.27, -2685.06, 24.7199, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+208, 181193, 1, -8538.38, -2707.68, 19.3151, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+209, 181193, 1, -8539.82, -2708.15, 19.1234, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+210, 181193, 1, -8473.6, -3808.87, 13.5766, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+211, 181193, 1, -8839.9, -2590.59, 20.3447, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+212, 181193, 1, -8190.53, -3791.35, 15.0982, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+213, 181193, 1, -8307.8, -4177.41, 10.6385, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+214, 181193, 1, -8330.78, -4230.26, 12.7909, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+215, 181193, 1, -8347.73, -4200.1, 11.7734, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+216, 181193, 1, -8545.43, -2296.88, 27.2682, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+217, 181193, 1, -8853.76, -2599.58, 20.5476, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+218, 181193, 1, -8472.53, -3809.85, 13.3288, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+219, 181193, 1, -8840.52, -2615.04, 22.9578, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+220, 181193, 1, -8847.73, -2586.65, 19.9377, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+221, 181194, 1, -8855.06, -2613.22, 21.104, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+222, 181194, 1, -8178.06, -3786.61, 15.7069, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+223, 181194, 1, -8821.63, -2613.11, 23.407, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+224, 181194, 1, -8825.61, -2592.94, 19.9679, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+225, 181194, 1, -8551.15, -2317.67, 28.2411, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+226, 181194, 1, -7327.44, -3954.89, 9.90071, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+227, 181194, 1, -8552.41, -2283.76, 25.6822, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+228, 181194, 1, -7221.92, -3543.15, 12.2587, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+229, 181194, 1, -8559.13, -2310.88, 26.9176, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+230, 181194, 1, -8815.01, -2593.01, 18.4082, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+231, 181194, 1, -7231.16, -3531.78, 12.2061, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+232, 181194, 1, -7238.64, -3550.66, 13.5652, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+233, 181194, 1, -7243.45, -3571.51, 11.2861, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+234, 181194, 1, -7312.98, -3967.9, 9.9058, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+235, 181194, 1, -8825.25, -2593.34, 20.0255, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+236, 181194, 1, -7319.34, -3979.53, 11.8133, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+237, 181194, 1, -7327.71, -3983.61, 12.3456, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+238, 181194, 1, -7338.49, -3993.56, 10.4255, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+239, 181194, 1, -8140.04, -3818.99, 14.6955, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+240, 181194, 1, -8142.68, -3794.19, 12.3602, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+241, 181194, 1, -8152.87, -3822.27, 15.711, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+242, 181194, 1, -8459.59, -3835.74, 12.9851, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+243, 181194, 1, -8456.02, -3812.77, 10.9128, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+244, 181194, 1, -8445.57, -3821.65, 11.7236, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+245, 181194, 1, -8443.05, -3835.11, 12.3717, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+246, 181194, 1, -8362.51, -4219.57, 12.9193, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+247, 181194, 1, -8348.64, -4199.97, 11.6817, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+248, 181194, 1, -8322.27, -4187.97, 12.7111, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+249, 181194, 1, -7646.29, -3711.4, 21.3581, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+250, 181194, 1, -8477.85, -3845.78, 19.6327, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+251, 181194, 1, -7339.7, -3980.84, 10.4953, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+252, 181194, 1, -8467.81, -3859.59, 17.4158, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+253, 181194, 1, -8537.66, -2314.78, 29.8219, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+254, 181194, 1, -7611.75, -3734.01, 16.4665, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+255, 181194, 1, -7617.77, -3720.18, 17.7926, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+256, 181194, 1, -7623.2, -3732.59, 18.284, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+257, 181194, 1, -7628.35, -3722.85, 18.6309, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+258, 181194, 1, -8487.15, -3797.78, 16.1267, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+259, 181194, 1, -8486.24, -3849.88, 22.2001, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+260, 181194, 1, -7645.56, -3725.55, 23.1402, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+261, 181194, 1, -8314.28, -4204.59, 10.916, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+262, 181215, 1, -7399.95, -3733.06, 61.0504, 5.81195, 0, 0, -0.233445, 0.97237, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+263, 181215, 1, -8633.21, -2499.82, 114.017, 2.82743, 0, 0, 0.987688, 0.156436, 100, 1, 120, 120, 9),
    (@TANARIS_GUID+264, 181215, 1, -8333.68, -3966.4, 77.8483, 1.37881, 0, 0, 0.636078, 0.771625, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @TANARIS_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @TANARIS_GUID+1 AND @TANARIS_GUID+264;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@TANARIS_GUID+1, 16356, 1, -7613.69, -3766.51, 14.5989, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+2, 16356, 1, -7653.08, -3726.19, 25.1272, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+3, 16356, 1, -7655.67, -3714.27, 24.4955, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+4, 16356, 1, -7659.07, -3736.71, 25.7794, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+5, 16356, 1, -7661.95, -3727.53, 26.8725, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+6, 16356, 1, -8123.68, -3817.04, 12.3483, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+7, 16356, 1, -8132.48, -3789.38, 12.4753, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+8, 16356, 1, -8133.4, -3803.21, 12.2422, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+9, 16356, 1, -8138.02, -3827.97, 15.4933, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+10, 16356, 1, -8143.17, -3775.31, 12.8539, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+11, 16356, 1, -8143.77, -3815.97, 14.8309, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+12, 16356, 1, -8146.28, -3789.86, 12.565, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+13, 16356, 1, -8150.57, -3803.01, 14.1501, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+14, 16356, 1, -8150.95, -3838.64, 15.2399, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+15, 16356, 1, -7650.74, -3757.32, 21.7677, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+16, 16356, 1, -7649.6, -3746.09, 23.8511, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+17, 16356, 1, -7648.75, -3736.26, 24.7103, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+18, 16356, 1, -7614.92, -3753.19, 16.2557, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+19, 16356, 1, -7618.54, -3742.16, 17.8402, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+20, 16356, 1, -7620.14, -3708.12, 18.9941, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+21, 16356, 1, -7622.82, -3722.15, 18.0316, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+22, 16356, 1, -7627.59, -3763.22, 17.7038, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+23, 16356, 1, -7628.52, -3751.79, 19.5663, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+24, 16356, 1, -7633.44, -3698.23, 20.7083, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+25, 16356, 1, -7634.08, -3713.65, 19.354, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+26, 16356, 1, -7639.1, -3743.79, 22.6832, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+27, 16356, 1, -7639.91, -3753.53, 21.4733, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+28, 16356, 1, -7643.15, -3726.38, 22.7255, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+29, 16356, 1, -7645.2, -3712.39, 21.2355, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+30, 16356, 1, -7646.51, -3698.16, 21.8852, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+31, 16356, 1, -8153.07, -3825.89, 15.7912, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+32, 16356, 1, -8156.69, -3765.66, 13.2382, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+33, 16356, 1, -8157.87, -3779.69, 12.999, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+34, 16356, 1, -8290.03, -4207.55, 8.68307, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+35, 16356, 1, -8294.54, -4177.96, 8.66661, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+36, 16356, 1, -8299.23, -4196.12, 9.59805, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+37, 16356, 1, -8304.14, -4227.69, 8.9611, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+38, 16356, 1, -8306.88, -4210.41, 9.92429, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+39, 16356, 1, -8309.51, -4162.99, 10.0566, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+40, 16356, 1, -8312.53, -4185.8, 11.8573, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+41, 16356, 1, -8313.99, -4199.83, 11.3477, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+42, 16356, 1, -8317.97, -4225.9, 11.1311, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+43, 16356, 1, -8321.77, -4211.24, 11.495, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+44, 16356, 1, -8322.67, -4151.78, 10.2642, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+45, 16356, 1, -8324.41, -4177.46, 12.9567, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+46, 16356, 1, -8326.1, -4190.56, 12.6192, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+47, 16356, 1, -8202.46, -3804.13, 10.8938, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+48, 16356, 1, -8195.46, -3781.23, 16.1365, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+49, 16356, 1, -8192.93, -3832.2, 9.10186, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+50, 16356, 1, -8157.91, -3812.96, 15.47, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+51, 16356, 1, -8160.06, -3793.21, 14.1458, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+52, 16356, 1, -8164.48, -3840.64, 12.4232, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+53, 16356, 1, -8165.72, -3823.48, 14.4758, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+54, 16356, 1, -8170.4, -3769.46, 14.0081, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+55, 16356, 1, -8171.13, -3783.95, 14.9894, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+56, 16356, 1, -8176.62, -3816.16, 13.4556, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+57, 16356, 1, -8178.19, -3829.83, 11.3705, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+58, 16356, 1, -8179.1, -3794.72, 15.3744, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+59, 16356, 1, -8183.67, -3783.81, 16.3321, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+60, 16356, 1, -8186.83, -3807.78, 12.8409, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+61, 16356, 1, -8189.24, -3820.07, 10.7394, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+62, 16356, 1, -8191.13, -3792.8, 14.827, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+63, 16356, 1, -8330.82, -4240.35, 12.4493, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+64, 16356, 1, -7218.94, -3544.25, 12.0636, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+65, 16356, 1, -7256.64, -3513.72, 11.9059, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+66, 16356, 1, -7258.44, -3562.49, 10.4937, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+67, 16356, 1, -7259.76, -3575.32, 9.33801, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+68, 16356, 1, -7260.92, -3543.11, 12.5748, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+69, 16356, 1, -7263.98, -3533.87, 12.9191, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+70, 16356, 1, -7265, -3523.32, 12.9154, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+71, 16356, 1, -7266.57, -3554.31, 10.0326, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+72, 16356, 1, -7268.31, -3567.27, 8.98188, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+73, 16356, 1, -7272.66, -3543.49, 10.7438, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+74, 16356, 1, -7275.22, -3531.92, 11.8755, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+75, 16356, 1, -7277.21, -3552.66, 8.59923, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+76, 16356, 1, -7299.75, -3971.29, 10.1425, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+77, 16356, 1, -7306.82, -3949.61, 11.5471, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+78, 16356, 1, -7256.06, -3524.96, 13.0664, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+79, 16356, 1, -7255.17, -3535.15, 13.4109, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+80, 16356, 1, -7254.99, -3551.95, 12.341, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+81, 16356, 1, -7226.05, -3532.65, 11.8293, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+82, 16356, 1, -7226.6, -3565.82, 13.0601, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+83, 16356, 1, -7227.98, -3553.69, 13.3394, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+84, 16356, 1, -7231.06, -3542.7, 13.2445, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+85, 16356, 1, -7234.28, -3523.69, 11.7133, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+86, 16356, 1, -7236.96, -3534.54, 13.0861, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+87, 16356, 1, -7238.6, -3551.89, 13.6019, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+88, 16356, 1, -7238.77, -3562.69, 12.8448, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+89, 16356, 1, -7239.63, -3575.09, 11.3355, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+90, 16356, 1, -7244.28, -3515.06, 11.3882, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+91, 16356, 1, -7246.26, -3528.72, 13.1347, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+92, 16356, 1, -7248.59, -3560.16, 12.1926, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+93, 16356, 1, -7251.03, -3573.52, 10.2201, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+94, 16356, 1, -7308.69, -3959.18, 10.5048, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+95, 16356, 1, -7308.94, -3980.61, 10.3655, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+96, 16356, 1, -7311.69, -3968.46, 9.96437, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+97, 16356, 1, -7346.61, -3957.99, 9.51486, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+98, 16356, 1, -7347.73, -3978.61, 9.64909, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+99, 16356, 1, -7348.71, -3948.03, 11.5307, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+100, 16356, 1, -7349.55, -3989.31, 10.3145, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+101, 16356, 1, -7354.07, -3968.47, 9.26089, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+102, 16356, 1, -7356.55, -3958.05, 10.2371, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+103, 16356, 1, -7356.58, -3978.46, 9.93594, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+104, 16356, 1, -7588.72, -3744.07, 12.7845, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+105, 16356, 1, -7592.56, -3732.58, 14.9795, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+106, 16356, 1, -7599.78, -3755.23, 12.4615, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+107, 16356, 1, -7603.88, -3743.44, 14.7937, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+108, 16356, 1, -7606.45, -3707.07, 17.96, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+109, 16356, 1, -7607.49, -3719.28, 17.4744, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+110, 16356, 1, -7343.19, -3968.54, 9.55852, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+111, 16356, 1, -7341.13, -3938.26, 12.6796, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+112, 16356, 1, -7339.9, -3949.15, 10.7003, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+113, 16356, 1, -7317.51, -3948.85, 11.0682, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+114, 16356, 1, -7318.98, -3959.46, 10.0326, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+115, 16356, 1, -7319.24, -3938.45, 12.1927, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+116, 16356, 1, -7319.5, -3989.14, 12.536, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+117, 16356, 1, -7319.64, -3977.81, 11.7139, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+118, 16356, 1, -7327.48, -3999.14, 11.5049, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+119, 16356, 1, -7328.43, -3987.73, 12.0351, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+120, 16356, 1, -7328.98, -3952.59, 10.2225, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+121, 16356, 1, -7330.96, -3940.37, 12.3137, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+122, 16356, 1, -7336.37, -3979.78, 11.1886, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+123, 16356, 1, -7337.17, -3960.35, 9.55714, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+124, 16356, 1, -7337.82, -3989.84, 10.5515, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+125, 16356, 1, -7338.79, -4001.61, 11.0869, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+126, 16356, 1, -7609.51, -3731.71, 16.5359, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+127, 16356, 1, -8526.18, -2323.52, 32.4688, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+128, 16356, 1, -8546.58, -2300.08, 27.483, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+129, 16356, 1, -8546.71, -2287.25, 26.5024, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+130, 16356, 1, -8550.62, -2674.02, 24.4004, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+131, 16356, 1, -8551.27, -2696.9, 19.5145, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+132, 16356, 1, -8553.1, -2325.86, 28.7335, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+133, 16356, 1, -8554.31, -2270.46, 25.5822, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+134, 16356, 1, -8554.6, -2711.14, 18.1204, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+135, 16356, 1, -8554.92, -2294.24, 26.1406, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+136, 16356, 1, -8556.13, -2725.65, 16.8157, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+137, 16356, 1, -8556.26, -2309.37, 27.1497, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+138, 16356, 1, -8557.07, -2280.72, 25.1838, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+139, 16356, 1, -8560.55, -2681.99, 20.8305, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+140, 16356, 1, -8567.42, -2321.62, 27.4631, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+141, 16356, 1, -8545.69, -2313.16, 28.6384, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+142, 16356, 1, -8544.33, -2259.92, 26.6284, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+143, 16356, 1, -8543.9, -2274.42, 26.0788, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+144, 16356, 1, -8530.54, -2734.3, 16.4976, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+145, 16356, 1, -8530.84, -2267.82, 26.2574, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+146, 16356, 1, -8531.11, -2716.61, 19.1148, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+147, 16356, 1, -8532.56, -2335.88, 32.7435, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+148, 16356, 1, -8533.4, -2311.17, 30.1374, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+149, 16356, 1, -8535.79, -2661.39, 29.0533, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+150, 16356, 1, -8536, -2284.88, 27.1547, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+151, 16356, 1, -8536.47, -2680.38, 25.2552, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+152, 16356, 1, -8538.17, -2323.67, 30.6695, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+153, 16356, 1, -8540.64, -2708.69, 19.0619, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+154, 16356, 1, -8543.02, -2741.27, 15.7143, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+155, 16356, 1, -8543.18, -2688.59, 22.2679, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+156, 16356, 1, -8543.75, -2723.52, 17.3032, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+157, 16356, 1, -8567.95, -2291.9, 24.4589, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+158, 16356, 1, -8568.37, -2695.87, 18.6941, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+159, 16356, 1, -8568.39, -2710.22, 17.4404, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+160, 16356, 1, -8843.74, -2589.91, 20.3794, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+161, 16356, 1, -8844.4, -2576.94, 18.7649, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+162, 16356, 1, -8844.52, -2638.38, 23.0135, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+163, 16356, 1, -8847.34, -2563.92, 17.0464, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+164, 16356, 1, -8849.52, -2601.38, 21.1683, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+165, 16356, 1, -8852.79, -2614.9, 21.5556, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+166, 16356, 1, -8854.67, -2627.79, 21.6025, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+167, 16356, 1, -8855.31, -2589.61, 19.9539, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+168, 16356, 1, -8858.14, -2576.11, 19.1797, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+169, 16356, 1, -8860.52, -2601.38, 19.9517, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+170, 16356, 1, -8866.35, -2591.27, 18.9667, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+171, 16356, 1, -8866.47, -2614.57, 19.8519, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+172, 16356, 1, -8866.94, -2627.48, 20.5245, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+173, 16356, 1, -8843.16, -2624.59, 23.1432, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+174, 16356, 1, -8842.16, -2611.2, 22.6175, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+175, 16356, 1, -8833.58, -2619.84, 24.0012, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+176, 16356, 1, -8569.21, -2307.8, 26.149, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+177, 16356, 1, -8570.12, -2280.41, 23.9053, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+178, 16356, 1, -8796.55, -2601.58, 16.4604, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+179, 16356, 1, -8803.88, -2588.05, 14.9465, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+180, 16356, 1, -8809.92, -2613.55, 22.483, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+181, 16356, 1, -8813.18, -2600.65, 20.0722, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+182, 16356, 1, -8817.13, -2574.37, 14.2864, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+183, 16356, 1, -8821.94, -2588.89, 18.6781, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+184, 16356, 1, -8821.97, -2612.31, 23.3849, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+185, 16356, 1, -8822.62, -2624.8, 24.9219, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+186, 16356, 1, -8831.92, -2562.77, 14.4384, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+187, 16356, 1, -8833.24, -2580.29, 18.1988, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+188, 16356, 1, -8833.29, -2633.88, 24.6284, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+189, 16356, 1, -8875.47, -2605.15, 18.6127, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+190, 16356, 1, -8331.53, -4222.94, 13.4123, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+191, 16356, 1, -8440.73, -3850.02, 13.0488, 2.80997, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+192, 16356, 1, -8447.66, -3833.82, 12.3459, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+193, 16356, 1, -8450.82, -3861.77, 14.0416, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+194, 16356, 1, -8453.66, -3796.16, 10.6514, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+195, 16356, 1, -8454.86, -3809.41, 10.7524, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+196, 16356, 1, -8455.49, -3821.52, 11.621, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+197, 16356, 1, -8458.14, -3846.84, 14.1027, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+198, 16356, 1, -8463.16, -3833.24, 13.3817, 5.63741, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+199, 16356, 1, -8463.29, -3871.34, 16.7454, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+200, 16356, 1, -8468.25, -3784.74, 10.6056, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+201, 16356, 1, -8468.27, -3812.58, 12.6366, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+202, 16356, 1, -8468.51, -3799.28, 11.0332, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+203, 16356, 1, -8470.19, -3854.1, 17.8575, 5.53269, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+204, 16356, 1, -8440.53, -3807.73, 11.7735, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+205, 16356, 1, -8438.92, -3823.27, 12.1672, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+206, 16356, 1, -8431.08, -3834.85, 12.4184, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+207, 16356, 1, -8335.46, -4182.44, 13.014, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+208, 16356, 1, -8337.4, -4166.29, 12.8508, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+209, 16356, 1, -8342.07, -4215.83, 13.6906, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+210, 16356, 1, -8344.86, -4230.75, 13.3013, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+211, 16356, 1, -8345.09, -4195.04, 11.8301, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+212, 16356, 1, -8347.74, -4182.62, 12.731, 1.88495, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+213, 16356, 1, -8351.21, -4168.74, 13.3854, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+214, 16356, 1, -8353, -4208.15, 12.2674, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+215, 16356, 1, -8357.24, -4220.91, 12.8511, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+216, 16356, 1, -8358.85, -4194.83, 10.88, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+217, 16356, 1, -8365.46, -4179.82, 12.2681, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+218, 16356, 1, -8371.76, -4209.64, 12.2172, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+219, 16356, 1, -8372.59, -4222.65, 13.8112, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+220, 16356, 1, -8473.98, -3841.03, 17.8062, 5.20108, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+221, 16356, 1, -8478.91, -3859.43, 20.9495, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+222, 16356, 1, -8524.61, -2690.84, 24.5677, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+223, 16356, 1, -8509.53, -2306.43, 31.1962, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+224, 16356, 1, -8509.53, -3832.18, 23.253, 0.226893, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+225, 16356, 1, -8509.89, -2291.45, 29.0953, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+226, 16356, 1, -8512.32, -2322.18, 33.4144, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+227, 16356, 1, -8514.31, -2701.25, 23.6604, 0.715585, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+228, 16356, 1, -8515.25, -2723.55, 20.5058, 0.506145, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+229, 16356, 1, -8515.51, -2271.21, 26.7178, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+230, 16356, 1, -8516.23, -2736.99, 18.1427, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+231, 16356, 1, -8521.43, -2298.91, 29.8686, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+232, 16356, 1, -8521.69, -2311.75, 31.5211, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+233, 16356, 1, -8521.8, -2675.69, 28.1672, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+234, 16356, 1, -8522.25, -2284.88, 28.0509, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+235, 16356, 1, -8522.76, -2709.36, 21.0987, 1.8675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+236, 16356, 1, -8509.28, -2670.58, 31.3468, 3.14159, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+237, 16356, 1, -8508.45, -2687.16, 27.8193, 5.49779, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+238, 16356, 1, -8503.3, -2714.46, 22.2704, 6.24828, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+239, 16356, 1, -8482.06, -3806.28, 16.3868, 2.00713, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+240, 16356, 1, -8482.11, -3848.27, 21.205, 1.95477, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+241, 16356, 1, -8484.35, -3837.43, 21.0825, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+242, 16356, 1, -8485.91, -3791.77, 14.1813, 1.09956, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+243, 16356, 1, -8487.71, -2715.79, 23.6916, 3.03684, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+244, 16356, 1, -8489.18, -3818.92, 20.8645, 2.23402, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+245, 16356, 1, -8492.32, -2687.27, 29.2567, 4.03171, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+246, 16356, 1, -8492.5, -2702.93, 25.9494, 3.26377, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+247, 16356, 1, -8502.65, -3817.23, 23.0028, 4.46804, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+248, 16356, 1, -8500.43, -2728.77, 21.0354, 4.20625, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+249, 16356, 1, -8497.73, -3829.68, 23.2553, 4.04917, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+250, 16356, 1, -8497.2, -3843.25, 23.6297, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+251, 16356, 1, -8495.78, -3805.49, 20.6777, 1.85005, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+252, 16356, 1, -8495.53, -2299.1, 28.8357, 4.06662, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+253, 16386, 1, -7286.2, -3605.43, 27.6063, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+254, 16386, 1, -7358.42, -3891.88, 28.3298, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+255, 16386, 1, -7567.21, -3732.62, 27.0627, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+256, 16386, 1, -8223.52, -3857.08, 27.0452, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+257, 16386, 1, -8333.31, -4133.65, 22.6421, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+258, 16386, 1, -8433.66, -3865.46, 25.2579, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+259, 16386, 1, -8566.54, -2633.84, 42.1126, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+260, 16386, 1, -8566.67, -2367.05, 49.5516, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+261, 16386, 1, -8767.29, -2566.3, 31.2359, 2.60054, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+262, 16398, 1, -7334.35, -3665.95, 39.8496, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+263, 16398, 1, -7380.73, -3816.19, 35.7702, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+264, 16398, 1, -7484.02, -3732.84, 46.1922, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+265, 16398, 1, -8282.23, -3916.84, 41.9036, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+266, 16398, 1, -8333.9, -4049.92, 37.7556, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+267, 16398, 1, -8387.38, -3912.66, 35.1221, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+268, 16398, 1, -8599.53, -2432.71, 70.9452, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+269, 16398, 1, -8600.12, -2566.9, 64.9577, 4.10152, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+270, 16398, 1, -8700.02, -2533.75, 51.4734, 4.10152, 120, 120, 0, 0, 9),
    -- (@TANARIS_GUID+271, 16995, 1, -8352.68, -3972.68, 10.0753, 2.14675, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+272, 16401, 1, -8633.21, -2499.82, 114.1, 2.82743, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+273, 16401, 1, -8333.68, -3966.4, 77.9316, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+274, 16401, 1, -7399.95, -3733.06, 61.1337, 5.81195, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+275, 16421, 1, -8633.21, -2499.82, 114.1, 2.82743, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+276, 16421, 1, -8333.68, -3966.4, 77.9316, 1.37881, 120, 120, 0, 0, 9),
    (@TANARIS_GUID+277, 16421, 1, -7399.95, -3733.06, 61.1337, 5.81195, 120, 120, 0, 0, 9);
    
INSERT INTO `game_event_creature` SELECT creature.guid, @TANARIS_EVENT FROM `creature` WHERE creature.guid BETWEEN @TANARIS_GUID+1 AND @TANARIS_GUID+277;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@AZSHARA_GUID+1, 181136, 1, 3086.48, -4215.71, 97.6507, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+2, 181136, 1, 3337.51, -4516.62, 97.713, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+3, 181136, 1, 3366.27, -5566.33, 11.1423, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+4, 181136, 1, 3516.26, -4151.81, 106.875, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+5, 181136, 1, 3518.32, -5712.41, 4.82692, 0.244346, 0, 0, 0.121869, 0.992546, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+6, 181136, 1, 3666.47, -5533.42, 20.5987, 4.60767, 0, 0, -0.743144, 0.669132, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+7, 181154, 1, 3544.98, -5610.26, 67.1127, 2.82743, 0, 0, 0.987688, 0.156436, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+8, 181154, 1, 3299.55, -4301.3, 177.808, 5.81195, 0, 0, -0.233445, 0.97237, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+9, 181173, 1, 3494.83, -4134.08, 104.549, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+10, 181173, 1, 3499.85, -5706.13, 4.64753, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+11, 181173, 1, 3505.47, -5728.37, 5.0291, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+12, 181173, 1, 3513.6, -4181.8, 101.187, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+13, 181173, 1, 3522.2, -5691.11, 5.19167, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+14, 181173, 1, 3526.99, -4129.5, 107.352, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+15, 181173, 1, 3532.96, -5729.75, 1.78794, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+16, 181173, 1, 3536.09, -5705.18, 6.73484, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+17, 181173, 1, 3539.52, -4163.67, 106.101, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+18, 181173, 1, 3649.75, -5535.95, 22.1447, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+19, 181173, 1, 3661.16, -5551.96, 17.9784, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+20, 181173, 1, 3663.16, -5517.9, 23.888, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+21, 181173, 1, 3680.94, -5543.86, 17.4121, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+22, 181173, 1, 3682.33, -5524.87, 21.3495, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+23, 181173, 1, 3490.81, -4165.98, 100.503, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+24, 181173, 1, 3386.65, -5576.33, 9.43248, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+25, 181173, 1, 3063.17, -4228.82, 95.5224, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+26, 181173, 1, 3063.44, -4206.71, 95.1969, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+27, 181173, 1, 3089.63, -4194.87, 98.314, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+28, 181173, 1, 3089.73, -4242.71, 97.7909, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+29, 181173, 1, 3109.54, -4220.91, 99.2763, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+30, 181173, 1, 3328.39, -4508.51, 97.6156, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+31, 181173, 1, 3333.68, -4529.75, 98.2623, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+32, 181173, 1, 3339.81, -4501.66, 96.8962, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+33, 181173, 1, 3380.18, -5556.31, 13.0397, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+34, 181173, 1, 3366.75, -5584.61, 8.67064, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+35, 181173, 1, 3352.04, -4514.34, 98.9571, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+36, 181173, 1, 3351.3, -5559, 13.5844, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+37, 181173, 1, 3349.61, -5577.22, 10.1002, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+38, 181173, 1, 3348.73, -4525.94, 98.1148, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+39, 181174, 1, 3526.99, -4129.5, 107.352, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+40, 181174, 1, 3522.2, -5691.11, 5.19167, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+41, 181174, 1, 3513.6, -4181.8, 101.187, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+42, 181174, 1, 3505.47, -5728.37, 5.0291, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+43, 181174, 1, 3499.85, -5706.13, 4.64753, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+44, 181174, 1, 3494.83, -4134.08, 104.549, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+45, 181174, 1, 3532.96, -5729.75, 1.78794, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+46, 181174, 1, 3536.09, -5705.18, 6.73484, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+47, 181174, 1, 3539.52, -4163.67, 106.101, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+48, 181174, 1, 3649.75, -5535.95, 22.1447, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+49, 181174, 1, 3661.16, -5551.96, 17.9784, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+50, 181174, 1, 3663.16, -5517.9, 23.888, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+51, 181174, 1, 3680.94, -5543.86, 17.4121, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+52, 181174, 1, 3682.33, -5524.87, 21.3495, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+53, 181174, 1, 3490.81, -4165.98, 100.503, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+54, 181174, 1, 3386.65, -5576.33, 9.43248, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+55, 181174, 1, 3063.17, -4228.82, 95.5224, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+56, 181174, 1, 3063.44, -4206.71, 95.1969, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+57, 181174, 1, 3089.63, -4194.87, 98.314, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+58, 181174, 1, 3089.73, -4242.71, 97.7909, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+59, 181174, 1, 3109.54, -4220.91, 99.2763, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+60, 181174, 1, 3328.39, -4508.51, 97.6156, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+61, 181174, 1, 3333.68, -4529.75, 98.2623, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+62, 181174, 1, 3339.81, -4501.66, 96.8962, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+63, 181174, 1, 3380.18, -5556.31, 13.0397, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+64, 181174, 1, 3366.75, -5584.61, 8.67064, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+65, 181174, 1, 3352.04, -4514.34, 98.9571, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+66, 181174, 1, 3351.3, -5559, 13.5844, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+67, 181174, 1, 3349.61, -5577.22, 10.1002, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+68, 181174, 1, 3348.73, -4525.94, 98.1148, 0.890117, 0, 0, 0.43051, 0.902586, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+69, 181191, 1, 3341.19, -4531.52, 98.2102, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+70, 181191, 1, 3508.5, -5736.2, 4.35272, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+71, 181191, 1, 3511.88, -4129.86, 104.967, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+72, 181191, 1, 3332.66, -4503.76, 96.8936, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+73, 181191, 1, 3330, -4536.22, 97.9976, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+74, 181191, 1, 3527.61, -4151.38, 107.674, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+75, 181191, 1, 3507.85, -4169.18, 103.104, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+76, 181191, 1, 3505.94, -4150.03, 105.143, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+77, 181191, 1, 3496.41, -5710.4, 5.28776, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+78, 181191, 1, 3343.99, -5558.02, 14.9818, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+79, 181191, 1, 3494.5, -5692.49, 4.33028, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+80, 181191, 1, 3353.99, -4508.56, 98.3366, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+81, 181191, 1, 3354.31, -4508.55, 98.3604, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+82, 181191, 1, 3395.37, -5566.75, 11.567, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+83, 181191, 1, 3388.04, -5552.5, 13.7602, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+84, 181191, 1, 3322.93, -4535.42, 97.9271, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+85, 181191, 1, 3535.08, -4142.74, 107.557, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+86, 181191, 1, 3086.07, -4226.38, 96.6846, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+87, 181191, 1, 3635.89, -5546.44, 20.9121, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+88, 181191, 1, 3098.37, -4214.79, 98.0724, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+89, 181191, 1, 3070.7, -4188.19, 96.9667, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+90, 181191, 1, 3674.12, -5540.77, 18.4339, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+91, 181191, 1, 3075.67, -4219.88, 95.7057, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+92, 181191, 1, 3527.55, -4177.87, 103.897, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+93, 181191, 1, 3072.05, -4189.65, 96.9118, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+94, 181191, 1, 3377.61, -5570.81, 10.431, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+95, 181191, 1, 3634.91, -5522.89, 23.6551, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+96, 181192, 1, 3489.39, -4151.23, 103.572, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+97, 181192, 1, 3395.81, -5587.91, 8.5719, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+98, 181192, 1, 3667.36, -5561.11, 15.9933, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+99, 181192, 1, 3532.85, -4143.78, 107.665, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+100, 181192, 1, 3395.3, -5587, 8.63123, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+101, 181192, 1, 3686.64, -5552.65, 15.6566, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+102, 181192, 1, 3495.12, -5710.59, 5.39667, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+103, 181192, 1, 3653.23, -5547.9, 19.7454, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+104, 181192, 1, 3530.56, -5696.26, 6.54382, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+105, 181192, 1, 3540.89, -5705.92, 6.91671, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+106, 181192, 1, 3520, -4139.49, 107.101, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+107, 181192, 1, 3512.79, -4127.95, 104.821, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+108, 181192, 1, 3544.74, -5714.38, 4.59868, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+109, 181192, 1, 3635.69, -5520.71, 23.9231, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+110, 181192, 1, 3701.38, -5541.03, 18.5767, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+111, 181192, 1, 3636.93, -5522.18, 23.8032, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+112, 181192, 1, 3537.25, -4167.45, 105.964, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+113, 181192, 1, 3063.93, -4216.36, 94.9908, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+114, 181192, 1, 3075.36, -4236.97, 97.2334, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+115, 181192, 1, 3327.3, -4529.78, 98.2545, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+116, 181192, 1, 3076.89, -4235.82, 97.1714, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+117, 181192, 1, 3085.64, -4185.1, 97.9973, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+118, 181192, 1, 3342.89, -4530.83, 98.2008, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+119, 181192, 1, 3103.59, -4194.91, 101.387, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+120, 181192, 1, 3353.43, -5588.57, 9.10668, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+121, 181192, 1, 3062.9, -4217.87, 95.0052, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+122, 181192, 1, 3341.89, -5573.16, 12.1904, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+123, 181192, 1, 3082.1, -4204.67, 97.3073, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+124, 181192, 1, 3101.25, -4243.69, 98.4745, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+125, 181192, 1, 3334.03, -4502.54, 96.8898, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+126, 181192, 1, 3364.04, -5548.14, 15.0761, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+127, 181193, 1, 3329.38, -4528.78, 98.2727, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+128, 181193, 1, 3517.29, -4162.04, 105.765, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+129, 181193, 1, 3666.53, -5560.65, 16.1447, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+130, 181193, 1, 3323.2, -4536.07, 97.8793, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+131, 181193, 1, 3104.79, -4193.94, 101.773, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+132, 181193, 1, 3533.26, -4142.38, 107.664, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+133, 181193, 1, 3102.88, -4243.38, 98.5706, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+134, 181193, 1, 3081.1, -4205.11, 97.0449, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+135, 181193, 1, 3540.06, -5704.46, 7.14416, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+136, 181193, 1, 3541.64, -5705.12, 7.10472, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+137, 181193, 1, 3510.25, -5691.54, 4.28637, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+138, 181193, 1, 3327.6, -4530.95, 98.2269, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+139, 181193, 1, 3378.7, -5570.63, 10.4669, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+140, 181193, 1, 3700.34, -5543.09, 18.0561, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+141, 181193, 1, 3394.31, -5565.42, 11.8053, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+142, 181193, 1, 3394.7, -5567.41, 11.3836, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+143, 181193, 1, 3687.64, -5551.49, 15.8381, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+144, 181193, 1, 3487.37, -4150.98, 104.137, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+145, 181193, 1, 3345.72, -4505.12, 97.3897, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+146, 181193, 1, 3345.55, -4507.08, 97.6514, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+147, 181193, 1, 3495.92, -5708.79, 5.05228, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+148, 181193, 1, 3666.54, -5519.18, 23.2943, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+149, 181193, 1, 3507.59, -5734.8, 4.43492, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+150, 181193, 1, 3342.97, -5574.26, 11.761, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+151, 181193, 1, 3684.8, -5516.67, 23.3081, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+152, 181193, 1, 3344.79, -4532.26, 98.1381, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+153, 181194, 1, 3652.51, -5550.15, 19.4157, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+154, 181194, 1, 3686.57, -5517.49, 23.1737, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+155, 181194, 1, 3075.63, -4235.19, 97.0664, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+156, 181194, 1, 3070.96, -4189.67, 96.8523, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+157, 181194, 1, 3506.33, -4169.63, 102.766, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+158, 181194, 1, 3685.18, -5518.93, 22.8104, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+159, 181194, 1, 3634.7, -5544.98, 20.9806, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+160, 181194, 1, 3539.51, -5722.72, 2.53295, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+161, 181194, 1, 3356.03, -5589.63, 8.83571, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+162, 181194, 1, 3355.51, -4509.02, 98.5344, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+163, 181194, 1, 3355.24, -5588.03, 8.94121, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+164, 181194, 1, 3488.67, -4149.57, 104.073, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+165, 181194, 1, 3494.6, -5725.11, 6.93952, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+166, 181194, 1, 3376.25, -5586.27, 8.15972, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+167, 181194, 1, 3343.07, -5556.61, 15.4991, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+168, 181194, 1, 3508.43, -5691.03, 4.37112, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+169, 181194, 1, 3338.62, -4537.07, 98.0098, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+170, 181194, 1, 3512.71, -5719.83, 4.70861, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+171, 181194, 1, 3328.82, -4527.13, 98.2791, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+172, 181194, 1, 3527.29, -4152.41, 107.635, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+173, 181194, 1, 3508.76, -5734.47, 4.27758, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+174, 181194, 1, 3529.72, -4177.77, 104.283, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+175, 181194, 1, 3539.07, -5723.81, 2.33291, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@AZSHARA_GUID+176, 181194, 1, 3386.43, -5551.54, 13.8384, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @AZSHARA_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @AZSHARA_GUID+1 AND @AZSHARA_GUID+176;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@AZSHARA_GUID+1, 16356, 1, 3533.39, -4172.37, 105.328, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+2, 16356, 1, 3518.78, -5750.42, 5.19787, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+3, 16356, 1, 3515.6, -4132.6, 105.999, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+4, 16356, 1, 3514.81, -5692.86, 4.26868, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+5, 16356, 1, 3513.05, -5738.57, 4.13426, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+6, 16356, 1, 3511.52, -4160.92, 105.342, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+7, 16356, 1, 3511.37, -4193.3, 100.419, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+8, 16356, 1, 3511.29, -4177.76, 101.65, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+9, 16356, 1, 3511, -5722.33, 4.77359, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+10, 16356, 1, 3519.91, -4119.88, 105.367, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+11, 16356, 1, 3521.14, -4171.2, 103.552, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+12, 16356, 1, 3522.71, -5729.77, 2.86675, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+13, 16356, 1, 3527.92, -5741.46, 2.53033, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+14, 16356, 1, 3526.56, -4130.81, 107.419, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+15, 16356, 1, 3525.95, -5690.33, 5.74887, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+16, 16356, 1, 3525.71, -5702.98, 5.7656, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+17, 16356, 1, 3524.68, -4158.03, 107.071, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+18, 16356, 1, 3524.24, -4185.59, 102.865, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+19, 16356, 1, 3523.98, -5675.84, 4.81455, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+20, 16356, 1, 3522.99, -4142.82, 107.56, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+21, 16356, 1, 3508.56, -4145.32, 105.706, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+22, 16356, 1, 3508.2, -5678.11, 5.59947, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+23, 16356, 1, 3494.08, -5724.02, 7.07728, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+24, 16356, 1, 3493.71, -5702.21, 4.62473, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+25, 16356, 1, 3491.65, -5687.77, 4.77581, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+26, 16356, 1, 3490.66, -5733.71, 7.04485, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+27, 16356, 1, 3489.89, -4127.42, 103.58, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+28, 16356, 1, 3488.06, -5710.97, 5.98872, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+29, 16356, 1, 3486.96, -4157.97, 102.621, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+30, 16356, 1, 3482.23, -4172.11, 99.6946, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+31, 16356, 1, 3496.34, -4145.18, 103.741, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+32, 16356, 1, 3497.39, -4183.08, 98.5261, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+33, 16356, 1, 3498.01, -4168.62, 101.474, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+34, 16356, 1, 3507.83, -4123.35, 103.923, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+35, 16356, 1, 3507.8, -5705.52, 4.60514, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+36, 16356, 1, 3504.39, -4133.83, 107.599, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+37, 16356, 1, 3503.97, -5690.9, 4.51797, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+38, 16356, 1, 3503.59, -5743.56, 4.9394, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+39, 16356, 1, 3501.47, -5732.45, 5.50239, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+40, 16356, 1, 3499.21, -4155.17, 103.601, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+41, 16356, 1, 3498.46, -5715.92, 6.02655, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+42, 16356, 1, 3475.85, -4132.15, 108.939, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+43, 16356, 1, 3702.28, -5548.42, 17.2446, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+44, 16356, 1, 3672.79, -5499.77, 28.3583, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+45, 16356, 1, 3670.6, -5514.95, 24.1455, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+46, 16356, 1, 3666.26, -5572.33, 15.0484, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+47, 16356, 1, 3664.29, -5550.41, 17.9544, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+48, 16356, 1, 3662.81, -5563.04, 16.3745, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+49, 16356, 1, 3660.68, -5508.89, 26.724, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+50, 16356, 1, 3658.43, -5522.9, 23.2322, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+51, 16356, 1, 3654.55, -5541.72, 20.819, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+52, 16356, 1, 3675.8, -5542.07, 18.1617, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+53, 16356, 1, 3676.29, -5565.21, 14.818, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+54, 16356, 1, 3676.53, -5526.23, 21.2233, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+55, 16356, 1, 3699.76, -5535.99, 19.664, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+56, 16356, 1, 3693.61, -5512.01, 24.4701, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+57, 16356, 1, 3690.1, -5555.26, 15.5335, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+58, 16356, 1, 3689.47, -5523.47, 22.0029, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+59, 16356, 1, 3689.03, -5544.3, 17.1654, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+60, 16356, 1, 3687.04, -5535.02, 18.9696, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+61, 16356, 1, 3682.15, -5513.76, 24.072, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+62, 16356, 1, 3676.9, -5552.87, 16.2495, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+63, 16356, 1, 3651.64, -5564.29, 17.5879, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+64, 16356, 1, 3650.81, -5552.16, 19.3526, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+65, 16356, 1, 3543.24, -5746.65, 1.89087, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+66, 16356, 1, 3542.16, -5733.04, 1.71104, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+67, 16356, 1, 3541.88, -4160.51, 106.205, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+68, 16356, 1, 3539.37, -4138.37, 107.582, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+69, 16356, 1, 3538.77, -4126.51, 109.197, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+70, 16356, 1, 3538.73, -5697.86, 7.8636, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+71, 16356, 1, 3537.48, -5684.61, 6.55419, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+72, 16356, 1, 3537, -5709.04, 6.25807, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+73, 16356, 1, 3543.48, -4172.77, 106.955, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+74, 16356, 1, 3547.56, -5722, 2.6648, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+75, 16356, 1, 3551.49, -5701.81, 6.66457, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+76, 16356, 1, 3646.52, -5513.63, 25.4151, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+77, 16356, 1, 3645.98, -5527.76, 23.378, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+78, 16356, 1, 3642.21, -5539.7, 22.084, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+79, 16356, 1, 3637.79, -5551.26, 20.5829, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+80, 16356, 1, 3632.27, -5525.7, 23.2605, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+81, 16356, 1, 3629.52, -5537.6, 21.5078, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+82, 16356, 1, 3552.45, -5712.3, 4.66837, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+83, 16356, 1, 3551.9, -4149.52, 105.794, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+84, 16356, 1, 3535.63, -4150.14, 107.273, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+85, 16356, 1, 3334.05, -4547.67, 97.5789, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+86, 16356, 1, 3303.45, -4537.55, 94.6147, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+87, 16356, 1, 3297.06, -4492.66, 97.7712, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+88, 16356, 1, 3123.73, -4224.92, 100.597, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+89, 16356, 1, 3122.37, -4198.01, 106.872, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+90, 16356, 1, 3117.07, -4212.53, 102.378, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+91, 16356, 1, 3115.46, -4239.17, 99.894, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+92, 16356, 1, 3111.7, -4224.77, 99.2081, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+93, 16356, 1, 3107.96, -4200.47, 102.344, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+94, 16356, 1, 3303.64, -4508.5, 96.8414, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+95, 16356, 1, 3311.86, -4483.88, 99.9921, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+96, 16356, 1, 3317.9, -4552.03, 95.2773, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+97, 16356, 1, 3333.38, -4523.2, 98.2382, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+98, 16356, 1, 3332.78, -5576.57, 14.3716, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+99, 16356, 1, 3331.88, -4510.62, 97.4588, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+100, 16356, 1, 3331.03, -4484.22, 98.3, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+101, 16356, 1, 3322, -4535.2, 97.9475, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+102, 16356, 1, 3321.41, -4519.14, 98.2024, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+103, 16356, 1, 3321.15, -4497.27, 97.3538, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+104, 16356, 1, 3319.64, -4470.73, 102.761, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+105, 16356, 1, 3106.46, -4184.55, 102.513, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+106, 16356, 1, 3105.64, -4249.88, 99.2042, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+107, 16356, 1, 3077.45, -4255.77, 97.9742, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+108, 16356, 1, 3077.05, -4209.22, 96.0722, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+109, 16356, 1, 3070.3, -4194.14, 96.5278, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+110, 16356, 1, 3069.67, -4218.87, 95.3934, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+111, 16356, 1, 3068.87, -4181.28, 97.6392, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+112, 16356, 1, 3064.58, -4231.33, 96.0068, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+113, 16356, 1, 3061.03, -4205.14, 95.3405, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+114, 16356, 1, 3054.88, -4193.17, 96.3701, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+115, 16356, 1, 3078.05, -4241.88, 97.7776, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+116, 16356, 1, 3078.86, -4226.2, 96.4072, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+117, 16356, 1, 3082.93, -4181.02, 98.3096, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+118, 16356, 1, 3104.51, -4213.21, 99.724, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+119, 16356, 1, 3101.93, -4236.38, 98.152, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+120, 16356, 1, 3097.55, -4222.91, 97.6538, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+121, 16356, 1, 3094.07, -4204.89, 98.4522, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+122, 16356, 1, 3091.28, -4249.13, 98.1309, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+123, 16356, 1, 3091.23, -4189.78, 98.9192, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+124, 16356, 1, 3089.11, -4233.47, 97.1534, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+125, 16356, 1, 3084.01, -4199.98, 98.0012, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+126, 16356, 1, 3052.05, -4218.66, 94.5101, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+127, 16356, 1, 3401.69, -5572.06, 11.1274, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+128, 16356, 1, 3374.54, -4503.57, 99.4529, 4.06662, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+129, 16356, 1, 3374.33, -5572.26, 10.2641, 5.63741, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+130, 16356, 1, 3374.06, -5540.74, 16.3713, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+131, 16356, 1, 3373.94, -5559.22, 12.58, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+132, 16356, 1, 3367.3, -5602.42, 8.44488, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+133, 16356, 1, 3367.16, -5590.04, 8.40419, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+134, 16356, 1, 3367.03, -5580.67, 9.14213, 0.715585, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+135, 16356, 1, 3366.84, -4551.24, 99.3444, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+136, 16356, 1, 3375.73, -4517.19, 100.536, 6.24828, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+137, 16356, 1, 3378.03, -5583.71, 8.52229, 1.95477, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+138, 16356, 1, 3378.62, -5593.57, 7.50537, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+139, 16356, 1, 3397.78, -5563.62, 12.4127, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+140, 16356, 1, 3397.08, -5551.55, 14.2353, 3.03684, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+141, 16356, 1, 3391.48, -5584, 8.78693, 1.37881, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+142, 16356, 1, 3388.58, -5574.24, 9.89189, 5.53269, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+143, 16356, 1, 3386.67, -5540.08, 16.1174, 4.03171, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+144, 16356, 1, 3385.7, -5552.67, 13.7273, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+145, 16356, 1, 3383.45, -5565.49, 11.5553, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+146, 16356, 1, 3380.49, -4541.89, 99.703, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+147, 16356, 1, 3365.3, -5550.28, 14.5021, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+148, 16356, 1, 3365.13, -4574.19, 97.0721, 3.14159, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+149, 16356, 1, 3343.69, -5574.38, 11.6644, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+150, 16356, 1, 3343.45, -5586.44, 10.6995, 4.20625, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+151, 16356, 1, 3342.43, -5554.33, 16.3574, 1.09956, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+152, 16356, 1, 3342.15, -4509.72, 97.5853, 1.8675, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+153, 16356, 1, 3341.39, -4562.71, 98.1636, 4.46804, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+154, 16356, 1, 3340.95, -4533.95, 98.2443, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+155, 16356, 1, 3340.66, -4470.9, 99.1944, 2.80997, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+156, 16356, 1, 3335.97, -4498.37, 97.0747, 4.04917, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+157, 16356, 1, 3334.31, -5564.92, 15.6421, 1.85005, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+158, 16356, 1, 3343.84, -4521.73, 98.083, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+159, 16356, 1, 3349.37, -5564.11, 12.6707, 2.00713, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+160, 16356, 1, 3364, -5533.69, 19.6938, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+161, 16356, 1, 3359.02, -4534.84, 100.891, 0.506145, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+162, 16356, 1, 3358.77, -5573.38, 10.0153, 5.20108, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+163, 16356, 1, 3355.53, -4514.97, 99.4529, 2.23402, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+164, 16356, 1, 3355.19, -5583.63, 9.23584, 0.226893, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+165, 16356, 1, 3354.8, -4496.21, 97.864, 3.26377, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+166, 16356, 1, 3353.38, -5594.22, 9.27417, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+167, 16356, 1, 3351.04, -5543.88, 18.714, 5.49779, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+168, 16356, 1, 3350.16, -4550.55, 99.9108, 1.88495, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+169, 16386, 1, 3612.61, -5566.16, 25.598, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+170, 16386, 1, 3529.63, -5678.56, 12.0461, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+171, 16386, 1, 3448.66, -4191.01, 119.208, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+172, 16386, 1, 3433.84, -5589.88, 31.0207, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+173, 16386, 1, 3313.65, -4433.73, 124.361, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+174, 16386, 1, 3166.14, -4244.19, 127.344, 2.60054, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+175, 16398, 1, 3564.39, -5596.77, 31.2577, 4.10152, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+176, 16398, 1, 3535.45, -5643.02, 26.5771, 4.10152, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+177, 16398, 1, 3489.95, -5599.45, 38.5652, 4.10152, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+178, 16398, 1, 3363.05, -4230.81, 147.63, 4.10152, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+179, 16398, 1, 3300.44, -4356.98, 154.459, 4.10152, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+180, 16398, 1, 3234.63, -4264.38, 141.236, 4.10152, 120, 120, 0, 0, 9),
    -- (@AZSHARA_GUID+181, 16995, 1, 3273.75, -4276.98, 125.509, 5.44543, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+182, 16401, 1, 3299.55, -4301.3, 177.891, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+183, 16401, 1, 3544.98, -5610.26, 67.196, 2.82743, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+184, 16421, 1, 3299.55, -4301.3, 177.891, 5.81195, 120, 120, 0, 0, 9),
    (@AZSHARA_GUID+185, 16421, 1, 3544.98, -5610.26, 67.196, 2.82743, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @AZSHARA_EVENT FROM `creature` WHERE creature.guid BETWEEN @AZSHARA_GUID+1 AND @AZSHARA_GUID+185;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@BLASTED_LANDS_GUID+1, 181136, 0, -11548.5, -3283.3, 7.45651, 4.4855, 0, 0, -0.782608, 0.622515, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+2, 181136, 0, -11420, -2816.92, 0.782562, 2.84488, 0, 0, 0.989016, 0.147811, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+3, 181136, 0, -11347.7, -3150.83, 6.83877, 1.3439, 0, 0, 0.622514, 0.782609, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+4, 181136, 0, -11250.5, -3350.77, 9.86965, 3.49067, 0, 0, -0.984807, 0.173652, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+5, 181136, 0, -11181.7, -2985.37, 8.24824, 4.4855, 0, 0, -0.782608, 0.622515, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+6, 181136, 0, -11016.3, -2783.41, 4.35682, 3.49067, 0, 0, -0.984807, 0.173652, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+7, 181173, 0, -11187.3, -2976.44, 8.15536, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+8, 181173, 0, -11193.1, -2987.38, 6.08082, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+9, 181173, 0, -11240.3, -3346.03, 8.90917, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+10, 181173, 0, -11243.4, -3359.44, 9.5082, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+11, 181173, 0, -11252, -3339.84, 9.61862, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+12, 181173, 0, -11256.1, -3360.71, 9.0967, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+13, 181173, 0, -11180.7, -2995.72, 9.00704, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+14, 181173, 0, -11175.4, -2976.17, 7.56094, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+15, 181173, 0, -11170.9, -2988.73, 10.0367, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+16, 181173, 0, -11025.1, -2788.75, 4.72334, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+17, 181173, 0, -11024.6, -2777.53, 4.05862, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+18, 181173, 0, -11013.6, -2773.45, 3.91934, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+19, 181173, 0, -11013.1, -2792.5, 5.05269, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+20, 181173, 0, -11006.2, -2783.21, 4.68019, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+21, 181173, 0, -11261.8, -3349.11, 10.238, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+22, 181173, 0, -11337.4, -3146.26, 6.20375, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+23, 181173, 0, -11558.9, -3289.17, 7.57173, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+24, 181173, 0, -11557.1, -3274.81, 7.65565, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+25, 181173, 0, -11547.6, -3294.89, 7.6757, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+26, 181173, 0, -11542.8, -3272.75, 7.43698, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+27, 181173, 0, -11539.2, -3284.73, 8.61913, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+28, 181173, 0, -11431.3, -2813.51, -0.797982, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+29, 181173, 0, -11427.2, -2824.02, 0.048245, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+30, 181173, 0, -11422.6, -2806.9, 0.603001, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+31, 181173, 0, -11340, -3160.64, 7.71811, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+32, 181173, 0, -11348.3, -3137.8, 2.5852, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+33, 181173, 0, -11354.5, -3159.13, 8.06337, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+34, 181173, 0, -11358.2, -3147.44, 6.7121, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+35, 181173, 0, -11411.4, -2812.17, -2.36393, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+36, 181173, 0, -11414.6, -2826.01, -2.87386, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+37, 181174, 0, -11187.3, -2976.44, 8.15536, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+38, 181174, 0, -11193.1, -2987.38, 6.08082, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+39, 181174, 0, -11240.3, -3346.03, 8.90917, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+40, 181174, 0, -11243.4, -3359.44, 9.5082, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+41, 181174, 0, -11252, -3339.84, 9.61862, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+42, 181174, 0, -11256.1, -3360.71, 9.0967, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+43, 181174, 0, -11180.7, -2995.72, 9.00704, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+44, 181174, 0, -11175.4, -2976.17, 7.56094, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+45, 181174, 0, -11170.9, -2988.73, 10.0367, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+46, 181174, 0, -11025.1, -2788.75, 4.72334, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+47, 181174, 0, -11024.6, -2777.53, 4.05862, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+48, 181174, 0, -11013.6, -2773.45, 3.91934, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+49, 181174, 0, -11013.1, -2792.5, 5.05269, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+50, 181174, 0, -11006.2, -2783.21, 4.68019, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+51, 181174, 0, -11261.8, -3349.11, 10.238, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+52, 181174, 0, -11337.4, -3146.26, 6.20375, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+53, 181174, 0, -11558.9, -3289.17, 7.57173, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+54, 181174, 0, -11557.1, -3274.81, 7.65565, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+55, 181174, 0, -11547.6, -3294.89, 7.6757, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+56, 181174, 0, -11542.8, -3272.75, 7.43698, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+57, 181174, 0, -11539.2, -3284.73, 8.61913, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+58, 181174, 0, -11431.3, -2813.51, -0.797982, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+59, 181174, 0, -11427.2, -2824.02, 0.048245, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+60, 181174, 0, -11422.6, -2806.9, 0.603001, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+61, 181174, 0, -11340, -3160.64, 7.71811, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+62, 181174, 0, -11348.3, -3137.8, 2.5852, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+63, 181174, 0, -11354.5, -3159.13, 8.06337, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+64, 181174, 0, -11358.2, -3147.44, 6.7121, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+65, 181174, 0, -11411.4, -2812.17, -2.36393, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+66, 181174, 0, -11414.6, -2826.01, -2.87386, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+67, 181191, 0, -11239.8, -3340.94, 9.11304, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+68, 181191, 0, -11236.3, -3373.25, 9.05493, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+69, 181191, 0, -11419.5, -2850.98, 0.854349, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+70, 181191, 0, -11419.8, -2852.42, 1.0657, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+71, 181191, 0, -11427.7, -2806.39, -0.251402, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+72, 181191, 0, -11441.7, -2816.53, -1.56979, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+73, 181191, 0, -11226.2, -3371.7, 9.3219, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+74, 181191, 0, -11225.2, -3354.03, 5.00269, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+75, 181191, 0, -11251, -3380.69, 7.32356, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+76, 181191, 0, -11391.3, -2822.06, -2.3644, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+77, 181191, 0, -11255.2, -3319.01, 20.5497, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+78, 181191, 0, -11347.3, -3191.07, 9.86258, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+79, 181191, 0, -11336.3, -3142.19, 6.28316, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+80, 181191, 0, -11336.2, -3116.36, -1.65432, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+81, 181191, 0, -11321.1, -3150.07, 6.12652, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+82, 181191, 0, -11317.5, -3152.81, 6.27768, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+83, 181191, 0, -11279.5, -3345.42, 9.61636, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+84, 181191, 0, -11380.5, -2781.23, 3.66675, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+85, 181191, 0, -11261.2, -3343.55, 10.1272, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+86, 181191, 0, -11215.6, -2948.61, 9.523, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+87, 181191, 0, -11454.6, -2823.16, -1.42783, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+88, 181191, 0, -11212.2, -3006.54, 3.45062, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+89, 181191, 0, -11362.9, -3163.56, 9.51303, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+90, 181191, 0, -10974.5, -2778.92, 4.87717, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+91, 181191, 0, -10984.2, -2815.63, 6.10166, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+92, 181191, 0, -11014.6, -2754.4, 3.78119, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+93, 181191, 0, -11569.9, -3282.3, 10.1818, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+94, 181191, 0, -11020.9, -2794.48, 5.16899, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+95, 181191, 0, -11026.9, -2772.87, 3.89268, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+96, 181191, 0, -11041.1, -2824.76, 13.9447, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+97, 181191, 0, -11186.9, -2963.88, 8.17708, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+98, 181191, 0, -11186.2, -3010.96, 7.94982, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+99, 181191, 0, -11175.5, -3021.69, 7.32877, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+100, 181192, 0, -11157.2, -2987.25, 8.60665, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+101, 181192, 0, -11203.6, -2959.86, 9.16768, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+102, 181192, 0, -11004.7, -2789.47, 5.05259, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+103, 181192, 0, -11012.8, -2806.25, 6.10035, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+104, 181192, 0, -11227, -3327.39, 9.00909, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+105, 181192, 0, -11271.4, -3361.43, 5.99592, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+106, 181192, 0, -11173.8, -2993.97, 9.54054, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+107, 181192, 0, -11160.3, -2989, 8.60169, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+108, 181192, 0, -11159.4, -3008.26, 8.14676, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+109, 181192, 0, -11050.7, -2789.54, 6.56607, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+110, 181192, 0, -11246.1, -3363.18, 9.74607, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+111, 181192, 0, -11359.1, -3139.28, 6.13144, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+112, 181192, 0, -11373.6, -3175.95, 12.1172, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+113, 181192, 0, -11428.4, -2807.11, -0.345578, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+114, 181192, 0, -11444.7, -2840.39, -0.528655, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+115, 181192, 0, -11562.9, -3275.06, 8.61297, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+116, 181192, 0, -11447.3, -2853.42, 0.316006, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+117, 181192, 0, -11558.9, -3255.88, 6.88916, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+118, 181192, 0, -11540, -3311.94, 8.04234, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+119, 181192, 0, -11585.6, -3316.06, 8.30476, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+120, 181192, 0, -11518.1, -3275.79, 7.65164, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+121, 181192, 0, -11370.5, -3116.58, 3.47254, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+122, 181192, 0, -11362.2, -3104.35, 2.20197, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+123, 181192, 0, -11570.6, -3281.41, 10.2427, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+124, 181193, 0, -11194.1, -2974.03, 8.55119, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+125, 181193, 0, -11416, -2783.94, 1.47755, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+126, 181193, 0, -11227.9, -2992.87, 3.46904, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+127, 181193, 0, -11043.4, -2751.83, 1.87099, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+128, 181193, 0, -11519.8, -3310.07, 8.64683, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+129, 181193, 0, -11035.7, -2763.43, 4.62899, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+130, 181193, 0, -11194, -2975.29, 8.59496, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+131, 181193, 0, -11239.4, -3339.89, 9.12619, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+132, 181193, 0, -11406.5, -2826.39, -2.88244, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+133, 181193, 0, -11569.6, -3281.51, 10.1382, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+134, 181193, 0, -11346.4, -3180.5, 11.1409, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+135, 181193, 0, -11588.6, -3252.7, 8.55592, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+136, 181193, 0, -10984.8, -2815.37, 6.07834, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+137, 181193, 0, -11326.7, -3121.21, -1.62494, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+138, 181193, 0, -11012.2, -2816.72, 6.92621, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+139, 181193, 0, -11375.3, -3149.41, 9.39994, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+140, 181193, 0, -11275.1, -3376.35, 6.07523, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+141, 181193, 0, -11378.9, -2780.56, 3.8241, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+142, 181193, 0, -11381.4, -2847.9, 3.27664, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+143, 181193, 0, -11444.2, -2790.83, -0.916143, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+144, 181193, 0, -11251.2, -3380.98, 7.34449, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+145, 181193, 0, -11391.8, -2822.67, -2.36443, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+146, 181194, 0, -11544.7, -3245.97, 6.78339, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+147, 181194, 0, -11147, -2961.9, 9.2982, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+148, 181194, 0, -11051, -2790.25, 6.5906, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+149, 181194, 0, -10974.4, -2779.73, 4.94576, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+150, 181194, 0, -11021.1, -2795.17, 5.22782, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+151, 181194, 0, -10994.7, -2762.28, 4.3075, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+152, 181194, 0, -11545.7, -3245.35, 6.74961, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+153, 181194, 0, -11573.3, -3249.13, 6.40786, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+154, 181194, 0, -11048, -2809.05, 7.60497, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+155, 181194, 0, -11159.5, -3009.7, 8.18247, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+156, 181194, 0, -11335.4, -3141.92, 6.45337, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+157, 181194, 0, -11360.7, -3103.99, 1.74725, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+158, 181194, 0, -11374.3, -3149.12, 9.19029, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+159, 181194, 0, -11283.1, -3381.82, 8.24883, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+160, 181194, 0, -11386.2, -2858.03, 3.66751, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+161, 181194, 0, -11254.5, -3318.65, 20.4367, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+162, 181194, 0, -11396.8, -2841.24, -2.43388, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+163, 181194, 0, -11228, -3336.56, 9.46834, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+164, 181194, 0, -11224.7, -3352.88, 5.0027, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+165, 181194, 0, -11213.9, -2986.06, 3.57035, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+166, 181194, 0, -11538.7, -3297.1, 8.37852, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+167, 181194, 0, -11537.8, -3275.93, 7.97432, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+168, 181194, 0, -11537.1, -3276.36, 8.05586, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+169, 181194, 0, -11183.8, -2948.68, 18.891, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+170, 181194, 0, -11528.1, -3250.03, 6.90311, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+171, 181194, 0, -11211.3, -3007.63, 3.47926, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+172, 181194, 0, -11509.4, -3289.26, 8.31943, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+173, 181194, 0, -11346.7, -3180.8, 11.0252, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+174, 181223, 0, -11402.1, -3316.55, 111.188, 4.46804, 0, 0, -0.788011, 0.615662, 100, 1, 120, 120, 9),
    (@BLASTED_LANDS_GUID+175, 181374, 0, -11233.9, -2841.77, 185.603, 4.45059, 0, 0, -0.793353, 0.608762, 100, 1, 120, 120, 9);

INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @BLASTED_LANDS_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @BLASTED_LANDS_GUID+1 AND @BLASTED_LANDS_GUID+175;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@BLASTED_LANDS_GUID+1, 16356, 0, -11181.1, -2973.18, 7.62003, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+2, 16356, 0, -11217.4, -3372.26, 9.48901, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+3, 16356, 0, -11218.1, -3309.33, 9.15481, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+4, 16356, 0, -11218.2, -3391.36, 22.9658, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+5, 16356, 0, -11219.5, -3353.26, 5.08604, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+6, 16356, 0, -11221, -3023.16, 6.41069, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+7, 16356, 0, -11222, -2984.07, 3.90817, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+8, 16356, 0, -11223, -3005.04, 7.03504, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+9, 16356, 0, -11223.5, -2946.92, 10.2132, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+10, 16356, 0, -11216.1, -3325.78, 8.73674, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+11, 16356, 0, -11208.6, -2953.39, 8.99919, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+12, 16356, 0, -11208.1, -3013.59, 5.09382, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+13, 16356, 0, -11184, -2946.85, 19.4695, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+14, 16356, 0, -11193, -2963.79, 8.5652, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+15, 16356, 0, -11193, -2978.19, 8.73847, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+16, 16356, 0, -11193, -3005.14, 6.8718, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+17, 16356, 0, -11194, -3023.39, 7.16518, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+18, 16356, 0, -11205.5, -2971.31, 8.41278, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+19, 16356, 0, -11206.8, -3342.5, 5.20492, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+20, 16356, 0, -11207.4, -2992.09, 4.00507, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+21, 16356, 0, -11227.2, -3338.57, 9.37604, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+22, 16356, 0, -11231.3, -3323.45, 9.99582, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+23, 16356, 0, -11265.1, -3368, 6.34093, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+24, 16356, 0, -11272, -3384.21, 6.37339, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+25, 16356, 0, -11272.4, -3343.95, 9.96668, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+26, 16356, 0, -11274.2, -3317.7, 25.2531, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+27, 16356, 0, -11276, -3358.51, 6.2773, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+28, 16356, 0, -11287.3, -3372.26, 7.9216, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+29, 16356, 0, -11287.8, -3340.54, 9.04822, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+30, 16356, 0, -11288.4, -3389.93, 7.66957, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+31, 16356, 0, -11262.1, -3354.55, 8.87, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+32, 16356, 0, -11259.6, -3394.71, 10.1496, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+33, 16356, 0, -11258.9, -3340.28, 10.113, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+34, 16356, 0, -11235, -3369.2, 9.52345, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+35, 16356, 0, -11235.5, -3353.5, 5.08604, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+36, 16356, 0, -11238.2, -3306.17, 15.0118, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+37, 16356, 0, -11238.7, -3390.98, 10.9117, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+38, 16356, 0, -11243.1, -3340.19, 9.38895, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+39, 16356, 0, -11249.8, -3363.01, 10.1013, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+40, 16356, 0, -11250.9, -3379.86, 7.35147, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+41, 16356, 0, -11252.6, -3324.28, 18.7379, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+42, 16356, 0, -11293.2, -3355.24, 9.05811, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+43, 16356, 0, -10973.5, -2807.63, 5.38797, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+44, 16356, 0, -11008.3, -2738.67, 5.43277, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+45, 16356, 0, -11018.4, -2753.57, 3.71715, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+46, 16356, 0, -11019.8, -2771, 3.74648, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+47, 16356, 0, -11021.8, -2794.13, 5.22963, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+48, 16356, 0, -11023.6, -2822.95, 10.6242, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+49, 16356, 0, -11025.9, -2807.95, 7.76655, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+50, 16356, 0, -11030.3, -2782.59, 4.53305, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+51, 16356, 0, -11033.8, -2767.28, 4.80015, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+52, 16356, 0, -11008.1, -2817.31, 7.10468, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+53, 16356, 0, -11005, -2763.27, 3.90122, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+54, 16356, 0, -11004.4, -2777.81, 4.51385, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+55, 16356, 0, -10974.5, -2782.83, 5.10687, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+56, 16356, 0, -10976.6, -2762.51, 4.21193, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+57, 16356, 0, -10989.3, -2812.23, 5.92583, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+58, 16356, 0, -10990.2, -2793.42, 5.36988, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+59, 16356, 0, -10990.4, -2771.42, 4.11056, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+60, 16356, 0, -10990.6, -2756.9, 5.03873, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+61, 16356, 0, -10995.8, -2829.69, 9.40201, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+62, 16356, 0, -11003.4, -2796.45, 5.53892, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+63, 16356, 0, -11036.5, -2796.51, 5.90141, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+64, 16356, 0, -11039.7, -2750.75, 2.0154, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+65, 16356, 0, -11153.4, -2983.32, 8.81915, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+66, 16356, 0, -11160.2, -2995.96, 8.56307, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+67, 16356, 0, -11160.4, -2940.95, 20.0501, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+68, 16356, 0, -11162.9, -3011.74, 7.76301, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+69, 16356, 0, -11168.3, -2963.32, 8.0324, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+70, 16356, 0, -11169.5, -2980.98, 9.00698, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+71, 16356, 0, -11176.3, -2996.02, 9.51162, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+72, 16356, 0, -11176.8, -3027.3, 7.47332, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+73, 16356, 0, -11151.9, -2962.63, 8.69393, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+74, 16356, 0, -11147.6, -3013.51, 20.7093, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+75, 16356, 0, -11145.5, -2953.04, 9.862, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+76, 16356, 0, -11042.2, -2816.22, 11.9086, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+77, 16356, 0, -11044.8, -2779.02, 5.63407, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+78, 16356, 0, -11057.7, -2763.12, 1.95432, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+79, 16356, 0, -11058.8, -2803.73, 10.737, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+80, 16356, 0, -11060.6, -2822.69, 9.96001, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+81, 16356, 0, -11061.5, -2784.66, 7.56118, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+82, 16356, 0, -11141.8, -2973.75, 8.65759, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+83, 16356, 0, -11144.7, -2994.87, 9.82344, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+84, 16356, 0, -11178.6, -3011.94, 7.4886, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+85, 16356, 0, -11412.8, -2791.76, 1.57174, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+86, 16356, 0, -11458.5, -2791.27, -1.29338, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+87, 16356, 0, -11458.5, -2835.28, -0.501001, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+88, 16356, 0, -11509.8, -3283.77, 8.013, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+89, 16356, 0, -11510.2, -3314.3, 8.31123, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+90, 16356, 0, -11521.2, -3300.12, 9.13522, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+91, 16356, 0, -11521.3, -3263.87, 7.51119, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+92, 16356, 0, -11523.9, -3245.55, 7.11017, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+93, 16356, 0, -11525.6, -3316.16, 8.15826, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+94, 16356, 0, -11452.7, -2810.38, -1.63872, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+95, 16356, 0, -11448.2, -2859.39, 0.904908, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+96, 16356, 0, -11443.4, -2783.43, -0.325569, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+97, 16356, 0, -11419.1, -2860.09, 1.96834, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+98, 16356, 0, -11424, -2838.84, 0.50487, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+99, 16356, 0, -11424.5, -2803.79, 0.722889, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+100, 16356, 0, -11426.9, -2783.61, 0.789475, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+101, 16356, 0, -11428.8, -2827.22, 0.264869, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+102, 16356, 0, -11435.1, -2813.19, -1.24098, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+103, 16356, 0, -11442.2, -2843.87, -0.296348, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+104, 16356, 0, -11443.2, -2825.79, -1.2147, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+105, 16356, 0, -11525.7, -3283.26, 8.72746, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+106, 16356, 0, -11534.7, -3327.86, 14.1548, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+107, 16356, 0, -11568.8, -3316.34, 9.62002, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+108, 16356, 0, -11571.2, -3270.33, 7.40802, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+109, 16356, 0, -11576.2, -3288.48, 9.07377, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+110, 16356, 0, -11577.8, -3253.41, 6.74885, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+111, 16356, 0, -11583.9, -3310.85, 8.08078, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+112, 16356, 0, -11585.3, -3275.69, 7.71706, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+113, 16356, 0, -11588.4, -3239.93, 7.05529, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+114, 16356, 0, -11591.7, -3259.07, 7.44409, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+115, 16356, 0, -11568.4, -3238.51, 6.11985, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+116, 16356, 0, -11562, -3254.91, 6.87348, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+117, 16356, 0, -11560.6, -3284.29, 7.74791, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+118, 16356, 0, -11538.1, -3304.59, 8.15991, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+119, 16356, 0, -11538.9, -3290.09, 8.57665, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+120, 16356, 0, -11539.6, -3276.42, 7.99829, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+121, 16356, 0, -11540.4, -3260.93, 7.04242, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+122, 16356, 0, -11546.3, -3245.86, 6.85342, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+123, 16356, 0, -11549.5, -3318.25, 9.25334, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+124, 16356, 0, -11554.3, -3269.97, 7.27003, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+125, 16356, 0, -11557.2, -3303.17, 9.34602, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+126, 16356, 0, -11591.7, -3294.08, 7.72112, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+127, 16356, 0, -11306.4, -3156.66, 6.39326, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+128, 16356, 0, -11343.4, -3110.82, -1.571, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+129, 16356, 0, -11345.2, -3184.88, 9.96713, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+130, 16356, 0, -11346.8, -3169.79, 10.8443, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+131, 16356, 0, -11351.4, -3135.15, 2.55729, 2.00713, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+132, 16356, 0, -11355.9, -3120.81, 2.03413, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+133, 16356, 0, -11359.4, -3191, 12.9642, 1.37881, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+134, 16356, 0, -11361.2, -3159.3, 8.87013, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+135, 16356, 0, -11361.3, -3143.44, 6.54761, 0.715585, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+136, 16356, 0, -11337.9, -3126.06, -1.45812, 1.88495, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+137, 16356, 0, -11336, -3156, 7.16726, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+138, 16356, 0, -11333.7, -3195.45, 9.97451, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+139, 16356, 0, -11306.5, -3119.29, -1.06902, 3.14159, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+140, 16356, 0, -11313.1, -3143.47, 5.6345, 0.506145, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+141, 16356, 0, -11318.2, -3184.48, 10.1433, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+142, 16356, 0, -11319.7, -3163.73, 7.40355, 6.24828, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+143, 16356, 0, -11320.6, -3127.99, -0.00666066, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+144, 16356, 0, -11324.3, -3115.12, -1.57099, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+145, 16356, 0, -11330.6, -3141.88, 6.51639, 2.23402, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+146, 16356, 0, -11331.3, -3174.08, 8.75502, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+147, 16356, 0, -11362.9, -3174.96, 10.6151, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+148, 16356, 0, -11364.6, -3129.79, 5.75585, 5.53269, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+149, 16356, 0, -11388.5, -2857.65, 3.03795, 4.03171, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+150, 16356, 0, -11389.1, -2836.06, -2.25091, 3.26377, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+151, 16356, 0, -11392.3, -2813.08, -2.27471, 1.8675, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+152, 16356, 0, -11393.4, -2789.38, 3.18945, 1.85005, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+153, 16356, 0, -11399.7, -2827.16, -2.43278, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+154, 16356, 0, -11405.1, -2846.84, -2.72865, 3.03684, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+155, 16356, 0, -11409.1, -2774.37, 2.76715, 5.81195, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+156, 16356, 0, -11409.4, -2807.62, -2.2806, 5.20108, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+157, 16356, 0, -11411, -2832.68, -2.81856, 5.63741, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+158, 16356, 0, -11387.6, -2775.46, 3.7363, 0.226893, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+159, 16356, 0, -11380.6, -2824.51, -2.15952, 4.04917, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+160, 16356, 0, -11370.2, -3108.52, 3.10605, 4.20625, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+161, 16356, 0, -11372.4, -3151.96, 9.45155, 1.95477, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+162, 16356, 0, -11373.6, -2804.95, 3.71653, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+163, 16356, 0, -11374, -2842.94, 4.32663, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+164, 16356, 0, -11375.2, -3166.46, 11.8, 5.49779, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+165, 16356, 0, -11375.5, -2787.37, 3.76548, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+166, 16356, 0, -11376.8, -3139.34, 7.8165, 1.09956, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+167, 16356, 0, -11377.2, -3123.76, 5.38044, 4.06662, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+168, 16356, 0, -11378, -3184.08, 13.2359, 2.80997, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+169, 16386, 0, -11090.6, -2803.51, 67.0964, 0.279253, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+170, 16386, 0, -11201.1, -2930.16, 76.1435, 4.10152, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+171, 16386, 0, -11297.2, -3340.3, 41.148, 6.0912, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+172, 16386, 0, -11362.7, -2824.68, 59.6948, 3.00197, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+173, 16386, 0, -11371.4, -3223.08, 52.8462, 1.23918, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+174, 16386, 0, -11498.7, -3294.72, 43.3584, 2.89725, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+175, 16398, 0, -11163.2, -2823.37, 128.413, 0.279253, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+176, 16398, 0, -11215.6, -2890.43, 124.73, 5.07891, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+177, 16398, 0, -11296.2, -2834.15, 124.322, 3.00197, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+178, 16398, 0, -11343.3, -3330.49, 68.0946, 6.07375, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+179, 16398, 0, -11395.4, -3298.51, 98.6445, 1.309, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+180, 16398, 0, -11472.5, -3300.64, 62.1611, 2.9147, 120, 120, 0, 0, 9),
    -- (@BLASTED_LANDS_GUID+181, 16995, 0, -11429.3, -3327.82, 7.73628, 1.0821, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+182, 16401, 0, -11402.1, -3316.55, 111.272, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+183, 16401, 0, -11233.9, -2841.77, 185.686, 4.45059, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+184, 16421, 0, -11402.1, -3316.55, 111.272, 4.46804, 120, 120, 0, 0, 9),
    (@BLASTED_LANDS_GUID+185, 16421, 0, -11233.9, -2841.77, 185.686, 4.45059, 120, 120, 0, 0, 9);
    
INSERT INTO `game_event_creature` SELECT creature.guid, @BLASTED_LANDS_EVENT FROM `creature` WHERE creature.guid BETWEEN @BLASTED_LANDS_GUID+1 AND @BLASTED_LANDS_GUID+185;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@EASTERN_PLAGUELANDS_GUID+1, 181136, 0, 1599.78, -3039.54, 78.7164, 2.1293, 0, 0, 0.874619, 0.48481, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+2, 181136, 0, 1804.44, -2842.5, 72.9479, 2.1293, 0, 0, 0.874619, 0.48481, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+3, 181136, 0, 1938.6, -4761.25, 97.0908, 5.21854, 0, 0, -0.507538, 0.861629, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+4, 181136, 0, 1957.07, -3101.68, 83.5755, 2.1293, 0, 0, 0.874619, 0.48481, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+5, 181136, 0, 1963.32, -5125.08, 78.7029, 3.9619, 0, 0, -0.91706, 0.39875, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+6, 181136, 0, 2315.23, -4933.08, 83.0351, 5.21854, 0, 0, -0.507538, 0.861629, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+7, 181154, 0, 1766.67, -3033.34, 132.804, 5.18363, 0, 0, -0.522498, 0.852641, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+8, 181154, 0, 2101.69, -4930.03, 168.281, 1.0472, 0, 0, 0.5, 0.866025, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+9, 181173, 0, 1582.5, -3030.12, 79.9779, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+10, 181173, 0, 1590.2, -3049.41, 80.9236, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+11, 181173, 0, 1596.72, -3020.29, 80.0585, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+12, 181173, 0, 1614.42, -3051.32, 77.6001, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+13, 181173, 0, 1614.48, -3030.5, 77.7499, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+14, 181173, 0, 1772.05, -2864.72, 69.953, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+15, 181173, 0, 1791.07, -2852.26, 69.2167, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+16, 181173, 0, 1792.11, -2816.19, 68.3669, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+17, 181173, 0, 1810.86, -2872.05, 68.268, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+18, 181173, 0, 1828.78, -2835.28, 79.0129, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+19, 181173, 0, 1915.6, -4761.28, 101.138, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+20, 181173, 0, 1927.29, -4778.58, 99.4498, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+21, 181173, 0, 1930.57, -4741.03, 98.0023, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+22, 181173, 0, 1942.62, -3107.03, 86.7935, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+23, 181173, 0, 1943.04, -5142.08, 73.6436, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+24, 181173, 0, 1947.72, -5115.88, 79.1624, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+25, 181173, 0, 1947.97, -3091.73, 84.0488, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+26, 181173, 0, 1948.52, -4775.06, 99.0672, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+27, 181173, 0, 1954.04, -3119.84, 87.7657, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+28, 181173, 0, 1957.52, -4749.19, 96.4972, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+29, 181173, 0, 1960.57, -5151.77, 74.0361, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+30, 181173, 0, 1966.9, -3090.5, 81.5039, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+31, 181173, 0, 1967.03, -5116.3, 82.1635, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+32, 181173, 0, 1972.12, -3110.72, 81.5372, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+33, 181173, 0, 1977.92, -5143.16, 79.2317, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+34, 181173, 0, 2301.16, -4941.02, 80.8607, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+35, 181173, 0, 2306.55, -4919.39, 89.5811, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+36, 181173, 0, 2320.43, -4951.71, 76.1494, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+37, 181173, 0, 2321.65, -4917.39, 84.3817, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+38, 181173, 0, 2333.07, -4938.58, 76.1625, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+39, 181174, 0, 1582.5, -3030.12, 79.9779, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+40, 181174, 0, 1590.2, -3049.41, 80.9236, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+41, 181174, 0, 1596.72, -3020.29, 80.0585, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+42, 181174, 0, 1614.42, -3051.32, 77.6001, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+43, 181174, 0, 1614.48, -3030.5, 77.7499, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+44, 181174, 0, 1772.05, -2864.72, 69.953, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+45, 181174, 0, 1791.07, -2852.26, 69.2167, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+46, 181174, 0, 1792.11, -2816.19, 68.3669, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+47, 181174, 0, 1810.86, -2872.05, 68.268, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+48, 181174, 0, 1828.78, -2835.28, 79.0129, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+49, 181174, 0, 1915.6, -4761.28, 101.138, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+50, 181174, 0, 1927.29, -4778.58, 99.4498, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+51, 181174, 0, 1930.57, -4741.03, 98.0023, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+52, 181174, 0, 1942.62, -3107.03, 86.7935, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+53, 181174, 0, 1943.04, -5142.08, 73.6436, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+54, 181174, 0, 1947.72, -5115.88, 79.1624, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+55, 181174, 0, 1947.97, -3091.73, 84.0488, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+56, 181174, 0, 1948.52, -4775.06, 99.0672, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+57, 181174, 0, 1954.04, -3119.84, 87.7657, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+58, 181174, 0, 1957.52, -4749.19, 96.4972, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+59, 181174, 0, 1960.57, -5151.77, 74.0361, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+60, 181174, 0, 1966.9, -3090.5, 81.5039, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+61, 181174, 0, 1967.03, -5116.3, 82.1635, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+62, 181174, 0, 1972.12, -3110.72, 81.5372, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+63, 181174, 0, 1977.92, -5143.16, 79.2317, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+64, 181174, 0, 2301.16, -4941.02, 80.8607, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+65, 181174, 0, 2306.55, -4919.39, 89.5811, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+66, 181174, 0, 2320.43, -4951.71, 76.1494, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+67, 181174, 0, 2321.65, -4917.39, 84.3817, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+68, 181174, 0, 2333.07, -4938.58, 76.1625, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+70, 181255, 0, 2239.47, -5320.43, 82.6284, 1.27409, 0, 0, 0.594822, 0.803857, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+71, 181255, 0, 2239.56, -5320.3, 82.1271, 4.15388, 0, 0, -0.874619, 0.48481, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+75, 181194, 0, 1568.39, -3051.2, 78.6488, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+76, 181193, 0, 1569.98, -3050.95, 78.8824, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+77, 181191, 0, 1585.78, -3039.62, 79.899, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+78, 181191, 0, 1586.16, -3040.48, 80.0321, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+79, 181191, 0, 1586.57, -3040.22, 80.0008, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+80, 181191, 0, 1587.12, -3015.43, 81.611, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+81, 181194, 0, 1587.5, -3013.96, 81.7142, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+82, 181192, 0, 1592.62, -3031.2, 78.8748, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+83, 181192, 0, 1593.2, -3066.88, 79.9349, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+84, 181192, 0, 1595.76, -3064.81, 79.9576, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+85, 181191, 0, 1603.07, -3025.87, 79.0196, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+86, 181191, 0, 1604.12, -3025.66, 79.0573, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+87, 181191, 0, 1611.98, -3065.57, 78.606, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+88, 181192, 0, 1613.93, -3065.54, 78.6501, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+89, 181194, 0, 1615.02, -3037.84, 77.6618, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+90, 181194, 0, 1622.07, -3046.96, 79.0298, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+91, 181194, 0, 1631.92, -3034.03, 79.7854, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+92, 181191, 0, 1633.33, -3033.08, 79.8429, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+93, 181192, 0, 1761.02, -2841.03, 71.8429, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+94, 181191, 0, 1767.81, -2866.3, 71.5783, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+95, 181191, 0, 1774.62, -2826.27, 69.0928, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+96, 181194, 0, 1775.91, -2849.46, 68.1006, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+97, 181192, 0, 1777.22, -2849.01, 68.127, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+98, 181192, 0, 1783.78, -2826.47, 69.0158, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+99, 181194, 0, 1784.67, -2826.46, 68.9567, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+100, 181192, 0, 1787.88, -2844.15, 67.7934, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+101, 181192, 0, 1792.49, -2845.07, 68.9933, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+102, 181191, 0, 1798.88, -2852.22, 68.3892, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+103, 181193, 0, 1800.54, -2830.87, 69.9442, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+104, 181192, 0, 1805.24, -2867.62, 67.8789, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+105, 181194, 0, 1806.21, -2867.52, 67.9099, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+106, 181194, 0, 1814.01, -2841.04, 72.0197, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+107, 181194, 0, 1821.46, -2826.06, 83.0323, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+108, 181192, 0, 1825.73, -2841.49, 77.7955, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+109, 181194, 0, 1826.08, -2840.09, 77.9095, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+110, 181194, 0, 1830.81, -2853.76, 82.9595, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+111, 181191, 0, 1906.72, -4772.17, 105.462, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+112, 181192, 0, 1919, -5145.38, 73.9771, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+113, 181192, 0, 1920.02, -4756.39, 99.2499, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+114, 181192, 0, 1920.29, -4757.25, 99.1512, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+115, 181191, 0, 1920.82, -4756.28, 98.998, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+116, 181192, 0, 1921.05, -4772.1, 100.649, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+117, 181194, 0, 1922.1, -4791.41, 103.396, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+118, 181191, 0, 1924.33, -4732.5, 101.178, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+119, 181193, 0, 1930.41, -5125.72, 100.938, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+120, 181191, 0, 1931.61, -4785.54, 99.6964, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+121, 181193, 0, 1932.6, -4784.9, 99.4538, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+122, 181191, 0, 1935.82, -4731, 100.673, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+123, 181192, 0, 1936.16, -5172.28, 73.6389, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+124, 181193, 0, 1938.05, -4745.25, 96.8655, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+125, 181194, 0, 1939.99, -5140.97, 73.6643, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+126, 181193, 0, 1940.62, -5146.29, 73.6236, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+127, 181191, 0, 1941.33, -3095.81, 85.892, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+128, 181191, 0, 1941.64, -3093.77, 85.4658, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+129, 181193, 0, 1942.18, -5099.56, 84.6481, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+130, 181192, 0, 1942.63, -3116.09, 89.4823, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+131, 181191, 0, 1944.42, -3116.68, 89.3527, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+132, 181192, 0, 1945.23, -4776.45, 98.3861, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+133, 181193, 0, 1945.48, -5109, 81.6221, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+134, 181192, 0, 1945.95, -5110.36, 81.0997, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+135, 181192, 0, 1946.93, -3069.19, 78.6248, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+136, 181192, 0, 1950.81, -5105.51, 83.3676, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+137, 181193, 0, 1953.76, -5166.41, 78.0603, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+138, 181193, 0, 1954.2, -4753, 97.0392, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+139, 181192, 0, 1954.51, -3122.99, 88.5028, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+140, 181194, 0, 1955.3, -4751.92, 96.864, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+141, 181194, 0, 1955.66, -3123.42, 88.0313, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+142, 181194, 0, 1956.29, -4724.43, 98.3988, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+143, 181193, 0, 1957.21, -3079.93, 79.2057, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+144, 181191, 0, 1959.67, -5139.13, 74.3765, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+145, 181191, 0, 1961.09, -4764.02, 97.6069, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+146, 181192, 0, 1962.15, -4763.61, 97.2999, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+147, 181192, 0, 1963.22, -5099.92, 85.679, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+148, 181191, 0, 1963.39, -4744.69, 96.1348, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+149, 181193, 0, 1966.58, -3128.49, 84.4406, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+150, 181193, 0, 1966.66, -5165.72, 78.4688, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+151, 181193, 0, 1966.66, -3105.85, 83.0617, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+152, 181193, 0, 1967.12, -5165.38, 78.2974, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+153, 181191, 0, 1969.54, -3082.61, 78.2019, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+154, 181193, 0, 1970.66, -3100.07, 82.4968, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+155, 181191, 0, 1971.77, -3122.4, 81.6347, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+156, 181191, 0, 1971.87, -5173.95, 80.2897, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+157, 181192, 0, 1974.99, -3108.66, 81.2376, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+158, 181192, 0, 1975.08, -3089.1, 80.0972, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+159, 181193, 0, 1975.42, -3109.73, 80.8529, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+160, 181194, 0, 1976.12, -5181.19, 79.6858, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+161, 181193, 0, 1979.31, -5107.51, 87.8338, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+162, 181191, 0, 1981.4, -3082.28, 76.7232, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+163, 181194, 0, 1984.65, -5138.32, 82.831, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+164, 181192, 0, 1988.23, -3099.97, 78.9845, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+165, 181192, 0, 2287.98, -4915.14, 97.5112, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+166, 181193, 0, 2289.23, -4915.06, 97.4164, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+167, 181191, 0, 2299, -4950.76, 77.8985, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+168, 181192, 0, 2303.79, -4910.37, 94.6176, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+169, 181192, 0, 2305.03, -4941.07, 80.2708, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+170, 181194, 0, 2305.68, -4927.74, 86.4454, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+171, 181193, 0, 2314.24, -4945.6, 78.1637, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+172, 181194, 0, 2315, -4921.65, 86.328, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+173, 181192, 0, 2315.1, -4945.22, 78.2012, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+174, 181194, 0, 2320.73, -4973.29, 72.4793, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+175, 181194, 0, 2321.23, -4972.05, 72.3983, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+176, 181192, 0, 2321.27, -4971.29, 72.3842, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+177, 181192, 0, 2325.87, -4923.38, 82.4325, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+178, 181191, 0, 2332.87, -4946.56, 73.514, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+179, 181191, 0, 2332.91, -4934.26, 77.6943, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+180, 181194, 0, 2333.7, -4935.03, 77.1431, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+181, 181192, 0, 2350.44, -4913.78, 74.405, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@EASTERN_PLAGUELANDS_GUID+182, 181193, 0, 2351.85, -4914.2, 74.3483, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9);
    
INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @EASTERN_PLAGUELANDS_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @EASTERN_PLAGUELANDS_GUID+1 AND @EASTERN_PLAGUELANDS_GUID+182;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@EASTERN_PLAGUELANDS_GUID+3, 16356, 0, 1966.54, -4717.01, 98.3666, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+4, 16356, 0, 1965.33, -5104.58, 84.9795, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+5, 16356, 0, 1965.17, -3119.4, 82.47, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+6, 16356, 0, 1961.65, -3086.94, 81.2841, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+7, 16356, 0, 1960.41, -5144.66, 74.0155, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+8, 16356, 0, 1960.3, -4754.93, 97.2724, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+9, 16356, 0, 1959.05, -5115.43, 80.9018, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+11, 16356, 0, 1967.54, -5156.13, 75.3015, 1.95477, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+12, 16356, 0, 1969.07, -3130.91, 84.8494, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+13, 16356, 0, 1970.84, -5116.75, 83.369, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+14, 16356, 0, 1971.79, -3107.76, 82.1643, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+15, 16356, 0, 1972.56, -5094.81, 87.8344, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+16, 16356, 0, 1972.73, -3093.22, 81.4991, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+17, 16356, 0, 1973.04, -5169.46, 79.5659, 4.06662, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+18, 16356, 0, 1973.19, -5143.4, 77.7543, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+19, 16356, 0, 1973.42, -3082.14, 77.2806, 1.09956, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+20, 16356, 0, 1957.9, -3125.03, 87.3232, 5.53269, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+21, 16356, 0, 1957.71, -5164.12, 78.0502, 1.85005, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+22, 16356, 0, 1957.29, -5095.38, 87.063, 5.81195, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+23, 16356, 0, 1941.83, -3111.62, 88.3198, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+24, 16356, 0, 1942.3, -4798.79, 99.2277, 1.85005, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+25, 16356, 0, 1942.91, -3099.65, 86.0871, 5.20108, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+26, 16356, 0, 1945.33, -4746.02, 96.7858, 5.20109, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+27, 16356, 0, 1945.81, -3120.04, 90.1894, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+28, 16356, 0, 1946.28, -5116.19, 79.0226, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+29, 16356, 0, 1946.92, -3085.17, 82.5324, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+30, 16356, 0, 1947.12, -5129.18, 74.6231, 5.20108, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+31, 16356, 0, 1947.14, -5142.58, 73.7133, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+32, 16356, 0, 1947.81, -3067.52, 78.5057, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+33, 16356, 0, 1948.49, -3130.42, 91.1517, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+34, 16356, 0, 1950.57, -5105.44, 83.4558, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+35, 16356, 0, 1951.62, -5182.88, 75.7269, 3.14159, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+36, 16356, 0, 1952.13, -4767.6, 98.859, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+37, 16356, 0, 1952.47, -5154.08, 74.4785, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+38, 16356, 0, 1953.1, -3115.71, 86.7831, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+39, 16356, 0, 1954.47, -3079.95, 79.4626, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+40, 16356, 0, 1976.3, -3117.37, 79.6319, 1.95477, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+41, 16356, 0, 1976.63, -4751.14, 95.7854, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+42, 16356, 0, 2304.92, -4950.09, 77.5079, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+43, 16356, 0, 2308.03, -4891.65, 96.8087, 1.95477, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+44, 16356, 0, 2317.52, -4917.48, 86.1716, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+45, 16356, 0, 2319.81, -4995.46, 73.668, 4.20625, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+46, 16356, 0, 2322.73, -4955.73, 74.6833, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+47, 16356, 0, 2325.54, -4973.26, 72.068, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+48, 16356, 0, 2328.11, -4937.05, 78.605, 5.20108, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+49, 16356, 0, 2333.36, -4921.62, 78.8639, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+50, 16356, 0, 2333.59, -4907.31, 79.932, 5.53269, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+51, 16356, 0, 2338.23, -4951.55, 72.1418, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+52, 16356, 0, 2342.1, -4966.08, 70.4122, 1.09956, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+53, 16356, 0, 2342.53, -4932.7, 74.7631, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+54, 16356, 0, 2348.67, -4913.01, 74.6708, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+55, 16356, 0, 2348.91, -4896.29, 78.0656, 1.37881, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+56, 16356, 0, 2353.36, -4948.53, 72.1315, 1.85005, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+57, 16356, 0, 2358.82, -4966.1, 70.6148, 2.80997, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+58, 16356, 0, 2362.78, -4922.81, 73.5862, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+59, 16356, 0, 2303.51, -4924.88, 88.2932, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+60, 16356, 0, 2300.33, -4909.28, 96.9081, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+61, 16356, 0, 1978.7, -5104.94, 88.0376, 1.09956, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+62, 16356, 0, 1979.44, -5155.38, 77.7833, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+63, 16356, 0, 1982.26, -3130.7, 82.4981, 1.37881, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+64, 16356, 0, 1983.41, -3107.48, 79.13, 1.85005, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+65, 16356, 0, 1985.02, -4733.8, 98.0468, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+66, 16356, 0, 1986.43, -5137.69, 83.5169, 1.37881, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+67, 16356, 0, 1987.22, -3089.93, 78.7242, 5.81195, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+68, 16356, 0, 1987.54, -3073.56, 75.334, 3.14159, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+69, 16356, 0, 1988.02, -4748.86, 97.1419, 5.97208, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+70, 16356, 0, 1993.22, -3117.53, 75.8745, 2.80997, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+73, 16356, 0, 1998.26, -3100.47, 76.1631, 4.06662, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+74, 16356, 0, 2287.74, -4912.95, 98.9361, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+75, 16356, 0, 2289.91, -4894.23, 105.882, 5.81195, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+76, 16356, 0, 2296.32, -4938.82, 82.8966, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+77, 16356, 0, 2297.14, -4990.14, 73.9808, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+78, 16356, 0, 2366.47, -4908.5, 76.7359, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+79, 16356, 0, 1571.33, -3029.47, 81.6105, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+80, 16356, 0, 1756.27, -2838.5, 71.8524, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+81, 16356, 0, 1764.52, -2853.84, 71.4485, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+82, 16356, 0, 1764.65, -2870.41, 73.6183, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+83, 16356, 0, 1770.04, -2833.66, 69.1137, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+84, 16356, 0, 1776.72, -2847.62, 68.0293, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+85, 16356, 0, 1776.73, -2862.17, 69.8869, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+86, 16356, 0, 1783.63, -2797.31, 69.6425, 4.06662, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+87, 16356, 0, 1784.81, -2827.16, 68.9084, 1.09956, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+88, 16356, 0, 1788.41, -2854.86, 69.5864, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+89, 16356, 0, 1789.62, -2811.81, 69.1659, 1.85005, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+90, 16356, 0, 1790, -2870, 69.488, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+91, 16356, 0, 1790.67, -2839.55, 67.9582, 5.20108, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+92, 16356, 0, 1796.8, -2883.29, 69.08, 5.81195, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+93, 16356, 0, 1800.43, -2858.79, 68.4132, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+94, 16356, 0, 1806.57, -2895.59, 71.0175, 3.14159, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+95, 16356, 0, 1807.25, -2871.81, 68.1865, 5.53269, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+96, 16356, 0, 1808.64, -2810.6, 71.4553, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+97, 16356, 0, 1754.28, -2822.62, 69.5536, 4.20625, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+98, 16356, 0, 1639.01, -3033.52, 80.0769, 1.37881, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+99, 16356, 0, 1573.15, -3015.96, 82.5453, 3.03684, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+100, 16356, 0, 1577.9, -3040.05, 80.2832, 5.53269, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+101, 16356, 0, 1585.47, -3047.95, 81.0597, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+102, 16356, 0, 1587.5, -3057.86, 80.5577, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+103, 16356, 0, 1588.02, -3035.67, 79.5394, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+104, 16356, 0, 1591.62, -3023.66, 79.6951, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+105, 16356, 0, 1596.86, -3051.43, 80.3504, 2.00713, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+106, 16356, 0, 1601.55, -3062.51, 79.5382, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+107, 16356, 0, 1609.52, -3080.49, 78.5546, 4.20625, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+108, 16356, 0, 1610.03, -3054.43, 77.6714, 2.23402, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+109, 16356, 0, 1612.26, -3020.53, 80.1317, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+110, 16356, 0, 1615.18, -3043.48, 77.9448, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+111, 16356, 0, 1616.92, -3032.24, 77.9181, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+112, 16356, 0, 1620.94, -3053.08, 78.5073, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+113, 16356, 0, 1625.65, -3040.63, 79.4046, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+114, 16356, 0, 1625.89, -3025.52, 78.6135, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+115, 16356, 0, 1627.02, -3068.68, 76.4933, 4.06662, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+116, 16356, 0, 1813.97, -2881.81, 70.605, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+117, 16356, 0, 1941.35, -4781.74, 98.7184, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+118, 16356, 0, 1925.22, -5146.31, 73.7998, 2.80997, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+119, 16356, 0, 1927.25, -3115.44, 89.5502, 4.20625, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+120, 16356, 0, 1927.37, -4775.64, 99.3061, 1.15499, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+121, 16356, 0, 1928.41, -4788.16, 101.161, 5.5327, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+122, 16356, 0, 1929.7, -4811.18, 106.314, 4.46804, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+123, 16356, 0, 1930.32, -3128.16, 92.3846, 3.03684, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+124, 16356, 0, 1932.12, -4738.85, 98.4199, 5.63741, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+125, 16356, 0, 1933.82, -3105.16, 87.6127, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+126, 16356, 0, 1934.48, -5106.6, 81.5771, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+127, 16356, 0, 1934.5, -3089.65, 85.2839, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+128, 16356, 0, 1936.21, -3078.9, 81.3924, 5.49779, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+129, 16356, 0, 1936.64, -5122.08, 77.2904, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+130, 16356, 0, 1937.51, -5136.48, 74.0787, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+131, 16356, 0, 1937.79, -5168.97, 73.8352, 0.226893, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+132, 16356, 0, 1937.89, -4727.84, 101.581, 6.24828, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+133, 16356, 0, 1938.22, -5153.89, 73.7006, 5.53269, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+134, 16356, 0, 1939.71, -5093.66, 85.3817, 4.20625, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+135, 16356, 0, 1923.5, -4796.78, 105.35, 1.09956, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+136, 16356, 0, 1922.56, -3092.55, 84.8936, 4.03171, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+137, 16356, 0, 1842.08, -2865.71, 83.0356, 2.80997, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+138, 16356, 0, 1836.86, -2846.55, 80.2934, 1.95477, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+139, 16356, 0, 1834.68, -2826.12, 80.1513, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+140, 16356, 0, 1832.86, -2799.42, 89.9933, 3.03684, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+141, 16356, 0, 1825.61, -2841.07, 77.8605, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+142, 16356, 0, 1824.64, -2815.49, 80.8515, 4.04917, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+143, 16356, 0, 1823.68, -2869.15, 72.6406, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+144, 16356, 0, 1818.12, -2792.36, 78.1475, 4.03171, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+145, 16356, 0, 1846.59, -2836.98, 78.5254, 1.37881, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+146, 16356, 0, 1900.38, -4771.46, 107.922, 1.88495, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+147, 16356, 0, 1921.88, -4755.47, 98.8025, 1.8675, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+148, 16356, 0, 1919.65, -4726.78, 103.351, 3.26377, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+149, 16356, 0, 1918.46, -5104.83, 78.6254, 3.03684, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+150, 16356, 0, 1916.43, -4800.17, 108.368, 3.94112, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+151, 16356, 0, 1914.86, -4768.54, 102.673, 0.715585, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+152, 16356, 0, 1910.36, -4804.91, 113.312, 3.23939, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+153, 16356, 0, 1908.37, -4756.09, 103.381, 1.95477, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+154, 16356, 0, 1901.73, -4804.16, 117.785, 5.81195, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+156, 16386, 0, 2233.62, -4933.13, 112.119, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+157, 16386, 0, 2006.85, -5044.05, 112.968, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+158, 16386, 0, 2000.8, -4824.39, 125.672, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+159, 16386, 0, 1900.86, -3088.09, 103.535, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+160, 16386, 0, 1792.28, -2899.8, 81.2749, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+161, 16386, 0, 1655.07, -3034.06, 91.5934, 2.60054, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+162, 16398, 0, 2148.52, -4933.43, 141.273, 4.10152, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+163, 16398, 0, 2060, -4967.85, 143.28, 4.10152, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+164, 16398, 0, 2057.19, -4887.02, 149.565, 4.10152, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+165, 16398, 0, 1833.31, -3066.72, 107.489, 4.10152, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+166, 16398, 0, 1776.76, -2966.79, 98.8574, 4.10152, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+167, 16398, 0, 1716.76, -3033.74, 108.011, 4.10152, 120, 120, 0, 0, 9),
    -- (@EASTERN_PLAGUELANDS_GUID+172, 16995, 0, 2014.55, -4934.52, 73.9846, 0.0698132, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+173, 16401, 0, 1766.67, -3033.34, 132.888, 5.18363, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+174, 16401, 0, 2101.69, -4930.03, 168.364, 1.0472, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+175, 16421, 0, 1766.67, -3033.34, 132.888, 5.18363, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+176, 16421, 0, 2101.69, -4930.03, 168.364, 1.0472, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+177, 16356, 0, 1635.26, -3052.03, 79.3638, 2.80997, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+178, 16356, 0, 1880.03, -4775.64, 118.908, 4.06662, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+179, 16356, 0, 1963.06, -4740.15, 96.6595, 0.506145, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+180, 16356, 0, 1983.9, -4803.06, 100.701, 3.14159, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+181, 16356, 0, 1997.14, -4768.31, 92.9923, 3.03684, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+182, 16356, 0, 1999.05, -4747.77, 96.9688, 4.03171, 120, 120, 0, 0, 9),
    (@EASTERN_PLAGUELANDS_GUID+183, 16356, 0, 2343.07, -4984.65, 71.8132, 4.06663, 120, 120, 0, 0, 9);

INSERT INTO `game_event_creature` SELECT creature.guid, @EASTERN_PLAGUELANDS_EVENT FROM `creature` WHERE creature.guid BETWEEN @EASTERN_PLAGUELANDS_GUID+1 AND @EASTERN_PLAGUELANDS_GUID+183;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`) VALUES
    (@BURNING_STEPPES_GUID+1, 181136, 0, -8399.82, -1246.03, 202.741, 1.37881, 0, 0, 0.636078, 0.771625, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+2, 181136, 0, -8371.14, -963.306, 191.002, 5.23599, 0, 0, -0.5, 0.866025, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+3, 181136, 0, -8032.02, -981.624, 122.643, 5.23599, 0, 0, -0.5, 0.866025, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+4, 181136, 0, -7981.87, -2433.27, 129.776, 0.733038, 0, 0, 0.358368, 0.933581, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+5, 181136, 0, -7732.86, -2232.79, 134.965, 1.37881, 0, 0, 0.636078, 0.771625, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+6, 181136, 0, -7603.63, -2596.44, 135.679, 1.37881, 0, 0, 0.636078, 0.771625, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+7, 181154, 0, -8232.78, -1099.86, 201.488, 5.18363, 0, 0, -0.522498, 0.852641, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+8, 181154, 0, -7733.71, -2432.74, 190.786, 2.67035, 0, 0, 0.972369, 0.233448, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+9, 181173, 0, -8412.98, -1248.38, 205.592, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+10, 181173, 0, -8408.04, -1234.03, 197.22, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+11, 181173, 0, -8403.73, -1258.55, 210.502, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+12, 181173, 0, -8391.57, -1236.6, 195.301, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+13, 181173, 0, -8384.43, -965.495, 192.449, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+14, 181173, 0, -8374.4, -976.698, 187.892, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+15, 181173, 0, -8373.36, -951.099, 196.14, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+16, 181173, 0, -8358.83, -972.333, 187.406, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+17, 181173, 0, -8356.23, -953.66, 191.819, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+18, 181173, 0, -8053.09, -988.775, 131.256, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+19, 181173, 0, -8043.76, -962.956, 132.977, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+20, 181173, 0, -8025.57, -1002.61, 122.94, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+21, 181173, 0, -8019.87, -966.035, 122.647, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+22, 181173, 0, -8009.05, -988.576, 128.328, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+23, 181173, 0, -7995.97, -2424.91, 128.912, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+24, 181173, 0, -7994.7, -2440.14, 131.838, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+25, 181173, 0, -7979.67, -2446.44, 131.103, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+26, 181173, 0, -7977.75, -2418.21, 126.65, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+27, 181173, 0, -7965.11, -2432.88, 126.468, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+28, 181173, 0, -7751.28, -2233.32, 133.5, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+29, 181173, 0, -7741.55, -2250.78, 134.744, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+30, 181173, 0, -7735.35, -2214.41, 133.439, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+31, 181173, 0, -7722.01, -2243.29, 138.13, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+32, 181173, 0, -7717.37, -2225.96, 135.464, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+33, 181173, 0, -7622.51, -2594.37, 132.082, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+34, 181173, 0, -7611.16, -2613.02, 133.458, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+35, 181173, 0, -7610.4, -2579.54, 132.969, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+36, 181173, 0, -7588.65, -2585.35, 137.826, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+37, 181173, 0, -7588.18, -2604.82, 137.333, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+38, 181174, 0, -8412.98, -1248.38, 205.592, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+39, 181174, 0, -8408.04, -1234.03, 197.22, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+40, 181174, 0, -8403.73, -1258.55, 210.502, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+41, 181174, 0, -8391.57, -1236.6, 195.301, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+42, 181174, 0, -8384.43, -965.495, 192.449, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+43, 181174, 0, -8374.4, -976.698, 187.892, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+44, 181174, 0, -8373.36, -951.099, 196.14, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+45, 181174, 0, -8358.83, -972.333, 187.406, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+46, 181174, 0, -8356.23, -953.66, 191.819, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+47, 181174, 0, -8053.09, -988.775, 131.256, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+48, 181174, 0, -8043.76, -962.956, 132.977, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+49, 181174, 0, -8025.57, -1002.61, 122.94, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+50, 181174, 0, -8019.87, -966.035, 122.647, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+51, 181174, 0, -8009.05, -988.576, 128.328, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+52, 181174, 0, -7995.97, -2424.91, 128.912, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+53, 181174, 0, -7994.7, -2440.14, 131.838, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+54, 181174, 0, -7979.67, -2446.44, 131.103, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+55, 181174, 0, -7977.75, -2418.21, 126.65, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+56, 181174, 0, -7965.11, -2432.88, 126.468, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+57, 181174, 0, -7751.28, -2233.32, 133.5, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+58, 181174, 0, -7741.55, -2250.78, 134.744, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+59, 181174, 0, -7735.35, -2214.41, 133.439, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+60, 181174, 0, -7722.01, -2243.29, 138.13, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+61, 181174, 0, -7717.37, -2225.96, 135.464, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+62, 181174, 0, -7622.51, -2594.37, 132.082, 3.07177, 0, 0, 0.999391, 0.0349061, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+63, 181174, 0, -7611.16, -2613.02, 133.458, 1.90241, 0, 0, 0.814116, 0.580703, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+64, 181174, 0, -7610.4, -2579.54, 132.969, 5.42798, 0, 0, -0.414693, 0.909962, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+65, 181174, 0, -7588.65, -2585.35, 137.826, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+66, 181174, 0, -7588.18, -2604.82, 137.333, 3.87463, 0, 0, -0.93358, 0.358368, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+67, 181191, 0, -8433.5, -1267.95, 218.048, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+68, 181191, 0, -8432.31, -1247.49, 211.001, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+69, 181194, 0, -8424.23, -1257.97, 213.001, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+70, 181193, 0, -8415.65, -1250.67, 207.519, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+71, 181192, 0, -8414.85, -1250.54, 207.285, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+72, 181194, 0, -8413.57, -1233.1, 197.218, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+73, 181194, 0, -8412.9, -1232.9, 196.897, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+74, 181191, 0, -8409.35, -1267.67, 215.369, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+75, 181193, 0, -8401.86, -1239.32, 198.169, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+76, 181192, 0, -8395.2, -949.871, 201.626, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+77, 181192, 0, -8392.18, -963.944, 194.59, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+78, 181194, 0, -8391.61, -1265.83, 210.55, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+79, 181192, 0, -8391.25, -1264.89, 210.08, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+80, 181191, 0, -8391.06, -964.633, 194.041, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+81, 181193, 0, -8390, -1221.27, 189.737, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+82, 181193, 0, -8380.72, -945.081, 200.524, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+83, 181193, 0, -8379.61, -944.807, 200.393, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+84, 181192, 0, -8379.32, -982.256, 187.678, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+85, 181194, 0, -8379.25, -1233.79, 193.823, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+86, 181192, 0, -8378.7, -981.541, 187.686, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+87, 181192, 0, -8378.61, -1234.11, 193.818, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+88, 181192, 0, -8377.69, -958.731, 193.846, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+89, 181192, 0, -8377.68, -982.149, 187.548, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+90, 181194, 0, -8366.26, -1279.55, 212.048, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+91, 181192, 0, -8366.14, -1277.8, 211.669, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+92, 181191, 0, -8364.4, -966.61, 189.125, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+93, 181194, 0, -8359.07, -930.49, 207.002, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+94, 181193, 0, -8358.67, -929.78, 207.349, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+95, 181191, 0, -8358.66, -947.965, 194.263, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+96, 181193, 0, -8357.6, -930.427, 207.274, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+97, 181192, 0, -8356.36, -982.168, 185.507, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+98, 181194, 0, -8354.97, -1255.32, 194.544, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+99, 181191, 0, -8353.58, -1256.07, 194.868, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+100, 181192, 0, -8353.23, -958.709, 189.964, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+101, 181192, 0, -8351.73, -959.321, 189.72, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+102, 181193, 0, -8351.62, -972.482, 186.748, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+103, 181194, 0, -8050.72, -996.258, 130.698, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+104, 181191, 0, -8050.55, -972.639, 132.138, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+105, 181194, 0, -8049.84, -997.107, 130.537, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+106, 181191, 0, -8049.32, -971.909, 131.784, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+107, 181192, 0, -8035.09, -960.794, 130.82, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+108, 181194, 0, -8034.57, -959.944, 131.149, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+109, 181192, 0, -8032.87, -1002.25, 122.634, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+110, 181191, 0, -8025.99, -970.899, 122.647, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+111, 181193, 0, -8023.52, -989.657, 122.647, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+112, 181192, 0, -8022.38, -988.255, 122.647, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+113, 181194, 0, -8022, -990.26, 122.647, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+114, 181192, 0, -8021.04, -1013.84, 128.752, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+115, 181193, 0, -8020.25, -1013.67, 128.933, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+116, 181192, 0, -8018.94, -2436.24, 127.586, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+117, 181191, 0, -8012.74, -2417.08, 125.16, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+118, 181193, 0, -8011.98, -2417.71, 125.316, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+119, 181192, 0, -8011.56, -2416.17, 124.975, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+120, 181194, 0, -8011.44, -955.784, 130.491, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+121, 181191, 0, -8011.15, -2453.95, 131.804, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+122, 181191, 0, -8010.96, -983.187, 127.41, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+123, 181191, 0, -8010.8, -2453.43, 131.654, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+124, 181193, 0, -8010.23, -981.925, 127.578, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+125, 181191, 0, -8001.2, -2435.98, 131.14, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+126, 181194, 0, -7995.82, -1002.28, 129.203, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+127, 181192, 0, -7989.55, -2420.37, 127.713, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+128, 181194, 0, -7989.18, -2421.23, 128.044, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+129, 181192, 0, -7987.15, -970.404, 128.898, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+130, 181192, 0, -7983.05, -2443.49, 131.162, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+131, 181191, 0, -7982.49, -2442.67, 130.99, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+132, 181191, 0, -7982.37, -2456.56, 132.788, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+133, 181193, 0, -7982.2, -2443.23, 131.006, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+134, 181194, 0, -7976.1, -2411.7, 125.535, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+135, 181192, 0, -7969.08, -2433.74, 127.042, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+136, 181193, 0, -7958.08, -2416.88, 126.889, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+137, 181193, 0, -7952.66, -2436.15, 127.879, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+138, 181194, 0, -7952.01, -2437.23, 128.365, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+139, 181193, 0, -7766.38, -2238.1, 133.528, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+140, 181194, 0, -7765.77, -2237.39, 133.541, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+141, 181191, 0, -7753.81, -2219.62, 133.439, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+142, 181193, 0, -7752.97, -2201.81, 133.439, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+143, 181193, 0, -7750.94, -2253.1, 133.596, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+144, 181192, 0, -7750.86, -2253.54, 133.605, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+145, 181192, 0, -7742.58, -2236.3, 134.159, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+146, 181192, 0, -7742.5, -2235.79, 134.134, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+147, 181193, 0, -7737.12, -2256.78, 135.901, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+148, 181193, 0, -7734.07, -2207.99, 133.439, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+149, 181191, 0, -7732.74, -2206.9, 133.439, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+150, 181192, 0, -7730.7, -2240.86, 136.298, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+151, 181192, 0, -7729.55, -2239.88, 136.404, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+152, 181191, 0, -7726.68, -2225.7, 134.645, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+153, 181193, 0, -7723.87, -2252.1, 138.787, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+154, 181194, 0, -7718.51, -2228.76, 135.882, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+155, 181192, 0, -7717.21, -2228.17, 135.888, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+156, 181191, 0, -7716.51, -2228.38, 135.988, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+157, 181193, 0, -7626.21, -2575.31, 132.021, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+158, 181194, 0, -7625.13, -2576.57, 131.763, 3.01941, 0, 0, 0.998135, 0.0610518, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+159, 181193, 0, -7624.22, -2602.45, 132.385, 5.37562, 0, 0, -0.438371, 0.898794, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+160, 181194, 0, -7623.63, -2603.38, 132.377, 0.453785, 0, 0, 0.224951, 0.97437, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+161, 181194, 0, -7623.44, -2604.28, 132.392, 2.58308, 0, 0, 0.961261, 0.27564, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+162, 181194, 0, -7608.6, -2612.26, 133.953, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+163, 181191, 0, -7608.54, -2613.28, 133.934, 3.64774, 0, 0, -0.968147, 0.250381, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+164, 181191, 0, -7607.81, -2587.44, 134.445, 5.07891, 0, 0, -0.566406, 0.824126, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+165, 181191, 0, -7607.79, -2629.18, 133.869, 2.44346, 0, 0, 0.939692, 0.342021, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+166, 181193, 0, -7598.04, -2604.17, 136.117, 4.86947, 0, 0, -0.649447, 0.760406, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+167, 181193, 0, -7596.82, -2566.68, 133.868, 5.51524, 0, 0, -0.374606, 0.927184, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+168, 181191, 0, -7595.88, -2566.53, 133.876, 4.79966, 0, 0, -0.67559, 0.737278, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+169, 181193, 0, -7591.88, -2620.63, 135.565, 1.32645, 0, 0, 0.615661, 0.788011, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+170, 181191, 0, -7589.27, -2583.24, 137.281, 0.523598, 0, 0, 0.258819, 0.965926, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+171, 181192, 0, -7588.9, -2607.11, 136.995, 1.44862, 0, 0, 0.66262, 0.748956, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+172, 181192, 0, -7588.44, -2582.06, 137.095, 4.31097, 0, 0, -0.833885, 0.551938, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+173, 181194, 0, -7587.87, -2607.69, 137.044, 3.05433, 0, 0, 0.999048, 0.0436193, 100, 1, 120, 120, 9),
    (@BURNING_STEPPES_GUID+174, 181193, 0, -7587.59, -2606.65, 137.194, 3.31614, 0, 0, -0.996194, 0.087165, 100, 1, 120, 120, 9);
    
INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @BURNING_STEPPES_EVENT FROM `gameobject` WHERE gameobject.guid BETWEEN @BURNING_STEPPES_GUID+1 AND @BURNING_STEPPES_GUID+174;

INSERT INTO creature (guid, id, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type, wander_distance, patch_min) VALUES
    (@BURNING_STEPPES_GUID+1, 16356, 0, -8000.75, -985.283, 127.825, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+2, 16356, 0, -7756.19, -2210.4, 133.609, 2.80997, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+3, 16356, 0, -7762.09, -2256.11, 133.522, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+4, 16356, 0, -7764.27, -2231.68, 134.763, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+5, 16356, 0, -7768.15, -2244.1, 133.522, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+6, 16356, 0, -7942.9, -2434.35, 130.081, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+7, 16356, 0, -7953.56, -2426.47, 126.483, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+8, 16356, 0, -7954.89, -2411.8, 126.7, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+9, 16356, 0, -7955.28, -2440.49, 129.066, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+10, 16356, 0, -7754.92, -2243.28, 133.559, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+11, 16356, 0, -7753.04, -2220.56, 133.522, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+12, 16356, 0, -7739.1, -2263.74, 135.584, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+13, 16356, 0, -7741.34, -2222.07, 133.522, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+14, 16356, 0, -7743.51, -2240.18, 134.333, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+15, 16356, 0, -7744.63, -2199.94, 133.522, 4.06662, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+16, 16356, 0, -7745.01, -2211.63, 133.522, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+17, 16356, 0, -7748.55, -2253.08, 133.889, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+18, 16356, 0, -7749.98, -2230.43, 133.549, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+19, 16356, 0, -7752.77, -2269.4, 133.522, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+20, 16356, 0, -7958.5, -2455.63, 133.389, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+21, 16356, 0, -7964.2, -2404.19, 125.886, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+22, 16356, 0, -7983.29, -2466.48, 133.952, 3.03684, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+23, 16356, 0, -7986.28, -996.667, 130.558, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+24, 16356, 0, -7989.67, -2411.44, 124.287, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+25, 16356, 0, -7990.3, -2455.1, 132.799, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+26, 16356, 0, -7995.75, -2420.87, 127.493, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+27, 16356, 0, -7995.8, -2432.08, 130.865, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+28, 16356, 0, -7996.59, -2444.02, 132.116, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+29, 16356, 0, -7996.63, -1013.41, 131.867, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+30, 16356, 0, -7982.83, -2444.96, 131.372, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+31, 16356, 0, -7982.13, -958.83, 130.196, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+32, 16356, 0, -7966.7, -2434.54, 126.773, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+33, 16356, 0, -7967, -2421.33, 126.912, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+34, 16356, 0, -7968.86, -2445.95, 129.784, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+35, 16356, 0, -7974.29, -2411.05, 125.853, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+36, 16356, 0, -7974.82, -2456, 132.592, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+37, 16356, 0, -7978.5, -980.081, 130.28, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+38, 16356, 0, -7981.53, -2400.69, 123.693, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+39, 16356, 0, -7981.67, -2421.34, 127.498, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+40, 16356, 0, -7736.6, -2248.45, 135.77, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+41, 16356, 0, -7732.98, -2200.64, 133.522, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+42, 16356, 0, -7732.21, -2213.26, 133.522, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+43, 16356, 0, -7599.6, -2557.68, 133.46, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+44, 16356, 0, -7601.51, -2575.6, 134.627, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+45, 16356, 0, -7606.8, -2629.2, 134.006, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+46, 16356, 0, -7607.12, -2613.97, 134.21, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+47, 16356, 0, -7609.75, -2643.94, 135.102, 3.14159, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+48, 16356, 0, -7613.49, -2583.94, 132.551, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+49, 16356, 0, -7614.09, -2569, 132.293, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+50, 16356, 0, -7614.49, -2605.03, 133.224, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+51, 16356, 0, -7596.23, -2607.85, 136.089, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+52, 16356, 0, -7595.52, -2620.74, 135.202, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+53, 16356, 0, -7574.27, -2597.62, 138.662, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+54, 16356, 0, -7578.33, -2584.39, 137.647, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+55, 16356, 0, -7583.83, -2611.54, 137.273, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+56, 16356, 0, -7584.07, -2624.76, 136.432, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+57, 16356, 0, -7586.65, -2571.02, 134.666, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+58, 16356, 0, -7587.62, -2596.89, 138.436, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+59, 16356, 0, -7591.38, -2586.37, 137.663, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+60, 16356, 0, -7593.19, -2637.25, 134.726, 4.03171, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+61, 16356, 0, -7617.49, -2618.51, 132.388, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+62, 16356, 0, -7619.34, -2632.74, 132.442, 2.80997, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+63, 16356, 0, -7714.18, -2242.01, 138.917, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+64, 16356, 0, -7716.08, -2231.63, 136.743, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+65, 16356, 0, -7720.22, -2210.86, 133.522, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+66, 16356, 0, -7720.99, -2198.35, 133.522, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+67, 16356, 0, -7722.57, -2222.69, 134.566, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+68, 16356, 0, -7724.87, -2251.59, 138.604, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+69, 16356, 0, -7726.67, -2240.58, 137.086, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+70, 16356, 0, -7726.86, -2266.75, 139.26, 3.14159, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+71, 16356, 0, -7713.89, -2254.8, 140.417, 4.03171, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+72, 16356, 0, -7710.2, -2220.98, 135.435, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+73, 16356, 0, -7623.71, -2594.94, 132.243, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+74, 16356, 0, -7626.99, -2580.78, 132.126, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+75, 16356, 0, -7627.43, -2608.99, 132.801, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+76, 16356, 0, -7628.49, -2566.81, 133.167, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+77, 16356, 0, -7637.5, -2596.85, 133.659, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+78, 16356, 0, -7639.9, -2581.16, 133.687, 4.06662, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+79, 16356, 0, -7640.81, -2611.35, 134.295, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+80, 16356, 0, -7703.33, -2233.25, 138.695, 3.03684, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+81, 16356, 0, -7573.04, -2570.58, 135.373, 3.03684, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+82, 16356, 0, -8002.21, -959.982, 128.742, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+83, 16356, 0, -8434.59, -1251.75, 212.887, 3.14159, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+84, 16356, 0, -8385.5, -1216.21, 188.255, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+85, 16356, 0, -8387.62, -972.728, 190.48, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+86, 16356, 0, -8387.81, -1228.66, 190.961, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+87, 16356, 0, -8388.02, -984.879, 188.321, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+88, 16356, 0, -8389.59, -1238.51, 196.46, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+89, 16356, 0, -8393.72, -1254.68, 206.65, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+90, 16356, 0, -8393.84, -1264.77, 210.899, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+91, 16356, 0, -8397.75, -960.193, 197.608, 5.49779, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+92, 16356, 0, -8385.35, -959.903, 194.977, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+93, 16356, 0, -8384.74, -1274.93, 211.92, 4.06662, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+94, 16356, 0, -8374.22, -1288.5, 214.244, 4.03171, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+95, 16356, 0, -8374.31, -974.651, 188.325, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+96, 16356, 0, -8376.08, -989.427, 187.287, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+97, 16356, 0, -8376.3, -1242.36, 194.958, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+98, 16356, 0, -8379.6, -949.735, 198.216, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+99, 16356, 0, -8381.1, -1261.64, 204.694, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+100, 16356, 0, -8383.28, -939.714, 203.698, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+101, 16356, 0, -8383.68, -1250.24, 200.656, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+102, 16356, 0, -8398.03, -1215.75, 189.571, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+103, 16356, 0, -8398.1, -945.571, 204.354, 4.06662, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+104, 16356, 0, -8411.97, -1259.67, 212.583, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+105, 16356, 0, -8412.83, -1223.1, 192.778, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+106, 16356, 0, -8416.66, -1268.47, 217.223, 2.80997, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+107, 16356, 0, -8417.09, -1242.56, 202.798, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+108, 16356, 0, -8417.78, -982.665, 193.693, 3.14159, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+109, 16356, 0, -8420.82, -1250.93, 208.61, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+110, 16356, 0, -8422.15, -1230.22, 201.935, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+111, 16356, 0, -8430.69, -1236.92, 209.005, 0.226893, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+112, 16356, 0, -8411.01, -966.88, 197.595, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+113, 16356, 0, -8410.35, -950.937, 204.729, 3.03684, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+114, 16356, 0, -8399.72, -1231.35, 194.753, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+115, 16356, 0, -8401.44, -974.976, 192.589, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+116, 16356, 0, -8402.34, -1258.13, 210.17, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+117, 16356, 0, -8403.62, -990.62, 189.168, 2.80997, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+118, 16356, 0, -8405.25, -1270.55, 215.192, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+119, 16356, 0, -8406.53, -1011.18, 187.62, 4.03171, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+120, 16356, 0, -8408.37, -1251.06, 206.726, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+121, 16356, 0, -8410.06, -1236.7, 198.685, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+122, 16356, 0, -8372.71, -1228.52, 191.559, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+123, 16356, 0, -8371.14, -940.599, 200.466, 1.09956, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+124, 16356, 0, -8008.24, -2411.38, 124.142, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+125, 16356, 0, -8021.97, -2447.23, 128.728, 3.14159, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+126, 16356, 0, -8023.47, -996.543, 122.887, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+127, 16356, 0, -8032.22, -1009.51, 122.717, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+128, 16356, 0, -8033.76, -958.735, 131.688, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+129, 16356, 0, -8035.43, -946.744, 134.689, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+130, 16356, 0, -8044.14, -994.623, 129.837, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+131, 16356, 0, -8044.6, -1019.05, 122.717, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+132, 16356, 0, -8047.01, -962.325, 133.982, 4.04917, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+133, 16356, 0, -8021.12, -2433.45, 127.165, 4.06662, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+134, 16356, 0, -8020.13, -984.429, 122.73, 5.20108, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+135, 16356, 0, -8008.86, -2426.77, 127.948, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+136, 16356, 0, -8009.85, -2439.8, 129.72, 6.24828, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+137, 16356, 0, -8011.34, -2452.43, 131.309, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+138, 16356, 0, -8016.62, -950.324, 132.549, 3.26377, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+139, 16356, 0, -8018.83, -972.995, 122.73, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+140, 16356, 0, -8019.33, -2405.6, 124.062, 4.03171, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+141, 16356, 0, -8019.44, -1026.2, 130.085, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+142, 16356, 0, -8019.59, -2417.85, 125.19, 2.80997, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+143, 16356, 0, -8047.03, -1037.13, 122.743, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+144, 16356, 0, -8053.54, -977.332, 132.213, 2.23402, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+145, 16356, 0, -8357.42, -941.79, 196.902, 1.85005, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+146, 16356, 0, -8358.7, -1274.18, 212.731, 3.03684, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+147, 16356, 0, -8359.42, -992.785, 185.469, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+148, 16356, 0, -8361.33, -1242.17, 191.948, 4.20625, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+149, 16356, 0, -8362.64, -977.057, 187.058, 5.63741, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+150, 16356, 0, -8366.68, -950.877, 194.8, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+151, 16356, 0, -8369.19, -1256.53, 197.905, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+152, 16356, 0, -8371.06, -927.954, 206.34, 5.81195, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+153, 16356, 0, -8356.6, -966.806, 188.383, 1.8675, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+154, 16356, 0, -8354.76, -925.623, 207.732, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+155, 16356, 0, -8350.88, -954.868, 191.154, 0.715585, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+156, 16356, 0, -8058, -1007.02, 130.824, 1.88495, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+157, 16356, 0, -8058.14, -994.36, 131.377, 2.00713, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+158, 16356, 0, -8070.64, -997.174, 132.958, 0.506145, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+159, 16356, 0, -8078.88, -1017.77, 132.302, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+160, 16356, 0, -8333.76, -976.666, 184.352, 1.37881, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+161, 16356, 0, -8340.74, -963.852, 188.287, 5.53269, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+162, 16356, 0, -8347.13, -990.8, 183.778, 4.46804, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+163, 16356, 0, -8349.12, -977.729, 185.528, 1.95477, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+164, 16386, 0, -7647.04, -2547.52, 151.049, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+165, 16386, 0, -7733.57, -2299.61, 157.64, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+166, 16386, 0, -7899.5, -2433.15, 153.734, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+167, 16386, 0, -8100.71, -1033.66, 158.131, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+168, 16386, 0, -8320.97, -1001.09, 193.758, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+169, 16386, 0, -8333.14, -1217.13, 197.564, 2.60054, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+170, 16398, 0, -7693.2, -2489.52, 187.512, 4.10152, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+171, 16398, 0, -7733.7, -2366.28, 173.029, 4.10152, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+172, 16398, 0, -7816.48, -2433.53, 177.415, 4.10152, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+173, 16398, 0, -8177.04, -1073.41, 180.32, 4.10152, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+174, 16398, 0, -8266.16, -1067.22, 193.666, 4.10152, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+175, 16398, 0, -8267.19, -1166.55, 195.599, 4.10152, 120, 120, 0, 0, 9),
    -- (@BURNING_STEPPES_GUID+176, 16995, 0, -8229.53, -1118.11, 144.012, 6.17846, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+177, 16401, 0, -8232.78, -1099.86, 201.572, 5.18363, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+178, 16401, 0, -7733.71, -2432.74, 190.869, 2.67035, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+179, 16421, 0, -8232.78, -1099.86, 201.572, 5.18363, 120, 120, 0, 0, 9),
    (@BURNING_STEPPES_GUID+180, 16421, 0, -7733.71, -2432.74, 190.869, 2.67035, 120, 120, 0, 0, 9);
    
INSERT INTO `game_event_creature` SELECT creature.guid, @BURNING_STEPPES_EVENT FROM `creature` WHERE creature.guid BETWEEN @BURNING_STEPPES_GUID+1 AND @BURNING_STEPPES_GUID+180;

-- =============================================
-- Dungeon Bosses
-- =============================================

-- Prepare
UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_id4`=0, `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (14684, 14695, 14690, 14693, 14682, 14686, 4543);

-- Balzaphon
-- todo: spells not sniffed: cone of cold: 12557, 12611, 15244, 20828, 22746, 30095 Fear: 26580?
UPDATE `creature_template` SET `faction`=21, `unit_flags`=64, `auras`='28126', `dmg_min`=418, `dmg_max`=481 WHERE `entry`=14684;
UPDATE `creature` SET `position_x`=3733.27, `position_y`=-3480.11, `position_z`=131.04, `orientation`=3.05433 WHERE `guid`=2354;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146840, 'Stratholme - Balzaphon', 16799, 100, 1, 0, 0, 0, 2, 5, 2, 5, 0, 8398, 100, 4, 0, 0, 0, 2, 16, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Lord Blackwood
UPDATE `creature_template` SET `faction`=21, `dmg_min`=674, `dmg_max`=776, `auras`='28126', `spell_list_id`=146950, `ai_name`='' WHERE `entry`=14695;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146950, 'Scholomance - Lord Blackwood', 16496, 100, 4, 0, 0, 0, 3, 25, 3, 25, 0, 7964, 100, 1, 0, 0, 0, 2, 20, 20, 20, 0, 20733, 100, 1, 0, 0, 0, 2, 20, 20, 20, 0, 21390, 100, 4, 0, 0, 0, 2, 10, 10, 10, 0, 11972, 100, 1, 0, 0, 66, 2, 10, 5, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature` SET `position_x`=200.201, `position_y`=150.839, `position_z`=109.879, `orientation`=5.06145, `movement_type`=2 WHERE `guid`=2353;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
    (2353, 1, 248.659, 153.031, 109.788, 100),
    (2353, 2, 200.116, 150.961, 109.909, 100),
    (2353, 3, 199.948, 127.819, 109.922, 100),
    (2353, 4, 200.223, 151.043, 109.91, 100),
    (2353, 5, 174.822, 152.469, 109.696, 100),
    (2353, 6, 199.917, 151.078, 109.908, 100),
    (2353, 7, 224.709, 133.206, 109.722, 100),
    (2353, 8, 200.7, 151.368, 109.915, 100),
    (2353, 9, 222.267, 166.311, 109.784, 100),
    (2353, 10, 222.267, 166.311, 109.784, 100),
    (2353, 11, 200.7, 151.368, 109.915, 100),
    (2353, 12, 224.709, 133.206, 109.722, 100),
    (2353, 13, 199.917, 151.078, 109.908, 100),
    (2353, 14, 174.822, 152.469, 109.696, 100),
    (2353, 15, 200.223, 151.043, 109.91, 100),
    (2353, 16, 199.948, 127.819, 109.922, 100),
    (2353, 17, 200.116, 150.961, 109.909, 100);

-- Revanchion
UPDATE `creature_template` SET `display_scale1`=0, `faction`=21, `armor`=3795, `dmg_min`=837, `dmg_max`=962, `dmg_multiplier`=1, `speed_walk`=1.11111, `unit_flags`=64, `auras`='28126 16331 12556', `ai_name`='' WHERE `entry`=14690;
UPDATE `creature` SET `position_x`=-112.776, `position_y`=583.823, `position_z`=-3.47887, `orientation`=5.60251 WHERE `guid`=2352;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146900, 'Dire Maul - Revanchion', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14907, 100, 1, 0, 0, 0, 5, 33, 33, 33, 0, 15245, 100, 1, 0, 0, 0, 5, 16, 16, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Scorn: https://www.youtube.com/watch?v=wJ5nSn94wN0
UPDATE `creature_template` SET `display_scale1`=0, `faction`=21, `unit_flags`=64, `dmg_min`=240, `dmg_max`=273, `spell_list_id`=146930, `auras`='28126', `movement_type`=2, `ai_name`='' WHERE `entry`=14693;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146930, 'Scarlet Monastery - Scorn', 22643, 100, 1, 0, 0, 64, 0, 3, 3, 10, 0, 17165, 100, 4, 0, 0, 0, 0, 5, 14, 40, 0, 15531, 100, 1, 0, 0, 0, 0, 5, 12, 20, 0, 28873, 100, 1, 0, 0, 0, 0, 5, 17, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid`=2350;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
    (14693, 1, 1796.82, 1219.18, 18.2921, 100),
    (14693, 2, 1797.05, 1255.55, 18.4921, 100),
    (14693, 3, 1796.59, 1293.25, 18.6921, 100),
    (14693, 4, 1795.52, 1313.36, 18.816, 100),
    (14693, 5, 1788.83, 1324.41, 19.0199, 100),
    (14693, 6, 1789.98, 1351.44, 18.9087, 100),
    (14693, 7, 1798.52, 1381.8, 18.8921, 100),
    (14693, 8, 1803.86, 1350.71, 18.9157, 100),
    (14693, 9, 1805.17, 1324.8, 19.1097, 100),
    (14693, 10, 1798.9, 1313.85, 18.8076, 100),
    (14693, 11, 1798.07, 1293.78, 18.6921, 100),
    (14693, 12, 1797.58, 1255.6, 18.4921, 100),
    (14693, 13, 1798.01, 1219.71, 18.2921, 100),
    (14693, 14, 1797.58, 1255.6, 18.4921, 100),
    (14693, 15, 1798.07, 1293.78, 18.6921, 100),
    (14693, 16, 1798.9, 1313.85, 18.8076, 100),
    (14693, 17, 1805.14, 1324.75, 19.0921, 100),
    (14693, 18, 1803.86, 1350.71, 18.9157, 100),
    (14693, 19, 1798.52, 1381.8, 18.8921, 100),
    (14693, 20, 1789.98, 1351.44, 18.9087, 100),
    (14693, 21, 1788.83, 1324.41, 19.0199, 100),
    (14693, 22, 1795.52, 1313.36, 18.816, 100),
    (14693, 23, 1796.59, 1293.25, 18.6921, 100),
    (14693, 24, 1797.05, 1255.55, 18.4921, 100);
    
-- Bloodmage Thalnos https://www.youtube.com/watch?v=7tB7oZNkiEU
DELETE FROM `creature_ai_events` WHERE `creature_id`=4543;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (454301, 4543, 0, 6, 0, 100, 0, 0, 0, 0, 0, 454301, 0, 0, 'Bloodmage Thalnos - Summon Scorn on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (454302, 4543, 0, 2, 0, 100, 0, 50, 1, 0, 0, 454302, 0, 0, 'Bloodmage Thalnos - Yell Text at 50% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (454303, 4543, 0, 5, 0, 100, 1, 10000, 10000, 0, 0, 454303, 0, 0, 'Bloodmage Thalnos - Yell Text on Killed Unit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (454304, 4543, 0, 4, 0, 100, 0, 0, 0, 0, 0, 454304, 0, 0, 'Bloodmage Thalnos - Yell Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=454301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454301, 0, 10, 14693, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1798.01, 1223.17, 18.274, 4.71161, 14693, 'Bloodmage Thalnos - Summon Scorn');
DELETE FROM `creature_ai_scripts` WHERE `id`=454302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6202, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Yell Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=454303;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6203, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Yell Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=454304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6201, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Yell Text');
UPDATE `creature_template` SET `mana_min`=2518, `mana_max`=2518, `dmg_min`=74, `dmg_max`=97, `spell_list_id`=45430 WHERE `entry`=4543;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (45430, 'Scarlet Monastery - Bloodmage Thalnos', 8053, 100, 1, 0, 0, 0, 0, 16, 16, 60, 0, 8814, 100, 4, 0, 0, 0, 0, 8, 8, 16, 0, 9613, 100, 1, 0, 0, 12, 0, 3, 3, 5, 0, 12470, 100, 4, 0, 0, 64, 0, 9, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (14693, 12, 17, 0, 0, 0, 0);
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6201;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6202;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=6203;

-- Sever
DELETE FROM `creature_ai_events` WHERE `creature_id`=14682;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1468202, 14682, 0, 2, 0, 100, 0, 30, 1, 0, 0, 1468202, 0, 0, 'Sever - Enrage at 30% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=1468202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468202, 0, 15, 8269, 35, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sever - Cast Spell Enrage');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2384, 0, 0, 0, 0, 0, 0, 0, 0, 'Sever - Say Emoted Text');
UPDATE `creature_template` SET `level_min`=25, `level_max`=25, `health_min`=6291, `health_max`=6291, `armor`=1026, `faction`=21, `unit_flags`=64, `dmg_min`=193, `dmg_max`=271, `display_scale1`=0, `dmg_multiplier`=1, `auras`='28126', `movement_type`=0 WHERE `entry`=14682;
UPDATE `creature` SET `position_x`=-225.131, `position_y`=2302.95, `position_z`=94.7599, `orientation`=6.02139, `movement_type`=0 WHERE `guid`=2349;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146820, 'Shadowfang Keep - Sever', 16508, 100, 1, 0, 0, 0, 5, 20, 30, 60, 0, 17745, 100, 1, 0, 0, 0, 0, 5, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Lady Falther'ess: https://youtu.be/FAiC1wwQCuc?t=104
DELETE FROM `creature_ai_events` WHERE `creature_id`=14686;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1468601, 14686, 85, 10, 0, 100, 1, 2, 10, 1, 1, 1468601, 0, 0, 'Lady Falther\'ess - Transform on Unit in LoS');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1468602, 14686, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1468602, 0, 0, 'Lady Falther\'ess - Remove Spirit Particles Aura on Reached Home');
DELETE FROM `creature_ai_scripts` WHERE `id`=1468601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468601, 0, 15, 28126, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther\'ess - Cast Spell Spirit Particles (purple)');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468601, 0, 14, 28533, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther\'ess - Remove Aura Transform');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468601, 0, 22, 21, 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther\'ess - Set Faction');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12429, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther\'ess - Yell Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1468602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1468602, 0, 14, 28126, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther\'ess - Remove Aura Spirit Particles (purple)');
UPDATE `creature_template` SET `display_scale1`=0, `dmg_min`=282, `dmg_max`=323, `level_min`=40, `level_max`=40, `health_min`=9808, `health_max`=9808, `mana_min`=5132, `mana_max`=5132, `faction`=35, `speed_walk`=1, `unit_flags`=64, `auras`='28533', `movement_type`=0 WHERE `entry`=14686;
UPDATE `creature` SET `position_x`=2583.18, `position_y`=695.861, `position_z`=56.8033, `orientation`=1.8675, `movement_type`=0 WHERE `guid`=2351;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (146860, 'Razorfen Downs - Lady Falther\'ess', 16838, 100, 1, 0, 0, 0, 0, 20, 20, 20, 0, 17105, 100, 1, 0, 0, 0, 0, 30, 12, 30, 0, 22743, 100, 4, 0, 0, 0, 0, 25, 5, 25, 0, 7645, 100, 4, 0, 0, 0, 10, 30, 30, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=12429;

-- =============================================
-- City Attacks
-- =============================================

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
    (3319, 16, 16394, 0, 0, 0, 2),
    (3320, 16, 16382, 0, 0, 0, 2),
    (3321, 16, 16383, 0, 0, 0, 2),
    (3322, -2, 3319, 3320, 3321, 0, 0);

UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` IN (15766, 4549);

-- Events list for Renato Gallina
DELETE FROM `creature_ai_events` WHERE `creature_id`=1432;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (143201, 1432, 458, 10, 0, 100, 1, 2, 50, 3000, 3000, 143201, 0, 0, 'Renato Gallina - Cast Love Aura and Add Gossip Flag on Player in LoS');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (143202, 1432, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 143202, 143203, 0, 'Renato Gallina - Yell Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=3001078;
DELETE FROM `creature_ai_scripts` WHERE `id`=143201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (143201, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Renato Gallina - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (143201, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Renato Gallina - Add Flag 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=143202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (143202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12366, 12367, 12368, 12369, 0, 0, 0, 0, 0, 'Renato Gallina - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=143203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (143203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12370, 12371, 12372, 12373, 0, 0, 0, 0, 0, 'Renato Gallina - Say Text');

-- Events list for Officer Maloof
DELETE FROM `creature_ai_events` WHERE `creature_id`=15766;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1576601, 15766, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 1576601, 1576602, 0, 'Officer Maloof - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=1576601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1576601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12366, 12367, 12368, 12369, 0, 0, 0, 0, 0, 'Officer Maloof - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1576602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1576602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12370, 12371, 12372, 12373, 0, 0, 0, 0, 0, 'Officer Maloof - Say Text');

-- Events list for Stephanie Turner
DELETE FROM `creature_ai_events` WHERE `creature_id`=6174;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (617401, 6174, 458, 10, 0, 100, 1, 2, 50, 3000, 3000, 617401, 0, 0, 'Stephanie Turner - Cast Love Aura and Add Gossip Flag on Player in LoS');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (617402, 6174, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 617402, 617403, 0, 'Stephanie Turner - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=3001592;
DELETE FROM `creature_ai_scripts` WHERE `id`=617401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (617401, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stephanie Turner - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (617401, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stephanie Turner - Add Flag 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=617402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (617402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12366, 12367, 12368, 12369, 0, 0, 0, 0, 0, 'Stephanie Turner - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=617403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (617403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12370, 12371, 12372, 12373, 0, 0, 0, 0, 0, 'Stephanie Turner - Say Text');

-- Events list for Thomas Miller
DELETE FROM `creature_ai_events` WHERE `creature_id`=3518;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (351801, 3518, 0, 1, 0, 100, 1, 20000, 45000, 20000, 45000, 351801, 0, 0, 'Thomas Miller - Say Text OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (351802, 3518, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 351802, 351803, 0, 'Thomas Miller - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=351802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12366, 12367, 12368, 12369, 0, 0, 0, 0, 0, 'Thomas Miller - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=351803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12370, 12371, 12372, 12373, 0, 0, 0, 0, 0, 'Thomas Miller - Say Text');

-- Events list for Michael Garrett
DELETE FROM `creature_ai_events` WHERE `creature_id`=4551;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (455101, 4551, 0, 4, 0, 100, 0, 0, 0, 0, 0, 455101, 0, 0, 'Michael Garrett - Summon Enraged Felbat on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (455102, 4551, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 455102, 455103, 0, 'Michael Garrett - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=455102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (455102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12355, 12356, 12357, 12358, 0, 0, 0, 0, 0, 'Michael Garret - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=455103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (455103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12359, 12360, 12361, 12362, 0, 0, 0, 0, 0, 'Michael Garret - Say Text');

-- Events list for Hannah Akeley
DELETE FROM `creature_ai_events` WHERE `creature_id`=4575;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (457501, 4575, 458, 10, 0, 100, 1, 2, 50, 3000, 3000, 457501, 0, 0, 'Hannah Akeley - Cast Love Aura and Add Gossip Flag on Player in LoS');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (457502, 4575, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 457502, 457503, 0, 'Hannah Akeley - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=3001347;
DELETE FROM `creature_ai_scripts` WHERE `id`=457501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (457501, 0, 15, 27741, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hannah Akeley - Cast Spell Love is in the Air');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (457501, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hannah Akeley - Add Flag 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=457502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (457502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12355, 12356, 12357, 12358, 0, 0, 0, 0, 0, 'Hannah Akeley - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=457503;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (457503, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12359, 12360, 12361, 12362, 0, 0, 0, 0, 0, 'Hannah Akeley - Say Text');

-- Events list for Innkeeper Norman
DELETE FROM `creature_ai_events` WHERE `creature_id`=6741;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (674101, 6741, 3696, 22, 0, 100, 1, 22, 0, 0, 0, 674101, 0, 0, 'Innkeeper Norman - Emote and Gives Quest Credit on Received Emote');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (674102, 6741, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 674102, 674103, 0, 'Innkeeper Norman - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=674102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (674102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12355, 12356, 12357, 12358, 0, 0, 0, 0, 0, 'Innkeeper Norman - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=674103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (674103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12359, 12360, 12361, 12362, 0, 0, 0, 0, 0, 'Innkeeper Norman - Say Text');

-- Events list for William Montague
DELETE FROM `creature_ai_events` WHERE `creature_id`=4549;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (454901, 4549, 3322, 10, 0, 100, 3, 0, 50, 10000, 90000, 454901, 454902, 0, 'William Montague - Say Text on Pallid Horror or Flameshocker in LOS');
DELETE FROM `creature_ai_scripts` WHERE `id`=454901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12355, 12356, 12357, 12358, 0, 0, 0, 0, 0, 'William Montague - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=454902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (454902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12359, 12360, 12361, 12362, 0, 0, 0, 0, 0, 'William Montague - Say Text');

-- Undercity Trade Quarter
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
    (149701, 1, 1660.98, 257.238, -62.1777, 100, 0, 0, 0),
    (149701, 2, 1659.01, 234.474, -62.1776, 100, 0, 0, 149711),
    (149701, 3, 1657.83, 213.584, -62.179, 100, 0, 0, 0),
    (149701, 4, 1643.68, 189.256, -62.1817, 100, 0, 0, 0),
    (149701, 5, 1614.92, 175.086, -62.1779, 100, 0, 0, 0),
    (149701, 6, 1582.18, 171.914, -62.1777, 100, 0, 0, 0),
    (149701, 7, 1554.78, 185.782, -62.1812, 100, 0, 0, 0),
    (149701, 8, 1555.19, 199.377, -60.7729, 100, 0, 0, 0),
    (149701, 9, 1572.48, 216.876, -58.8445, 100, 0, 0, 149712),
    (149701, 10, 1583.42, 229.032, -62.0874, 100, 0, 0, 0),
    (149701, 11, 1579.97, 239.346, -62.0773, 100, 0, 0, 0),
    (149701, 12, 1593.38, 260.254, -57.1617, 100, 0, 0, 0),
    (149701, 13, 1595.97, 250.856, -52.3559, 100, 0, 0, 0),
    (149701, 14, 1603.33, 248.817, -52.1495, 100, 0, 0, 0),
    (149701, 15, 1629.47, 238.688, -43.1705, 100, 0, 0, 0),
    (149701, 16, 1632.91, 233.36, -43.1027, 100, 0, 0, 0),
    (149701, 17, 1608.15, 202.839, -43.1027, 100, 0, 0, 0),
    (149701, 18, 1581.31, 204.956, -43.1025, 100, 0, 0, 0),
    (149701, 19, 1560.33, 225.354, -43.1026, 100, 0, 0, 0),
    (149701, 20, 1558.61, 241.44, -43.1027, 100, 0, 0, 0),
    (149701, 21, 1561.27, 255.781, -43.1027, 100, 0, 0, 0),
    (149701, 22, 1568.61, 264.061, -43.1027, 100, 0, 0, 0),
    (149701, 23, 1578.92, 273.572, -43.1027, 100, 0, 0, 0),
    (149701, 24, 1585.38, 276.608, -43.1027, 100, 0, 0, 0),
    (149701, 25, 1605.34, 276.451, -43.1027, 100, 0, 0, 149713);

-- Undercity Royal Quarter
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
    (149702, 1, 1596.72, 423.488, -46.3713, 100, 0, 0, 149720),
    (149702, 2, 1603.8, 423.409, -46.3814, 100, 0, 0, 0),
    (149702, 3, 1615.01, 423.43, -53.2855, 100, 0, 0, 0),
    (149702, 4, 1630.79, 417.648, -62.1775, 100, 0, 0, 0),
    (149702, 5, 1642.62, 413.764, -61.6205, 100, 0, 0, 0),
    (149702, 6, 1663.95, 406.928, -62.2001, 100, 0, 0, 0),
    (149702, 7, 1679.64, 402.133, -62.2674, 100, 0, 0, 0),
    (149702, 8, 1693.81, 396.803, -62.2956, 100, 0, 0, 0),
    (149702, 9, 1703.9, 384.448, -62.2338, 100, 0, 0, 0),
    (149702, 10, 1716.81, 374.437, -60.4845, 100, 0, 0, 0),
    (149702, 11, 1725.09, 361.466, -60.4561, 100, 0, 0, 0),
    (149702, 12, 1734.98, 346.717, -55.3936, 100, 0, 0, 0),
    (149702, 13, 1720.8, 335.518, -49.0941, 100, 0, 0, 0),
    (149702, 14, 1706.42, 324.186, -55.3923, 100, 0, 0, 0),
    (149702, 15, 1715.06, 313.223, -60.4836, 100, 0, 0, 0),
    (149702, 16, 1722.2, 293.859, -62.1816, 100, 0, 0, 0),
    (149702, 17, 1726.99, 277.646, -61.6201, 100, 0, 0, 0),
    (149702, 18, 1731.56, 258.869, -62.1777, 100, 0, 0, 0),
    (149702, 19, 1730.53, 236.534, -62.1777, 100, 0, 0, 149721),
    (149702, 20, 1730.45, 221.129, -62.1777, 100, 0, 0, 0),
    (149702, 21, 1727.79, 206.641, -61.6201, 100, 0, 0, 0),
    (149702, 22, 1721.55, 192.245, -62.1567, 100, 0, 0, 0),
    (149702, 23, 1710.23, 174.474, -60.748, 100, 0, 0, 0),
    (149702, 24, 1703.03, 162.592, -60.7572, 100, 0, 0, 0),
    (149702, 25, 1703.7, 151.978, -60.4547, 100, 0, 0, 0),
    (149702, 26, 1693.09, 140.75, -55.2145, 100, 0, 0, 0),
    (149702, 27, 1705.39, 128.363, -48.9765, 100, 0, 0, 0),
    (149702, 28, 1718.51, 115.25, -55.2142, 100, 0, 0, 0),
    (149702, 29, 1730.88, 126.046, -60.2606, 100, 0, 0, 0),
    (149702, 30, 1730.82, 115.161, -60.183, 100, 0, 0, 0),
    (149702, 31, 1716.92, 103.729, -60.2008, 100, 0, 0, 0),
    (149702, 32, 1701.28, 95.534, -62.2142, 100, 0, 0, 0),
    (149702, 33, 1693.78, 80.3089, -62.2901, 100, 0, 0, 0),
    (149702, 34, 1675.76, 75.0983, -62.2695, 100, 0, 0, 0),
    (149702, 35, 1641.9, 66.6623, -61.6205, 100, 0, 0, 0),
    (149702, 36, 1621.2, 62.7971, -62.1758, 100, 0, 0, 0),
    (149702, 37, 1606.1, 64.2477, -62.1757, 100, 0, 0, 0),
    (149702, 38, 1585.06, 65.8815, -62.1757, 100, 0, 0, 0),
    (149702, 39, 1566.75, 63.2784, -62.1759, 100, 0, 0, 0),
    (149702, 40, 1549.34, 66.7444, -61.6205, 100, 0, 0, 0),
    (149702, 41, 1528.12, 75.3463, -62.1931, 100, 0, 0, 149722),
    (149702, 42, 1515.81, 76.2727, -62.312, 100, 0, 0, 0),
    (149702, 43, 1498.46, 72.9253, -62.2988, 100, 0, 0, 0),
    (149702, 44, 1481.09, 65.1825, -62.2955, 100, 0, 0, 0),
    (149702, 45, 1464.11, 62.5269, -62.2894, 100, 0, 0, 0),
    (149702, 46, 1450.53, 63.8461, -62.2829, 100, 0, 0, 0),
    (149702, 47, 1443.4, 77.7421, -62.281, 100, 0, 0, 0),
    (149702, 48, 1437.17, 95.2736, -62.2835, 100, 0, 0, 0),
    (149702, 49, 1431.24, 109.49, -62.2855, 100, 0, 0, 0),
    (149702, 50, 1425.46, 126.738, -62.2903, 100, 0, 0, 0),
    (149702, 51, 1428.19, 147.362, -62.2883, 100, 0, 0, 0),
    (149702, 52, 1430.87, 165.485, -62.2873, 100, 0, 0, 0),
    (149702, 53, 1422.51, 193.802, -61.6205, 100, 0, 0, 0),
    (149702, 54, 1418.04, 221.338, -62.1757, 100, 0, 0, 0),
    (149702, 55, 1417.87, 250.625, -62.1757, 100, 0, 0, 0),
    (149702, 56, 1422.36, 287.308, -61.6205, 100, 0, 0, 0),
    (149702, 57, 1431.02, 310.52, -62.1858, 100, 0, 0, 0),
    (149702, 58, 1431.11, 329.137, -62.1858, 100, 0, 0, 149723),
    (149702, 59, 1431.76, 340.716, -62.1858, 100, 0, 0, 0),
    (149702, 60, 1446.93, 345.408, -62.2555, 100, 0, 0, 0),
    (149702, 61, 1457.68, 352.131, -62.1858, 100, 0, 0, 0),
    (149702, 62, 1468.25, 368.539, -59.4315, 100, 0, 0, 0),
    (149702, 63, 1456.45, 382.704, -59.2146, 100, 0, 0, 0),
    (149702, 64, 1438.56, 402.152, -57.8187, 100, 0, 0, 0),
    (149702, 65, 1425.19, 415.942, -56.564, 100, 0, 0, 0),
    (149702, 66, 1412.51, 427.689, -54.9935, 100, 0, 0, 0),
    (149702, 67, 1398.04, 434.394, -54.2124, 100, 0, 0, 0),
    (149702, 68, 1377.36, 438.503, -52.7816, 100, 0, 0, 0),
    (149702, 69, 1362.51, 436.662, -54.0348, 100, 0, 0, 0),
    (149702, 70, 1343.87, 430.783, -56.1263, 100, 0, 0, 0),
    (149702, 71, 1329.61, 420.568, -58.5133, 100, 0, 0, 0),
    (149702, 72, 1317.72, 406.919, -61.6818, 100, 0, 0, 149724),
    (149702, 73, 1310.81, 390.742, -64.0786, 100, 0, 0, 0),
    (149702, 74, 1305.81, 371.942, -67.2921, 100, 0, 0, 0),
    (149702, 75, 1300.8, 353.982, -66.3732, 100, 0, 0, 0),
    (149702, 76, 1287.07, 349.808, -65.0277, 100, 0, 0, 0),
    (149702, 77, 1271.03, 348.118, -65.0273, 100, 0, 0, 0),
    (149702, 78, 1260.78, 335.246, -65.0273, 100, 0, 0, 0),
    (149702, 79, 1271.79, 330.043, -61.2514, 100, 0, 0, 0),
    (149702, 80, 1285.68, 329.953, -60.0831, 100, 0, 0, 0),
    (149702, 81, 1296.77, 326.485, -59.4742, 100, 0, 0, 0),
    (149702, 82, 1293.68, 320.572, -57.4819, 100, 0, 0, 0);

-- Stormwind Keep
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (151901, 1, -8571.98, 891.327, 90.7048, 100, 0, 0, 0),
    (151901, 2, -8564.43, 897.362, 96.6816, 100, 0, 0, 0),
    (151901, 3, -8543.69, 868.857, 96.678, 100, 0, 0, 0),
    (151901, 4, -8537.53, 877.229, 100.872, 100, 0, 0, 151910),
    (151901, 5, -8549.34, 876.808, 106.524, 100, 0, 0, 0),
    (151901, 6, -8528.83, 850.217, 106.519, 100, 0, 0, 0),
    (151901, 7, -8566.04, 819.702, 106.519, 100, 0, 0, 0),
    (151901, 8, -8561.33, 812.55, 106.519, 100, 0, 0, 0),
    (151901, 9, -8574.4, 801.162, 106.519, 100, 0, 0, 0),
    (151901, 10, -8581.51, 807.43, 106.519, 100, 0, 0, 0),
    (151901, 11, -8621.97, 775.794, 96.6517, 100, 0, 0, 0),
    (151901, 12, -8591.07, 756.628, 96.6506, 100, 0, 0, 0),
    (151901, 13, -8580.26, 738.55, 96.7067, 100, 0, 0, 0),
    (151901, 14, -8596.12, 719.753, 96.6506, 100, 0, 0, 0),
    (151901, 15, -8578.3, 693.895, 97.0165, 100, 0, 0, 0),
    (151901, 16, -8562.46, 674.137, 97.0165, 100, 0, 0, 0),
    (151901, 17, -8537.19, 689.571, 97.6661, 100, 0, 0, 0),
    (151901, 18, -8522.15, 670.014, 102.774, 100, 0, 0, 0),
    (151901, 19, -8510.12, 652.249, 100.292, 100, 0, 0, 0),
    (151901, 20, -8533.99, 634.753, 100.251, 100, 0, 0, 0),
    (151901, 21, -8551.84, 617.816, 101.984, 100, 0, 0, 0),
    (151901, 22, -8566.02, 614.139, 102.349, 100, 0, 0, 0),
    (151901, 23, -8575.44, 602.488, 103.243, 100, 0, 0, 0),
    (151901, 24, -8584.68, 581.049, 103.347, 100, 0, 0, 0),
    (151901, 25, -8578.33, 547.375, 101.777, 100, 0, 0, 0),
    (151901, 26, -8559.37, 524.217, 100.483, 100, 0, 0, 0),
    (151901, 27, -8544.85, 502.583, 98.5454, 100, 0, 0, 0),
    (151901, 28, -8535.21, 487.29, 101.279, 100, 0, 0, 151911),
    (151901, 29, -8539.38, 477.864, 102.922, 100, 0, 0, 0),
    (151901, 30, -8548.45, 468.814, 104.483, 100, 0, 0, 0),
    (151901, 31, -8533.58, 448.952, 104.917, 100, 0, 0, 0),
    (151901, 32, -8518.46, 430.065, 106.586, 100, 0, 0, 0),
    (151901, 33, -8497.76, 404.19, 108.386, 100, 0, 0, 0),
    (151901, 34, -8477.23, 378.372, 112.258, 100, 0, 0, 0),
    (151901, 35, -8457.71, 353.894, 120.084, 100, 0, 0, 0),
    (151901, 36, -8441.52, 333.366, 122.579, 100, 0, 0, 151912);

-- Stormwind Trade District
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
    (151902, 1, -8571.98, 891.327, 90.7048, 100, 0, 0, 0),
    (151902, 2, -8564.43, 897.362, 96.6816, 100, 0, 0, 0),
    (151902, 3, -8543.69, 868.857, 96.678, 100, 0, 0, 0),
    (151902, 4, -8537.53, 877.229, 100.872, 100, 0, 0, 151910),
    (151902, 5, -8549.34, 876.808, 106.524, 100, 0, 0, 0),
    (151902, 6, -8528.83, 850.217, 106.519, 100, 0, 0, 0),
    (151902, 7, -8566.04, 819.702, 106.519, 100, 0, 0, 0),
    (151902, 8, -8561.33, 812.55, 106.519, 100, 0, 0, 0),
    (151902, 9, -8574.4, 801.162, 106.519, 100, 0, 0, 0),
    (151902, 10, -8581.51, 807.43, 106.519, 100, 0, 0, 0),
    (151902, 11, -8621.97, 775.794, 96.6517, 100, 0, 0, 0),
    (151902, 12, -8628.31, 784.316, 96.6517, 100, 0, 0, 0),
    (151902, 13, -8634.53, 785.558, 96.6517, 100, 0, 0, 0),
    (151902, 14, -8652.83, 772.453, 96.6857, 100, 0, 0, 0),
    (151902, 15, -8661.34, 761.398, 96.7092, 100, 0, 0, 0),
    (151902, 16, -8657.61, 749.952, 96.6926, 100, 0, 0, 0),
    (151902, 17, -8672.58, 735.786, 97.0164, 100, 0, 0, 0),
    (151902, 18, -8682.54, 727.803, 97.0164, 100, 0, 0, 0),
    (151902, 19, -8697.41, 716.147, 97.0164, 100, 0, 0, 0),
    (151902, 20, -8714.37, 733.442, 97.8139, 100, 0, 0, 0),
    (151902, 21, -8729.23, 723.831, 101.453, 100, 0, 0, 0),
    (151902, 22, -8743.99, 712.039, 98.1516, 100, 0, 0, 0),
    (151902, 23, -8753.84, 723.528, 98.0697, 100, 0, 0, 0),
    (151902, 24, -8766.63, 735.125, 99.0597, 100, 0, 0, 0),
    (151902, 25, -8783.09, 742.485, 99.2329, 100, 0, 0, 0),
    (151902, 26, -8800.1, 743.276, 97.658, 100, 0, 0, 0),
    (151902, 27, -8818.66, 735.107, 97.987, 100, 0, 0, 0),
    (151902, 28, -8841.98, 722.637, 97.3206, 100, 0, 0, 0),
    (151902, 29, -8834.77, 699.853, 97.6099, 100, 0, 0, 0),
    (151902, 30, -8824.55, 678.292, 97.5775, 100, 0, 0, 151920),
    (151902, 31, -8833.21, 672.986, 98.3364, 100, 0, 0, 0),
    (151902, 32, -8853.18, 659.676, 96.9430, 100, 0, 0, 0),
    (151902, 33, -8844.56, 644.785, 96.2844, 100, 0, 0, 0),
    (151902, 34, -8831.11, 627.578, 94.0042, 100, 0, 0, 0),
    (151902, 35, -8835.94, 632.075, 94.2046, 100, 0, 0, 0),
    (151902, 36, -8820.48, 642.907, 94.2301, 100, 0, 0, 0),
    (151902, 37, -8804.64, 647.774, 94.4579, 100, 0, 0, 0),
    (151902, 38, -8798.51, 658.14, 95.7397, 100, 0, 0, 0),
    (151902, 39, -8791.07, 679.552, 102.017, 100, 0, 0, 0),
    (151902, 40, -8807.04, 683.424, 100.21, 100, 0, 0, 151921);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
    (149720, 0, 0, 6, 0, 0, 0, 5624, 100, 8, 2, 12334, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Guardian - Scourge in sewers!  We need help!'),
    (149721, 0, 10, 5624, 300000, 0, 0, 0, 0, 0, 0, 2, 149721, -1, 1, 1720.11, 191.195, -62.0651, 1.02974, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Guardian 1 at Magic Quarters'),
    (149722, 0, 10, 5624, 300000, 0, 0, 0, 0, 0, 0, 2, 149722, -1, 1, 1472.94, 63.9248, -62.2098, 0.401426, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Guardian 1 at Rogues\' Quarter'),
    (149723, 0, 10, 13839, 300000, 0, 0, 0, 0, 0, 0, 2, 149723, -1, 1, 1466.95, 369.392, -59.3685, 4.41568, 0, 'Scourge Invasion: Pallid Horror - Spawn Royal Dreadguard 1 at Royal Quarter'),
    (149723, 10, 0, 6, 0, 0, 0, 10181, 200, 8, 2, 12332, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Lady Sylvanas Windrunner - My Royal Dreadguard, you will deal with this matter as befits your station.  That, or you will wish that you had.'),
    (149724, 0, 0, 6, 0, 0, 0, 2425, 100, 8, 2, 12333, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Varimathras - Dreadguard, hold your line.  Halt the advance of those Scourge!'),
    (149724, 0, 10, 13839, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1299.49, 353.789, -65.9394, 1.16937, 0, 'Scourge Invasion: Pallid Horror - Spawn Royal Dreadguard 3 at Royal Quarter'),
    (149724, 0, 10, 13839, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1295.97, 354.728, -65.9162, 0.907571, 0, 'Scourge Invasion: Pallid Horror - Spawn Royal Dreadguard 4 at Royal Quarter'),
    (149724, 0, 10, 13839, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1302.63, 352.871, -65.9109, 1.309, 0, 'Scourge Invasion: Pallid Horror - Spawn Royal Dreadguard 2 at Royal Quarter'),
    (149724, 0, 10, 13839, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1305.82, 351.934, -65.8778, 1.69297, 0, 'Scourge Invasion: Pallid Horror - Spawn Royal Dreadguard 1 at Royal Quarter'),
    (149711, 0, 10, 5624, 300000, 0, 0, 0, 0, 0, 0, 2, 149711, -1, 1, 1649.6, 197.414, -62.0981, 1.06465, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Guardian 1 outside Trade Quarter'),
    (149711, 0, 10, 5624, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1651.49, 192.836, -62.0972, 1.20428, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Guardian 2 outside Trade Quarter'),
    (149711, 0, 10, 5624, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1645.86, 196.746, -62.0994, 1.01229, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Guardian 3 outside Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 149712, -1, 1, 1632.55, 233.419, -43.0193, 2.6529, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 1 at inner Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1633.06, 246.891, -43.0193, 3.59538, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 2 at inner Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1576.53, 243.989, -61.994, 4.76475, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 3 at inner Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1578.96, 237.109, -61.994, 4.53786, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 4 at inner Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1635.93, 240.378, -43.0193, 3.24631, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 5 at inner Trade Quarter'),
    (149712, 0, 10, 16432, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, 1583.21, 241.365, -61.994, 4.45059, 0, 'Scourge Invasion: Pallid Horror - Spawn Undercity Elite Guardian 6 at inner Trade Quarter'),
    (149713, 0, 60, 3, 15, 0, 1, 0, 0, 0, 0, 149701, 149701, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Pallid Horror - Repeat Waypoints in inner Trade Quarter'),
    (151910, 0, 10, 68, 300000, 0, 0, 0, 0, 0, 0, 2, 151910, -1, 1, -8534.62, 854.091, 106.601, 2.09439, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind City Guard 1 in the Cathedral of Light'),
    (151911, 0, 0, 6, 0, 0, 0, 1756, 250, 8, 2, 12316, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Stormwind Royal Guard - The Scourge are at the castle entrance!  For Stormwind!  For King Anduin!'),
    (151911, 10, 0, 6, 0, 0, 0, 1748, 250, 8, 2, 12317, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Bolvar Fordragon - Hold the line!  Protect the King at all costs!'),
    (151912, 0, 60, 3, 34, 0, 1, 0, 0, 0, 0, 0, 151901, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Pallid Horror - Repeat Waypoints in Stormwind Keep'),
    (151921, 0, 60, 3, 30, 0, 1, 0, 0, 0, 0, 0, 151902, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Pallid Horror - Repeat Waypoints in Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 151920, -1, 1, -8828.65, 640.132, 94.4273, 3.28122, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 1 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8837.81, 628.258, 94.0939, 1.67552, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 2 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8832.66, 629.215, 94.1206, 2.09439, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 3 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8827.45, 633.287, 94.3621, 2.87979, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 4 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8841.72, 631.157, 94.6496, 1.41372, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 5 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8844.74, 635.272, 95.2692, 1.37881, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 6 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8845.08, 614.403, 93.0201, 5.18363, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 7 at Trade District'),
    (151920, 0, 10, 16396, 300000, 0, 0, 0, 0, 0, 0, 2, 0, -1, 1, -8848.65, 612.322, 93.0186, 5.42797, 0, 'Scourge Invasion: Pallid Horror - Spawn Stormwind Elite Guard 8 at Trade District');
    
DELETE FROM `generic_scripts` WHERE `id` IN (149721,149722,149723,149711,149712,151910,151920);
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
    (149721, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12335, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Guardian - Scourge attack Magic Quarter!'),
    (149722, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12336, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Guardian - Rogues\' Quarter attacked by Scourge!  Help!'),
    (149723, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12337, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Guardian - The Scourge are at the entrance to the Royal Quarter!  Kill them!!'),
    (149711, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12353, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Guardian - There Scourge outside Trade Quarter!'),
    (149712, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12354, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Undercity Elite Guardian - Scourge inside Trade Quarter!  Destroy!'),
    (151910, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12310, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Stormwind City Guard - To arms!  Scourge spotted in the Cathedral of Light!'),
    (151920, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 12311, 0, 0, 0, 0, 0, 0, 0, 0, 'Scourge Invasion: Stormwind Elite Guard - Scourge in the Trade District!  Have at them!');


-- =============================================
-- Letter Quests
-- =============================================

/*
-- Item: A Careworn Note (22972)
-- Quest: Note from the Front (9299)
-- Alliance Relative: Alexander Calder (5173)
-- Horde Relative: Deze Snowbane (15006)
-- Mailed Item: Sealed Research Report (23008)
*/

-- Condition Quest 9299 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9299, 8, 9299, 0, 0, 0, 0);

-- Add vendor npc flag to Alexander Calder in patch 1.11.
DELETE FROM `creature_template` WHERE `entry`=5173;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (5173, 0, 3122, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Alexander Calder', 'Warlock Trainer', 4566, 60, 60, 4120, 4120, 0, 0, 8401, 55, 19, 1, 1.14286, 18, 5, 0, 0, 1, 110, 142, 0, 272, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 9, 0, 74.448, 102.366, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5173, 14, 0, 0, 0, 524298, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (5173, 9, 3122, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Alexander Calder', 'Warlock Trainer', 4566, 60, 60, 4120, 4120, 0, 0, 8401, 55, 23, 1, 1.14286, 18, 5, 0, 0, 1, 110, 142, 0, 272, 1, 2000, 2000, 1, 4608, 0, 0, 0, 0, 9, 0, 74.448, 102.366, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5173, 14, 0, 0, 0, 524298, '');

-- Add missing gossip option to Alexander Calder.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4566, 2, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 9299);

-- Add missing vendor items to Alexander Calder.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(5173, 23161, 9299),
(5173, 23160, 9299);

-- Add vendor npc flag to Deze Snowbane in patch 1.11.
DELETE FROM `creature_template` WHERE `entry`=15006;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15006, 5, 15112, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Deze Snowbane', 'Arathi Basin Battlemaster', 6470, 61, 61, 157200, 157200, 0, 0, 4091, 412, 2049, 1, 1.14286, 20, 5, 0, 1, 1, 544, 703, 0, 278, 1, 2000, 2000, 1, 4672, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, 3, 0, 0, 3, 15006, 0, 0, 0, 0, 524296, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (15006, 9, 15112, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Deze Snowbane', 'Arathi Basin Battlemaster', 6470, 61, 61, 157200, 157200, 0, 0, 4091, 412, 2053, 1, 1.14286, 20, 5, 0, 1, 1, 544, 703, 0, 278, 1, 2000, 2000, 1, 4672, 0, 0, 0, 0, 0, 0, 172.1, 240.07, 100, 7, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, NULL, 0, 0, '', 0, 3, 0, 0, 3, 15006, 0, 0, 0, 0, 524296, '');

-- Add missing gossip option to Deze Snowbane.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6470, 0, 9, 'I would like to go to the battleground.', 10355, 12, 2048, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6470, 1, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 9299);

-- Add missing vendor items to Deze Snowbane.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(15006, 23161, 9299),
(15006, 23160, 9299);

/*
-- Item: A Torn Letter (22977)
-- Quest: Letter from the Front (9295)
-- Alliance Relative: Orphan Matron Nightingale (14450)
-- Horde Relative: Joanna Whitehall (5698)
-- Mailed Item: Sealed Research Report (23010)
*/

-- Condition Quest 9295 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9295, 8, 9295, 0, 0, 0, 0);

-- Add missing gossip option to Orphan Matron Nightingale.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5849;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5849, 2, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 9295);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5849, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5849, 4, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);

-- Assign condition id to Orphan Matron Nightingale's vendor items.
UPDATE `npc_vendor` SET `condition_id`=9295 WHERE `entry`=14450;

-- Add vendor npc flag to Joanna Whitehall in patch 1.11.
DELETE FROM `creature_template` WHERE `entry`=5698;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (5698, 0, 4052, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Joanna Whitehall', NULL, 9421, 40, 40, 1752, 1752, 0, 0, 1890, 68, 0, 1, 1.14286, 18, 5, 0, 0, 1, 61, 78, 0, 156, 1, 2000, 2000, 1, 37376, 0, 0, 0, 0, 0, 0, 56.672, 77.924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5698, 0, 0, 0, 0, 524298, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (5698, 9, 4052, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 'Joanna Whitehall', NULL, 9421, 40, 40, 1752, 1752, 0, 0, 1890, 68, 4, 1, 1.14286, 18, 5, 0, 0, 1, 61, 78, 0, 156, 1, 2000, 2000, 1, 37376, 0, 0, 0, 0, 0, 0, 56.672, 77.924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 0, 0, 3, 5698, 0, 0, 0, 0, 524298, '');

-- Add missing vendor items to Joanna Whitehall.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(5698, 23161, 9295),
(5698, 23160, 9295);

/*
-- Item: A Ragged Page (22974)
-- Quest: Page from the Front (9300)
-- Alliance Relative: Elissa Dumas (4165)
-- Horde Relative: Miles Welsh (3044)
-- Mailed Item: Sealed Research Report (23011)
*/

-- Condition Quest 9300 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9300, 8, 9300, 0, 0, 0, 0);

-- Add vendor npc flag to Elissa Dumas in patch 1.11.
DELETE FROM `creature_template` WHERE `entry`=4165;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (4165, 0, 7669, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Elissa Dumas', 'Portal Trainer', 4821, 35, 35, 992, 992, 2680, 2680, 1156, 80, 19, 1, 1.14286, 18, 5, 0, 0, 1, 51, 65, 0, 138, 1, 2000, 2000, 8, 4608, 0, 0, 0, 0, 8, 0, 51.128, 70.301, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 1, 0, 3, 4165, 50, 0, 0, 0, 524298, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (4165, 9, 7669, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Elissa Dumas', 'Portal Trainer', 4821, 35, 35, 992, 992, 2680, 2680, 1156, 80, 23, 1, 1.14286, 18, 5, 0, 0, 1, 51, 65, 0, 138, 1, 2000, 2000, 8, 4608, 0, 0, 0, 0, 8, 0, 51.128, 70.301, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 3, 1, 0, 3, 4165, 50, 0, 0, 0, 524298, '');

-- Add missing gossip option to Elissa Dumas.
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4821;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4821, 0, 3, 'Please teach me.', 8442, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4821, 1, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 9300);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4821, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4821, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);

-- Add missing vendor items to Elissa Dumas.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(4165, 23161, 9300),
(4165, 23160, 9300);

-- Add vendor npc flag to Miles Walsh in patch 1.11.
DELETE FROM `creature_template` WHERE `entry`=3044;
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (3044, 0, 2139, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Miles Welsh', 'Priest Trainer', 4533, 40, 40, 1752, 1752, 0, 0, 1890, 68, 19, 1, 1.14286, 18, 5, 0, 0, 1, 61, 78, 0, 156, 1, 2000, 2000, 1, 37376, 0, 0, 0, 0, 5, 0, 56.672, 77.924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 3044, 8, 0, 0, 0, 524298, '');
INSERT INTO `creature_template` (`entry`, `patch`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `name`, `subname`, `gossip_menu_id`, `level_min`, `level_max`, `health_min`, `health_max`, `mana_min`, `mana_max`, `armor`, `faction`, `npc_flags`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `rank`, `xp_multiplier`, `dmg_min`, `dmg_max`, `dmg_school`, `attack_power`, `dmg_multiplier`, `base_attack_time`, `ranged_attack_time`, `unit_class`, `unit_flags`, `dynamic_flags`, `pet_family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `ranged_dmg_min`, `ranged_dmg_max`, `ranged_attack_power`, `type`, `type_flags`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `auras`, `gold_min`, `gold_max`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `regeneration`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `flags_extra`, `script_name`) VALUES (3044, 9, 2139, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Miles Welsh', 'Priest Trainer', 4533, 40, 40, 1752, 1752, 0, 0, 1890, 68, 23, 1, 1.14286, 18, 5, 0, 0, 1, 61, 78, 0, 156, 1, 2000, 2000, 1, 37376, 0, 0, 0, 0, 5, 0, 56.672, 77.924, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 'EventAI', 0, 1, 0, 0, 3, 3044, 8, 0, 0, 0, 524298, '');

-- Add missing gossip option to Miles Welsh.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4533, 8653, 9300);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4533;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4533, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4533, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4533, 2, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 9300);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4533, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4533, 4, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);

-- Add missing vendor items to Miles Welsh.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(3044, 23161, 9300),
(3044, 23160, 9300);

/*
-- Item: A Crumpled Missive (22973)
-- Quest: Missive from the Front (9302)
-- Neutral Relative: Garon Hutchins (16543)
-- Mailed Item: Sealed Research Report (23012)
*/

-- Condition Quest 9302 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9302, 8, 9302, 0, 0, 0, 0);

-- Add missing gossip option to Garon Hutchins (his vendor option is bugged on official servers, and does not really sell items).
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (7418, 8653, 9302);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7418, 0, 0, 'I would like to buy from you.', 2583, 1, 1, 0, 0, 0, 0, 0, NULL, 0, 9302);

/*
-- Item: A Bloodstained Envelope (22970)
-- Quest: Envelope from the Front (9301)
-- Neutral Relative: Zarena Cromwind (2482)
-- Mailed Item: Sealed Research Report (23013)
*/

-- Condition Quest 9301 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9301, 8, 9301, 0, 0, 0, 0);

-- Add missing vendor items to Zarena Cromwind.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(2482, 23160, 9301),
(2482, 23161, 9301);

/*
-- Item: A Smudged Document (22975)
-- Quest: Document from the Front (9304)
-- Neutral Relative: Caretaker Alen (11038)
-- Mailed Item: Sealed Research Report (23016)
*/

-- Condition Quest 9304 Completed
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9304, 8, 9304, 0, 0, 0, 0);

-- Add missing vendor items to Caretaker Alen.
INSERT INTO `npc_vendor` (`entry`, `item`, `condition_id`) VALUES
(11038, 23161, 9304),
(11038, 23160, 9304);

-- =============================================
-- Low Level Starting Zone Quests
-- =============================================

-- Lieutenant Orrin (Stormwind) (16478)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16478;
-- Lieutenant Nevell (Ironforge) (16484)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16484;
-- Lieutenant Beitha (Darnassus) (16495)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16495;
-- Lieutenant Dagel (Orgrimmar) (16493)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16493;
-- Lieutenant Lisande (Thunder Bluff) (16490)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16490;
-- Lieutenant Rukag (Undercity) (16494)
UPDATE `creature_template` SET `npc_flags`=2, `faction`=794, `unit_flags`=33536, `level_min`=10, `level_max`=10, `health_min`=186, `health_max`=186 WHERE `entry`=16494;
INSERT INTO `quest_greeting` (`entry`, `type`, `content_default`, `emote_id`, `emote_delay`) VALUES (16494, 0, 'Good day to you, citizen. Have you come to aid us against the Scourge?', 1, 0);

-- Add Dim Necrotic Stone drops.
DELETE FROM `creature_loot_template` WHERE `item`=22892;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16422, 22892, -22, 0, 1, 1, 0, 9, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16423, 22892, -22, 0, 1, 1, 0, 9, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16437, 22892, -22, 0, 1, 1, 0, 9, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16438, 22892, -22, 0, 1, 1, 0, 9, 10);
UPDATE `creature_template` SET `loot_id`=16422 WHERE `entry`=16422;
UPDATE `creature_template` SET `loot_id`=16423 WHERE `entry`=16423;
UPDATE `creature_template` SET `loot_id`=16437 WHERE `entry`=16437;
UPDATE `creature_template` SET `loot_id`=16438 WHERE `entry`=16438;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
