DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220806100341');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220806100341');
-- Add your query below.


UPDATE `creature_template` SET `regeneration`=0 WHERE `entry`=16136;
UPDATE `creature_template` SET `regeneration`=0 WHERE `entry`=16172;
UPDATE `creature_template` SET `auras`=NULL, `flags_extra`=0 WHERE `entry`=16230;
UPDATE `creature_template` SET `spawn_spell_id`=10389 WHERE `entry`=16143;
UPDATE `creature_template` SET `spawn_spell_id`=28234 WHERE  `entry` IN (16230,16299,16141,16298,14697,16380,16379,16438,16437,16422,16423,16394,16382,16383);
UPDATE `creature_template` SET `auras`='28346 27887' WHERE  `entry` IN (16136,16172);
UPDATE `creature_template` SET `auras`='28395' WHERE `entry`=16401;
UPDATE `creature_template` SET `spell_list_id`=163830, `ai_name`='EventAI', `script_name`='' WHERE `entry`=16383;
UPDATE `creature_template` SET `spell_list_id`=161430, `ai_name`='EventAI', `script_name`='' WHERE `entry`=16143;
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=181136;

-- Flameshocker Spells
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (163830, 'Flameshocker', 28314, 100, 1, 0, 0, 0, 5, 40, 20, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Shadow of Doom Spells
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (161430, 'Shadow of Doom', 12542, 100, 1, 0, 0, 0, 4, 38, 16, 38, 0, 16568, 100, 1, 0, 0, 136, 3, 38, 4, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Shadow of Doom
DELETE FROM `creature_ai_events` WHERE `creature_id`=16143;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614301, 16143, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1614301, 0, 0, 'Shadow of Doom - Just Spawned');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1614302, 16143, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1614302, 0, 0, 'Shadow of Doom - Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1614301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1614301, 0, 0, 44, 1, 1, 0, 0, 16172, 10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow of Doom - Set Phase for Damaged Necrotic Shard'),
(1614301, 0, 0, 78, 70, 0, 0, 0, 16172, 10, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow of Doom - Join Creature Group');

DELETE FROM `creature_ai_scripts` WHERE `id`=1614302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1614302, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow of Doom - Leave Creature Group');

-- Events list for Flameshocker
DELETE FROM `creature_ai_events` WHERE `creature_id`=16383;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638301, 16383, 0, 1, 0, 100, 0, 8600, 335448, 0, 0, 1638301, 0, 0, 'Flameshocker - Cast Spell: Spirit Spawn-out OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638302, 16383, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1638302, 0, 0, 'Flameshocker - Cast Spell: Flameshocker\'s Revenge On Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638301, 0, 0, 15, 17680, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flameshocker - Cast Spell: Spirit Spawn-out OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638302, 0, 0, 15, 28323, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flameshocker - Cast Spell: Flameshocker\'s Revenge On Death');


UPDATE `spell_script_target` SET `type`=0, `targetEntry`=181142 WHERE `entry`=31315 AND `type`=1 AND `targetEntry`=16230;
DELETE FROM `spell_script_target` WHERE `entry`=16172 AND `type`=1 AND `targetEntry`=16136;

-- Move GameObject Necropolis to DB.
UPDATE `gameobject` SET `spawn_flags`=1, `visibility_mod`=5000 WHERE `id` IN (181154,181373,181374,181215,181223,181172);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` IN (181154,181373,181374,181215,181223,181172);

UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry` IN (16401,16386,16398,16172,16230);
UPDATE `creature` SET `spawn_flags`=1, `visibility_mod`=5000 WHERE `id` IN (16401,16386,16398,16172);

INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES
    (28078, 1, 16172, 0, 0, 5464, 5875),
    (28054, 0, 181112, 0, 0, 5464, 5875),
    (27885, 0, 181111, 0, 0, 5464, 5875),
    (27885, 0, 181155, 0, 0, 5464, 5875),
    (27885, 0, 181156, 0, 0, 5464, 5875),
    (27885, 0, 181163, 0, 0, 5464, 5875),
    (27886, 0, 181112, 0, 0, 5464, 5875);
    
