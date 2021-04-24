DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191111174008');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191111174008');
-- Add your query below.


-- Add missing mail after completing quest Words of the High Chief.
UPDATE `quest_template` SET `RewMailTemplateId`=98 WHERE `entry`=5128;
INSERT INTO `mail_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES (98, 13158, 100, 0, 1, 1, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
