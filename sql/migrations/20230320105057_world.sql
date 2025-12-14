DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230320105057');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230320105057');
-- Add your query below.


-- 2169: Source's Entry Is 2169
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2169, 16, 2169, 0, 0, 0, 0);

-- Script on casting spell Purify and Place Food.
DELETE FROM `event_scripts` WHERE `id`=3938;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3938, 0, 0, 61, 3938, 105, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Start Scripted Map Event'),
(3938, 1, 0, 10, 2168, 90000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 6850.23, -476.544, 40.3891, 0.418879, 0, 'The Blackwood Corrupted: Summon Creature Blackwood Warrior'),
(3938, 1, 0, 10, 2168, 90000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 6868.93, -525.996, 40.2464, 1.48353, 0, 'The Blackwood Corrupted: Summon Creature Blackwood Warrior'),
(3938, 1, 0, 10, 2168, 90000, 0, 0, 0, 0, 0, 0, 0, 3938, -1, 1, 6887.17, -482.53, 40.2585, 3.45575, 0, 'The Blackwood Corrupted: Summon Creature Blackwood Warrior'),
(3938, 2, 0, 68, 3940, 2, 2168, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Start Script on All Blackwood Warriors'),
(3938, 2, 1, 68, 3940, 2, 2169, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Start Script on All Blackwood Totemics'),
(3938, 18, 0, 10, 10373, 90000, 0, 0, 0, 0, 0, 0, 1, 3939, -1, 1, 6891.92, -477.762, 44.3988, 3.80459, 0, 'The Blackwood Corrupted: Summon Creature Xabraxxis');
-- Summon script for Creature Blackwood Warrior (Entry: 2168 Guid: 1023)
DELETE FROM `generic_scripts` WHERE `id`=3938;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3938, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5617, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Blackwood Warrior - Say Text'),
(3938, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5618, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Blackwood Warrior - Say Text');
-- Summon script for Xabraxxis.
DELETE FROM `generic_scripts` WHERE `id`=3939;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3939, 0, 0, 3, 0, 3074, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 6868.14, -487.966, 40.2686, 0, 117, 'The Blackwood Corrupted: Xabraxxis - Move'),
(3939, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5616, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Xabraxxis - Say Text'),
(3939, 3, 0, 3, 0, 3290, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 6878.38, -495.459, 40.2686, 0, 117, 'The Blackwood Corrupted: Xabraxxis - Move'),
(3939, 5, 0, 3, 0, 2501, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 6883.31, -491.187, 40.2686, 0, 117, 'The Blackwood Corrupted: Xabraxxis - Move'),
(3939, 6, 0, 3, 0, 2734, 1, 2, 0, 0, 0, 4, 0, 0, 0, 0, 6872.77, -483.193, 40.2686, 0, 117, 'The Blackwood Corrupted: Xabraxxis - Move'),
(3939, 7, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6872.77, -483.193, 40.2686, 0, 0, 'The Blackwood Corrupted: Set Home Position');
-- Script for Blackwood Warrior and Totemic to become friendly and run to Purified Food.
DELETE FROM `generic_scripts` WHERE `id`=3940;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3940, 0, 0, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Add Immune To Player Flag'),
(3940, 0, 1, 3, 2, 0, 5, 0, 175336, 40, 11, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 'The Blackwood Corrupted: Move to Purified Food'),
(3940, 10, 0, 22, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Set Faction to Friendly'),
(3940, 12, 0, 20, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2169, 'The Blackwood Corrupted: Move Home'),
(3940, 100, 0, 22, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Reset Faction'),
(3940, 100, 0, 4, 46, 256, 2, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Blackwood Corrupted: Remove Immune to Player Flag');

-- Assign spawn spell to Xabraxxis.
UPDATE `creature_template` SET `spawn_spell_id`=12980 WHERE `entry`=10373;

-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5616;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
