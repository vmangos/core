DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180511092649');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180511092649');
-- Add your query below.

-- Stranglethorn Vale
-- Start of vid 18: https://www.youtube.com/watch?v=7usYjTsUVIA&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- Welcome to the Jungle
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=583 AND `patch`=0;

-- Raptor Mastery pt. 1 - already ok

-- Panther Mastery pt. 1 - already ok

-- Tiger Mastery pt. 1 - already ok

-- Tiger Mastery pt. 2 - already ok

-- Panther Mastery pt. 2 - already ok

-- Panther Mastery pt. 3 - accept ok

-- Tiger Mastery pt. 3 - already ok

-- Raptor Mastery pt. 2 - already ok

-- Start of vid 21: https://www.youtube.com/watch?v=t9-p76s-G5k&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Singing Blue Shards - accept ok

-- Investigate the Camp - accept ok

-- Bloodscalp Ears - accept ok

-- Mok'thardin's Enchantment pt. 1 - Turnin not shown
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=570 AND `patch`=0;

-- The Defense of Grom'gol pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=66, `OfferRewardEmote1`=66 WHERE `entry`=568 AND `patch`=0;

-- Hunt for Yenniku
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=581 AND `patch`=0;

-- Add missing quest greeting for Nimboya
DELETE FROM `quest_greeting` WHERE `entry`=2497 AND `type`=0;
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(2497, 'Eh?  You have business with Nimboya?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Trollbane - no emotes

-- Bloody Bone Necklaces
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=596 AND `patch`=0;

-- Split Bone Necklace - should require The Vile Reef 629 also
-- Source: http://web.archive.org/web/20070407000254/http://www.thottbot.com:80/q598
-- Source: https://web.archive.org/web/20071028085951/http://wow.allakhazam.com:80/db/quest.html?wquest=598
UPDATE `quest_template` SET `ExclusiveGroup`=-596 WHERE `entry`=596 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-596 WHERE `entry`=629 AND `patch`=0;

-- The Vile Reef

-- Headhunting

-- The Defense of Grom'gol pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=569 AND `patch`=0;

-- Tiger Mastery pt. 4 - already ok

-- Raptor Mastery pt. 3 - already ok

-- Add missing quest greeting for Hemet Nesingwary
DELETE FROM `quest_greeting` WHERE `entry`=715 AND `type`=0;
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(715, 'Another fine day in the jungle!  It\'s going to be quite a hunt,  I can feel it.  Once Barnil is done cleaning the guns, I\'m taking the hunting party deep into the twisting vines.  Not such a bad way for an old war vet to spend his retirement, eh?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Panther Mastery pt. 4 - already ok

-- Goblin Sponsorship pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1181 AND `patch`=0;

-- Goblin Sponsorship pt. 4
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1182 AND `patch`=0;

-- Start of vid 26: https://www.youtube.com/watch?v=6DTmw7FvKCk&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Bloodsail Buccaneer pt. 1

-- Scaring Shaky - already ok

-- Akiris by the Bundle
UPDATE `quest_template` SET `DetailsEmote1`=6, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=617 AND `patch`=0;

-- Venture Company Mining

-- Zanzil's Secret - already ok

-- Mok'thardin's Enchantment pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=572 AND `patch`=0;

-- Split Bone Necklace - accept ok
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=598 AND `patch`=0;

-- Raptor Mastery pt. 4

-- Mok'thardin's Enchantment pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=571 AND `patch`=0;

-- Goblin Sponsorship pt. 5 - abandoned

-- The Bloodsail Buccaneer pt. 2

-- Return to MacKinley
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=607 AND `patch`=0;

-- The Bloodsail Buccaneers pt. 3

-- Voodoo Dues - details ok
UPDATE `quest_template` SET `CompleteEmote`=0, `CompleteScript`=609 WHERE `entry`=609 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=609;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(609, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 744, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Dues - "Sea Wolf" MacKinley: Emote text 1');

-- Up to Snuff
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=587 AND `patch`=0;

-- The Bloodsail Buccaneers pt. 4 - accept ok

-- Mok'thardin's Enchantment pt. 4
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1, `OfferRewardEmote2`=66 WHERE `entry`=573 AND `patch`=0;

-- Start of vid 28: https://www.youtube.com/watch?v=s14G2JdLh6Y&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Grim Message
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=2932 AND `patch`=0;

-- Start of vid 29: https://www.youtube.com/watch?v=NmuWN_3Qkec&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=3

-- Tran'rek - accept ok

-- Whiskey Slim's Lost Grog 
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=580 AND `patch`=0;

-- Add missing quest greeting for "Sea Wolf" MacKinley
DELETE FROM `quest_greeting` WHERE `entry`=2501 AND `type`=0;
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(2501, 'Oy!  You here for a game of knuckles?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Stoley's Debt - already ok

-- Keep An Eye Out - already ok

-- The Bloodsail Buccaneers pt. 5 - complete ok
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=608 AND `patch`=0;

-- Start of vid 36: https://www.youtube.com/watch?v=zssuKMWa-vg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Big Game Hunter
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=208 AND `patch`=0;

-- Bloodscalp Clan Heads

-- Message in a Bottle pt. 1 - no emotes

-- Message in a Bottle pt. 2 - accept ok

-- Cortello's Riddle pt. 1

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
