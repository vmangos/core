DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180531185343');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180531185343');
-- Add your query below.

-- Alliance quest end scripts from Trinity Core:

-- Missing event on quest 'Stromgarde Badges' finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20294
UPDATE `quest_template` SET `CompleteScript`=682 WHERE `entry`=682;
DELETE FROM `quest_end_scripts` WHERE `id`=682;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(682, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: npc\_flag questgiver removed'),
(682, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: State use standing'),
(682, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 873, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Emote text 1'),
(682, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 874, 875, 876, 877, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Say random text 1'),
(682, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 878, 879, 880, 881, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Say random text 2'),
(682, 9, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: State stand'),
(682, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 882, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Emote text 2'),
(682, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 883, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Say text 3'),
(682, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Emote talk 1'),
(682, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 884, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Say text 4'),
(682, 16, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: Emote talk 2'),
(682, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stromgarde Badges - Captain Nials: npc\_flag questgiver added');


-- DB/Quest: Rhapsody's Kalimdor Kocktail - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21575
UPDATE `quest_template` SET `CompleteScript`=1452 WHERE `entry`=1452;
DELETE FROM `quest_end_scripts` WHERE `id`=1452;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1452, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: npc\_flag questgiver removed'),
(1452, 1, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: State stand 1'),
(1452, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1950, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 1'),
(1452, 2, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote cheer'),
(1452, 4, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote wound 1'),
(1452, 7, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: State use standing'),
(1452, 15, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: State stand 2'),
(1452, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1951, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 2'),
(1452, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1952, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote text 1'),
(1452, 18, 1, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote dance'),
(1452, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1953, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 3'),
(1452, 21, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote wound 2'),
(1452, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1954, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 4'),
(1452, 23, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote question'),
(1452, 26, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote wound 3'),
(1452, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1955, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 5'),
(1452, 28, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote talk 1'),
(1452, 30, 1, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote eat/drink'),
(1452, 33, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote wound 4'),
(1452, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1956, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Say text 6'),
(1452, 35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote talk 2'),
(1452, 37, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: Emote wound 5'),
(1452, 39, 1, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: State stun'),
(1452, 40, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhapsody\'s Kalimdor Kocktail - Rhapsody Shindigger: npc\_flag questgiver added');


-- DB/Quest: Iron Coral - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21714
UPDATE `quest_template` SET `CompleteScript`=1708 WHERE `entry`=1708;
DELETE FROM `quest_end_scripts` WHERE `id`=1708;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1708, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: npc\_flag questgiver removed'),
(1708, 1, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4815, -1250.3, 501.915, 0, 0, 'Iron Coral - Klockmort Spannerspan: Move point 1'),
(1708, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2344, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: Emote text 1'),
(1708, 2, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: State work mining'),
(1708, 12, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: State stand'),
(1708, 13, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4812.48, -1250.62, 502.014, 0, 0, 'Iron Coral - Klockmort Spannerspan: Move point 2'),
(1708, 14, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: State work mining'),
(1708, 24, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: State stand'),
(1708, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2345, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: Say text 1'),
(1708, 25, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: Emote cheer'),
(1708, 27, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4812.48, -1250.62, 502.014, 4.62512, 0, 'Iron Coral - Klockmort Spannerspan: Set orientation 2'),
(1708, 27, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Iron Coral - Klockmort Spannerspan: npc\_flag questgiver added');


-- DB/Quest: Sunscorched Shells - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21713
-- Anvil only added in WotLK: http://wowwiki.wikia.com/wiki/Patch_3.2.0
UPDATE `quest_template` SET `CompleteScript`=1710 WHERE `entry`=1710;
DELETE FROM `quest_end_scripts` WHERE `id`=1710;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1710, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: npc\_flag questgiver removed'),
(1710, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9918.03, 2308.6, 1330.87, 0.166394, 0, 'Sunscorched Shells - Mathiel: Set orientation 1'),
(1710, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2348, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: Emote text 1'),
(1710, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: State work mining'),
(1710, 11, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: State stand'),
(1710, 12, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9918.03, 2308.6, 1330.87, 1.71042, 0, 'Sunscorched Shells - Mathiel: Set orientation 2'),
(1710, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2349, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: Say text 1'),
(1710, 13, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sunscorched Shells - Mathiel: npc\_flag questgiver added');


-- DB/Quest: Smith Mathiel - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21510
UPDATE `quest_template` SET `CompleteScript`=1692 WHERE `entry`=1692;
DELETE FROM `quest_end_scripts` WHERE `id`=1692;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1692, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: npc\_flag questgiver removed'),
(1692, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9918.03, 2308.6, 1330.87, 0.166394, 0, 'Smith Mathiel - Mathiel: Set orientation 1'),
(1692, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2306, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: Emote text 1'),
(1692, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: State work mining'),
(1692, 11, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: State stand'),
(1692, 12, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 9918.03, 2308.6, 1330.87, 1.71042, 0, 'Smith Mathiel - Mathiel: Set orientation 2'),
(1692, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2307, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: Say text 1'),
(1692, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: Emote talk'),
(1692, 13, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Smith Mathiel - Mathiel: npc\_flag questgiver added');


-- DB/Quest: Burning Blood - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21712
UPDATE `quest_template` SET `CompleteScript`=1705 WHERE `entry`=1705;
DELETE FROM `quest_end_scripts` WHERE `id`=1705;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1705, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: npc\_flag questgiver+gossip removed'),
(1705, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8387, 685.202, 95.356, 3.72935, 0, 'Burning Blood - Grimand Elmore: Set orientation 1'),
(1705, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2346, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: Emote text 1'),
(1705, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: State work mining'),
(1705, 11, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: State stand'),
(1705, 12, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8387, 685.202, 95.356, 2.286, 0, 'Burning Blood - Grimand Elmore: Set orientation 2'),
(1705, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2347, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: Say text 1'),
(1705, 13, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: Emote Exclamation'),
(1705, 15, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blood - Grimand Elmore: npc\_flag questgiver+gossip added');


-- DB/Quest: Fire Hardened Mail - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21711
UPDATE `quest_template` SET `CompleteScript`=1701 WHERE `entry`=1701;
DELETE FROM `quest_end_scripts` WHERE `id`=1701;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1701, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: npc\_flag questgiver removed'),
(1701, 0, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8427.86, 607.066, 95.0986, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Move point 1'),
(1701, 2, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8427.86, 607.066, 95.0986, 0.190955, 0, 'Fire Hardened Mail - Furen Longbeard: Set orientation 1'),
(1701, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2341, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Emote text 1'),
(1701, 2, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: State work mining'),
(1701, 12, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: State stand'),
(1701, 13, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8426.26, 613.757, 95.269, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Move point 2'),
(1701, 15, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8426.26, 613.757, 95.269, 0.38748, 0, 'Fire Hardened Mail - Furen Longbeard: Set orientation 2'),
(1701, 15, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: State work mining'),
(1701, 25, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: State stand'),
(1701, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2342, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Say text 1'),
(1701, 26, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Emote cheer'),
(1701, 29, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8428.98, 607.758, 95.1228, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Move point 3'),
(1701, 31, 3, 0, 1900, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8427, 600.092, 94.706, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Move point 4'),
(1701, 33, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8427, 600.092, 94.706, 3.281, 0, 'Fire Hardened Mail - Furen Longbeard: Set orientation 3'),
(1701, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2343, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Say text 2'),
(1701, 34, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: Emote talk'),
(1701, 35, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fire Hardened Mail - Furen Longbeard: npc\_flag questgiver added');


-- DB/Quest: Ironband's Compound - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21715
UPDATE `quest_template` SET `CompleteScript`=1681 WHERE `entry`=1681;
DELETE FROM `quest_end_scripts` WHERE `id`=1681;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1681, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: npc\_flag questgiver removed'),
(1681, 0, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4798.04, -1104.75, 499.605, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: Move point 1'),
(1681, 2, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4798.04, -1104.75, 499.605, 4.00425, 0, 'Ironband\'s Compound - Tormus Deepforge: Set orientation 1'),
(1681, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2303, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: Emote text 1'),
(1681, 3, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: State work mining'),
(1681, 13, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: State stand'),
(1681, 14, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4793.38, -1098.17, 498.89, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: Move point 2'),
(1681, 16, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4793.38, -1098.17, 498.89, 4.60767, 0, 'Ironband\'s Compound - Tormus Deepforge: Set orientation 2'),
(1681, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2304, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: Say text 1'),
(1681, 17, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: Emote talk'),
(1681, 18, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironband\'s Compound - Tormus Deepforge: npc\_flag questgiver added');


-- DB/Quest: The Rethban Gauntlet - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21709
UPDATE `quest_template` SET `CompleteScript`=1699 WHERE `entry`=1699;
DELETE FROM `quest_end_scripts` WHERE `id`=1699;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1699, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: npc\_flag questgiver removed'),
(1699, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2308, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Say text 1'),
(1699, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Emote shout'),
(1699, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Say text 1'),
(1699, 5, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Emote cheer 1'),
(1699, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Say text 2'),
(1699, 9, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Emote cheer 2'),
(1699, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Say text 3'),
(1699, 13, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: Emote cheer 3'),
(1699, 14, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew: npc\_flag questgiver added');


-- Missing Completion Event for Quest "Hilary's Necklace" - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20376
-- Fixed gossip also
UPDATE `quest_template` SET `CompleteScript`=3741 WHERE `entry`=3741;
DELETE FROM `quest_end_scripts` WHERE `id`=3741;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(3741, 1, 0, 0, 0, 0, 0, 8963, 20, 8, 2, 4627, 0, 0, 0, 0, 0, 0, 0, 0, 'Hilary\'s Necklace - Effsee: Say text 1'),
(3741, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4628, 0, 0, 0, 0, 0, 0, 0, 0, 'Hilary\'s Necklace - Hilary: Say text 1');

-- Add gossip menu for Hilary and Shawn
UPDATE `creature_template` SET `gossip_menu_id`=1621 WHERE `entry`=8962 AND `patch`=0;
UPDATE `creature_template` SET `gossip_menu_id`=1622 WHERE `entry`=8965 AND `patch`=0;

-- Add condition for when Hilary's Necklace (3741) is rewarded
DELETE FROM `conditions` WHERE `condition_entry` IN (40000);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (40000, 8, 3741);

-- Add gossip
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (6164, 6165);
DELETE FROM `gossip_menu` WHERE `entry` IN (1621, 1622);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1621, 2273, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1621, 2274, 40000);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1622, 2276, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1622, 2277, 40000);

-- Final gossip for Shawn reverted to pre-Cata state: Nida to Hilary because it was changed to Nida in Cata
-- http://www.wowhead.com/quest=26508/nidas-necklace
-- Source: https://github.com/TrinityCore/TrinityCore/issues/12788
UPDATE `broadcast_text` SET `MaleText`='Thank you again for helping Hilary, $g mister : miss;!  When I grow up, I wanna be a hero just like you!' WHERE `ID`=4620;


-- DB/Quest: Onu is Meditating - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21651
UPDATE `quest_template` SET `CompleteScript`=961 WHERE `entry`=961;
DELETE FROM `quest_end_scripts` WHERE `id`=961;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1219, 0, 0, 0, 0, 0, 0, 0, 0, 'Onu is meditating - Onu: Emote text 1');


-- DB/Quest: The Ancient Statuette - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21545
UPDATE `quest_template` SET `CompleteScript`=1007 WHERE `entry`=1007;
DELETE FROM `quest_end_scripts` WHERE `id`=1007;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1007, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: npc\_flag questgiver removed'),
(1007, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: State stand 1'),
(1007, 1, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3470.04, 847.092, 5.45882, 6.16678, 0, 'The Ancient Statuette - Talen: Orient 1'),
(1007, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1325, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Say text 1'),
(1007, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Emote talk 1'),
(1007, 3, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: State kneel'),
(1007, 4, 9, 399738, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Spawn statuette object for 10 sec'),
(1007, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1354, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Emote text 1'),
(1007, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1326, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Say text 2'),
(1007, 9, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Emote roar'),
(1007, 10, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: State stand 2'),
(1007, 11, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3470.04, 847.092, 5.45882, 1.22173, 0, 'The Ancient Statuette - Talen: Orient 1'),
(1007, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1355, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Say text 3'),
(1007, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: Emote talk 2'),
(1007, 14, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: npc\_flag questgiver added'),
(1007, 20, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ancient Statuette - Talen: State sit');

-- Update `broadcast_text` to vanilla version
UPDATE `broadcast_text` SET `MaleText`='This statuette must hold a hidden compartment....' WHERE `ID`=1325;
UPDATE `broadcast_text` SET `MaleText`='It\'s locked!  NO!!' WHERE `ID`=1326;
UPDATE `broadcast_text` SET `MaleText`='%s searches the ancient statuette.' WHERE `ID`=1354;

-- Add statuette object to GUID
DELETE FROM `gameobject` WHERE `guid`=399738; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(399738, 18603, 1, 3471.69, 846.893, 5.39909, 4.67058, 0, 0, -10, -10, 100, 1);


-- Add waypoint movement to Ruuzel - GUIDs are correct QAkvast - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20646
UPDATE `creature` SET `position_x`=4157.59, `position_y`=1272.73, `position_z`=3.22775, `MovementType`=2 WHERE `guid`=32617;
UPDATE `creature` SET `position_x`=4158.46, `position_y`=1274.85, `position_z`=3.35226 WHERE `guid`=32762;
UPDATE `creature` SET `position_x`=4159.55, `position_y`=1271.75, `position_z`=3.00348 WHERE `guid`=32728;

-- Link bodyguards
DELETE FROM `creature_linking` WHERE `GUID` IN (32762, 32728);
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES (32762, 32617, 3203);
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES (32728, 32617, 3203);

DELETE FROM `creature_groups` WHERE `leaderGUID` IN (32617);
INSERT INTO `creature_groups` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `flags`) VALUES 
(32617, 32617, 10.8898, 9.88976, 1),
(32617, 32762, 6.54904, 10.2945, 1),
(32617, 32728, 5.29512, 9.52917, 1);

-- Add waypoints
DELETE FROM `creature_movement` WHERE `id`=32617;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`, `model1`, `model2`) VALUES
(32617, 1, 4157.59, 1272.73, 3.22775, 0, 0, 0, 0, 0),
(32617, 2, 4118.6, 1268.22, 1.93513, 0, 0, 0, 0, 0),
(32617, 3, 4100.35, 1277.8, 1.42555, 0, 0, 0, 0, 0),
(32617, 4, 4090.54, 1314.88, 2.11756, 0, 0, 0, 0, 0),
(32617, 5, 4098.61, 1352.27, 2.58844, 0, 0, 0, 0, 0),
(32617, 6, 4116.9, 1363.47, 1.69482, 0, 0, 0, 0, 0),
(32617, 7, 4133.67, 1375.35, 2.18856, 0, 0, 0, 0, 0),
(32617, 8, 4176.57, 1370.93, 2.58461, 0, 0, 0, 0, 0),
(32617, 9, 4221.99, 1339.24, 2.22232, 0, 0, 0, 0, 0),
(32617, 10, 4225.52, 1317.01, 1.90514, 0, 0, 0, 0, 0),
(32617, 11, 4206.5, 1285.38, 1.3025, 0, 0, 0, 0, 0),
(32617, 12, 4185.92, 1278.95, 1.27956, 0, 0, 0, 0, 0),
(32617, 13, 4168.32, 1281.27, 3.36765, 0, 0, 0, 0, 0);


-- DB/Quest: A King's Tribute --> Completion Event - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20700
UPDATE `quest_template` SET `CompleteScript`=689 WHERE `entry`=689;
DELETE FROM `quest_end_scripts` WHERE `id`=689;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(689, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: npc\_flag questgiver removed'),
(689, 0, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: State stand 1'),
(689, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3501, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Say text 1'),
(689, 1, 3, 0, 2600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5032.14, -1014.66, 508.876, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 1'),
(689, 4, 3, 0, 1900, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5030.03, -1007.38, 505.265, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 2'),
(689, 6, 3, 0, 1900, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5022.62, -1009.3, 502.209, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 3'),
(689, 8, 3, 0, 2600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5027.4, -1018.8, 502.21, 4.4, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 4 + orientation'),
(689, 11, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: State work mining 1'),
(689, 16, 9, 821, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Spawn Memorial to Sully Balloo object for 30 sec'),
(689, 21, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: State stand 2'),
(689, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3502, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Say text 2'),
(689, 22, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Emote talk 1'),
(689, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3503, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Say text 2'),
(689, 27, 3, 0, 2600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5022.62, -1009.3, 502.209, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 5'),
(689, 30, 3, 0, 1900, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5030.03, -1007.38, 505.265, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 6'),
(689, 32, 3, 0, 1900, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5032.14, -1014.66, 508.876, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 7'),
(689, 34, 3, 0, 2600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5033.81, -1022.23, 508.876, 3.76026, 0, 'A King\'s Tribute - Grand Mason Marblesten: Move point 8 + orientation'),
(689, 37, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: State work mining 2'),
(689, 38, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A King\'s Tribute - Grand Mason Marblesten: npc\_flag questgiver added');

-- Only spawn memorial object with event
UPDATE `gameobject` SET `spawntimesecsmin`=-30, `spawntimesecsmax`=-30 WHERE `guid`=821;


-- DB/Quest: Sully Balloo's Letter --> Completion Event - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20698
DELETE FROM `quest_end_scripts` WHERE `id`=637;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 792, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo: Emote text 1'),
(637, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 793, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo: Say text 1'),
(637, 3, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo: Emote cry');


-- Missing event on quest 'Forsaken Diseases' finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20276
UPDATE `quest_template` SET `CompleteScript`=1011 WHERE `entry`=1011;
DELETE FROM `quest_end_scripts` WHERE `id`=1011;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1011, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: npc\_flag questgiver removed'),
(1011, 2, 15, 6355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: Cast spell "Drink Disease Bottle"'),
(1011, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1316, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: Say text 1'),
(1011, 4, 1, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: State stun'),
(1011, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1318, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: Say text 2'),
(1011, 12, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: State stand'),
(1011, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1319, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: Say text 2'),
(1011, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Diseases - Kayneth Stillwind: npc\_flag questgiver added');


-- Kayneth Stillwind gossip - ok - QAkvast
-- DB/NPC various fix for some gossip
-- Source: https://github.com/TrinityCore/TrinityCore/issues/7003
UPDATE `creature_template` SET `gossip_menu_id`=7406 WHERE `entry`=3848 AND `patch`=0; -- Kayneth Stillwind
DELETE FROM `gossip_menu` WHERE `entry`=7406;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7406, 8875);


-- DB/Quest: Gathering Materials & Pristine Spider Silk - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21951
UPDATE `quest_template` SET `CompleteScript`=1921 WHERE `entry`=1921;
DELETE FROM `quest_end_scripts` WHERE `id`=1921;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1921, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: npc\_flag questgiver removed'),
(1921, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2647, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: Say text 1'),
(1921, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: Emote talk 1'),
(1921, 3, 15, 9157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: Cast spell "Create Mage\'s Robe"'),
(1921, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2648, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: Say text 2'),
(1921, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: Emote talk 2'),
(1921, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Wynne Larson: npc\_flag questgiver added');

UPDATE `quest_template` SET `CompleteScript`=1940 WHERE `entry`=1940;
DELETE FROM `quest_end_scripts` WHERE `id`=1940;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1940, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: npc\_flag questgiver removed'),
(1940, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2649, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 1'),
(1940, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2651, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 2'),
(1940, 6, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8964.6, 824.703, 109.447, 3.80513, 0, 'Pristine Spider Silk - Wynne Larson: Move point 1'),
(1940, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2650, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 3'),
(1940, 11, 15, 9157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Cast spell "Create Mage\'s Robe"'),
(1940, 16, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8963, 822.517, 109.447, 3.846, 0, 'Pristine Spider Silk - Wynne Larson: Move point 1'),
(1940, 19, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: npc\_flag questgiver added');


-- Wynne Larson (1309) - missing gossip - take from TC - old menu id 9033 - ok
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry`=1309 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (681, 9033);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(681 ,1231, 0),
(681 ,8244 ,461),
(681 ,8283 ,459),
(681 ,8285 ,454),
(681 ,8291 ,458),
(681 ,8296 ,460),
(681 ,8298 ,455);

-- Move old gossip menu options to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (681, 9033);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(681, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(681, 1, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0),
(681, 13, 1, 'GOSSIP_OPTION_ARMORER', 3370, 15, 16384, 0, 0, 0, 0, 0, '', 0, 0),
(681, 14, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462),
(681, 15, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);


-- Sellandus <Apprentice Tailor> (5567) - missing gossip - take from TC - old menu id 9394 - ok
UPDATE `creature_template` SET `gossip_menu_id`=4344 WHERE `entry`=5567 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (4344, 9394);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4344, 5519, 0),
(4344, 8244, 461),
(4344, 8283, 459),
(4344, 8285, 454),
(4344, 8291, 458),
(4344, 8296, 460),
(4344, 8298, 455);

-- Move old gossip menu options to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (4344, 9394);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4344, 3, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4344, 4, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462),
(4344, 5, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);


-- DB/Quest: In Search of Knowledge - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21965
UPDATE `quest_template` SET `CompleteScript`=2939 WHERE `entry`=2939;
DELETE FROM `quest_end_scripts` WHERE `id`=2939;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2939, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 8701.16, 993.116, 23.5854, 0.127147, 0, 'In Search of Knowledge - Daryn Lightwind: orientation 1'),
(2939, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4042, 0, 0, 0, 0, 0, 0, 0, 0, 'In Search of Knowledge - Daryn Lightwind: Say text 1'),
(2939, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4043, 0, 0, 0, 0, 0, 0, 0, 0, 'In Search of Knowledge - Daryn Lightwind: Say text 2'),
(2939, 2, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Search of Knowledge - Daryn Lightwind: Emote point'),
(2939, 5, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 8701.16, 993.116, 23.5854, 3.82227, 0, 'In Search of Knowledge - Daryn Lightwind: orientation 2');


-- DB/Quest: A Noble Brew (Part 2) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21977
UPDATE `quest_template` SET `CompleteScript`=336 WHERE `entry`=336;
DELETE FROM `quest_end_scripts` WHERE `id`=336;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(336, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: Emote wound'),
(336, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 387, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: Say text 1'),
(336, 2, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: Emote wound'),
(336, 3, 1, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: State stun'),
(336, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 388, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: Say text 2'),
(336, 10, 15, 2596, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Noble Brew - Lord Baurles K. Wishock: Cast spell "Touch of the Black Claw"');




-- Alliance quest start scripts from Trinity Core:

-- DB/Quest: Tormus Deepforge - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21710
UPDATE `quest_template` SET `StartScript`=1680 WHERE `entry`=1680 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1680;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2302, 0, 0, 0, 0, 0, 0, 0, 0, 'Tormus Deepforge - Muren Stormpike: Say text 1'),
(1680, 0, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tormus Deepforge - Muren Stormpike: Emote salute');


-- DB/Quest: The Tome of Divinity (Part 7) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21708
UPDATE `quest_template` SET `StartScript`=1787 WHERE `entry`=1787 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1787;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2353, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tome of Divinity - Henze Faulk: Say text 1');

UPDATE `quest_template` SET `StartScript`=1784 WHERE `entry`=1784 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1784;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2351, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tome of Divinity - Narm Faulk: Say text 1');


-- DB/Quest: Heartswood - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21653
UPDATE `quest_template` SET `StartScript`=1738 WHERE `entry`=1738;
DELETE FROM `quest_start_scripts` WHERE `id`=1738;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1738, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: npc\_flag questgiver removed'),
(1738, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2310, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Say text 1'),
(1738, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Emote talk 1'),
(1738, 4, 15, 7794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Cast spell "Teleport"'),
(1738, 6, 10, 6245, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -2246.8, -2369.11, 91.6667, 0.623109, 0, 'Heartswood - Takar the Seer: Summon "Anathera"'),
(1738, 6, 10, 6246, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -2248.94, -2371.09, 91.6667, 3.65082, 0, 'Heartswood - Takar the Seer: Summon "Latherion"'),
(1738, 7, 1, 333, 0, 0, 0, 6245, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Anathera: State ready'),
(1738, 7, 1, 333, 0, 0, 0, 6246, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: State ready'),
(1738, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2311, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Say text 2'),
(1738, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Emote talk 2'),
(1738, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2312, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Say text 3'),
(1738, 12, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Emote talk 3'),
(1738, 13, 28, 7, 0, 0, 0, 6245, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Anathera: State dead'),
(1738, 14, 1, 26, 0, 0, 0, 6246, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: State stand'),
(1738, 14, 3, 0, 500, 69, 1, 6246, 20, 8, 2, 0, 0, 0, 0, -2248.94, -2371.09, 91.6667, 0.6231091, 0, 'Heartswood - Latherion: Set orientation'),
(1738, 15, 0, 0, 0, 0, 0, 6246, 20, 8, 2, 2313, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: Say text 1'),
(1738, 15, 1, 15, 0, 0, 0, 6246, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: Emote roar'),
(1738, 17, 28, 8, 0, 0, 0, 6246, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: Emote kneel'),
(1738, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2314, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Say text 4'),
(1738, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Emote talk 4'),
(1738, 22, 28, 7, 0, 0, 0, 6246, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: State dead'),
(1738, 24, 0, 0, 0, 0, 0, 6246, 20, 8, 2, 2315, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Latherion: Say text 2'),
(1738, 26, 0, 0, 0, 0, 0, 6245, 20, 8, 2, 2316, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Anathera: Say text 1'),
(1738, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2317, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Say text 5'),
(1738, 30, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: Emote talk 5'),
(1738, 32, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heartswood - Takar the Seer: npc\_flag questgiver added');

-- Avoid event NPC being attacked by the wildlife
UPDATE `creature_template` SET `unit_flags`=2 WHERE `entry`=6245 AND `patch`=0;
UPDATE `creature_template` SET `unit_flags`=2 WHERE `entry`=6246 AND `patch`=0;


-- DB/Quest: The Test of Righteousness (Part 3) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21938
UPDATE `quest_template` SET `StartScript`=1806 WHERE `entry`=1806;
DELETE FROM `quest_start_scripts` WHERE `id`=1806;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1806, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: npc\_flag questgiver removed'),
(1806, 0, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5094.12, -786.116, 495.226, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Move point 1'),
(1806, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2501, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Say text 1'),
(1806, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Emote talk 1'),
(1806, 3, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5094.12, -786.116, 495.226, 2.90077, 0, 'The Test of Righteousness - Jordan Stilwell: Orientation 1'),
(1806, 4, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: State work mining 1'),
(1806, 14, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: State stand 1'),
(1806, 15, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5089.28, -782.95, 495.279, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Move point 2'),
(1806, 17, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -5089.28, -782.95, 495.279, 5.77704, 0, 'The Test of Righteousness - Jordan Stilwell: Orientation 2'),
(1806, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2504, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Say text 2'),
(1806, 18, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: Emote talk 2'),
(1806, 19, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Test of Righteousness - Jordan Stilwell: npc\_flag questgiver added');


-- DB/Quest: Investigate the Blue Recluse & Investigate the Alchemist Shop - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21950
UPDATE `quest_template` SET `StartScript`=1920 WHERE `entry`=1920;
DELETE FROM `quest_start_scripts` WHERE `id`=1920;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1920, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8990, 862.929, 29.621, 5.96646, 0, 'Investigate the Blue Recluse - Jennea Cannon: Orientation 1'),
(1920, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2681, 0, 0, 0, 0, 0, 0, 0, 0, 'Investigate the Blue Recluse - Jennea Cannon: Say text 1'),
(1920, 1, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Investigate the Blue Recluse - Jennea Cannon: Emote point'),
(1920, 4, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8990, 862.929, 29.621, 4.858, 0, 'Investigate the Blue Recluse - Jennea Cannon: Orientation 2');

UPDATE `quest_template` SET `StartScript`=1960 WHERE `entry`=1960;
DELETE FROM `quest_start_scripts` WHERE `id`=1960;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1960, 0, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1813.74, 56.4138, -47.3038, 4.77319, 0, 'Investigate the Alchemist Shop - Anastasia Hartwell: Orientation 1'),
(1960, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2682, 0, 0, 0, 0, 0, 0, 0, 0, 'Investigate the Alchemist Shop - Anastasia Hartwell: Say text 1'),
(1960, 1, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Investigate the Alchemist Shop - Anastasia Hartwell: Emote point'),
(1960, 4, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1813.74, 56.4138, -47.3038, 3.05433, 0, 'Investigate the Alchemist Shop - Anastasia Hartwell: Orientation 2');


-- DB/Quest: Alther's Mill - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21972
UPDATE `quest_template` SET `StartScript`=2282 WHERE `entry`=2282;
DELETE FROM `quest_start_scripts` WHERE `id`=2282;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2282, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3562, 0, 0, 0, 0, 0, 0, 0, 0, 'Alther\'s Mill - Lucius: Say text 1');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
