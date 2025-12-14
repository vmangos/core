DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611095444');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611095444');
-- Add your query below.


-- Goldthorn (2046)
SET @OGUID = 42204;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.636479 yards).
UPDATE `gameobject` SET `position_x`=-1692.98, `position_y`=-2382.04, `position_z`=37.5889, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=9047;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 1.14574 yards).
UPDATE `gameobject` SET `position_x`=517.737, `position_y`=-703.093, `position_z`=161.284, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=8753;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.743762 yards).
UPDATE `gameobject` SET `position_x`=-10560.3, `position_y`=-2459.79, `position_z`=28.5932, `orientation`=1.76278, `rotation0`=0, `rotation1`=0, `rotation2`=0.771625, `rotation3`=0.636078 WHERE `guid`=8746;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.330406 yards).
UPDATE `gameobject` SET `position_x`=-12801.3, `position_y`=-242.125, `position_z`=22.9495, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=8894;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 3.73637 yards).
UPDATE `gameobject` SET `position_x`=643.962, `position_y`=-695.862, `position_z`=205.971, `orientation`=4.99164, `rotation0`=0, `rotation1`=0, `rotation2`=-0.601814, `rotation3`=0.798636 WHERE `guid`=9172;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.278869 yards).
UPDATE `gameobject` SET `position_x`=-950.858, `position_y`=-2239.76, `position_z`=54.3306, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=8675;

-- Correct position of Goldthorn in Badlands (position is off by 0.836555 yards).
UPDATE `gameobject` SET `position_x`=-6826.8, `position_y`=-3148.87, `position_z`=261.128, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=9189;

-- Correct position of Goldthorn in Badlands (position is off by 2.82231 yards).
UPDATE `gameobject` SET `position_x`=-7041.4, `position_y`=-3283.15, `position_z`=246.536, `orientation`=4.4855, `rotation0`=0, `rotation1`=0, `rotation2`=-0.782608, `rotation3`=0.622515 WHERE `guid`=8888;

-- Correct position of Goldthorn in Badlands (position is off by 0.777714 yards).
UPDATE `gameobject` SET `position_x`=-6641.55, `position_y`=-2623.45, `position_z`=256.692, `orientation`=4.13643, `rotation0`=0, `rotation1`=0, `rotation2`=-0.878817, `rotation3`=0.47716 WHERE `guid`=9130;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.42062 yards).
UPDATE `gameobject` SET `position_x`=-1069.87, `position_y`=-1611.4, `position_z`=46.1645, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=9209;

-- Correct position of Goldthorn in The Hinterlands (position is off by 0.660439 yards).
UPDATE `gameobject` SET `position_x`=42.2495, `position_y`=-3664.66, `position_z`=131.693, `orientation`=6.00393, `rotation0`=0, `rotation1`=0, `rotation2`=-0.139173, `rotation3`=0.990268 WHERE `guid`=9210;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.335682 yards).
UPDATE `gameobject` SET `position_x`=-12657.1, `position_y`=-45.3199, `position_z`=23.7914, `orientation`=5.25344, `rotation0`=0, `rotation1`=0, `rotation2`=-0.492423, `rotation3`=0.870356 WHERE `guid`=8770;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.987386 yards).
UPDATE `gameobject` SET `position_x`=-10479.7, `position_y`=-2497.4, `position_z`=33.4731, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=8992;

-- Correct position of Goldthorn in Feralas (position is off by 0.292669 yards).
UPDATE `gameobject` SET `position_x`=-4692.77, `position_y`=1519.28, `position_z`=115.723, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=9059;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.299805 yards).
UPDATE `gameobject` SET `position_x`=-13051.7, `position_y`=164.205, `position_z`=40.8736, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=8756;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 2.90716 yards).
UPDATE `gameobject` SET `position_x`=-10588, `position_y`=-2737.17, `position_z`=34.8652, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=8692;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 4.1628 yards).
UPDATE `gameobject` SET `position_x`=-1008.8, `position_y`=-2537.52, `position_z`=59.8594, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=8863;

