DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220319115102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220319115102');
-- Add your query below.


-- Add Missing Raene Wolfrunner Gossip
-- Remove Uneeded Condition
DELETE FROM `conditions` WHERE `condition_entry` = 401;
UPDATE `gossip_menu` SET `condition_id` = 0 WHERE `entry` = 5502 AND `text_id` = 6553;

-- Correct Condition
-- 400: Target Has Done Quest 1046
UPDATE `conditions` SET `value1`=1046 WHERE `condition_entry`=400;

-- Add Missing Gossip Menu Option
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES
(5502, 'Raene, I lost Dartol\'s Rod of Transformation.', 9025, 1, 1, 5501, 5502, 389);

INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5502, 0, 0, 15, 22227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene Wolfrunner - Cast Spell');

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(5501, 6554);

INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES
(6554, 9026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add Conditions
-- 387: Target Can Accept Quest 1045
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (387, 19, 1045, 0, 0, 0, 0);
-- 388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (388, 23, 5462, 1, 0, 0, 1);
-- 389: (387: Target Can Accept Quest 1045) And (388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (389, -1, 387, 388, 0, 0, 0);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Some Creature Abilities
-- Events list for Webwood Lurker
DELETE FROM `creature_ai_events` WHERE `creature_id`=1998;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (199801);
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=1998;
UPDATE `creature_template` SET `auras`='11959', `ai_name`='' WHERE  `entry`=1998 AND `patch`=0;

-- Events list for Ragged Owlbeast
DELETE FROM `creature_ai_scripts` WHERE `id` IN (745001);
DELETE FROM `creature_ai_events` WHERE `creature_id`=7450;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(74500, 'Winterspring - Ragged Owlbeast', 15848, 100, 1, 0, 0, 32, 0, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=74500 WHERE `entry`=7450;

-- Events list for Crazed Owlbeast
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(745201, 0, 15, 15716, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crazed Owlbeast - Cast Spell ');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (745201, 7452, 0, 2, 0, 100, 1, 50, 0, 120000, 120000, 745201, 0, 0, 'Crazed Owlbeast - Cast Enrage at 50% HP');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7452;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Supplies for the Crossroads Has No Pre Quest
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=5041 AND `patch`=0;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Missing Timberling Spawns
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1557, 2022, 0, 0, 0, 1, 9381.51, 850.173, 1261.25, 3.92492, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1559, 2022, 0, 0, 0, 1, 9416.69, 851.614, 1255.5, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1560, 2022, 0, 0, 0, 1, 9417.65, 881.206, 1259.13, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1561, 2022, 0, 0, 0, 1, 9449.68, 885.044, 1256.24, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1665, 2022, 0, 0, 0, 1, 9450.4, 850.795, 1249.93, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10); 


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
