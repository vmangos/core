DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231121220011');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231121220011');
-- Add your query below.


-- Make sure Deathstalker Faerleia's quest giver flag is restored on failure.
DELETE FROM `quest_start_scripts` WHERE `id`=452;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(452, 0, 0, 61, 452, 600, 0, 0, 0, 0, 0, 8, 0, 0, 1014, 45207, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Start Map Event'),
(452, 0, 1, 22, 232, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Set Faction Escortee'),
(452, 0, 2, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Remove NPC flags'),
(452, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 542, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Deathstalker Faerleia - SayText'),
(452, 9, 4, 10, 2060, 240000, 0, 0, 0, 0, 0, 0, 0, 45205, -1, 1, -397.503, 1511, 18.952, 4.7473, 0, 'Pyrewood Ambush: Deathstalker Faerleia - Summon Councilman Smithers');
DELETE FROM `generic_scripts` WHERE `id`=45207;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45207, 0, 0, 70, 452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Fail Quest'),
(45207, 0, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyrewood Ambush: Add Quest Giver Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
