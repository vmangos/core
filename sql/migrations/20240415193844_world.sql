DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240415193844');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240415193844');
-- Add your query below.


-- Fix BWL Razorgore eggs.
UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=177807;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
