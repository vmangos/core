DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617052347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617052347');
-- Add your query below.


-- Peacebloom (1618, 3724)
SET @OGUID = 43817;

-- Correct position of Peacebloom in Durotar (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=809.231, `position_y`=-5008.37, `position_z`=10.3424, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=1314;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.739165 yards).
UPDATE `gameobject` SET `position_x`=1937.37, `position_y`=536.597, `position_z`=50.284, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=1391;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=2004.82, `position_y`=430.121, `position_z`=36.5727, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=1342;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.940914 yards).
UPDATE `gameobject` SET `position_x`=2188.6, `position_y`=953.799, `position_z`=35.976, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=1349;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.334795 yards).
UPDATE `gameobject` SET `position_x`=2026.84, `position_y`=604.512, `position_z`=36.0793, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=1487;

-- Correct position of Peacebloom in Mulgore (position is off by 0.791189 yards).
UPDATE `gameobject` SET `position_x`=-2253.3, `position_y`=-1152.76, `position_z`=-0.719904, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=1439;

-- Correct position of Peacebloom in Mulgore (position is off by 0.884712 yards).
UPDATE `gameobject` SET `position_x`=-1217.21, `position_y`=-346.838, `position_z`=-17.8093, `orientation`=0.436332, `rotation0`=0, `rotation1`=0, `rotation2`=0.216439, `rotation3`=0.976296 WHERE `guid`=1557;

-- Correct position of Peacebloom in Mulgore (position is off by 1.48164 yards).
UPDATE `gameobject` SET `position_x`=-1160.24, `position_y`=287.672, `position_z`=25.4504, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.34202 WHERE `guid`=1472;

-- Correct position of Peacebloom in Mulgore (position is off by 0.529758 yards).
UPDATE `gameobject` SET `position_x`=-1243.54, `position_y`=-487.743, `position_z`=-56.9449, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=1468;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.882111 yards).
UPDATE `gameobject` SET `position_x`=1147.76, `position_y`=1069.45, `position_z`=32.9938, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=1710;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.211047 yards).
UPDATE `gameobject` SET `position_x`=1103.88, `position_y`=1458.85, `position_z`=34.7833, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=1535;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.638645 yards).
UPDATE `gameobject` SET `position_x`=102.122, `position_y`=1200, `position_z`=65.299, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=1479;

-- Correct position of Peacebloom in Durotar (position is off by 1.04423 yards).
UPDATE `gameobject` SET `position_x`=411.254, `position_y`=-4226.16, `position_z`=25.4297, `orientation`=5.79449, `rotation0`=0, `rotation1`=0, `rotation2`=-0.241921, `rotation3`=0.970296 WHERE `guid`=1555;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.362 yards).
UPDATE `gameobject` SET `position_x`=-159.638, `position_y`=950.241, `position_z`=64.9428, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=1590;

-- Correct position of Peacebloom in Mulgore (position is off by 0.805123 yards).
UPDATE `gameobject` SET `position_x`=-1379.82, `position_y`=-353.434, `position_z`=-39.6538, `orientation`=4.41568, `rotation0`=0, `rotation1`=0, `rotation2`=-0.803857, `rotation3`=0.594823 WHERE `guid`=1607;

-- Correct position of Peacebloom in Mulgore (position is off by 0.578483 yards).
UPDATE `gameobject` SET `position_x`=-2222.54, `position_y`=152.929, `position_z`=61.2913, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=1574;

-- Correct position of Peacebloom in Mulgore (position is off by 0.749888 yards).
UPDATE `gameobject` SET `position_x`=-1783.5, `position_y`=-717.716, `position_z`=-9.48133, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=1610;

-- Correct position of Peacebloom in Thunder Bluff (position is off by 1.16922 yards).
UPDATE `gameobject` SET `position_x`=-978.505, `position_y`=78.1237, `position_z`=31.3837, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=1371;

-- Correct position of Peacebloom in Mulgore (position is off by 0.998068 yards).
UPDATE `gameobject` SET `position_x`=-2414.67, `position_y`=-44.6815, `position_z`=-7.65019, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=1724;

-- Correct position of Peacebloom in Mulgore (position is off by 0.498598 yards).
UPDATE `gameobject` SET `position_x`=-2619.65, `position_y`=-650.645, `position_z`=0.39445, `orientation`=1.95477, `rotation0`=0, `rotation1`=0, `rotation2`=0.829038, `rotation3`=0.559193 WHERE `guid`=1616;

-- Correct position of Peacebloom in Loch Modan (position is off by 0.79603 yards).
UPDATE `gameobject` SET `position_x`=-5335.43, `position_y`=-2800.35, `position_z`=350.679, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=1659;

-- Correct position of Peacebloom in Durotar (position is off by 0.942558 yards).
UPDATE `gameobject` SET `position_x`=587.152, `position_y`=-4016.66, `position_z`=10.3527, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=1613;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.622432 yards).
UPDATE `gameobject` SET `position_x`=2229.13, `position_y`=1249.01, `position_z`=40.501, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=1547;

