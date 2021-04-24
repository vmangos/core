DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200425150422');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200425150422');
-- Add your query below.


-- update The Hunter's Path (6073) to Einris Brightspear (5515)
UPDATE `creature_questrelation` SET `id` = 5515 WHERE `quest` = 6073;

-- update The Hunter's Path (6722) to Grif Wildheart (1231)
UPDATE `creature_questrelation` SET `id` = 1231 WHERE `quest` = 6722;

-- add completion text for The Hunter's Path (6072)
UPDATE `quest_template` SET `OfferRewardText` = "Yes, I believe that it is time..." WHERE `entry` = 6072;

-- add completion text for The Hunter's Path (6722)
UPDATE `quest_template` SET `OfferRewardText` = "Yes, it is time to train you..." WHERE `entry` = 6722;

-- update The Hunter's Path (6074) to Olmin Burningbeard (5116)
UPDATE `creature_questrelation` SET `id` = 5116 WHERE `quest` = 6074;

-- update The Hunter's Path (6075) to Tristane Shadowstone (11807)
UPDATE `creature_questrelation` SET `id` = 11807 WHERE `quest` = 6075;

-- remove Kary Thunderhorn (3038) and Xor'juul (3406) from The Hunter's Charm (8151)
DELETE FROM `creature_questrelation` WHERE id IN (3038, 3406);

-- add The Hunter's Charm (8151) to Holt Thunderhorn (3039)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(3039, 8151, 5, 10);

-- add The Hunter's Path (6065) to Kary Thunderhorn (3038)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(3038, 6065, 0, 10);

-- update The Hunter's Path (6068) to Sian'dur (3407)
UPDATE `creature_questrelation` SET `id` = 3407 WHERE `quest` = 6068;

-- update The Hunter's Path (6069) to Kali Remik (11814)
UPDATE `creature_questrelation` SET `id` = 11814 WHERE `quest` = 6069;

-- add The Hunter's Path (6070) to Kary Thunderhorn (3038)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(3038, 6070, 0, 10);

-- add invlolvedrelation to Thotar (3171) for The Hunter's Path (6070) 
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(3171, 6070, 0, 10);

-- add completion text for Training the Beast (6089)
UPDATE `quest_template` SET `OfferRewardText` = "A young $c, I see. Yes, I can bestow you with the skills you need to train and guide your pet. Not only will you be able to teach your pet new abilities, you will now be able to feed your pet, as well as revive it, should it fall in battle.$b$bNow, go forth. May the Earthmother guide you on your path. We shall speak again, at a later date." WHERE `entry` = 6089;

-- add completion text for Striker's Leggings (8658)
UPDATE `quest_template` SET `OfferRewardText` = "Yes... the worm's skin will make for an excellent protective layer.  Combined with the strongest parts from the Qiraji we've destroyed on our way here, this should make for a formidable piece of armor.  May it aid you in facing the unspeakable horrors that await inside!" WHERE `entry` = 8658;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
