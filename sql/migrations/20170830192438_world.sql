DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170830192438');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170830192438');
-- Add your query below.


INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES (1030, "Active object: %d. Visibility Modifier: %0.2f");

ALTER TABLE `creature` ADD COLUMN `visibilitymod` float DEFAULT 0 AFTER spawnFlags;
ALTER TABLE `gameobject` ADD COLUMN `visibilitymod` float DEFAULT 0 AFTER spawnFlags;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
