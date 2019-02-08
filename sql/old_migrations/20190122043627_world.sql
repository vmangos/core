DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190122043627');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190122043627');
-- Add your query below.


-- Fix provided item for mage dungeons set 2 quest.
UPDATE `quest_template` SET `SrcItemId` = 22047 WHERE `entry` = 9018;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