-- Missing GameObjects.
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES
    (181111, 9, 6, 5811, 'Minion Spawner, ghost/ghoul', 0, 0, 1, 0, 0, 0, 27883, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181112, 9, 6, 5811, 'Buttress Spawner', 0, 0, 1, 0, 0, 0, 28024, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181155, 9, 6, 5811, 'Minion Spawner, ghost/skeleton', 0, 0, 1, 0, 0, 0, 28186, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181156, 9, 6, 5811, 'Minion Spawner, ghoul/skeleton', 0, 0, 1, 0, 0, 0, 28187, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (181163, 9, 6, 327, 'Minion Spawner, finder', 0, 0, 1, 0, 0, 0, 28227, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
    -- (181214, 9, 6, 327, 'Necropolis critter spawner', 0, 0, 1, 0, 0, 0, 27866, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Events list for Necropolis Relay
DELETE FROM `creature_ai_events` WHERE `creature_id`=16386;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638604, 16386, 0, 8, 0, 100, 0, 28366, 1, 0, 0, 1638604, 0, 0, 'Necropolis Relay - Hit by Communique, Proxy-to-Relay Once to activate Circle');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638601, 16386, 0, 8, 0, 100, 1, 28366, 1, 0, 0, 1638601, 0, 0, 'Necropolis Relay - Hit by Communique, Proxy-to-Relay');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638603, 16386, 0, 8, 0, 100, 1, 28351, 1, 0, 0, 1638603, 0, 0, 'Necropolis Relay - Hit by Communique, Camp-to-Relay, Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1638602, 16386, 0, 8, 0, 100, 1, 28281, 1, 0, 0, 1638602, 0, 0, 'Necropolis Relay - Hit by Communique, Camp-to-Relay');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638601, 0, 0, 15, 28326, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Relay-to-Camp');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638602, 0, 0, 15, 28365, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Relay-to-Proxy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638603, 0, 0, 15, 28351, 2, 0, 0, 16398, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Cast Communique, Camp-to-Relay, Death On Necropolis Proxy');

DELETE FROM `creature_ai_scripts` WHERE `id`=1638604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1638604, 0, 0, 13, 0, 0, 0, 0, 181136, 200, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Relay - Activate Circle');

-- Events list for Necropolis Proxy
DELETE FROM `creature_ai_events` WHERE `creature_id`=16398;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
    (1639801, 16398, 0, 8, 0, 100, 1, 28373, 1, 0, 0, 1639801, 0, 0, 'Necropolis Proxy - Hit by Communique, Necropolis-to-Proxies'),
    (1639802, 16398, 0, 8, 0, 100, 1, 28365, 1, 0, 0, 1639802, 0, 0, 'Necropolis Proxy - Hit by Communique, Relay-to-Proxy'),
    (1639803, 16398, 0, 8, 0, 100, 1, 28351, 1, 0, 0, 1639803, 0, 0, 'Necropolis Proxy - Hit by Communique, Camp-to-Relay, Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639801, 0, 0, 15, 28366, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Proxy-to-Relay');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639802, 0, 0, 15, 28367, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Proxy-to-Necropolis');

DELETE FROM `creature_ai_scripts` WHERE `id`=1639803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1639803, 0, 0, 15, 28351, 2, 0, 0, 16421, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Necropolis Proxy - Cast Communique, Camp-to-Relay, Death On Necropolis health');

