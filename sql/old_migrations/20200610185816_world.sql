DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200610185816');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200610185816');
-- Add your query below.

-- remove incorrect gameobjects
DELETE FROM `gameobject` WHERE `guid` IN (17426, 17761);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
