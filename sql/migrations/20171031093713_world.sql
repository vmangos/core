DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171031093713');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171031093713');
-- Add your query below.

-- Water Barrels should only contain Refreshing Spring Water
DELETE FROM `gameobject_loot_template` WHERE `entry` = '2502' AND `item` != '159';

-- Dirt-stained Map container should only contain Dirt-stained Map item
DELETE FROM `gameobject_loot_template` WHERE `entry` = '2420' AND `item` != '4851';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
