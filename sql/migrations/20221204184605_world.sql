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

-- Remove creature addon from crimson courier and her bodyguards
-- Not needed and referenced wrong equipment ids
DELETE FROM `creature_addon` WHERE `guid`=92287 AND `patch`=0;
DELETE FROM `creature_addon` WHERE `patch`=0 AND `guid` IN (92288,92289,92290,92291);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
