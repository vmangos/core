DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200526235421');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200526235421');
-- Add your query below.

UPDATE `quest_template` SET `ExclusiveGroup` = 0 WHERE `entry` = 1661;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
