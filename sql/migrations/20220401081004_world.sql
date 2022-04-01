DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220401081004');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220401081004');
-- Add your query below.
DELETE FROM `gameobject_template` WHERE `entry`= 12665;
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
