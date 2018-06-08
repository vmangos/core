DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180414155832');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180414155832');
-- Add your query below.

-- Hillsbrad Foothills and Alterac mts.
-- Start of vid 16: https://www.youtube.com/watch?v=D9O903Wnmb4&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- Time To Strike
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=494 AND `patch`=0;

-- Battle of Hillsbrad - no detail emote

-- Helcular's Revenge pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=552 AND `patch`=0;

-- Elixir of Pain pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=1, `OfferRewardEmote1`=21 WHERE `entry`=501 AND `patch`=0;

-- Helcular's Revenge pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=553 AND `patch`=0;

-- Elixir of Pain pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=502 AND `patch`=0;

-- The Hammer May Fall
UPDATE `quest_template` SET `DetailsEmote1`=15, `DetailsEmote2`=1, `OfferRewardEmote1`=6 WHERE `entry`=676 AND `patch`=0;

-- Alterac mts.
-- Start of vid 23: https://www.youtube.com/watch?v=8glOVdqo3hI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Prison Break In - already ok

-- Stone Tokens - already ok

-- Dalaran Patrols - already ok

-- Bracers of Binding
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=557 AND `patch`=0;

-- Tarren Mill Deathguard remove gossip flag
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=2405 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
