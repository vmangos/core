DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231219214428');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231219214428');
-- Add your query below.


-- Events list for Stromgarde Troll Hunter
DELETE FROM `creature_ai_events` WHERE `creature_id`=2583;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (258301, 2583, 0, 6, 0, 100, 0, 0, 0, 0, 0, 258301, 0, 0, 'Stromgarde Troll Hunter - Cast Spell Stromgarde Death on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (258302, 2583, 0, 2, 0, 100, 1, 50, 0, 12000, 18000, 258302, 0, 0, 'Stromgarde Troll Hunter - Cast Flash Heal at 50% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=258301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(258301, 0, 0, 15, 8894, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Troll Hunter - Cast Spell Stromgarde Death');

-- Events list for Stromgarde Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=2584;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (258401, 2584, 0, 6, 0, 100, 0, 0, 0, 0, 0, 258401, 0, 0, 'Stromgarde Defender - Cast Spell Stromgarde Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=258401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(258401, 0, 0, 15, 8894, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Defender - Cast Spell Stromgarde Death');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2584;

-- Events list for Stromgarde Vindicator
DELETE FROM `creature_ai_events` WHERE `creature_id`=2585;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (258501, 2585, 0, 8, 0, 100, 0, 8894, -1, 0, 0, 258501, 0, 0, 'Stromgarde Vindicator - Cast Vegeance on Hit By Spell Stromgarde Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (258502, 2585, 0, 6, 0, 100, 0, 0, 0, 0, 0, 258502, 0, 0, 'Stromgarde Vindicator - Cast Spell Stromgarde Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=258501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(258501, 0, 0, 15, 8602, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Vindicator - Cast Spell Vengeance'),
(258501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1151, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Vindicator - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=258502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(258502, 0, 0, 15, 8894, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Vindicator - Cast Spell Stromgarde Death');

-- Events list for Stromgarde Cavalryman
DELETE FROM `creature_ai_events` WHERE `creature_id`=2738;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (273801, 2738, 0, 4, 0, 100, 0, 0, 0, 0, 0, 273801, 0, 0, 'Stromgarde Cavalryman - Cast Rushing Charge on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (273802, 2738, 0, 6, 0, 100, 0, 0, 0, 0, 0, 273802, 0, 0, 'Stromgarde Cavalryman - Cast Spell Stromgarde Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=273802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(273802, 0, 0, 15, 8894, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Cavalryman - Cast Spell Stromgarde Death');

-- Events list for Refuge Pointe Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=10696;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1069601, 10696, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1069601, 0, 0, 'Refuge Pointe Defender - Cast Defensive Stance on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1069602, 10696, 10696, 1, 0, 100, 1, 6000, 9000, 6000, 9000, 1069602, 0, 0, 'Refuge Pointe Defender - Emote Talk OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1069603, 10696, 10696, 6, 0, 100, 0, 0, 0, 0, 0, 1069603, 0, 0, 'Refuge Pointe Defender - Cast Spell Stromgarde Death on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1069603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1069603, 0, 0, 15, 8894, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Refuge Pointe Defender - Cast Spell Stromgarde Death');

-- Define spell targets.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (8894, 1, 2585, 0, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
