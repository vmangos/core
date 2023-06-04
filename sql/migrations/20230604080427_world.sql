DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230604080427');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230604080427');
-- Add your query below.


-- Chest of Containment Coffers 105174
DELETE FROM `gameobject` WHERE `guid` IN (42914, 42897, 42918, 42916);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42914, 105174, 0, -8987.37, 862.753, 30.6276, 3.71755, 0, 0, -0.958819, 0.284016, 10, 10, 1, 100, 0, 10),
(42916, 105174, 0, -8987.15, 861.843, 30.6623, 5.18363, 0, 0, -0.522498, 0.85264, 10, 10, 1, 100, 0, 10),
(42918, 105174, 0, -8986.73, 862.93, 30.6484, 3.64774, 0, 0, -0.968147, 0.250381, 10, 10, 1, 100, 0, 10),
(42897, 105174, 0, -8986.23, 863.658, 30.6345, 0.331611, 0, 0, 0.165047, 0.986286, 10, 10, 1, 100, 0, 10);

-- Cantation of Manifestation 105175
DELETE FROM `gameobject` WHERE `guid` IN (42898, 42917, 42915, 42919);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42915, 105175, 0, -8985.57, 860.344, 30.7109, 3.08918, 0, 0, 0.999657, 0.0262016, 10, 10, 1, 100, 0, 10),
(42917, 105175, 0, -8985.31, 860.86, 30.704, 2.67035, 0, 0, 0.972369, 0.233448, 10, 10, 1, 100, 0, 10),
(42919, 105175, 0, -8984.55, 861.033, 30.6693, 2.72271, 0, 0, 0.978148, 0.207912, 10, 10, 1, 100, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
