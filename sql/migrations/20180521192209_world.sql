DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180521192209');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180521192209');
-- Add your query below.

-- Hinterlands
-- Start of vid 34: https://www.youtube.com/watch?v=gN3Z2vVNQAE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Lines of Communication - accept ok
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2995 AND `patch`=0;

-- Start of vid 35: https://www.youtube.com/watch?v=wAFdoIStMZI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- A Sticky Situation
UPDATE `quest_template` SET `DetailsEmote1`=0, `OfferRewardEmote1`=21 WHERE `entry`=77 AND `patch`=0;

-- Find OOX-09/HL!

-- Vilebranch Hooligans
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=7839 AND `patch`=3;

-- Cannibalistic Cousins
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=7844 AND `patch`=3;

-- Message to the Wildhammer
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=7841 AND `patch`=3;

-- Stalking the Stalkers
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=66 WHERE `entry`=7828 AND `patch`=3;

-- Hunt the Savages
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=1 WHERE `entry`=7829 AND `patch`=3;

-- Avenging the Fallen
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `OfferRewardEmote1`=1 WHERE `entry`=7830 AND `patch`=3;

-- Separation Anxiety
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1 WHERE `entry`=7849 AND `patch`=3;

-- Rin'ji is Trapped!

-- Ripple Delivery pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=5 WHERE `entry`=81 AND `patch`=0;

-- Venom Bottles
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=2933 AND `patch`=0;

-- Rin'ji's Secret
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=2782 AND `patch`=0;

-- Another Message to the Wildhammer - accept ok

-- Undamaged Venom Sac - accept ok
UPDATE `quest_template` SET `OfferRewardEmote1`='4' WHERE  `entry`=2934 AND `patch`=0;

-- Atal'ai Exile missing quest greeting
DELETE FROM `quest_greeting` WHERE `entry`=5598 AND `type`=0;
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `emote`) VALUES 
(5598, 'What do you ask of me?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);

-- Consult Master Gadrin

-- Oran's Gratitude
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=8273 AND `patch`=6;

-- Start of vid 42: https://www.youtube.com/watch?v=8lKFNczM-wY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Snapjaws, Mon! 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=7815 AND `patch`=3;

-- Gammerita, Mon! - no prior quest requirement
-- Also confmirmed by masterquide 
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=5, `PrevQuestId`=0 WHERE `entry`=7816 AND `patch`=3;

-- Gossip menu for Katoom the Angler
-- Gossip id from TC but seems plausible
DELETE FROM `npc_gossip` WHERE `npc_guid`=1182601;
DELETE FROM `gossip_menu` WHERE `entry`=6087;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6087, 7241);
UPDATE `creature_template` SET `gossip_menu_id`=6087 WHERE `entry`=14740;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=6087;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(6087, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0),
(6087, 1, 3, 'What can you teach me?', 9980, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(6087, 2, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0);

-- Lard Lost His Lunch
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=7840 AND `patch`=3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
