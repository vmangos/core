DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200925112120');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200925112120');
-- Add your query below.


-- Jazzrik has a variable respawn timer of 5:30 to 8:30 minutes.
UPDATE `creature` SET `spawntimesecsmin`=330, `spawntimesecsmax`=510 WHERE `id`=9179;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
