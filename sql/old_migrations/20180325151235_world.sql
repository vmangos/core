DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180325151235');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180325151235');
-- Add your query below.

-- The Barrens quality fix
-- Start of vid 4: https://www.youtube.com/watch?v=v0BPUXwqpeg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=18

-- Crossroads Conscription part 2
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=842 AND `patch`=0;

-- The Demon Seed
UPDATE `quest_template` SET `StartScript`=924 WHERE `entry`=924 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id`=924;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `x`, `y`, `z`, `o`, `comments`) VALUES 
(924, 0, 3, 256.258, -3693.95, 26.4771, 6.0, 'The Demon Seed - Ak\'Zeloth: Turn north');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(924, 1, 1, 25, 'The Demon Seed - Ak\'Zeloth: Point emote on quest start');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `datalong`, `dataint`, `comments`) VALUES 
(924, 1, 0, 1115, 'The Demon Seed - Ak\'Zeloth: Emote text on quest start');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `x`, `y`, `z`, `o`, `comments`) VALUES 
(924, 4, 3, 256.258, -3693.95, 26.4771, 5.3058, 'The Demon Seed - Ak\'Zeloth: Turn back');

-- Meats to Orgrimmar
UPDATE `quest_template` SET `DetailsEmote1`=1,`OfferRewardEmote1`=1 WHERE `entry`=6365 AND `patch`=0;

-- Plainstrider Menace
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=844 AND `patch`=0;

-- The Forgotten Pools
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=870 AND `patch`=0;

-- Raptor Thieves
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=869 AND `patch`=0;

-- Ride to Orgrimmar
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6384 AND `patch`=0;

-- Apothecary Helbrim quest greeting added in another merge

-- Wharfmaster Dizzywig
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1492 AND `patch`=0;

-- Fungal Spores
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmoteDelay1`=2000, `CompleteScript`=848, `CompleteEmote`=0 WHERE `entry`=848 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=848;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(848, 0, 4, 147, 2, 2, 3390, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fungal Spores - Apothecary Helbrim: npc_flag questgiver removed'),
(848, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1076, 0, 0, 0, 0, 0, 0, 0, 'Fungal Spores - Apothecary Helbrim: Say emote text 1'),
(848, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1077, 0, 0, 0, 0, 0, 0, 0, 'Fungal Spores - Apothecary Helbrim: Say text 1'),
(848, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1078, 0, 0, 0, 0, 0, 0, 0, 'Fungal Spores - Apothecary Helbrim: Say text 2'),
(848, 8, 4, 147, 2, 1, 3390, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fungal Spores - Apothecary Helbrim: npc_flag questgiver add');

-- Disrupt the Attacks
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=871 AND `patch`=0;

-- Supplies for the Crossroads
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=4, `OfferRewardEmote2`=11, `OfferRewardEmoteDelay2`=2000 WHERE `entry`=5041 AND `patch`=0;

-- Harpy Raiders
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=0, `OfferRewardEmote1`=5 WHERE `entry`=867 AND `patch`=0;

-- The Disruption Ends
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=2000 WHERE `entry`=872 AND `patch`=0;

-- Raptor Horns
UPDATE `quest_template` SET `CompleteScript`=865 WHERE `entry`=865 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=865;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(865,0,0,0,0,0,0,0,2078,0,0,0,0,0,0,0,'Raptor Horns - Mebok Mizzyrix: Say text 1'),
(865,4,0,0,0,0,0,0,2079,0,0,0,0,0,0,0,'Raptor Horns - Mebok Mizzyrix: Say text 2');

-- The Guns of Northwatch
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=4 WHERE `entry`=891 AND `patch`=0;

-- The Zhevra
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=845 AND `patch`=0;

-- Lost in Battle
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=2 WHERE `entry`=4921 AND `patch`=0;

-- Consumed by Hatred
UPDATE `quest_template` SET `IncompleteEmote`=1, `OfferRewardEmote1`=1 WHERE `entry`=899 AND `patch`=0;

-- Centaur Bracers
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=855 AND `patch`=0;

-- Kolkar Leaders
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=850 AND `patch`=0;

-- Start of vid 6:
-- Verog the Dervish
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=0 WHERE `entry`=851 AND `patch`=0;

-- Harpy Lieutenants
UPDATE `quest_template` SET `DetailsEmote1`=11, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=875 AND `patch`=0;

-- Apothecary Zamah
UPDATE `quest_template` SET `DetailsEmote1`=0, `CompleteEmote`=0 WHERE `entry`=853 AND `patch`=0;

-- Stolen Silver
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3281 AND `patch`=0;

-- Prowlers of the Barrens
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=903 AND `patch`=0;

-- Samophlange
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=902 AND `patch`=0;

-- The Escape

-- Wenikee Boltbucket

-- Egg Hunt
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=868 AND `patch`=0;

-- Report to Kadrak
UPDATE `quest_template` SET `DetailsEmote1`=1,`OfferRewardEmote1`=3 WHERE `entry`=6541 AND `patch`=0;

-- Serena Bloodfeather
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=11 WHERE `entry`=876 AND `patch`=0;

-- Hezrul Bloodmark
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=852 AND `patch`=0;

-- Letter to Jin'Zil
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=5 WHERE `entry`=1060 AND `patch`=0;

-- Echeyakee
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=881 AND `patch`=0;

-- The Stagnant Oasis
UPDATE `quest_template` SET `OfferRewardEmote1`=5 WHERE `entry`=877 AND `patch`=0;

-- Weapons of Choice
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=4 WHERE `entry`=893 AND `patch`=0;

-- Altered Beings
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=2 WHERE `entry`=880 AND `patch`=0;

-- The Ashenvale Hunt, 3 of the same quest but I assume they don't have the same emote warcaller is RP wise the most excited
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=1 WHERE `entry`=235 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=742 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6382 AND `patch`=0;

-- The Ashenvale Hunt from Jorn Skyseer has a special requirement
-- Source: master guide https://i.imgur.com/DbfGKK4.png
-- Source: comment here -> http://vanillawowdb.com/?quest=6382
UPDATE `quest_template` SET `PrevQuestId`=882 WHERE `entry`=6382 AND `patch`=0;

-- Deepmoss Spider Eggs
UPDATE `quest_template` SET `DetailsEmote1`=2, `DetailsEmoteDelay1`=1000 WHERE `entry`=1069 AND `patch`=0;

-- Blueleaf Tubers 
UPDATE `quest_template` SET `DetailsEmote1`=3 WHERE `entry`=1221 AND `patch`=0;

-- Free From the Hold
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=4 WHERE `entry`=898 AND `patch`=0;

-- The Angry Scytheclaws
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=905 AND `patch`=0;

-- Hamuul Runetotem
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1489 AND `patch`=0;

-- Start of vid 9: https://www.youtube.com/watch?v=jX9wGm27CSc&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=9

-- Melor Sends Word
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=1130 AND `patch`=0;

-- Betrayal from Within

-- Gann's Reclamation
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=843 AND `patch`=0;

-- Revenge of Gann
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmoteDelay2`=1000, `CompleteEmote`=21 WHERE `entry`=846 AND `patch`=0;

-- Betrayal from Within
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=5, `OfferRewardEmote2`=4, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=906 AND `patch`=0;

-- Jorn Skyseer
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=3261 AND `patch`=0;

-- Ishamuhale
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=882 AND `patch`=0;

-- Start of vid 11: https://www.youtube.com/watch?v=9n_V6xmHhMs&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=11

-- Enraged Thunder Lizards 
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=907 AND `patch`=0;

-- High Mountain the Elder
-- All "the Elder" quest involved in the Lunar festival
-- All assumed to have the same `OfferRewardEmote1`=1
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `Title` like ('%the Elder') AND `patch`=7;

-- A New Ore Sample
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=1153 AND `patch`=0;

-- Revenge of Gann
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=4 WHERE `entry`=849 AND `patch`=0;

-- Start of vid 12: https://www.youtube.com/watch?v=-VL55SdDw-A&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- Washte Pawne
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=885 AND `patch`=0;

-- Cry of the Thunderhawk
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=6, `OfferRewardEmote1`=2 WHERE `entry`=913 AND `patch`=0;

-- Mahren Skyseer - later abandoned
-- https://youtu.be/OlnnPZbg3T0?list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1802
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=874 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
