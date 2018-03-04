DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180304114614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180304114614');
-- Add your query below.

-- Defias Enchanter is not an elite
UPDATE `creature_template` SET `rank`=0 WHERE `entry`=910;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
