DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230610152626');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230610152626');
-- Add your query below.


-- Firebloom (2866)
SET @OGUID = 55458;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.821053 yards).
UPDATE `gameobject` SET `position_x`=-6538.63, `position_y`=-1680.26, `position_z`=295.718, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=13239;

-- Correct position of Firebloom in Badlands (position is off by 1.36864 yards).
UPDATE `gameobject` SET `position_x`=-6485.51, `position_y`=-3653.27, `position_z`=244.496, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=12328;

-- Correct position of Firebloom in Badlands (position is off by 0.304908 yards).
UPDATE `gameobject` SET `position_x`=-6946.8, `position_y`=-2451.77, `position_z`=240.744, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=12253;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.957616 yards).
UPDATE `gameobject` SET `position_x`=-7006.21, `position_y`=-1482.54, `position_z`=240.573, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=12222;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.3737 yards).
UPDATE `gameobject` SET `position_x`=-6907.64, `position_y`=-893.32, `position_z`=245.551, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=12318;

-- Correct position of Firebloom in Tanaris (position is off by 1.23243 yards).
UPDATE `gameobject` SET `position_x`=-7120.09, `position_y`=-3449.43, `position_z`=9.61033, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=12269;

-- Correct position of Firebloom in Tanaris (position is off by 0.674824 yards).
UPDATE `gameobject` SET `position_x`=-7078.64, `position_y`=-3081.89, `position_z`=10.804, `orientation`=5.13127, `rotation0`=0, `rotation1`=0, `rotation2`=-0.544639, `rotation3`=0.838671 WHERE `guid`=12226;

-- Correct position of Firebloom in Tanaris (position is off by 0.104435 yards).
UPDATE `gameobject` SET `position_x`=-7378.97, `position_y`=-4117.9, `position_z`=8.87722, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=12289;

-- Correct position of Firebloom in Tanaris (position is off by 0.911042 yards).
UPDATE `gameobject` SET `position_x`=-7461.91, `position_y`=-4757.04, `position_z`=8.90017, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=12228;

-- Correct position of Firebloom in Tanaris (position is off by 1.36002 yards).
UPDATE `gameobject` SET `position_x`=-7016.36, `position_y`=-2879.98, `position_z`=9.01529, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=12258;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.11062 yards).
UPDATE `gameobject` SET `position_x`=-7117, `position_y`=-976.476, `position_z`=253.64, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=12267;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.33125 yards).
UPDATE `gameobject` SET `position_x`=-6788.77, `position_y`=-1450.17, `position_z`=171.192, `orientation`=5.044, `rotation0`=0, `rotation1`=0, `rotation2`=-0.580703, `rotation3`=0.814116 WHERE `guid`=39970;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.17213 yards).
UPDATE `gameobject` SET `position_x`=-6712.59, `position_y`=-840.098, `position_z`=244.144, `orientation`=0.820303, `rotation0`=0, `rotation1`=0, `rotation2`=0.398748, `rotation3`=0.91706 WHERE `guid`=12323;

-- Correct position of Firebloom in Tanaris (position is off by 1.27839 yards).
UPDATE `gameobject` SET `position_x`=-6981.83, `position_y`=-4478.49, `position_z`=11.1205, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=12288;

-- Correct position of Firebloom in Badlands (position is off by 1.08036 yards).
UPDATE `gameobject` SET `position_x`=-6713.47, `position_y`=-3580.06, `position_z`=242.403, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=12229;

-- Correct position of Firebloom in Badlands (position is off by 1.12757 yards).
UPDATE `gameobject` SET `position_x`=-7082.95, `position_y`=-2750.59, `position_z`=243.051, `orientation`=4.60767, `rotation0`=0, `rotation1`=0, `rotation2`=-0.743144, `rotation3`=0.669131 WHERE `guid`=12256;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.11284 yards).
UPDATE `gameobject` SET `position_x`=-6885.27, `position_y`=-1576.84, `position_z`=245.108, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=12277;

-- Correct position of Firebloom in Badlands (position is off by 1.34817 yards).
UPDATE `gameobject` SET `position_x`=-7113.97, `position_y`=-3217.87, `position_z`=241.667, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=12272;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.266604 yards).
UPDATE `gameobject` SET `position_x`=-7010.74, `position_y`=-970.94, `position_z`=255.945, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=12311;

