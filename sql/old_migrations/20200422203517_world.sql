DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200422203517');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200422203517');
-- Add your query below.

-- Required quest for 3981 must be 3906, not 3907. https://classic.wowhead.com/quest=3981/
UPDATE `quest_template` SET `PrevQuestId` = 3906 WHERE `entry` = 3981;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
