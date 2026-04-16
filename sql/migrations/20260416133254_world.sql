DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260416133254');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260416133254');
-- Add your query below.


INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (10805, 1, 7668, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (10834, 1, 7669, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (10835, 1, 7671, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (10836, 1, 7670, 0, 0, 0, 5875);

DELETE FROM `generic_scripts` WHERE `id`=12938;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(12938, 3, 0, 15, 10848, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Stones That Bind Us: Servant - Cast Spell Shroud of Death'),
(12938, 5, 0, 15, 10807, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Stones That Bind Us: Servant - Cast Spell Ghost Dance');

-- Events list for Servant of Razelikh
DELETE FROM `creature_ai_events` WHERE `creature_id`=7668;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(766801, 7668, 0, 11, 0, 100, 0, 0, 0, 0, 0, 766801, 0, 0, 'Servant of Razelikh - Set Invincibility at 1% HP on Spawn'),
(766802, 7668, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 766802, 0, 0, 'Servant of Razelikh - Remove Invincibility on Fel Curse Spell Hit'),
(766803, 7668, 0, 7, 0, 100, 0, 0, 0, 0, 0, 766803, 0, 0, 'Servant of Razelikh - Set Invincibility at 1% HP on Evade'),
(766804, 7668, 0, 2, 0, 100, 0, 5, 0, 1, 1, 766804, 0, 0, 'Servant of Razelikh - Cast Spirit Shock at 5% HP'),
(766805, 7668, 0, 6, 0, 100, 0, 0, 0, 0, 0, 766805, 0, 0, 'Servant of Razelikh - Talk on Death'),
(766806, 7668, 0, 8, 0, 100, 0, 10805, -1, 0, 0, 766806, 0, 0, 'Servant of Razelikh - Remove Invincibility on Shackle Shatter Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=766806;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(766806, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Disable Invincibility'),
(766806, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Disable Melee Attack'),
(766806, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Disable Combat Movement'),
(766806, 0, 1, 39, 12938, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Razelikh - Start Script');

-- Events list for Servant of Grol
DELETE FROM `creature_ai_events` WHERE `creature_id`=7669;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(766901, 7669, 0, 11, 0, 100, 0, 0, 0, 0, 0, 766901, 0, 0, 'Servant of Servant of Grol - Set Invincibility at 1% HP on Spawn'),
(766902, 7669, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 766902, 0, 0, 'Servant of Servant of Grol - Remove Invincibility on Fel Curse Spell Hit'),
(766903, 7669, 0, 7, 0, 100, 0, 0, 0, 0, 0, 766903, 0, 0, 'Servant of Servant of Grol - Set Invincibility at 1% HP on Evade'),
(766904, 7669, 0, 2, 0, 100, 0, 5, 0, 1, 1, 766904, 0, 0, 'Servant of Servant of Grol - Cast Spirit Shock at 5% HP'),
(766905, 7669, 0, 6, 0, 100, 0, 0, 0, 0, 0, 766905, 0, 0, 'Servant of Servant of Grol - Talk on Death'),
(766906, 7669, 0, 8, 0, 100, 0, 10834, -1, 0, 0, 766906, 0, 0, 'Servant of Servant of Grol - Remove Invincibility on Shackle Shatter Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=766906;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(766906, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Grol - Disable Invincibility'),
(766906, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Grol - Disable Melee Attack'),
(766906, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Grol - Disable Combat Movement'),
(766906, 0, 1, 39, 12938, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Grol - Start Script');

-- Events list for Servant of Sevine
DELETE FROM `creature_ai_events` WHERE `creature_id`=7671;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(767101, 7671, 0, 11, 0, 100, 0, 0, 0, 0, 0, 767101, 0, 0, 'Servant of Sevine - Set Invincibility at 1% HP on Spawn'),
(767102, 7671, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 767102, 0, 0, 'Servant of Sevine - Remove Invincibility on Fel Curse Spell Hit'),
(767103, 7671, 0, 7, 0, 100, 0, 0, 0, 0, 0, 767103, 0, 0, 'Servant of Sevine - Set Invincibility at 1% HP on Evade'),
(767104, 7671, 0, 2, 0, 100, 0, 5, 0, 1, 1, 767104, 0, 0, 'Servant of Sevine - Cast Spirit Shock at 5% HP'),
(767105, 7671, 0, 6, 0, 100, 0, 0, 0, 0, 0, 767105, 0, 0, 'Servant of Sevine - Talk on Death'),
(767106, 7671, 0, 8, 0, 100, 0, 10835, -1, 0, 0, 767106, 0, 0, 'Servant of Sevine - Remove Invincibility on Shackle Shatter Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=767106;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(767106, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Disable Invincibility'),
(767106, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Disable Melee Attack'),
(767106, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Disable Combat Movement'),
(767106, 0, 1, 39, 12938, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Sevine - Start Script');

-- Events list for Servant of Allistarj
DELETE FROM `creature_ai_events` WHERE `creature_id`=7670;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(767001, 7670, 0, 11, 0, 100, 0, 0, 0, 0, 0, 767001, 0, 0, 'Servant of Allistarj - Set Invincibility at 1% HP on Spawn'),
(767002, 7670, 600, 8, 0, 100, 0, 12938, -1, 0, 0, 767002, 0, 0, 'Servant of Allistarj - Remove Invincibility on Fel Curse Spell Hit'),
(767003, 7670, 0, 7, 0, 100, 0, 0, 0, 0, 0, 767003, 0, 0, 'Servant of Allistarj - Set Invincibility at 1% HP on Evade'),
(767004, 7670, 0, 2, 0, 100, 0, 5, 0, 1, 1, 767004, 0, 0, 'Servant of Allistarj - Cast Spirit Shock at 5% HP'),
(767005, 7670, 0, 6, 0, 100, 0, 0, 0, 0, 0, 767005, 0, 0, 'Servant of Allistarj - Talk on Death'),
(767006, 7670, 0, 8, 0, 100, 0, 10836, -1, 0, 0, 767006, 0, 0, 'Servant of Allistarj - Remove Invincibility on Shackle Shatter Spell Hit');
DELETE FROM `creature_ai_scripts` WHERE `id`=767006;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(767006, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Disable Invincibility'),
(767006, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Disable Melee Attack'),
(767006, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Disable Combat Movement'),
(767006, 0, 1, 39, 12938, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Servant of Allistarj - Start Script');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
