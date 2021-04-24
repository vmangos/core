DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200721162630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200721162630');
-- Add your query below.


-- Correct default faction for Plague Spreader to Undead, Scourge (21). 
UPDATE `creature_template` SET `faction` = 21 WHERE `entry` = 604;

-- Plague Spreaders that spawn on STV bridge for Patrol Schedule quest end event are faction Villian (43) in sniff.
-- Private Merle should become faction Victim (99).
DELETE FROM `quest_end_scripts` WHERE `id`=330;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1422, 'Patrol Schedules: Corporal Sethman - Remove Quest Giver Flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 1, 61, 330, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1422, 'Patrol Schedules: Start Map Script');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 1, 4, 46, 512, 1, 0, 1626, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1422, 'Patrol Schedules: Private Merle - Add Immune to NPC Flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 1, 60, 3, 1, 0, 1, 1626, 0, 9, 2, 0, 1421, 0, 0, 0, 0, 0, 0, 1422, 'Patrol Schedules: Private Merle - Start Waypoints');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 1, 22, 99, 1, 0, 0, 1626, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1422, 'Patrol Schedules: Private Merle - Set Faction');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (330, 26, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Patrol Schedules: Corporal Sethman - Add Quest Giver Flag');
DELETE FROM `event_scripts` WHERE `id`=60401;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (60401, 0, 15, 26047, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Spreader - Cast Spell Birth');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (60401, 2, 22, 43, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Spreader - Set Faction (21)');
DELETE FROM `creature_movement_scripts` WHERE `id`=142102;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (142102, 0, 10, 604, 10000, 0, 0, 0, 0, 0, 0, 0, 60401, 6, 4, -11293, -370.476, 64.4972, 3.08568, 0, 'Private Merle - Summon Creature (OOC Despawn 4000 ms)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (142102, 0, 10, 604, 10000, 0, 0, 0, 0, 0, 0, 0, 60401, 6, 4, -11295.3, -359.83, 63.561, 4.18131, 0, 'Private Merle - Summon Creature (OOC Despawn 4000 ms)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (142102, 0, 10, 604, 10000, 0, 0, 0, 0, 0, 0, 0, 60401, 6, 4, -11291, -364.689, 64.1733, 3.44304, 0, 'Private Merle - Summon Creature (OOC Despawn 4000 ms)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (142102, 0, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Merle - Remove Immune to NPC Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
