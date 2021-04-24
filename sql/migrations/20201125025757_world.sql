DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125025757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125025757');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1570.34, `position_y`=-1310.87, `position_z`=63.0546, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=16002;
UPDATE `gameobject` SET `position_x`=1748.99, `position_y`=-909.477, `position_z`=66.7775, `orientation`=3.85718, `rotation0`=0, `rotation1`=0, `rotation2`=-0.936671, `rotation3`=0.35021 WHERE `guid`=15980;
UPDATE `gameobject` SET `position_x`=1270.88, `position_y`=-1507.6, `position_z`=58.8005, `orientation`=2.1293, `rotation0`=0, `rotation1`=0, `rotation2`=0.874619, `rotation3`=0.48481 WHERE `guid`=15968;


-- Missing spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15892, 142141, 0, 1543.4, -1647.88, 69.2486, 5.0091, 0, 0, -0.594823, 0.803857, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15892, 1259, "Arthas' Tears");
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15948, 142141, 0, 1455.01, -1599.38, 67.2372, 3.927, 0, 0, -0.923879, 0.382686, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15948, 1259, "Arthas' Tears");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
