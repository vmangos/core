DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210511214730');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210511214730');
-- Add your query below.

-- Trap for Campfire with GUID 50026 in Feathermoon Hold.
UPDATE `gameobject` SET `patch_min` = 1 WHERE `guid` = 49853;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
