DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191102202402');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191102202402');
-- Add your query below.


-- Fix faction for Rune of Mazthoril.
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry` IN (176164, 176165);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
