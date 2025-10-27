DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250627070320');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250627070320');
-- Add your query below.


-- Events list for Summoned Voidwalker
UPDATE `creature_template` SET `ai_name` = 'EventAI', `movement_type` = 0, `spawn_spell_id` = 7741, `faction` = 35 WHERE `entry` = 5676;
DELETE FROM `creature_ai_events` WHERE `creature_id`=5676;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(567601, 5676, 0, 2, 0, 100, 0, 30, 0, 1, 1, 567601, 0, 0, 'Summoned Voidwalker - Cast Consuming Rage at 30% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=567601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567601, 0, 0, 15, 7750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Cast Consuming Rage');

-- Stormwind
-- Events list for Bloodstone Choker
DELETE FROM `event_scripts` WHERE `id`=1131;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1131, 0, 0, 10, 5676, 180000, 1, 0, 0, 0, 0, 4, 8, 567601, -1, 1, -8972.79, 1043.15, 52.9456, 0, 0, 'The Binding (1689) - Summon Creature Summoned Voidwalker');
DELETE FROM `generic_scripts` WHERE `id`=567601;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567601, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Orientation'),
(567601, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1986, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567601, 2, 0, 81, 42881, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Despawn GameObject'),
(567601, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1987, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567601, 6, 1, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Faction'),
(567601, 7, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Start Attack');

-- Events Script for Heartswood Core
DELETE FROM `event_scripts` WHERE `id`=1134;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134, 0, 0, 10, 5677, 180000, 1, 0, 0, 0, 0, 4, 8, 567701, -1, 1, -8972.79, 1043.15, 52.9456, 0, 0, 'The Binding (1739) - Summon Creature Summoned Succubus');
DELETE FROM `generic_scripts` WHERE `id`=5677;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567701, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Orientation'),
(567701, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1991, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Say Text'),
(567701, 2, 0, 81, 42881, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Despawn GameObject'),
(567701, 4, 0, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Faction'),
(567701, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Attack Start');

-- Undercity
-- Events list for Runes of Summoning
DELETE FROM `event_scripts` WHERE `id`=1785;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1785, 0, 0, 10, 5676, 180000, 1, 0, 0, 0, 0, 4, 8, 567602, -1, 1, 1704.64, 41.1565, -63.7599, 0, 0, 'The Binding (1471) - Summon Creature Summoned Voidwalker');
DELETE FROM `generic_scripts` WHERE `id`=567602;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567602, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Orientation'),
(567602, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1986, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567602, 2, 0, 81, 45288, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Despawn GameObject'),
(567602, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1987, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567602, 6, 1, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Faction'),
(567602, 7, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Start Attack');

-- Events list for Pure Hearts
DELETE FROM `event_scripts` WHERE `id`=1786;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1786, 0, 0, 10, 5677, 180000, 1, 0, 0, 0, 0, 4, 8, 567702, -1, 1, 1704.64, 41.1565, -63.7599, 0, 0, 'The Binding (1474) - Summon Creature Summoned Succubus');
DELETE FROM `generic_scripts` WHERE `id`=567702;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567702, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Orientation'),
(567702, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1991, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Say Text'),
(567702, 2, 0, 81, 45288, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Despawn GameObject'),
(567702, 4, 0, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Faction'),
(567702, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Attack Start');

-- Orgrimmar
-- Events list for Glyphs of Summoning
DELETE FROM `event_scripts` WHERE `id`=1787;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1787, 0, 0, 10, 5676, 180000, 1, 0, 0, 0, 0, 4, 8, 567603, -1, 1, 1805.86, -4373.94, -17.4126, 0, 0, 'The Binding (1504) - Summon Creature Summoned Voidwalker');
DELETE FROM `generic_scripts` WHERE `id`=567603;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567603, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Orientation'),
(567603, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1986, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567603, 2, 0, 81, 12595, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Despawn GameObject'),
(567603, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1987, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Talk'),
(567603, 6, 1, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Set Faction'),
(567603, 7, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Voidwalker - Start Attack');

-- Events list for Dogran's Pendant
DELETE FROM `event_scripts` WHERE `id`=1788;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1788, 0, 0, 10, 5677, 180000, 1, 0, 0, 0, 0, 4, 8, 567703, -1, 1, 1805.86, -4373.94, -17.4126, 0, 0, 'The Binding (1513) - Summon Creature Summoned Succubus');
DELETE FROM `generic_scripts` WHERE `id`=567703;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(567703, 0, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Orientation'),
(567703, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1991, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Say Text'),
(567703, 2, 0, 81, 12595, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Despawn GameObject'),
(567703, 4, 0, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Set Faction'),
(567703, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoned Succubus - Attack Start');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
