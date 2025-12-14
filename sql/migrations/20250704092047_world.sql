DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250704092047');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250704092047');
-- Add your query below.


-- Scarshield Quartermaster was moved in 1.11.
-- https://www.wowhead.com/classic/npc=9046/scarshield-quartermaster#comments
/*
By Grasswind on 2006/09/10 (Patch 1.12.0)	
Subject: "Where he is!"
The Scarshield Quartermaster has been moved from the orb that is the "door" to BWL down to a hallway instead.
This hallway is the first hallway you can go down to on your left, when running to the orb!

By Alceste on 2005/12/29 (Patch 1.8.4)	
Subject: "Just down the hall from BRS."
If you're standing in front of the instance portal to Blackrock Spire, look right, and he's at the end of that hallway if you keep going straight.

By seraphiss on 2006/12/29 (Patch 2.0.1)	
Subject: "yup he's still there"killed him and his pals a few mins ago
and yes Grasswind was right he's been moved

By hikaricore on 2006/07/11 (Patch 1.11.2)	
Subject: "moved in 1.11"
Scarshield Quartermaster was recently moved from the end of the hall with the orb to the bottom of the ramp to the left heading from the BRS entrance. I'm guessing he was being killed too often right near the BWL entrance for most people to get the quest. lol
*/
DELETE FROM `creature` WHERE `id`=9046;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (248, 9046, 0, 0, 0, 0, 0, -7667.01, -1217.97, 287.788, 2.64992, 172800, 259200, 0, 100, 0, 2, 0, 0, 0, 3);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (1882, 9046, 0, 0, 0, 0, 0, -7667.01, -1217.97, 287.788, 2.64992, 150, 150, 0, 100, 0, 2, 0, 0, 4, 8);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (1885, 9046, 0, 0, 0, 0, 0, -7575.14, -1289.98, 278.258, 1.67552, 150, 150, 0, 100, 0, 0, 0, 0, 9, 10);
-- Waypoints from 1.8 sniff. Wait time is guessed since sniff does not have timestamps.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(9046, 1, -7667.005371, -1217.974243, 287.787994, 100.000000, 5000, 0.000000, 9046),
(9046, 2, -7665.928223, -1216.098877, 287.787994, 100.000000, 0, 0.000000, 0),
(9046, 3, -7660.740723, -1216.369629, 287.787994, 100.000000, 5000, 0.000000, 9046),
(9046, 4, -7658.693848, -1218.445801, 287.787994, 100.000000, 0, 0.000000, 0),
(9046, 5, -7660.111328, -1222.110474, 287.787994, 100.000000, 0, 0.000000, 0),
(9046, 6, -7658.693848, -1218.445801, 287.787994, 100.000000, 5000, 0.000000, 9046),
(9046, 7, -7663.187500, -1221.858521, 287.787994, 100.000000, 0, 0.000000, 0),
(9046, 8, -7663.468750, -1219.003662, 287.787994, 100.000000, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=9046;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(9046, 0, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarshield Quartermaster - Emote State Use Standing'),
(9046, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarshield Quartermaster - Emote None');

-- Burstshot Harquebus and Astral Guard did not drop after BWL attunement was added.
-- https://www.wowhead.com/classic/item=13248/burstshot-harquebus#comments
/*
By dustbucket on 2007/04/02 (Patch 1.12.1)	
Subject: "hi"before the quartermaster was used for bwl attunement; he was a rare spawn and the gun was 100% drop afaik. unsure if this item has an equivalent now
*/
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100, `patch_max`=3 WHERE `entry`=9046 && `item`=30545;
UPDATE `reference_loot_template` SET `patch_max`=3 WHERE `entry`=30545;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
