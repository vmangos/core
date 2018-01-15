DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180107160104');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180107160104');
-- Add your query below.

UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry` IN (14423,14439);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