-- Correct position of Goldthorn in Badlands (position is off by 0.473346 yards).
UPDATE `gameobject` SET `position_x`=-6627.56, `position_y`=-2827.04, `position_z`=255.113, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=8647;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.298276 yards).
UPDATE `gameobject` SET `position_x`=-1194.23, `position_y`=-1973.19, `position_z`=70.4671, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=8711;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.456175 yards).
UPDATE `gameobject` SET `position_x`=-1344.72, `position_y`=-2790.36, `position_z`=55.4686, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=8777;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 1.19245 yards).
UPDATE `gameobject` SET `position_x`=-911.921, `position_y`=-1891.85, `position_z`=71.4452, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=8754;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 0.928379 yards).
UPDATE `gameobject` SET `position_x`=601.492, `position_y`=-257.09, `position_z`=152.942, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=8680;

-- Correct position of Goldthorn in Badlands (position is off by 2.46737 yards).
UPDATE `gameobject` SET `position_x`=-7199.49, `position_y`=-2282.15, `position_z`=256.879, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=8814;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.738364 yards).
UPDATE `gameobject` SET `position_x`=-10591.3, `position_y`=-2884.23, `position_z`=35.5221, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=9088;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.966932 yards).
UPDATE `gameobject` SET `position_x`=-1008.22, `position_y`=-1751.14, `position_z`=46.6344, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=8820;

-- Correct position of Goldthorn in Arathi Highlands (position is off by 0.481374 yards).
UPDATE `gameobject` SET `position_x`=-1264.6, `position_y`=-2940.26, `position_z`=43.759, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=8934;

-- Correct position of Goldthorn in Feralas (position is off by 0.505336 yards).
UPDATE `gameobject` SET `position_x`=-3801.2, `position_y`=2052.18, `position_z`=74.8953, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=8832;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.4073 yards).
UPDATE `gameobject` SET `position_x`=-13322.3, `position_y`=-30.7243, `position_z`=21.0645, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=9121;

-- Correct position of Goldthorn in The Hinterlands (position is off by 0.807327 yards).
UPDATE `gameobject` SET `position_x`=-81.7064, `position_y`=-3537.64, `position_z`=120.173, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=8710;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 2.57969 yards).
UPDATE `gameobject` SET `position_x`=-11602.6, `position_y`=621.821, `position_z`=50.7443, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=9116;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.00135 yards).
UPDATE `gameobject` SET `position_x`=-12020, `position_y`=-155.049, `position_z`=41.7223, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=8972;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.15243 yards).
UPDATE `gameobject` SET `position_x`=-13427.6, `position_y`=603.917, `position_z`=42.9791, `orientation`=3.57793, `rotation0`=0, `rotation1`=0, `rotation2`=-0.976295, `rotation3`=0.216442 WHERE `guid`=9217;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 0.261614 yards).
UPDATE `gameobject` SET `position_x`=-10101.6, `position_y`=-2908.98, `position_z`=38.0422, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760406, `rotation3`=0.649449 WHERE `guid`=8650;

-- Correct position of Goldthorn in Swamp of Sorrows (position is off by 4.00588 yards).
UPDATE `gameobject` SET `position_x`=-10571.5, `position_y`=-3451.2, `position_z`=34.1387, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=8838;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.04376 yards).
UPDATE `gameobject` SET `position_x`=-12200.4, `position_y`=-102.249, `position_z`=29.2303, `orientation`=3.76991, `rotation0`=0, `rotation1`=0, `rotation2`=-0.951056, `rotation3`=0.309017 WHERE `guid`=8965;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.666134 yards).
UPDATE `gameobject` SET `position_x`=-12624, `position_y`=-274.663, `position_z`=27.0946, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=9078;

