DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200721045420');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200721045420');
-- Add your query below.


-- Remove wrongly assigned patch to Basic Campfire.
UPDATE `gameobject_template` SET `patch`=0 WHERE `entry`=29784;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
