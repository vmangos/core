DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201116032608');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201116032608');
-- Add your query below.


-- Gilthares Firebough is immune to both players and npcs by default.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=3465;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
