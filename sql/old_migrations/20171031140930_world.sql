DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171031140930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171031140930');
-- Add your query below.

DELETE FROM `gameobject_loot_template` WHERE `item` IN (3597,3598,203,202,201,200);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
