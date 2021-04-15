DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210415162937');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210415162937');
-- Add your query below.

-- Shadowforge Commander shouldn't drop Blue Pearls
DELETE FROM `creature_loot_template` WHERE `item` = 4611 AND `entry` = 2744;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
