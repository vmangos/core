DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210302194837');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210302194837');
-- Add your query below.


-- add Justine Demalier script
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12481;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1248101, 12481, 1248104, 10, 0, 25, 1, 1, 3, 0, 0, 1248101, 0, 0, 'Justine Demalier - Talk - Unit In LOS OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1248101, 0, 39, 1248101, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Justine Demalier - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1248101, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7900, 0, 0, 0, 0, 0, 0, 0, 0, 'Justine Demalier - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1248101, 8, 0, 0, 0, 0, 0, 300993, 0, 9, 3, 7901, 0, 0, 0, 0, 0, 0, 0, 0, 'Melris Malagan - Talk');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1248102, 19, 6182, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1248103, 39, 0, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1248104, -1, 85, 1248102, 1248103, 0, 0);

-- The Scarlet Key should not drop from mobs
DELETE FROM `creature_loot_template` WHERE `item` = 7146;

-- add Baron Longshore spawns
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(563, 3467, 1, -1748.23, -3722.06, 14.1211, 4.65315, 413, 413, 100, 1, 3, 10),
(564, 3467, 1, -1707.46, -3817.54, 13.3079, 5.51516, 413, 413, 100, 1, 3, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(110, 1, 'Baron Longshore (3467)', 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(15066, 110, 'Baron Longshore #1'),
(563, 110, 'Baron Longshore #2'),
(564, 110, 'Baron Longshore #3');

-- correct quest chain for Mage's Wand (1952)
UPDATE `quest_template` SET `PrevQuestId` = 1947, `NextQuestId` = 1952, `ExclusiveGroup` = -1948 WHERE `entry` = 1948;
UPDATE `quest_template` SET `NextQuestId` = 1952, `ExclusiveGroup` = -1948 =  WHERE `entry` = 1951;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
