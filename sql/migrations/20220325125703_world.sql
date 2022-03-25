DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220325125703');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220325125703');
-- Add your query below.


-- Add breadcrumb support for quests.
ALTER TABLE `quest_template` ADD COLUMN `BreadcrumbForQuestId` MEDIUMINT(9) UNSIGNED DEFAULT 0 NOT NULL AFTER `ExclusiveGroup`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
