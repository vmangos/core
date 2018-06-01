DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180523201042');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180523201042');
-- Add your query below.

-- Tanaris
-- Start of vid 31: https://www.youtube.com/watch?v=x9M61jaHFVM&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- WANTED: Caliph Scorpidsting
UPDATE `quest_template` SET `IncompleteEmote`=6 WHERE `entry`=2781 AND `patch`=0;

-- WANTED: Andre Firebeard

-- Scarab Shells - details ok

-- Gadgetzan Water Survey - already ok

-- Wastewander Justice - accept ok

-- Water Pouch Bounty - already ok

-- Pirate Hats Ahoy!
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=5, `OfferRewardEmote2`=6 WHERE `entry`=8365 AND `patch`=6;

-- Screecher Spirits - already ok

-- Stoley's Shipment - already ok

-- Southsea Shakedown
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=8366 AND `patch`=6;

-- Ship Schedules - already ok

-- More Wastewander Justice - already ok

-- Noxious Lair Investigation - already ok

-- Deliver to MacKinley - accept ok

-- Divino-matic Rod - details ok

-- Water Pouch Bounty - complete ok

-- Start of vid 34: https://www.youtube.com/watch?v=gN3Z2vVNQAE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Errand for Apothecary Zinge pt. 1 - already ok

-- Errand for Apothecary Zinge pt. 2 - already ok

-- Into the Field 
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=243 AND `patch`=0;

-- Slake That Thirst
UPDATE `quest_template` SET `DetailsEmote1`=25, `CompleteEmote`=6, `OfferRewardEmote1`=5 WHERE `entry`=379 AND `patch`=0;

-- Start of vid 40: https://www.youtube.com/watch?v=KO1iKRoKDyI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Thirsty Goblin - accept ok

-- Super Sticky - already ok

-- Thistleshrub Valley - already ok

-- The Dunemaul Compound - no change

-- The Stone Circle
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=3444 AND `patch`=0;

-- Gahz'ridian

-- Tooga's Quest

-- Yuka Screwspigot

-- The Prophecy of Mosh'aru - details ok

-- In Good Taste
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0 WHERE `entry`=2606 AND `patch`=0;

-- Sprinkle's Secret Ingredient - already ok - Goblin don't have this use emote :(
UPDATE `quest_template` SET `DetailsEmote2`=1, `CompleteScript`=2641 WHERE `entry`=2641 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=2641;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2641, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sprinkle\'s Secret Ingredient - Sprinkle: npc\_flag questgiver removed'),
(2641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3661, 0, 0, 0, 0, 0, 0, 0, 0, 'Sprinkle\'s Secret Ingredient - Sprinkle: Say text 1'),
(2641, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sprinkle\'s Secret Ingredient - Sprinkle: State use'),
(2641, 4, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sprinkle\'s Secret Ingredient - Sprinkle: State stand'),
(2641, 5, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sprinkle\'s Secret Ingredient - Sprinkle: npc\_flag questgiver added');

-- The Scrimshank Redemption - already ok

-- Tanaris Field Sampling
UPDATE `quest_template` SET `CompleteEmote`=5 WHERE `entry`=654 AND `patch`=0;

-- Return to Apothecary Zinge
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=864 AND `patch`=0;

-- Insect Part Analysis pt. 1 - accept ok

-- Insect Part Analysis pt. 2 - already ok

-- Rise of the Silithid 
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=32 AND `patch`=0;

-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- March of the Silithid
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=4494 AND `patch`=0;

-- Start of vid 44: https://www.youtube.com/watch?v=1T7DXg88SgQ&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Delivery for Marin

-- Noggenfogger Elixir
UPDATE `quest_template` SET `StartScript`=2662 WHERE `entry`=2662 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id`=2662;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2662, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggenfogger Elixir - Marin Noggenfogger: npc\_flag questgiver removed'),
(2662, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4548, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggenfogger Elixir - Marin Noggenfogger: Say text 1'),
(2662, 5, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggenfogger Elixir - Marin Noggenfogger: npc\_flag questgiver added');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
