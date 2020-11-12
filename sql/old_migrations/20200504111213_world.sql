DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200504111213');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200504111213');
-- Add your query below.


-- fix tome of divinity (2998)
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 1641 WHERE `entry` = 2998;

-- fix tome of divinity (2997)
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 1645 WHERE `entry` = 2997;

-- fix tome of divinity (3000)
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 1645 WHERE `entry` = 3000;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
