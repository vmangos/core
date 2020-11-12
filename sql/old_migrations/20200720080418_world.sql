DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720080418');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720080418');
-- Add your query below.


-- fix dwarf tome of divinity quests
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 0 WHERE `entry` IN (2997, 2999, 3000);

-- fix human tome of divinity quests
UPDATE `quest_template` SET `NextQuestInChain` = 0, `NextQuestId` = 0 WHERE `entry` IN (2998, 3681);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
