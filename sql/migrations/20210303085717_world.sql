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

-- serpentbloom dropchance should be 100%
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

-- Witherbark Bloodling, Serpentbloom Snake and Hazzali Parasite should not drop loot
DELETE FROM `creature_loot_template` WHERE `entry` IN (7768, 3680);
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` IN (3680, 7768);
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry`= 7769;

-- correct quest chain for Mage's Wand (1952)
UPDATE `quest_template` SET `PrevQuestId` = 1947, `NextQuestId` = 1952, `ExclusiveGroup` = -1948 WHERE `entry` = 1948;
UPDATE `quest_template` SET `NextQuestId` = 1952, `ExclusiveGroup` = -1948 WHERE `entry` = 1951;
                                                       
-- Peaceblooms should only drop in stacks of 3
UPDATE `gameobject_loot_template` SET `maxcount` = 3 WHERE `entry` = 1415 AND `item` = 2447;
     
-- Grim Reach should increase the range of Drain Soul (credit to jaywalker15262)
UPDATE `spell_affect` SET `SpellFamilyMask` = 6447547418 WHERE `entry` = 18218; 
UPDATE `spell_affect` SET `SpellFamilyMask` = 6447547418 WHERE `entry` = 18219;

-- Marsh Flesheater and Bloodscalp Berserker should not flee at low hp
DELETE FROM `creature_ai_scripts` WHERE `id` IN (59702, 75102);
DELETE FROM `creature_ai_events` WHERE `id` IN (59702, 75102);

-- fix waypoint order causing db error
DELETE FROM `creature_movement` WHERE `id` = 7656;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7656, 1, -600.043, -4342.45, 37.8159, 100, 0, 0, 0),
(7656, 2, -599.399, -4324.38, 37.5988, 100, 0, 0, 0),
(7656, 3, -599.657, -4312.29, 37.5986, 100, 0, 0, 0),
(7656, 4, -599.869, -4298.37, 37.811, 100, 0, 0, 0),
(7656, 5, -599.768, -4307.47, 37.5992, 100, 0, 0, 0),
(7656, 6, -599.445, -4319.6, 37.5986, 100, 0, 0, 0),
(7656, 7, -599.705, -4334.79, 37.5988, 100, 0, 0, 0),
(7656, 8, -600.446, -4349.94, 38.131, 100, 0, 0, 0),
(7656, 9, -600.588, -4362.75, 38.8676, 100, 0, 0, 0),
(7656, 10, -601.845, -4378.2, 39.9664, 100, 0, 0, 0),
(7656, 11, -601.612, -4395.27, 42.6652, 100, 0, 0, 0),
(7656, 12, -600.024, -4410.47, 43.5231, 100, 0, 0, 0),
(7656, 13, -594.057, -4427.35, 42.4307, 100, 0, 0, 0),
(7656, 14, -579.457, -4457.44, 41.9763, 100, 0, 0, 0),
(7656, 15, -573.993, -4468.27, 42.2239, 100, 0, 0, 0),
(7656, 16, -570.217, -4476.48, 42.5183, 100, 0, 0, 0),
(7656, 17, -569.013, -4485.33, 42.566, 100, 0, 0, 0),
(7656, 18, -570.17, -4497.38, 42.5664, 100, 0, 0, 0),
(7656, 19, -578.906, -4511.47, 42.5098, 100, 0, 0, 0),
(7656, 20, -581.195, -4514.85, 42.4688, 100, 0, 0, 0),
(7656, 21, -572.172, -4501.6, 42.5659, 100, 0, 0, 0),
(7656, 22, -569.257, -4490.21, 42.5659, 100, 0, 0, 0),
(7656, 23, -569.142, -4481.09, 42.566, 100, 0, 0, 0),
(7656, 24, -571.964, -4472.59, 42.4032, 100, 0, 0, 0),
(7656, 25, -578.171, -4460.08, 41.9867, 100, 0, 0, 0),
(7656, 26, -583.786, -4448.55, 41.618, 100, 0, 0, 0),
(7656, 27, -589.919, -4434.83, 42.0238, 100, 0, 0, 0),
(7656, 28, -597.115, -4418.48, 43.1092, 100, 0, 0, 0),
(7656, 29, -600.253, -4403.03, 43.6641, 100, 0, 0, 0),
(7656, 30, -601.071, -4387.19, 41.4481, 100, 0, 0, 0),
(7656, 31, -600.667, -4370, 39.3044, 100, 0, 0, 0),
(7656, 32, -600.132, -4356.39, 38.4777, 100, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
