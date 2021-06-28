DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210218140133');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210218140133');
-- Add your query below.


-- Omen should not regen out of combat.
UPDATE `creature_template` SET `regeneration`=0 WHERE `entry`=15467;

-- Add spell list to Omen.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (154670, 'Moonglade - Omen', 20677, 100, 1, 0, 0, 0, 8, 12, 8, 12, 0, 26540, 100, 4, 0, 0, 0, 8, 12, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=154670 WHERE `entry`=15467;

-- Correct health for Omen.
UPDATE `creature_template` SET `health_min`=999300, `health_max`=999300 WHERE `entry`=15467;

-- Events list for Minion of Omen
DELETE FROM `creature_ai_events` WHERE `creature_id`=15466;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1546601, 15466, 0, 8, 0, 100, 1, 26374, -1, 1, 1, 1546601, 0, 0, 'Minion of Omen - Cast Firework Effect on Hit by Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=1546601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1546601, 0, 15, 25495, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Minion of Omen - Cast Spell Firework Effect ');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1546601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11008, 0, 0, 0, 0, 0, 0, 0, 0, 'Minion of Omen - Say Emoted Text');
UPDATE `creature_template` SET `auras`='17327', `ai_name`='EventAI', `script_name`='' WHERE `entry`=15466;

-- Add game event to spawn Minions of Omen.
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES (43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 999999999, 0, 'Lunar Festiva: Minions of Omen', 1, 0, 7, 10);
UPDATE `game_event_creature` SET `event`=43 WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=15466);

-- Pat's Firework Guy should be visible but unselectable.
UPDATE `creature_template` SET `unit_flags`=33555200, `flags_extra`=2 WHERE `script_name`='npc_pats_firework_guy';

-- Targets for Purple Rocket Cluster.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26326, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26326, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26326, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26326, 0, 180874, 0, 0, 0, 5875);

-- Targets for White Rocket Cluster.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26328, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26328, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26328, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26328, 0, 180874, 0, 0, 0, 5875);

-- Targets for Yellow Rocket Cluster
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26329, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26329, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26329, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26329, 0, 180874, 0, 0, 0, 5875);

-- Targets for Large Purple Rocket Cluster.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26516, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26516, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26516, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26516, 0, 180874, 0, 0, 0, 5875);

-- Targets for Large White Rocket Cluster.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26518, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26518, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26518, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26518, 0, 180874, 0, 0, 0, 5875);

-- Targets for Large Yellow Rocket Cluster.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26519, 0, 180772, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26519, 0, 180859, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26519, 0, 180869, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (26519, 0, 180874, 0, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
