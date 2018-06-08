DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180325153041');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180325153041');
-- Add your query below.

-- Ashenvale quality fix
-- Start of vid 8: https://www.youtube.com/watch?v=cboL6vEDetw&index=8&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n

-- The Warsong Reports
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6543 AND `patch`=0;

-- The Ashenvale Hunt
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6383 AND `patch`=0;

-- Set correct prequests
UPDATE `quest_template` SET `NextQuestId`=6383, `NextQuestInChain`=0 WHERE `entry`=235 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestId`=6383, `NextQuestInChain`=0 WHERE `entry`=742 AND `patch`=0;
UPDATE `quest_template` SET `NextQuestId`=6383, `NextQuestInChain`=0 WHERE `entry`=6382 AND `patch`=0;

-- Naga at the Zoram Strand
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6442 AND `patch`=0;

-- Vorsha the Lasher
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6641 AND `patch`=0;

-- Start of vid 13: https://www.youtube.com/watch?v=rFcE2P8E44c&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- Satyr Horns

-- Stonetalon Standstill
UPDATE `quest_template` SET `DetailsEmote1`=6, `OfferRewardEmote1`=1 WHERE `entry`=25 AND `patch`=0;

-- Warsong Supplies - never completed
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6571 AND `patch`=0;

-- Ashenvale Outrunners
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6503 AND `patch`=0;

-- The Befouled Element
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=6 WHERE `entry`=1918 AND `patch`=0;

-- Je'neu of the Earthen Ring
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=11, `OfferRewardEmote1`=1 WHERE `entry`=824 AND `patch`=0;

-- Senani Thunderheart should have gossip after q. 6383
UPDATE `creature_template` SET `gossip_menu_id`=1000 WHERE `entry`=12696 AND `patch`=0;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1000; 
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES 
(1000, 0, 'What can you tell me about the bear - Ursangous?', 8229, 1, 3, 1001, 23),
(1000, 1, 'What can you tell me about the nightsaber cat - Shadumbra?', 8230, 1, 3, 1002, 23),
(1000, 2, 'What can you tell me about the hippogryph - Sharptalon?', 8231, 1, 3, 1003, 23);

DELETE FROM `gossip_menu` WHERE `entry` IN (1000, 1001, 1002, 1003); 
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(1000, 5529),
(1001, 5593),
(1002, 5595),
(1003, 5594);

-- Ursangous's Paw
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=23 AND `patch`=0;

-- Shadumbra's Head 
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=24 AND `patch`=0;

-- Shadumbra's Head 
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=2 AND `patch`=0;

-- Between a Rock and a Thistlefur
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=4 WHERE `entry`=216 AND `patch`=0;

-- Troll Charm, `CompleteEmote`=14 is already ok
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6462 AND `patch`=0;

-- Amongst the Ruins
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=6921 AND `patch`=0;

-- The Essence of Aku'Mai
UPDATE `quest_template` SET `DetailsEmote1`=0, `IncompleteEmote`=1  WHERE `entry`=6563 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
