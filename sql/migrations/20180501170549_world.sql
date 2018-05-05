DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180501170549');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180501170549');
-- Add your query below.

-- Thousand Needles
-- Start of vid 12: https://www.youtube.com/watch?v=-VL55SdDw-A&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=12

-- Calling in the Reserves in Stonetalon Mts. Quality fix

-- Message to Freewind Post
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=4542 AND `patch`=0;

-- Pacify the Centaur
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0 WHERE `entry`=4841 AND `patch`=0;

-- Wanted - Arnak Grimtotem
UPDATE `quest_template` SET  `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=5147 AND `patch`=0;

-- Alien Egg
UPDATE `quest_template` SET `DetailsEmote1`=2, `OfferRewardEmote1`=1 WHERE `entry`=4821 AND `patch`=0;

-- Wind Rider
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmoteDelay1`=1000, `CompleteEmote`=6 WHERE `entry`=4767 AND `patch`=0;

-- Test of Faith
UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=1149 AND `patch`=0;

-- Test of Endurance

-- Grimtotem Spying
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5064 AND `patch`=0;

-- Serpent Wild
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=5 WHERE `entry`=4865 AND `patch`=0;

-- Steelsnap
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=2 WHERE `entry`=1131 AND `patch`=0;

-- Nara Wildmane
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1490 AND `patch`=0;

-- Leaders of the Fang
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=914 AND `patch`=0;

-- Start of vid 15: https://www.youtube.com/watch?v=BObxNsbRWsc&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- The Sacred Flame pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=1197 AND `patch`=0;

-- Hypercapacitor Gizmo

-- Sacred Fire
UPDATE `quest_template` SET `CompleteScript`=5062 WHERE `entry`=5062 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=5062;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(5062, 0, 15, 17117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fire - Magatha Grimtotem: Cast spell "Magatha Incendia Powder"');

-- incorrect text
-- Source: http://web.archive.org/web/20070408003634/http://www.thottbot.com:80/q5062
UPDATE `quest_template` SET `RequestItemsText`='So, Motega Firemain sends word of Arikara...well now that is grave news.$b$b<Magatha looks around.>$b$bArikara is a deadly creature born only to seek vengeance against those who have committed heinous acts.$b$b<Magatha smiles.>' WHERE `entry`=5062 AND `patch`=0;

-- Homeward Bound
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=4770 AND `patch`=0;

-- Arikara 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=2000 WHERE `entry`=5088 AND `patch`=0;

-- Free at Last - corrected orientation of NPC
UPDATE `quest_template` SET `DetailsEmote1`=18, `DetailsEmote2`=1 WHERE `entry`=4904 AND `patch`=0;
UPDATE `creature` SET `orientation`=2.55 WHERE `guid`=21594;

-- Assassination Plot - corrected position of NPC
UPDATE `quest_template` SET `OfferRewardEmote1`=11 WHERE `entry`=4881 AND `patch`=0;
UPDATE `creature` SET `position_x`=-4907.4, `position_y`=-1368.5, `position_z`=-52.62, `orientation`=5.4 WHERE `guid`=21584;

-- Protect Kanati Greycloud
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=4966 AND `patch`=0;

-- Start of vid 17: https://www.youtube.com/watch?v=XccyLbaij2c&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Swarm Grows pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=6 WHERE `entry`=1145 AND `patch`=0;

-- Start of vid 19: https://www.youtube.com/watch?v=VUZaeTLgbns&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Load Lightening - already ok

-- A Bump in the Road
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1175 AND `patch`=0;

-- Hardened Shells - accept ok
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=2  WHERE `entry`=1105 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-1104 WHERE `entry`=1105 AND `patch`=0;

-- Salt Flat Venom
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=6, `CompleteEmote`=6, `OfferRewardEmote1`=4, `OfferRewardEmote2`=11 WHERE `entry`=1104 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-1104 WHERE `entry`=1104 AND `patch`=0;

-- Wharfmaster Dizzywig

-- Rocket Car Parts
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1110 AND `patch`=0;

-- Hemet Nesingwary
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5762 AND `patch`=0;

-- Goblin Sponsorship pt. 1

-- Martek the Exiled
UPDATE `quest_template` SET `PrevQuestId`=1104 WHERE `entry`=1106 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=4, `DetailsEmote2`=1, `DetailsEmoteDelay2`=2000, `CompleteEmote`=35, `OfferRewardEmote1`=1 WHERE `entry`=1106 AND `patch`=0;
-- Source: https://web.archive.org/web/20060330023816/http://wow.allakhazam.com:80/db/quest.html?wquest=1106

-- Encrusted Tail Fins
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1107 AND `patch`=0;

-- Start of vid 20: https://www.youtube.com/watch?v=OlnnPZbg3T0&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Swarm Grows pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=1146 AND `patch`=0;

-- Parts for Kravel
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=4 WHERE `entry`=1112 AND `patch`=0;

-- Update timing
DELETE FROM `quest_end_scripts` WHERE `id`=1112;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1112, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: npc\_flag questgiver removed'),
(1112, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1479, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Emote text 1'),
(1112, 1, 9, 20837, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Respawn Parts Crate'),
(1112, 4, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Kneel start'),
(1112, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1477, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Emote text 2'),
(1112, 9, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Kneel end'),
(1112, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1478, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: Say text 1'),
(1112, 12, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Parts for Kravel - Kravel Koalbeard: npc\_flag questgiver added');

-- Goblin Sponsorship pt. 2

-- Start of vid 24: https://www.youtube.com/watch?v=VBlnzRNTatI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Family Tree
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=5361 AND `patch`=0;

-- The Swarm Grows pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=11, `OfferRewardEmote2`=1 WHERE `entry`=1147 AND `patch`=0;

-- Delivery to the Gnomes
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=4 WHERE `entry`=1114 AND `patch`=0;

-- Parts of the Swarm pt. 1
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1148 AND `patch`=0;

-- Parts of the Swarm pt. 2 - complete already ok
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1184 AND `patch`=0;

-- Start of vid 29: https://www.youtube.com/watch?v=NmuWN_3Qkec&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Frostmaw
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1136 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