-- Correct position of Peacebloom in Mulgore (position is off by 1.62377 yards).
UPDATE `gameobject` SET `position_x`=-1421.61, `position_y`=248.471, `position_z`=-4.84939, `orientation`=5.34071, `rotation0`=0, `rotation1`=0, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=1392;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.646256 yards).
UPDATE `gameobject` SET `position_x`=1930.88, `position_y`=800.377, `position_z`=38.8693, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=1357;

-- Correct position of Peacebloom in Mulgore (position is off by 0.0113724 yards).
UPDATE `gameobject` SET `position_x`=-2546.99, `position_y`=149.453, `position_z`=59.1786, `orientation`=3.63029, `rotation0`=0, `rotation1`=0, `rotation2`=-0.970295, `rotation3`=0.241925 WHERE `guid`=1678;

-- Correct position of Peacebloom in Mulgore (position is off by 1.12782 yards).
UPDATE `gameobject` SET `position_x`=-2346.98, `position_y`=-1014.55, `position_z`=-9.09553, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=1695;

-- Correct position of Peacebloom in Durotar (position is off by 0.144097 yards).
UPDATE `gameobject` SET `position_x`=576.44, `position_y`=-4645.88, `position_z`=31.6439, `orientation`=4.83456, `rotation0`=0, `rotation1`=0, `rotation2`=-0.66262, `rotation3`=0.748956 WHERE `guid`=1595;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.594888 yards).
UPDATE `gameobject` SET `position_x`=-547.066, `position_y`=1622.77, `position_z`=7.69354, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=1518;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.229315 yards).
UPDATE `gameobject` SET `position_x`=323.113, `position_y`=658.814, `position_z`=40.6597, `orientation`=4.10153, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=1728;

-- Correct position of Peacebloom in Durotar (position is off by 1.45678 yards).
UPDATE `gameobject` SET `position_x`=-146.132, `position_y`=-4716.83, `position_z`=29.0282, `orientation`=5.3058, `rotation0`=0, `rotation1`=0, `rotation2`=-0.469471, `rotation3`=0.882948 WHERE `guid`=1488;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.700554 yards).
UPDATE `gameobject` SET `position_x`=1210.13, `position_y`=986.398, `position_z`=37.494, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=1519;

-- Correct position of Peacebloom in Loch Modan (position is off by 0.379904 yards).
UPDATE `gameobject` SET `position_x`=-4916.38, `position_y`=-3085, `position_z`=315.933, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=1406;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.135859 yards).
UPDATE `gameobject` SET `position_x`=2047.72, `position_y`=-93.1358, `position_z`=34.6191, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=1476;

-- Correct position of Peacebloom in Mulgore (position is off by 0.65246 yards).
UPDATE `gameobject` SET `position_x`=-1890.43, `position_y`=-185.54, `position_z`=-7.17074, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=1551;

-- Correct position of Peacebloom in Durotar (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=482.284, `position_y`=-4083.93, `position_z`=30.2555, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=1543;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2117.83, `position_y`=295.336, `position_z`=60.9441, `orientation`=0.296705, `rotation0`=0, `rotation1`=0, `rotation2`=0.147809, `rotation3`=0.989016 WHERE `guid`=1334;

-- Correct position of Peacebloom in Durotar (position is off by 1.03533 yards).
UPDATE `gameobject` SET `position_x`=590.793, `position_y`=-4870.73, `position_z`=24.6471, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=1641;

-- Correct position of Peacebloom in Loch Modan (position is off by 1.04632 yards).
UPDATE `gameobject` SET `position_x`=-5895.03, `position_y`=-3603.39, `position_z`=351.017, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=1401;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.141291 yards).
UPDATE `gameobject` SET `position_x`=2348.53, `position_y`=-211.136, `position_z`=39.2133, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=1715;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.539456 yards).
UPDATE `gameobject` SET `position_x`=2426.59, `position_y`=-249.455, `position_z`=50.7172, `orientation`=2.04204, `rotation0`=0, `rotation1`=0, `rotation2`=0.85264, `rotation3`=0.522499 WHERE `guid`=1541;

-- Correct position of Peacebloom in Silverpine Forest (position is off by 0.444991 yards).
UPDATE `gameobject` SET `position_x`=1100.14, `position_y`=1267.14, `position_z`=41.1007, `orientation`=6.10865, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0871553, `rotation3`=0.996195 WHERE `guid`=1671;

-- Correct position of Peacebloom in Westfall (position is off by 0.210616 yards).
UPDATE `gameobject` SET `position_x`=-9889.21, `position_y`=1136.34, `position_z`=34.2764, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=1377;

-- Correct position of Peacebloom in Dun Morogh (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=-5090.68, `position_y`=442.544, `position_z`=407.869, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=1313;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.718783 yards).
UPDATE `gameobject` SET `position_x`=2199.56, `position_y`=-92.5553, `position_z`=32.3236, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=1469;

-- Correct position of Peacebloom in Mulgore (position is off by 0.488149 yards).
UPDATE `gameobject` SET `position_x`=-1684.4, `position_y`=-583.225, `position_z`=-24.1663, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=1369;

-- Correct position of Peacebloom in Mulgore (position is off by 1.10324 yards).
UPDATE `gameobject` SET `position_x`=-849.958, `position_y`=-276.665, `position_z`=-16.8615, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=1455;

