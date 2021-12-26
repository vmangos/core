DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211205120352');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211205120352');
-- Add your query below.


-- Start script for quest The Binding.
DELETE FROM `quest_start_scripts` WHERE `id`=1795;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1795, 0, 61, 1795, 300, 0, 0, 0, 0, 0, 8, 0, 17950, 1013, 17951, 0, 0, 0, 0, 0, 'The Binding: Start Scripted Map Event'),
(1795, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Remove Npc Flags'),
(1795, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Emote OneShotTalk'),
(1795, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2370, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Say Text'),
(1795, 4, 3, 0, 3995, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -780.438, -3718.21, 42.1855, 0, 0, 'The Binding: Strahad Farsan - Move'),
(1795, 6, 3, 0, 6984, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -769.382, -3721.35, 42.4199, 0, 0, 'The Binding: Strahad Farsan - Move'),
(1795, 14, 15, 8677, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1795, 'The Binding: Strahad Farsan - Cast Spell Summon Effect');
UPDATE `quest_template` SET `StartScript`=1795 WHERE `entry`=1795;

-- Success script for quest The Binding.
DELETE FROM `generic_scripts` WHERE `id`=17950;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(17950, 0, 3, 0, 5162, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -776.003, -3718.86, 42.6078, 0, 0, 'The Binding: Strahad Farsan - Move'),
(17950, 4, 3, 0, 4476, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -782.851, -3718.55, 41.5492, 0, 0, 'The Binding: Strahad Farsan - Move'),
(17950, 7, 3, 0, 2883, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -785.161, -3721.88, 40.8014, 0, 0, 'The Binding: Strahad Farsan - Move'),
(17950, 10, 3, 0, 644, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -785.912, -3723.26, 40.4528, 2.05949, 0, 'The Binding: Strahad Farsan - Move'),
(17950, 13, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Add Npc Flags');

-- Failure script for quest The Binding.
DELETE FROM `generic_scripts` WHERE `id`=17951;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(17951, 15, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Respawn'),
(17951, 15, 71, 1, 0, 0, 0, 14384, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Fenrick - Respawn'),
(17951, 15, 71, 1, 0, 0, 0, 14385, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Respawn'),
(17951, 15, 71, 1, 0, 0, 0, 14370, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Respawn');

-- Script when Strahad Farsan casts spell Summon Effect.
DELETE FROM `event_scripts` WHERE `id`=1428;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1428, 0, 76, 92252, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -768.659, -3721.86, 42.3966, 4.55531, 0, 'The Binding: Summon GameObject Strahad\'s Summoning Circle'),
(1428, 2, 1, 2, 0, 0, 0, 6253, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Fenrick - Emote OneShotBow'),
(1428, 2, 1, 2, 0, 0, 0, 6254, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Emote OneShotBow'),
(1428, 2, 1, 2, 0, 0, 0, 6252, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Emote OneShotBow'),
(1428, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Emote OneShotTalk'),
(1428, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2374, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad Farsan - Say Text'),
(1428, 2, 4, 147, 2, 2, 0, 6252, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Remove Npc Flags'),
(1428, 2, 4, 147, 2, 2, 0, 6254, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Remove Npc Flags'),
(1428, 5, 3, 0, 2534, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -763.195, -3720.34, 42.2333, 3.15487, 0, 'The Binding: Strahad Farsan - Move'),
(1428, 5, 15, 8675, 0, 0, 0, 6252, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Cast Spell Warlock Channeling'),
(1428, 5, 15, 8675, 0, 0, 0, 6254, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Cast Spell Warlock Channeling'),
(1428, 5, 15, 8675, 0, 0, 0, 6253, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Fenrick - Cast Spell Warlock Channeling'),
(1428, 14, 76, 92388, 106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -768.692, -3721.9, 42.3976, 2.68781, 0, 'The Binding: Summon GameObject Summoning Circle');

-- Script when player uses item Tome of the Cabal.
DELETE FROM `event_scripts` WHERE `id`=1449;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1449, 0, 10, 6268, 120000, 0, 0, 0, 0, 0, 0, 0, 17952, -1, 1, -768.601, -3721.96, 42.4778, 2.79253, 0, 'The Binding: Summon Creature Summoned Felhunter'),
(1449, 1, 1, 34, 0, 0, 0, 6253, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Fenrick - Emote OneShotWoundCritical'),
(1449, 1, 1, 34, 0, 0, 0, 6254, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Emote OneShotWoundCritical'),
(1449, 1, 1, 34, 0, 0, 0, 6252, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Emote OneShotWoundCritical'),
(1449, 1, 4, 147, 2, 1, 0, 6254, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Wytula - Add Npc Flags'),
(1449, 1, 4, 147, 2, 1, 0, 6252, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Acolyte Magaz - Add Npc Flags'),
(1449, 3, 41, 0, 0, 0, 0, 92252, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Strahad\'s Summoning Circle - Despawn'),
(1449, 3, 41, 0, 0, 0, 0, 92388, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Summoning Circle - Despawn');

-- Spawn script for Summoned Felhunter.
DELETE FROM `generic_scripts` WHERE `id`=17952;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(17952, 0, 63, 1795, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 3, 0, 0, 0, 0, 0, 'The Binding: Summoned Felhunter - Add to Scripted Map Event'),
(17952, 2, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Binding: Summoned Felhunter - Set Faction');

-- 1795: Scripted Map Event 1795 Is Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1795, 36, 1795, 0, 0, 0, 0);

-- Remove permanently spawned gameobjects.
DELETE FROM `gameobject` WHERE `guid` IN (29205, 3996127);

-- Update gameobject templates.
UPDATE `gameobject_template` SET `size`=2.5, `faction`=35 WHERE `entry`=92252;
UPDATE `gameobject_template` SET `size`=2.5, `faction`=35 WHERE `entry`=92388;

-- Correct data for Summoned Felhunter.
UPDATE `creature_template` SET `spawn_spell_id`=7741, `faction`=35, `base_attack_time`=2000, `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=6268;

-- Define targets for spell Summon Felhunter.
DELETE FROM `spell_script_target` WHERE `entry`=8712;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (8712, 0, 92388, 0, 5, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (8712, 0, 92252, 0, 3, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
