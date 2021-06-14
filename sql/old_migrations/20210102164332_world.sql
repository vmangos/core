DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102164332');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102164332');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=4010.14, `position_y`=-5017.9, `position_z`=149.252, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=19679;


-- Missing spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16622, 176586, 0, -7972.84, -2678.18, 195.698, 5.75959, 0, 0, -0.258819, 0.965926, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16622, 1302, 'Mountain Silversage');


-- Missing spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16623, 176586, 0, 2115.36, -5366.65, 125.839, 2.40855, 0, 0, 0.93358, 0.358368, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16623, 1269, 'Mountain Silversage');


-- Missing spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16626, 176586, 1, -8085.21, 1152.72, 30.9524, 2.11185, 0, 0, 0.870356, 0.492424, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16626, 1222, 'Mountain Silversage');


-- Missing spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16624, 176586, 1, -6437.51, -623.797, -243.002, 5.63741, 0, 0, -0.317305, 0.948324, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16624, 1218, 'Mountain Silversage');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16625, 176586, 1, -6960.88, -2322.74, -224.537, 3.22886, 0, 0, -0.999048, 0.0436193, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16625, 1218, 'Mountain Silversage');


-- Missing spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (16637, 176586, 1, 6679.09, -3216.58, 627.622, 3.54302, 0, 0, -0.979924, 0.19937, 2700, 2700, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (16637, 1237, 'Mountain Silversage');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
