DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200505091508');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200505091508');
-- Add your query below.


-- update completion text for Deathdealer's Leggings (8640)
UPDATE `quest_template` SET `OfferRewardText` = "Yes... the worm's skin will make for an excellent protective layer.  Combined with the strongest parts from the Qiraji we've destroyed on our way here, this should make for a formidable piece of armor.  May it aid you in facing the unspeakable horrors that await inside!" WHERE `entry` = 8640;

-- update completion text for Therzok (1859)
UPDATE `quest_template` SET `OfferRewardText` = "Very good, I'm glad Kaplak was able to get a hold of you.$b$bWe have some things to speak of, not the least of which is your future with the Hand." WHERE `entry` = 1859;

-- update completion text for The Shattered Salute (2460)
UPDATE `quest_template` SET `RequestItemsText` = "Practice!" WHERE `entry` = 2460;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
