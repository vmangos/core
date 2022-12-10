DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221204184605');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221204184605');
-- Add your query below.

-- Remove alliance only condition from Captain Sander's Treasure Map
UPDATE `creature_loot_template` SET `condition_id`=0 WHERE `item`=1357;

-- Change GO Schematic: Field Repair Bot 74A to patch 1.3
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179552;

-- crimson courier was missing her mount
UPDATE `creature_addon` SET `mount_display_id`='2410' WHERE  `guid`=92287 AND `patch`=0;
-- Change Crimson Courier weapon
UPDATE `creature_equip_template` SET `equipentry1`='1903' WHERE  `entry`=429 AND `patch`=0;

-- Replace equipment for crimson bodyguards according to sniffs
UPDATE `creature_equip_template` SET `equipentry1`=3361, `equipentry2`=12932, `equipentry3`=0 WHERE `entry`=2058 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