-- Correct position of Peacebloom in Mulgore (position is off by 1.15987 yards).
UPDATE `gameobject` SET `position_x`=-984.919, `position_y`=-788.83, `position_z`=-8.38452, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=1726;

-- Correct position of Peacebloom in Mulgore (position is off by 0.307225 yards).
UPDATE `gameobject` SET `position_x`=-1949.9, `position_y`=-353.275, `position_z`=-3.90635, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=1367;

-- Correct position of Peacebloom in Mulgore (position is off by 1.0977 yards).
UPDATE `gameobject` SET `position_x`=-925.013, `position_y`=378.549, `position_z`=15.888, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760406, `rotation3`=0.649449 WHERE `guid`=1625;

-- Correct position of Peacebloom in Mulgore (position is off by 1.15991 yards).
UPDATE `gameobject` SET `position_x`=-2013.9, `position_y`=-119.341, `position_z`=-7.13839, `orientation`=4.64258, `rotation0`=0, `rotation1`=0, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=1345;

-- Correct position of Peacebloom in Darkshore (position is off by 0.838243 yards).
UPDATE `gameobject` SET `position_x`=4323.75, `position_y`=41.262, `position_z`=58.1498, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=1741;

-- Correct position of Peacebloom in Darkshore (position is off by 0.992095 yards).
UPDATE `gameobject` SET `position_x`=6720.39, `position_y`=207.814, `position_z`=23.1556, `orientation`=1.78023, `rotation0`=0, `rotation1`=0, `rotation2`=0.777145, `rotation3`=0.629321 WHERE `guid`=1353;

