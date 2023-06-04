DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230604125023');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230604125023');
-- Add your query below.


-- Briarthorn (1621, 3729)
SET @OGUID = 38544;

-- Correct position of Briarthorn in Duskwood (position is off by 1.09988 yards).
UPDATE `gameobject` SET `position_x`=-10743.1, `position_y`=-646.991, `position_z`=41.3031, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=2726;

-- Correct position of Briarthorn in Duskwood (position is off by 1.41217 yards).
UPDATE `gameobject` SET `position_x`=-10705.2, `position_y`=-942.698, `position_z`=76.341, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=2688;

-- Correct position of Briarthorn in Duskwood (position is off by 0.400487 yards).
UPDATE `gameobject` SET `position_x`=-10871.4, `position_y`=-1205, `position_z`=40.8238, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=2757;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.973648 yards).
UPDATE `gameobject` SET `position_x`=429.245, `position_y`=1182.35, `position_z`=87.968, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=2733;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.318784 yards).
UPDATE `gameobject` SET `position_x`=1.00076, `position_y`=-1015.31, `position_z`=57.7936, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=2873;

-- Correct position of Briarthorn in Wetlands (position is off by 0.914336 yards).
UPDATE `gameobject` SET `position_x`=-3183.31, `position_y`=-1111.6, `position_z`=9.17652, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=2623;

-- Correct position of Briarthorn in Duskwood (position is off by 1.51551 yards).
UPDATE `gameobject` SET `position_x`=-10548.4, `position_y`=-1001.86, `position_z`=56.3435, `orientation`=5.55015, `rotation0`=0, `rotation1`=0, `rotation2`=-0.358368, `rotation3`=0.93358 WHERE `guid`=2570;

-- Correct position of Briarthorn in Duskwood (position is off by 0.145931 yards).
UPDATE `gameobject` SET `position_x`=-11018.9, `position_y`=-436.104, `position_z`=30.6316, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=2777;

-- Correct position of Briarthorn in Westfall (position is off by 0.97794 yards).
UPDATE `gameobject` SET `position_x`=-10362.4, `position_y`=784.97, `position_z`=30.9238, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2828;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.429662 yards).
UPDATE `gameobject` SET `position_x`=-870.224, `position_y`=-1329.36, `position_z`=61.0104, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=2657;

-- Correct position of Briarthorn in Ashenvale (position is off by 1.16847 yards).
UPDATE `gameobject` SET `position_x`=3456.74, `position_y`=-1559.22, `position_z`=167.591, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=2616;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.373018 yards).
UPDATE `gameobject` SET `position_x`=-9457.76, `position_y`=-1995.27, `position_z`=96.1887, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=2697;

-- Correct position of Briarthorn in Duskwood (position is off by 0.627573 yards).
UPDATE `gameobject` SET `position_x`=-10179.5, `position_y`=-918.365, `position_z`=36.9741, `orientation`=5.89921, `rotation0`=0, `rotation1`=0, `rotation2`=-0.190808, `rotation3`=0.981627 WHERE `guid`=2606;

-- Correct position of Briarthorn in Duskwood (position is off by 0.489185 yards).
UPDATE `gameobject` SET `position_x`=-10372.8, `position_y`=-1319.4, `position_z`=52.773, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=2608;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 1.3532 yards).
UPDATE `gameobject` SET `position_x`=5.47222, `position_y`=-690.028, `position_z`=75.114, `orientation`=3.3685, `rotation0`=0, `rotation1`=0, `rotation2`=-0.993571, `rotation3`=0.113208 WHERE `guid`=2831;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 1.0928 yards).
UPDATE `gameobject` SET `position_x`=-566.923, `position_y`=-446.173, `position_z`=40.7825, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=2779;

-- Correct position of Briarthorn in Darkshore (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=5261.76, `position_y`=457.867, `position_z`=22.3791, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=2876;

-- Correct position of Briarthorn in Wetlands (position is off by 0.219971 yards).
UPDATE `gameobject` SET `position_x`=-2841, `position_y`=-2588.22, `position_z`=50.771, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=2821;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.603582 yards).
UPDATE `gameobject` SET `position_x`=650.147, `position_y`=1382.63, `position_z`=82.9212, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=2687;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.523939 yards).
UPDATE `gameobject` SET `position_x`=-318.421, `position_y`=120.038, `position_z`=74.9717, `orientation`=5.65487, `rotation0`=0, `rotation1`=0, `rotation2`=-0.309016, `rotation3`=0.951057 WHERE `guid`=2631;

-- Correct position of Briarthorn in Wetlands (position is off by 0.34132 yards).
UPDATE `gameobject` SET `position_x`=-2892.18, `position_y`=-2564.71, `position_z`=33.8779, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=2872;

-- Correct position of Briarthorn in Ashenvale (position is off by 0.445962 yards).
UPDATE `gameobject` SET `position_x`=2048.55, `position_y`=-2083.42, `position_z`=126.551, `orientation`=4.72984, `rotation0`=0, `rotation1`=0, `rotation2`=-0.700909, `rotation3`=0.713251 WHERE `guid`=2798;

-- Correct position of Briarthorn in Wetlands (position is off by 0.0100103 yards).
UPDATE `gameobject` SET `position_x`=-3402.69, `position_y`=-3235.18, `position_z`=23.3301, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=30009;

-- Correct position of Briarthorn in Duskwood (position is off by 0.819507 yards).
UPDATE `gameobject` SET `position_x`=-10656.5, `position_y`=-858.591, `position_z`=54.3311, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=2601;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-9100.39, `position_y`=-2601.52, `position_z`=117.783, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=2692;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.471399 yards).
UPDATE `gameobject` SET `position_x`=102.749, `position_y`=-799.808, `position_z`=79.4666, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=2707;

-- Correct position of Briarthorn in Westfall (position is off by 0.886146 yards).
UPDATE `gameobject` SET `position_x`=-10254.1, `position_y`=1136.24, `position_z`=37.0174, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=2797;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.774465 yards).
UPDATE `gameobject` SET `position_x`=1449.75, `position_y`=1006.43, `position_z`=148.514, `orientation`=3.82227, `rotation0`=0, `rotation1`=0, `rotation2`=-0.942641, `rotation3`=0.333808 WHERE `guid`=2605;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-517.273, `position_y`=1045.46, `position_z`=91.7687, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE `guid`=2795;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.815681 yards).
UPDATE `gameobject` SET `position_x`=1075.61, `position_y`=644.469, `position_z`=131.669, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=2738;

-- Correct position of Briarthorn in Stonetalon Mountains (position is off by 0.879691 yards).
UPDATE `gameobject` SET `position_x`=907.072, `position_y`=1553.71, `position_z`=-15.2808, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.34202 WHERE `guid`=2860;

-- Correct position of Briarthorn in Duskwood (position is off by 1.11485 yards).
UPDATE `gameobject` SET `position_x`=-10894, `position_y`=-1028.04, `position_z`=75.3045, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=2647;

-- Correct position of Briarthorn in Ashenvale (position is off by 0.778387 yards).
UPDATE `gameobject` SET `position_x`=2909.53, `position_y`=-1758.76, `position_z`=203.044, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=2890;

