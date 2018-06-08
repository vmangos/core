DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180525190102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180525190102');
-- Add your query below.

-- Blasted Lands
-- Start of vid 43: https://www.youtube.com/watch?v=Up_ThglOopY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Basilisk's Bite
UPDATE `quest_template` SET `DetailsEmote1`=1,`DetailsEmote2`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=2601 AND `patch`=0;

-- Vulture's Vigor
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=2603 AND `patch`=0;

-- Snickerfang Jowls
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=2581 AND `patch`=0;

-- A Boar's Vitality
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=2583 AND `patch`=0;

-- The Decisive Striker
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=1 WHERE `entry`=2585 AND `patch`=0;

-- Everything Counts In Large Amounts

-- One Draenei's Junk...

-- To Serve Kum'Isha
-- Blasted Lands, quest "To Serve Kum'Isha" (2521), CompletionText cuts short at the end, as well as 'tau(ren)' is referenced instead of player race.
-- https://github.com/TrinityCore/TrinityCore/issues/20448
UPDATE `quest_template` SET `RequestItemsText`='I have dedicated my life to the search of flawless draenethyst spheres. A lifetime, $R!' WHERE `entry`=2521 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
