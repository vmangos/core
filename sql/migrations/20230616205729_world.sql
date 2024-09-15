DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230616205729');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230616205729');
-- Add your query below.


-- Liferoot (2041)
SET @OGUID = 374419;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.502431 yards).
UPDATE `gameobject` SET `position_x`=-13456.4, `position_y`=734.981, `position_z`=5.53083, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=7367;

-- Correct position of Liferoot in Wetlands (position is off by 2.15239 yards).
UPDATE `gameobject` SET `position_x`=-3389.46, `position_y`=-2702.66, `position_z`=8.36749, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=39968;

-- Correct position of Liferoot in Alterac Mountains (position is off by 1.14085 yards).
UPDATE `gameobject` SET `position_x`=297.799, `position_y`=-1378.66, `position_z`=38.981, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=7527;

-- Correct position of Liferoot in Arathi Highlands (position is off by 0.784682 yards).
UPDATE `gameobject` SET `position_x`=-1335.85, `position_y`=-1732.77, `position_z`=55.816, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=7345;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=-12423.7, `position_y`=-335.87, `position_z`=15.0724, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=6642;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.809729 yards).
UPDATE `gameobject` SET `position_x`=-12554.4, `position_y`=-180.455, `position_z`=13.9325, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=7372;

-- Correct position of Liferoot in Arathi Highlands (position is off by 0.320465 yards).
UPDATE `gameobject` SET `position_x`=-1950.31, `position_y`=-2507.08, `position_z`=72.3042, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=7518;

-- Correct position of Liferoot in Desolace (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-1659.96, `position_y`=1469.15, `position_z`=59.5974, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=21386;

-- Correct position of Liferoot in Desolace (position is off by 1.70741 yards).
UPDATE `gameobject` SET `position_x`=-1867.09, `position_y`=982.742, `position_z`=88.1002, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=7458;

-- Correct position of Liferoot in Desolace (position is off by 0.331797 yards).
UPDATE `gameobject` SET `position_x`=-1889.67, `position_y`=1840.48, `position_z`=54.6402, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=7469;

-- Correct position of Liferoot in Alterac Mountains (position is off by 0.806933 yards).
UPDATE `gameobject` SET `position_x`=534.668, `position_y`=-1541.55, `position_z`=40.6436, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=7452;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.429747 yards).
UPDATE `gameobject` SET `position_x`=-12001.2, `position_y`=-349.352, `position_z`=11.4441, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=7499;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-13349.2, `position_y`=745.215, `position_z`=4.4602, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=6656;

-- Correct position of Liferoot in Feralas (position is off by 0.768115 yards).
UPDATE `gameobject` SET `position_x`=-4510.99, `position_y`=2089.55, `position_z`=1.78086, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=7477;

-- Correct position of Liferoot in Desolace (position is off by 0.300049 yards).
UPDATE `gameobject` SET `position_x`=-1795.3, `position_y`=878.776, `position_z`=89.9599, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=7437;

-- Correct position of Liferoot in Alterac Mountains (position is off by 0.652222 yards).
UPDATE `gameobject` SET `position_x`=396.544, `position_y`=-1424.91, `position_z`=38.9625, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=7391;

-- Correct position of Liferoot in Arathi Highlands (position is off by 4.20507 yards).
UPDATE `gameobject` SET `position_x`=-2015.39, `position_y`=-2512.9, `position_z`=72.7827, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=7384;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.39144 yards).
UPDATE `gameobject` SET `position_x`=-12613.3, `position_y`=-98.8945, `position_z`=15.7905, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=7521;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.45259 yards).
UPDATE `gameobject` SET `position_x`=-12709.6, `position_y`=130.92, `position_z`=9.78783, `orientation`=2.61799, `rotation0`=0, `rotation1`=0, `rotation2`=0.965925, `rotation3`=0.258821 WHERE `guid`=7381;

-- Correct position of Liferoot in Wetlands (position is off by 0.288495 yards).
UPDATE `gameobject` SET `position_x`=-4068.79, `position_y`=-3029.04, `position_z`=8.58876, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=7378;