-- Correct position of Briarthorn in Duskwood (position is off by 0.30698 yards).
UPDATE `gameobject` SET `position_x`=-10782.7, `position_y`=-197.056, `position_z`=44.2139, `orientation`=1.09956, `rotation0`=0, `rotation1`=0, `rotation2`=0.522498, `rotation3`=0.85264 WHERE `guid`=2854;

-- Correct position of Briarthorn in Darkshore (position is off by 0.999352 yards).
UPDATE `gameobject` SET `position_x`=6906.65, `position_y`=-17.683, `position_z`=23.9168, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=2624;

-- Correct position of Briarthorn in Darkshore (position is off by 0.745806 yards).
UPDATE `gameobject` SET `position_x`=7287.13, `position_y`=-139.673, `position_z`=14.4423, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=2552;

-- Correct position of Briarthorn in Hillsbrad Foothills (position is off by 0.621596 yards).
UPDATE `gameobject` SET `position_x`=-471.567, `position_y`=-380.558, `position_z`=50.8234, `orientation`=5.86431, `rotation0`=0, `rotation1`=0, `rotation2`=-0.207911, `rotation3`=0.978148 WHERE `guid`=2544;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.958411 yards).
UPDATE `gameobject` SET `position_x`=726.712, `position_y`=1387.03, `position_z`=72.8429, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=2546;

-- Correct position of Briarthorn in Duskwood (position is off by 1.03854 yards).
UPDATE `gameobject` SET `position_x`=-10878, `position_y`=-1103.28, `position_z`=44.7157, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=2589;

-- Correct position of Briarthorn in Westfall (position is off by 0.000200272 yards).
UPDATE `gameobject` SET `position_x`=-11166, `position_y`=503.716, `position_z`=28.6882, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=2889;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.886509 yards).
UPDATE `gameobject` SET `position_x`=-9384.84, `position_y`=-2966.28, `position_z`=81.6427, `orientation`=1.3439, `rotation0`=0, `rotation1`=0, `rotation2`=0.622514, `rotation3`=0.782609 WHERE `guid`=2753;

-- Correct position of Briarthorn in Darkshore (position is off by 1.18454 yards).
UPDATE `gameobject` SET `position_x`=6254, `position_y`=226.941, `position_z`=39.0118, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=2899;

-- Correct position of Briarthorn in Duskwood (position is off by 0.984511 yards).
UPDATE `gameobject` SET `position_x`=-10890.9, `position_y`=-1304.39, `position_z`=51.9561, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=2702;

-- Correct position of Briarthorn in Duskwood (position is off by 1.52466 yards).
UPDATE `gameobject` SET `position_x`=-10728.5, `position_y`=-113.812, `position_z`=36.1879, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=2669;

-- Correct position of Briarthorn in Duskwood (position is off by 1.24467 yards).
UPDATE `gameobject` SET `position_x`=-10623.8, `position_y`=34.726, `position_z`=38.2104, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=2604;

-- Correct position of Briarthorn in Redridge Mountains (position is off by 0.167499 yards).
UPDATE `gameobject` SET `position_x`=-9625.95, `position_y`=-2543.16, `position_z`=59.2279, `orientation`=1.67551, `rotation0`=0, `rotation1`=0, `rotation2`=0.743144, `rotation3`=0.669131 WHERE `guid`=2847;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.382767 yards).
UPDATE `gameobject` SET `position_x`=-550.962, `position_y`=798.357, `position_z`=88.7893, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=2811;

-- Correct position of Briarthorn in Silverpine Forest (position is off by 0.302408 yards).
UPDATE `gameobject` SET `position_x`=-406.846, `position_y`=1350.45, `position_z`=37.2905, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=2903;

-- Correct position of Briarthorn in Westfall (position is off by 0.681363 yards).
UPDATE `gameobject` SET `position_x`=-11104.1, `position_y`=733.351, `position_z`=36.4119, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=2581;

-- Correct position of Briarthorn in Westfall (position is off by 1.18195 yards).
UPDATE `gameobject` SET `position_x`=-11073, `position_y`=1547.72, `position_z`=44.5846, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=40001;

