DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211205111918');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211205111918');
-- Add your query below.


-- Events list for Jezelle Pruitt
DELETE FROM `creature_ai_events` WHERE `creature_id`=5702;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (570201, 5702, 0, 1, 0, 100, 1, 10000, 10000, 260000, 265000, 570201, 0, 0, 'Jezelle Pruitt - Start Script for Undercity Summoning Demonstration');
DELETE FROM `creature_ai_scripts` WHERE `id`=570201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (570201, 0, 39, 57020, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Start Script for Undercity Summoning Demonstration');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (570202, 570203, 570204, 570205, 570206, 570207, 570208, 570209, 570210, 570211, 570212, 570213, 570214, 570215, 570216, 570217, 570218, 570219, 570220, 570221, 570222);

-- Script for Jezelle Pruit's demon summoning event.
DELETE FROM `generic_scripts` WHERE `id`=57020;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(57020, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2049, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 11, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2050, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 17, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 18, 10, 5730, 34101, 0, 0, 0, 0, 0, 0, 2, 57021, -1, 9, 1793.06, 128.017, -63.7599, 0.575959, 0, 'Summon Creature Jezelle\'s Imp'),
(57020, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2051, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 22, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 48, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 48, 20, 0, 0, 0, 0, 5730, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Imp - Move Idle'),
(57020, 48, 15, 7791, 0, 0, 0, 5730, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Imp - Cast Spell Teleport'),
(57020, 55, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2052, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 61, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 62, 10, 5729, 32027, 0, 0, 0, 0, 0, 0, 2, 57021, -1, 9, 1792.87, 128.051, -63.7599, 5.07891, 0, 'Summon Creature Jezelle\'s Voidwalker'),
(57020, 66, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2053, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 92, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 92, 20, 0, 0, 0, 0, 5729, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Voidwalker - Move Idle'),
(57020, 92, 15, 7791, 0, 0, 0, 5729, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Voidwalker - Cast Spell Teleport'),
(57020, 98, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2054, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 105, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 106, 10, 5728, 34008, 0, 0, 0, 0, 0, 0, 2, 57021, -1, 9, 1792.97, 128.331, -63.7599, 0.0349066, 0, 'Summon Creature Jezelle\'s Succubus'),
(57020, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2055, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 110, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 136, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 136, 20, 0, 0, 0, 0, 5728, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Succubus - Move Idle'),
(57020, 136, 15, 7791, 0, 0, 0, 5728, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Succubus - Cast Spell Teleport'),
(57020, 142, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2056, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 149, 10, 5726, 34024, 0, 0, 0, 0, 0, 0, 2, 57021, -1, 9, 1792.86, 128.017, -63.7599, 3.7001, 0, 'Summon Creature Jezelle\'s Felhunter'),
(57020, 149, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 153, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2057, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 179, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 180, 20, 0, 0, 0, 0, 5726, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Felhunter - Move Idle'),
(57020, 180, 15, 7791, 0, 0, 0, 5726, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Felhunter - Cast Spell Teleport'),
(57020, 186, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2058, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 192, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 193, 10, 5727, 33182, 0, 0, 0, 0, 0, 0, 2, 57021, -1, 9, 1793, 128.179, -63.7599, 3.29867, 0, 'Summon Creature Jezelle\'s Felsteed'),
(57020, 197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2059, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text'),
(57020, 197, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 223, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Cast Spell Teleport'),
(57020, 223, 20, 0, 0, 0, 0, 5727, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Felsteed - Move Idle'),
(57020, 223, 15, 7791, 0, 0, 0, 5727, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Felsteed - Cast Spell Teleport'),
(57020, 230, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Emote OneShotTalk'),
(57020, 230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2060, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle Pruitt - Say Text');

-- Spawn scripts for demons summoned by Jezelle Pruit.
DELETE FROM `generic_scripts` WHERE `id`=57021;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(57021, 0, 15, 7791, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jezelle\'s Summoned Demon - Cast Spell Teleport');

-- Update data for Jazelle Pruit's demons.
UPDATE `creature_template` SET `movement_type`=1 WHERE `entry` IN (5730, 5729, 5728, 5726, 5727);
UPDATE `creature_template` SET `level_min`=30, `level_max`=30, `unit_flags`=768, `faction`=68, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.14286, `gold_min`=0, `gold_max`=0 WHERE `entry`=5726;
UPDATE `creature_template` SET `level_min`=40, `level_max`=40, `unit_flags`=768, `faction`=68, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.38571, `gold_min`=0, `gold_max`=0 WHERE `entry`=5727;
UPDATE `creature_template` SET `level_min`=40, `level_max`=40, `unit_flags`=33536, `faction`=68, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.14286, `gold_min`=0, `gold_max`=0 WHERE `entry`=5728;
UPDATE `creature_template` SET `level_min`=40, `level_max`=40, `unit_flags`=768, `faction`=68, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.14286, `gold_min`=0, `gold_max`=0 WHERE `entry`=5729;
UPDATE `creature_template` SET `level_min`=40, `level_max`=40, `unit_flags`=768, `faction`=68, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.14286, `gold_min`=0, `gold_max`=0 WHERE `entry`=5730;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
