DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102161652');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102161652');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6722.4, `position_y`=-3084.47, `position_z`=282.649, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=7745;
UPDATE `gameobject` SET `position_x`=-1044.92, `position_y`=-3256.63, `position_z`=39.844, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7793;
UPDATE `gameobject` SET `position_x`=-10164, `position_y`=-3209.01, `position_z`=24.4014, `orientation`=3.927, `rotation0`=0, `rotation1`=0, `rotation2`=-0.923879, `rotation3`=0.382686 WHERE `guid`=7706;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1054, 1, 'Herbs in Scarlet Monastery', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6817, 2042, 0, -16.0845, 377.3, 48.6796, 1.6057, 0, 0, 0.719339, 0.694659, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6817, 1071, 'Fadeleaf');


-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6820, 2042, 1, -2683.35, -2891.58, 35.377, 5.91667, 0, 0, -0.182235, 0.983255, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6820, 1328, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6824, 2042, 1, -2695.31, -3196.42, 32.9254, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6824, 1328, 'Fadeleaf');


-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6830, 2042, 189, 166.831, -253.104, 19.0757, 5.68977, 0, 0, -0.292372, 0.956305, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6830, 1054, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6832, 2042, 189, 187.977, -277.975, 18.7038, 5.34071, 0, 0, -0.45399, 0.891007, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6832, 1054, 'Fadeleaf');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6838, 2042, 189, 1651.27, -346.265, 18.1489, 5.07891, 0, 0, -0.566406, 0.824126, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6838, 1054, 'Fadeleaf');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
