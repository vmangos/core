DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220717202109');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220717202109');
-- Add your query below.


-- Events list for Eye of Naxxramas
DELETE FROM `creature_ai_events` WHERE `creature_id`=10411;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1041101, 10411, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 1041101, 0, 0, 'Eye of Naxxramas - Cast Greater Invisibility OOC'),
(1041102, 10411, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1041102, 0, 0, 'Eye of Naxxramas - Yell and Summon Gargoyles on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1041101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1041101, 0, 0, 15, 16380, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye of Naxxramas - Cast Spell Greater Invisibility');
DELETE FROM `creature_ai_scripts` WHERE `id`=1041102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1041102, 0, 0, 14, 16380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye of Naxxramas - Remove Aura Greater Invisibility'),
(1041102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5773, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye of Naxxramas - Say Text'),
(1041102, 0, 2, 15, 16381, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eye of Naxxramas - Cast Spell Summon Rockwing Gargoyles');
DELETE FROM `creature_ai_scripts` WHERE `id`=1041103;

-- Remove spell list from Eye of Naxxramas.
DELETE FROM `creature_spells` WHERE `entry`=104110;
UPDATE `creature_template` SET `spell_list_id`=0 WHERE `entry`=10411;

-- Define target for Summon Rockwing Gargoyles.
DELETE FROM `spell_effect_mod` WHERE `id`=16381;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (16381, 1, 10411, 0);

-- Events list for Rockwing Gargoyle
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1040801, 1040802, 1040803, 1040804, 1040805);
DELETE FROM `creature_ai_events` WHERE `creature_id`=10408;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1040801, 10408, 0, 0, 0, 100, 1, 4000, 12000, 4000, 12000, 1040801, 0, 0, 'Rockwing Gargoyle - Cast Sunder Armor in Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=1040801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1040801, 0, 0, 15, 13444, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rockwing Gargoyle - Cast Sunder Armor');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
