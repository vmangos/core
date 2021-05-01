DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210501140709');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210501140709');
-- Add your query below.


-- Fix Mage's Wand quest chain.
UPDATE `quest_template` SET `NextQuestId`=1949 where `entry`=1947;
UPDATE `quest_template` SET `NextQuestId`=1948 where `entry`=1951;
UPDATE `quest_template` SET `PrevQuestId`=1951 where `entry`=1948;
UPDATE `quest_template` SET `PrevQuestId`=1948 where `entry`=1952;
UPDATE `quest_template` SET `ExclusiveGroup`=0 where `entry`=1948;
UPDATE `quest_template` SET `ExclusiveGroup`=0 where `entry`=1951;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
