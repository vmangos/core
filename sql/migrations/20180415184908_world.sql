DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180415184908');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180415184908');
-- Add your query below.

-- Desolace
-- Start of vid 18: https://www.youtube.com/watch?v=XccyLbaij2c&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Kolkar of Desolace
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1362 AND `patch`=0;

-- Start of vid 20: https://www.youtube.com/watch?v=OlnnPZbg3T0&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Alliance Relations pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=1431 AND `patch`=0;

-- Alliance Relations pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=1432 AND `patch`=0;

-- The Corrupter pt. 1
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1480 AND `patch`=0;

-- Kodo Roundup

-- Khan Dez'hepah
UPDATE `quest_template` SET `PrevQuestId`=1362 WHERE `entry`=1365 AND `patch`=0;
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1365 AND `patch`=0;

-- Magram Alliance
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1367 AND `patch`=0;

-- Gelkis Alliance 

-- Catch of the Day
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5386 AND `patch`=0;

-- Alliance Relations pt. 3 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=1433 AND `patch`=0;

-- Befouled by Satyr 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=1434 AND `patch`=0;

-- The Corrupter pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmoteDelay2`=1000, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1481 AND `patch`=0;

-- The Burning of Spirits
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1435 AND `patch`=0;

-- Centaur Bounty
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=66 WHERE `entry`=1366 AND `patch`=0;

-- The Corrupter pt. 3 
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1482 AND `patch`=0;

-- Source: https://github.com/TrinityCore/TrinityCore/issues/20643
UPDATE `quest_template` SET `CompleteScript`=1482 WHERE `entry`=1482 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=1482;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1482, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Remove questgiver flag'),
(1482, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2085, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Say text 1'),
(1482, 3, 15, 7960, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Cast spell "Scry on Azrethoc"'), -- does not work, maybe use another dummy effect spell
(1482, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2087, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Say text 2'),
(1482, 5, 10, 5773, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -1154, 1886, 88.88, 5.84, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Summon Jugkar Grim\'rod\'s Image'),
(1482, 6, 15, 26638, 0, 0, 0, 5773, 20, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Jugkar Grim\'rod\'s Image: Cast spell "Twin Teleport Visual"'),
(1482, 7, 0, 0, 0, 0, 0, 5773, 20, 8, 2, 2089, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Jugkar Grim\'rod\'s Image: Say text 1'),
(1482, 10, 10, 5772, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -1152, 1889, 88.87, 5.19, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Summon Lord Azrethoc\'s Image'),
(1482, 12, 0, 0, 0, 0, 0, 5772, 20, 8, 2, 2090, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Lord Azrethoc\'s Image: Say text 1'),
(1482, 15, 0, 0, 0, 0, 0, 5772, 20, 8, 2, 2091, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Lord Azrethoc\'s Image: Say text 2'),
(1482, 18, 0, 0, 0, 0, 0, 5772, 20, 8, 2, 2092, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Lord Azrethoc\'s Image: Say text 3'),
(1482, 20, 0, 0, 0, 0, 0, 5773, 20, 8, 2, 2093, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Jugkar Grim\'rod\'s Image: Say text 2'),
(1482, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2094, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Say text 3'),
(1482, 22, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Corrupter pt. 3 - Maurin Bonesplitter: Add questgiver flag');

-- Stealing Supplies
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1370 AND `patch`=0;

-- Hunting in Stranglethorn
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=5763 AND `patch`=0;

-- Hand of Iruxos
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=5381 AND `patch`=0;

-- Other Fish to Fry 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6143 AND `patch`=0;

-- Clam Bait
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6142 AND `patch`=0;

-- Delete Soft-shelled Clam Meat from regular loottables - Should now only be available from http://vanillawowdb.com/?item=15874
DELETE FROM `creature_loot_template` WHERE `item`=15924 AND `groupid`=0;

-- Fish in a Bucket
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=5421 AND `patch`=0;

-- Claim Rackmore's Treasure!

-- Sceptre of Light
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=5741 AND `patch`=0;

-- Book of the Ancients
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=5, `OfferRewardEmote2`=1 WHERE `entry`=6027 AND `patch`=0;

-- Bone Collector

-- The Corrupter pt. 4
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1484 AND `patch`=0;

-- Alliance Relations pt. 4
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1436 AND `patch`=0;

-- The Corrupter pt. 5 - abandoned
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1488 AND `patch`=0;

-- Shadowprey Guardian - remove gossip flag
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=12338 AND `patch`=0;

-- Portals of the Legion - abandoned   
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5581 AND `patch`=0;

-- Ongeku - never seen completed, likely no emote though

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