-- Correct position of Liferoot in The Hinterlands (position is off by 0.643103 yards).
UPDATE `gameobject` SET `position_x`=-92.8787, `position_y`=-4014.63, `position_z`=121.424, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=7494;

-- Correct position of Liferoot in Swamp of Sorrows (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10607.5, `position_y`=-4078.94, `position_z`=19.2055, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=6648;

-- Correct position of Liferoot in Wetlands (position is off by 0.834224 yards).
UPDATE `gameobject` SET `position_x`=-3054.84, `position_y`=-2058.81, `position_z`=6.85599, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725374 WHERE `guid`=7454;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.804821 yards).
UPDATE `gameobject` SET `position_x`=-12331.2, `position_y`=-259.94, `position_z`=15.5823, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=7525;

-- Correct position of Liferoot in Dustwallow Marsh (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-4802.6, `position_y`=-3565.6, `position_z`=30.2317, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=56031;

-- Correct position of Liferoot in Wetlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3077.74, `position_y`=-1994.21, `position_z`=7.12134, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=7417;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.416206 yards).
UPDATE `gameobject` SET `position_x`=-11668.4, `position_y`=-330.924, `position_z`=14.0935, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=7514;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.915496 yards).
UPDATE `gameobject` SET `position_x`=-14082.9, `position_y`=446.045, `position_z`=11.6335, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=7490;

-- Correct position of Liferoot in Arathi Highlands (position is off by 1.28703 yards).
UPDATE `gameobject` SET `position_x`=-2085.59, `position_y`=-2513.78, `position_z`=73.9728, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=7380;

-- Correct position of Liferoot in The Hinterlands (position is off by 0.82075 yards).
UPDATE `gameobject` SET `position_x`=447.687, `position_y`=-4007.4, `position_z`=103.455, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=7394;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.912859 yards).
UPDATE `gameobject` SET `position_x`=-12035.9, `position_y`=97.2901, `position_z`=1.18701, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=7455;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.51151 yards).
UPDATE `gameobject` SET `position_x`=-12547.5, `position_y`=-77.8921, `position_z`=14.3442, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=7503;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.767122 yards).
UPDATE `gameobject` SET `position_x`=-11769.3, `position_y`=-329.706, `position_z`=10.7201, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7522;

-- Correct position of Liferoot in Wetlands (position is off by 1.37408 yards).
UPDATE `gameobject` SET `position_x`=-4173.95, `position_y`=-3015.97, `position_z`=7.73034, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=7520;

-- Correct position of Liferoot in Ashenvale (position is off by 0.633855 yards).
UPDATE `gameobject` SET `position_x`=2599.92, `position_y`=-2837.02, `position_z`=163.409, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=7387;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.374221 yards).
UPDATE `gameobject` SET `position_x`=-11594.3, `position_y`=-119.192, `position_z`=13.4993, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=7355;

-- Correct position of Liferoot in Stranglethorn Vale (position is off by 0.61979 yards).
UPDATE `gameobject` SET `position_x`=-11686.5, `position_y`=-336.717, `position_z`=10.0955, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=7337;

-- Correct position of Liferoot in Ashenvale (position is off by 1.11339 yards).
UPDATE `gameobject` SET `position_x`=2239.33, `position_y`=-2190.92, `position_z`=100.649, `orientation`=1.11701, `rotation0`=0, `rotation1`=0, `rotation2`=0.529919, `rotation3`=0.848048 WHERE `guid`=7426;

-- Correct position of Liferoot in Alterac Mountains (position is off by 1.29545 yards).
UPDATE `gameobject` SET `position_x`=562.945, `position_y`=223.555, `position_z`=32.6625, `orientation`=2.18166, `rotation0`=0, `rotation1`=0, `rotation2`=0.887011, `rotation3`=0.461749 WHERE `guid`=7515;

