DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180201055226');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180201055226');
-- Add your query below.

UPDATE `creature_involvedrelation` SET `patch` = 8 WHERE `quest` = 9053;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