-- Correct position of Firebloom in Searing Gorge (position is off by 3.66397 yards).
UPDATE `gameobject` SET `position_x`=-6730.7, `position_y`=-1038.35, `position_z`=240.145, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=12239;

-- Correct position of Firebloom in Searing Gorge (position is off by 0.368691 yards).
UPDATE `gameobject` SET `position_x`=-6790.12, `position_y`=-1645.66, `position_z`=191.864, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=12265;

-- Correct position of Firebloom in Badlands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-6551.81, `position_y`=-3283.03, `position_z`=241.864, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12306;

-- Correct position of Firebloom in Tanaris (position is off by 0.388241 yards).
UPDATE `gameobject` SET `position_x`=-7362.92, `position_y`=-3479.38, `position_z`=13.4628, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=12324;

-- Correct position of Firebloom in Badlands (position is off by 0.956059 yards).
UPDATE `gameobject` SET `position_x`=-6848.68, `position_y`=-4146.1, `position_z`=266.608, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=12245;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.94558 yards).
UPDATE `gameobject` SET `position_x`=-6598.16, `position_y`=-1173.59, `position_z`=272.773, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=13238;

-- Correct position of Firebloom in Searing Gorge (position is off by 2.33083 yards).
UPDATE `gameobject` SET `position_x`=-7081.08, `position_y`=-1059.23, `position_z`=240.712, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=39971;

-- Correct position of Firebloom in Tanaris (position is off by 0.325622 yards).
UPDATE `gameobject` SET `position_x`=-7418.7, `position_y`=-3652.11, `position_z`=9.95243, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=12264;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.12051 yards).
UPDATE `gameobject` SET `position_x`=-6946.54, `position_y`=-1624.95, `position_z`=243.231, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=12218;

-- Correct position of Firebloom in Tanaris (position is off by 0.387949 yards).
UPDATE `gameobject` SET `position_x`=-7747.11, `position_y`=-3984.63, `position_z`=9.69405, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=12302;

-- Correct position of Firebloom in Tanaris (position is off by 0.713869 yards).
UPDATE `gameobject` SET `position_x`=-7586.8, `position_y`=-3573.33, `position_z`=15.151, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=12244;

-- Correct position of Firebloom in Tanaris (position is off by 0.912251 yards).
UPDATE `gameobject` SET `position_x`=-8446.79, `position_y`=-2719.88, `position_z`=25.594, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=12216;

-- Correct position of Firebloom in Tanaris (position is off by 1.17045 yards).
UPDATE `gameobject` SET `position_x`=-7252.11, `position_y`=-3313.24, `position_z`=9.7893, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=12284;

-- Correct position of Firebloom in Tanaris (position is off by 0.271277 yards).
UPDATE `gameobject` SET `position_x`=-8848.02, `position_y`=-2653.73, `position_z`=22.6227, `orientation`=1.44862, `rotation0`=0, `rotation1`=0, `rotation2`=0.66262, `rotation3`=0.748956 WHERE `guid`=12232;

-- Correct position of Firebloom in Searing Gorge (position is off by 1.01682 yards).
UPDATE `gameobject` SET `position_x`=-6843.69, `position_y`=-1887.06, `position_z`=267.471, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=12230;

-- Correct position of Firebloom in Blasted Lands (position is off by 0.728221 yards).
UPDATE `gameobject` SET `position_x`=-10926.7, `position_y`=-2856.18, `position_z`=11.5525, `orientation`=2.75761, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=0.190812 WHERE `guid`=12316;

-- Correct position of Firebloom in Tanaris (position is off by 1.07826 yards).
UPDATE `gameobject` SET `position_x`=-8057.34, `position_y`=-5162.02, `position_z`=9.68309, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=12270;

-- Correct position of Firebloom in Tanaris (position is off by 0.585826 yards).
UPDATE `gameobject` SET `position_x`=-7535.15, `position_y`=-3468.44, `position_z`=24.738, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=12307;

-- Correct position of Firebloom in Tanaris (position is off by 0.69486 yards).
UPDATE `gameobject` SET `position_x`=-7681.49, `position_y`=-2977.51, `position_z`=21.2711, `orientation`=4.85202, `rotation0`=0, `rotation1`=0, `rotation2`=-0.656058, `rotation3`=0.75471 WHERE `guid`=12327;