-- Correct position of Liferoot in Wetlands (position is off by 0.398304 yards).
UPDATE `gameobject` SET `position_x`=-3421.35, `position_y`=-2679.81, `position_z`=7.33954, `orientation`=4.59022, `rotation0`=0, `rotation1`=0, `rotation2`=-0.748956, `rotation3`=0.66262 WHERE `guid`=7488;

-- Correct position of Liferoot in Ashenvale (position is off by 0.552357 yards).
UPDATE `gameobject` SET `position_x`=1476.45, `position_y`=-2163.62, `position_z`=87.262, `orientation`=5.13127, `rotation0`=0, `rotation1`=0, `rotation2`=-0.544639, `rotation3`=0.838671 WHERE `guid`=7453;

-- Missing Liferoot spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2041, 0, -10423.9, -2979.65, 18.9497, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1114.526611 yards.
(@OGUID+2, 2041, 0, -10472.1, -2599.18, 20.7916, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1485.952515 yards.
(@OGUID+3, 2041, 0, -10188.3, -3340.09, 19.943, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 744.248047 yards.
(@OGUID+4, 2041, 0, -10567.4, -2542.74, 20.7944, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 1536.734009 yards.
(@OGUID+5, 2041, 0, -10338.3, -3419.24, 20.0979, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 680.155701 yards.
(@OGUID+6, 2041, 0, -10330.6, -2957.37, 19.5952, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1134.963501 yards.
(@OGUID+7, 2041, 0, -10285.3, -3052.72, 19.9827, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1035.455566 yards.
(@OGUID+8, 2041, 0, -10156.2, -2534.16, 26.2465, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1550.661499 yards.
(@OGUID+9, 2041, 0, -10170.4, -2818.89, 19.9475, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1265.665283 yards.
(@OGUID+10, 2041, 0, -10195.5, -3511.92, 20.4763, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 572.381470 yards.
(@OGUID+11, 2041, 0, -10078.1, -4046.58, 18.9007, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 123.597229 yards.
(@OGUID+12, 2041, 0, -10284.3, -2789.84, 18.9399, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1297.481812 yards.
(@OGUID+13, 2041, 0, -10201.1, -2563.92, 26.4296, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1520.406250 yards.
(@OGUID+14, 2041, 0, -10361.3, -3570.38, 20.4923, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 539.912659 yards.
(@OGUID+15, 2041, 0, -10190.6, -2971.65, 18.9285, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1112.662354 yards.
(@OGUID+16, 2041, 0, -10145.9, -2478.89, 25.4996, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1606.197510 yards.
(@OGUID+17, 2041, 0, -10557.8, -4243.63, 19.9668, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 172.017929 yards.
(@OGUID+18, 2041, 0, -10243.5, -2922.67, 19.0033, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1162.609131 yards.
(@OGUID+19, 2041, 0, -10265.3, -3364.09, 20.3255, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 723.556274 yards.
(@OGUID+20, 2041, 0, -10212.2, -3159.33, 19.1041, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 925.115356 yards.
(@OGUID+21, 2041, 0, -10632.2, -4029.9, 19.4455, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6648 at 54.918709 yards.
(@OGUID+22, 2041, 0, -10097, -3010.47, 19.1777, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6773 at 1078.365601 yards.
(@OGUID+23, 2041, 0, -10894, -3971.03, 20.2261, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 2041, 0, -10772.4, -3880.16, 18.6829, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 2041, 0, -10647, -3756.12, 18.5458, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 2041, 0, -10392.2, -2888.43, 20.1874, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 2041, 0, -10242.4, -4247.66, 19.2684, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 2041, 0, -10105.4, -3458.02, 19.4335, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 2041, 0, -10097.8, -3224.53, 19.3825, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 2041, 0, -10095, -3661.37, 20.0929, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 2041, 0, -9924.61, -3873.61, 19.4348, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 2041, 0, -9913.32, -3977.36, 20.4127, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+33, 2041, 0, -3102.63, -1299.36, 7.84485, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14871 at 252.923691 yards.
(@OGUID+34, 2041, 0, -2923.68, -1244.04, 7.05653, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 139.079514 yards.
(@OGUID+35, 2041, 0, -2848.54, -1301.96, 7.27921, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 130.483673 yards.
(@OGUID+36, 2041, 0, -2739.23, -1328.33, 7.56998, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34104 at 159.320175 yards.
(@OGUID+37, 2041, 0, -3147.48, -1439.87, 7.53627, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14716 at 264.927246 yards.
(@OGUID+38, 2041, 0, -3094.27, -2504.67, 8.32382, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7413 at 62.201946 yards.
(@OGUID+39, 2041, 0, -2750.8, -1461.47, 7.20136, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34097 at 102.657646 yards.
(@OGUID+40, 2041, 0, -3046.49, -2245.78, 7.35686, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7373 at 26.480942 yards.
(@OGUID+41, 2041, 0, -3094.43, -2330.87, 6.9257, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 2041, 0, -3049.69, -1948, 7.30686, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 2041, 0, -3026.99, -2356.25, 7.11371, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 2041, 0, -2899.98, -1106.47, 7.80995, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 2041, 0, -2896.75, -1689.91, 7.51803, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+46, 2041, 1, -2624.21, -3272.21, 29.4896, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55959 at 141.958511 yards.
(@OGUID+47, 2041, 1, -3101.98, -4054.79, 23.703, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18886 at 267.839386 yards.
(@OGUID+48, 2041, 1, -3175.14, -3117.97, 30.5827, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18885 at 207.129639 yards.
(@OGUID+49, 2041, 1, -2816.24, -3081.45, 30.3134, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19444 at 54.844166 yards.
(@OGUID+50, 2041, 1, -3775.09, -2953.29, 31.872, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12902 at 128.785858 yards.
(@OGUID+51, 2041, 1, -3402.81, -3239.14, 30.4997, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 332.561707 yards.
(@OGUID+52, 2041, 1, -3445.87, -3330.67, 31.0648, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 319.383972 yards.
(@OGUID+53, 2041, 1, -3871.89, -3656.06, 31.251, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40739 at 266.153595 yards.
(@OGUID+54, 2041, 1, -3772.63, -3295.04, 30.3823, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 115.297874 yards.
(@OGUID+55, 2041, 1, -4501, -2915.76, 30.4631, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56030 at 147.121552 yards.
(@OGUID+56, 2041, 1, -4594.51, -3245.26, 31.415, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56030 at 195.392548 yards.
(@OGUID+57, 2041, 1, -4042.81, -3541.31, 30.4527, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20971 at 130.741730 yards.
(@OGUID+58, 2041, 1, -2696.02, -3670.07, 30.6771, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14945 at 52.110149 yards.
(@OGUID+59, 2041, 1, -3955.8, -3187.46, 30.7464, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56005 at 47.959133 yards.
(@OGUID+60, 2041, 1, -3259.52, -2847.8, 30.8701, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21120 at 305.714813 yards.
(@OGUID+61, 2041, 1, -3009.71, -3625.47, 28.6143, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19442 at 242.711716 yards.
(@OGUID+62, 2041, 1, -2792.61, -3489.66, 31.1472, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 19442 at 29.533159 yards.
(@OGUID+63, 2041, 1, -4653.77, -3597.04, 31.8647, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12340 at 68.566895 yards.
(@OGUID+64, 2041, 1, -2676.61, -3316.81, 31.123, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55959 at 73.894005 yards.
(@OGUID+65, 2041, 1, -3053.16, -3773.24, 30.6329, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18886 at 159.171722 yards.
(@OGUID+66, 2041, 1, -3623.66, -3275.27, 31.6351, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 138.961502 yards.
(@OGUID+67, 2041, 1, -2824.39, -3800.51, 29.9342, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14945 at 219.828568 yards.
(@OGUID+68, 2041, 1, -3557.42, -3318.69, 30.4225, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21109 at 217.895462 yards.
(@OGUID+69, 2041, 1, -3760, -3381.81, 30.9896, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40739 at 164.240448 yards.
(@OGUID+70, 2041, 1, -4806.29, -3440.59, 30.4135, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 2041, 1, -4630.46, -3365.78, 30.9744, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 2041, 1, -4067.5, -2833.92, 31.3708, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 2041, 1, -4039.07, -3586.69, 32.4567, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 2041, 1, -3676.5, -2814.39, 31.8353, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 2041, 1, -3615.72, -3069.87, 30.6471, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 2041, 1, -3492.4, -2749.13, 31.1615, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 2041, 1, -2890.37, -3162.65, 30.3003, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+78, 2041, 0, -13540, 664.827, 4.37746, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7367 at 109.357925 yards.
(@OGUID+79, 2041, 0, -11849.6, -313.75, 12.8228, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7522 at 82.056244 yards.
(@OGUID+80, 2041, 0, -12179.3, 61.1013, 0.958485, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7472 at 58.537022 yards.
(@OGUID+81, 2041, 0, -11910, -503.023, 12.6914, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32833 at 123.429642 yards.
(@OGUID+82, 2041, 0, -12118, 112.797, 1.71559, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7455 at 84.413437 yards.
(@OGUID+83, 2041, 0, -12154.8, 30.5872, 2.45759, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7472 at 43.739742 yards.
(@OGUID+84, 2041, 0, -12156, -65.9369, 10.715, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7399 at 16.608559 yards.
(@OGUID+85, 2041, 0, -14347, 142.964, 11.1941, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11643 at 183.607666 yards.
(@OGUID+86, 2041, 0, -12270.6, -355.563, 17.0246, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7546 at 75.908974 yards.
(@OGUID+87, 2041, 0, -13674.1, 449.951, 41.3601, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7466 at 41.670376 yards.
(@OGUID+88, 2041, 0, -11821.7, 872.976, 6.03503, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11658 at 349.523102 yards.
(@OGUID+89, 2041, 0, -11652.8, 1017.66, 2.37706, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11658 at 339.820038 yards.
(@OGUID+90, 2041, 0, -12081.1, 105.16, 1.89954, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7455 at 46.749054 yards.
(@OGUID+91, 2041, 0, -12226.4, 312.19, 2.25928, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7501 at 73.112633 yards.
(@OGUID+92, 2041, 0, -13675, 599.029, 10.4161, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7433 at 28.143934 yards.
(@OGUID+93, 2041, 0, -11539.7, 656.182, 60.625, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7497 at 33.395763 yards.
(@OGUID+94, 2041, 0, -14527, 209.639, 5.64817, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 2041, 0, -14082.3, 324.559, 23.9637, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 2041, 0, -14034.1, 485.111, 5.65399, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 2041, 0, -13935.7, -130.329, 7.8164, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 2041, 0, -13639.6, 420.68, 36.7182, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 2041, 0, -13096.3, 476.264, 13.8901, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 2041, 0, -12198.1, -58.1796, 1.09586, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 2041, 0, -12117.5, -44.3535, 12.6436, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 2041, 0, -12059.6, -513.804, 11.483, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 2041, 0, -12001.2, -349.352, 11.4441, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 2041, 0, -11569.2, 56.2796, 14.1259, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 2041, 0, -11540.8, 624.673, 50.7442, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+106, 2041, 0, -11539.4, 582.983, 50.6671, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 2041, 0, -11508.6, 192.418, 13.1684, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 2041, 0, -11466.1, 258.309, 14.5832, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+109, 2041, 0, 1393.61, -61.5613, 38.9985, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7552 at 220.787720 yards.
(@OGUID+110, 2041, 0, 466.333, -1472.12, 40.626, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35371 at 43.658577 yards.
(@OGUID+111, 2041, 0, 335.301, -1352.17, 40.368, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7527 at 46.311089 yards.
(@OGUID+112, 2041, 0, 1321.15, -164.634, 33.451, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7552 at 95.383148 yards.
(@OGUID+113, 2041, 0, 511.413, 316.151, 33.5981, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 2041, 0, 654.929, 119.079, 33.3018, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+115, 2041, 0, -1455.35, -1925.88, 50.5102, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7340 at 12.771090 yards.
(@OGUID+116, 2041, 0, -1400.24, -1704.12, 48.3906, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7505 at 14.763986 yards.
(@OGUID+117, 2041, 0, -1745.89, -3344.36, 24.6225, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 2041, 0, -1739.47, -3243.1, 24.8213, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 2041, 0, -1707.68, -3243.31, 25.8156, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 2041, 0, -1425.22, -1941.9, 46.956, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+121, 2041, 0, 17.8396, -3752.17, 146.476, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7538 at 65.595879 yards.
(@OGUID+122, 2041, 0, 508.709, -3392.8, 103.179, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7470 at 26.092207 yards.
(@OGUID+123, 2041, 0, 249.01, -4457.45, 102.536, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7363 at 103.160522 yards.
(@OGUID+124, 2041, 0, -54.0577, -3203.03, 115.833, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+125, 2041, 0, -433.665, -986.09, 34.3007, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 112.038933 yards.
(@OGUID+126, 2041, 0, -79.2343, -1131.86, 37.7567, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6778 at 101.930031 yards.
(@OGUID+127, 2041, 0, -426.187, -1054.69, 35.5166, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 65.670914 yards.
(@OGUID+128, 2041, 0, -582.104, -829.921, 7.925, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6724 at 328.423309 yards.
(@OGUID+129, 2041, 0, -226.602, -1092.11, 38.0874, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6778 at 62.969185 yards.
(@OGUID+130, 2041, 0, -619.827, -746.11, 7.60275, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10),
(@OGUID+131, 2041, 0, -541.978, -906.142, 31.5448, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+132, 2041, 1, 1831.38, -2845.16, 95.0956, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 399.396210 yards.
(@OGUID+133, 2041, 1, 2203.34, -3562.25, 39.4123, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48182 at 177.679977 yards.
(@OGUID+134, 2041, 1, 2103.75, -2889.68, 106.928, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 146.866104 yards.
(@OGUID+135, 2041, 1, 1848.97, -1927.76, 94.8288, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33548 at 227.827667 yards.
(@OGUID+136, 2041, 1, 1767.24, -1808.65, 94.5485, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33548 at 352.568665 yards.
(@OGUID+137, 2041, 1, 2320.24, -2332.16, 112.906, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7426 at 164.344559 yards.
(@OGUID+138, 2041, 1, 2506.59, -2342.51, 144.172, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7426 at 311.322205 yards.
(@OGUID+139, 2041, 1, 1958.71, -2854.11, 95.1145, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48181 at 274.276215 yards.
(@OGUID+140, 2041, 1, 1920.16, -2939.41, 94.9626, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32559 at 292.599884 yards.
(@OGUID+141, 2041, 1, 1585.1, -2079.88, 86.7682, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 2041, 1, 2383.09, -2850.78, 141.218, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 2041, 1, 2888.04, -2607.4, 215.932, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+144, 2041, 1, -4716.59, 2077.56, 2.63233, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7416 at 91.708321 yards.
(@OGUID+145, 2041, 1, -4649.62, 232.225, 6.14846, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7376 at 309.648560 yards.
(@OGUID+146, 2041, 1, -3032.17, 2091.52, 28.1324, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21443 at 124.380058 yards.
(@OGUID+147, 2041, 1, -3303.51, 2199.39, 28.4162, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7435 at 243.824982 yards.
(@OGUID+148, 2041, 1, -4662.81, 1144.55, 87.1693, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7440 at 138.937256 yards.
(@OGUID+149, 2041, 1, -4237.53, 219.173, 52.6707, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7476 at 50.637497 yards.
(@OGUID+150, 2041, 1, -4792.35, 1106.09, 84.0014, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7440 at 9.050183 yards.
(@OGUID+151, 2041, 1, -4831.58, 2214.34, 4.00695, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+152, 2041, 1, -3520.12, 2025.65, 38.5188, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10);

-- Missing Liferoot spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+153, 2041, 1, -1891.99, 1954.84, 53.4972, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28646 at 61.985943 yards.
(@OGUID+154, 2041, 1, -1981.55, 1582.63, 59.2617, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 7491 at 81.648743 yards.
(@OGUID+155, 2041, 1, -1548.38, 1572.11, 58.781, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29185 at 114.893074 yards.
(@OGUID+156, 2041, 1, -1999.58, 2393.52, 53.7464, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+157, 2041, 1, -1994.99, 1856.3, 52.7722, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+158, 2041, 1, -1933.01, 2386.59, 54.5402, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+159, 2041, 1, -1905.16, 1066.68, 89.9126, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+160, 2041, 1, -1897.2, 2255.46, 53.862, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+161, 2041, 1, -1896.92, 2325.6, 53.3839, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+162, 2041, 1, -1884.53, 1245.77, 88.0719, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+163, 2041, 1, -1781.48, 1824.03, 54.2063, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(@OGUID+164, 2041, 1, -1648.98, 1002.89, 88.4992, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+2, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+3, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+4, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+5, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+6, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+7, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+8, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+9, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+10, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+11, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+12, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+13, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+14, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+15, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+16, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+17, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+18, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+19, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+20, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+21, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+22, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+23, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+24, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+25, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+26, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+27, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+28, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+29, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+30, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+31, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+32, 1317, 0, 'Liferoot', 0, 10), -- Liferoots in Swamp of Sorrows (1) 6 objects total
(@OGUID+33, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+34, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+35, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+36, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+37, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+38, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+39, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+40, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+41, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+42, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+43, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+44, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+45, 1153, 0, 'Liferoot', 0, 10), -- Liferoots in Wetlands 51 objects total
(@OGUID+46, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+47, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+48, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+49, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+50, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+51, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+52, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+53, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+54, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+55, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+56, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+57, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+58, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+59, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+60, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+61, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+62, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+63, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+64, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+65, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+66, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+67, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+68, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+69, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+70, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+71, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+72, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+73, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+74, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+75, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+76, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+77, 1104, 0, 'Liferoot', 0, 10), -- Liferoots in Dustwallow Marsh 10 objects total
(@OGUID+78, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+79, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+80, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+81, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+82, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+83, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+84, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+85, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+86, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+87, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+88, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+89, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+90, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+91, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+92, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+93, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+94, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+95, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+96, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+97, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+98, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+99, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+100, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+101, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+102, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+103, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+104, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+105, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+106, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+107, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+108, 1179, 0, 'Liferoot', 0, 10), -- Liferoots in Stranglethorn 10 objects total
(@OGUID+109, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+110, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+111, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+112, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+113, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+114, 1063, 0, 'Liferoot', 0, 10), -- Liferoots in Alterac 36 objects total
(@OGUID+115, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+116, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+117, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+118, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+119, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+120, 1184, 0, 'Liferoot', 0, 10), -- Liferoots in Arathi 47 objects total
(@OGUID+121, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(@OGUID+122, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(@OGUID+123, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(@OGUID+124, 1251, 0, 'Liferoot', 0, 10), -- Liferoots in Hinterlands 17 objects total
(@OGUID+125, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+126, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+127, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+128, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+129, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+130, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+131, 998, 0, 'Liferoot', 0, 10), -- Liferoot in Hillsbrad Foothills
(@OGUID+132, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+133, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+134, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+135, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+136, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+137, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+138, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+139, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+140, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+141, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+142, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+143, 1325, 0, 'Liferoot', 0, 10), -- Liferoot in Ashenvale 10 objects total
(@OGUID+144, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+145, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+146, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+147, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+148, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+149, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+150, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+151, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+152, 1193, 0, 'Liferoot', 0, 10), -- Liferoots in Feralas 19 objects total
(@OGUID+153, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+154, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+155, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+156, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+157, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+158, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+159, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+160, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+161, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+162, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+163, 1144, 0, 'Liferoot', 0, 10), -- Liferoots in Desolace 11 objects total
(@OGUID+164, 1144, 0, 'Liferoot', 0, 10); -- Liferoots in Desolace 11 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Liferoot in Hillsbrad Foothills' WHERE  `entry`=998;
UPDATE `pool_template` SET `description`='Liferoot in Ashenvale' WHERE  `entry`=1325;
UPDATE `pool_template` SET `description`='Liferoot in Alterac Mountains' WHERE  `entry`=1063;
UPDATE `pool_template` SET `description`='Liferoot in Arathi Highlands' WHERE  `entry`=1184;
UPDATE `pool_template` SET `description`='Liferoot in Desolace' WHERE  `entry`=1144;
UPDATE `pool_template` SET `description`='Liferoot in Dustwallow Marsh' WHERE  `entry`=1104;
UPDATE `pool_template` SET `description`='Liferoot in Feralas' WHERE  `entry`=1193;
UPDATE `pool_template` SET `description`='Liferoot in Hillsbrad Foothills' WHERE  `entry`=998;
UPDATE `pool_template` SET `description`='Liferoot in Hinterlands' WHERE  `entry`=1251;
UPDATE `pool_template` SET `description`='Liferoot in Stranglethorn' WHERE  `entry`=1179;
UPDATE `pool_template` SET `description`='Liferoot in Swamp of Sorrows' WHERE  `entry`=1317;
UPDATE `pool_template` SET `description`='Liferoot in Wetlands' WHERE  `entry`=1153;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (7447, 7536, 7354, 7331, 7498, 7499, 7366, 7497, 7365, 7353, 7336, 7362, 7330, 7334, 7338, 7339, 7340, 7341, 7342, 7343, 7344, 7356, 7360, 7363, 7364, 7368, 7369, 7370, 7371, 7373, 7374, 7375, 7376, 7377, 7379, 7383, 7385, 7386, 7390, 7392, 7397, 7406, 7407, 7408, 7409, 7413, 7414, 7415, 7416, 7418, 7419, 7420, 7421, 7422, 7423, 7424, 7425, 7427, 7429, 7430, 7431, 7433, 7434, 7435, 7436, 7440, 7442, 7443, 7444, 7445, 7448, 7449, 7450, 7451, 7457, 7460, 7465, 7466, 7467, 7470, 7472, 7474, 7475, 7476, 7479, 7480, 7482, 7483, 7484, 7485, 7496, 7500, 7505, 7506, 7507, 7508, 7510, 7511, 7512, 7513, 7516, 7519, 7523, 7526, 7530, 7531, 7532, 7533, 7534, 7535, 7538, 7540, 7541, 7542, 7543, 7544, 7545, 7547, 7548, 7549, 7550, 7551, 7552);
DELETE FROM `pool_gameobject` WHERE `guid` IN (7447, 7536, 7354, 7331, 7498, 7499, 7366, 7497, 7365, 7353, 7336, 7362, 8222, 8247, 8522, 8533, 30786, 30645, 7330, 7334, 7338, 7339, 7340, 7341, 7342, 7343, 7344, 7356, 7360, 7363, 7364, 7368, 7369, 7370, 7371, 7373, 7374, 7375, 7376, 7377, 7379, 7383, 7385, 7386, 7390, 7392, 7397, 7406, 7407, 7408, 7409, 7413, 7414, 7415, 7416, 7418, 7419, 7420, 7421, 7422, 7423, 7424, 7425, 7427, 7429, 7430, 7431, 7433, 7434, 7435, 7436, 7440, 7442, 7443, 7444, 7445, 7448, 7449, 7450, 7451, 7457, 7460, 7465, 7466, 7467, 7470, 7472, 7474, 7475, 7476, 7479, 7480, 7482, 7483, 7484, 7485, 7496, 7500, 7505, 7506, 7507, 7508, 7510, 7511, 7512, 7513, 7516, 7519, 7523, 7526, 7530, 7531, 7532, 7533, 7534, 7535, 7538, 7540, 7541, 7542, 7543, 7544, 7545, 7547, 7548, 7549, 7550, 7551, 7552);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2041);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1153;
UPDATE `pool_template` SET `max_limit`=32 WHERE  `entry`=1179;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1251;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1184;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1063;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1104;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1144;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1317;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1325;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=998;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
