DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240513185626');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240513185626');
-- Add your query below.


-- Fix Pyrewood Ambush not being completed if npc gets killing blow.
DELETE FROM `quest_start_scripts` WHERE `id`=452;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(452, 0, 0, 61, 452, 600, 0, 0, 0, 0, 0, 8, 0, 45204, 1014, 45207, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Start Map Event'),
(452, 0, 1, 22, 232, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Set Faction Escortee'),
(452, 0, 2, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Remove NPC flags'),
(452, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 542, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - SayText'),
(452, 9, 4, 10, 2060, 240000, 0, 0, 0, 0, 0, 0, 0, 45205, -1, 1, -397.503, 1511, 18.952, 4.7473, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Summon Councilman Smithers');
DELETE FROM `creature_ai_scripts` WHERE `id`=206801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(206801, 0, 0, 62, 452, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 45203, 'Pyrewood Ambush: Lord Mayor Morrison - Complete Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=45204;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45204, 0, 0, 22, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush Completed: Deathstalker Faerleia - Set Faction to Undercity'),
(45204, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 545, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush Completed: Deathstalker Faerleia - Say Text'),
(45204, 2, 0, 7, 452, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush Completed: Complete Quest'),
(45204, 2, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush Completed: Deathstalker Faerleia - Add QuestGiver Flag');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