-- Correct position of Peacebloom in Darkshore (position is off by 0.314901 yards).
UPDATE `gameobject` SET `position_x`=6456.76, `position_y`=108.612, `position_z`=37.3303, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid`=1660;

-- Correct position of Peacebloom in Darkshore (position is off by 0.712297 yards).
UPDATE `gameobject` SET `position_x`=6270.3, `position_y`=390.889, `position_z`=32.5784, `orientation`=0.802851, `rotation0`=0, `rotation1`=0, `rotation2`=0.390731, `rotation3`=0.920505 WHERE `guid`=1609;

-- Correct position of Peacebloom in Darkshore (position is off by 1.01155 yards).
UPDATE `gameobject` SET `position_x`=4848.96, `position_y`=96.5679, `position_z`=50.2729, `orientation`=0.663223, `rotation0`=0, `rotation1`=0, `rotation2`=0.325567, `rotation3`=0.945519 WHERE `guid`=1631;

-- Correct position of Peacebloom in Durotar (position is off by 0.94345 yards).
UPDATE `gameobject` SET `position_x`=-713.907, `position_y`=-5020.74, `position_z`=17.0465, `orientation`=0.820303, `rotation0`=0, `rotation1`=0, `rotation2`=0.398748, `rotation3`=0.91706 WHERE `guid`=1717;

-- Correct position of Peacebloom in Durotar (position is off by 1.18033 yards).
UPDATE `gameobject` SET `position_x`=79.7799, `position_y`=-4245.79, `position_z`=59.7068, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=1520;

-- Correct position of Peacebloom in Durotar (position is off by 0.557129 yards).
UPDATE `gameobject` SET `position_x`=106.372, `position_y`=-4009.62, `position_z`=46.3773, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=1600;

-- Correct position of Peacebloom in Durotar (position is off by 0.401935 yards).
UPDATE `gameobject` SET `position_x`=1153.67, `position_y`=-4312.61, `position_z`=21.2124, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=1390;

-- Correct position of Peacebloom in Tirisfal Glades (position is off by 0.797051 yards).
UPDATE `gameobject` SET `position_x`=2080.07, `position_y`=1120.71, `position_z`=37.3963, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=1745;

-- Correct position of Peacebloom in Durotar (position is off by 0.100115 yards).
UPDATE `gameobject` SET `position_x`=51.6326, `position_y`=-4151.9, `position_z`=63.7338, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=1688;

-- Correct position of Peacebloom in Durotar (position is off by 0.959817 yards).
UPDATE `gameobject` SET `position_x`=209.838, `position_y`=-4051.3, `position_z`=44.4966, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=1696;

-- Correct position of Peacebloom in Durotar (position is off by 0.97311 yards).
UPDATE `gameobject` SET `position_x`=-174.129, `position_y`=-3886.43, `position_z`=41.3098, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=1598;

-- Correct position of Peacebloom in Mulgore (position is off by 1.06042 yards).
UPDATE `gameobject` SET `position_x`=-912.891, `position_y`=-607.438, `position_z`=-54.8785, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=1350;

-- Correct position of Peacebloom in Mulgore (position is off by 0.825773 yards).
UPDATE `gameobject` SET `position_x`=-780.618, `position_y`=-449.783, `position_z`=-31.5029, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=1731;

-- Correct position of Peacebloom in Mulgore (position is off by 1.50859 yards).
UPDATE `gameobject` SET `position_x`=-1715.9, `position_y`=282.875, `position_z`=49.5149, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=1363;

-- Correct position of Peacebloom in Darkshore (position is off by 0.657877 yards).
UPDATE `gameobject` SET `position_x`=6537.38, `position_y`=-175.755, `position_z`=36.8939, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=1389;

-- Correct position of Peacebloom in Westfall (position is off by 0.200274 yards).
UPDATE `gameobject` SET `position_x`=-10814.2, `position_y`=1072.8, `position_z`=37.0536, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=1629;

-- Missing Peacebloom spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1618, 0, -5644.59, -1456.99, 399.917, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 1618, 0, -5830.56, -690.37, 397.768, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 1618, 0, -5413.17, -399.971, 398.614, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 1618, 0, -5827.05, -481.184, 405.621, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 1618, 0, -5249.26, -432.63, 387.018, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 1618, 0, -5716.99, -1300.76, 390.957, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 1, 100, 0, 10), 
(@OGUID+7, 1618, 0, -5555.24, -1461.55, 403.171, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+8, 1618, 0, -5519.1, -434.05, 405.842, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 1, 100, 0, 10), 
(@OGUID+9, 1618, 0, -6031.9, -337.854, 424.26, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+10, 1618, 0, -5876.23, -10.789, 360.485, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), 
(@OGUID+11, 1618, 0, -5813.63, -2057.92, 400.828, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 1618, 0, -5882.81, -116.939, 364.699, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 1618, 0, -5701.6, -913.072, 398.444, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1618, 0, -5690.18, -1850.92, 399.83, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 1618, 0, -5632.13, 387.019, 383.512, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 1618, 0, -5605.07, -990.954, 393.451, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1618, 0, -5406.12, 516.121, 386.359, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1618, 0, -5359.61, 371.235, 394.3, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1618, 0, -5174.53, 285.311, 396.765, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1618, 0, -5159.32, 359.896, 396.463, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 1618, 0, -5100.56, -66.958, 396.452, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1618, 0, -5039.04, 70.9546, 392.931, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 1618, 0, -9814.99, -562.856, 28.7973, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10), 
(@OGUID+24, 1618, 0, -9681.9, -549.844, 49.2377, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 1618, 0, -9738.53, -648.556, 43.5726, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 1618, 0, -9853.78, -952.625, 37.3469, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 1618, 0, -9879.68, -1028.55, 30.0751, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 1618, 0, -9798.21, -1199.98, 38.0966, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 1618, 0, -9748.69, -748.682, 41.5984, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 1618, 0, -9802.5, -386.555, 55.1582, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+31, 1618, 1, -1123.92, -5132.36, 2.30886, 0.0698117, 0, 0, 0.0348988, 0.999391, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 1618, 1, 950.419, -4981.33, 9.41513, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 1618, 1, 1192.58, -4006.66, 17.0034, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+34, 1618, 1, 1153.6, -4530.12, 19.5377, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+35, 1618, 1, 456.343, -4551.55, 52.2991, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+36, 1618, 1, 111.746, -5011.83, 9.82663, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+37, 1618, 1, 188.786, -5087.78, 10.8326, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), 
(@OGUID+38, 1618, 1, -1190.88, -5502.52, 5.26831, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 1, 100, 0, 10), 
(@OGUID+39, 1618, 1, 481.166, -3884.93, 20.6758, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+40, 1618, 1, -726.661, -4810.64, 25.4452, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 1618, 1, 115.578, -4686.57, 27.4204, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 1618, 1, -55.2088, -5059.32, 10.3872, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 1618, 1, -249.421, -4915.39, 26.4992, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 1618, 1, 772.42, -4337.37, 17.6443, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 1618, 1, -1340.78, -5140.33, 3.48485, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 1618, 1, 122.605, -4414.1, 37.6684, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 1618, 1, -17.5935, -4018.54, 59.2235, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 1618, 1, -125.189, -4933.25, 19.8904, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1618, 1, -808.89, -5355.29, 2.16466, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 1618, 1, 979.562, -3922.74, 18.4933, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 1618, 1, -727.394, -4670.9, 36.8098, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1618, 1, -721.236, -5611.31, 25.5613, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1618, 1, -79.9959, -3888.22, 46.938, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1618, 1, 185.339, -4189.96, 44.9944, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1618, 1, 280.476, -5047.2, 11.7505, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 1618, 1, 552.922, -4382.99, 25.6746, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1618, 1, 621.033, -4322.41, 18.9057, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 1618, 1, 710.625, -4209.05, 16.8783, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+59, 1618, 0, -5165.76, -2766.13, 335.84, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10), 
(@OGUID+60, 1618, 0, -5640.9, -3202.46, 326.807, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+61, 1618, 0, -5342.74, -3775.8, 310.231, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10), 
(@OGUID+62, 1618, 0, -5499.95, -3748.77, 318.8, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), 
(@OGUID+63, 1618, 0, -5717.34, -3283.28, 308.303, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1618, 0, -5666.85, -3700.25, 317.545, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+65, 1618, 0, -5182.65, -3014.71, 333.295, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+66, 1618, 0, -4863.24, -2694.91, 335.215, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1618, 0, -10990.6, 1007.12, 37.6851, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 1618, 0, -9792.85, 1410.87, 41.2623, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 1618, 0, -11136.2, 761.5, 36.2952, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 1618, 0, -10402.8, 1629.95, 38.2378, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 1618, 0, -11086.5, 627.683, 36.5317, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+72, 1618, 0, -10568.1, 834.061, 45.3067, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+73, 1618, 0, -10148.5, 1501, 41.724, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+74, 1618, 0, 1850.44, -552.155, 41.4346, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10), 
(@OGUID+75, 1618, 0, 2568.17, 916.615, 100.373, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10), 
(@OGUID+76, 1618, 0, 2816.43, 196.755, 29.7697, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 1, 100, 0, 10), 
(@OGUID+77, 1618, 0, 1894.6, -106.239, 33.2211, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10), 
(@OGUID+78, 1618, 0, 2553.94, -784.922, 66.7892, 2.9496, 0, 0, 0.995396, 0.0958512, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+79, 1618, 0, -100.278, 999.729, 67.1666, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10), 
(@OGUID+80, 1618, 0, -427.72, 1118.08, 84.9261, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 1618, 0, -690.557, 1374.01, 30.1207, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+82, 1618, 0, -559.779, 874.4, 88.7414, 4.90438, 0, 0, -0.636078, 0.771625, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+83, 1618, 1, 9971.03, 534.072, 1310.96, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 1618, 1, 9969.02, 874.025, 1323.31, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 1618, 1, 9972.62, 1105.91, 1325.89, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 1618, 1, 10546.2, 1812.19, 1315.66, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 1618, 1, 10751.1, 1945.58, 1336.03, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 1618, 1, 10203, 1883.9, 1332.16, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 1618, 1, 10860.5, 1691.74, 1301.1, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 1618, 1, 9452.79, 1552.37, 1298.68, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+91, 1618, 1, 9342.01, 1491.86, 1273.54, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+92, 1618, 1, 9224.16, 1283.27, 1308.56, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 1, 100, 0, 10), 
(@OGUID+93, 1618, 1, 9608.76, 731.521, 1266.38, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 1618, 1, 9225.5, 1110.92, 1314.62, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 1618, 1, 10303.4, 1863.98, 1326.92, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+96, 1618, 1, 9957.9, 1544.88, 1311.75, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 1618, 1, 9254.43, 881.78, 1320.57, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+98, 1618, 1, 9283.94, 718.517, 1316.14, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+99, 1618, 1, 9585.03, 687.466, 1265.35, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+100, 1618, 1, 4926.66, 381.136, 38.894, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 1618, 1, 7653.11, -1068.2, 41.8302, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 1618, 1, 6784.08, -387.636, 40.4781, 2.42601, 0, 0, 0.936672, 0.350207, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 1618, 1, 7223.89, -670.534, 37.2767, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 1618, 1, 7649.51, -832.593, 15.436, 0.261798, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+105, 1618, 1, -1518.6, -283.123, -26.0325, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 1618, 1, -2544.55, -1180.8, -3.04812, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 1618, 1, -2044.42, 207.714, 71.7263, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 1618, 1, -2021.16, -980.508, 9.24252, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+109, 1618, 1, -1783.83, -82.7236, -6.90968, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+110, 1618, 1, -1850.22, -586.735, 0.197725, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+111, 1618, 1, -2279.85, -813.539, -5.10623, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), 
(@OGUID+112, 1618, 1, -1477.14, -838.87, -0.309594, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), 
(@OGUID+113, 1618, 1, -2246.43, -53.9905, 1.61653, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), 
(@OGUID+114, 1618, 1, -2692.53, -1177.1, 10.5903, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+115, 1618, 1, -2582.91, -949.714, -5.88559, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 1618, 1, -2253.3, -1152.76, -0.719904, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 1, 100, 0, 10),
(@OGUID+117, 1618, 1, -2222.54, 152.929, 61.2913, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 1618, 1, -2013.9, -119.341, -7.13839, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 1618, 1, -1949.9, -353.275, -3.90635, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 1618, 1, -1944.83, 283.872, 87.9508, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 1618, 1, -1715.9, 282.875, 49.5149, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 1618, 1, -1684.4, -583.225, -24.1663, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1618, 1, -1421.61, 248.471, -4.84939, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 1618, 1, -882.26, -147.573, -0.880346, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10);

-- Missing Peacebloom spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+125, 3724, 1, 771.47, -3240.14, 213.597, 1.44862, 0, 0, 0.66262, 0.748956, 900, 900, 1, 100, 0, 10), 
(@OGUID+126, 3724, 1, -2418.95, -2376.44, 93.8814, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 1, 100, 0, 10), 
(@OGUID+127, 3724, 1, -1652.84, -3576.2, 94.1403, 5.39307, 0, 0, -0.430511, 0.902586, 900, 900, 1, 100, 0, 10), 
(@OGUID+128, 3724, 1, -2521.37, -2314.1, 94.527, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10), 
(@OGUID+129, 3724, 1, -2618.37, -2338.07, 91.7466, 4.36332, 0, 0, -0.819152, 0.573577, 900, 900, 1, 100, 0, 10), 
(@OGUID+130, 3724, 1, -2616.61, -1888.47, 95.5607, 3.3685, 0, 0, -0.993571, 0.113208, 900, 900, 1, 100, 0, 10), 
(@OGUID+131, 3724, 1, -1680.8, -1983.97, 93.2022, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10), 
(@OGUID+132, 3724, 1, -1491.01, -1884.64, 94.5635, 1.18682, 0, 0, 0.559193, 0.829038, 900, 900, 1, 100, 0, 10), 
(@OGUID+133, 3724, 1, -1358.9, -2043.76, 91.8389, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 1, 100, 0, 10), 
(@OGUID+134, 3724, 1, -1614.72, -2140.22, 94.3504, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 1, 100, 0, 10), 
(@OGUID+135, 3724, 1, -848.241, -2378.59, 91.7192, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10), 
(@OGUID+136, 3724, 1, -419.211, -2380.24, 91.7137, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), 
(@OGUID+137, 3724, 1, -1602.51, -1824.2, 91.8433, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10), 
(@OGUID+138, 3724, 1, -1220.93, -2018.09, 91.6667, 3.97935, 0, 0, -0.913545, 0.406738, 900, 900, 1, 100, 0, 10), 
(@OGUID+139, 3724, 1, -218.375, -2586.92, 94.245, 4.97419, 0, 0, -0.608761, 0.793354, 900, 900, 1, 100, 0, 10), 
(@OGUID+140, 3724, 1, -950.176, -2815.22, 93.454, 0.767944, 0, 0, 0.374606, 0.927184, 900, 900, 1, 100, 0, 10), 
(@OGUID+141, 3724, 1, -1985.86, -1981.32, 92.8823, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), 
(@OGUID+142, 3724, 1, -2454.54, -2045.98, 96.6962, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), 
(@OGUID+143, 3724, 1, -2649.53, -2018.88, 97.969, 0.994837, 0, 0, 0.477159, 0.878817, 900, 900, 1, 100, 0, 10), 
(@OGUID+144, 3724, 1, -810.676, -3250.87, 92.953, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), 
(@OGUID+145, 3724, 1, -709.93, -3488.44, 91.664, 5.88176, 0, 0, -0.199368, 0.979925, 900, 900, 1, 100, 0, 10), 
(@OGUID+146, 3724, 1, -86.2176, -3649.48, 27.1848, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), 
(@OGUID+147, 3724, 1, 679.832, -2213.57, 94.4202, 1.65806, 0, 0, 0.737277, 0.675591, 900, 900, 1, 100, 0, 10), 
(@OGUID+148, 3724, 1, 349.798, -1883.65, 91.728, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), 
(@OGUID+149, 3724, 1, 280.543, -2581.38, 93.8831, 2.09439, 0, 0, 0.866025, 0.500001, 900, 900, 1, 100, 0, 10), 
(@OGUID+150, 3724, 1, -622.489, -3582.95, 91.664, 0.59341, 0, 0, 0.292371, 0.956305, 900, 900, 1, 100, 0, 10), 
(@OGUID+151, 3724, 1, -1548.28, -3714.21, 91.796, 0.191985, 0, 0, 0.0958452, 0.995396, 900, 900, 1, 100, 0, 10), 
(@OGUID+152, 3724, 1, -3619.68, -2155.59, 91.8781, 0.104719, 0, 0, 0.0523357, 0.99863, 900, 900, 1, 100, 0, 10), 
(@OGUID+153, 3724, 1, -3449.13, -2216.36, 92.162, 4.10153, 0, 0, -0.887011, 0.461749, 900, 900, 1, 100, 0, 10), 
(@OGUID+154, 3724, 1, -409.883, -2852.73, 93.4444, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10), 
(@OGUID+155, 3724, 1, -524.746, -3453.84, 94.4237, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), 
(@OGUID+156, 3724, 1, -2257.83, -1570.24, 92.2167, 0.698131, 0, 0, 0.34202, 0.939693, 900, 900, 1, 100, 0, 10), 
(@OGUID+157, 3724, 1, -2196.5, -2320.08, 93.5697, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 1, 100, 0, 10), 
(@OGUID+158, 3724, 1, -2191.67, -1945.28, 93.879, 3.21142, 0, 0, -0.999391, 0.0349061, 900, 900, 1, 100, 0, 10), 
(@OGUID+159, 3724, 1, -1907.97, -3674.25, 10.7882, 0.226892, 0, 0, 0.113203, 0.993572, 900, 900, 1, 100, 0, 10), 
(@OGUID+160, 3724, 1, -2819.61, -1986.15, 94.3748, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 1, 100, 0, 10), 
(@OGUID+161, 3724, 1, -3549.77, -2350.69, 96.4671, 3.75246, 0, 0, -0.953716, 0.300708, 900, 900, 1, 100, 0, 10), 
(@OGUID+162, 3724, 1, -3510.11, -1917.69, 93.5602, 3.89209, 0, 0, -0.930417, 0.366502, 900, 900, 1, 100, 0, 10), 
(@OGUID+163, 3724, 1, -414.971, -3546.12, 92.8495, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 1, 100, 0, 10), 
(@OGUID+164, 3724, 1, -2319, -2417.43, 95.6567, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 1, 100, 0, 10), 
(@OGUID+165, 3724, 1, 714.725, -2550.9, 92.7443, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 1, 100, 0, 10), 
(@OGUID+166, 3724, 1, -3615.46, -1942.71, 94.1204, 5.98648, 0, 0, -0.147809, 0.989016, 900, 900, 1, 100, 0, 10), 
(@OGUID+167, 3724, 1, -3382.04, -1915.07, 92.1843, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), 
(@OGUID+168, 3724, 1, 1115.67, -3380.36, 93.8685, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), 
(@OGUID+169, 3724, 1, 714.437, -1881.07, 91.6667, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 1, 100, 0, 10), 
(@OGUID+170, 3724, 1, -308.541, -1819.66, 95.7815, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 1, 100, 0, 10), 
(@OGUID+171, 3724, 1, -1646.32, -2052.02, 93.133, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10), 
(@OGUID+172, 3724, 1, -1023.16, -2369.34, 94.4868, 4.25861, 0, 0, -0.848047, 0.529921, 900, 900, 1, 100, 0, 10), 
(@OGUID+173, 3724, 1, -146.922, -2948.52, 91.9616, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), 
(@OGUID+174, 3724, 1, -946.539, -2618.98, 91.7864, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10), 
(@OGUID+175, 3724, 1, -2383.87, -2246.75, 91.6897, 2.16421, 0, 0, 0.882947, 0.469473, 900, 900, 1, 100, 0, 10), 
(@OGUID+176, 3724, 1, -1884.84, -2284.89, 94.9252, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), 
(@OGUID+177, 3724, 1, -1519.67, -1745.53, 92.6195, 5.11382, 0, 0, -0.551936, 0.833886, 900, 900, 1, 100, 0, 10), 
(@OGUID+178, 3724, 1, 79.8073, -3551.83, 29.4317, 3.87463, 0, 0, -0.93358, 0.358368, 900, 900, 1, 100, 0, 10), 
(@OGUID+179, 3724, 1, -918.801, -2302.58, 91.6667, 3.00195, 0, 0, 0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), 
(@OGUID+180, 3724, 1, -1954.85, -2451.13, 91.6677, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), 
(@OGUID+181, 3724, 1, 384.82, -2749.18, 92.7778, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), 
(@OGUID+182, 3724, 1, -2484.21, -1778.49, 93.2762, 0.349065, 0, 0, 0.173648, 0.984808, 900, 900, 1, 100, 0, 10), 
(@OGUID+183, 3724, 1, 250.021, -3047.69, 96.0069, 4.55531, 0, 0, -0.760406, 0.649449, 900, 900, 1, 100, 0, 10), 
(@OGUID+184, 3724, 1, -182.081, -2814.53, 91.9249, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), 
(@OGUID+185, 3724, 1, -158.029, -3378.55, 92.3938, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), 
(@OGUID+186, 3724, 1, -1352.04, -3855.47, 17.8905, 3.89209, 0, 0, -0.930417, 0.366502, 900, 900, 1, 100, 0, 10), 
(@OGUID+187, 3724, 1, 390.577, -3414.15, 95.0342, 0.453785, 0, 0, 0.224951, 0.97437, 900, 900, 1, 100, 0, 10), 
(@OGUID+188, 3724, 1, -980.281, -2982.13, 92.5597, 1.76278, 0, 0, 0.771625, 0.636078, 900, 900, 1, 100, 0, 10), 
(@OGUID+189, 3724, 1, -415.769, -2054.01, 91.667, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+190, 3724, 1, -47.8642, -3250.27, 91.6675, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10),
(@OGUID+191, 3724, 1, -38.719, -1721.96, 94.7992, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+2, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+3, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+4, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+5, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+6, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+7, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+8, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+9, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+10, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+11, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+12, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+13, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+14, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+15, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+16, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+17, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+18, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+19, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+20, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+21, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+22, 1017, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Dun Morogh 41 objects total
(@OGUID+23, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+24, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+25, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+26, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+27, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+28, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+29, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+30, 1012, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Elwynn Forest 34 objects total
(@OGUID+31, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+32, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+33, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+34, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+35, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+36, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+37, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+38, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+39, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+40, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+41, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+42, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+43, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+44, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+45, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+46, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+47, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+48, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+49, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+50, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+51, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+52, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+53, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+54, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+55, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+56, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+57, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+58, 1020, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Durotar 53 objects total
(@OGUID+59, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+60, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+61, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+62, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+63, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+64, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+65, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+66, 1161, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Loch Modan 19 objects total
(@OGUID+67, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+68, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+69, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+70, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+71, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+72, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+73, 1107, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Westfall 15 objects total
(@OGUID+74, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(@OGUID+75, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(@OGUID+76, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(@OGUID+77, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(@OGUID+78, 1006, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Tirisfal 51 objects total
(@OGUID+79, 1041, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Silverpine Forest 34 objects total
(@OGUID+80, 1041, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Silverpine Forest 34 objects total
(@OGUID+81, 1041, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Silverpine Forest 34 objects total
(@OGUID+82, 1041, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Silverpine Forest 34 objects total
(@OGUID+83, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+84, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+85, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+86, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+87, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+88, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+89, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+90, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+91, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+92, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+93, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+94, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+95, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+96, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+97, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+98, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+99, 1002, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Teldrassil 42 objects total
(@OGUID+100, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(@OGUID+101, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(@OGUID+102, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(@OGUID+103, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(@OGUID+104, 1096, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Darkshore 18 objects total
(@OGUID+105, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+106, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+107, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+108, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+109, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+110, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+111, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+112, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+113, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+114, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+115, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+116, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+117, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+118, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+119, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+120, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+121, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+122, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+123, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+124, 1026, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Mulgore 56 objects total
(@OGUID+125, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+126, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+127, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+128, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+129, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+130, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+131, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+132, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+133, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+134, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+135, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+136, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+137, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+138, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+139, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+140, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+141, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+142, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+143, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+144, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+145, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+146, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+147, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+148, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+149, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+150, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+151, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+152, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+153, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+154, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+155, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+156, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+157, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+158, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+159, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+160, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+161, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+162, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+163, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+164, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+165, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+166, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+167, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+168, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+169, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+170, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+171, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+172, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+173, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+174, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+175, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+176, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+177, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+178, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+179, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+180, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+181, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+182, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+183, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+184, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+185, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+186, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+187, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+188, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+189, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+190, 1030, 0, 'Peacebloom', 0, 10), -- Peaceblooms in Barrens 86 objects total
(@OGUID+191, 1030, 0, 'Peacebloom', 0, 10); -- Peaceblooms in Barrens 86 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Peacebloom in Darkshore' WHERE  `entry`=1096;
UPDATE `pool_template` SET `description`='Peacebloom in Barrens' WHERE  `entry`=1030;
UPDATE `pool_template` SET `description`='Peacebloom in Dun Morogh' WHERE  `entry`=1017;
UPDATE `pool_template` SET `description`='Peacebloom in Durotar' WHERE  `entry`=1020;
UPDATE `pool_template` SET `description`='Peacebloom in Elwynn Forest' WHERE  `entry`=1012;
UPDATE `pool_template` SET `description`='Peacebloom in Loch Modan' WHERE  `entry`=1161;
UPDATE `pool_template` SET `description`='Peacebloom in Mulgore' WHERE  `entry`=1026;
UPDATE `pool_template` SET `description`='Peacebloom in Redridge' WHERE  `entry`=1125;
UPDATE `pool_template` SET `description`='Peacebloom in Silverpine Forest' WHERE  `entry`=1041;
UPDATE `pool_template` SET `description`='Peacebloom in Teldrassil' WHERE  `entry`=1002;
UPDATE `pool_template` SET `description`='Peacebloom in Tirisfal' WHERE  `entry`=1006;
UPDATE `pool_template` SET `description`='Peacebloom in Westfall' WHERE  `entry`=1107;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (1738, 1428, 1601, 1436, 1439, 1574, 1345, 1367, 1363, 1369, 1392, 1346, 1355, 1372, 1373, 1375, 1376, 1395, 1398, 1404, 1410, 1411, 1412, 1413, 1414, 1419, 1429, 1434, 1440, 1459, 1464, 1470, 1471, 1475, 1480, 1481, 1485, 1490, 1505, 1506, 1509, 1511, 1512, 1513, 1514, 1522, 1524, 1528, 1536, 1538, 1539, 1544, 1550, 1559, 1560, 1563, 1567, 1573, 1575, 1584, 1587, 1592, 1594, 1606, 1622, 1630, 1633, 1634, 1642, 1644, 1649, 1654, 1661, 1662, 1663, 1665, 1667, 1668, 1677, 1693, 1702, 1704, 1714, 1730, 1737, 1742, 12355, 12477, 12524, 12525, 12567, 32521, 55890);
DELETE FROM `pool_gameobject` WHERE `guid` IN (1738, 1428, 1601, 1436, 1439, 1574, 1345, 1367, 1363, 1369, 1392, 1346, 1355, 1372, 1373, 1375, 1376, 1395, 1398, 1404, 1410, 1411, 1412, 1413, 1414, 1419, 1429, 1434, 1440, 1459, 1464, 1470, 1471, 1475, 1480, 1481, 1485, 1490, 1505, 1506, 1509, 1511, 1512, 1513, 1514, 1522, 1524, 1528, 1536, 1538, 1539, 1544, 1550, 1559, 1560, 1563, 1567, 1573, 1575, 1584, 1587, 1592, 1594, 1606, 1622, 1630, 1633, 1634, 1642, 1644, 1649, 1654, 1661, 1662, 1663, 1665, 1667, 1668, 1677, 1693, 1702, 1704, 1714, 1730, 1737, 1742, 12355, 12477, 12524, 12525, 12567, 32521, 55890);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (3724, 1618);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1125;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1107;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1096;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1161;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1041;
UPDATE `pool_template` SET `max_limit`=34 WHERE  `entry`=1030;
UPDATE `pool_template` SET `max_limit`=34 WHERE  `entry`=1026;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1020;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1002;
UPDATE `pool_template` SET `max_limit`=31 WHERE  `entry`=1006;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1012;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1017;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
