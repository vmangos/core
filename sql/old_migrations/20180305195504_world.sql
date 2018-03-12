DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180305195504');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180305195504');
-- Add your query below.

-- Add emotes and text on quest Sully Balloo's Letter - ok
UPDATE `quest_template` SET `CompleteScript`=637 WHERE `entry`=637 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=637;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(637, 0, 0, 0, 0, 0, 0, 0, 792, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloos Letter - Sara Balloo: Emote text 1'), 
(637, 3, 0, 0, 0, 0, 0, 0, 793, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloos Letter - Sara Balloo: Say text 1');


-- Add emotes and text on quest Sara Balloo's Plea - ok
UPDATE `quest_template` SET `CompleteScript`=683 WHERE `entry`=683 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=683;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(683, 1, 0, 0, 0, 0, 0, 0, 860, 0, 0, 0, 0, 0, 0, 0, 'Sara Balloos Plea - King Magni Bronzebeard: Emote text 1'); 


-- Add emotes and script to quest Brother Anton - ok
UPDATE `quest_template` SET `CompleteScript`=1052 WHERE `entry`=1052 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1052;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1052, 0, 4, 147, 2, 2, 3980, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: npc_flag questgiver removed'),
(1052, 1, 0, 0, 0, 0, 0, 0, 0, 1377, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: Emote text 1'), 
(1052, 4, 0, 0, 0, 0, 0, 0, 0, 1378, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: Say text 1'), 
(1052, 5, 0, 0, 0, 0, 0, 0, 0, 1379, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: Emote text 2'),
(1052, 5, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: Throw emote'),
(1052, 5, 9, 20263, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Respawn Antons Letter of Commendation'), -- add object spawn
(1052, 6, 4, 147, 2, 1, 3980, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Down the Scarlet Path - Raleigh the Devout: npc_flag questgiver added');

DELETE FROM `gameobject` WHERE `guid`=20263; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(20263, 19534, 0, -846.9, -576.6, 19.68, 0.191986, 0.0, 0.0, -15, -15, 100, 1);


-- Change quest name - ok
-- https://github.com/cmangos/classic-db/commit/a1667f143dc058c9649e19cb1ff6fe992228bed9
-- Confirmed - Source: https://web.archive.org/web/20060525063613/http://wow.allakhazam.com:80/db/quest.html?wquest=1818
UPDATE `quest_template` SET `Title`='Speak with Dillinger' WHERE `entry`=1818 AND `patch`=0;


-- Make quests 858 and 863 available to the Alliance. - ok
-- https://github.com/cmangos/classic-db/commit/b138323add9e00bb8924854a2bcd3bac2581d0a3
-- Source: https://web.archive.org/web/20070410181925/http://wow.allakhazam.com:80/db/quest.html?wquest=858
UPDATE `quest_template` SET `RequiredRaces`=0 WHERE `entry`=858 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=0 WHERE `entry`=863 AND `patch`=0;


-- [0067] Backported end script for quest 502 - ok
-- https://github.com/cmangos/classic-db/commit/33159804e2e52109cb6950483110724bd5d19880
-- Emote and some delay added rest are LH script
DELETE FROM `quest_end_scripts` WHERE `id`=502;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(502, 0, 0, 0, 0, 0, 0, 0, 580, 0, 0, 0, 0, 0, 0, 0, 'Elixir of Pain - Stanley: Emote text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `data_flags`, `comments`) VALUES 
(502, 3, 15, 17673, 4, 'Elixir of Pain - Stanley: Visual transformation');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(502, 4, 16, 1108, 'Elixir of Pain - Stanley: Sound transformation');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `comments`) VALUES 
(502, 5, 18, 'Elixir of Pain - Stanley: Despawn');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`, `comments`) VALUES 
(502, 5, 10, 2275, 30000, -353.534, 21.4088, 54.6594, 3.68102, 'Elixir of Pain - Stanley: Enraged Stanley spawn');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `buddy_id`, `buddy_radius`, `comments`) VALUES 
(502, 6, 22, 38, 2275, 5, 'Elixir of Pain - Stanley: Enraged Stanley set agressive');


-- [0104] Updated quest_template for many quests - (2/6 ported) - ok 
-- https://github.com/cmangos/classic-db/commit/53d2b19201b56ce861f537c2fc03fdeb28000fab
-- Adds start script to quest 993 (A Lost Master)
UPDATE `quest_template` SET `StartScript`=993 WHERE `entry`=993 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=993;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(993, 1, 0, 0, 0, 0, 0, 0, 1249, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 2 - Terenthis: Say text 1'), 
(993, 1, 15, 4093, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 2 - Terenthis: Cast spell (Not correct one)'),
(993, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 2 - Terenthis: Talk emote'), 
(993, 4, 0, 0, 0, 0, 0, 0, 1289, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 2 - Terenthis: Say text 2'); 

-- Adds start script to quest 1221 (Blueleaf Tubers)
UPDATE `quest_template` SET `StartScript`=1221 WHERE `entry`=1221 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1221;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1221, 0, 0, 0, 0, 0, 0, 0, 1788, 0, 0, 0, 0, 0, 0, 0, 'Blueleaf Tubers - Mebok Mizzyrix: Say text 1'), 
(1221, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blueleaf Tubers - Mebok Mizzyrix: Wave emote'), 
(1221, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -929.023, -3696.98, 7.97395, 1.7352, 'Blueleaf Tubers - Mebok Mizzyrix: Rotate towards objects'), 
(1221, 4, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blueleaf Tubers - Mebok Mizzyrix: Point emote'), 
(1221, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -928.982, -3697.23, 8.06642, 3.08923, 'Blueleaf Tubers - Mebok Mizzyrix: Walk back');


-- [0168] Added end script for 25 quests - 23/25 ported
-- https://github.com/classicdb/database/commit/1f38aa9dcb1cbaea9a14f7061b612d193f9fb140

-- End script for quest 621 (Zanzil's Secret) - ok
UPDATE `quest_template` SET `CompleteScript`=621 WHERE `entry`=621 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=621;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(621, 1, 0, 0, 0, 0, 0, 0, 1469, 0, 0, 0, 0, 0, 0, 0, 'Zanzils Secret - Crank Fizzlebub: Say text 1'),
(621, 2, 0, 0, 0, 0, 0, 0, 1470, 0, 0, 0, 0, 0, 0, 0, 'Zanzils Secret - Crank Fizzlebub: Say text 2');

-- End script for quest 630 (Message in a bottle) - ok
UPDATE `quest_template` SET `CompleteScript`=630 WHERE `entry`=630 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=630;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(630, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Message in a Bottle - Princess Poobah: Wave emote on quest end'),
(630, 5, 0, 0, 0, 0, 0, 0, 765, 0, 0, 0, 0, 0, 0, 0, 'Message in a Bottle - Princess Poobah: Say text 1');

-- End script for quest 640 (The Broken Sigil) - ok
UPDATE `quest_template` SET `CompleteScript`=640 WHERE `entry`=640 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=640;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(640, 0, 4, 147, 2, 2, 2706, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: npc_flag questgiver removed'),
(640, 1, 15, 4093, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: Cast spell'),
(640, 6, 0, 0, 0, 0, 0, 0, 0, 798, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: Say text 1'),
(640, 6, 4, 147, 2, 1, 2706, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Broken Sigil - Tor\'gan: npc_flag questgiver added');

-- End script for quest 670 (Sunken Treasure) - ok
UPDATE `quest_template` SET `CompleteScript`=670 WHERE `entry`=670 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=670;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(670, 1, 0, 0, 0, 0, 0, 0, 857, 0, 0, 0, 0, 0, 0, 0, 'Sunken Treasure - Shakes O\'Breen: Say text 1');

-- End script for quest 702 (Guile of the Raptor) - ok
UPDATE `quest_template` SET `CompleteScript`=702 WHERE `entry`=702 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=702;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(702, 0, 4, 147, 2, 2, 2792, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc_flag questgiver removed'),
(702, 0, 15, 4153, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Cast spell on himself'),
(702, 5, 0, 0, 0, 0, 0, 0, 0, 1020, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Emote text 1'),
(702, 6, 4, 147, 2, 1, 2792, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: npc_flag questgiver added'),
(702, 9, 0, 0, 0, 0, 0, 0, 0, 861, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 1'),
(702, 13, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Roar emote on quest end'),
(702, 14, 0, 0, 0, 0, 0, 0, 0, 862, 0, 0, 0, 0, 0, 0, 0, 'Guile of the Raptor - Gor\'mul: Say text 2');

-- End script for quest 748 (Poison Water) - ok
UPDATE `quest_template` SET `CompleteScript`=748 WHERE `entry`=748 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=748;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(748, 0, 4, 147, 2, 2, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Poison Water - Mull Thunderhorn: npc_flag questgiver removed'),
(748, 0, 15, 4983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Poison Water - Mull Thunderhorn: Cast spell'),
(748, 0, 0, 0, 0, 0, 0, 0, 0, 952, 0, 0, 0, 0, 0, 0, 0, 'Poison Water - Mull Thunderhorn: Emote text 1'),
(748, 8, 0, 0, 3, 0, 0, 0, 0, 1009, 0, 0, 0, 0, 0, 0, 0, 'Poison Water - Mull Thunderhorn: Say text 1'),
(748, 9, 4, 147, 2, 1, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Poison Water - Mull Thunderhorn: npc_flag questgiver added');

-- End script for quest 756 (Thunderhorn Totem) - ok
UPDATE `quest_template` SET `CompleteScript`=756 WHERE `entry`=756 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=756;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(756, 0, 4, 147, 2, 2, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderhorn Totem - Mull Thunderhorn: npc_flag questgiver removed'),
(756, 0, 15, 4983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderhorn Totem - Mull Thunderhorn: Cast spell'),
(756, 0, 0, 0, 0, 0, 0, 0, 0, 1004, 0, 0, 0, 0, 0, 0, 0, 'Thunderhorn Totem - Mull Thunderhorn: Emote text 1'),
(756, 8, 0, 0, 3, 0, 0, 0, 0, 954, 0, 0, 0, 0, 0, 0, 0, 'Thunderhorn Totem - Mull Thunderhorn: Say text 1'), -- Remove 3
(756, 9, 4, 147, 2, 1, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderhorn Totem - Mull Thunderhorn: npc_flag questgiver added');

-- End script for quest 759 (Wildmane Totem) - ok
UPDATE `quest_template` SET `CompleteScript`=759 WHERE `entry`=759 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=759;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(759, 0, 4, 147, 2, 2, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wildmane Totem - Mull Thunderhorn: npc_flag questgiver removed'),
(759, 0, 15, 4983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wildmane Totem - Mull Thunderhorn: Cast spell'),
(759, 0, 0, 0, 0, 0, 0, 0, 0, 1003, 0, 0, 0, 0, 0, 0, 0, 'Wildmane Totem - Mull Thunderhorn: Emote text 1'),
(759, 8, 0, 0, 3, 0, 0, 0, 0, 1006, 0, 0, 0, 0, 0, 0, 0, 'Wildmane Totem - Mull Thunderhorn: Say text 1'), -- Remove 3
(759, 9, 4, 147, 2, 1, 2948, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wildmane Totem - Mull Thunderhorn: npc_flag questgiver added');

-- End script for quest 950 (Return to Onu) - ok
UPDATE `quest_template` SET `CompleteScript`=950 WHERE `entry`=950 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=950;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(950, 0, 4, 147, 2, 2, 3616, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: npc_flag questgiver removed'),
(950, 1, 0, 0, 0, 0, 0, 0, 0, 1216, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: Emote text 1'),
(950, 4, 0, 0, 0, 0, 0, 0, 0, 1217, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: Emote text 2'),
(950, 4, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: Emote wound'),
(950, 4, 15, 4947, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: Cast spell (guessed spell)'),
(950, 7, 0, 0, 0, 0, 0, 0, 0, 1218, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: Say text 1'),
(950, 8, 4, 147, 2, 1, 3616, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Onu - Onu: npc_flag questgiver added');

-- End script for quest 1062 (Goblin Invaders) - ok - 20180310 added emote and npc_flag removal per source
-- Source: https://www.youtube.com/watch?v=5UWZaZjKS14&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=3736
UPDATE `quest_template` SET `CompleteScript`=1062 WHERE `entry`=1062 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1062;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1062, 0, 4, 147, 2, 2, 4049, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Invaders - Seereth Stonebreak: npc_flag questgiver removed'),
(1062, 1, 0, 0, 0, 0, 0, 0,  0, 1425, 0, 0, 0, 0, 0, 0, 0, 'Goblin Invaders - Seereth Stonebreak: Say text 1'),
(1062, 3, 0, 0, 0, 0, 0, 0,  0, 1426, 0, 0, 0, 0, 0, 0, 0, 'Goblin Invaders - Seereth Stonebreak: Say text 2'),
(1062, 3, 1, 15, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Invaders - Seereth Stonebreak: Roar emote'),
(1062, 4, 4, 147, 2, 1, 4049, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Invaders - Seereth Stonebreak: npc_flag questgiver added');

-- End script for quest 1063 (The Elder Crone) - ok
UPDATE `quest_template` SET `CompleteScript`=1063 WHERE `entry`=1063 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1063;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1063, 0, 0, 0, 0, 0, 0, 0, 1416, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Emote text 1'),
(1063, 2, 0, 0, 0, 0, 0, 0, 1417, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Say text 1');

-- End script for quest 1066 (Blood of Innocents) - ok
UPDATE `quest_template` SET `CompleteScript`=1066 WHERE `entry`=1066 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1066;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1066, 0, 4, 147, 2, 2, 2216, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: npc_flag questgiver removed'),
(1066, 0, 0, 0, 0, 0, 0, 0, 0, 1421, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: Emote text 1'),
(1066, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: Emote use'),
(1066, 4, 0, 0, 0, 0, 0, 0, 0, 1422, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: Say text 1'),
(1066, 4, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: Emote normal'),
(1066, 4, 4, 147, 2, 1, 2216, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blood of Innocents - Apothecary Lydon: npc_flag questgiver added');

-- End script for quest 1067 (Return to Thunder Bluff) - ok
UPDATE `quest_template` SET `CompleteScript`=1067 WHERE `entry`=1067 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1067;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1067, 0, 4, 147, 2, 2, 3419, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: npc_flag questgiver removed'),
(1067, 0, 0, 0, 0, 0, 0, 0, 0, 1423, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Emote text 1'),
(1067, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Emote use'),
(1067, 4, 0, 0, 0, 0, 0, 0, 0, 1424, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Say text 1'),
(1067, 4, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: Emote normal'),
(1067, 4, 4, 147, 2, 1, 3419, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Thunder Bluff - Apothecary Zamah: npc_flag questgiver added');

-- End script for quest 1112 (Parts for Kravel) - ok
-- Source: https://www.youtube.com/watch?v=VBlnzRNTatI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=305
UPDATE `creature_addon` SET `bytes1`=0 WHERE `guid`=21570 AND `patch`=0; -- Kravel should stand

UPDATE `quest_template` SET `CompleteScript`=1112 WHERE `entry`=1112 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1112;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1112, 0, 4, 147, 2, 2, 4452, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: npc_flag questgiver removed'),
(1112, 1, 0, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Emote text 1'),
(1112, 2, 9, 20837, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Respawn Parts Crate'),
(1112, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Kneel start'),
(1112, 4, 0, 0, 0, 0, 0, 0, 0, 1477, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Emote text 2'),
(1112, 7, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Kneel end'),
(1112, 8, 0, 0, 0, 0, 0, 0, 0, 1478, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Say text 1'),
(1112, 8, 4, 147, 2, 1, 4452, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: npc_flag questgiver added');

DELETE FROM `gameobject` WHERE `guid`=20837; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(20837, 19878, 1, -6232.1, -3854.6, -58.75, 0.191986, 0.095846, 0.995396, -10, -10, 100, 1);

-- End script for quest 1116 (Dream Dust in the Swamp) - ok
UPDATE `quest_template` SET `CompleteScript`=1116 WHERE `entry`=1116 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1116;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1116, 0, 4, 147, 2, 2, 773, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: npc_flag questgiver removed'),
(1116, 0, 0, 0, 0, 0, 0, 0, 0, 1548, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote text 1'),
(1116, 1, 0, 0, 0, 0, 0, 0, 0, 1549, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote text 2'),
(1116, 1, 15, 6903, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Stunned'),
(1116, 4, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 1'),
(1116, 7, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 1 again'),
(1116, 9, 0, 0, 0, 0, 0, 0, 0, 1551, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 2'),
(1116, 9, 4, 147, 2, 1, 773, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: npc_flag questgiver added');

-- End script for quest 1117 (Rumors for Kravel) - ok
UPDATE `quest_template` SET `CompleteScript`=1117 WHERE `entry`=1117 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1117;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1117, 0, 4, 147, 2, 2, 4452, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: npc_flag questgiver removed'),
(1117, 1, 0, 0, 0, 0, 0, 0, 0, 1480, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: Emote text 1'),
(1117, 1, 1, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: Emote dance state'),
(1117, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: Emote normal (stop dance)'),
(1117, 7, 0, 0, 0, 0, 0, 0, 0, 1481, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: Emote text 1'),
(1117, 7, 4, 147, 2, 1, 4452, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rumors for Kravel - Kravel Koalbeard: npc_flag questgiver added');

-- End script for quest 1169 (Identifying the Brood) - ok
UPDATE `quest_template` SET `CompleteScript`=1169 WHERE `entry`=1169 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1169;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1169, 0, 4, 147, 2, 2, 4501, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Identifying the Brood - Draz\'Zilb: npc_flag questgiver removed'),
(1169, 0, 0, 0, 0, 0, 0, 0, 0, 1511, 0, 0, 0, 0, 0, 0, 0, 'Identifying the Brood - Draz\'Zilb: Emote text 1'),
(1169, 1, 15, 6741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Identifying the Brood - Draz\'Zilb: cast spell'),
(1169, 11, 0, 0, 0, 0, 0, 0, 0, 1512, 0, 0, 0, 0, 0, 0, 0, 'Identifying the Brood - Draz\'Zilb: Say text 1'),
(1169, 11, 4, 147, 2, 1, 4501, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Identifying the Brood - Draz\'Zilb: npc_flag questgiver added');

-- End script for quest 1176 (Load Lightening) - ok
UPDATE `quest_template` SET `CompleteScript`=1176 WHERE `entry`=1176 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1176;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1176, 2, 0, 0, 0, 0, 0, 0, 1526, 0, 0, 0, 0, 0, 0, 0, 'Load Lightening - Pozzik: Say text');

-- End script for quest 1383 (Nothing But The Truth) - ok
UPDATE `quest_template` SET `CompleteScript`=1383 WHERE `entry`=1383 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1383;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1383, 0, 4, 147, 2, 2, 5414, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: npc_flag questgiver removed'),
(1383, 1, 0, 0, 0, 0, 0, 0, 0, 1848, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 1'),
(1383, 4, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, -10351.1, -1527.88, 92.7248, 6.23291, 'Nothing But The Truth - Apothecary Faustin: Face away'),
(1383, 6, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Emote use start'),
(1383, 10, 0, 0, 0, 0, 0, 0, 0, 1849, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 2'),
(1383, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Emote normal '),
(1383, 15, 3, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, -10351.1, -1527.88, 92.7248, 3.14159, 'Nothing But The Truth - Apothecary Faustin: Face back'),
(1383, 16, 0, 0, 0, 0, 0, 0, 0, 1850, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: Say text 3'),
(1383, 16, 4, 147, 2, 1, 5414, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Apothecary Faustin: npc_flag questgiver added');

-- End script for quest 1391 (Nothing But The Truth) - ok
UPDATE `quest_template` SET `CompleteScript`=1391 WHERE `entry`=1391 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1391;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1391, 0, 0, 0, 0, 0, 0, 0, 1857, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Emote text 1'),
(1391, 2, 0, 0, 0, 0, 0, 0, 1858, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Say text 1'),
(1391, 7, 0, 0, 0, 0, 0, 0, 1859, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Say text 2'),
(1391, 8, 1, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Stunned'),
(1391, 13, 0, 0, 0, 0, 0, 0, 1860, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Emote text 2'),
(1391, 14, 0, 0, 0, 0, 0, 0, 1861, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Say text 3'),
(1391, 14, 15, 7293, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Morph to undead (with spell)'),
(1391, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Normal'),
(1391, 16, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10423.5, -3240.63, 20.1786, 4.68979, 'Nothing But The Truth - Infiltrator Marksen: Wander'),
(1391, 17, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10420.6, -3240.03, 20.1786, 2.11212, 'Nothing But The Truth - Infiltrator Marksen: Wander'),
(1391, 19, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10422.1, -3237.58, 20.1786, 3.80072, 'Nothing But The Truth - Infiltrator Marksen: Wander'),
(1391, 20, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10424.4, -3239.73, 20.1786, 3.8633, 'Nothing But The Truth - Infiltrator Marksen: Wander'),
(1391, 22, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10422.4, -3238.96, 20.1786, 0.236333, 'Nothing But The Truth - Infiltrator Marksen: Wander'),
(1391, 26, 15, 5, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Nothing But The Truth - Infiltrator Marksen: Die (with spell)');

-- End script for quest 1445 (The Temple of Atal'Hakkar) - ok
UPDATE `quest_template` SET `CompleteScript`=1445 WHERE `entry`=1445 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1445;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`,  `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1445, 0, 4, 147, 2, 2, 1443, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal Hakkar - Fel\'zerul: npc_flag questgiver removed'),
(1445, 0, 0, 0, 0, 0, 0, 0, 0, 1949, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal Hakkar - Fel\'zerul: Say text 1'),
(1445, 3, 15, 7437, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal Hakkar - Fel\'zerul: Cast spell destroy stuff'),
(1445, 5, 4, 147, 2, 1, 1443, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Temple of Atal Hakkar - Fel\'zerul: npc_flag questgiver added');

-- End script for quest 3908 (It's a Secret to Everybody) - ok
UPDATE `quest_template` SET `CompleteScript`=3908 WHERE `entry`=3908 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=3908;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(3908, 1, 0, 0, 0, 0, 0, 0, 0, 6153, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 1'),
(3908, 1, 4, 147, 3, 2, 9298, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: npc_flag quest giver and gossip removed'),
(3908, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6384.54, -2527.25, 538.736, 2.52438, 'Its a Secret to Everybody - Donova Snowden: Move 1'),
(3908, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6370.12, -2525.52, 532.268, 2.82283, 'Its a Secret to Everybody - Donova Snowden: Move 2'),
(3908, 15, 0, 0, 0, 0, 0, 0, 0, 6154, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 2'),
(3908, 20, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Throw emote'),
(3908, 21, 0, 0, 0, 0, 0, 0, 0, 6155, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Emote text 1'),
(3908, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6364.25, -2524, 527.058, 2.9265, 'Its a Secret to Everybody - Donova Snowden: Move 3'),
(3908, 26, 0, 0, 0, 0, 0, 0, 0, 6156, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 3'),
(3908, 27, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Kneel emote'),
(3908, 30, 0, 0, 0, 0, 0, 0, 0, 6157, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 4'),
(3908, 31, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6370.3, -2524.19, 532.27, 6.26836, 'Its a Secret to Everybody - Donova Snowden: Move 4'),
(3908, 34, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6385.99, -2529.26, 539.03, 5.66753, 'Its a Secret to Everybody - Donova Snowden: Move 5'),
(3908, 42, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6395.57, -2536.75, 541.548, 5.66753, 'Its a Secret to Everybody - Donova Snowden: Move 6'),
(3908, 47, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6395.57, -2536.75, 541.548, 2.86475, 'Its a Secret to Everybody - Donova Snowden: Move 7'),
(3908, 48, 0, 0, 0, 0, 0, 0, 0, 6158, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 5'),
(3908, 49, 4, 147, 3, 1, 9298, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: npc_flag quest giver and gossip added');

-- End script for quest 5341 (Barov Family Fortune) - ok
UPDATE `quest_template` SET `CompleteScript`=5341 WHERE `entry`=5341 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=5341;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(5341, 1, 0, 0, 0, 0, 0, 0, 6554, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Alexi Barov: Say text 1'),
(5341, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Alexi Barov: Talk emote');


-- [0265] Fixes from ProjectSilverpine - ok
-- https://github.com/cmangos/classic-db/commit/1a6ab72c29dd9de4a9f16d90b60ce8567eb96602
-- Add quest start script to Vyletongue Corruption (7029 & 7041)
UPDATE `quest_template` SET `StartScript`=7029 WHERE `entry`=7029 AND `patch`=0;
UPDATE `quest_template` SET `StartScript`=7041 WHERE `entry`=7041 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id` IN (7029, 7041);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(7029, 0, 0, 0, 0, 0, 0, 0, 8923, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption - Vark Battlescar: Say text 1'),
(7041, 0, 0, 0, 0, 0, 0, 0, 8923, 0, 0, 0, 0, 0, 0, 0, 'Vyletongue Corruption - Talendria: Say text 1');


-- [0285] Fix typo, replace "guage" with "gauge"
-- https://github.com/classicdb/database/commit/a4a773126e03bad723700daaf1630c9bf51a6af7
-- Confirmed - QAkvast
UPDATE `page_text` SET `text`='Hi Felnok! My studies in the Burning Steppes are proceeding splendidly.  And I owe $N a lot for all $ghis:her; help!  Here\'s what I need to continue: A steelcoil bumber-bitzel A 17-gauge ice-spanner 12 pounds of duck feathers A jar of that glue you make Thanks a lot Felnok, and when we see each other again remind me not to put coal in your boots! -Tinkee ' WHERE `entry`=1710;


-- [0366] Fixed scripts for quests 1022 & 1043 - ok
-- https://github.com/cmangos/classic-db/commit/94207a754a36033ddce663bc096ece7c3992fa1d
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=3946;
-- DELETE FROM `creature_ai_texts` WHERE `entry` IN (-658, -659, -660);

-- Added script for quest 1022 (The Howling Vale)
-- Source: http://www.wowwiki.com/Quest:The_Howling_Vale
-- http://www.wowhead.com/quest=1022
-- Tome of Mel'Thandris starts event 663
DELETE FROM `event_scripts` WHERE `id`=663;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(663, 0, 10, 3946, 22000, 0, 0, 0, 0, 0, 0, 0, 3161.682, -1211.122, 214.949, 4.669, 'Tome of MelThandris - Velinde Starsong: Spawn'),
(663, 2, 28, 8, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Kneel emote'),
(663, 5, 0, 0, 0, 3946, 10, 0, 1356, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Say text 1'),
(663, 5, 1, 1, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Talk emote 1'),
(663, 10, 0, 0, 0, 3946, 10, 0, 1357, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Say text 2'),
(663, 10, 1, 20, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Beg emote 1'),
(663, 15, 0, 0, 0, 3946, 10, 0, 1358, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Say text 3'),
(663, 15, 1, 1, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tome of MelThandris - Velinde Starsong: Talk emote 2');

-- Added script for quest 1043 (The Scythe of Elune)
-- Source: http://www.wowwiki.com/Quest:The_Scythe_of_Elune
-- http://www.wowhead.com/quest=1043
-- Mound of Dirt starts event 664
DELETE FROM `event_scripts` WHERE `id`=664;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(664, 0, 10, 3946, 22000, 0, 0, 0, 0, 0, 0, 0, -11142.509, -1151.725, 43.598, 4.849, 'Mound of Dirt - Velinde Starsong: Spawn'),
(664, 5, 0, 0, 0, 3946, 10, 0, 1359, 0, 0, 0, 0, 0, 0, 0, 'Mound of Dirt - Velinde Starsong: Say text 1'),
(664, 5, 1, 1, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mound of Dirt - Velinde Starsong: Talk emote 1'),
(664, 10, 0, 0, 0, 3946, 10, 0, 1360, 0, 0, 0, 0, 0, 0, 0, 'Mound of Dirt - Velinde Starsong: Say text 2'),
(664, 10, 1, 1, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mound of Dirt - Velinde Starsong: Talk emote 2'),
(664, 15, 1, 18, 0, 3946, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mound of Dirt - Velinde Starsong: Cry emote');


-- [0878] Improved script for quest 656 - Ok
-- https://github.com/cmangos/classic-db/commit/c6d88fa9e8590c249bafbdfe3fb7ffe1b9cc0f6e
DELETE FROM `event_scripts` WHERE `id`=420;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(420, 0, 10, 2755, 3000000, 0, 0, 0, 0, 0, 0, 0, -931.73, -3111.81, 48.517, 3.27404, 'Summoning the Princess - Myzrael: Spawn for quest 656'),
(420, 2, 0, 0, 0, 2755, 50, 1, 842, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess - Myzrael: Say text 1'),
(420, 5, 0, 0, 0, 2755, 50, 1, 843, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess - Myzrael: Say text 2'),
(420, 10, 0, 0, 0, 2755, 50, 1, 844, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess - Myzrael: Say text 3'),
(420, 11, 26, 0, 0, 2755, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Summoning the Princess - Myzrael: Attack');


-- [1194] Backported UDB updates
-- https://github.com/cmangos/classic-db/commit/f2609989333353d5b1cc201a91fb6ac0708bc81c

-- q.4129 'The Knife Revealed' - ok
DELETE FROM `quest_end_scripts` WHERE `id`=4129;
UPDATE `quest_template` SET `CompleteScript`=4129 WHERE `entry`=4129 AND `patch`=0;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(4129,0,4,147,6,2,0,0,0,0,0,0,0,0,0,0,0,'The Knife Revealed - Quintis Jonespyre: npcflag removed (LH flag is 6)'),
(4129,2,0,0,0,0,0,0,0,5148,0,0,0,0,0,0,0,'The Knife Revealed - Quintis Jonespyre: Say text 1'),
(4129,3,15,15050,0,0,0,0,0,0,0,0,0,0,0,0,0,'The Knife Revealed - Quintis Jonespyre: Cast Psychometry spell'),
(4129,10,0,0,0,0,0,0,0,5149,0,0,0,0,0,0,0,'The Knife Revealed - Quintis Jonespyre: Say text 2'),
(4129,12,4,147,6,1,0,0,0,0,0,0,0,0,0,0,0,'The Knife Revealed - Quintis Jonespyre: npcflag added again');

-- q.2943 'Return to Troyas' - ok
DELETE FROM `quest_end_scripts` WHERE id=2943;
UPDATE `quest_template` SET `CompleteScript`=2943 WHERE `entry`=2943 AND `patch`=0;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2943,0,4,147,2,2,0,0,0,0,0,0,0,0,0,0,0,'Return to Troyas - Troyas Moonbreeze: npcFlags removed (LH flag is 2)'),
(2943,1,0,0,0,0,0,0,0,4039,0,0,0,0,0,0,0,'Return to Troyas - Troyas Moonbreeze: Say text 1'),
(2943,2,3,0,0,0,0,0,0,0,0,0,0,-4476.23,3230.55,13.7301,4.20931,'Return to Troyas - Troyas Moonbreeze: Move to table'),
(2943,4,3,0,0,0,0,0,0,0,0,0,0,-4476.23,3230.55,13.7301,4.99471,'Return to Troyas - Troyas Moonbreeze: Rotate'),
(2943,5,0,0,0,0,0,0,0,4040,0,0,0,0,0,0,0,'Return to Troyas - Troyas Moonbreeze: Emote text 1'),
(2943,10,0,0,0,0,0,0,0,4041,0,0,0,0,0,0,0,'Return to Troyas - Troyas Moonbreeze: Say text 2'),
(2943,12,3,0,0,0,0,0,0,0,0,0,0,-4474.9,3232.88,13.7295,0.951991,'Return to Troyas - Troyas Moonbreeze: Move back'),
(2943,14,4,147,2,1,0,0,0,0,0,0,0,0,0,0,0,'Return to Troyas - Troyas Moonbreeze: npcFlags added (LH flag is 2)');

-- q.3463 'Set Them Ablaze!' - ok
DELETE FROM `quest_end_scripts` WHERE id=3463;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(3463,1,31,8479,100,0,0,0,0,0,0,0,0,0,0,0,'Set Them Ablaze - Search for Kalaran Windblade'), 
(3463,2,18,0,0,8479,5921,1 | 0x10,0,0,0,0,0,0,0,0,'Set Them Ablaze - Despawn Kalaran Windblade'),
(3463,3,10,8480,54000,0,0,0,0,0,0,0,-6679.93,-1194.36,240.297,2.96706,'Set Them Ablaze - Summon Kalaran the Deceiver');
UPDATE `quest_template` SET `CompleteScript`=3463 WHERE `entry`=3463;

-- Kalaran Windblade set lower respawn since he will be despawned
UPDATE `creature` SET `spawntimesecsmin`=120, `spawntimesecsmax`=120 WHERE `guid`=5921;

-- Kalaran the Deceiver
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=8480 AND `patch`=0;
UPDATE `creature_template` SET `unit_flags`=2 WHERE `entry`=8480 AND `patch`=0;
DELETE FROM `creature_movement_template` WHERE `entry`=8480;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`, `model1`, `model2`) VALUES
(8480, 1, -6679.93,-1194.36,240.297,15000,848001,2.96706,0,0),
(8480, 2, -6679.93,-1194.36,240.297,30000,0,4.65994,0,0),
(8480, 3, -6879.3,-1187.34,253.384,0,0,3.10877,0,0);

DELETE FROM `creature_movement_scripts` WHERE `id`=848001;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_id`, `buddy_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(848001,1,21,1,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver: active'),
(848001,1,0,0,0,0,0,0,4456,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 1'),
(848001,3,0,0,0,0,0,0,4458,0,0,0,0,0,0,0,'Kalaran the Deceiver: Emote text 1'),
(848001,7,0,0,0,0,0,0,4457,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 2'),
(848001,13,0,0,0,8509,5598,1 | 0x10,4459,0,0,0,0,0,0,0,'Squire Maltrake: Say text 1'),
(848001,18,0,0,0,0,0,0,4460,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 3'),
(848001,22,0,0,0,0,0,0,4461,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 4'),
(848001,27,0,0,0,0,0,0,4462,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 5'),
(848001,32,0,0,0,8509,5598,1 | 0x10,4468,0,0,0,0,0,0,0,'Squire Maltrake: Say text 2'),
(848001,35,0,0,0,0,0,0,4464,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 6'),
(848001,38,0,0,0,0,0,0,4463,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 7'),
(848001,41,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Kalaran the Deceiver: RUN ON'),
(848001,44,0,0,0,0,0,0,4465,0,0,0,0,0,0,0,'Kalaran the Deceiver: Say text 8'),
(848001,48,21,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'Kalaran the Deceiver: unactive');

-- Torwa Pathfinder - ok
-- new gossip after q. 4289
-- additional menu should be available after q.4290
UPDATE `creature_template` SET `gossip_menu_id`=2188 WHERE `entry`=9619 AND `patch`=0;
-- Add alternative text for when quest 4289 (The Apes of Un'Goro) is completed
DELETE FROM `gossip_menu` WHERE `entry`=2188 AND text_id=2821;  
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2188, 2821, 1145);
-- Add Gossip menu for when quest 4290 (The Fare of Lar'korwi) is completed
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (2188); 
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES 
(2188, 'Who is this Lar\'korwi you spoke of?', 5187, 1, 1, 2189, 1146);
DELETE FROM `gossip_menu` WHERE `entry`=2189 AND text_id=2835; 
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2189, 2835);
-- Add needed conditions
DELETE FROM `conditions` WHERE `condition_entry` IN (1145,1146);  
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(1145, 8, 4289, 0),
(1146, 8, 4290, 0);

-- Overlord Mok'Morokk - ok
-- after defeted in quest "Challenge Overlord Mok'Morokk" he should respawn quicker for other players.
-- Reduced spawntime by 90% - QAkvast
UPDATE `creature` SET `spawntimesecsmin`=120, `spawntimesecsmax`=120 WHERE `guid`=31442;


-- quest_greeting texts from https://github.com/TrinityCore/TrinityCore/issues/20903	15/18 entries ported
DELETE FROM `quest_greeting` WHERE `entry` IN (264, 344, 392, 900, 2080, 3337, 3339, 3390, 3519, 3567, 3847, 3995, 4049, 5767, 11862);
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `Emote`, `EmoteDelay`) VALUES 
(264, 'At ease, $c. If you are just passing though I suggest you stick to the roads and only travel by day. If your business is here in Darkshire, consider lending your abilities to the Night Watch. Our Skill is unquestionable but our numbers are small.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Commander Althea Ebonlocke
(344, 'Redridge is awash in chaos!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0), -- Magistrate Solomon
(392, 'Do not be alarmed, $r.  I have long since passed from this land but I intend no harm to your kind.  I have witnessed too much death in my time.  My only wish now is for peace.  Perhaps you can help my cause.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Captain Grayson
(900, 'What business brings you before the Court of Lakeshire and the Honorable Magistrate Solomon?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0), -- Bailiff Conacher, only 1 quest though
(2080, 'The creation of Teldrassil was a grand achievement, but now the world must shift to regain its balance.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Denalan
(3337, 'The heft of an axe, the battlecry of your allies, the spray of blood in your face. These are the things a warrior craves, $n. I will carve out The Barrens with my sword in the name of the Horde.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Kargal Battlescar, only 1 quest though
(3339, 'This had better be good...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Captain Thalo'thas Brightsun
(3390, 'The Barrens holds a variety of substances for which we, the apothecaries of Lordaeron may find use.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1), -- Apothecary Helbrim
(3519, 'I, Arynia Cloudsbreak, have been tasked with protecting the sanctity of the Oracle Grove.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Sentinel Arynia Cloudsbreak
(3567, 'Well met, $n. It is good to see that $cs like yourself are taking an active part in protecting the groves.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Tallonkai Swiftroot
(3847, 'Ashenvale is a lush forest, brimming with life. It is a pleasure to walk down its secret paths in search of herbs, but one must take care. The forest is not without its dangers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Orendil Broadleaf
(3995, 'The spirits are restless!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0), -- Witch Doctor Jin'Zil
(4049, 'The spirit of Stonetalon weeps... It weeps from its mountain peaks, to its rivers, to its severed, dying trees.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Seereth Stonebreak
(5767, 'Our only hope is to create something good from an already bad situation.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0); -- Nalpak
-- (11862, ' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0); -- Tsunaman


-- quest_greeting texts from https://github.com/TrinityCore/TrinityCore/issues/20997	8/9 entries ported
DELETE FROM `quest_greeting` WHERE `entry` IN (2706, 2817, 4046, 4452, 4498, 5412, 5641, 10537);
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `Emote`, `EmoteDelay`) VALUES 
(2706, 'Thanks to the Warchief, even here in the ruins of our former prison some hope remains, and the Horde rises anew.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Tor'gan
(2817, 'You must be hard up to be wandering this Badlands, $c. A hard up like me.$B$BOr maybe you\'re here because you\'re crazy. Crazy, like me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Rigglefuzz
(4046, 'You must listen, young $c.  Listen to the whisperings in the darkness, for they offer guidance in these troubled times.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Magatha Grimtotem
(4452, 'Come a little closer.  We have important matters to discuss, you and I.$B$BAnd some of them we don\'t want everyone to hear...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Kravel Koalbeard
(4498, 'Greetings, $c.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Maurin Bonesplitter
(5412, 'The centaur clans rule the wastes of Desolace. If united, they would be a terrible force. It is then good that the centaur clans are not united but instead bicker and war amongst themselves.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Gurda Wildmane
(5641, 'The main threat Thrall wishes dealt with is the Burning Blade---members of the Horde that have given their loyalty to the demons. They seek to practice their dark magic and care little for Thrall\'s visions of the Horde\'s future here in Kalimdor.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Takata Steelblade
(10537, 'We cannot take care of all the threats in this area alone. We could use another fighting hand, $n.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0); -- Cliffwatcher Longhorn


-- quest_greeting texts from https://github.com/TrinityCore/TrinityCore/issues/21547	9/10 entries ported - ok
DELETE FROM `quest_greeting` WHERE `entry` IN (1776, 1950, 3441, 4485, 4500, 6986, 7777, 7825, 9536);
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `Emote`, `EmoteDelay`) VALUES 
(1776, 'We spent so much of our lives in fight, memories of peaceful times grow evermore distant.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Magtoor
(1950, 'My brother and I are on a scouting mission, but we are holed up in this farmhouse. The Deathstalkers need your help!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Rane Yorick
(3441, 'To hunt a beast, one must know that beast.  One must learn and respect its ways.$B$BTo do otherwise is not to hunt.  To do otherwise is merely to kill.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Melor Stonehoof 
(4485, 'The days grow long, and still no end to the conflicts of these lands can be seen. It takes no spell caster to know that much. Take up a blade while you can, $c. War can come to our doors at any time, and if I\'m not mistaken, you look to be one who revels in it.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Belgrom Rockmaul
(4500, 'Overlord Mok\'Morokk boss. You do what I say.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Overlord Mok'Morokk 
(6986, 'My name is Dran Droffers, and this over here is my dummy son Malton.  If you need salvage, or are looking to sell salvage, then we\'re who you need to be talking to!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0), -- Dran Droffers
-- (7777, ' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Rok Orhan
-- (7825, ' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0), -- Oran Snakewrithe
(9536, 'The quest for wealth is the only goal for a respectable goblin.$B$BWell, maybe wealth... and a big, loud death!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0); -- Maxwort Uberglint

-- Unrelated startup error.
-- ERROR:Table `creature` have creature (GUID: 590004 Entry: 6228) with low current mana (1926), `creature_template`.`minmana`=2457.
UPDATE `creature` SET `curmana`=2457 WHERE `guid`=590004;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
