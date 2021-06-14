DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210325011613');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210325011613');
-- Add your query below.

-- [Silver Piffeny Band] shouldn't appear in chests.
DELETE FROM `gameobject_loot_template` WHERE `item` = 7342;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
