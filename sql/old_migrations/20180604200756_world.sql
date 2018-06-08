DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180604200756');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180604200756');
-- Add your query below.

-- Neutral quest end scripts from Trinity Core:

-- DB/Quest: "Get the Gnomes Drunk" & "Get the Goblins Drunk" - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20996
UPDATE `quest_template` SET `CompleteScript`=1120 WHERE `entry`=1120;
DELETE FROM `quest_end_scripts` WHERE `id`=1120;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8242, 0, 0, 0, 0, 0, 0, 0, 0, 'Get the Gnomes Drunk - Gnome Pit Boss: Say text 1'),
(1120, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Get the Gnomes Drunk - Gnome Pit Boss: Emote shout');

UPDATE `quest_template` SET `CompleteScript`=1121 WHERE `entry`=1121;
DELETE FROM `quest_end_scripts` WHERE `id`=1121;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8244, 0, 0, 0, 0, 0, 0, 0, 0, 'Get the Goblins Drunk - Goblin Pit Boss: Say text 1'),
(1121, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Get the Goblins Drunk - Goblin Pit Boss: Emote shout');


-- DB/Quest: Zanzil's Mixture and a Fool's Stout - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20995
UPDATE `quest_template` SET `CompleteScript`=1119 WHERE `entry`=1119;
DELETE FROM `quest_end_scripts` WHERE `id`=1119;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1119, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: npc\_flag questgiver removed'),
(1119, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1489, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: Say text 1'),
(1119, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1491, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: Say text 2'),
(1119, 4, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: Emote eat'),
(1119, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1492, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: Say text 3'),
(1119, 8, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: Emote exclamation'),
(1119, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zanzil\'s Mixture and a Fool\'s Stout - Kravel Koalbeard: npc\_flag questgiver added');


-- DB/Quest: News for Fizzle - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20993
UPDATE `quest_template` SET `CompleteScript`=1137 WHERE `entry`=1137;
DELETE FROM `quest_end_scripts` WHERE `id`=1137;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1137, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'News for Fizzle - Fizzle Brassbolts: npc\_flag questgiver removed'),
(1137, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1495, 0, 0, 0, 0, 0, 0, 0, 0, 'News for Fizzle - Fizzle Brassbolts: Emote text 1'),
(1137, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1496, 0, 0, 0, 0, 0, 0, 0, 0, 'News for Fizzle - Fizzle Brassbolts: Say text 1'),
(1137, 4, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'News for Fizzle - Fizzle Brassbolts: Emote cheer'),
(1137, 5, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'News for Fizzle - Fizzle Brassbolts: npc\_flag questgiver added');


-- DB/Quest: Indurium - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20992
UPDATE `quest_template` SET `CompleteScript`=1108 WHERE `entry`=1108;
DELETE FROM `quest_end_scripts` WHERE `id`=1108;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1108, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: npc\_flag questgiver removed'),
(1108, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Emote text 1'),
(1108, 1, 3, 0, 700, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -6764.09, -3126.58, 241.756, 1.24047, 0, 'Indurium - Martek the Exiled: Move point 1'),
(1108, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1501, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Say text 1'),
(1108, 3, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: State use standing'),
(1108, 7, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: State stand'),
(1108, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1502, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Say text 2'),
(1108, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Emote talk 1'),
(1108, 11, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: State use standing'),
(1108, 15, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: State stand'),
(1108, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1503, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Say text 3'),
(1108, 16, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Emote exclamation'),
(1108, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1504, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Say text 4'),
(1108, 19, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: Emote talk 2'),
(1108, 21, 3, 0, 700, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -6763.39, -3129.3, 241.384, 4.06662, 0, 'Indurium - Martek the Exiled: Move point 2'),
(1108, 22, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Indurium - Martek the Exiled: npc\_flag questgiver added');


-- DB/Quest: The Annals of Darrowshire completion event - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20527
UPDATE `quest_template` SET `CompleteScript`=5154 WHERE `entry`=5154;
DELETE FROM `quest_end_scripts` WHERE `id`=5154;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5154, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: npc\_flag questgiver+gossip removed'),
(5154, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6418, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Say text 1'),
(5154, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Emote talk'),
(5154, 2, 15, 17285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Cast spell "Enchant Annals of Darrowshire"'),
(5154, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6419, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Say text 2'),
(5154, 8, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: npc\_flag questgiver+gossip added');


-- DB/Quest: completion event for quest "Pamela's Doll" - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20525
UPDATE `quest_template` SET `CompleteScript`=5149 WHERE `entry`=5149;
DELETE FROM `quest_end_scripts` WHERE `id`=5149;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5149, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6416, 0, 0, 0, 0, 0, 0, 0, 0, 'Pamela\'s Doll - Pamela Redpath: Say text 1'),
(5149, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6417, 0, 0, 0, 0, 0, 0, 0, 0, 'Pamela\'s Doll - Pamela Redpath: Say text 2'),
(5149, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pamela\'s Doll - Pamela Redpath: Emote talk');


-- DB/Quest: Araj's Scarab - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21798
UPDATE `quest_template` SET `CompleteScript`=5804 WHERE `entry`=5804;
DELETE FROM `quest_end_scripts` WHERE `id`=5804;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5804, 0, 4, 147, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Apothecary Dithers: npc\_flag questgiver+gossip+vendor removed'),
(5804, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7280, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Apothecary Dithers: Say text 1'),
(5804, 3, 15, 15050, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Apothecary Dithers: Cast spell "Psychometry"'),
(5804, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7281, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Apothecary Dithers: Say text 2'),
(5804, 10, 4, 147, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Apothecary Dithers: npc\_flag questgiver+gossip+vendor added');

UPDATE `quest_template` SET `CompleteScript`=5803 WHERE `entry`=5803;
DELETE FROM `quest_end_scripts` WHERE `id`=5803;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5803, 0, 4, 147, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Alchemist Arbington: npc\_flag questgiver+gossip+vendor removed'),
(5803, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7278, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Alchemist Arbington: Say text 1'),
(5803, 3, 15, 15050, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Alchemist Arbington: Cast spell "Psychometry"'),
(5803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7279, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Alchemist Arbington: Say text 2'),
(5803, 10, 4, 147, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Araj\'s Scarab - Alchemist Arbington: npc\_flag questgiver+gossip+vendor added');


-- DB/Creature: Tabetha - various scripts - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21955
UPDATE `quest_template` SET `CompleteScript`=1947 WHERE `entry`=1947;
DELETE FROM `quest_end_scripts` WHERE `id`=1947;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1947, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: npc\_flag questgiver+gossip removed'),
(1947, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2656, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Say text 1'),
(1947, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.499598, 0, 'Journey to the Marsh - Tabetha: Orientation 1'),
(1947, 2, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: State use standing'),
(1947, 12, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: State stand'),
(1947, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2657, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Say text 2'),
(1947, 13, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Emote cheer'),
(1947, 15, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.1293, 0, 'Journey to the Marsh - Tabetha: Orientation 2'),
(1947, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2658, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Say text 3'),
(1947, 16, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Emote bow'),
(1947, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2659, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Say text 4'),
(1947, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: Emote talk'),
(1947, 21, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Journey to the Marsh - Tabetha: npc\_flag questgiver+gossip added');

UPDATE `quest_template` SET `StartScript`=1952 WHERE `entry`=1952 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1952;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1952, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: npc\_flag questgiver+gossip removed'),
(1952, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2708, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: Say text 1'),
(1952, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: Emote talk'),
(1952, 3, 15, 16633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: Cast spell "Create Item Visual (DND)"'),
(1952, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2709, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: Say text 2'),
(1952, 9, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: Emote cheer'),
(1952, 10, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mage\'s Wand - Tabetha: npc\_flag questgiver+gossip added');

UPDATE `quest_template` SET `StartScript`=1957 WHERE `entry`=1957 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=1957;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2624, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Say text 2'),
(1957, 0, 15, 9079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Cast spell "Create Rift" (Not coupled with the event ATM)');

UPDATE `quest_template` SET `CompleteScript`=1957 WHERE `entry`=1957;
DELETE FROM `quest_end_scripts` WHERE `id`=1957;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1957, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: npc\_flag questgiver+gossip removed'),
(1957, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2663, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Say text 1'),
(1957, 3, 15, 9156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Cast spell "Create Mage\'s Orb"'),
(1957, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2664, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Say text 2'),
(1957, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: Emote talk'),
(1957, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Surges - Tabetha: npc\_flag questgiver+gossip added');


-- DB/Quest: A Gnome's Assistance - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21992
UPDATE `quest_template` SET `CompleteScript`=3941 WHERE `entry`=3941;
DELETE FROM `quest_end_scripts` WHERE `id`=3941;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(3941, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: npc\_flag questgiver+gossip removed'),
(3941, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4839, 4840, 4842, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say random text 1'),
(3941, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Emote talk 1'),
(3941, 2, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -6027.85, -1020.16, -217.056, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Move point 1'),
(3941, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4841, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say text 2'),
(3941, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4846, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Emote text 1'),
(3941, 7, 15, 16633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Cast spell "Create Item Visual (DND)"'),
(3941, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4847, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say text 3'),
(3941, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4852, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say text 4'),
(3941, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4853, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say text 5'),
(3941, 21, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -6033.25, -1017.56, -217.055, 0.872665, 0, 'A Gnome\'s Assistance - J.D. Collie: Move point 2'),
(3941, 23, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: npc\_flag questgiver+gossip added'),
(3941, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4843, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance - J.D. Collie: Say text 6');


-- DB/Quest: Dream Dust in the Swamp - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20994
DELETE FROM `quest_end_scripts` WHERE `id`=1116;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1116, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: npc\_flag questgiver removed'),
(1116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1548, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote text 1'),
(1116, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1549, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote text 2'),
(1116, 3, 15, 6903, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Cast spell "Krazek\'s Drug (Stunned)"'),
(1116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 1'),
(1116, 6, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote wound 1'),
(1116, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1550, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 1 repeat'),
(1116, 9, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote wound 2'),
(1116, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1551, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Say text 2'),
(1116, 13, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: Emote exclamation'),
(1116, 14, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dream Dust in the Swamp - Krazek: npc\_flag questgiver added');


-- Neutral quest start scripts from Trinity Core:

-- DB/Quest: The Completed Orb of Noh'Orahil & The Completed Orb of Dar'Orahil - ok
-- https://github.com/TrinityCore/TrinityCore/issues/21978
UPDATE `quest_template` SET `StartScript`=4964 WHERE `entry`=4964 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=4964;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4964, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: npc\_flag questgiver+gossip removed'),
(4964, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2663, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: Say text 1'),
(4964, 3, 15, 9156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: Cast spell "Create Mage\'s Orb"'),
(4964, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2664, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: Say text 2'),
(4964, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: Emote talk'),
(4964, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Dar\'Orahil - Menara Voidrender: npc\_flag questgiver+gossip added');

UPDATE `quest_template` SET `StartScript`=4975 WHERE `entry`=4975 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=4975;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4975, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: npc\_flag questgiver+gossip removed'),
(4975, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2663, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: Say text 1'),
(4975, 3, 15, 9156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: Cast spell "Create Mage\'s Orb"'),
(4975, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2664, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: Say text 2'),
(4975, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: Emote talk'),
(4975, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Completed Orb of Noh\'Orahil - Menara Voidrender: npc\_flag questgiver+gossip added');


-- Add missing say on aggro for Ulathek (14523) - ok
-- DB/Text: Ulathek
-- https://github.com/TrinityCore/TrinityCore/issues/21914

DELETE FROM `creature_ai_events` WHERE `id`=1452314;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1452314, 14523, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1452314, 0, 0, 'Ulathek - Emote on Aggro');

DELETE FROM `creature_ai_scripts` WHERE `id`=1452314;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1452314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9735, 0, 0, 0, 0, 0, 0, 0, 0, 'Ulathek - Emote on Aggro');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
