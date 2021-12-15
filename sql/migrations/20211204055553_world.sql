DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211204055553');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211204055553');
-- Add your query below.


-- Completion script for quest Spirit Totem.
DELETE FROM `quest_end_scripts` WHERE `id`=8412;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(8412, 0, 3, 0, 5173, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 253.517, -1459.8, 52.1418, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Move'),
(8412, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Remove Npc Flags'),
(8412, 4, 3, 0, 3430, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 254.261, -1453.83, 51.9142, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Move'),
(8412, 8, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Emote OneShotKneel'),
(8412, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10864, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Say Text'),
(8412, 12, 15, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Cast Spell Spirit Totem'),
(8412, 17, 3, 0, 2266, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 250.84, -1470.58, 55.4637, 1.39626, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Move'),
(8412, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10865, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Say Text'),
(8412, 20, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit Totem: Bath\'rah the Windwatcher - Add Npc Flags');
UPDATE `quest_template` SET `CompleteScript`=8412 WHERE `entry`=8412;

-- Assign spell and remove gold from Spirit Totem.
UPDATE `creature_template` SET `spell_id1`=25001, `gold_min`=0, `gold_max`=0 WHERE `entry`=15363;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
