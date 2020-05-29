DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200517212603');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200517212603');
-- Add your query below.


-- Fix completion text for quest 4297 (Food for Baby) in Hinterlands: add gender check for father/mother
UPDATE `quest_template` SET `OfferRewardText`="These'll do nicely, and if I'm not mistaken, your little egg's just about ready to hatch. How does it feel? You know, you about to be a $gfather:mother;? Haha, didn't think ya'd have to deal with such responsibility, now did ya?" WHERE `entry`=4297;
-- Fix completion text for quest 4298 (Becoming a Parent) in Hinterlands: add gender check for dadda/momma
UPDATE `quest_template` SET `OfferRewardText`="Here, take the egg... better you have it so it bonds to you and looks to you to be its $gdadda:momma;.$B$BCongrats, $N. You're a parent... kinda." WHERE `entry`=4298;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