-- Events list for Damaged Necrotic Shard
DELETE FROM `creature_ai_events` WHERE `creature_id`=16172;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617201, 16172, 0, 8, 0, 100, 1, 28326, 1, 0, 0, 1617201, 0, 0, 'Damaged Necrotic Shard - Hit by Communique, Relay-to-Camp');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617202, 16172, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1617202, 0, 0, 'Damaged Necrotic Shard - Just spawned');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617203, 16172, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1617203, 0, 0, 'Damaged Necrotic Shard - Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617204, 16172, 0, 1, 0, 100, 1, 5000, 5000, 5000, 5000, 1617204, 0, 0, 'Damaged Necrotic Shard - Timmer OOC,  if not in Group');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617205, 16172, 0, 32, 0, 100, 1, 16230, 0, 0, 0, 1617205, 0, 0, 'Damaged Necrotic Shard - Group Member Died: Cultist');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1617206, 16172, 0, 32, 0, 100, 1, 16143, 0, 0, 0, 1617205, 0, 0, 'Damaged Necrotic Shard - Group Member Died: Shadow of Doom');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617201, 0, 0, 15, 28449, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Camp Receives Communique');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617202, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Set Phase 1'),
(1617202, 0, 2, 15, 27887, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Minion Spawner, small'),
(1617202, 0, 2, 15, 28201, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Choose Camp Type'),
(1617202, 0, 2, 15, 27888, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Minion Spawner, Buttress'),
(1617202, 0, 2, 15, 27886, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Cast Disturb Minion Trap, Buttress'),
(1617202, 0, 3, 18, 4000, 0, 0, 0, 16136, 5, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard -  Despawn Necrotic Shard');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617203, 0, 0, 15, 28351, 2, 0, 0, 16386, 200, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Communique, Camp-to-Relay, Death'),
(1617203, 0, 0, 15, 28681, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Soul Revival'),
(1617203, 0, 0, 18, 4000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Despawn self');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617204;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617204, 0, 0, 15, 28056, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Cast Spell');

DELETE FROM `creature_ai_scripts` WHERE `id`=1617205;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1617205, 0, 0, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Damaged Necrotic Shard - Set Phase');

-- Events list for Cultist Engineer
DELETE FROM `creature_ai_events` WHERE `creature_id`=16230;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
    (1623001, 16230, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1623001, 0, 0, 'Cultist Engineer - Just spawned'),
    (1623002, 16230, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1623002, 0, 0, 'Cultist Engineer - Death');

DELETE FROM `creature_ai_scripts` WHERE `id`=1623001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623001, 0, 0, 44, 1, 1, 0, 0, 16172, 10, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Set Phase for Damaged Necrotic Shard'),
(1623001, 0, 0, 78, 64, 0, 0, 0, 16172, 10, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Join Creature Group'),
(1623001, 0, 0, 39, 1623001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Start Script');

DELETE FROM `creature_ai_scripts` WHERE `id`=1623002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623002, 0, 0, 15, 28041, 2, 0, 0, 16172, 15, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Damage Crystal'),
(1623002, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Leave Creature Group');

DELETE FROM `generic_scripts` WHERE `id`=1623001;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1623001, 0, 1, 35, 0, 0, 0, 0, 16172, 15, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Face Damaged Necrotic Shard'),
(1623001, 0, 2, 15, 28132, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Create Summoner Shield'),
(1623001, 1, 3, 15, 29826, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Self Stun (DND)'),
(1623001, 2, 4, 15, 28078, 2, 0, 0, 16172, 15, 8, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Cast Buttress Channel');

DELETE FROM `gossip_scripts` WHERE `id`=7166;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7166, 0, 0, 15, 27852, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cultist Engineer - Summon Shadow of Doom');

-- Pallid and Flameshockers respawn.
SET @FLAMESHOCKER_GUID = 66900;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
    (@FLAMESHOCKER_GUID+1, 16383, 0, 0, 0, 0, -9001.15, 891.015, 105.505, 2.29504, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Mage Quarter.
    (@FLAMESHOCKER_GUID+2, 16383, 0, 0, 0, 0, -8997.9, 834.881, 105.855, 1.91986, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Mage Quarter.
    (@FLAMESHOCKER_GUID+3, 16383, 0, 0, 0, 0, -8931.39, 960.914, 117.416, 0.663225, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Mage Quarter.
    (@FLAMESHOCKER_GUID+4, 16383, 0, 0, 0, 0, -8879.42, 579.776, 93.0791, 4.62512, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Trade District.
    (@FLAMESHOCKER_GUID+5, 16383, 0, 0, 0, 0, -8850.97, 653.117, 96.6387, 2.61799, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Trade District.
    (@FLAMESHOCKER_GUID+6, 16383, 0, 0, 0, 0, -8833.34, 622.748, 93.7479, 1.91986, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Trade District.
    (@FLAMESHOCKER_GUID+7, 16383, 0, 0, 0, 0, -8810.19, 580.752, 95.9053, 0.663225, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Trade District.
    (@FLAMESHOCKER_GUID+8, 16383, 0, 0, 0, 0, -8780.81, 1068.88, 90.8636, 2.61799, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: The Park.
    (@FLAMESHOCKER_GUID+9, 16383, 0, 0, 0, 0, -8733.97, 1106.75, 92.6246, 0.663225, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: The Park.
    (@FLAMESHOCKER_GUID+10, 16383, 0, 0, 0, 0, -8731.61, 1003.63, 95.8085, 1.91986, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: The Park.
    (@FLAMESHOCKER_GUID+11, 16383, 0, 0, 0, 0, -8722.22, 441.27, 97.3523, 1.91986, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Old Town.
    (@FLAMESHOCKER_GUID+12, 16383, 0, 0, 0, 0, -8698.38, 401.52, 101.099, 2.61799, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Old Town.
    (@FLAMESHOCKER_GUID+13, 16383, 0, 0, 0, 0, -8634.71, 444.417, 102.237, 0.663225, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Old Town.
    (@FLAMESHOCKER_GUID+14, 16383, 0, 0, 0, 0, -8585.14, 903.542, 81.7025, 4.72984, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+15, 16383, 0, 0, 0, 0, -8583.97, 906.899, 81.7026, 3.83972, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+16, 16383, 0, 0, 0, 0, -8583.51, 901.15, 81.7033, 4.08407, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+17, 16394, 0, 0, 0, 0, -8581.79, 904.538, 81.7021, 3.82227, 2700, 2700, 5, 100, 100, 2, 0, 0, 0, 10), -- Pallid Horror in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+18, 16383, 0, 0, 0, 0, -8580.33, 901.258, 81.7028, 3.92699, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+19, 16383, 0, 0, 0, 0, -8579.29, 907.101, 81.702, 3.92699, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Cethedral of Light.
    (@FLAMESHOCKER_GUID+20, 16383, 0, 0, 0, 0, -8450.78, 587.494, 94.1273, 0.663225, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Dwarven District.
    (@FLAMESHOCKER_GUID+21, 16383, 0, 0, 0, 0, -8394.75, 575.578, 91.3721, 2.93627, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Dwarven District.
    (@FLAMESHOCKER_GUID+22, 16383, 0, 0, 0, 0, -8367.51, 637.011, 94.9871, 4.1433, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Stormwind City: Dwarven District.
    (@FLAMESHOCKER_GUID+23, 16383, 0, 0, 0, 0, 1420.04, 119.324, -62.2049, 1.32645, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+24, 16383, 0, 0, 0, 0, 1445.72, 91.438, -62.2014, 0.802851, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+25, 16383, 0, 0, 0, 0, 1489.15, 67.53, -62.2138, 2.37365, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+26, 16383, 0, 0, 0, 0, 1492.07, 180.029, -62.0023, 3.61883, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+27, 16383, 0, 0, 0, 0, 1493.05, 186.522, -62.0734, 4.11898, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+28, 16383, 0, 0, 0, 0, 1532.72, 273.599, -62.0943, 1.25664, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Canals.
    (@FLAMESHOCKER_GUID+29, 16383, 0, 0, 0, 0, 1532.99, 278.193, -62.0943, 1.53589, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Canals.
    (@FLAMESHOCKER_GUID+30, 16383, 0, 0, 0, 0, 1534.92, 138.913, -62.0883, 4.34587, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+31, 16394, 0, 0, 0, 0, 1535.76, 274.897, -62.0943, 1.0821, 2700, 2700, 5, 100, 100, 2, 0, 0, 0, 10), -- Pallid Horror in Undercity: Canals.
    (@FLAMESHOCKER_GUID+32, 16383, 0, 0, 0, 0, 1536.4, 271.839, -62.0943, 1.23918, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Canals.
    (@FLAMESHOCKER_GUID+33, 16383, 0, 0, 0, 0, 1537.21, 278.743, -62.0943, 1.20428, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Canals.
    (@FLAMESHOCKER_GUID+34, 16383, 0, 0, 0, 0, 1539.85, 274.237, -62.0943, 1.20428, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Canals.
    (@FLAMESHOCKER_GUID+35, 16383, 0, 0, 0, 0, 1545.37, 142.682, -62.0049, 0.358143, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Rogues Quarter.
    (@FLAMESHOCKER_GUID+36, 16383, 0, 0, 0, 0, 1582.24, 276.854, -43.0193, 0.174533, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Trade Quarter.
    (@FLAMESHOCKER_GUID+37, 16383, 0, 0, 0, 0, 1582.34, 252.503, -61.994, 3.57792, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Trade Quarter.
    (@FLAMESHOCKER_GUID+38, 16383, 0, 0, 0, 0, 1606.54, 239.628, -52.0687, 0.0698132, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Trade Quarter.
    (@FLAMESHOCKER_GUID+39, 16383, 0, 0, 0, 0, 1609.49, 229.112, -61.994, 5.25344, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Trade Quarter.
    (@FLAMESHOCKER_GUID+40, 16383, 0, 0, 0, 0, 1609.66, 205.781, -43.0193, 3.56047, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Trade Quarter.
    (@FLAMESHOCKER_GUID+41, 16383, 0, 0, 0, 0, 1626.6, 481.696, -22.7855, 5.23599, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+42, 16383, 0, 0, 0, 0, 1627.48, 477.444, -22.7847, 4.71239, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+43, 16383, 0, 0, 0, 0, 1627.97, 484.273, -22.7855, 6.21337, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+44, 16383, 0, 0, 0, 0, 1629.02, 477.154, -22.7847, 1.88496, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+45, 16394, 0, 0, 0, 0, 1629.41, 480.468, -22.7851, 4.69494, 2700, 2700, 5, 100, 100, 2, 0, 0, 0, 10), -- Pallid Horror in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+46, 16383, 0, 0, 0, 0, 1630.92, 484.171, -22.7855, 3.26377, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+47, 16383, 0, 0, 0, 0, 1631.27, 477.82, -22.785, 5.27089, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+48, 16383, 0, 0, 0, 0, 1632.22, 481.066, -22.7855, 5.41052, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+49, 16383, 0, 0, 0, 0, 1634.59, 477.738, -21.8358, 4.4855, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+50, 16383, 0, 0, 0, 0, 1634.67, 479.701, -21.8066, 1.64061, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Sewers.
    (@FLAMESHOCKER_GUID+51, 16383, 0, 0, 0, 0, 1654.89, 134.022, -62.0874, 3.57792, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Magic Quarter.
    (@FLAMESHOCKER_GUID+52, 16383, 0, 0, 0, 0, 1656.79, 341.062, -62.0883, 5.34071, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: War Quarter.
    (@FLAMESHOCKER_GUID+53, 16383, 0, 0, 0, 0, 1666.35, 150.947, -62.0023, 0.443699, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Magic Quarter.
    (@FLAMESHOCKER_GUID+54, 16383, 0, 0, 0, 0, 1693.4, 409.976, -62.2141, 3.94444, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: War Quarter.
    (@FLAMESHOCKER_GUID+55, 16383, 0, 0, 0, 0, 1694.36, 66.5781, -62.2057, 0.174533, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Magic Quarter.
    (@FLAMESHOCKER_GUID+56, 16383, 0, 0, 0, 0, 1700.87, 181.282, -62.0883, 5.25344, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Magic Quarter.
    (@FLAMESHOCKER_GUID+57, 16383, 0, 0, 0, 0, 1724.52, 369.016, -60.4011, 0.802851, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: War Quarter.
    (@FLAMESHOCKER_GUID+58, 16383, 0, 0, 0, 0, 1738.85, 95.2721, -62.1996, 2.37365, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: Magic Quarter.
    (@FLAMESHOCKER_GUID+59, 16383, 0, 0, 0, 0, 1767.03, 339.711, -62.205, 1.32645, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10), -- Flameshocker in Undercity: War Quarter.
    (@FLAMESHOCKER_GUID+60, 16383, 0, 0, 0, 0, 1769.06, 132.345, -62.2104, 3.56047, 900, 900, 25, 100, 100, 1, 0, 0, 0, 10); -- Flameshocker in Undercity: Magic Quarter.

INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
    (@FLAMESHOCKER_GUID+1, 1431, 0, 'Flameshocker in Stormwind City: Mage Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+2, 1431, 0, 'Flameshocker in Stormwind City: Mage Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+3, 1431, 0, 'Flameshocker in Stormwind City: Mage Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+4, 1432, 0, 'Flameshocker in Stormwind City: Trade District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+5, 1432, 0, 'Flameshocker in Stormwind City: Trade District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+6, 1432, 0, 'Flameshocker in Stormwind City: Trade District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+7, 1432, 0, 'Flameshocker in Stormwind City: Trade District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+8, 1433, 0, 'Flameshocker in Stormwind City: The Park', 0, 0, 10),
    (@FLAMESHOCKER_GUID+9, 1433, 0, 'Flameshocker in Stormwind City: The Park', 0, 0, 10),
    (@FLAMESHOCKER_GUID+10, 1433, 0, 'Flameshocker in Stormwind City: The Park', 0, 0, 10),
    (@FLAMESHOCKER_GUID+11, 1434, 0, 'Flameshocker in Stormwind City: Old Town', 0, 0, 10),
    (@FLAMESHOCKER_GUID+12, 1434, 0, 'Flameshocker in Stormwind City: Old Town', 0, 0, 10),
    (@FLAMESHOCKER_GUID+13, 1434, 0, 'Flameshocker in Stormwind City: Old Town', 0, 0, 10),
    (@FLAMESHOCKER_GUID+14, 1431, 0, 'Flameshocker in Stormwind City: Cethedral of Light', 0, 0, 10),
    (@FLAMESHOCKER_GUID+15, 1431, 0, 'Flameshocker in Stormwind City: Cethedral of Light', 0, 0, 10),
    (@FLAMESHOCKER_GUID+16, 1431, 0, 'Flameshocker in Stormwind City: Cethedral of Light', 0, 0, 10),
    (@FLAMESHOCKER_GUID+17, 1441, 0, 'Pallid Horror in Stormwind City: Cethedral of Light', 0, 0, 10), 
    (@FLAMESHOCKER_GUID+18, 1431, 0, 'Flameshocker in Stormwind City: Cethedral of Light', 0, 0, 10),
    (@FLAMESHOCKER_GUID+19, 1431, 0, 'Flameshocker in Stormwind City: Cethedral of Light', 0, 0, 10),
    (@FLAMESHOCKER_GUID+20, 1435, 0, 'Flameshocker in Stormwind City: Dwarven District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+21, 1435, 0, 'Flameshocker in Stormwind City: Dwarven District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+22, 1435, 0, 'Flameshocker in Stormwind City: Dwarven District', 0, 0, 10),
    (@FLAMESHOCKER_GUID+23, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+24, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+25, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+26, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+27, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+28, 1432, 0, 'Flameshocker in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+29, 1432, 0, 'Flameshocker in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+30, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+31, 1442, 0, 'Pallid Horror in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+32, 1432, 0, 'Flameshocker in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+33, 1432, 0, 'Flameshocker in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+34, 1432, 0, 'Flameshocker in Undercity: Canals', 0, 0, 10),
    (@FLAMESHOCKER_GUID+35, 1436, 0, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+36, 1437, 0, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+37, 1437, 0, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+38, 1437, 0, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+39, 1437, 0, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+40, 1437, 0, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+41, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+42, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+43, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+44, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+45, 1442, 0, 'Pallid Horror in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+46, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+47, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+48, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+49, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+50, 1432, 0, 'Flameshocker in Undercity: Sewers', 0, 0, 10),
    (@FLAMESHOCKER_GUID+51, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+52, 1439, 0, 'Flameshocker in Undercity: War Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+53, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+54, 1439, 0, 'Flameshocker in Undercity: War Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+55, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+56, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+57, 1439, 0, 'Flameshocker in Undercity: War Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+58, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+59, 1439, 0, 'Flameshocker in Undercity: War Quarter', 0, 0, 10),
    (@FLAMESHOCKER_GUID+60, 1438, 0, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
    (1431, 1, 'Flameshocker in Stormwind City: Mage Quarter', 0, 0, 0, 10),
    (1432, 1, 'Flameshocker in Stormwind City: Trade District', 0, 0, 0, 10),
    (1433, 1, 'Flameshocker in Stormwind City: The Park', 0, 0, 0, 10),
    (1434, 1, 'Flameshocker in Stormwind City: Old Town', 0, 0, 0, 10),
    (1435, 1, 'Flameshocker in Stormwind City: Dwarven District', 0, 0, 0, 10),
    (1436, 1, 'Flameshocker in Undercity: Rogues Quarter', 0, 0, 0, 10),
    (1437, 1, 'Flameshocker in Undercity: Trade Quarter', 0, 0, 0, 10),
    (1438, 1, 'Flameshocker in Undercity: Magic Quarter', 0, 0, 0, 10),
    (1439, 1, 'Flameshocker in Undercity: War Quarter', 0, 0, 0, 10),
    (1441, 1, 'Pallid in Stormwind City', 0, 0, 0, 10),
    (1442, 1, 'Pallid in Undercity', 0, 0, 0, 10);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
    (@FLAMESHOCKER_GUID+17, @FLAMESHOCKER_GUID+14, 5, 0, 8), -- Flameshocker in Stormwind City: Cethedral of Light
    (@FLAMESHOCKER_GUID+17, @FLAMESHOCKER_GUID+15, 5, 0, 8), -- Flameshocker in Stormwind City: Cethedral of Light
    (@FLAMESHOCKER_GUID+17, @FLAMESHOCKER_GUID+16, 5, 0, 8), -- Flameshocker in Stormwind City: Cethedral of Light
    (@FLAMESHOCKER_GUID+17, @FLAMESHOCKER_GUID+18, 5, 0, 8), -- Flameshocker in Stormwind City: Cethedral of Light
    (@FLAMESHOCKER_GUID+17, @FLAMESHOCKER_GUID+19, 5, 0, 8), -- Flameshocker in Stormwind City: Cethedral of Light
    (@FLAMESHOCKER_GUID+31, @FLAMESHOCKER_GUID+28, 5, 0, 8), -- Flameshocker in Undercity: Canals
    (@FLAMESHOCKER_GUID+31, @FLAMESHOCKER_GUID+29, 5, 0, 8), -- Flameshocker in Undercity: Canals
    (@FLAMESHOCKER_GUID+31, @FLAMESHOCKER_GUID+32, 5, 0, 8), -- Flameshocker in Undercity: Canals
    (@FLAMESHOCKER_GUID+31, @FLAMESHOCKER_GUID+33, 5, 0, 8), -- Flameshocker in Undercity: Canals
    (@FLAMESHOCKER_GUID+31, @FLAMESHOCKER_GUID+34, 5, 0, 8), -- Flameshocker in Undercity: Canals
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+41, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+42, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+43, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+44, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+46, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+47, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+48, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+49, 5, 0, 8), -- Flameshocker in Undercity: Sewers
    (@FLAMESHOCKER_GUID+45, @FLAMESHOCKER_GUID+50, 5, 0, 8); -- Flameshocker in Undercity: Sewers

    
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
