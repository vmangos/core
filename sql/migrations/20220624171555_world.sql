DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220624171555');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220624171555');
-- Add your query below.

UPDATE `quest_template` SET `OfferRewardText` = 'Your tenacity and courage are astounding, $G priest:priestess;. You have earned the right to hold the Splinter of Nordrassil. Only one task remains: The Eye of Shadow must be recovered. Scour the world.' WHERE `entry` = 7622;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
