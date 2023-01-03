DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220801022620');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220801022620');
-- Add your query below.


-- Correct quest data.
UPDATE `quest_template` SET `ReqCreatureOrGOId1`=0, `ReqCreatureOrGOCount1`=0 WHERE `entry` IN (7001, 7027);

-- These npcs have absolutely nothing to do with this quest and were wrongly used.
UPDATE `creature_template` SET `script_name`='' WHERE `entry` IN (10989, 10985);

-- 21863: Target Has Aura 21863 Index 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21863, 1, 21863, 0, 0, 0, 0);
-- 21864: Target Has Incomplete Quest 7027 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21864, 9, 7027, 1, 0, 0, 0);
-- 21865: (21863: Target Has Aura 21863 Index 0) And (21864: Target Has Incomplete Quest 7027 In Log)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21865, -1, 21863, 21864, 0, 0, 0);

-- Gossip menu for Stormpike Stable Master.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(5283, 6316, 0),
(5283, 6317, 21865);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(5283, 0, 0, 'With pleasure. These things stink!', 8911, 1, 1, -1, 0, 5283, 0, 0, NULL, 0, 21865);
DELETE FROM `gossip_scripts` WHERE `id`=5283;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5283, 0, 0, 7, 7027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormpike Stable Master - Complete Quest Empty Stables'),
(5283, 0, 0, 14, 21863, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormpike Stable Master - Remove Ram Aura from Player');
UPDATE `creature_template` SET `gossip_menu_id`=5283, `npc_flags`=3 WHERE `entry`=13617;

-- Events list for Alterac Ram
DELETE FROM `creature_ai_events` WHERE `creature_id`=10990;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1099001, 10990, 0, 8, 0, 100, 0, 21867, -1, 0, 0, 1099001, 0, 0, 'Alterac Ram - Follow Player on Hit By Collar Effect Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=1099001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1099001, 0, 0, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alterac Ram - Combat Stop'),
(1099001, 0, 1, 22, 1217, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alterac Ram - Set Faction to Stormpike Guard'),
(1099001, 0, 2, 20, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Alterac Ram - Follow Player'),
(1099001, 0, 3, 15, 21863, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alterac Ram - Cast Spell Alterac Ram Aura'),
(1099001, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8858, 0, 0, 0, 0, 0, 0, 0, 0, 'Alterac Ram - Say Emoted Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (109900, 'Alterac Valley - Alterac Ram', 13443, 100, 1, 0, 0, 0, 6, 20, 9, 20, 0, 22120, 100, 1, 0, 0, 0, 0, 4, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=10990;

-- 21827: Target Has Aura 21827 Index 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21827, 1, 21827, 0, 0, 0, 0);
-- 21828: Target Has Incomplete Quest 7001 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21828, 9, 7001, 1, 0, 0, 0);
-- 21829: (21827: Target Has Aura 21827 Index 0) And (21828: Target Has Incomplete Quest 7001 In Log)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (21829, -1, 21827, 21828, 0, 0, 0);

-- Gossip menu for Frostwolf Stable Master (no sniff data).
-- https://www.youtube.com/watch?v=0nTqzodql9s
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(50002, 6273, 0),
(50002, 6274, 21829);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(50002, 0, 0, 'Thank you, Stable Master. Please take the animal.', 8861, 1, 1, -1, 0, 50002, 0, 0, NULL, 0, 21829);
DELETE FROM `gossip_scripts` WHERE `id`=50002;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(50002, 0, 0, 7, 7001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf Stable Master - Complete Quest Empty Stables'),
(50002, 0, 0, 14, 21827, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf Stable Master - Remove Frostwolf Aura from Player');
UPDATE `creature_template` SET `gossip_menu_id`=50002, `npc_flags`=3 WHERE `entry`=13616;

-- Events list for Frostwolf
DELETE FROM `creature_ai_events` WHERE `creature_id`=10981;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1098101, 10981, 0, 8, 0, 100, 0, 21795, -1, 0, 0, 1098101, 0, 0, 'Frostwolf - Follow Player on Hit By Muzzle Effect Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=1098101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1098101, 0, 0, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf - Combat Stop'),
(1098101, 0, 1, 22, 1215, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf - Set Faction to Frostwolf Clan'),
(1098101, 0, 2, 20, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Frostwolf - Follow Player'),
(1098101, 0, 3, 15, 21827, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf - Cast Spell Frostwolf Aura'),
(1098101, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8858, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostwolf - Say Emoted Text');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=10981;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
