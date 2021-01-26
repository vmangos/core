DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210124023202');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210124023202');
-- Add your query below.


-- Add spawn for Zaetar's Spirit.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawn_flags`) VALUES (55352, 12238, 349, 28.1887, 62.3964, -123.161, 4.31096, 0, 0, 64);

-- Events list for Zaetar's Spirit
DELETE FROM `creature_ai_events` WHERE `creature_id`=12238;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1223801, 12238, 0, 8, 0, 100, 0, 21896, -1, 0, 0, 1223801, 0, 0, 'Zaetar\'s Spirit - Say Text on Hit By Zaetar\'s Release');
DELETE FROM `creature_ai_scripts` WHERE `id`=1223801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1223801, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 8922, 0, 0, 0, 0, 0, 0, 0, 0, 'Zaetar\'s Spirit - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12238;

-- Events list for Princess Theradras
DELETE FROM `creature_ai_events` WHERE `creature_id`=12201;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1220101, 12201, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1220101, 0, 0, 'Princess Theradras - Summon Zaetar\'s Spirit on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1220101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1220101, 0, 15, 21896, 2, 0, 0, 55352, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Theradras - Cast Spell Zaetar\'s Release');
INSERT INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (122010, 'Maraudon - Princess Theradras', 21832, 100, 4, 2, 0, 0, 8, 12, 10, 30, 0, 3391, 100, 0, 0, 0, 0, 8, 12, 8, 30, 0, 21869, 100, 1, 0, 0, 0, 5, 10, 35, 45, 0, 21909, 100, 4, 320, 0, 0, 5, 20, 10, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `school_immune_mask`=8, `spell_list_id`=122010, `ai_name`='EventAI', `script_name`='' WHERE `entry`=12201;

-- Update Darkmaster Gandling script as target parameters have been switched in core.
DELETE FROM `creature_ai_scripts` WHERE `id`=185304;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (185304, 0, 15, 17950, 2, 0, 0, 259, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Cast Shadow Portal');

-- Fix some errors.
UPDATE `creature_movement_scripts` SET `target_param1`=0 WHERE `target_type`=0 && `id` IN (8125201, 8986101, 4552401, 4547701, 4429601, 8134801, 8124901, 8125001, 8134901);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
