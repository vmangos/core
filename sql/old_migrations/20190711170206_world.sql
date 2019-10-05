DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190711170206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190711170206');
-- Add your query below.


-- Un'Goro Dirt Pile should contain 1 to 4 Un'Goro Soil.
UPDATE `gameobject_loot_template` SET `maxcount` = 4 WHERE `item` = 11018;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
