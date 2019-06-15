DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190509180752');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190509180752');
-- Add your query below.


-- Add conditions used by the script.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(3982, 36, 3982, 0, 0, 0, 0), -- Map Event Active
(3983, 47, 3982, 121, 0, 0, 0); -- All Map Event Targets Not Alive

-- Add not attackable flag to Commander Gor'shak.
UPDATE `creature_template` SET `unit_flags`=578, `script_name`='' WHERE `entry`=9020;

-- Assign script to quest What Is Going On.
UPDATE `quest_template` SET `StartScript`=3982 WHERE `entry`=3982;

-- Script when the quest is accepted.
DELETE FROM `quest_start_scripts` WHERE `id`=3982;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 0, 61, 3982, 180, 0, 0, 0, 0, 0, 8, 1019, 398200, 0, 398201, 0, 0, 0, 0, 0, 'What Is Going On: Start Scripted Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Commander Gor\'shak - Remove Questgiver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 1, 4, 46, 514, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Commander Gor\'shak - Remove Passive Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 2, 10, 8891, 300000, 0, 0, 0, 0, 0, 0, 0, 398202, 6, 1, 397.946, -203.572, -66.6304, 3, 0, 'What Is Going On: Summon Anvilrage Guardsman 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 2, 10, 8891, 300000, 0, 0, 0, 0, 0, 0, 0, 398202, 6, 1, 397.837, -200.384, -66.527, 3, 0, 'What Is Going On: Summon Anvilrage Guardsman 2');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 2, 10, 8890, 300000, 0, 0, 0, 0, 0, 0, 0, 398202, 6, 1, 393.849, -205.501, -67.24, 2.5, 0, 'What Is Going On: Summon Anvilrage Warden');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 2, 10, 8912, 300000, 0, 0, 0, 0, 0, 0, 0, 398202, 6, 1, 391.586, -202.557, -67.468, 2.5, 0, 'What Is Going On: Summon Twilight\'s Hammer Torturer');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 30, 32, 3982, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Cancel Script If Event Not Running');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 32, 10, 8891, 300000, 0, 0, 0, 0, 0, 0, 0, 398203, 6, 1, 397.946, -203.572, -66.6304, 3, 0, 'What Is Going On: Summon Anvilrage Guardsman 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 32, 10, 8891, 300000, 0, 0, 0, 0, 0, 0, 0, 398203, 6, 1, 397.837, -200.384, -66.527, 3, 0, 'What Is Going On: Summon Anvilrage Guardsman 2');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 32, 10, 8890, 300000, 0, 0, 0, 0, 0, 0, 0, 398203, 6, 1, 393.849, -205.501, -67.24, 2.5, 0, 'What Is Going On: Summon Anvilrage Warden');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 32, 10, 8912, 300000, 0, 0, 0, 0, 0, 0, 0, 398203, 6, 1, 391.586, -202.557, -67.468, 2.5, 0, 'What Is Going On: Summon Twilight\'s Hammer Torturer');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3982, 33, 69, 3982, 0, 0, 0, 0, 0, 0, 0, 1019, 398200, 3983, 398201, 0, 0, 0, 0, 0, 'What Is Going On: Change Map Event Condition');

-- Script for Wave 1.
DELETE FROM `event_scripts` WHERE `id`=398202;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398202, 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 374.013, -183.916, -70.342, 1.8, 0, 'What Is Going On: Summoned Creature - Move to the cell');

-- Script for Wave 2.
DELETE FROM `event_scripts` WHERE `id`=398203;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398203, 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 374.013, -183.916, -70.342, 1.8, 0, 'What Is Going On: Summoned Creature - Move to the cell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398203, 0, 63, 3982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Summoned Creature - Add Self to Map Event');

-- Script when the quest fails.
DELETE FROM `event_scripts` WHERE `id`=398200;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398200, 0, 70, 3982, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Fail Quest');

-- Script when the quest completes.
DELETE FROM `event_scripts` WHERE `id`=398201;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398201, 0, 7, 3982, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Complete Quest');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (398201, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'What Is Going On: Commander Gor\'shak- Add Questgiver flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
