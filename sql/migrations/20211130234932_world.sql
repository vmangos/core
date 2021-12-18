DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211130234932');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211130234932');
-- Add your query below.


-- Spawn script for Aquementas.
DELETE FROM `event_scripts` WHERE `id`=3708;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3708, 3, 10, 9453, 45000, 0, 0, 0, 0, 0, 0, 1, 9453, -1, 1, -8179.46, -5169.84, 3.99278, 1.3439, 0, 'Aquementas - Summon Aquementas');
DELETE FROM `generic_scripts` WHERE `id`=9453;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9453, 0, 60, 2, 0, 2500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Start Waypoints');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9453, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Set Faction to Friendly');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5465, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Say Text');

-- Waypoints for Aquementas.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(9453, 1, -8179.455566, -5169.841309, 3.992779, 100.000000, 0, 0.000000, 0),
(9453, 2, -8181.312988, -5131.346191, 6.000342, 100.000000, 0, 0.000000, 0),
(9453, 3, -8183.404297, -5118.563965, 6.712635, 100.000000, 0, 0.000000, 0),
(9453, 4, -8183.625488, -5105.875488, 8.694295, 100.000000, 0, 0.000000, 0),
(9453, 5, -8181.305664, -5093.379883, 11.156443, 100.000000, 0, 0.000000, 0),
(9453, 6, -8170.709473, -5077.150879, 16.091116, 100.000000, 0, 0.000000, 945306);

-- Waypoint scripts for Aquementas.
DELETE FROM `creature_movement_scripts` WHERE `id`=945306;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945306, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Set Faction to Monster');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945306, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5427, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Say Emoted Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945306, 1, 15, 13910, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Cast Spell Force Create Elemental Totem');

-- Events list for Aquementas
DELETE FROM `creature_ai_events` WHERE `creature_id`=9453;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945301, 9453, 0, 4, 0, 100, 0, 0, 0, 0, 0, 945301, 0, 0, 'Aquementas - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=945301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5463, 0, 0, 0, 0, 0, 0, 0, 0, 'Aquementas - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (94530, 'Tanaris - Aquementas', 15089, 100, 1, 0, 0, 0, 6, 18, 9, 30, 0, 13586, 100, 1, 0, 0, 0, 9, 14, 24, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gold_min`=0, `gold_max`=0, `dmg_min`=93, `dmg_max`=121, `faction`=91, `spell_list_id`=94530, `spawn_spell_id`=7398, `ai_name`='EventAI', `script_name`='' WHERE `entry`=9453;

-- Remove text from custom table.
DELETE FROM `script_texts` WHERE `entry`=-1000168;

-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5465;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
