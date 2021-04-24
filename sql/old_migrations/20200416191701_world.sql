DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200416191701');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200416191701');
-- Add your query below.


-- Data from trinity.
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`) VALUES (20668, 14, 467, 'TEST House', 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
