DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230610133401');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230610133401');
-- Add your query below.


-- Fadeleaf (2042)
SET @OGUID = 28934;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 1.10262 yards).
UPDATE `gameobject` SET `position_x`=-962.771, `position_y`=-3266.38, `position_z`=66.1804, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=7587;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.05614 yards).
UPDATE `gameobject` SET `position_x`=-11713.7, `position_y`=-432.975, `position_z`=19.4633, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=7599;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.190587 yards).
UPDATE `gameobject` SET `position_x`=-10518.9, `position_y`=-2573.61, `position_z`=21.8643, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=7802;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.550355 yards).
UPDATE `gameobject` SET `position_x`=-1133.5, `position_y`=-1909.23, `position_z`=78.3627, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=7648;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 2.87648 yards).
UPDATE `gameobject` SET `position_x`=-1735.1, `position_y`=-2164.65, `position_z`=47.8397, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=7612;

-- Correct position of Fadeleaf in Badlands (position is off by 0.921125 yards).
UPDATE `gameobject` SET `position_x`=-6618.82, `position_y`=-3690.58, `position_z`=265.84, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid`=7711;

-- Correct position of Fadeleaf in Badlands (position is off by 1.78344 yards).
UPDATE `gameobject` SET `position_x`=-6881.77, `position_y`=-3426.21, `position_z`=243.933, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=7626;

-- Correct position of Fadeleaf in Badlands (position is off by 1.29097 yards).
UPDATE `gameobject` SET `position_x`=-6528.05, `position_y`=-2963.68, `position_z`=268.539, `orientation`=4.88692, `rotation0`=0, `rotation1`=0, `rotation2`=-0.642787, `rotation3`=0.766045 WHERE `guid`=7638;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 2.87195 yards).
UPDATE `gameobject` SET `position_x`=-10519.8, `position_y`=-2715.92, `position_z`=27.669, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=7816;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.566124 yards).
UPDATE `gameobject` SET `position_x`=-12210.5, `position_y`=258.976, `position_z`=2.65565, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=7729;

-- Correct position of Fadeleaf in Dustwallow Marsh (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3857.14, `position_y`=-3771.82, `position_z`=40.9882, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=56012;

-- Correct position of Fadeleaf in Badlands (position is off by 1.37533 yards).
UPDATE `gameobject` SET `position_x`=-6980.8, `position_y`=-3664.64, `position_z`=244.664, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=7666;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.09724 yards).
UPDATE `gameobject` SET `position_x`=-10360.5, `position_y`=-3081.84, `position_z`=22.9691, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=7586;

-- Correct position of Fadeleaf in Badlands (position is off by 0.198024 yards).
UPDATE `gameobject` SET `position_x`=-6731.13, `position_y`=-2966.87, `position_z`=242.798, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=7553;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-1044.91, `position_y`=-3256.63, `position_z`=39.844, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=7793;

-- Correct position of Fadeleaf in Badlands (position is off by 1.77033 yards).
UPDATE `gameobject` SET `position_x`=-7059.57, `position_y`=-3684.33, `position_z`=244.418, `orientation`=1.41372, `rotation0`=0, `rotation1`=0, `rotation2`=0.649447, `rotation3`=0.760406 WHERE `guid`=7565;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.856531 yards).
UPDATE `gameobject` SET `position_x`=-11847.3, `position_y`=-219.508, `position_z`=16.5659, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=7784;

-- Correct position of Fadeleaf in Badlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6722.4, `position_y`=-3084.46, `position_z`=282.649, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=7745;

-- Correct position of Fadeleaf in Arathi Highlands (position is off by 0.595912 yards).
UPDATE `gameobject` SET `position_x`=-1288.56, `position_y`=-2720.4, `position_z`=49.7565, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=7669;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.04005 yards).
UPDATE `gameobject` SET `position_x`=-10575.1, `position_y`=-2717.64, `position_z`=26.3707, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=7643;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.17982 yards).
UPDATE `gameobject` SET `position_x`=-11734.6, `position_y`=533.32, `position_z`=52.3443, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=7807;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 1.07105 yards).
UPDATE `gameobject` SET `position_x`=-12041.2, `position_y`=-728.706, `position_z`=12.7299, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=7695;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.92333 yards).
UPDATE `gameobject` SET `position_x`=-10090.8, `position_y`=-2489.23, `position_z`=28.7696, `orientation`=2.16421, `rotation0`=0, `rotation1`=0, `rotation2`=0.882947, `rotation3`=0.469473 WHERE `guid`=7673;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.731097 yards).
UPDATE `gameobject` SET `position_x`=-10226.4, `position_y`=-2623.05, `position_z`=27.6343, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=7803;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.453782 yards).
UPDATE `gameobject` SET `position_x`=-10258.4, `position_y`=-3230.2, `position_z`=23.499, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=7754;

-- Correct position of Fadeleaf in Badlands (position is off by 2.07676 yards).
UPDATE `gameobject` SET `position_x`=-6683.26, `position_y`=-3350.68, `position_z`=242.174, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=7821;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 0.14408 yards).
UPDATE `gameobject` SET `position_x`=-10388.1, `position_y`=-2976.57, `position_z`=22.862, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=7735;

-- Correct position of Fadeleaf in Swamp of Sorrows (position is off by 1.14637 yards).
UPDATE `gameobject` SET `position_x`=-10195.3, `position_y`=-3118.81, `position_z`=21.7411, `orientation`=0.104719, `rotation0`=0, `rotation1`=0, `rotation2`=0.0523357, `rotation3`=0.99863 WHERE `guid`=7737;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.243724 yards).
UPDATE `gameobject` SET `position_x`=-12153.8, `position_y`=-133.861, `position_z`=25.7315, `orientation`=2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=0.358368 WHERE `guid`=7713;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 3.61731 yards).
UPDATE `gameobject` SET `position_x`=-12274.3, `position_y`=19.2027, `position_z`=21.7572, `orientation`=4.46804, `rotation0`=0, `rotation1`=0, `rotation2`=-0.788011, `rotation3`=0.615662 WHERE `guid`=40016;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 3.39585 yards).
UPDATE `gameobject` SET `position_x`=-11991.6, `position_y`=-73.0549, `position_z`=14.1161, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=7743;

-- Missing Fadeleaf spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2042, 0, -6501.88, -3619.97, 260.069, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+2, 2042, 0, -10524.5, -2786.96, 22.6642, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 2042, 0, -10267.7, -2699.44, 24.5102, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 2042, 0, -10146.7, -3321.11, 22.7876, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 2042, 1, -2481.14, -3219.62, 35.9511, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 2042, 1, -2591.81, -3483.11, 33.8229, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 2042, 1, -2987.04, -3287.98, 37.2054, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 2042, 1, -3835.82, -2891.23, 36.5356, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 2042, 1, -3987.46, -3743.76, 39.7388, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 2042, 1, -2870.47, -3264.87, 39.1876, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 2042, 1, -2754.31, -4006.38, 34.812, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 2042, 1, -3109.08, -3700.12, 39.3471, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 2042, 1, -4382.1, -3647.11, 37.934, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 2042, 1, -4703.95, -3314.7, 40.1485, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 2042, 1, -4116.77, -3717.97, 38.7925, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 2042, 1, -3994.96, -3401.22, 38.2663, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 2042, 1, -2949.28, -3553.61, 41.7896, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 2042, 1, -2854.24, -2805.58, 35.889, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 2042, 0, -11924.6, -177.015, 17.2601, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+20, 2042, 0, -12317.7, -116.954, 21.0686, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+21, 2042, 0, -11555.8, -652.515, 31.7594, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+22, 2042, 0, -11669.9, 776.653, 50.7218, 0.95993, 0, 0, 0.461748, 0.887011, 300, 300, 1, 100, 0, 10), 
(@OGUID+23, 2042, 0, -11678.6, 644.356, 49.927, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 2042, 0, -11620.3, -425.414, 16.3321, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 2042, 0, 295.734, -670.961, 134.586, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 2042, 0, 411.041, 121.515, 42.3566, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 2042, 0, 6.72537, -35.8818, 95.798, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 2042, 0, 171.56, -30.6048, 71.7803, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 2042, 0, 11.9988, 179.588, 45.3398, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 2042, 0, 692.225, -1384.84, 99.6657, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 2042, 0, 1106.82, -353.518, 43.0181, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 2042, 0, 625.747, -1149.7, 156.467, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 2042, 0, 1127.37, -448.569, 65.8939, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+34, 2042, 0, -914.123, -3341.35, 75.6305, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 2042, 0, -1820.37, -2332.3, 34.2472, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 2042, 0, -1659.83, -3041.93, 25.1543, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 2042, 0, -668.487, -2055.72, 56.3554, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10);

-- Missing Fadeleaf spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+38, 2042, 0, 103.044, -2881.95, 113.757, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 2042, 0, 73.3306, -2575.64, 110.622, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+40, 2042, 0, 29.2546, -3312.49, 116.929, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 2042, 0, 130.193, -3739.45, 125.82, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 2042, 0, 121.778, -3088.08, 129.892, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 2042, 0, -173.593, -2784.15, 118.585, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 2042, 0, 62.7072, -4282.95, 116.939, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 2042, 0, 264.196, -3832.07, 143.696, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1285, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Badlands 7 objects total
(@OGUID+2, 1311, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Swamp of Sorrows 7 objects total
(@OGUID+3, 1311, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Swamp of Sorrows 7 objects total
(@OGUID+4, 1311, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Swamp of Sorrows 7 objects total
(@OGUID+5, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+6, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+7, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+8, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+9, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+10, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+11, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+12, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+13, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+14, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+15, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+16, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+17, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+18, 1328, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Dustwallow Marsh 7 objects total
(@OGUID+19, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+20, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+21, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+22, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+23, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+24, 1172, 0, 'Fadeleaf', 0, 10), -- Fadeleaf in Stranglethorn 34 objects total
(@OGUID+25, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+26, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+27, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+28, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+29, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+30, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+31, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+32, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+33, 1071, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Alterac 33 objects total
(@OGUID+34, 1183, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Arathi 55 objects total
(@OGUID+35, 1183, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Arathi 55 objects total
(@OGUID+36, 1183, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Arathi 55 objects total
(@OGUID+37, 1183, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Arathi 55 objects total
(@OGUID+38, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+39, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+40, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+41, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+42, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+43, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+44, 1252, 0, 'Fadeleaf', 0, 10), -- Fadeleafs in Hinterlands 29 objects total
(@OGUID+45, 1252, 0, 'Fadeleaf', 0, 10); -- Fadeleafs in Hinterlands 29 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Fadeleaf in Dustwallow Marsh' WHERE  `entry`=1328;
UPDATE `pool_template` SET `description`='Fadeleaf in Stranglethorn' WHERE  `entry`=1172;
UPDATE `pool_template` SET `description`='Fadeleaf in Arathi Highlands' WHERE  `entry`=1183;
UPDATE `pool_template` SET `description`='Fadeleaf in Badlands' WHERE  `entry`=1285;
UPDATE `pool_template` SET `description`='Fadeleaf in Hinterlands' WHERE  `entry`=1252;
UPDATE `pool_template` SET `description`='Fadeleaf in Swamp of Sorrows' WHERE  `entry`=1311;
UPDATE `pool_template` SET `description`='Fadeleaf in Alterac Mountains' WHERE  `entry`=1071;
UPDATE `pool_gameobject` SET `description`='Fadeleaf' WHERE  `guid` IN (55952, 56012, 56015, 56017, 56028);

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (7563, 7726, 7631, 7558, 7560, 7562, 7566, 7570, 7571, 7572, 7575, 7576, 7577, 7578, 7579, 7580, 7581, 7582, 7584, 7585, 7588, 7589, 7590, 7592, 7593, 7594, 7595, 7596, 7601, 7603, 7604, 7605, 7606, 7607, 7610, 7611, 7617, 7618, 7619, 7620, 7624, 7627, 7628, 7629, 7630, 7632, 7640, 7641, 7642, 7644, 7645, 7646, 7647, 7649, 7653, 7654, 7655, 7657, 7659, 7661, 7662, 7665, 7667, 7668, 7670, 7672, 7677, 7678, 7687, 7688, 7689, 7690, 7693, 7697, 7699, 7702, 7704, 7712, 7714, 7715, 7717, 7718, 7719, 7720, 7721, 7723, 7730, 7732, 7738, 7741, 7742, 7744, 7746, 7747, 7748, 7749, 7750, 7751, 7753, 7755, 7756, 7759, 7760, 7765, 7768, 7769, 7770, 7771, 7772, 7773, 7774, 7776, 7777, 7780, 7781, 7783, 7785, 7787, 7789, 7792, 7794, 7797, 7799, 7801, 7804, 7813, 7818, 7820, 7822, 7823, 7824, 7828, 7829);
DELETE FROM `pool_gameobject` WHERE `guid` IN (7563, 7726, 7631, 7558, 7560, 7562, 7566, 7570, 7571, 7572, 7575, 7576, 7577, 7578, 7579, 7580, 7581, 7582, 7584, 7585, 7588, 7589, 7590, 7592, 7593, 7594, 7595, 7596, 7601, 7603, 7604, 7605, 7606, 7607, 7610, 7611, 7617, 7618, 7619, 7620, 7624, 7627, 7628, 7629, 7630, 7632, 7640, 7641, 7642, 7644, 7645, 7646, 7647, 7649, 7653, 7654, 7655, 7657, 7659, 7661, 7662, 7665, 7667, 7668, 7670, 7672, 7677, 7678, 7687, 7688, 7689, 7690, 7693, 7697, 7699, 7702, 7704, 7712, 7714, 7715, 7717, 7718, 7719, 7720, 7721, 7723, 7730, 7732, 7738, 7741, 7742, 7744, 7746, 7747, 7748, 7749, 7750, 7751, 7753, 7755, 7756, 7759, 7760, 7765, 7768, 7769, 7770, 7771, 7772, 7773, 7774, 7776, 7777, 7780, 7781, 7783, 7785, 7787, 7789, 7792, 7794, 7797, 7799, 7801, 7804, 7813, 7818, 7820, 7822, 7823, 7824, 7828, 7829);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2042);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1172;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1252;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1183;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1071;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1285;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1311;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1328;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
