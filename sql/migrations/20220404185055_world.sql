DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220404185055');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220404185055');
-- Add your query below.


-- Script Undercity Training Event
-- Add Missing Emote To Chloe Curthas
DELETE FROM `creature_ai_scripts` WHERE `id`=565802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(565802, 0, 0, 1, 4, 21, 22, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chloe Curthas - Random Emote');

-- Misc
DELETE FROM `creature` WHERE `guid` IN (45211, 45212, 45224, 45222, 45221, 45223);
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 5661;
UPDATE `broadcast_text` SET `emote_id1` = 1 WHERE  `entry` IN (1978, 1977, 1980, 1984, 8306, 1985);
UPDATE `broadcast_text` SET `emote_id1` = 5 WHERE  `entry` IN (8307);
UPDATE `creature_template` SET `unit_flags` = 32768 WHERE `entry` IN (5657, 5658, 5660, 5659, 5655, 5656, 5653, 5654);
UPDATE `creature_template` SET `flags_extra` = 524290 WHERE `entry` IN (5657, 5658, 5660, 5659, 5655, 5656);
UPDATE `creature_template` SET `detection_range` = 0 WHERE `entry` IN (5657, 5658, 5660, 5659, 5655, 5656);
UPDATE `creature_template` SET `detection_range` = 5 WHERE `entry` = 5687;

-- Events list for Brother Malach
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(566101, 5661, 0, 1, 0, 100, 1, 201000, 201000, 201000, 201000, 566101, 0, 0, 'Brother Malach - Start Event OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(566101, 0, 0, 39, 566101, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(566101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1978, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1977, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 8, 0, 10, 5680, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1734.36, 379.952, -62.2058, 3.92699, 0, 'Brother Malach - Summon Creature'),
(566101, 8, 0, 10, 5681, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1736.19, 379.807, -62.2078, 3.83972, 0, 'Brother Malach - Summon Creature'),
(566101, 8, 0, 10, 5680, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1735.93, 378.124, -62.2055, 3.71755, 0, 'Brother Malach - Summon Creature'),
(566101, 24, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.88974, 0, 'Brother Malach - Set Orientation'),
(566101, 25, 0, 15, 7162, 0, 0, 0, 38130, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 29, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.26256, 0, 'Brother Malach - Set Orientation'),
(566101, 30, 0, 15, 7162, 0, 0, 0, 31894, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 33, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.9619, 0, 'Brother Malach - Set Orientation'),
(566101, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1980, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8306, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 39, 0, 10, 5685, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1735.24, 380.689, -62.2077, 3.85718, 0, 'Brother Malach - Summon Creature'),
(566101, 39, 0, 10, 5686, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1734.68, 378.533, -62.1315, 3.85718, 0, 'Brother Malach - Summon Creature'),
(566101, 56, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.88974, 0, 'Brother Malach - Set Orientation'),
(566101, 57, 0, 15, 7162, 0, 0, 0, 38130, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 63, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.26256, 0, 'Brother Malach - Set Orientation'),
(566101, 64, 0, 15, 7162, 0, 0, 0, 31894, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 67, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.9619, 0, 'Brother Malach - Set Orientation'),
(566101, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1984, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8307, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk'),
(566101, 74, 0, 10, 5687, 0, 0, 0, 0, 0, 0, 0, 0, 568001, 0, 2, 1735.33, 379.152, -62.206, 3.82227, 0, 'Brother Malach - Summon Creature'),
(566101, 129, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.88974, 0, 'Brother Malach - Set Orientation'),
(566101, 130, 0, 15, 7162, 0, 0, 0, 38130, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 134, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.26256, 0, 'Brother Malach - Set Orientation'),
(566101, 135, 0, 15, 7162, 0, 0, 0, 31894, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Cast Spell'),
(566101, 138, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.9619, 0, 'Brother Malach - Set Orientation'),
(566101, 139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1985, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Malach - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(568001, 0, 0, 15, 7791, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captive - Cast Spell'),
(568001, 0, 0, 15, 7791, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captive - Cast Spell');

-- NOTE: Text ID 1983 'You show some worth after all. Lysta summon a surprise for our young recruits.' Exists in the DB But I have never seen it used in the event? Perhaps Something triggers an additional part of the event?


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
