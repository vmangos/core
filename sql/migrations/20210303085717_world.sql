DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210303085717');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210303085717');
-- Add your query below.


-- allow serpentbloom gameobject to be interacted with
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 13891;

-- dropchance should be 100%
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= -100 WHERE `entry` = 2772 AND `item` = 5339;

-- The Scarlet Key should not drop from mobs
DELETE FROM `creature_loot_template` WHERE `item` = 7146;

-- add Baron Longshore spawns
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(563, 3467, 1, -1748.23, -3722.06, 14.1211, 4.65315, 413, 413, 100, 1, 3, 10),
(564, 3467, 1, -1707.46, -3817.54, 13.3079, 5.51516, 413, 413, 100, 1, 3, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(110, 1, 'Baron Longshore (3467)', 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(15066, 110, 'Baron Longshore #1'),
(563, 110, 'Baron Longshore #2'),
(564, 110, 'Baron Longshore #3');

-- correct quest chain for Mage's Wand (1952)
UPDATE `quest_template` SET `PrevQuestId` = 1947, `NextQuestId` = 1952, `ExclusiveGroup` = -1948 WHERE `entry` = 1948;
UPDATE `quest_template` SET `NextQuestId` = 1952, `ExclusiveGroup` = -1948 WHERE `entry` = 1951;

-- Witherbark Bloodling, Serpentbloom Snake and Hazzali Parasite should not drop loot
DELETE FROM `creature_loot_template` WHERE `entry` IN (7768, 3680
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry`= 7769;

                                                       
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
