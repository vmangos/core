SET NAMES utf8;
DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230104112356');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230104112356');
-- Add your query below.


UPDATE `gameobject_template` SET `script_name`='go_curing_shrine' WHERE  `entry` IN (181682, 181955);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
