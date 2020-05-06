DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200316182702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200316182702');
-- Add your query below.


-- Add missing completion text for Summon Felsteed quests.
UPDATE `quest_template` SET `OfferRewardText`='So, you\'ve decided to grace my presence again. How kind of you.$B$BMy acolytes wondered if you\'d ever show up. I told them there was no doubt. When power is concerned, you are drawn in like a moth to the flame.' WHERE `entry` IN (3631, 4487, 4488);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
