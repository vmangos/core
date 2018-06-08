DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180606204740');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180606204740');
-- Add your query below.

-- Horde quest end scripts from Trinity Core:

-- DB/Quest: Chimaeric Horn - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21784
UPDATE `quest_template` SET `CompleteScript`=1844 WHERE `entry`=1844;
DELETE FROM `quest_end_scripts` WHERE `id`=1844;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1844, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: npc\_flag questgiver removed'),
(1844, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2348, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: Emote text 1'),
(1844, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: State work mining'),
(1844, 16, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: State stand'),
(1844, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2635, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: Say text 1'),
(1844, 17, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: Emote talk'),
(1844, 18, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chimaeric Horn - Orm Stonehoof: npc\_flag questgiver added');


-- DB/Quest: Dragonmaw Shinbones - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21785
UPDATE `quest_template` SET `CompleteScript`=1846 WHERE `entry`=1846;
DELETE FROM `quest_end_scripts` WHERE `id`=1846;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1846, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: npc\_flag questgiver removed'),
(1846, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2644, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: Emote text 1'),
(1846, 1, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: State use standing no sheathe'),
(1846, 16, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: State stand'),
(1846, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2645, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: Say text 1'),
(1846, 17, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: Emote talk'),
(1846, 18, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Shinbones - Velora Nitely: npc\_flag questgiver added');


-- DB/Quest: The Temple of Atal'Hakkar - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21450
UPDATE `quest_template` SET `CompleteScript`=1445 WHERE `entry`=1445;
DELETE FROM `quest_end_scripts` WHERE `id`=1445;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1445, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal\'Hakkar - Fel\'zerul: npc\_flag questgiver removed'),
(1445, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1949, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal\'Hakkar - Fel\'zerul: Say text 1'),
(1445, 1, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal\'Hakkar - Fel\'zerul: Emote roar'),
(1445, 4, 15, 7437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal\'Hakkar - Fel\'zerul: Cast spell "Break Stuff"'),
(1445, 7, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal\'Hakkar - Fel\'zerul: npc\_flag questgiver added');

-- Fel'zerul has a script to Cast spell "Break Stuff" OOC which is now part of the quest end script
-- Probably remove spell cast in creature script - QAkvast
DELETE FROM `creature_ai_events` WHERE `id`=144301;
DELETE FROM `creature_ai_scripts` WHERE `id`=144301;


-- DB/Quest: Brutal Armor - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21782
UPDATE `quest_template` SET `CompleteScript`=1838 WHERE `entry`=1838;
DELETE FROM `quest_end_scripts` WHERE `id`=1838;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1838, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: npc\_flag questgiver removed'),
(1838, 1, 3, 0, 4800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -423.713, -3167.24, 212.779, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 1'),
(1838, 6, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -423.211, -3164.23, 212.864, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 2'),
(1838, 7, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -425.1, -3162.25, 212.697, 2.92829, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 3+Orientation 1'),
(1838, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2348, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Emote text 1'),
(1838, 8, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: State use standing'),
(1838, 18, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: State stand'),
(1838, 18, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.30012, 0, 'Brutal Armor - Thun\'grim Firegaze: Orientation 2'),
(1838, 19, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: State mining'),
(1838, 29, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: State stand'),
(1838, 30, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -423.211, -3164.23, 212.864, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 4'),
(1838, 30, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -423.713, -3167.24, 212.779, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 5'),
(1838, 31, 3, 0, 4800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -437.62, -3176.26, 211.385, 0.820305, 0, 'Brutal Armor - Thun\'grim Firegaze: Move point 6+Orientation 3'),
(1838, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2634, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Say text 1'),
(1838, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: Emote talk 1'),
(1838, 38, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brutal Armor - Thun\'grim Firegaze: npc\_flag questgiver added');


-- DB/Quest: The Tear of the Moons - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20947
UPDATE `quest_template` SET `CompleteScript`=857 WHERE `entry`=857;
DELETE FROM `quest_end_scripts` WHERE `id`=857;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
-- (857, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: npc\_flag questgiver removed'),
(857, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1026, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Say text 1'),
(857, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Emote exclamation'),
(857, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1027, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Say text 2'),
(857, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1028, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Say text 3'),
(857, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1029, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Say text 4'),
(857, 12, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Emote roar'),
(857, 14, 15, 5142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Cast spell "Trogg Form"'),
(857, 14, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Random movement'),
(857, 24, 15, 5, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: Cast spell "Death Touch"');
-- (857, 7, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Tear of the Moons - Feegly the Exiled: npc\_flag questgiver added');

-- Add pathing for Feegly the Exiled (3421)
UPDATE `creature` SET `position_x`=-4217.83, `position_y`=-2341.47, `position_z`=91.7458, `MovementType`=2 WHERE `guid`=14138;

DELETE FROM `creature_movement` WHERE `id`=14138;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `orientation`) VALUES 
(14138, 1, -4217.83, -2341.47, 91.7458, 60000, 2.02701),
(14138, 2, -4219.46, -2336.15, 91.8028, 60000, 2.02701);


-- DB/Quest: The Mind's Eye --> Outro Event - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20860
UPDATE `quest_template` SET `CompleteScript`=591 WHERE `entry`=591;
DELETE FROM `quest_end_scripts` WHERE `id`=591;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(591, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: npc\_flag questgiver removed'),
(591, 1, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: State Kneel'),
(591, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 742, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: Emote text 1'),
(591, 4, 15, 3660, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: Cast spell "Create Soul Gem"'),
(591, 6, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: State none'),
(591, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 743, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: Say text 1'),
(591, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: Emote talk'),
(591, 10, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Mind\'s Eye - Kin\'weelay: npc\_flag questgiver added');


-- DB/Quest: Isha Awak --> Missing Outro Event - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20858
UPDATE `quest_template` SET `CompleteScript`=873 WHERE `entry`=873;
DELETE FROM `quest_end_scripts` WHERE `id`=873;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(873, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1301, 0, 0, 0, 0, 0, 0, 0, 0, 'Isha Awak - Mahren Skyseer: Say text 1'),
(873, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Isha Awak - Mahren Skyseer: Emote bow');


-- DB/Quest: Echeyakee - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20856
UPDATE `quest_template` SET `CompleteScript`=881 WHERE `entry`=881;
DELETE FROM `quest_end_scripts` WHERE `id`=881;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(881, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1295, 0, 0, 0, 0, 0, 0, 0, 0, 'Echeyakee - Sergra Darkthorn: Say text 1'),
(881, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Echeyakee - Sergra Darkthorn: Emote bow');


-- DB/Quest: Deliver the Gems - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21053
UPDATE `quest_template` SET `CompleteScript`=2340 WHERE `entry`=2340;
DELETE FROM `quest_end_scripts` WHERE `id`=2340;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2340, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3077, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Dran Droffers: Say text 1'),
(2340, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Dran Droffers: Emote talk'),
(2340, 5, 0, 0, 0, 0, 0, 4767, 0, 9, 3, 3078, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Malton Droffers: Say text 1'),
(2340, 5, 1, 1, 0, 0, 0, 4767, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Malton Droffers: Emote talk'),
(2340, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3080, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Dran Droffers: Say text 2'),
(2340, 9, 1, 274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems -Dran Droffers: Emote no'),
(2340, 13, 0, 0, 0, 0, 0, 4767, 0, 9, 3, 3079, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Malton Droffers: Say text 2'),
(2340, 13, 1, 6, 0, 0, 0, 4767, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Malton Droffers: Emote question'),
(2340, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3081, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems - Dran Droffers: Say text 2'),
(2340, 17, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deliver the Gems -Dran Droffers: Emote exclamation');


-- DB/Quest: Satyr Hooves - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21783
UPDATE `quest_template` SET `CompleteScript`=1842 WHERE `entry`=1842;
DELETE FROM `quest_end_scripts` WHERE `id`=1842;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1842, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: npc\_flag questgiver removed'),
(1842, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2348, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: Emote text 1'),
(1842, 1, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: State mining'),
(1842, 17, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: State stand'),
(1842, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2646, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: Say text 1'),
(1842, 18, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: Emote talk 1'),
(1842, 19, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Satyr Hooves - Ula\'elek: npc\_flag questgiver added');

UPDATE `creature` SET `position_x`=-811.458, `position_y`=-4939.82, `position_z`=20.4816, `orientation`=3.59002 WHERE `guid`=6490;


-- DB/Quest: "Translating the Journal (Part 2)" & "Find the Gems and Power Source" - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21052
UPDATE `quest_template` SET `CompleteScript`=2338 WHERE `entry`=2338;
DELETE FROM `quest_end_scripts` WHERE `id`=2338;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2338, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: npc\_flag questgiver removed'),
(2338, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3082, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Say text 1'),
(2338, 1, 15, 5504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Cast spell "Conjure Water"'),
(2338, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3084, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Say text 2'),
(2338, 7, 15, 9744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Cast spell "Jarkal\'s Translation"'),
(2338, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3085, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Say text 3'),
(2338, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: Emote talk'),
(2338, 14, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Translating the Journal - Jarkal Mossmeld: npc\_flag questgiver added');

UPDATE `quest_template` SET `CompleteScript`=2339 WHERE `entry`=2339;
DELETE FROM `quest_end_scripts` WHERE `id`=2339;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(2339, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: npc\_flag questgiver removed'),
(2339, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3083, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: Say text 1'),
(2339, 1, 15, 5017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: Cast spell "Divining Trance"'),
(2339, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3091, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: Say text 2'),
(2339, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: Emote talk'),
(2339, 8, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Find the Gems and Power Source - Jarkal Mossmeld: npc\_flag questgiver added');


-- DB/Quest: Gathering Materials (Horde) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21990
UPDATE `quest_template` SET `CompleteScript`=1961 WHERE `entry`=1961;
DELETE FROM `quest_end_scripts` WHERE `id`=1961;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1961, 0, 4, 147, 19, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: npc\_flag questgiver+gossip+trainer removed'),
(1961, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2761, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: Say text 1'),
(1961, 2, 15, 9157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: Cast spell "Create Mage\'s Robe"'),
(1961, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2762, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: Say text 2'),
(1961, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: Emote talk'),
(1961, 8, 4, 147, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gathering Materials - Josef Gregorian: npc\_flag questgiver+gossip+trainer added');


-- DB/Quest: Laughing Sisters - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21991
UPDATE `quest_template` SET `CompleteScript`=1945 WHERE `entry`=1945;
DELETE FROM `quest_end_scripts` WHERE `id`=1945;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1945, 0, 4, 147, 19, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: npc\_flag questgiver+gossip+trainer removed'),
(1945, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2665, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: Say text 1'),
(1945, 2, 15, 9157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: Cast spell "Create Mage\'s Robe"'),
(1945, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2666, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: Say text 2'),
(1945, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: Emote talk'),
(1945, 8, 4, 147, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Laughing Sisters - Kil\'hala: npc\_flag questgiver+gossip+trainer added');


-- DB/Quest: "Headhunting" & "Bloodscalp Clan Heads" --> Completion Events - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20644
UPDATE `quest_template` SET `CompleteScript`=582 WHERE `entry`=582;
DELETE FROM `quest_end_scripts` WHERE `id`=582;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(582, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: npc\_flag questgiver removed'),
(582, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 732, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: Emote text 1'),
(582, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: State use standing'),
(582, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 733, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: Emote text 2'),
(582, 11, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: State stand'),
(582, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 734, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: Say text 1'),
(582, 12, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: Emote talk'),
(582, 13, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Headhunting - Nimboya: npc\_flag questgiver added');

UPDATE `quest_template` SET `CompleteScript`=584 WHERE `entry`=584;
DELETE FROM `quest_end_scripts` WHERE `id`=584;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(584, 0, 4, 147, 2, 2, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: npc\_flag questgiver removed'),
(584, 0, 4, 9, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Bubbling Cauldron: Gameobject\_flag no interaction added'),
(584, 1, 35, 1, 0, 0, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0.661932, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Orientation 1'),
(584, 2, 0, 0, 0, 0, 0, 722, 0, 9, 3, 735, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Say text 1'),
(584, 2, 1, 1, 0, 0, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Emote talk'),
(584, 5, 0, 0, 0, 0, 0, 722, 0, 9, 3, 736, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Emote text 1'),
(584, 5, 15, 3644, 0, 0, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Cast spell "Speak with Heads"'),
(584, 12, 0, 0, 0, 0, 0, 722, 0, 9, 3, 740, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Say text 2'),
(584, 12, 1, 1, 0, 0, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Emote talk'),
(584, 11, 4, 9, 16, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Bubbling Cauldron: Gameobject\_flag no interaction removed'),
(584, 12, 4, 147, 2, 1, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodscalp Clan Heads - Kin\'weelay: npc\_flag questgiver Added'),
(584, 14, 35, 1, 0, 0, 0, 722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 1.26347, 0, 'Bloodscalp Clan Heads - Kin\'weelay: Orientation 2');


-- DB/Quest: The Elder Crone - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20862
DELETE FROM `quest_end_scripts` WHERE `id`=1063;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1063, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: npc\_flag questgiver removed'),
(1063, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1416, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Emote text 1'),
(1063, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1417, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Say text 1'),
(1063, 4, 1, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Emote yes'),
(1063, 6, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: npc\_flag questgiver added');


-- DB/Quest: The Broken Sigil - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20763
DELETE FROM `quest_end_scripts` WHERE `id`=640;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(640, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: npc_flag questgiver removed'),
(640, 1, 15, 4093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: Cast spell "Reconstruction"'),
(640, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 798, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: Say text 1'),
(640, 6, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: Emote talk'),
(640, 7, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: npc_flag questgiver added');


-- DB/Quest: Guile of the Raptor (Part 2) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20734
DELETE FROM `quest_end_scripts` WHERE `id`=702;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(702, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc\_flag questgiver removed'),
(702, 0, 15, 4153, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Cast spell "Guile of the Raptor"'),
(702, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1020, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Emote text 1'),
(702, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 861, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 1'),
(702, 5, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Emote question'),
(702, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 862, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 2'),
(702, 8, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Emote roar'),
(702, 10, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc\_flag questgiver added');


-- DB/Quest: Return to Thunder Bluff - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20865
DELETE FROM `quest_end_scripts` WHERE `id`=1067;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1067, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: npc_flag questgiver removed'),
(1067, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1423, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Emote text 1'),
(1067, 0, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: State use standing'),
(1067, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: State stand'),
(1067, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1424, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Say text 1'),
(1067, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Emote talk'),
(1067, 6, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: npc_flag questgiver added');


-- DB/Quest: Nothing But The Truth (Part 2) - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21448
DELETE FROM `quest_end_scripts` WHERE `id`=1383;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1383, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: npc_flag questgiver removed'),
(1383, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1848, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 1'),
(1383, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Emote talk 1'),
(1383, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10351.1, -1527.88, 92.7248, 6.23291, 0, 'Nothing But The Truth - Apothecary Faustin: Face away'),
(1383, 6, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: State use standing'),
(1383, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1849, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 2'),
(1383, 14, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: State stand'),
(1383, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10351.1, -1527.88, 92.7248, 3.14159, 0, 'Nothing But The Truth - Apothecary Faustin: Face back'),
(1383, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1850, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 3'),
(1383, 16, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Emote talk 2'),
(1383, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: npc_flag questgiver added');


-- DB/Quest: Neeru Fireblade - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20604
DELETE FROM `quest_end_scripts` WHERE `id`=829;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(829, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - Neeru Fireblade: State use standing'),
(829, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 990, 0, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - Neeru Fireblade: Emote text 1'),
(829, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 991, 992, 993, 994, 0, 0, 0, 0, 0, 'Neeru Fireblade - Neeru Fireblade: Say random text 1'),
(829, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - Neeru Fireblade: Emote talk'),
(829, 6, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - Neeru Fireblade: State stand');

DELETE FROM `quest_end_scripts` WHERE `id`=832;
UPDATE `quest_template` SET `CompleteScript`=0 WHERE `entry`=832 AND `patch`=0;


-- DB/Quest: Skull Rock end event (Margoz) - no change in NPC_flag - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20603
-- Source: https://www.youtube.com/watch?v=FaV6oAteJGI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=12276
DELETE FROM `quest_end_scripts` WHERE `id`=827;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(827, 0, 15, 5017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Cast Divining Trance'),
(827, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 986, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote text 1'),
(827, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 989, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote say 1'),
(827, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 987, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote text 2'),
(827, 6, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote wound'),
(827, 6, 15, 4947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Cast Magic Backlash'),
(827, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 988, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote say 2'),
(827, 9, 1, 274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skull Rock - Margoz: Emote no');


-- Horde quest start scripts from Trinity Core:

-- DB/Quest: Journey to the Crossroads - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20942
UPDATE `quest_template` SET `StartScript`=854 WHERE `entry`=854 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=854;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(854, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1364, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Crossroads - Kirge Sternhorn: Say text 1'),
(854, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Crossroads - Kirge Sternhorn: Emote talk');


-- DB/Quest: Hearts of the Pure - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21652
UPDATE `quest_template` SET `StartScript`=1476 WHERE `entry`=1476 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1476;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1476, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: npc_flag questgiver removed'),
(1476, 0, 15, 26638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Cast spell "Twin Teleport Visual"'),
(1476, 1, 10, 5691, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 1780.01, 59.7745, -61.4891, 6.22813, 0, 'Hearts of the Pure - Godrick Farsan: Summon "Dalin Forgewright Projection"'),
(1476, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1988, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Say text 1'),
(1476, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Emote talk 1'),
(1476, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1992, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Say text 2'),
(1476, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Emote talk 2'),
(1476, 12, 15, 26638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Cast spell "Twin Teleport Visual"'),
(1476, 13, 10, 5692, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 1780.01, 59.7745, -61.4891, 6.22813, 0, 'Hearts of the Pure - Godrick Farsan: Summon "Comar Villard Projection"'),
(1476, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1989, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Say text 3'),
(1476, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Emote talk 3'),
(1476, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1993, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Say text 4'),
(1476, 19, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Emote talk 4'),
(1476, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1990, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Say text 5'),
(1476, 22, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: Emote exclamation'),
(1476, 23, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hearts of the Pure - Godrick Farsan: npc_flag questgiver added');


-- Kil'hala (3484) is missing gossip - TC id 4270 - ok
UPDATE `creature_template` SET `gossip_menu_id`=4270 WHERE `entry`=3484 AND `patch`=0;

DELETE FROM `gossip_menu` WHERE `entry` IN (4270);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4270, 5440, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` in (4270);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4270, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(4270, 1, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);


-- [3.3.5] Dark Storms (806) Quest Has Typo - Still is weird though - QAkvast - ok
-- https://github.com/TrinityCore/TrinityCore/issues/15652
UPDATE `quest_template` SET `RequestItemsText`='Did you find Fizzle, $N? He, and rest of the Burning Blade, must be scoured from our lands!' WHERE `entry`=806 AND `patch`=0;


-- [3.3.5] DB/Quests: Text corrections to some classic quests (horde) 
-- https://github.com/TrinityCore/TrinityCore/issues/20448

-- Blood Feeders (6461) - QAkvast: there --> their and removed reference to reward items
-- http://web.archive.org/web/20071104221846/http://thottbot.com:80/q6461
UPDATE `quest_template` SET `RequestItemsText`='Hey mon, have you slain the hairy blood feeders? I fear none here in Stonetalon but I don\'t go walking around here at night... if you know what I mean mon!$b$bAs long as I stay off their dinner plate then all is well.$b$bGood luck to you, $C!' WHERE `entry`=6461 AND `patch`=0;
UPDATE `quest_template` SET `OfferRewardText`='Sweet, mon! Good news, perhaps we will have fewer unwanted dinner guests tonight.$b$bMany thanks, $N. We are forever in your debt.' WHERE `entry`=6461 AND `patch`=0;

-- Foul Magics (673), Tor'gan at Hammerfall, incorrect CompletionText, should use NPC reference (warlock), not player class
-- http://web.archive.org/web/20071104221911/http://thottbot.com:80/q673
UPDATE `quest_template` SET `RequestItemsText`='The burning in my blood... it grows by the day. The warlock must be stopped.' WHERE `entry`=673 AND `patch`=0;
-- "released them" instead of "released us" (Tor'gan is a Darkspear troll, not an orc).
UPDATE `quest_template` SET `OfferRewardText`='My restless nights will turn to peaceful slumber when I have destroyed this orb. Thank you, $N. It is a chilling reminder of the terrible power the demons held over the orcs before Hellscream released them from their curse.' WHERE `entry`=673 AND `patch`=0;

-- Valormok, Ag'tor Bloodfist, quest 3504 (Betrayed) & 3507 (Betrayed (3507)), referenced NPC Magus Rimtori is a mage and does not change to be the same class as player!
UPDATE `quest_template` SET `RequestItemsText`='Ah, Belgrom wizened up and finally sent someone not in his ranks to aid us, did he?$b$bThis camp used to be a dozen warriors strong, $N, but now they\'re all dead. That mage, Rimtori, has slain them all. She played Belgrom like a lute... seduced him even. It\'s none of my business, but between you and I, she is quite the temptress. That\'s probably why I\'m still out here helping Belgrom--I probably would have done the same thing.' WHERE `entry`=3504 AND `patch`=0;
UPDATE `quest_template` SET `OfferRewardText`='HAHA! Look at you now, pathetic woman! I spit on your remains!$b$bThank you, $N. Thank you from the bottom of my heart! This is indeed a great day!$b$bI would give you a kingdom if it were in my power! But perhaps you will settle for this.$b$b<Belgrom looks down at the head of the mage who had betrayed him.>$b$bHaha! Stupid blood elf, look at you now... in a burlap sack and missing your body! You should never have betrayed Belgrom!' WHERE `entry`=3507 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
