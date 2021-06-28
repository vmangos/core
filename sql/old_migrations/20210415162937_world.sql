DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210415162937');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210415162937');
-- Add your query below.

-- Shadowforge Commander shouldn't drop Blue Pearls (it was obviously an error since the Giant Clam gameobject has the
-- same entry as this NPC).
DELETE FROM `creature_loot_template` WHERE `item` = 4611 AND `entry` = 2744;

-- Fix loot template of Giant Clam gameobject
-- https://www.youtube.com/watch?v=iujWLpMG2s4
-- https://classic.wowhead.com/object=2744/giant-clam#contains
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 100, `groupid` = 1 WHERE `entry` = 2264 AND `item` = 4611;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 35 WHERE `entry` = 2264 AND `item` = 4655;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
