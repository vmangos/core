DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240919145215');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240919145215');
-- Add your query below.


-- Cathedral Square
UPDATE `gameobject` SET `position_x`=-8439.52, `position_y`=650.01, `position_z`=93.5751, `orientation`=0.663225, `rotation0`=0, `rotation1`=0, `rotation2`=0.325568, `rotation3`=0.945519 WHERE `guid`=10665;

-- Food Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(156, 3707, 70, -7.95842, 275.67, -48.8676, 2.18166, 0, 0, 0.887011, 0.461749, 604800, 604800, 100, 1, 0, 10); -- Uldaman

-- Keenly Disguised Barrel
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(20, 20737, 1, -6266.87, -3846.88, -58.7501, 0.558504, 0, 0, 0.275637, 0.961262, -8, -8, 100, 1, 0, 10); -- Thousand Needles
DELETE FROM `creature_movement_scripts` WHERE `id`=470901;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(470901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Talk'),
(470901, 3, 0, 9, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Respawn Gobject'),
(470901, 4, 0, 25, 1, 0, 0, 0, 21577, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Run'),
(470901, 11, 0, 0, 0, 0, 0, 0, 21577, 0, 9, 2, 1541, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk'),
(470901, 11, 0, 60, 2, 0, 0, 0, 21577, 0, 9, 2, 0, 4720, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Start Waypoints');

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(485, 32571, 30, -100.073, -583.512, 41.7316, 0.00872424, 0, 0, 0.00436211, 0.99999, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(486, 32572, 30, -102.735, -588.775, 41.7316, 5.24472, 0, 0, -0.496216, 0.868199, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(488, 32573, 30, -100.968, -586.958, 41.7316, 5.76831, 0, 0, -0.254601, 0.967046, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(489, 32574, 30, -106.174, -589.721, 41.7316, 4.72112, 0, 0, -0.704014, 0.710186, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Anvil
UPDATE `gameobject` SET `id`=34031, `position_x`=-5856.64, `position_y`=-2646.11, `position_z`=308.974, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=397221;

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(493, 34034, 0, -4570.28, -1716.59, 510.347, 3.49067, 0, 0, -0.984807, 0.173652, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(494, 34035, 0, -4570.2, -1712.38, 510.347, 4.49422, 0, 0, -0.779884, 0.625924, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(495, 34037, 0, -4570, -1715.57, 510.347, 3.18527, 0, 0, -0.999762, 0.0218352, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Anvil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(496, 34038, 0, -4570.25, -1714.72, 510.347, 3.62156, 0, 0, -0.971342, 0.237686, 900, 900, 100, 1, 0, 10); -- Dun Morogh

-- Forge
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(498, 34571, 30, -105.425, -584.352, 42.0149, 2.36492, 0, 0, 0.92554, 0.37865, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Forge
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(499, 38491, 529, 990.934, 1008.04, -44.4135, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 10); -- Arathi Basin

-- Anvil
UPDATE `gameobject` SET `id`=38492, `position_x`=984.362, `position_y`=1007.4, `position_z`=-42.6056, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958462, `rotation3`=0.995396 WHERE `guid`=3997185;

-- Anvil
UPDATE `gameobject` SET `id`=38493, `position_x`=991.484, `position_y`=1014.5, `position_z`=-42.6056, `orientation`=4.60767, `rotation0`=0, `rotation1`=0, `rotation2`=-0.743144, `rotation3`=0.669131 WHERE `guid`=3997178;

-- Anvil
UPDATE `gameobject` SET `id`=38494, `position_x`=996.198, `position_y`=1001.88, `position_z`=-42.6056, `orientation`=3.1678, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999914, `rotation3`=0.013102 WHERE `guid`=3997179;

-- Anvil
UPDATE `gameobject` SET `id`=38495, `position_x`=990.351, `position_y`=1001.44, `position_z`=-42.6056, `orientation`=1.13446, `rotation0`=0, `rotation1`=0, `rotation2`=0.537299, `rotation3`=0.843392 WHERE `guid`=3997180;

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(528, 48404, 70, -221.408, -54.3522, -45.4083, 1.48751, -0.00628853, -0.0243835, 0.676629, 0.735893, 180, 180, 100, 1, 0, 10); -- Uldaman

-- Short Wooden Seat
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(530, 48499, 70, -255.741, 394.701, -35.8334, 3.15, 0.0676699, -0.030221, -0.997248, 0.00212837, 180, 180, 100, 1, 0, 10); -- Uldaman

-- Burning Embers
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(532, 50803, 1, -10722.3, 2482.63, 8.03773, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 100, 1, 0, 10); -- Silithus

-- Burning Embers
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(538, 50804, 1, -10720.2, 2476.09, 8.03773, 3.02813, 0, 0, 0.998391, 0.0567022, 900, 900, 100, 1, 0, 10); -- Silithus

-- Burning Embers
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(539, 50805, 1, -10702.9, 2484.61, 8.03773, 3.08918, 0, 0, 0.999657, 0.0262016, 900, 900, 100, 1, 0, 10); -- Silithus

-- Bonfire
UPDATE `gameobject` SET `id`=63196, `position_x`=-8979.4, `position_y`=1031.92, `position_z`=100.734, `orientation`=5.38434, `rotation0`=0, `rotation1`=0, `rotation2`=-0.434444, `rotation3`=0.900699 WHERE `guid`=42880;

-- Grimand's Anvil
UPDATE `gameobject` SET `position_x`=-8387.84, `position_y`=684.431, `position_z`=95.2727, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=14962;

-- Summoning Circle
UPDATE `gameobject` SET `position_x`=-8972.75, `position_y`=1043.22, `position_z`=52.897, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=42881;

-- Cauldron
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(555, 105173, 1, 2900.79, 2465.59, 138.23, 0.750425, 0, 0, 0.36647, 0.93043, 180, 180, 100, 1, 0, 10); -- Stonetalon Mountains


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
