DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201120220227');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201120220227');
-- Add your query below.


-- Niby the Almighty and Impsy should roam.
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 10 WHERE `guid` IN (39106, 39105);

-- Add position for Infernal Conjure Dummy DND.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (23053, 1, 5399.49, -740.209, 344.413, 0, 4375, 5875);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `Comment`) VALUES (23053, 0, 17, 0, 'Infernal Conjure Dummy DND - Define Position');

-- Events list for Niby the Almighty.
DELETE FROM `creature_ai_events` WHERE `creature_id`=14469;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1446901, 14469, 0, 1, 0, 100, 1, 30000, 30000, 630000, 650000, 1446901, 0, 0, 'Niby the Almighty - Start Script OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1446901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1446901, 0, 39, 14469, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Start Script');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=14469;

-- OCC event with Niby and Impsy.
DELETE FROM `generic_scripts` WHERE `id`=14469;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(14469, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Move Idle'),
(14469, 0, 20, 0, 0, 0, 1, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Move Idle'),
(14469, 2, 3, 0, 1969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5405.92, -747.87, 348.283, 100, 0, 'Niby the Almighty - Move'),
(14469, 2, 3, 0, 1550, 0, 0, 14470, 30, 8, 2, 0, 0, 0, 0, 5408.42, -747.093, 348.031, 100, 0, 'Impsy - Move'),
(14469, 4, 35, 1, 0, 0, 0, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.67035, 0, 'Impsy - Set Orientation'),
(14469, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9615, 9616, 9617, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(14469, 5, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Emote OneShotExclamation'),
(14469, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.48353, 0, 'Niby the Almighty - Set Orientation'),
(14469, 12, 15, 23053, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Cast Spell Infernal Conjure Dummy DND'),
(14469, 12, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Emote OneShotSpellPreCast'),
(14469, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9618, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(14469, 15, 0, 0, 0, 0, 0, 14470, 30, 8, 2, 9619, 9620, 9621, 0, 0, 0, 0, 0, 0, 'Impsy - Say Text'),
(14469, 20, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.301193, 0, 'Niby the Almighty - Set Orientation'),
(14469, 20, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Emote OneShotExclamation'),
(14469, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9622, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(14469, 24, 25, 1, 0, 0, 0, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Set Run'),
(14469, 25, 0, 0, 0, 0, 0, 14470, 30, 8, 2, 9623, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Say Text'),
(14469, 25, 20, 2, 1, 0, 0, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Start Waypoints'),
(14469, 26, 20, 14, 0, 0, 0, 14470, 30, 8, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Niby the Almighty - Follow Impsy'),
(14469, 49, 25, 0, 0, 0, 0, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Set Walk'),
(14469, 50, 20, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Niby the Almighty - Move Random'),
(14469, 50, 20, 1, 0, 0, 1, 14470, 30, 8, 2, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Impsy - Move Random');

-- Waypoints for Impsy.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(14470, 1, 5417.24, -746.497, 347.425, 100, 0, 0, 0),
(14470, 2, 5403.37, -746.992, 347.392, 100, 0, 0, 0),
(14470, 3, 5398.66, -742.401, 344.712, 100, 0, 0, 0),
(14470, 4, 5413.9, -737.721, 344.552, 100, 0, 0, 0),
(14470, 5, 5417.24, -746.497, 347.425, 100, 0, 0, 0),
(14470, 6, 5403.37, -746.992, 347.392, 100, 0, 0, 0),
(14470, 7, 5398.66, -742.401, 344.712, 100, 0, 0, 0),
(14470, 8, 5413.9, -737.721, 344.552, 100, 0, 0, 0),
(14470, 9, 5417.24, -746.497, 347.425, 100, 0, 0, 0),
(14470, 10, 5403.37, -746.992, 347.392, 100, 0, 0, 0),
(14470, 11, 5398.66, -742.401, 344.712, 100, 0, 0, 0),
(14470, 12, 5413.9, -737.721, 344.552, 100, 0, 0, 0),
(14470, 13, 5417.24, -746.497, 347.425, 100, 0, 0, 0),
(14470, 14, 5403.37, -746.992, 347.392, 100, 0, 0, 0),
(14470, 15, 5398.66, -742.401, 344.712, 100, 0, 0, 0),
(14470, 16, 5413.9, -737.721, 344.552, 100, 0, 0, 0),
(14470, 17, 5417.24, -746.497, 347.425, 100, 0, 0, 0),
(14470, 18, 5403.37, -746.992, 347.392, 100, 0, 0, 0),
(14470, 19, 5410.16, -740.053, 345.112, 100, 0, 0, 0);

-- Completion script for quest Kroshius' Infernal Core.
DELETE FROM `quest_end_scripts` WHERE `id`=7603;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(7603, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Remove Questy Giver Flag'),
(7603, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Move Idle'),
(7603, 0, 20, 0, 0, 0, 1, 14470, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Move Idle'),
(7603, 1, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5407.19, -753, 350.82, 0, 0, 'Niby the Almighty - Move'),
(7603, 1, 3, 0, 0, 1, 2, 14470, 30, 8, 2, 0, 0, 0, 0, 5410.972, -749.903, 349.074, 1.2, 0, 'Impsy - Move'),
(7603, 7, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2, 0, 'Niby the Almighty - Set Orientation'),
(7603, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9634, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(7603, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9635, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(7603, 10, 15, 23056, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty -  Cast Spell'),
(7603, 12, 0, 0, 0, 0, 0, 14470, 30, 8, 2, 9636, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Say Text'),
(7603, 14, 0, 0, 0, 0, 0, 14470, 30, 8, 2, 9637, 0, 0, 0, 0, 0, 0, 0, 0, 'Impsy - Say Text'),
(7603, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9638, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Say Text'),
(7603, 40, 20, 1, 0, 0, 1, 14470, 30, 8, 2, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Impsy - Move Random'),
(7603, 40, 20, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Niby the Almighty - Move Random'),
(7603, 40, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Niby the Almighty - Add Quest Giver Flag');
UPDATE `quest_template` SET `CompleteScript`=7603 WHERE `entry`=7603;

-- Remove not needed texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1000566, -1000567, -1000568, -1000569, -1000570);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
