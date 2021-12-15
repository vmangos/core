DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211213161559');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211213161559');
-- Add your query below.


-- Completion script for quest Zanzil's Secret.
DELETE FROM `quest_end_scripts` WHERE `id`=621;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(621, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Secret: Crank Fizzlebub - Remove NPC Flags'),
(621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1469, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Secret: Crank Fizzlebub - Say Text'),
(621, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1470, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Secret: Crank Fizzlebub - Say Text'),
(621, 5, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Secret: Crank Fizzlebub - Add NPC Flags');

-- Completion script for quest Parts for Kravel.
DELETE FROM `quest_end_scripts` WHERE `id`=1112;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1112, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Remove NPC Flags'),
(1112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Say Emoted Text'),
(1112, 1, 9, 20837, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Parts Crate - Respawn GameObject'),
(1112, 4, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.903906, 0, 'Parts for Kravel: Kravel Koalbeard - Set Orientation'),
(1112, 5, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Set Stand State to Kneel'),
(1112, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1477, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Say Emoted Text'),
(1112, 9, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Set Stand State to Stand'),
(1112, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1478, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Say Text'),
(1112, 15, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel: Kravel Koalbeard - Add NPC Flags');

-- Update position of gameobject Parts Crate.
UPDATE `gameobject` SET `position_x`=-6232.26, `position_y`=-3854.72, `position_z`=-58.7501, `orientation`=4.08407, `rotation2`=-0.891006, `rotation3`=0.453991 WHERE `id`=19878;

-- Completion script for quest Dream Dust in the Swamp.
DELETE FROM `quest_end_scripts` WHERE `id`=1116;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1116, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Remove NPC Flags'),
(1116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1548, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Say Emoted Text'),
(1116, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1549, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Say Emoted Text'),
(1116, 4, 15, 6903, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Cast Spell Krazek\'s Drug'),
(1116, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Say Text'),
(1116, 7, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Emote OneShotWoundCritical'),
(1116, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Say Emoted Text'),
(1116, 10, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Emote OneShotWoundCritical'),
(1116, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1551, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Say Text'),
(1116, 12, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp: Krazek - Add NPC Flags');

-- Completion script for quest Rumors for Kravel.
DELETE FROM `quest_end_scripts` WHERE `id`=1117;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1117, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Remove NPC Flags'),
(1117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1480, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Say Emoted Text'),
(1117, 0, 1, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Emote OneShotDance'),
(1117, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Stop Emoting'),
(1117, 8, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Emote OneShotLaugh'),
(1117, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1481, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Say Text'),
(1117, 11, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel: Kravel Koalbeard - Add NPC Flags');

-- Completion script for quest Back to Booty Bay.
DELETE FROM `quest_end_scripts` WHERE `id`=1118;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1118, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Back to Booty Bay: Crank Fizzlebub - Remove NPC Flags'),
(1118, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.8326, 0, 'Back to Booty Bay: Crank Fizzlebub - Set Orientation'),
(1118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1467, 0, 0, 0, 0, 0, 0, 0, 0, 'Back to Booty Bay: Crank Fizzlebub - Say Text'),
(1118, 2, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.1765, 0, 'Back to Booty Bay: Crank Fizzlebub - Set Orientation'),
(1118, 6, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.82158, 0, 'Back to Booty Bay: Crank Fizzlebub - Set Orientation'),
(1118, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1468, 0, 0, 0, 0, 0, 0, 0, 0, 'Back to Booty Bay: Crank Fizzlebub - Say Text'),
(1118, 6, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Back to Booty Bay: Crank Fizzlebub - Add NPC Flags'),
(1118, 9, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.30383, 0, 'Back to Booty Bay: Crank Fizzlebub - Set Orientation');
UPDATE `quest_template` SET `CompleteScript`=1118 WHERE `entry`=1118;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
