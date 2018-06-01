DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180529160740');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180529160740');
-- Add your query below.

-- Burning Steppes
-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2 

-- Vivian Lagrave

-- Start of vid 45: https://www.youtube.com/watch?v=EZYdJuVzwhQ&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Dreadmaul Rock
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=1 WHERE `entry`=3821 AND `patch`=0;

-- Disharmony of Flame
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3906 AND `patch`=0;

-- The Rise of the Machines pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=5, `OfferRewardEmote1`=1 WHERE `entry`=4061 AND `patch`=0;

-- The Last Element - should not be available right away should require Disharmony of Flame (3906)
-- Source1: master quide:
-- Source2: http://web.archive.org/web/20071018032812/http://thottbot.com:80/q7201
UPDATE `quest_template` SET `PrevQuestId`=3906 WHERE `entry`=7201 AND `patch`=0;

-- Lost Thunderbrew Recipe - accept ok

-- Broodling Essence
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=4 WHERE `entry`=4726 AND `patch`=0;

-- Tablet of the Seven
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=4296 AND `patch`=0;

-- Ribbly Screwspigot

-- Krom'Grul
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1, `OfferRewardEmote2`=18 WHERE `entry`=3822 AND `patch`=0;

-- Felnok Steelspring
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=4808 AND `patch`=0;

-- The Rise of the Machines pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=6 WHERE `entry`=4062 AND `patch`=0;

-- The Rise of the Machines pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1 WHERE `entry`=4063 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
