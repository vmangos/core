DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125032657');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125032657');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6451.54, `position_y`=-3418.86, `position_z`=229.71, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=15916;
UPDATE `gameobject` SET `position_x`=-6930.42, `position_y`=-4351.05, `position_z`=11.3895, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=17308;
UPDATE `gameobject` SET `position_x`=-6964.21, `position_y`=-4412.08, `position_z`=10.5654, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=17305;
UPDATE `gameobject` SET `position_x`=-4884.26, `position_y`=1158.3, `position_z`=81.752, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515037, `rotation3`=0.857168 WHERE `guid`=15932;
UPDATE `gameobject` SET `position_x`=3248.19, `position_y`=-4352.48, `position_z`=128.272, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=39933;
UPDATE `gameobject` SET `position_x`=3435.67, `position_y`=-4595.98, `position_z`=104.199, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=39934;


-- Missing spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15885, 142140, 1, 3655.02, -5225.06, 84.9615, 6.05629, 0, 0, -0.113203, 0.993572, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15885, 1239, 'Purple Lotus');

-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15869, 142140, 1, -3093.81, 1941.48, 29.1315, 4.64258, 0, 0, -0.731354, 0.681998, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15869, 1324, 'Purple Lotus');

-- Missing spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15807, 142140, 0, -195.593, -4092.25, 152.112, 0.610863, 0, 0, 0.300705, 0.953717, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15807, 1254, 'Purple Lotus');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15796, 142140, 0, -170.906, -3785.24, 238.499, 0.837758, 0, 0, 0.406736, 0.913545, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15796, 1254, 'Purple Lotus');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (15791, 142140, 0, 330.611, -3794.22, 164.849, 0.750491, 0, 0, 0.366501, 0.930418, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (15791, 1254, 'Purple Lotus');



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