-- Correct position of Firebloom in Tanaris (position is off by 0.363811 yards).
UPDATE `gameobject` SET `position_x`=-8320.64, `position_y`=-3049.05, `position_z`=8.64034, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=12225;

-- Correct position of Firebloom in Badlands (position is off by 0.934887 yards).
UPDATE `gameobject` SET `position_x`=-6849.17, `position_y`=-2749.58, `position_z`=242.047, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=12295;

-- Missing Firebloom spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2866, 0, -7291.14, -3161.81, 303.624, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 2866, 0, -7357.27, -2448, 302.58, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 2866, 0, -7316.91, -3446.96, 313.853, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 2866, 0, -7044.99, -3548.27, 244.117, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 2866, 0, -6784.82, -3414.91, 241.667, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10);

-- Missing Firebloom spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+6, 2866, 0, -11760.6, -2946.83, 7.51192, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 2866, 0, -11054.8, -2848.66, 10.7956, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 2866, 0, -11317.1, -3146.82, 5.7421, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 2866, 0, -11508.7, -3285.16, 7.97583, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 2866, 0, -11456.7, -2724.53, 5.32711, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 2866, 0, -11374.7, -3339.36, 7.41967, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 2866, 0, -11365.8, -2859.29, 5.71542, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 2866, 0, -11210.6, -2723.26, 13.8473, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10);

-- Missing Firebloom spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 2866, 0, -7323.66, -1669.21, 286.824, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 2866, 0, -7086.12, -1705.49, 241.405, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 2866, 0, -6745.17, -1379.43, 240.013, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 2866, 0, -7316.47, -1566.92, 316.095, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+18, 2866, 0, -6991.08, -1151.45, 241.569, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+19, 2866, 0, -6807.83, -1768.91, 261.281, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10), 
(@OGUID+20, 2866, 0, -7182.48, -1527.93, 241.124, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+21, 2866, 0, -6937.42, -1396.06, 169.355, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+22, 2866, 0, -6587.79, -991.392, 245.393, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), 
(@OGUID+23, 2866, 0, -7275.81, -866.391, 294.072, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10), 
(@OGUID+24, 2866, 0, -7095.3, -1517.7, 242.911, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 2866, 0, -7091.08, -1143.13, 270.494, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 2866, 0, -7202.09, -1006.23, 244.447, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 2866, 0, -7184.66, -1400.82, 241.753, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 2866, 0, -7032.25, -1742.44, 246.392, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 2866, 0, -7165.78, -1647.65, 241.613, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 2866, 0, -7176.88, -1728.41, 244.447, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 2866, 0, -6495.32, -2012.69, 259.487, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 2866, 0, -6865.87, -1192.69, 240.331, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 2866, 0, -6814.45, -1554.32, 193.158, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 2866, 0, -6701.04, -1699.27, 214.545, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 2866, 0, -7245.29, -1302.97, 273.505, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 2866, 0, -6846.84, -1140.55, 240.004, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 2866, 0, -7317.79, -1804.88, 245.641, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 2866, 0, -7096.66, -1266.49, 269.36, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 2866, 0, -6732.82, -1560.83, 192.665, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10),
(@OGUID+40, 2866, 0, -6677.65, -1204.74, 240.508, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10),
(@OGUID+41, 2866, 0, -6626.73, -1484.35, 265.139, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+42, 2866, 0, -6598.05, -1812.66, 251.337, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+43, 2866, 0, -6590.51, -1579.99, 272.8, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10);

