DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240123070456');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240123070456');
-- Add your query below.


-- Reduce respawn time of Tablet of Will.
UPDATE `gameobject` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE `id`=142088;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
