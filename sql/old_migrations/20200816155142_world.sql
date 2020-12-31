DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200816155142');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200816155142');
-- Add your query below.

UPDATE `quest_template` SET `OfferRewardText` = "Greetings young $C, I'm glad to see you ready and eager to learn about the curing of poisons.$B$BWhile most druids in the past were put through pre-planned trials, your work will involve no such thing. There has been a rash of animal poisonings in Auberdine, and the village there has been unable to cure it. To that end, a representative there has asked Moonglade for aid and we are sending you there to aid them.  This is no exercise - the work you'll do is quite real.  Bear this in mind." WHERE `entry` = 6121;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