-- Missing Firebloom spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+44, 2866, 1, -7247.31, -4475.61, 9.24286, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 2866, 1, -7741.32, -3611.67, 44.6915, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 2866, 1, -8781.79, -2849.3, 27.8091, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 2866, 1, -8907.6, -2784.74, 37.3759, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 2866, 1, -8415.25, -2251.24, 21.4984, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 2866, 1, -7615.36, -3785.46, 12.4705, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 2866, 1, -8387, -4116.63, 11.163, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 2866, 1, -8219.37, -4343.52, 13.023, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10), 
(@OGUID+52, 2866, 1, -7713.99, -4318.98, 11.0923, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10), 
(@OGUID+53, 2866, 1, -7850.97, -3115.6, 72.6794, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), 
(@OGUID+54, 2866, 1, -7462.25, -3253.01, 12.2622, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+55, 2866, 1, -9174.92, -2619.26, 16.0227, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 1, 100, 0, 10), 
(@OGUID+56, 2866, 1, -8157.5, -5246.43, 3.54654, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), 
(@OGUID+57, 2866, 1, -9151.97, -3284.08, 33.548, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 2866, 1, -8689.29, -3008.75, 14.7409, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 2866, 1, -8659.8, -3187.15, 18.3645, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 2866, 1, -8551.42, -4275.46, 12.493, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 2866, 1, -8077.55, -2913.18, 39.743, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 2866, 1, -8060.57, -3045.73, 49.0478, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 2866, 1, -7953.55, -5186.19, 3.77604, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 2866, 1, -7847.91, -2918.2, 43.1874, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 2866, 1, -7771.25, -4676.83, 10.2879, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 2866, 1, -7587.86, -2815.84, 9.9149, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+67, 2866, 1, -7578.92, -4414.79, 11.0501, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+68, 2866, 1, -7216.36, -4746.08, 10.7685, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+69, 2866, 1, -7014.32, -3284.5, 10.1255, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1281, 0, 'Firebloom', 0, 10), -- Fireblooms in Badlands 22 objects total
(@OGUID+2, 1281, 0, 'Firebloom', 0, 10), -- Fireblooms in Badlands 22 objects total
(@OGUID+3, 1281, 0, 'Firebloom', 0, 10), -- Fireblooms in Badlands 22 objects total
(@OGUID+4, 1281, 0, 'Firebloom', 0, 10), -- Fireblooms in Badlands 22 objects total
(@OGUID+5, 1281, 0, 'Firebloom', 0, 10), -- Fireblooms in Badlands 22 objects total
(@OGUID+6, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+7, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+8, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+9, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+10, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+11, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+12, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+13, 1276, 0, 'Firebloom', 0, 10), -- Fireblooms in Blasted Lands 44 objects total
(@OGUID+14, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+15, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+16, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+17, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+18, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+19, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+20, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+21, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+22, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+23, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+24, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+25, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+26, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+27, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+28, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+29, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+30, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+31, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+32, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+33, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+34, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+35, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+36, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+37, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+38, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+39, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+40, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+41, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+42, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+43, 1291, 0, 'Firebloom', 0, 10), -- Fireblooms in Searing Gorge 49 objects total
(@OGUID+44, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+45, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+46, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+47, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+48, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+49, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+50, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+51, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+52, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+53, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+54, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+55, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+56, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+57, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+58, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+59, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+60, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+61, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+62, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+63, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+64, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+65, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+66, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+67, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+68, 1208, 0, 'Firebloom', 0, 10), -- Fireblooms in Tanaris 62 objects total
(@OGUID+69, 1208, 0, 'Firebloom', 0, 10); -- Fireblooms in Tanaris 62 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Firebloom in Badlands' WHERE  `entry`=1281;
UPDATE `pool_template` SET `description`='Firebloom in Blasted Lands' WHERE  `entry`=1276;
UPDATE `pool_template` SET `description`='Firebloom in Searing Gorge' WHERE  `entry`=1291;
UPDATE `pool_template` SET `description`='Firebloom in Tanaris' WHERE  `entry`=1208;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (12241, 12309, 12287, 12303, 12312, 12279, 13230, 12215, 12285, 12296, 12266, 12247, 12257, 12213, 12214, 12220, 12221, 12223, 12231, 12234, 12238, 12246, 12250, 12251, 12255, 12259, 12260, 12271, 12273, 12274, 12275, 12276, 12280, 12281, 12282, 12283, 12290, 12292, 12297, 12308, 12314, 12321, 12330, 12335, 12336, 39967);
DELETE FROM `pool_gameobject` WHERE `guid` IN (12241, 12309, 12287, 12303, 12312, 12279, 13230, 12215, 12285, 12296, 12266, 12247, 12257, 12213, 12214, 12220, 12221, 12223, 12231, 12234, 12238, 12246, 12250, 12251, 12255, 12259, 12260, 12271, 12273, 12274, 12275, 12276, 12280, 12281, 12282, 12283, 12290, 12292, 12297, 12308, 12314, 12321, 12330, 12335, 12336, 39967);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2866);

-- Update Counters
UPDATE `pool_template` SET `max_limit`= 10 WHERE  `entry`=1276;
UPDATE `pool_template` SET `max_limit`= 34 WHERE  `entry`=1291;
UPDATE `pool_template` SET `max_limit`= 39 WHERE  `entry`=1208;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