-- Missing Briarthorn spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1621, 0, -10617.7, -913.665, 55.1904, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 1621, 0, -10287.7, -1316.91, 49.2902, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 1621, 0, -10724.6, 431.879, 39.0428, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 1621, 0, -11081.1, 327.136, 31.15, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 1621, 0, -10435.6, 42.7232, 44.7757, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1621, 0, -10887.5, 196.304, 39.2335, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1621, 0, -10953, 150.254, 40.549, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1621, 0, -11056.3, -138.435, 23.7818, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1621, 0, -10213.5, 441.273, 37.4833, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1621, 0, -10282.3, -948.749, 43.6457, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1621, 0, -10265.8, 266.94, 39.2517, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1621, 0, -10915.5, -46.0938, 35.9218, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 1621, 0, -10743.5, -818.935, 51.3517, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1621, 0, -10685.5, -985.969, 70.5648, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 1621, 0, -10562, -802.786, 54.3495, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 1621, 0, -10474, -78.0064, 45.7854, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1621, 0, -10387.3, -1191.86, 43.122, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1621, 0, -10386.6, -798.106, 52.4095, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1621, 0, -10293.4, 27.4344, 49.1362, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1621, 0, -9916.43, -1781.57, 35.1013, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 1621, 0, -2833.1, -1328.37, 8.95405, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1621, 0, -3172.37, -3059.96, 22.3382, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+23, 1621, 0, -3494.52, -1487.17, 9.14602, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10),
(@OGUID+24, 1621, 0, -3311.3, -2263.17, 51.8986, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+25, 1621, 0, -4154.25, -2961.75, 12.0112, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+26, 1621, 0, -3482.48, -2876.22, 9.41632, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+27, 1621, 0, -3067.73, -2692.13, 16.6828, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+28, 1621, 0, -3091.94, -2270.36, 9.32856, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+29, 1621, 0, -3108, -2187.96, 9.23061, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+30, 1621, 0, -3087.76, -2009.68, 9.41214, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10),
(@OGUID+31, 1621, 0, -3798.27, -3003.14, 11.8723, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+32, 1621, 0, -3605.13, -2979.56, 13.0964, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10),
(@OGUID+33, 1621, 0, -3558.61, -1292.08, 10.0193, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 1621, 0, -3399.78, -1586.09, 10.7044, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 1621, 0, -3338.73, -3000.41, 27.5057, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 1621, 0, -3008.33, -1158.85, 9.70504, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1621, 0, -2930.32, -2997.89, 39.0747, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1621, 0, -2917.71, -1810.56, 8.50937, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1621, 0, -2848.61, -2957.88, 36.8177, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 1621, 0, -2845.5, -2193.88, 30.3731, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+41, 1621, 0, -4966.77, -3511.53, 303.927, 3.28124, 0, 0, -0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 1621, 0, -5798.29, -3770.72, 328.856, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 1621, 0, -5465.13, -3792.92, 316.026, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+44, 1621, 0, -5155.06, -3708.79, 311.856, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+45, 1621, 0, -4894.84, -3964.74, 297.991, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 1, 100, 0, 10),
(@OGUID+46, 1621, 0, -5429.04, -3918.93, 341.433, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+47, 1621, 0, -5714.1, -4068.01, 367.053, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10),
(@OGUID+48, 1621, 0, -5080.49, -3663.3, 308.979, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+49, 1621, 0, -5541.32, -3704.88, 308.421, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+50, 1621, 0, -5464.19, -3965.31, 347.369, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+51, 1621, 0, -5183.13, -3836.33, 329.868, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1621, 0, -5666.89, -4077.5, 377.784, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1621, 0, -5378.5, -3833.91, 328.32, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1621, 0, -5286.39, -3759.46, 311.211, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1621, 0, -4979.51, -4023.84, 299.452, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+56, 1621, 0, -9926.93, 814.123, 30.1192, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1621, 0, -11408.4, 1939.08, 10.2287, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 1621, 0, -11052.6, 1197.83, 44.0466, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 1621, 0, -11382.5, 1712.27, 34.3837, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 1621, 0, -10709.5, 1962.58, 35.4621, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1621, 0, -10549, 1976.87, 33.9606, 2.28638, 0, 0, 0.909961, 0.414694, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1621, 0, -10092.6, 1601.71, 41.0102, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1621, 0, -10982.5, 1119.15, 40.2986, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1621, 0, -10475.8, 1712.75, 36.2335, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1621, 0, -11254.3, 1911.64, 36.2096, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1621, 0, -11251.6, 1625.53, 57.6362, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 1621, 0, -11211.2, 1228.7, 90.7387, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 1621, 0, -11175.4, 1712.86, 40.3369, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 1621, 0, -11091, 855.199, 42.1463, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+70, 1621, 0, -11069.9, 1919.8, 31.3934, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+71, 1621, 0, -11008.7, 1678.96, 41.2772, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 1621, 0, -11003.9, 1881.68, 41.1973, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 1621, 0, -10987.5, 1633.49, 46.4828, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 1621, 0, -10769.6, 749.296, 38.5584, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 1621, 0, -10209.2, 1704.51, 33.2407, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 1621, 0, -10137.5, 1752.56, 31.8003, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 1621, 0, -9861.42, 1419.41, 58.4585, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+78, 1621, 0, -9904.38, -1880.45, 37.9255, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 1621, 0, -9608.79, -2429.04, 59.8932, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10),
(@OGUID+80, 1621, 0, -9415.24, -2111.12, 67.0888, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+81, 1621, 0, -9635.92, -3055.3, 56.31, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 1621, 0, -9333.84, -3308.43, 89.7115, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+83, 1621, 0, -9658.02, -2111.7, 60.2108, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+84, 1621, 0, -9759.97, -2152.08, 58.6628, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+85, 1621, 0, -9496.37, -3203.11, 62.4749, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10),
(@OGUID+86, 1621, 0, -9656.25, -3478.21, 121.956, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+87, 1621, 0, -9156.48, -3188.13, 106.772, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+88, 1621, 0, -9372.92, -2026.42, 57.8357, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+89, 1621, 0, -9770.06, -2221.82, 59.8902, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+90, 1621, 0, -9678.34, -2681.32, 62.4952, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 1621, 0, -9651.54, -2884.1, 51.0352, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 1621, 0, -9562.72, -1868.06, 69.7337, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10),
(@OGUID+93, 1621, 0, -9554.79, -2899.26, 93.3538, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+94, 1621, 0, -9522.79, -3486.91, 125.978, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+95, 1621, 0, -9408.7, -3440.19, 91.2317, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10),
(@OGUID+96, 1621, 0, -9344.89, -3112.77, 86.1976, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+97, 1621, 0, -9083.6, -2206.59, 130.86, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+98, 1621, 0, 752.246, 1176.41, 54.1389, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 1621, 0, 363.656, 1202.77, 76.7807, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 1, 100, 0, 10),
(@OGUID+100, 1621, 0, 189.594, 1220.34, 68.9187, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(@OGUID+101, 1621, 0, -32.0891, 1265.96, 61.1706, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+102, 1621, 0, -395.193, 1127.8, 84.6086, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+103, 1621, 0, -38.9839, 1064.54, 63.8401, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+104, 1621, 0, 295.11, 1275.38, 77.5284, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 1, 100, 0, 10),
(@OGUID+105, 1621, 0, 556.695, 1337.89, 86.6567, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+106, 1621, 0, 476.653, 1156.71, 94.5741, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+107, 1621, 0, -542.837, 904.022, 89.8296, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+108, 1621, 0, -79.9488, 1113.74, 67.3336, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 1621, 0, -639.503, 1494.97, 9.6857, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 1621, 0, 67.2836, 1266.24, 65.0148, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 1621, 0, -473.183, 865.694, 96.5802, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 1621, 0, -446.982, 847.415, 96.9973, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 1621, 0, -538.854, 1084.28, 88.7732, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 1621, 0, -479.976, 1318.48, 41.0712, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10),
(@OGUID+115, 1621, 0, 58.2199, 1275.59, 64.48, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 1621, 0, 427.732, 1267.13, 80.597, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+117, 1621, 1, 7457.85, -1146.68, 44.8022, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 1621, 1, 6081.99, 407.804, 25.7207, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 1621, 1, 5603.32, 241.437, 31.5457, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 1621, 1, 4760.79, 137.93, 54.6364, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 1621, 1, 4823.35, 275.858, 52.1601, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 1621, 1, 4523.03, 34.3448, 83.7612, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1621, 1, 6977.94, -206.324, 40.4996, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 1621, 1, 4423.4, 333.811, 58.392, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 1621, 1, 5093.71, 400.35, 32.8642, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 1621, 1, 7048.82, -46.8621, 18.3249, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 1621, 1, 7768.93, -1089.04, 39.2549, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 1621, 1, 6834.12, 348.531, 20.9587, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+129, 1621, 1, 6711.49, 350.309, 26.0895, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10),
(@OGUID+130, 1621, 1, 4737.5, 391.683, 38.826, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 1, 100, 0, 10),
(@OGUID+131, 1621, 1, 7152.39, -498.399, 38.9829, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+132, 1621, 0, -502.171, -1678.16, 80.8453, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(@OGUID+133, 1621, 0, -724.908, -1357.02, 67.9433, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 1, 100, 0, 10),
(@OGUID+134, 1621, 0, -300.626, -832.994, 58.0299, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+135, 1621, 0, -384.97, -1681.25, 88.737, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+136, 1621, 0, -976.12, -827.472, 14.1518, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 1, 100, 0, 10),
(@OGUID+137, 1621, 0, -463.174, -1223.14, 56.5361, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+138, 1621, 0, -622.071, -1169.44, 61.4729, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10),
(@OGUID+139, 1621, 0, -1053.8, -1368.43, 56.3424, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+140, 1621, 0, -445.137, -277.211, 54.5082, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+141, 1621, 0, -330.845, -1500.32, 66.9755, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 1621, 0, -1219.29, -1138.78, 37.1137, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 1621, 0, -1058.08, -1048.58, 48.0192, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+144, 1621, 0, -1005.36, -82.5833, 3.84617, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+145, 1621, 0, -954.309, -226.171, 53.8633, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+146, 1621, 0, -931.244, -340.912, 43.9092, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+147, 1621, 0, -856.863, -105.338, 24.8763, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+148, 1621, 0, -817.272, -144.971, 32.3461, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+149, 1621, 0, -766.645, -956.938, 34.0646, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+150, 1621, 0, -760.857, -430.811, 21.3547, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+151, 1621, 0, -658.525, -368.96, 38.8657, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+152, 1621, 0, -625.266, 485.256, 79.1482, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+153, 1621, 0, -357.597, -350.824, 58.7876, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+154, 1621, 0, -336.428, -620.821, 54.9287, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+155, 1621, 1, 2084.18, -3418.2, 92.7692, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10),
(@OGUID+156, 1621, 1, 2841.6, -3415.37, 120.457, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+157, 1621, 1, 3302.76, -1428.81, 175.2, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10),
(@OGUID+158, 1621, 1, 2163.18, -3106.93, 110.897, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 0, 10),
(@OGUID+159, 1621, 1, 2118.77, -513.479, 110.082, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+160, 1621, 1, 1942.23, -588.895, 112.46, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10),
(@OGUID+161, 1621, 1, 1478.53, -2418.84, 105.17, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+162, 1621, 1, 2072.23, -909.099, 106.51, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 1, 100, 0, 10),
(@OGUID+163, 1621, 1, 1805.19, -2050.75, 104.122, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+164, 1621, 1, 1969.7, -3216.06, 98.9687, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+165, 1621, 1, 1989.78, -2915.32, 107.725, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+166, 1621, 1, 2023.3, -2363.69, 91.3253, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+167, 1621, 1, 2127.27, -3505.13, 57.72, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+168, 1621, 1, 2250.46, -3108.52, 119.962, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+169, 1621, 1, 2563.8, -3096.17, 143.518, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+170, 1621, 1, 2764.2, -2492.12, 192.814, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 1, 100, 0, 10),
(@OGUID+171, 1621, 1, 3143.24, -1521.88, 197.095, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+172, 1621, 1, 3228.99, -562.044, 153.91, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 1, 100, 0, 10);

-- Missing Briarthorn spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+173, 1621, 1, 206.765, 90.7655, 51.4756, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+174, 1621, 1, -102.477, -631.154, -2.75868, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 1, 100, 0, 10),
(@OGUID+175, 1621, 1, 2756.62, 1528.18, 238.096, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10),
(@OGUID+176, 1621, 1, 381.768, 388.748, 53.0068, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+177, 1621, 1, 830.578, 578.432, 88.3972, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+178, 1621, 1, 1516.68, -477.189, 47.9995, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(@OGUID+179, 1621, 1, 2128.42, 1074.31, 238.538, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+180, 1621, 1, 1258.05, -447.374, 22.0382, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+181, 1621, 1, 574.272, 266.641, 56.5523, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+182, 1621, 1, 680.358, 1435.64, -7.3887, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+183, 1621, 1, 862.329, 691.778, 96.6315, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10),
(@OGUID+184, 1621, 1, 1008.45, 709.643, 121.174, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 1, 100, 0, 10),
(@OGUID+185, 1621, 1, 628.438, 1829.14, -10.4462, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+186, 1621, 1, 845.478, 1777.11, -10.9616, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+187, 1621, 1, 1226.26, -599.834, 20.669, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+188, 1621, 1, 1475.06, 856.463, 134.955, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+189, 1621, 1, 1897.15, 946.018, 167.142, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10),
(@OGUID+190, 1621, 1, 2311.96, 1553.79, 284.423, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+191, 1621, 1, 2487.72, 1289.57, 277.513, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+192, 1621, 1, 2570.96, 1726.28, 314.527, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+2, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+3, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+4, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+5, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+6, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+7, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+8, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+9, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+10, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+11, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+12, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+13, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+14, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+15, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+16, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+17, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+18, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+19, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+20, 1113, 0, 'Briarthorn', 0, 10),
(@OGUID+21, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+22, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+23, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+24, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+25, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+26, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+27, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+28, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+29, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+30, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+31, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+32, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+33, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+34, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+35, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+36, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+37, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+38, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+39, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+40, 1151, 0, 'Briarthorn', 0, 10),
(@OGUID+41, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+42, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+43, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+44, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+45, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+46, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+47, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+48, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+49, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+50, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+51, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+52, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+53, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+54, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+55, 1165, 0, 'Briarthorn', 0, 10),
(@OGUID+56, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+57, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+58, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+59, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+60, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+61, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+62, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+63, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+64, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+65, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+66, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+67, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+68, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+69, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+70, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+71, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+72, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+73, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+74, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+75, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+76, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+77, 1109, 0, 'Briarthorn', 0, 10),
(@OGUID+78, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+79, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+80, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+81, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+82, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+83, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+84, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+85, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+86, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+87, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+88, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+89, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+90, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+91, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+92, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+93, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+94, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+95, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+96, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+97, 1127, 0, 'Briarthorn', 0, 10),
(@OGUID+98, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+99, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+100, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+101, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+102, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+103, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+104, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+105, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+106, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+107, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+108, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+109, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+110, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+111, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+112, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+113, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+114, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+115, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+116, 1046, 0, 'Briarthorn', 0, 10),
(@OGUID+117, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+118, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+119, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+120, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+121, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+122, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+123, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+124, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+125, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+126, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+127, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+128, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+129, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+130, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+131, 1100, 0, 'Briarthorn', 0, 10),
(@OGUID+132, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+133, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+134, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+135, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+136, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+137, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+138, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+139, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+140, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+141, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+142, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+143, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+144, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+145, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+146, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+147, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+148, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+149, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+150, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+151, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+152, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+153, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+154, 1050, 0, 'Briarthorn', 0, 10),
(@OGUID+155, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+156, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+157, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+158, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+159, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+160, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+161, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+162, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+163, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+164, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+165, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+166, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+167, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+168, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+169, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+170, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+171, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+172, 1073, 0, 'Briarthorn', 0, 10),
(@OGUID+173, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+174, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+175, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+176, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+177, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+178, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+179, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+180, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+181, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+182, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+183, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+184, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+185, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+186, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+187, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+188, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+189, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+190, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+191, 1087, 0, 'Briarthorn', 0, 10),
(@OGUID+192, 1087, 0, 'Briarthorn', 0, 10);

-- Missing Briarthorn spawns in The Barrens.
SET @OGUID = 27342;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3729, 1, -2245.8, -2388.75, 91.6667, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100, 0, 10),
(@OGUID+2, 3729, 1, -1152.72, -3598.91, 93.3751, 3.22886, 0, 0, -0.999048, 0.0436193, 900, 900, 1, 100, 0, 10),
(@OGUID+3, 3729, 1, -1593.21, -3592.77, 91.8447, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10),
(@OGUID+4, 3729, 1, -1871.09, -3372.66, 64.7106, 1.0821, 0, 0, 0.515038, 0.857168, 900, 900, 1, 100, 0, 10),
(@OGUID+5, 3729, 1, -1751.36, -1899.05, 92.7159, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10),
(@OGUID+6, 3729, 1, 1058.32, -3678.57, 36.0646, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10),
(@OGUID+7, 3729, 1, 1042.02, -2987.69, 91.6673, 1.36136, 0, 0, 0.62932, 0.777146, 900, 900, 1, 100, 0, 10),
(@OGUID+8, 3729, 1, 1135.63, -3464.41, 87.0588, 5.89921, 0, 0, -0.190808, 0.981627, 900, 900, 1, 100, 0, 10),
(@OGUID+9, 3729, 1, -199.519, -1160.88, 57.8559, 3.10665, 0, 0, 0.999847, 0.0174693, 900, 900, 1, 100, 0, 10),
(@OGUID+10, 3729, 1, 925.201, -3498.32, 91.6667, 4.66003, 0, 0, -0.725374, 0.688355, 900, 900, 1, 100, 0, 10),
(@OGUID+11, 3729, 1, 570.178, -3134.26, 91.6667, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10),
(@OGUID+12, 3729, 1, -659.269, -3381.17, 91.7126, 6.24828, 0, 0, -0.0174522, 0.999848, 900, 900, 1, 100, 0, 10),
(@OGUID+13, 3729, 1, -470.076, -1971.71, 91.7485, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10),
(@OGUID+14, 3729, 1, -2849.12, -1953.97, 91.6667, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10),
(@OGUID+15, 3729, 1, -1875.3, -1980.27, 92.2575, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10),
(@OGUID+16, 3729, 1, -680.054, -3098.36, 91.8174, 5.42797, 0, 0, -0.414693, 0.909961, 900, 900, 1, 100, 0, 10),
(@OGUID+17, 3729, 1, -47.0494, -1589.17, 91.6667, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 1, 100, 0, 10),
(@OGUID+18, 3729, 1, -1521.09, -3888.51, 15.6641, 5.53269, 0, 0, -0.366501, 0.930418, 900, 900, 1, 100, 0, 10),
(@OGUID+19, 3729, 1, 1063.69, -3301.54, 91.6667, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10),
(@OGUID+20, 3729, 1, 954.127, -3134.67, 92.5242, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 1, 100, 0, 10),
(@OGUID+21, 3729, 1, 180.086, -1713.24, 93.3485, 4.7822, 0, 0, -0.681998, 0.731354, 900, 900, 1, 100, 0, 10),
(@OGUID+22, 3729, 1, -431.804, -1316.55, 97.6229, 1.48353, 0, 0, 0.67559, 0.737278, 900, 900, 1, 100, 0, 10),
(@OGUID+23, 3729, 1, -1412.43, -3639.26, 92.1808, 0.575957, 0, 0, 0.284015, 0.95882, 900, 900, 1, 100, 0, 10),
(@OGUID+24, 3729, 1, -1789.54, -3205.13, 89.6333, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10),
(@OGUID+25, 3729, 1, -4031.71, -1957.76, 92.6257, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10),
(@OGUID+26, 3729, 1, -2239.95, -1597.31, 92.7891, 0.680677, 0, 0, 0.333806, 0.942642, 900, 900, 1, 100, 0, 10),
(@OGUID+27, 3729, 1, -3637.74, -2216.63, 92.2857, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10),
(@OGUID+28, 3729, 1, -2124.93, -1894.04, 91.677, 5.00909, 0, 0, -0.594823, 0.803857, 900, 900, 1, 100, 0, 10),
(@OGUID+29, 3729, 1, -1767.89, -2967.73, 91.6667, 5.61996, 0, 0, -0.325567, 0.945519, 900, 900, 1, 100, 0, 10),
(@OGUID+30, 3729, 1, -3375.92, -2271.41, 91.6667, 5.88176, 0, 0, -0.199368, 0.979925, 900, 900, 1, 100, 0, 10),
(@OGUID+31, 3729, 1, -1796.18, -3534.25, 92.5034, 1.46608, 0, 0, 0.66913, 0.743145, 900, 900, 1, 100, 0, 10),
(@OGUID+32, 3729, 1, -233.344, -3726.62, 29.8465, 5.41052, 0, 0, -0.422618, 0.906308, 900, 900, 1, 100, 0, 10),
(@OGUID+33, 3729, 1, -1497.01, -1960.63, 91.6177, 0.0174525, 0, 0, 0.00872612, 0.999962, 900, 900, 1, 100, 0, 10),
(@OGUID+34, 3729, 1, -2033.97, -3719.65, 22.6121, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 1, 100, 0, 10),
(@OGUID+35, 3729, 1, 941.36, -2829.5, 91.6667, 0.314158, 0, 0, 0.156434, 0.987688, 900, 900, 1, 100, 0, 10),
(@OGUID+36, 3729, 1, 770.962, -3689.78, 28.5849, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10),
(@OGUID+37, 3729, 1, -3638.69, -1853.55, 91.6667, 3.9619, 0, 0, -0.91706, 0.39875, 900, 900, 1, 100, 0, 10),
(@OGUID+38, 3729, 1, -2628.69, -2381.59, 91.6667, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10),
(@OGUID+39, 3729, 1, -2430.22, -1817.29, 91.6667, 5.44543, 0, 0, -0.406736, 0.913546, 900, 900, 1, 100, 0, 10),
(@OGUID+40, 3729, 1, -1983.27, -2223.51, 95.7973, 4.66003, 0, 0, -0.725374, 0.688355, 900, 900, 1, 100, 0, 10),
(@OGUID+41, 3729, 1, -3199.2, -2127.84, 91.6781, 0.977383, 0, 0, 0.469471, 0.882948, 900, 900, 1, 100, 0, 10),
(@OGUID+42, 3729, 1, -68.3451, -1933.42, 99.3613, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10),
(@OGUID+43, 3729, 1, 1218.51, -3132.41, 91.6667, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10),
(@OGUID+44, 3729, 1, 848.745, -3571.26, 90.2722, 1.51844, 0, 0, 0.688354, 0.725374, 900, 900, 1, 100, 0, 10),
(@OGUID+45, 3729, 1, -115.071, -1829.2, 92.6345, 1.09956, 0, 0, 0.522498, 0.85264, 900, 900, 1, 100, 0, 10),
(@OGUID+46, 3729, 1, 303.344, -1447.87, 91.6667, 0.872664, 0, 0, 0.422618, 0.906308, 900, 900, 1, 100, 0, 10),
(@OGUID+47, 3729, 1, 327.766, -1433.71, 91.6667, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 1, 100, 0, 10),
(@OGUID+48, 3729, 1, 436.373, -1285.99, 92.0469, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 1, 100, 0, 10),
(@OGUID+49, 3729, 1, -560.95, -1482.42, 92.3816, 3.26377, 0, 0, -0.998135, 0.0610518, 900, 900, 1, 100, 0, 10),
(@OGUID+50, 3729, 1, -3808.39, -2006.87, 91.6766, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 1, 100, 0, 10),
(@OGUID+51, 3729, 1, -4187.31, -2018.41, 93.5895, 4.45059, 0, 0, -0.793353, 0.608762, 900, 900, 1, 100, 0, 10),
(@OGUID+52, 3729, 1, -3557.26, -1799.18, 91.7641, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 1, 100, 0, 10),
(@OGUID+53, 3729, 1, -3003.18, -1978.37, 91.7103, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 1, 100, 0, 10),
(@OGUID+54, 3729, 1, -751.061, -3900.37, 20.7891, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10),
(@OGUID+55, 3729, 1, -344.788, -1648.26, 95.7937, 0.0349062, 0, 0, 0.0174522, 0.999848, 900, 900, 1, 100, 0, 10),
(@OGUID+56, 3729, 1, -1724.61, -3735.52, 15.7342, 3.83973, 0, 0, -0.939692, 0.34202, 900, 900, 1, 100, 0, 10),
(@OGUID+57, 3729, 1, -1346.85, -2921.93, 94.3847, 2.19911, 0, 0, 0.891006, 0.453991, 900, 900, 1, 100, 0, 10),
(@OGUID+58, 3729, 1, -4264.32, -2317.58, 92.0119, 0.628317, 0, 0, 0.309016, 0.951057, 900, 900, 1, 100, 0, 10),
(@OGUID+59, 3729, 1, -2090.82, -2130.27, 93.2031, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10),
(@OGUID+60, 3729, 1, 482.941, -1898.07, 91.6667, 5.20108, 0, 0, -0.515038, 0.857168, 900, 900, 1, 100, 0, 10),
(@OGUID+61, 3729, 1, 1241.84, -3668.01, 91.889, 1.15192, 0, 0, 0.544639, 0.838671, 900, 900, 1, 100, 0, 10),
(@OGUID+62, 3729, 1, -3443.87, -2107.17, 93.4592, 4.39823, 0, 0, -0.809016, 0.587786, 900, 900, 1, 100, 0, 10),
(@OGUID+63, 3729, 1, -2554.9, -2101.11, 91.6667, 5.89921, 0, 0, -0.190808, 0.981627, 900, 900, 1, 100, 0, 10),
(@OGUID+64, 3729, 1, -2338.52, -2105.42, 96.2528, 1.41372, 0, 0, 0.649447, 0.760406, 900, 900, 1, 100, 0, 10),
(@OGUID+65, 3729, 1, -1422.33, -2892.46, 93.5401, 0.750491, 0, 0, 0.366501, 0.930418, 900, 900, 1, 100, 0, 10),
(@OGUID+66, 3729, 1, -2576.26, -1783.47, 93.4692, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 1, 100, 0, 10),
(@OGUID+67, 3729, 1, -3780.05, -1527.83, 91.8886, 5.06146, 0, 0, -0.573576, 0.819152, 900, 900, 1, 100, 0, 10),
(@OGUID+68, 3729, 1, -3886.34, -1899.29, 92.1091, 5.74214, 0, 0, -0.267238, 0.963631, 900, 900, 1, 100, 0, 10),
(@OGUID+69, 3729, 1, -1696.34, -2225.82, 92.0846, 5.20108, 0, 0, -0.515038, 0.857168, 900, 900, 1, 100, 0, 10),
(@OGUID+70, 3729, 1, -1961.08, -3201.08, 95.5765, 3.12412, 0, 0, 0.999962, 0.00873464, 900, 900, 1, 100, 0, 10),
(@OGUID+71, 3729, 1, -442.708, -3739.55, 27.1674, 6.05629, 0, 0, -0.113203, 0.993572, 900, 900, 1, 100, 0, 10),
(@OGUID+72, 3729, 1, -974.216, -3396.33, 84.2072, 5.91667, 0, 0, -0.182235, 0.983255, 900, 900, 1, 100, 0, 10),
(@OGUID+73, 3729, 1, -36.364, -2771.9, 94.4797, 5.98648, 0, 0, -0.147809, 0.989016, 900, 900, 1, 100, 0, 10),
(@OGUID+74, 3729, 1, -2473.4, -1639.67, 91.6667, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10),
(@OGUID+75, 3729, 1, -2484.14, -2377.11, 91.6667, 4.81711, 0, 0, -0.66913, 0.743145, 900, 900, 1, 100, 0, 10),
(@OGUID+76, 3729, 1, 682.516, -2827.2, 91.7032, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 1, 100, 0, 10),
(@OGUID+77, 3729, 1, -3800.5, -2464.54, 91.6667, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 1, 100, 0, 10),
(@OGUID+78, 3729, 1, -1797.42, -2472.61, 91.6667, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10),
(@OGUID+79, 3729, 1, -1973.63, -2472.01, 91.7792, 3.63029, 0, 0, -0.970295, 0.241925, 900, 900, 1, 100, 0, 10),
(@OGUID+80, 3729, 1, -1300.53, -2804.44, 93.4994, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10),
(@OGUID+81, 3729, 1, -3903.93, -2290.84, 91.6683, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 1, 100, 0, 10),
(@OGUID+82, 3729, 1, -2093.66, -2420.5, 93.0188, 1.01229, 0, 0, 0.484809, 0.87462, 900, 900, 1, 100, 0, 10),
(@OGUID+83, 3729, 1, -1965.99, -2609.64, 91.9455, 5.81195, 0, 0, -0.233445, 0.97237, 900, 900, 1, 100, 0, 10),
(@OGUID+84, 3729, 1, -1335.2, -3781.48, 20.2302, 6.07375, 0, 0, -0.104528, 0.994522, 900, 900, 1, 100, 0, 10),
(@OGUID+85, 3729, 1, -1746.7, -3343.69, 93.3697, 1.0821, 0, 0, 0.515038, 0.857168, 900, 900, 1, 100, 0, 10),
(@OGUID+86, 3729, 1, -2666.17, -2219.72, 92.0802, 4.59022, 0, 0, -0.748956, 0.66262, 900, 900, 1, 100, 0, 10),
(@OGUID+87, 3729, 1, 21.0643, -3032.41, 92.1659, 6.24828, 0, 0, -0.0174522, 0.999848, 900, 900, 1, 100, 0, 10),
(@OGUID+88, 3729, 1, -4046.88, -1782.21, 95.1955, 4.13643, 0, 0, -0.878817, 0.47716, 900, 900, 1, 100, 0, 10),
(@OGUID+89, 3729, 1, -883.319, -3361.04, 91.7687, 6.14356, 0, 0, -0.0697556, 0.997564, 900, 900, 1, 100, 0, 10),
(@OGUID+90, 3729, 1, -3571.04, -1994.76, 91.6667, 3.99681, 0, 0, -0.909961, 0.414694, 900, 900, 1, 100, 0, 10),
(@OGUID+91, 3729, 1, -198.694, -2865.74, 91.6667, 1.72787, 0, 0, 0.760406, 0.649449, 900, 900, 1, 100, 0, 10),
(@OGUID+92, 3729, 1, -1496.22, -2353.18, 93.0797, 4.7473, 0, 0, -0.694658, 0.71934, 900, 900, 1, 100, 0, 10),
(@OGUID+93, 3729, 1, 44.2498, -1864.93, 95.1252, 2.11185, 0, 0, 0.870356, 0.492424, 900, 900, 1, 100, 0, 10),
(@OGUID+94, 3729, 1, 157.615, -1984.88, 94.3733, 4.03171, 0, 0, -0.902585, 0.430512, 900, 900, 1, 100, 0, 10),
(@OGUID+95, 3729, 1, -663.961, -1738.02, 91.6667, 4.76475, 0, 0, -0.688354, 0.725374, 900, 900, 1, 100, 0, 10),
(@OGUID+96, 3729, 1, 661.844, -1702.1, 91.6667, 1.55334, 0, 0, 0.700909, 0.713251, 900, 900, 1, 100, 0, 10),
(@OGUID+97, 3729, 1, 731.406, -1254.06, 91.6667, 5.23599, 0, 0, -0.5, 0.866025, 900, 900, 1, 100, 0, 10),
(@OGUID+98, 3729, 1, 635.075, -1765.24, 91.6181, 0.645772, 0, 0, 0.317305, 0.948324, 900, 900, 1, 100, 0, 10),
(@OGUID+99, 3729, 1, 530.586, -1449.89, 91.6667, 0, 0, 0, 0, 1, 900, 900, 1, 100, 0, 10),
(@OGUID+100, 3729, 1, -1852.19, -3679.78, 11.3543, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10),
(@OGUID+101, 3729, 1, 123.842, -1514.49, 91.6667, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 1, 100, 0, 10),
(@OGUID+102, 3729, 1, -232.726, -1805.17, 91.9605, 3.68265, 0, 0, -0.96363, 0.267241, 900, 900, 1, 100, 0, 10),
(@OGUID+103, 3729, 1, 951.368, -2331.42, 91.7039, 0.418879, 0, 0, 0.207911, 0.978148, 900, 900, 1, 100, 0, 10),
(@OGUID+104, 3729, 1, -832.846, -2075.74, 91.6667, 2.93214, 0, 0, 0.994521, 0.104536, 900, 900, 1, 100, 0, 10),
(@OGUID+105, 3729, 1, -3670.22, -1603.73, 110.314, 3.63029, 0, 0, -0.970295, 0.241925, 900, 900, 1, 100, 0, 10),
(@OGUID+106, 3729, 1, -1584.55, -2673.22, 92.8385, 5.23599, 0, 0, -0.5, 0.866025, 900, 900, 1, 100, 0, 10),
(@OGUID+107, 3729, 1, -3792.81, -1751.21, 91.8027, 3.78737, 0, 0, -0.948323, 0.317306, 900, 900, 1, 100, 0, 10),
(@OGUID+108, 3729, 1, -3570.05, -2433.25, 94.5956, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10),
(@OGUID+109, 3729, 1, -3457.7, -2337.88, 91.6667, 5.53269, 0, 0, -0.366501, 0.930418, 900, 900, 1, 100, 0, 10),
(@OGUID+110, 3729, 1, -3362.4, -1830.86, 91.6667, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 1, 100, 0, 10),
(@OGUID+111, 3729, 1, -2563.49, -1947.9, 91.6731, 5.48033, 0, 0, -0.390731, 0.920505, 900, 900, 1, 100, 0, 10),
(@OGUID+112, 3729, 1, -2093.88, -2132.23, 93.842, 0.331611, 0, 0, 0.165047, 0.986286, 900, 900, 1, 100, 0, 10),
(@OGUID+113, 3729, 1, -2032.59, -1753.16, 91.6667, 4.86947, 0, 0, -0.649447, 0.760406, 900, 900, 1, 100, 0, 10),
(@OGUID+114, 3729, 1, -1835.74, -2733.9, 91.9103, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10),
(@OGUID+115, 3729, 1, -1515.1, -3805.17, 24.968, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10),
(@OGUID+116, 3729, 1, -1126.16, -2926.29, 94.1394, 3.78737, 0, 0, -0.948323, 0.317306, 900, 900, 1, 100, 0, 10),
(@OGUID+117, 3729, 1, -909.752, -3053.74, 92.0618, 4.93928, 0, 0, -0.622514, 0.782609, 900, 900, 1, 100, 0, 10),
(@OGUID+118, 3729, 1, -839.051, -1987.96, 91.8115, 2.79252, 0, 0, 0.984807, 0.173652, 900, 900, 1, 100, 0, 10),
(@OGUID+119, 3729, 1, -455.338, -2946.19, 91.6667, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 1, 100, 0, 10),
(@OGUID+120, 3729, 1, -426.617, -3458.81, 92.58, 1.36136, 0, 0, 0.62932, 0.777146, 900, 900, 1, 100, 0, 10),
(@OGUID+121, 3729, 1, -292.007, -1462.99, 91.6702, 4.04917, 0, 0, -0.898793, 0.438373, 900, 900, 1, 100, 0, 10),
(@OGUID+122, 3729, 1, -97.7302, -3208.84, 92.757, 3.29869, 0, 0, -0.996917, 0.0784664, 900, 900, 1, 100, 0, 10),
(@OGUID+123, 3729, 1, -34.3888, -3565.08, 27.2031, 0.191985, 0, 0, 0.0958452, 0.995396, 900, 900, 1, 100, 0, 10),
(@OGUID+124, 3729, 1, 51.6044, -1996.58, 93.8839, 5.42797, 0, 0, -0.414693, 0.909961, 900, 900, 1, 100, 0, 10),
(@OGUID+125, 3729, 1, 343.045, -1593.97, 91.6667, 0.139624, 0, 0, 0.0697556, 0.997564, 900, 900, 1, 100, 0, 10),
(@OGUID+126, 3729, 1, 575.739, -1476.91, 92.7413, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10),
(@OGUID+127, 3729, 1, 672.22, -1326.74, 93.5216, 2.75761, 0, 0, 0.981627, 0.190812, 900, 900, 1, 100, 0, 10),
(@OGUID+128, 3729, 1, 714.653, -3508.77, 91.833, 2.9845, 0, 0, 0.996917, 0.0784664, 900, 900, 1, 100, 0, 10),
(@OGUID+129, 3729, 1, 794.476, -2997.77, 91.6667, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10),
(@OGUID+130, 3729, 1, 830.694, -1358.13, 93.6127, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 1, 100, 0, 10),
(@OGUID+131, 3729, 1, 1417.77, -3607.3, 91.7591, 2.89725, 0, 0, 0.992546, 0.12187, 900, 900, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+2, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+3, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+4, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+5, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+6, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+7, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+8, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+9, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+10, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+11, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+12, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+13, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+14, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+15, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+16, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+17, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+18, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+19, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+20, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+21, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+22, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+23, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+24, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+25, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+26, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+27, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+28, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+29, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+30, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+31, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+32, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+33, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+34, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+35, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+36, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+37, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+38, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+39, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+40, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+41, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+42, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+43, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+44, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+45, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+46, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+47, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+48, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+49, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+50, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+51, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+52, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+53, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+54, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+55, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+56, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+57, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+58, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+59, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+60, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+61, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+62, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+63, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+64, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+65, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+66, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+67, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+68, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+69, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+70, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+71, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+72, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+73, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+74, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+75, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+76, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+77, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+78, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+79, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+80, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+81, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+82, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+83, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+84, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+85, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+86, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+87, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+88, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+89, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+90, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+91, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+92, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+93, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+94, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+95, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+96, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+97, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+98, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+99, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+100, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+101, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+102, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+103, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+104, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+105, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+106, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+107, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+108, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+109, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+110, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+111, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+112, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+113, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+114, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+115, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+116, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+117, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+118, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+119, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+120, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+121, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+122, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+123, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+124, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+125, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+126, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+127, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+128, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+129, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+130, 1037, 0, 'Briarthorn', 0, 10),
(@OGUID+131, 1037, 0, 'Briarthorn', 0, 10);

-- Correct Pools
UPDATE `pool_template` SET `description`='Briarthorn in Ashenvale' WHERE `entry`=1073;
UPDATE `pool_template` SET `description`='Briarthorn in Barrens' WHERE `entry`=1037;
UPDATE `pool_template` SET `description`='Briarthorn in Darkshore' WHERE `entry`=1100;
UPDATE `pool_template` SET `description`='Briarthorn in Duskwood' WHERE `entry`=1113;
UPDATE `pool_template` SET `description`='Briarthorn in Loch Modan' WHERE `entry`=1165;
UPDATE `pool_template` SET `description`='Briarthorn in Redridge' WHERE `entry`=1127;
UPDATE `pool_template` SET `description`='Briarthorn in Silverpine Forest' WHERE  `entry`=1046;
UPDATE `pool_template` SET `description`='Briarthorn in Stonetalon' WHERE `entry`=1087;
UPDATE `pool_template` SET `description`='Briarthorn in Westfall' WHERE `entry`=1109;
UPDATE `pool_template` SET `description`='Briarthorn in Wetlands' WHERE `entry`=1151;
UPDATE `pool_gameobject` SET `pool_entry` = 1127 WHERE `guid` = 38564;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (2542, 2549, 2551, 2559, 2562, 2564, 2565, 2567, 2569, 2574, 2599, 2611, 2620, 2621, 2625, 2634, 2643, 2644, 2646, 2648, 2652, 2659, 2668, 2677, 2678, 2716, 2717, 2722, 2723, 2725, 2728, 2729, 2732, 2737, 2747, 2751, 2754, 2756, 2758, 2760, 2762, 2766, 2767, 2770, 2772, 2783, 2807, 2814, 2822, 2824, 2825, 2826, 2857, 2859, 2865, 2881, 2883, 2884, 2885, 2886, 2893, 2898, 2902, 2905, 2907, 2545, 2553, 2554, 2556, 2557, 2558, 2561, 2571, 2572, 2575, 2576, 2577, 2578, 2579, 2580, 2582, 2584, 2586, 2590, 2591, 2592, 2594, 2598, 2600, 2607, 2609, 2610, 2612, 2614, 2615, 2618, 2627, 2628, 2630, 2635, 2636, 2637, 2638, 2639, 2640, 2641, 2645, 2650, 2651, 2654, 2655, 2661, 2662, 2664, 2666, 2667, 2671, 2672, 2673, 2675, 2676, 2680, 2681, 2682, 2684, 2685, 2686, 2690, 2691, 2694, 2695, 2696, 2699, 2700, 2701, 2708, 2711, 2712, 2713, 2714, 2715, 2718, 2719, 2720, 2724, 2731, 2735, 2740, 2741, 2743, 2744, 2746, 2750, 2763, 2765, 2768, 2773, 2774, 2775, 2776, 2778, 2780, 2781, 2782, 2787, 2791, 2792, 2793, 2796, 2801, 2802, 2803, 2805, 2806, 2808, 2809, 2810, 2812, 2813, 2816, 2817, 2818, 2819, 2820, 2827, 2830, 2832, 2833, 2835, 2836, 2838, 2839, 2840, 2841, 2842, 2843, 2845, 2846, 2849, 2850, 2855, 2856, 2861, 2864, 2866, 2868, 2870, 2871, 2877, 2878, 2879, 2880, 2887, 2888, 2891, 2906, 40001, 40002);
DELETE FROM `pool_gameobject` WHERE `guid` IN (2542, 2549, 2551, 2559, 2562, 2564, 2565, 2567, 2569, 2574, 2599, 2611, 2620, 2621, 2625, 2634, 2643, 2644, 2646, 2648, 2652, 2659, 2668, 2677, 2678, 2716, 2717, 2722, 2723, 2725, 2728, 2729, 2732, 2737, 2747, 2751, 2754, 2756, 2758, 2760, 2762, 2766, 2767, 2770, 2772, 2783, 2807, 2814, 2822, 2824, 2825, 2826, 2857, 2859, 2865, 2881, 2883, 2884, 2885, 2886, 2893, 2898, 2902, 2905, 2907, 2545, 2553, 2554, 2556, 2557, 2558, 2561, 2571, 2572, 2575, 2576, 2577, 2578, 2579, 2580, 2582, 2584, 2586, 2590, 2591, 2592, 2594, 2598, 2600, 2607, 2609, 2610, 2612, 2614, 2615, 2618, 2627, 2628, 2630, 2635, 2636, 2637, 2638, 2639, 2640, 2641, 2645, 2650, 2651, 2654, 2655, 2661, 2662, 2664, 2666, 2667, 2671, 2672, 2673, 2675, 2676, 2680, 2681, 2682, 2684, 2685, 2686, 2690, 2691, 2694, 2695, 2696, 2699, 2700, 2701, 2708, 2711, 2712, 2713, 2714, 2715, 2718, 2719, 2720, 2724, 2731, 2735, 2740, 2741, 2743, 2744, 2746, 2750, 2763, 2765, 2768, 2773, 2774, 2775, 2776, 2778, 2780, 2781, 2782, 2787, 2791, 2792, 2793, 2796, 2801, 2802, 2803, 2805, 2806, 2808, 2809, 2810, 2812, 2813, 2816, 2817, 2818, 2819, 2820, 2827, 2830, 2832, 2833, 2835, 2836, 2838, 2839, 2840, 2841, 2842, 2843, 2845, 2846, 2849, 2850, 2855, 2856, 2861, 2864, 2866, 2868, 2870, 2871, 2877, 2878, 2879, 2880, 2887, 2888, 2891, 2906, 40001, 40002);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawn_flags` = 0, `animprogress` = 100, `spawntimesecsmin` = 900, `spawntimesecsmax` = 900 WHERE `id` IN (1621, 3729);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=31 WHERE `entry` = 1113;
UPDATE `pool_template` SET `max_limit`=22 WHERE `entry` = 1109;
UPDATE `pool_template` SET `max_limit`=16 WHERE `entry` = 1100;
UPDATE `pool_template` SET `max_limit`=15 WHERE `entry` = 1165;
UPDATE `pool_template` SET `max_limit`=23 WHERE `entry` = 1151;
UPDATE `pool_template` SET `max_limit`=25 WHERE `entry` = 1050;
UPDATE `pool_template` SET `max_limit`=23 WHERE `entry` = 1046;
UPDATE `pool_template` SET `max_limit`=65 WHERE `entry` = 1037;
UPDATE `pool_template` SET `max_limit`=16 WHERE `entry` = 1073;
UPDATE `pool_template` SET `max_limit`=18 WHERE `entry` = 1087;
UPDATE `pool_template` SET `max_limit`=18 WHERE `entry` = 1127;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
