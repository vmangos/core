DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181009215816');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181009215816');
-- Add your query below.


-- Remove custom text entries and fix chat type and sound id of Amnennar's texts.
DELETE FROM `script_texts` WHERE `entry`=-1129000;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5825 WHERE `ID`=6187;
DELETE FROM `script_texts` WHERE `entry`=-1129001;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5828 WHERE `ID`=6189;
DELETE FROM `script_texts` WHERE `entry`=-1129002;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5829 WHERE `ID`=6190;
DELETE FROM `script_texts` WHERE `entry`=-1129003;
UPDATE `broadcast_text` SET `Type`=1, `Sound`=5827 WHERE `ID`=6192;
DELETE FROM `script_texts` WHERE `entry`=-1129004;
UPDATE `broadcast_text` SET `Sound`=5826 WHERE `ID`=6188;

-- Events list for Amnennar the Coldbringer
DELETE FROM `creature_ai_events` WHERE `creature_id`=7358;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735801, 7358, 0, 4, 0, 100, 0, 0, 0, 0, 0, 735801, 0, 0, 'Amnennar the Coldbringer - Yell on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735802, 7358, 0, 5, 0, 100, 1, 5000, 5000, 0, 0, 735802, 0, 0, 'Amnennar the Coldbringer - Say on Killed Unit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735803, 7358, 0, 2, 0, 100, 0, 80, 66, 0, 0, 735803, 0, 0, 'Amnennar the Coldbringer - Yell at 80% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735804, 7358, 0, 2, 0, 100, 0, 33, 1, 0, 0, 735804, 0, 0, 'Amnennar the Coldbringer - Cast Summon Frost Spectres and Yell at 33% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735805, 7358, 0, 2, 0, 100, 0, 66, 33, 0, 0, 735805, 0, 0, 'Amnennar the Coldbringer - Cast Summon Frost Spectres and Yell at 66% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735806, 7358, 0, 33, 0, 100, 1, 10000, 10000, 0, 0, 735806, 0, 0, 'Amnennar the Coldbringer - Move Away on Target Rooted');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (735807, 7358, 0, 6, 0, 100, 0, 0, 0, 0, 0, 735807, 0, 0, 'Amnennar the Coldbringer - Kill Frost Spectres on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=735801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6187, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=735802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6188, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=735803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6192, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=735804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4483, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6190, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735804, 0, 15, 12642, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Cast Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=735805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4483, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6189, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735805, 0, 15, 12642, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Cast Spell');
DELETE FROM `creature_ai_scripts` WHERE `id`=735806;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735806, 0, 20, 18, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 2428, 'Amnennar the Coldbringer - Move Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=735807;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (735807, 0, 68, 8585, 2, 8585, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Amnennar the Coldbringer - Kill Frost Spectres');
DELETE FROM `event_scripts` WHERE `id`=8585;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8585, 0, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frost Spectre - Die');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (73580, 'Razorfen Downs - Amnennar the Coldbringer', 15530, 100, 1, 0, 0, 128, 0, 0, 2, 2, 0, 15530, 80, 1, 0, 0, 64, 0, 0, 2, 6, 0, 15531, 100, 1, 0, 0, 64, 10, 15, 10, 15, 0, 13009, 100, 1, 0, 0, 0, 8, 8, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spells_template`=73580, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=7358;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
