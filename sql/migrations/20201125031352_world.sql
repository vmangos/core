DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125031352');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125031352');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-6800.22, `position_y`=-4753.86, `position_z`=9.97542, `orientation`=5.42798, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909962 WHERE `guid`=12252;
UPDATE `gameobject` SET `position_x`=-7221.24, `position_y`=-1565.34, `position_z`=254.58, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=31322;
UPDATE `gameobject` SET `position_x`=-6551.81, `position_y`=-3283.02, `position_z`=241.864, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12306;


-- Missing spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9980, 2866, 0, -6872.54, -1692.59, 247.038, 4.43314, 0, 0, -0.798635, 0.601815, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9980, 1291, 'Firebloom');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (9991, 2866, 0, -7319.13, -934.882, 244.218, 3.194, 0, 0, -0.999657, 0.0262017, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (9991, 1291, 'Firebloom');



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
