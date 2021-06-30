DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210119175612');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210119175612');
-- Add your query below.


-- Remove target hack from Earthgrab causing it to target friendlies.
DELETE FROM `spell_effect_mod` WHERE `Id`=8377;

-- Zul'Farrak zombies do not cast any spells.
DELETE FROM `creature_spells` WHERE `entry`=7286;
UPDATE `creature_template` SET `spell_list_id`=0 WHERE `entry`=7286;

-- Zum'rah encounter in progress (begins when area trigger makes him hostile).
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (298, 34, 4, 1, 0, 0, 0);

-- Events list for Zul'Farrak Zombie
DELETE FROM `creature_ai_events` WHERE `creature_id`=7286;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (728601, 7286, 298, 11, 2, 100, 0, 0, 0, 0, 0, 728601, 0, 0, 'Zul\'Farrak Zombie - Move to Zum\'rah on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (728602, 7286, 4018, 1, 2, 100, 0, 0, 0, 0, 0, 728602, 0, 0, 'Zul\'Farrak Zombie - Set In Combat with Zone on Spawn (After 1.10)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (728603, 7286, 4018, 4, 2, 100, 0, 0, 0, 0, 0, 728602, 0, 0, 'Zul\'Farrak Zombie - Set In Combat with Zone on Aggro (After 1.10)');
DELETE FROM `creature_ai_scripts` WHERE `id`=728601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (728601, 0, 3, 2, 0, 69, 0, 81524, 0, 9, 0, 0, 0, 0, 0, 3, 0, 0, 6, 0, 'Zul\'Farrak Zombie - Move to Zum\'rah');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (728601, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zul\'Farrak Zombie - Set Phase to 1');

-- Events list for Zul'Farrak Dead Hero
DELETE FROM `creature_ai_events` WHERE `creature_id`=7276;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727601, 7276, 298, 11, 2, 100, 0, 0, 0, 0, 0, 727601, 0, 0, 'Zul\'Farrak Dead Hero - Move to Zum\'rah on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727602, 7276, 4018, 1, 2, 100, 0, 0, 0, 0, 0, 727602, 0, 0, 'Zul\'Farrak Dead Hero - Set In Combat with Zone on Spawn (After 1.10)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727603, 7276, 4018, 4, 2, 100, 0, 0, 0, 0, 0, 727602, 0, 0, 'Zul\'Farrak Dead Hero - Set In Combat with Zone on Aggro (After 1.10)');
DELETE FROM `creature_ai_scripts` WHERE `id`=727601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (727601, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zul Farrak Dead Hero - Set Phase to 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (727601, 0, 3, 2, 0, 69, 0, 81524, 0, 9, 0, 0, 0, 0, 0, 3, 0, 0, 6, 0, 'Zul Farrak Dead Hero - Assist Zum\'rah');

-- Events list for Witch Doctor Zum'rah
DELETE FROM `creature_ai_events` WHERE `creature_id`=7271;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727101, 7271, 0, 4, 0, 100, 0, 0, 0, 0, 0, 727101, 0, 0, 'Witch Doctor Zum\'rah - Yell on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727102, 7271, 0, 5, 0, 100, 1, 10000, 10000, 1, 0, 727102, 0, 0, 'Witch Doctor Zum\'rah - Yell on Killed Player');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727103, 7271, 125, 0, 0, 100, 1, 1000, 5000, 18000, 18000, 727103, 0, 0, 'Witch Doctor Zum\'rah - Summon Zombies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (727104, 7271, 0, 6, 0, 100, 0, 0, 0, 0, 0, 727104, 0, 0, 'Witch Doctor Zum\'rah - Set Data on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=727104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (727104, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum\'rah - Set Data');

-- Prevent Zum'rah from assisting zombies.
UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 65536 WHERE `entry`=7271;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