-- Correct position of Goldthorn in Alterac Mountains (position is off by 4.97938 yards).
UPDATE `gameobject` SET `position_x`=341.735, `position_y`=-795.433, `position_z`=141.415, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=8851;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 1.05508 yards).
UPDATE `gameobject` SET `position_x`=-11872.6, `position_y`=185.119, `position_z`=22.6955, `orientation`=2.80998, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=9187;

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.300136 yards).
UPDATE `gameobject` SET `position_x`=-12987.7, `position_y`=316.323, `position_z`=31.1341, `orientation`=4.69494, `rotation0`=0, `rotation1`=0, `rotation2`=-0.71325, `rotation3`=0.70091 WHERE `guid`=8861;

-- Missing Goldthorn spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2046, 1, 2689.89, -4126.37, 128.583, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 2046, 1, 3104.62, -4084.42, 103.802, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 2046, 1, 3329.76, -4367.33, 118.698, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 2046, 1, 3369.27, -4188.48, 105.304, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 2046, 1, 3488.25, -4052.56, 104.624, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 2046, 1, 3741.77, -4466.05, 152.379, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 2046, 0, -6921.44, -3104.99, 258.261, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 2046, 0, -6858.53, -3330.96, 245.336, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 2046, 0, -7285.21, -2336.14, 270.69, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 2046, 0, -7242.13, -2386.54, 252.656, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 2046, 0, -10315.6, -2560.88, 32.842, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 2046, 0, -9818.33, -3718.11, 34.2834, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 2046, 0, -10056.8, -2434.46, 32.7377, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 2046, 0, -10237.9, -2486.51, 38.0978, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 2046, 0, -10264.7, -2575.17, 40.6938, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 2046, 0, -10201.9, -2711.19, 29.335, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 2046, 0, -10325.4, -2475.95, 39.1077, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 2046, 0, -10911, -3819.2, 34.7746, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 2046, 0, -10896.3, -3767.41, 57.8128, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 2046, 0, -10798.5, -3760.03, 26.6011, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 2046, 0, -10700.6, -3674.6, 33.9176, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 2046, 0, -10613.8, -2827.23, 35.4732, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 2046, 0, -10059.7, -2787.6, 32.0309, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 2046, 0, -9915.4, -3618.61, 38.8888, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+156, 2046, 0, -10590.3, -2733.19, 34.7039, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 2046, 1, -2472.02, -2875.58, 44.545, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 2046, 1, -4222.87, -2760.22, 44.6807, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 2046, 1, -2414.11, -4040.26, 16.5305, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 2046, 1, -3639.01, -3525.38, 63.3026, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 2046, 1, -2647, -4289.55, 19.7775, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 2046, 1, -2709.08, -2784.29, 65.9484, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 2046, 1, -3133.07, -3684.59, 51.8294, 5.14872, 0, 0, -0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 2046, 1, -2586.54, -3957.19, 19.2201, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 2046, 1, -3570.55, -3437.41, 56.9542, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 2046, 1, -3013.39, -3516.39, 75.8011, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 2046, 1, -2558.18, -3757.4, 36.4821, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 2046, 1, -4451.21, -3462.51, 31.8912, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 2046, 1, -4324.33, -3778.63, 31.5392, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 2046, 1, -4316.18, -3329.95, 34.2893, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 2046, 1, -4297.98, -3019.66, 34.9951, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 2046, 1, -4192.83, -3725.48, 66.4929, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 2046, 1, -3700.95, -3616.7, 62.1052, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 2046, 1, -3358.06, -3347.07, 62.8956, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 2046, 1, -3221.56, -3242.73, 53.6633, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 2046, 1, -3085.58, -3313.35, 51.3842, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 2046, 1, -2941.28, -3898.11, 35.0732, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 2046, 1, -2895.95, -4142.72, 59.94, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 2046, 1, -2259.19, -4276.45, 15.6076, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+48, 2046, 0, -12776.1, 269.979, 16.8659, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 2046, 0, -12652.4, -763.995, 57.6516, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 2046, 0, -12103.3, -795.352, 45.2794, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 2046, 0, -12034.3, 138.011, 18.8933, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 2046, 0, -12773.8, -215.173, 37.9271, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 2046, 0, -13646.9, 350.781, 50.8679, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 2046, 0, -12165.6, -532.823, 31.4166, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 2046, 0, -12520.5, -719.582, 40.9531, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 2046, 0, -14118.3, -86.2741, 10.6672, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 2046, 0, -14100.3, 169.757, 25.3825, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 2046, 0, -13655.9, -263.221, 8.17556, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 2046, 0, -13487.6, 258.03, 32.0391, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 2046, 0, -13405.4, 8.44661, 26.6973, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 2046, 0, -13072.9, -751.888, 89.3796, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 2046, 0, -12979, 111.059, 38.4194, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 2046, 0, -12978.1, -737.656, 55.4423, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 2046, 0, -12976.9, -792.139, 68.66, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 2046, 0, -12975.2, -572.484, 63.2591, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 2046, 0, -12974.7, -292.99, 12.7081, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 2046, 0, -12974.2, -809.106, 71.4965, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 2046, 0, -12963.7, -641.337, 53.2888, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 2046, 0, -12946.4, 386.505, 32.6579, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 2046, 0, -12880.7, -487.855, 49.0174, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 2046, 0, -12867.8, -742.715, 66.5625, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 2046, 0, -12783.3, -861.34, 77.0613, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 2046, 0, -12730.2, -911.51, 68.114, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 2046, 0, -12684.8, -448.53, 32.1358, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 2046, 0, -12541.6, -432.074, 33.6578, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 2046, 0, -12488.5, -135.226, 14.1769, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 2046, 0, -12430.4, -946.587, 42.8795, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 2046, 0, -12338.7, -882.249, 49.0126, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 2046, 0, -12254, -880.427, 22.8753, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 2046, 0, -12064.3, -892.214, 61.0584, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 2046, 0, -11989.2, -302.561, 35.3932, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 2046, 0, -11838.5, 351.454, 43.381, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 2046, 0, -11662.5, -651.957, 29.5929, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+84, 2046, 0, 778.003, -343.424, 150.982, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 2046, 0, 874.433, -211.295, 133.795, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 2046, 0, 926.029, -279.575, 145, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 2046, 0, 604.806, -744.798, 176.252, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 2046, 0, 381.352, -626.85, 162.435, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 2046, 0, 405.361, -570.059, 167.804, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 2046, 0, 1163.05, -317.217, 49.2065, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 2046, 0, 408.782, -316.026, 163.549, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 2046, 0, 746.137, -986.213, 164.649, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 2046, 0, 752.568, -899.055, 162.728, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 2046, 0, 925.567, -276.475, 144.031, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 2046, 0, 1102.51, -477.82, 91.9287, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+96, 2046, 0, -1299.32, -2316.38, 61.1865, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 2046, 0, -1195.1, -3645.17, 61.0922, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 2046, 0, -891.027, -3056.27, 90.9899, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 2046, 0, -843.388, -1725.92, 58.0707, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 2046, 0, -678.993, -2016.39, 59.6948, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 2046, 0, -804.534, -3596.95, 78.1736, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 2046, 0, -1968.88, -2554.31, 75.2514, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 2046, 0, -1274.86, -1488.95, 62.0622, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 2046, 0, -1645.62, -1495.3, 49.6567, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 2046, 0, -1854.84, -1542.01, 64.4842, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 2046, 0, -975.522, -3707.89, 99.7785, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 2046, 0, -1853.14, -2781.02, 62.6143, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 2046, 0, -2069.82, -2537.25, 80.8448, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 2046, 0, -793.96, -3207.02, 87.3358, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+110, 2046, 0, -1789.37, -2527.05, 59.8264, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+111, 2046, 0, -806.16, -3584.53, 81.9184, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+112, 2046, 0, -1938.13, -2390.06, 77.0251, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 2046, 0, -1143.61, -2419.61, 52.9614, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+114, 2046, 0, 213.36, -3447.47, 152.571, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+115, 2046, 0, 461.521, -3311.35, 123.003, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10), 
(@OGUID+116, 2046, 0, 120.831, -4352.99, 121.36, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), 
(@OGUID+117, 2046, 0, -230.018, -4438.47, 20.1907, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+118, 2046, 0, -9.83615, -4469.2, 155.765, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+119, 2046, 0, -412.539, -2738.74, 110.711, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10), 
(@OGUID+120, 2046, 0, -338.307, -3010.14, 99.9366, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+121, 2046, 0, -57.5888, -4553.34, 16.4739, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 2046, 0, 397.232, -4102.64, 119.983, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10);

