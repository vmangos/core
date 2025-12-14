DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230924151636');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230924151636');
-- Add your query below.


-- Text used in the event.
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5748;
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=5 WHERE `entry`=5760;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5761;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5596;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5776;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5777;
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5778;

-- Events list for Vaelastrasz the Red
DELETE FROM `creature_ai_events` WHERE `creature_id`=10340;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1034001, 10340, 0, 8, 0, 100, 0, 16404, -1, 0, 0, 1034001, 0, 0, 'Vaelastrasz the Red - Despawn on Hit By Spell Banishment of Scale');
DELETE FROM `creature_ai_scripts` WHERE `id`=1034001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1034001, 0, 0, 39, 4625, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Start Script');
UPDATE `creature_template` SET `unit_flags`=576, `spawn_spell_id`=16634, `ai_name`='EventAI' WHERE `entry`=10340;

-- Spell list for Vaelstrasz.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (105380, 'Blackrock Spire - Vaelastrasz', 16396, 100, 1, 0, 0, 0, 7, 8, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=105380, `unit_flags`=33554496 WHERE `entry`=10538;

-- 4622: Current Map Id Is 229
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4622, 33, 229, 0, 0, 0, 0);
-- 4623: Stored Value In Index 3 From Instance Script Is Equal To 1
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4623, 34, 3, 1, 0, 0, 0);
-- 4624: (4622: Current Map Id Is 229) And (4623: Stored Value In Index 3 From Instance Script Is Equal To 1)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4624, -1, 4622, 4623, 0, 0, 0);

-- Script upon using item Seal of Ascension.
DELETE FROM `event_scripts` WHERE `id`=4622;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4622, 0, 0, 39, 4622, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 4624, 'Call of Vaelastrasz: Summon Vaelstrasz during Stadium Event in UBRS');

-- 10339: Creature 10339 Is Alive Within 100 Yards Of The Target
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (10339, 20, 10339, 100, 0, 0, 0);
-- 10340: Not (10339: Creature 10339 Is Alive Within 100 Yards Of The Target)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (10340, -3, 10339, 0, 0, 0, 0);

-- Script to spawn Vaelastrasz in different position depending on if Gyth is there.
DELETE FROM `generic_scripts` WHERE `id`=4622;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4622, 0, 0, 10, 10340, 70000, 1, 100, 0, 0, 0, 4, 8, 4623, -1, 1, 168.818, -420.429, 110.556, 6.21337, 10339, 'Call of Vaelastrasz: Summon Creature Vaelastrasz the Red (Combat)'),
(4622, 0, 0, 10, 10340, 70000, 1, 100, 0, 0, 0, 4, 8, 4624, -1, 1, 182.742, -413.81, 110.556, 4.623, 10340, 'Call of Vaelastrasz: Summon Creature Vaelastrasz the Red (OOC)');

-- Spawn script for Vaelastrasz the Red before Gyth is there.
DELETE FROM `generic_scripts` WHERE `id`=4624;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4624, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Set React State to Passive'),
(4624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5748, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Say Text'),
(4624, 3, 0, 15, 16319, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Cast Spell Touch of Vaelstrasz'),
(4624, 6, 0, 15, 16354, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 10340, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Cast Spell Vaelstrasz Spawn'),
(4624, 8, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10340, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Despawn'),
(4624, 9, 0, 39, 4623, 0, 0, 0, 0, 0, 0, 16, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz OOC: Vaelastrasz the Red - Start Script');

-- Spawn script for Vaelastrasz the Red when Gyth is there.
DELETE FROM `generic_scripts` WHERE `id`=4623;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4623, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Set React State to Passive'),
(4623, 1, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.443758, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Set Orientation'),
(4623, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5760, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Say Text'),
(4623, 3, 0, 27, 10538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Update Entry to Vaelstrasz'),
(4623, 3, 1, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Remove Immune to NPC Flag'),
(4623, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5761, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Say Text'),
(4623, 8, 0, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Set React State to Aggressive'),
(4623, 8, 1, 26, 0, 0, 0, 0, 10339, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Vaelastrasz the Red - Attack Gyth'),
(4623, 8, 2, 0, 0, 0, 0, 0, 10162, 100, 8, 2, 5596, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Lord Victor Nefarius - Say Text'),
(4623, 14, 0, 0, 0, 0, 0, 0, 10162, 100, 8, 2, 5776, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Lord Victor Nefarius - Say Text'),
(4623, 18, 0, 0, 0, 0, 0, 0, 10162, 100, 8, 2, 5777, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Lord Victor Nefarius - Say Text'),
(4623, 24, 0, 15, 16404, 0, 0, 0, 10162, 100, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Call of Vaelastrasz Combat: Lord Victor Nefarius - Cast Spell Banishment of Scale');

-- Script when Vaelastrasz is hit by Banishment of Scale.
DELETE FROM `generic_scripts` WHERE `id`=4625;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4625, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Set React State to Passive'),
(4625, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Disable Combat Movement'),
(4625, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Disable Melee Attack'),
(4625, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5778, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Say Text'),
(4625, 0, 4, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Set Home Position'),
(4625, 1, 0, 27, 10340, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Update Entry'),
(4625, 2, 0, 15, 16354, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Cast Spell Vaelstrasz Spawn'),
(4625, 5, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz the Red - Despawn');

-- Define targets for Banishment of Scale.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES
(16404, 1, 10538, 0, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
