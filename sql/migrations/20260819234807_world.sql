DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260819234807');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260819234807');
-- Add your query below.


-- Events list for Myzrael
DELETE FROM `creature_ai_events` WHERE `creature_id`=2755;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(275501, 2755, 0, 2, 0, 100, 0, 25, 1, 0, 0, 275501, 0, 0, 'Myzrael - Cast Summon Prismatic Exiles at 25% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=275501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(275501, 0, 0, 15, 4937, 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myzrael - Cast Spell Summon Prismatic Exiles');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (27550, 'Arathi Highlands - Myzrael', 4938, 75, 1, 0, 0, 64, 6, 18, 20, 30, 0, 10388, 100, 0, 0, 0, 4, 1, 10, 6, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2755;
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 32 /*ImmunePC*/ WHERE `entry`=2755;
-- Script for Scroll of Myzrael
DELETE FROM `event_scripts` WHERE `id`=420;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(420, 0, 0, 10, 2755, 1800000, 1, 50, 0, 0, 0, 4, 8, 2755, -1, 1, -943.427, -3119.69, 49.0478, 4.46804, 0, 'Summoning the Princess: Summon Creature Myzrael');
DELETE FROM `generic_scripts` WHERE `id`=2755;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2755, 4, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Set Orientation'),
(2755, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 842, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Say Text'),
(2755, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 843, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Say Text'),
(2755, 12, 0, 20, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Set Random Movement as Default'),
(2755, 12, 1, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Remove Immune to Player Flag'),
(2755, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 844, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Say Text'),
(2755, 13, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess: Myzrael - Attack Start');

-- Events list for Prismatic Exile
DELETE FROM `creature_ai_events` WHERE `creature_id`=2887;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(288701, 2887, 0, 0, 0, 100, 5, 6000, 12000, 13000, 60000, 288701, 0, 0, 'Prismatic Exile - Switch Prismatic Form in Combat'),
(288702, 2887, 0, 0, 29, 100, 5, 1, 6000, 3000, 12000, 288702, 0, 0, 'Prismatic Exile - Cast Fireball (Phase 1)'),
(288703, 2887, 0, 14, 27, 100, 5, 1000, 40, 30000, 60000, 288703, 0, 0, 'Prismatic Exile - Cast Healing Wave (Phase 2)'),
(288704, 2887, 0, 9, 23, 100, 5, 2, 10, 12000, 12000, 288704, 0, 0, 'Prismatic Exile - Cast Frost Nova (Phase 3)'),
(288705, 2887, 0, 27, 15, 100, 5, 12550, 1, 30000, 30000, 288705, 0, 0, 'Prismatic Exile - Cast Lightning Shield (Phase 4)');
DELETE FROM `creature_ai_scripts` WHERE `id`=288701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(288701, 0, 0, 39, 28870, 28871, 28872, 28873, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Prismatic Exile - Start Script to Switch Prismatic Form');
DELETE FROM `generic_scripts` WHERE `id`=28870;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28870, 0, 0, 15, 4933, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Spell Prismatic Form: Fire'),
(28870, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Set Phase to 1');
DELETE FROM `generic_scripts` WHERE `id`=28871;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28871, 0, 0, 15, 4934, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Spell Prismatic Form: Earth'),
(28871, 0, 1, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Set Phase to 2');
DELETE FROM `generic_scripts` WHERE `id`=28872;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28872, 0, 0, 15, 4935, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Spell Prismatic Form: Water'),
(28872, 0, 1, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Set Phase to 3');
DELETE FROM `generic_scripts` WHERE `id`=28873;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28873, 0, 0, 15, 4936, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Spell Prismatic Form: Thunder'),
(28873, 0, 0, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Set Phase to 4');
DELETE FROM `creature_ai_scripts` WHERE `id`=288702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(288702, 0, 0, 15, 9053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Fireball');
DELETE FROM `creature_ai_scripts` WHERE `id`=288703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(288703, 0, 0, 15, 11986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Healing Wave');
DELETE FROM `creature_ai_scripts` WHERE `id`=288704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(288704, 0, 0, 15, 11831, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Frost Nova');
DELETE FROM `creature_ai_scripts` WHERE `id`=288705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(288705, 0, 0, 15, 12550, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prismatic Exile - Cast Lightning Shield');
UPDATE `creature_template` SET `spawn_spell_id`=10389 WHERE `entry`=2887;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