-- Missing Goldthorn spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+123, 2046, 1, -3552.46, 2371.1, 79.5589, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+124, 2046, 1, -4025.22, 2287.75, 24.822, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+125, 2046, 1, -4001.88, 1937.13, 105.72, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), 
(@OGUID+126, 2046, 1, -3999.66, 219.765, 75.7146, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+127, 2046, 1, -4755.83, 708.226, 71.9197, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10), 
(@OGUID+128, 2046, 1, -5524.98, 1042.34, 124.109, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 1, 100, 0, 10), 
(@OGUID+129, 2046, 1, -4782.09, 1235.58, 115.628, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+130, 2046, 1, -4738.59, 823.524, 141.484, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+131, 2046, 1, -3028.14, 2512.9, 55.2185, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10), 
(@OGUID+132, 2046, 1, -4951.97, 172.805, 67.5288, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), 
(@OGUID+133, 2046, 1, -5125.62, 1134.26, 92.5124, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+134, 2046, 1, -5815.48, 1328.89, 73.17, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+135, 2046, 1, -2877.14, 2099.61, 53.0593, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+136, 2046, 1, -5543.7, 1106.71, 69.3718, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+137, 2046, 1, -5849.93, 1498.83, 86.9555, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+138, 2046, 1, -3082.83, 2815.37, 94.9709, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10), 
(@OGUID+139, 2046, 1, -3519.65, 2754.67, 96.079, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+140, 2046, 1, -4935.56, 1175.7, 75.7224, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10), 
(@OGUID+141, 2046, 1, -5266.91, 145.533, 70.0602, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 2046, 1, -5117.77, 1161.25, 89.4788, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 2046, 1, -5102.07, 1494.4, 58.2682, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10),
(@OGUID+144, 2046, 1, -5031.07, 1242.96, 59.0136, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+145, 2046, 1, -4870.05, 112.005, 91.8631, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+146, 2046, 1, -4535.08, -160.486, 90.3256, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+147, 2046, 1, -4493.92, 720.847, 70.0898, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+148, 2046, 1, -4489.16, 2211.1, 15.0829, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+149, 2046, 1, -4307.46, 651.262, 80.2853, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100, 0, 10),
(@OGUID+150, 2046, 1, -4091.54, 2055.09, 90.7127, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+151, 2046, 1, -3992.67, -115.993, 148.908, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+152, 2046, 1, -3835.27, 2034.27, 80.7417, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+153, 2046, 1, -3611.08, 2022.71, 81.4454, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+154, 2046, 1, -3440.92, 2482.84, 50.1359, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+155, 2046, 1, -2729.44, 2550.14, 86.9635, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+2, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+3, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+4, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+5, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+6, 1308, 0, 'Goldthorn', 0, 10), -- Goldthorn in Azshara 41 objects total
(@OGUID+7, 1283, 0, 'Goldthorn', 0, 10), -- Goldthorn in Badlands 41 objects total
(@OGUID+8, 1283, 0, 'Goldthorn', 0, 10), -- Goldthorn in Badlands 41 objects total
(@OGUID+9, 1283, 0, 'Goldthorn', 0, 10), -- Goldthorn in Badlands 41 objects total
(@OGUID+10, 1283, 0, 'Goldthorn', 0, 10), -- Goldthorn in Badlands 41 objects total
(@OGUID+11, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+12, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (1) 34 objects total
(@OGUID+13, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+14, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+15, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+16, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+17, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+18, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+19, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (1) 34 objects total
(@OGUID+20, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+21, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+22, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+23, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+24, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+156, 1313, 0, 'Goldthorn', 0, 10), -- Goldthorn in Swamp of Sorrows (2) 56 objects total
(@OGUID+25, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+26, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+27, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+28, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+29, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+30, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+31, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+32, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+33, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+34, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+35, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+36, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+37, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+38, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+39, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+40, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+41, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+42, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+43, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+44, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+45, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+46, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+47, 1103, 0, 'Goldthorn', 0, 10), -- Goldthorn in Dustwallow Marsh 9 objects total
(@OGUID+48, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+49, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+50, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+51, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+52, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+53, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+54, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+55, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+56, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+57, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+58, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+59, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+60, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+61, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+62, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+63, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+64, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+65, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+66, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+67, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+68, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+69, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+70, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+71, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+72, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+73, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+74, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+75, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+76, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+77, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+78, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+79, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+80, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+81, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+82, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+83, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn 184 objects total
(@OGUID+84, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+85, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+86, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+87, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+88, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+89, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+90, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+91, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+92, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+93, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+94, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+95, 1058, 0, 'Goldthorn', 0, 10), -- Goldthorn in Alterac 81 objects total
(@OGUID+96, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+97, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+98, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+99, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+100, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+101, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+102, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+103, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+104, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+105, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+106, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+107, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+108, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+109, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+110, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+111, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+112, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+113, 1181, 0, 'Goldthorn', 0, 10), -- Goldthorn in Arathi 120 objects total
(@OGUID+114, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+115, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+116, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+117, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+118, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+119, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+120, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+121, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+122, 1249, 0, 'Goldthorn', 0, 10), -- Goldthron in Hinterlands 50 objects total
(@OGUID+123, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+124, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+125, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+126, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+127, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+128, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+129, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+130, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+131, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+132, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+133, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+134, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+135, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+136, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+137, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+138, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+139, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+140, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+141, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+142, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+143, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+144, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+145, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+146, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+147, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+148, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+149, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+150, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+151, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+152, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+153, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+154, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas 26 objects total
(@OGUID+155, 1191, 0, 'Goldthorn', 0, 10); -- Goldthorn in Feralas 26 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Goldthorn in Azshara' WHERE  `entry`=1308;
DELETE FROM `pool_gameobject` WHERE `guid` IN (8614, 8670, 8671, 8678, 8695, 8724, 8725, 8726, 8727, 8728, 8732, 8794, 8795, 8796, 8808, 8835, 8857, 8913, 8914, 8915, 8916, 8956, 8957, 8958, 8959, 9016, 9021, 9068, 9070, 9085, 9086, 30629, 30877);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(8695, 1313, 0, 'Goldthorn', 0, 10), 
(30629, 1313, 0, 'Goldthorn', 0, 10), 
(30877, 1313, 0, 'Goldthorn', 0, 10);
UPDATE `pool_template` SET `description`='Goldthorn in Badlands' WHERE  `entry`=1283;
UPDATE `pool_template` SET `description`='Goldthorn in Dustwallow Marsh' WHERE  `entry`=1103;
UPDATE `pool_template` SET `description`='Goldthorn in Feralas' WHERE  `entry`=1191;
UPDATE `pool_template` SET `description`='Goldthorn in Stranglethorn' WHERE  `entry`=1174;
UPDATE `pool_template` SET `description`='Goldthorn in Swamp of Sorrows' WHERE  `entry`=1313;
UPDATE `pool_template` SET `description`='Goldthorn in Hinterlands' WHERE  `entry`=1249;
UPDATE `pool_gameobject` SET `description`='Goldthorn' WHERE  `guid` IN (55946, 55947, 55968, 55971, 55994, 56013, 56048);

-- Remove Custom Spawns (None of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (8823, 9125, 9198, 8757, 8843, 8890, 9161, 9035, 9071, 9040, 8883, 8969, 8748, 8629, 8933, 8692, 8608, 8611, 8612, 8614, 8615, 8619, 8622, 8624, 8625, 8628, 8630, 8631, 8632, 8633, 8634, 8635, 8639, 8640, 8642, 8649, 8651, 8652, 8653, 8655, 8656, 8659, 8662, 8665, 8667, 8668, 8670, 8671, 8672, 8673, 8674, 8676, 8677, 8678, 8685, 8686, 8688, 8696, 8697, 8698, 8699, 8700, 8701, 8703, 8704, 8705, 8715, 8717, 8719, 8720, 8722, 8724, 8725, 8726, 8727, 8728, 8730, 8732, 8733, 8734, 8735, 8736, 8738, 8742, 8743, 8744, 8745, 8752, 8758, 8759, 8760, 8761, 8762, 8765, 8767, 8768, 8774, 8775, 8779, 8782, 8785, 8786, 8787, 8790, 8791, 8792, 8793, 8794, 8795, 8796, 8798, 8799, 8801, 8802, 8804, 8806, 8807, 8808, 8809, 8810, 8811, 8812, 8813, 8815, 8818, 8819, 8824, 8825, 8828, 8829, 8830, 8831, 8833, 8834, 8835, 8836, 8837, 8839, 8840, 8841, 8842, 8847, 8849, 8850, 8852, 8853, 8855, 8857, 8859, 8860, 8862, 8864, 8865, 8866, 8867, 8868, 8869, 8870, 8871, 8878, 8879, 8880, 8881, 8882, 8884, 8885, 8889, 8891, 8892, 8893, 8895, 8897, 8898, 8900, 8901, 8903, 8904, 8905, 8907, 8908, 8909, 8910, 8913, 8914, 8915, 8916, 8918, 8919, 8920, 8921, 8922, 8923, 8924, 8926, 8927, 8928, 8930, 8931, 8935, 8936, 8937, 8938, 8939, 8940, 8941, 8942, 8943, 8944, 8945, 8946, 8947, 8948, 8949, 8952, 8953, 8954, 8955, 8956, 8957, 8958, 8959, 8960, 8961, 8962, 8963, 8967, 8968, 8971, 8973, 8976, 8978, 8980, 8982, 8984, 8986, 8987, 8991, 8993, 8994, 8995, 8998, 8999, 9002, 9003, 9004, 9005, 9008, 9009, 9010, 9011, 9013, 9014, 9015, 9016, 9018, 9020, 9021, 9022, 9025, 9026, 9027, 9028, 9030, 9031, 9036, 9039, 9041, 9043, 9044, 9045, 9046, 9048, 9050, 9051, 9053, 9054, 9055, 9057, 9060, 9061, 9065, 9066, 9067, 9068, 9069, 9070, 9072, 9073, 9075, 9076, 9084, 9085, 9086, 9089, 9090, 9092, 9093, 9094, 9095, 9100, 9101, 9103, 9105, 9106, 9107, 9108, 9109, 9110, 9111, 9112, 9117, 9120, 9123, 9127, 9129, 9132, 9133, 9135, 9136, 9137, 9138, 9139, 9140, 9141, 9142, 9143, 9146, 9147, 9148, 9149, 9150, 9151, 9152, 9155, 9156, 9160, 9162, 9163, 9164, 9165, 9166, 9167, 9168, 9169, 9170, 9171, 9177, 9178, 9179, 9180, 9181, 9182, 9184, 9186, 9190, 9191, 9192, 9193, 9194, 9195, 9196, 9197, 9199, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9213, 9214, 9216, 9220, 40022);
DELETE FROM `pool_gameobject` WHERE `guid` IN (8823, 9125, 9198, 8757, 8843, 8890, 9161, 9035, 9071, 9040, 8883, 8969, 8748, 8629, 8933, 8692, 8608, 8611, 8612, 8614, 8615, 8619, 8622, 8624, 8625, 8628, 8630, 8631, 8632, 8633, 8634, 8635, 8639, 8640, 8642, 8649, 8651, 8652, 8653, 8655, 8656, 8659, 8662, 8665, 8667, 8668, 8670, 8671, 8672, 8673, 8674, 8676, 8677, 8678, 8685, 8686, 8688, 8696, 8697, 8698, 8699, 8700, 8701, 8703, 8704, 8705, 8715, 8717, 8719, 8720, 8722, 8724, 8725, 8726, 8727, 8728, 8730, 8732, 8733, 8734, 8735, 8736, 8738, 8742, 8743, 8744, 8745, 8752, 8758, 8759, 8760, 8761, 8762, 8765, 8767, 8768, 8774, 8775, 8779, 8782, 8785, 8786, 8787, 8790, 8791, 8792, 8793, 8794, 8795, 8796, 8798, 8799, 8801, 8802, 8804, 8806, 8807, 8808, 8809, 8810, 8811, 8812, 8813, 8815, 8818, 8819, 8824, 8825, 8828, 8829, 8830, 8831, 8833, 8834, 8835, 8836, 8837, 8839, 8840, 8841, 8842, 8847, 8849, 8850, 8852, 8853, 8855, 8857, 8859, 8860, 8862, 8864, 8865, 8866, 8867, 8868, 8869, 8870, 8871, 8878, 8879, 8880, 8881, 8882, 8884, 8885, 8889, 8891, 8892, 8893, 8895, 8897, 8898, 8900, 8901, 8903, 8904, 8905, 8907, 8908, 8909, 8910, 8913, 8914, 8915, 8916, 8918, 8919, 8920, 8921, 8922, 8923, 8924, 8926, 8927, 8928, 8930, 8931, 8935, 8936, 8937, 8938, 8939, 8940, 8941, 8942, 8943, 8944, 8945, 8946, 8947, 8948, 8949, 8952, 8953, 8954, 8955, 8956, 8957, 8958, 8959, 8960, 8961, 8962, 8963, 8967, 8968, 8971, 8973, 8976, 8978, 8980, 8982, 8984, 8986, 8987, 8991, 8993, 8994, 8995, 8998, 8999, 9002, 9003, 9004, 9005, 9008, 9009, 9010, 9011, 9013, 9014, 9015, 9016, 9018, 9020, 9021, 9022, 9025, 9026, 9027, 9028, 9030, 9031, 9036, 9039, 9041, 9043, 9044, 9045, 9046, 9048, 9050, 9051, 9053, 9054, 9055, 9057, 9060, 9061, 9065, 9066, 9067, 9068, 9069, 9070, 9072, 9073, 9075, 9076, 9084, 9085, 9086, 9089, 9090, 9092, 9093, 9094, 9095, 9100, 9101, 9103, 9105, 9106, 9107, 9108, 9109, 9110, 9111, 9112, 9117, 9120, 9123, 9127, 9129, 9132, 9133, 9135, 9136, 9137, 9138, 9139, 9140, 9141, 9142, 9143, 9146, 9147, 9148, 9149, 9150, 9151, 9152, 9155, 9156, 9160, 9162, 9163, 9164, 9165, 9166, 9167, 9168, 9169, 9170, 9171, 9177, 9178, 9179, 9180, 9181, 9182, 9184, 9186, 9190, 9191, 9192, 9193, 9194, 9195, 9196, 9197, 9199, 9200, 9201, 9202, 9203, 9204, 9205, 9206, 9207, 9208, 9213, 9214, 9216, 9220, 40022);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2046);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1174;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1191;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1249;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1181;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1058;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1103;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1283;
UPDATE `pool_template` SET `max_limit`=2 WHERE  `entry`=1308;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1313;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
