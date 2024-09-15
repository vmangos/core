DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240120155120');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240120155120');
-- Add your query below.

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1527701, 1527702, 1527703, 1527704, 1527705, 1527706, 1527707, 1527708, 1527709, 1527710, 1527711, 1527712, 1527713, 1527714, 1527715, 1527716, 1527717, 1527718, 1527719, 1527720, 1527721, 1527722, 1527723, 1527724, 1527725, 1527726, 1527727, 1527728, 1527729, 1527730, 1527731, 1527732, 1527733, 1527734, 1527735, 1527736, 1527737, 1527738, 1527739, 1527740, 1527741, 1527742, 1527743, 1527744, 1527745, 1527746, 1527747, 1527748, 1527749, 1527750, 1527751, 1527752, 1527753, 1527754, 1527755, 1527756, 1527757, 1527758, 1527759, 1527760, 1527761, 1527762, 1527763, 1527764, 1527765, 1527786, 1527787, 1527767, 1527768, 1527769, 1527770, 1527771, 1527772);

-- Scripts list for Anubisath Defender
DELETE FROM `creature_ai_scripts` WHERE `id`=1527701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527701, 0, 0, 46, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Random Phase between 1 and 4'),
(1527701, 0, 1, 15, 26553, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Powers Trigger'),
(1527701, 0, 2, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Combat Pulse');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527702, 0, 0, 15, 27630, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Drop Obsidian');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527703, 0, 0, 15, 26554, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Thunderclap (Phase 1+2)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527704, 0, 0, 15, 26555, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Shadow Storm (Phase 3+4)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527705, 0, 0, 15, 26556, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Plague (Phase 1+3)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527706;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527706, 0, 0, 15, 26558, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Meteor (Phase 2+4)');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527717;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527717, 0, 0, 15, 13022, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Fire and Arcane Reflect');
DELETE FROM `creature_ai_scripts` WHERE `id`=1527727;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527727, 0, 0, 15, 19595, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Shadow and Frost Reflect');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527718;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527718, 0, 0, 15, 25698, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Explode');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527728;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527728, 0, 0, 15, 8269, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Enrage');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527719;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527719, 0, 0, 10, 15537, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 'Anubisath Defender - Summon Anubisath Warrior');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527729;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527729, 0, 0, 10, 15538, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 'Anubisath Defender - Summon Anubisath Swarmguard');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527710;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527710, 0, 0, 15, 20477, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Teleport Target');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527711;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527711, 0, 0, 15, 84, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Low Hp Trigger');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527712;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527712, 0, 0, 15, 18476, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Summon Minion Trigger');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527713;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527713, 0, 0, 15, 9173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Aoe Trigger');

DELETE FROM `creature_ai_scripts` WHERE `id`=1527714;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527714, 0, 0, 15, 14291, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anubisath Defender - Cast Aoe Trigger');

-- Events list for Anubisath Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=15277;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1527701, 15277, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1527701, 0, 0, 'Anubisath Defender - Aggro pulse and Phase'),
(1527702, 15277, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1527702, 0, 0, 'Anubisath Defender - Drop Obsidian'),
(1527703, 15277, 0, 8, 24, 100, 1, 9173, 127, 0, 0, 1527703, 0, 0, 'Anubisath Defender - Cast Thunderclap (Phase 1+2)'),
(1527704, 15277, 0, 8, 6, 100, 1, 9173, 127, 0, 0, 1527704, 0, 0, 'Anubisath Defender - Cast Shadow Storm (Phase 3+4)'),
(1527705, 15277, 0, 36, 20, 100, 1, 14291, 127, 0, 0, 1527705, 0, 0, 'Anubisath Defender - Cast Plague (Phase 1+3)'),
(1527706, 15277, 0, 36, 10, 100, 1, 14291, 127, 0, 0, 1527706, 0, 0, 'Anubisath Defender - Cast Meteor (Phase 2+4)'),
(1527707, 15277, 0, 8, 0, 100, 2, 26553, 127, 0, 0, 1527717, 1527727, 0, 'Anubisath Defender - Cast Spell Reflect'),
(1527708, 15277, 0, 8, 0, 100, 2, 84, 127, 0, 0, 1527718, 1527728, 0, 'Anubisath Defender - Cast Low Hp Spell'),
(1527709, 15277, 0, 36, 0, 100, 3, 18476, 127, 0, 0, 1527719, 1527729, 0, 'Anubisath Defender - Summon Minion'),
(1527710, 15277, 0, 9, 0, 100, 1, 60, 100, 5000, 5000, 1527710, 0, 0, 'Anubisath Defender - Teleport Target'),
(1527711, 15277, 0, 2, 0, 100, 0, 10, 0, 0, 0, 1527711, 0, 0, 'Anubisath Defender - Cast Low Hp Trigger'),
(1527712, 15277, 0, 0, 0, 100, 1, 10000, 10000, 10000, 10000, 1527712, 0, 0, 'Anubisath Defender - Summon Minion Trigger'),
(1527713, 15277, 0, 0, 0, 100, 1, 2500, 6500, 3000, 8000, 1527713, 0, 0, 'Anubisath Defender - Cast Aoe Trigger'),
(1527714, 15277, 0, 0, 0, 100, 1, 4000, 12000, 4000, 12000, 1527714, 0, 0, 'Anubisath Defender - Cast Targeted Trigger');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
