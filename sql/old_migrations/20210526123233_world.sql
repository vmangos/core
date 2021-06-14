DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210526123233');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210526123233');
-- Add your query below.


-- Add missing Copper Vein (Entry: 2055) spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (5508, 2055, 0, -8891.01, -1986.15, 136.204, 0.401425, 0, 0, 0.199367, 0.979925, 900, 900, 1, 100);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (5512, 2055, 0, -8776.79, -2043.35, 128.049, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(5508, 1128, 0, 'Copper Vein'),
(5512, 1128, 0, 'Copper Vein');

--  Copper Vein (Entry: 2055) should contain Rethban Ore, not Blood Shard.
DELETE FROM `gameobject_loot_template` WHERE `item`=5075 && `entry`=1735;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1735, 2798, 40, 0, 1, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
