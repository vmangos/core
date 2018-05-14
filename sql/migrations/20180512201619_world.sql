DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180512201619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180512201619');
-- Add your query below.

-- Swamp of Sorrows
-- Start of vid 28: https://www.youtube.com/watch?v=s14G2JdLh6Y&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Nothing But The Truth pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1372 AND `patch`=0;

-- Nothing But The Truth pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1383 AND `patch`=0;

-- Noboru the Cudgel
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1392 AND `patch`=0;

-- Draenethyst Crystals
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1389 AND `patch`=0;

-- Lack of Surplus pt. 1 - details seems wrong was 2-1-1-1 
UPDATE `quest_template` SET `DetailsEmote1`=0, `DetailsEmote2`=0, `DetailsEmote3`=0, `DetailsEmote4`=0, `CompleteEmote`=0, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=698 AND `patch`=0;

-- Fresh Meat - accept ok
UPDATE `quest_template` SET `CompleteEmote`=1, `OfferRewardEmote1`=4 WHERE `entry`=1430 AND `patch`=0;

-- Pool of Tears
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1424 AND `patch`=0;

-- Lack of Surplus pt. 2 - accept ok
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=699 AND `patch`=0;

-- Threat From the Sea pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1422 AND `patch`=0;

-- Threat From the Sea pt. 2
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=1426 AND `patch`=0;

-- Threat From the Sea pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=1427 AND `patch`=0;

-- Continued Threat
UPDATE `quest_template` SET `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=1428 AND `patch`=0;

-- The Atal'ai Exile
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=11 WHERE `entry`=1429 AND `patch`=0;

-- Start of vid 35: https://www.youtube.com/watch?v=wAFdoIStMZI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Return to Fel'Zerul
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1444 AND `patch`=0;

-- Start of vid 38: https://www.youtube.com/watch?v=nTOL6lzTLMs&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Fall From Grace

-- The Disgraced One
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=2621 AND `patch`=0;

-- Cortello's Riddle pt. 2

-- The Missing Orders
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2622 AND `patch`=0;

-- The Temple of Atal'Hakkar
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1445 AND `patch`=0;

-- The Swamp Talker
UPDATE `quest_template` SET `OfferRewardEmote1`=18 WHERE `entry`=2623 AND `patch`=0;

-- A Tale of Sorrow
UPDATE `quest_template` SET `DetailsEmote1`=15, `DetailsEmote2`=1, `DetailsEmoteDelay2`=1000 WHERE `entry`=2801 AND `patch`=0;

-- The Stones That Bind Us

-- Cortello's Riddle pt. 3

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
