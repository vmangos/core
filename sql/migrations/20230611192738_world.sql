DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230611192738');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230611192738');
-- Add your query below.


-- Kingsblood (1624)
SET @OGUID = 43326;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.744806 yards).
UPDATE `gameobject` SET `position_x`=-6023.53, `position_y`=-3794.54, `position_z`=-58.75, `orientation`=5.63741, `rotation0`=0, `rotation1`=0, `rotation2`=-0.317305, `rotation3`=0.948324 WHERE `guid`=4359;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.898815 yards).
UPDATE `gameobject` SET `position_x`=-6249.16, `position_y`=-3551.2, `position_z`=-58.7499, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=4356;

-- Correct position of Kingsblood in The Barrens (position is off by 0.479054 yards).
UPDATE `gameobject` SET `position_x`=-4111.47, `position_y`=-1954.08, `position_z`=91.9037, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=4406;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 1.02303 yards).
UPDATE `gameobject` SET `position_x`=2408.39, `position_y`=1116.03, `position_z`=311.155, `orientation`=2.14675, `rotation0`=0, `rotation1`=0, `rotation2`=0.878817, `rotation3`=0.47716 WHERE `guid`=4429;

-- Correct position of Kingsblood in Desolace (position is off by 0.763617 yards).
UPDATE `gameobject` SET `position_x`=-982.269, `position_y`=1717.79, `position_z`=61.5822, `orientation`=1.36136, `rotation0`=0, `rotation1`=0, `rotation2`=0.62932, `rotation3`=0.777146 WHERE `guid`=4340;

-- Correct position of Kingsblood in Swamp of Sorrows (position is off by 1.49243 yards).
UPDATE `gameobject` SET `position_x`=-10226.6, `position_y`=-3333.69, `position_z`=22.4027, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=4280;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 1.36557 yards).
UPDATE `gameobject` SET `position_x`=-11968.7, `position_y`=67.8222, `position_z`=13.6903, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=4305;

-- Correct position of Kingsblood in Badlands (position is off by 0.581931 yards).
UPDATE `gameobject` SET `position_x`=-6950.24, `position_y`=-2351.53, `position_z`=240.744, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=4386;

-- Correct position of Kingsblood in Badlands (position is off by 0.30802 yards).
UPDATE `gameobject` SET `position_x`=-6713.75, `position_y`=-2715.18, `position_z`=241.668, `orientation`=4.43314, `rotation0`=0, `rotation1`=0, `rotation2`=-0.798635, `rotation3`=0.601815 WHERE `guid`=4381;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.834636 yards).
UPDATE `gameobject` SET `position_x`=-5518.8, `position_y`=-2254.82, `position_z`=-59.8433, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=4428;

-- Correct position of Kingsblood in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-3652.88, `position_y`=-2094.61, `position_z`=92.8224, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=4043;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.125032 yards).
UPDATE `gameobject` SET `position_x`=184.216, `position_y`=42.8294, `position_z`=55.9464, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=4354;

-- Correct position of Kingsblood in Duskwood (position is off by 1.30492 yards).
UPDATE `gameobject` SET `position_x`=-10967.3, `position_y`=-865.113, `position_z`=64.4771, `orientation`=5.93412, `rotation0`=0, `rotation1`=0, `rotation2`=-0.173648, `rotation3`=0.984808 WHERE `guid`=4377;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.950773 yards).
UPDATE `gameobject` SET `position_x`=-47.9175, `position_y`=116.629, `position_z`=58.5075, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=4278;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.92714 yards).
UPDATE `gameobject` SET `position_x`=-1090.85, `position_y`=-2608.37, `position_z`=48.9337, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=4322;

-- Correct position of Kingsblood in Alterac Mountains (position is off by 0.765419 yards).
UPDATE `gameobject` SET `position_x`=-128.47, `position_y`=-603.544, `position_z`=161.321, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4371;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.08481 yards).
UPDATE `gameobject` SET `position_x`=-379.078, `position_y`=-421.901, `position_z`=53.1298, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=4299;

-- Correct position of Kingsblood in The Barrens (position is off by 0.143099 yards).
UPDATE `gameobject` SET `position_x`=-1983.06, `position_y`=-2750.87, `position_z`=91.7331, `orientation`=0.715585, `rotation0`=0, `rotation1`=0, `rotation2`=0.350207, `rotation3`=0.936672 WHERE `guid`=4387;

-- Correct position of Kingsblood in Badlands (position is off by 0.655742 yards).
UPDATE `gameobject` SET `position_x`=-6815.46, `position_y`=-2875.63, `position_z`=242.118, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=4427;

-- Correct position of Kingsblood in Wetlands (position is off by 1.58815 yards).
UPDATE `gameobject` SET `position_x`=-2947.88, `position_y`=-2521.12, `position_z`=28.3675, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=4277;

-- Correct position of Kingsblood in Dustwallow Marsh (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-2414.87, `position_y`=-3147.57, `position_z`=33.3782, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid`=12566;

-- Correct position of Kingsblood in Badlands (position is off by 0.833031 yards).
UPDATE `gameobject` SET `position_x`=-6085.17, `position_y`=-3316.07, `position_z`=256.427, `orientation`=3.57793, `rotation0`=0, `rotation1`=0, `rotation2`=-0.976295, `rotation3`=0.216442 WHERE `guid`=4378;

-- Correct position of Kingsblood in Desolace (position is off by 0.664822 yards).
UPDATE `gameobject` SET `position_x`=-966.763, `position_y`=2083.74, `position_z`=62.1497, `orientation`=6.05629, `rotation0`=0, `rotation1`=0, `rotation2`=-0.113203, `rotation3`=0.993572 WHERE `guid`=4286;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.55357 yards).
UPDATE `gameobject` SET `position_x`=-6613.46, `position_y`=-3584.18, `position_z`=-58.75, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=4300;

-- Correct position of Kingsblood in The Barrens (position is off by 0.100098 yards).
UPDATE `gameobject` SET `position_x`=-3135, `position_y`=-2235.9, `position_z`=91.9488, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=4295;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.941376 yards).
UPDATE `gameobject` SET `position_x`=-12910.7, `position_y`=146.39, `position_z`=24.5323, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=4418;

-- Correct position of Kingsblood in The Barrens (position is off by 0.294992 yards).
UPDATE `gameobject` SET `position_x`=-1857.72, `position_y`=-3239.05, `position_z`=81.4051, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=4288;

-- Correct position of Kingsblood in Desolace (position is off by 0.0600587 yards).
UPDATE `gameobject` SET `position_x`=-1770.06, `position_y`=1433.31, `position_z`=61.1111, `orientation`=2.09439, `rotation0`=0, `rotation1`=0, `rotation2`=0.866025, `rotation3`=0.500001 WHERE `guid`=4334;

-- Correct position of Kingsblood in The Barrens (position is off by 1.26963 yards).
UPDATE `gameobject` SET `position_x`=-2098.81, `position_y`=-1931.56, `position_z`=96.9205, `orientation`=5.14872, `rotation0`=0, `rotation1`=0, `rotation2`=-0.537299, `rotation3`=0.843392 WHERE `guid`=4329;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.132314 yards).
UPDATE `gameobject` SET `position_x`=-1275.89, `position_y`=-2752.05, `position_z`=51.2921, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=4337;

-- Correct position of Kingsblood in Badlands (position is off by 1.80106 yards).
UPDATE `gameobject` SET `position_x`=-7046, `position_y`=-3581.79, `position_z`=241.981, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=39959;

-- Correct position of Kingsblood in Badlands (position is off by 0.15387 yards).
UPDATE `gameobject` SET `position_x`=-7086.86, `position_y`=-2413.03, `position_z`=243.603, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=4297;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.841431 yards).
UPDATE `gameobject` SET `position_x`=-12267.8, `position_y`=-422.817, `position_z`=17.3265, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=4392;

-- Correct position of Kingsblood in The Barrens (position is off by 1.15984 yards).
UPDATE `gameobject` SET `position_x`=-3917.17, `position_y`=-2119.19, `position_z`=91.6857, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=4298;

-- Correct position of Kingsblood in Badlands (position is off by 0.591394 yards).
UPDATE `gameobject` SET `position_x`=-6788.19, `position_y`=-3120.44, `position_z`=240.652, `orientation`=1.90241, `rotation0`=0, `rotation1`=0, `rotation2`=0.814116, `rotation3`=0.580703 WHERE `guid`=4395;

-- Correct position of Kingsblood in The Barrens (position is off by 0.403726 yards).
UPDATE `gameobject` SET `position_x`=-2911.27, `position_y`=-1992.3, `position_z`=93.0076, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=4347;

-- Correct position of Kingsblood in Desolace (position is off by 0.960711 yards).
UPDATE `gameobject` SET `position_x`=-1441.04, `position_y`=2290.71, `position_z`=93.0318, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=4358;

-- Correct position of Kingsblood in Arathi Highlands (position is off by 0.730854 yards).
UPDATE `gameobject` SET `position_x`=-1453.69, `position_y`=-2851.24, `position_z`=40.1021, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=4408;

-- Correct position of Kingsblood in Ashenvale (position is off by 0.842472 yards).
UPDATE `gameobject` SET `position_x`=2918.35, `position_y`=-3461.84, `position_z`=120.189, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=4368;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.241916 yards).
UPDATE `gameobject` SET `position_x`=1500.01, `position_y`=1400.27, `position_z`=142.972, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=4370;

-- Correct position of Kingsblood in The Barrens (position is off by 0.867616 yards).
UPDATE `gameobject` SET `position_x`=-2581.38, `position_y`=-2315.22, `position_z`=91.6668, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=4379;

-- Correct position of Kingsblood in Duskwood (position is off by 0.94291 yards).
UPDATE `gameobject` SET `position_x`=-11011.1, `position_y`=-949.232, `position_z`=65.1183, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=4309;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.977442 yards).
UPDATE `gameobject` SET `position_x`=-242.454, `position_y`=82.7269, `position_z`=64.4676, `orientation`=3.89209, `rotation0`=0, `rotation1`=0, `rotation2`=-0.930417, `rotation3`=0.366502 WHERE `guid`=4369;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.797746 yards).
UPDATE `gameobject` SET `position_x`=625.229, `position_y`=1695.67, `position_z`=-18.8574, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=4292;

-- Correct position of Kingsblood in Wetlands (position is off by 0.336149 yards).
UPDATE `gameobject` SET `position_x`=-3054.71, `position_y`=-2842.83, `position_z`=25.5066, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=4375;

-- Correct position of Kingsblood in Wetlands (position is off by 0.404033 yards).
UPDATE `gameobject` SET `position_x`=-3985.61, `position_y`=-2900.04, `position_z`=12.3601, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=4357;

-- Correct position of Kingsblood in Duskwood (position is off by 0.646297 yards).
UPDATE `gameobject` SET `position_x`=-11053.7, `position_y`=-822.482, `position_z`=58.9241, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515038, `rotation3`=0.857168 WHERE `guid`=4407;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.623553 yards).
UPDATE `gameobject` SET `position_x`=-4380.46, `position_y`=-995.393, `position_z`=-55.849, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid`=4348;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.494382 yards).
UPDATE `gameobject` SET `position_x`=-11686.6, `position_y`=-31.29, `position_z`=13.9421, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4312;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.914066 yards).
UPDATE `gameobject` SET `position_x`=-12319.2, `position_y`=-471.44, `position_z`=15.7438, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=4362;

-- Correct position of Kingsblood in Badlands (position is off by 0.542233 yards).
UPDATE `gameobject` SET `position_x`=-7050.53, `position_y`=-2849.27, `position_z`=242.1, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=4352;

-- Correct position of Kingsblood in Thousand Needles (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5371.22, `position_y`=-1649.36, `position_z`=-54.8743, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=10415;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.993553 yards).
UPDATE `gameobject` SET `position_x`=-12127.5, `position_y`=190.618, `position_z`=14.4632, `orientation`=0.471238, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=0.97237 WHERE `guid`=4333;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.139325 yards).
UPDATE `gameobject` SET `position_x`=-11865, `position_y`=232.543, `position_z`=16.3644, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=4430;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.96143 yards).
UPDATE `gameobject` SET `position_x`=-11767.3, `position_y`=413.076, `position_z`=44.5881, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=4326;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.914177 yards).
UPDATE `gameobject` SET `position_x`=-11699.6, `position_y`=-823.69, `position_z`=35.5478, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=4285;

-- Correct position of Kingsblood in The Barrens (position is off by 0.184386 yards).
UPDATE `gameobject` SET `position_x`=-3420.14, `position_y`=-2177.12, `position_z`=91.6667, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=4342;

-- Correct position of Kingsblood in Ashenvale (position is off by 1.10902 yards).
UPDATE `gameobject` SET `position_x`=2080.19, `position_y`=-2744.77, `position_z`=108.548, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=4423;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.124618 yards).
UPDATE `gameobject` SET `position_x`=-551.877, `position_y`=213.812, `position_z`=69.3841, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=4346;

-- Correct position of Kingsblood in The Barrens (position is off by 0.532546 yards).
UPDATE `gameobject` SET `position_x`=-3207.59, `position_y`=-1790.34, `position_z`=91.6667, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=4330;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 1.10271 yards).
UPDATE `gameobject` SET `position_x`=581.357, `position_y`=1533.65, `position_z`=-10.7468, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=4283;

-- Correct position of Kingsblood in The Barrens (position is off by 0.952289 yards).
UPDATE `gameobject` SET `position_x`=-3718.66, `position_y`=-2255.68, `position_z`=92.7322, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=4405;

-- Correct position of Kingsblood in Badlands (position is off by 0.668633 yards).
UPDATE `gameobject` SET `position_x`=-6783.38, `position_y`=-4044.25, `position_z`=266.662, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=4421;

-- Correct position of Kingsblood in Wailing Caverns (position is off by 1.15211 yards).
UPDATE `gameobject` SET `position_x`=-548.032, `position_y`=-2306.91, `position_z`=34.6002, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=4324;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 1.21684 yards).
UPDATE `gameobject` SET `position_x`=-12278.7, `position_y`=42.6145, `position_z`=17.8215, `orientation`=1.06465, `rotation0`=0, `rotation1`=0, `rotation2`=0.507538, `rotation3`=0.861629 WHERE `guid`=4412;

-- Correct position of Kingsblood in Duskwood (position is off by 0.384104 yards).
UPDATE `gameobject` SET `position_x`=-10245, `position_y`=385.006, `position_z`=56.0608, `orientation`=2.18166, `rotation0`=0, `rotation1`=0, `rotation2`=0.887011, `rotation3`=0.461749 WHERE `guid`=4319;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.33657 yards).
UPDATE `gameobject` SET `position_x`=-713.182, `position_y`=-1530.38, `position_z`=56.3959, `orientation`=0.890117, `rotation0`=0, `rotation1`=0, `rotation2`=0.430511, `rotation3`=0.902586 WHERE `guid`=4416;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 1.27175 yards).
UPDATE `gameobject` SET `position_x`=-689.932, `position_y`=-1151.69, `position_z`=58.9228, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=4282;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.903667 yards).
UPDATE `gameobject` SET `position_x`=-799.672, `position_y`=-387.842, `position_z`=17.5608, `orientation`=1.39626, `rotation0`=0, `rotation1`=0, `rotation2`=0.642787, `rotation3`=0.766045 WHERE `guid`=4318;

-- Correct position of Kingsblood in Stonetalon Mountains (position is off by 0.953437 yards).
UPDATE `gameobject` SET `position_x`=-28.7197, `position_y`=-721.868, `position_z`=-7.72236, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=4303;

-- Correct position of Kingsblood in Hillsbrad Foothills (position is off by 0.854686 yards).
UPDATE `gameobject` SET `position_x`=-1081.2, `position_y`=-1133.3, `position_z`=51.1375, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=4313;

-- Correct position of Kingsblood in Duskwood (position is off by 0.270206 yards).
UPDATE `gameobject` SET `position_x`=-10582.2, `position_y`=72.5619, `position_z`=40.2747, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=4345;

-- Correct position of Kingsblood in Stranglethorn Vale (position is off by 0.860905 yards).
UPDATE `gameobject` SET `position_x`=-12647.3, `position_y`=-690.193, `position_z`=44.1882, `orientation`=5.88176, `rotation0`=0, `rotation1`=0, `rotation2`=-0.199368, `rotation3`=0.979925 WHERE `guid`=4425;

-- Missing Kingsblood spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1624, 0, -7047.88, -3445.9, 244.803, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+2, 1624, 0, -6985.95, -2514.76, 243.313, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 1, 100, 0, 10), 
(@OGUID+3, 1624, 0, -6949.4, -2819.11, 242.209, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10), 
(@OGUID+4, 1624, 0, -6948.58, -2952.54, 241.874, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10), 
(@OGUID+5, 1624, 0, -6719.54, -4116.39, 263.889, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), 
(@OGUID+6, 1624, 0, -7211.69, -2445.68, 247.508, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1624, 0, -6950.24, -2351.53, 240.744, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1624, 0, -6946.38, -3949.32, 263.889, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1624, 0, -6886.74, -3548.64, 242.381, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1624, 0, -6281.22, -3687.36, 244.144, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 1624, 0, -10124.8, -3588.34, 23.4905, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+12, 1624, 0, -10076.5, -3834.19, 23.5613, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+13, 1624, 0, -10327.3, -3494.82, 22.9893, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10), 
(@OGUID+14, 1624, 0, -10021.9, -3956.02, 21.9921, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 1, 100, 0, 10), 
(@OGUID+15, 1624, 0, -10339.8, -4218.48, 22.6371, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), 
(@OGUID+16, 1624, 0, -10677.2, -3810.53, 23.3097, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+17, 1624, 0, -10651.6, -4118.64, 21.6778, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1624, 0, -10570.3, -3629.32, 23.0765, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1624, 0, -10190.2, -3958.08, 24.2028, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1624, 0, -10102.7, -3706.81, 21.6843, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10),
(@OGUID+21, 1624, 0, -10098.9, -3126.8, 23.5246, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+22, 1624, 0, -9809.94, -3791.36, 23.7875, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 1624, 0, -10525.1, -911.581, 46.8991, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+24, 1624, 0, -10439, -864.635, 46.4699, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10), 
(@OGUID+25, 1624, 0, -10799.6, -666.59, 40.8933, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), 
(@OGUID+26, 1624, 0, -11006.6, -859.188, 62.6391, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10), 
(@OGUID+27, 1624, 0, -10598.5, -952.971, 53.2791, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), 
(@OGUID+28, 1624, 0, -10943.8, 243.869, 28.5117, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), 
(@OGUID+29, 1624, 0, -10229.6, -33.3671, 32.1215, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10), 
(@OGUID+30, 1624, 0, -10710.7, 442.859, 41.0738, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+31, 1624, 0, -10628, -49.8506, 33.4616, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10), 
(@OGUID+32, 1624, 0, -10292.2, -70.4041, 45.2325, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10), 
(@OGUID+33, 1624, 0, -11093.2, -866.02, 61.4684, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10),
(@OGUID+34, 1624, 0, -11053.7, -822.482, 58.9241, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 1, 100, 0, 10),
(@OGUID+35, 1624, 0, -10967.3, -865.113, 64.4771, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10),
(@OGUID+36, 1624, 0, -10582.2, 72.5625, 40.2747, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+37, 1624, 0, -10544.6, -821.585, 53.1926, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+38, 1624, 0, -10421.8, -46.0271, 46.757, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+39, 1624, 0, -10340.4, -28.8124, 45.1232, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 1624, 0, -2924.11, -1349.44, 9.14602, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), 
(@OGUID+41, 1624, 0, -3175.66, -952.048, 9.59336, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+42, 1624, 0, -3066.41, -2901.28, 24.6022, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 1, 100, 0, 10), 
(@OGUID+43, 1624, 0, -3368.22, -2250.94, 51.8282, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+44, 1624, 0, -3488.41, -1359.98, 11.2726, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10), 
(@OGUID+45, 1624, 0, -3484.24, -2721.16, 10.8223, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), 
(@OGUID+46, 1624, 0, -3097.8, -2239.42, 9.85018, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+47, 1624, 0, -3357.61, -2803.33, 17.5986, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 1, 100, 0, 10), 
(@OGUID+48, 1624, 0, -3692.01, -3027.69, 14.4341, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+49, 1624, 0, -2783.93, -1984.39, 26.1942, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 1, 100, 0, 10), 
(@OGUID+50, 1624, 0, -3673.22, -2901.01, 12.9926, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+51, 1624, 0, -4208.64, -2932.39, 12.0015, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 1, 100, 0, 10),
(@OGUID+52, 1624, 0, -3645.31, -3078.01, 20.6665, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+53, 1624, 0, -3340.73, -1665.4, 9.06436, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10),
(@OGUID+54, 1624, 0, -3323.63, -2958.98, 24.24, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 1, 100, 0, 10),
(@OGUID+55, 1624, 0, -3287.4, -2879.73, 14.3287, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+56, 1624, 0, -3190.35, -2841.49, 19.6929, 0, 0, 0, 0, 1, 300, 300, 1, 100, 0, 10),
(@OGUID+57, 1624, 0, -3154.4, -1146.35, 9.47062, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+58, 1624, 0, -3111.52, -1504.16, 9.60414, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+59, 1624, 0, -3088.26, -2984.81, 31.8588, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+60, 1624, 0, -3053.71, -1153.92, 9.15203, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 1, 100, 0, 10),
(@OGUID+61, 1624, 0, -2977.79, -1225.19, 10.514, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 1, 100, 0, 10),
(@OGUID+62, 1624, 0, -2960.91, -2888.44, 31.2458, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+63, 1624, 0, -2955.9, -2152.34, 17.3827, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+64, 1624, 0, -2918.9, -1936.91, 10.3703, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 1624, 1, -3037.78, -4030.53, 39.2131, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+66, 1624, 1, -2750.72, -3012.27, 36.799, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 1, 100, 0, 10), 
(@OGUID+67, 1624, 1, -3445.04, -3119.92, 39.4034, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), 
(@OGUID+68, 1624, 1, -3661.01, -3444, 40.2866, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+69, 1624, 1, -3571.68, -2939.54, 34.2335, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 1, 100, 0, 10), 
(@OGUID+70, 1624, 1, -3545.88, -3147.84, 37.2179, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+71, 1624, 1, -2989.42, -3720.05, 38.4237, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+72, 1624, 1, -3133.65, -3765.89, 40.7043, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+73, 1624, 1, -4961.62, -3774.7, 43.3541, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10),
(@OGUID+74, 1624, 1, -3564.58, -3356.95, 39.8302, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+75, 1624, 1, -3542.47, -3233.05, 33.469, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 1, 100, 0, 10),
(@OGUID+76, 1624, 1, -2936.24, -2992.23, 39.6691, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+77, 1624, 1, -2928.83, -3152.38, 32.1462, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+78, 1624, 1, -2677.95, -3441.69, 33.7274, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 0, 10),
(@OGUID+79, 1624, 1, -2649.16, -3052.41, 34.5825, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 1624, 1, -3254.12, -1900.28, 96.5674, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), 
(@OGUID+81, 1624, 1, -1945.03, -3406.26, 58.9039, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), 
(@OGUID+82, 1624, 1, -3879.04, -2228.16, 91.6667, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+83, 1624, 1, -3752.99, -1823.72, 93.9388, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), 
(@OGUID+84, 1624, 1, -3754.5, -2373.85, 94.315, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+85, 1624, 1, -3751.89, -1915.54, 92.8664, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 1, 100, 0, 10), 
(@OGUID+86, 1624, 1, -3783.09, -2183.34, 93.6768, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), 
(@OGUID+87, 1624, 1, -3776.07, -1657.71, 93.783, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), 
(@OGUID+88, 1624, 1, -3079.82, -1797.63, 91.8474, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 1, 100, 0, 10), 
(@OGUID+89, 1624, 1, -2711.57, -1954.99, 96.872, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+90, 1624, 1, -3524.82, -2403.04, 93.692, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10),
(@OGUID+91, 1624, 1, -3176.27, -1678.22, 93.9239, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+92, 1624, 1, -645.017, -2182.7, 45.0493, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+93, 1624, 0, -12395.4, -141.24, 15.1016, 2.77507, 0, 0, 0.983254, 0.182238, 300, 300, 1, 100, 0, 10), 
(@OGUID+94, 1624, 0, -13428.5, 669.158, 9.00704, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+95, 1624, 0, -12670.5, -845.013, 53.1218, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 1, 100, 0, 10), 
(@OGUID+96, 1624, 0, -11801.7, 401.433, 44.6777, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), 
(@OGUID+97, 1624, 0, -12248.2, -674.489, 13.2555, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 1, 100, 0, 10), 
(@OGUID+98, 1624, 0, -12786.9, -108.016, 4.81024, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 1, 100, 0, 10), 
(@OGUID+99, 1624, 0, -13038.2, 338.762, 20.095, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 1, 100, 0, 10), 
(@OGUID+100, 1624, 0, -11969.3, 117.251, 10.1975, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+101, 1624, 0, -12200.6, 139.857, 18.0954, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), 
(@OGUID+102, 1624, 0, -12147.8, -712.958, 17.1765, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), 
(@OGUID+103, 1624, 0, -11982.3, -852.595, 32.9149, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), 
(@OGUID+104, 1624, 0, -13340, 168.89, 17.202, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+105, 1624, 0, -11965.1, -775.195, 18.2167, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+106, 1624, 0, -11871.1, -181.152, 16.7947, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10), 
(@OGUID+107, 1624, 0, -12081.5, -745.165, 12.3231, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 1, 100, 0, 10), 
(@OGUID+108, 1624, 0, -14568.4, -274.916, 10.8226, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10),
(@OGUID+109, 1624, 0, -14251.7, 167.011, 8.42443, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10),
(@OGUID+110, 1624, 0, -13677.6, 160.625, 19.4787, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 1, 100, 0, 10),
(@OGUID+111, 1624, 0, -13553.8, -52.8517, 37.6507, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+112, 1624, 0, -12982.4, 420.514, 22.3835, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+113, 1624, 0, -12936.1, -101.248, 9.86482, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 1, 100, 0, 10),
(@OGUID+114, 1624, 0, -12902.9, -413.029, 12.7534, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10),
(@OGUID+115, 1624, 0, -12831.6, -396.684, 12.988, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+116, 1624, 0, -12784.7, -836.069, 73.1916, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 1, 100, 0, 10),
(@OGUID+117, 1624, 0, -12764.4, -100.989, 4.98139, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+118, 1624, 0, -12735.8, -793.108, 61.9712, 3.52557, 0, 0, -0.981627, 0.190812, 300, 300, 1, 100, 0, 10),
(@OGUID+119, 1624, 0, -12578.8, -316.035, 17.163, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10),
(@OGUID+120, 1624, 0, -12538.3, -867.748, 44.9784, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+121, 1624, 0, -12370.6, -777.573, 31.2368, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10),
(@OGUID+122, 1624, 0, -12192.7, -957.745, 32.7122, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+123, 1624, 0, -12135.6, -598.053, 14.6153, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+124, 1624, 0, -11997.5, 193.182, 12.6736, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+125, 1624, 0, -11863.4, 227.355, 16.5258, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+126, 1624, 0, -11860.5, 514.879, 45.4441, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10),
(@OGUID+127, 1624, 0, -11772.3, -665.829, 36.403, 2.19911, 0, 0, 0.891006, 0.453991, 300, 300, 1, 100, 0, 10),
(@OGUID+128, 1624, 0, -11587.4, 375.841, 46.8417, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(@OGUID+129, 1624, 0, -11572.2, -883.872, 68.9416, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+130, 1624, 0, 1084.62, -621.656, 90.2999, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), 
(@OGUID+131, 1624, 0, -60.0194, -194.283, 131.666, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+132, 1624, 0, -119.69, -310.971, 144.306, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 1, 100, 0, 10), 
(@OGUID+133, 1624, 0, 475.342, -957.903, 131.565, 1.5708, 0, 0, 0.707107, 0.707107, 300, 300, 1, 100, 0, 10), 
(@OGUID+134, 1624, 0, 192.174, -601.28, 126.948, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), 
(@OGUID+135, 1624, 0, -281.561, -486.143, 61.6453, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 1, 100, 0, 10),
(@OGUID+136, 1624, 0, -57.2439, -556.413, 153.507, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+137, 1624, 0, -50.2177, -112.871, 131.619, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+138, 1624, 0, 34.2845, -419.355, 126.663, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 1, 100, 0, 10),
(@OGUID+139, 1624, 0, 41.7752, -515.287, 142.47, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10),
(@OGUID+140, 1624, 0, 51.3582, 51.9281, 55.5354, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+141, 1624, 0, 276.484, -776.265, 136.475, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+142, 1624, 0, 311.622, -587.455, 147.868, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10),
(@OGUID+143, 1624, 0, 341.968, -20.3998, 142.461, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 1, 100, 0, 10),
(@OGUID+144, 1624, 0, 782.181, -823.941, 165.031, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+145, 1624, 0, 1018.67, -655.237, 105.711, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+146, 1624, 0, -1686.45, -2779.43, 46.748, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 1, 100, 0, 10), 
(@OGUID+147, 1624, 0, -1726.49, -2720.18, 41.8945, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10), 
(@OGUID+148, 1624, 0, -984.745, -3346.48, 56.8505, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+149, 1624, 0, -1052.49, -1983.44, 67.8225, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), 
(@OGUID+150, 1624, 0, -1193.48, -3173.99, 42.3659, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10), 
(@OGUID+151, 1624, 0, -1215.86, -2982.48, 46.8069, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+152, 1624, 0, -1163.82, -1529.36, 56.8556, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 1, 100, 0, 10), 
(@OGUID+153, 1624, 0, -1053.47, -1787.58, 59.3678, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10), 
(@OGUID+154, 1624, 0, -1081.28, -3111.25, 48.0621, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 1, 100, 0, 10), 
(@OGUID+155, 1624, 0, -1753.49, -3076.76, 27.4752, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 1, 100, 0, 10),
(@OGUID+156, 1624, 0, -1546.05, -2410.19, 76.3865, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10),
(@OGUID+157, 1624, 0, -1053.47, -1913.41, 62.1433, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+158, 1624, 0, -187.114, -1285.37, 106.141, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 1, 100, 0, 10), 
(@OGUID+159, 1624, 0, -1118.94, -989.685, 56.5378, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 1, 100, 0, 10), 
(@OGUID+160, 1624, 0, -904.452, -1262.58, 52.616, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 1, 100, 0, 10), 
(@OGUID+161, 1624, 0, -906.656, -868.855, 25.3802, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), 
(@OGUID+162, 1624, 0, -713.998, -1279.64, 61.4431, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 1, 100, 0, 10), 
(@OGUID+163, 1624, 0, -522.197, -157.553, 52.367, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+164, 1624, 0, -1187.6, -1105.92, 39.8971, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 1, 100, 0, 10),
(@OGUID+165, 1624, 0, -957.093, -11.6541, 29.5612, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 1, 100, 0, 10),
(@OGUID+166, 1624, 0, -867.904, -206.734, 40.543, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 1, 100, 0, 10),
(@OGUID+167, 1624, 0, -823.311, -1380.93, 66.2461, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+168, 1624, 0, -437.022, -322.164, 53.886, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+169, 1624, 0, -297.889, -128.26, 64.3352, 4.24115, 0, 0, -0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+170, 1624, 0, -259.695, -648.123, 55.4536, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 1, 100, 0, 10),
(@OGUID+171, 1624, 0, 266.834, -1033.28, 78.7409, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+172, 1624, 1, 3357.22, 592.805, 3.73639, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 1, 100, 0, 10), 
(@OGUID+173, 1624, 1, 2849.34, -1983.63, 163.306, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+174, 1624, 1, 3094.44, -1596.81, 188.203, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 1, 100, 0, 10), 
(@OGUID+175, 1624, 1, 3013.79, -1848.96, 170.763, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 1, 100, 0, 10), 
(@OGUID+176, 1624, 1, 2552.5, -1973.38, 143.599, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 1, 100, 0, 10), 
(@OGUID+177, 1624, 1, 2111.2, -3017.49, 111.796, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 1, 100, 0, 10), 
(@OGUID+178, 1624, 1, 4030.25, 164.387, 4.05102, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 1, 100, 0, 10), 
(@OGUID+179, 1624, 1, 2192.14, -972.788, 94.6969, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), 
(@OGUID+180, 1624, 1, 2852.96, -785.46, 156.364, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10), 
(@OGUID+181, 1624, 1, 2309.54, -944.396, 88.0331, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+182, 1624, 1, 2132.78, -2968.13, 114.307, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+183, 1624, 1, 2857.16, -2521.59, 220.353, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+184, 1624, 1, 3178.81, 657.709, 2.36676, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 1, 100, 0, 10), 
(@OGUID+185, 1624, 1, 2122.18, -613.062, 104.745, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10),
(@OGUID+186, 1624, 1, 2508.07, -1679.79, 143.549, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+187, 1624, 1, 3141.59, -275.53, 118.643, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 1, 100, 0, 10),
(@OGUID+188, 1624, 1, 3160.27, 468.336, 2.55126, 0.296705, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+189, 1624, 1, -5361.9, -3237.28, -43.1254, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), 
(@OGUID+190, 1624, 1, -5323.93, -2830.42, -54.6644, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10), 
(@OGUID+191, 1624, 1, -5022.25, -2211.85, -54.0231, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), 
(@OGUID+192, 1624, 1, -6319.89, -3515.23, -58.75, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+193, 1624, 1, -5649.32, -3652.89, -58.75, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 1, 100, 0, 10), 
(@OGUID+194, 1624, 1, -5561.96, -2529.74, -54.2826, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+195, 1624, 1, -5155.9, -2450.38, -52.7186, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 1, 100, 0, 10), 
(@OGUID+196, 1624, 1, -4788.75, -1980.07, -59.9618, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 1, 100, 0, 10), 
(@OGUID+197, 1624, 1, -6450.85, -3848.12, -58.75, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+198, 1624, 1, -5429.14, -2040.26, -64.7291, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 1, 100, 0, 10), 
(@OGUID+199, 1624, 1, -6313.7, -4088.89, -58.75, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 1, 100, 0, 10),
(@OGUID+200, 1624, 1, -6052.09, -3580.51, -58.7499, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 1, 100, 0, 10),
(@OGUID+201, 1624, 1, -5925.01, -4111.63, -58.75, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 1, 100, 0, 10),
(@OGUID+202, 1624, 1, -5747.49, -4146.64, -58.75, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+203, 1624, 1, -5547.57, -3844.04, -58.75, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+204, 1624, 1, -196.438, 1116.59, 87.2241, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), 
(@OGUID+205, 1624, 1, -333.244, 2384.28, 37.4758, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 1, 100, 0, 10), 
(@OGUID+206, 1624, 1, -1228.87, 2200.36, 91.8946, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), 
(@OGUID+207, 1624, 1, -1017.17, 952.096, 91.9954, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 1, 100, 0, 10), 
(@OGUID+208, 1624, 1, -1883.5, 2814.56, 55.792, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 1, 100, 0, 10), 
(@OGUID+209, 1624, 1, -366.88, 1950.63, 111.301, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 1, 100, 0, 10), 
(@OGUID+210, 1624, 1, -781.216, 1089.28, 89.3548, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 1, 100, 0, 10), 
(@OGUID+211, 1624, 1, -1619.56, 1171.6, 90.3512, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10), 
(@OGUID+212, 1624, 1, -2125.42, 2417.73, 61.6766, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 1, 100, 0, 10),
(@OGUID+213, 1624, 1, -1983.95, 2546.92, 61.2426, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+214, 1624, 1, -733.59, 2016.13, 92.4307, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+215, 1624, 1, -522.235, 881.583, 90.9525, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 1, 100, 0, 10),
(@OGUID+216, 1624, 1, -119.666, 1610.63, 90.2778, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10);

-- Missing Kingsblood spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+217, 1624, 1, 1105.98, -239.175, -1.38236, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 1, 100, 0, 10), 
(@OGUID+218, 1624, 1, 2455.99, 1628.16, 287.085, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 1, 100, 0, 10), 
(@OGUID+219, 1624, 1, 579.086, 1700.51, -11.205, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), 
(@OGUID+220, 1624, 1, 2613.47, 1547.49, 261.202, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 1, 100, 0, 10), 
(@OGUID+221, 1624, 1, 55.6568, -82.2592, 19.7826, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), 
(@OGUID+222, 1624, 1, 1509.59, -235.847, 29.0809, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), 
(@OGUID+223, 1624, 1, 1144.66, 692.578, 145.623, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 1, 100, 0, 10), 
(@OGUID+224, 1624, 1, 1420.46, 723.077, 146.08, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 1, 100, 0, 10), 
(@OGUID+225, 1624, 1, 2370.62, 1459.79, 277.939, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), 
(@OGUID+226, 1624, 1, 881.701, 1748.01, -12.252, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10), 
(@OGUID+227, 1624, 1, 1161.17, 292.83, 15.5815, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 1, 100, 0, 10), 
(@OGUID+228, 1624, 1, 1449.23, -253.817, 12.8397, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10), 
(@OGUID+229, 1624, 1, 1415.75, 77.1022, 14.3272, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), 
(@OGUID+230, 1624, 1, 1049.41, 57.1624, 10.1874, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 1, 100, 0, 10), 
(@OGUID+231, 1624, 1, 618.941, 1510.11, -12.3618, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+232, 1624, 1, 625.585, 1801.2, -11.6811, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 1, 100, 0, 10),
(@OGUID+233, 1624, 1, 682.086, 1628, -22.2291, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+234, 1624, 1, 718.89, 1533.58, -22.989, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10),
(@OGUID+235, 1624, 1, 732.953, 1809.55, -13.8562, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10),
(@OGUID+236, 1624, 1, 733.958, 1687.51, -30.4287, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10),
(@OGUID+237, 1624, 1, 787.531, 1585.81, -30.1552, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 1, 100, 0, 10),
(@OGUID+238, 1624, 1, 795.638, 1849.68, -4.61363, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10),
(@OGUID+239, 1624, 1, 1331.69, -304.356, 6.15001, 5.23599, 0, 0, -0.5, 0.866025, 300, 300, 1, 100, 0, 10),
(@OGUID+240, 1624, 1, 1606.29, 1086.18, 141.713, 2.16421, 0, 0, 0.882947, 0.469473, 300, 300, 1, 100, 0, 10),
(@OGUID+241, 1624, 1, 1781.24, 908.227, 137.153, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 1, 100, 0, 10),
(@OGUID+242, 1624, 1, 2182.07, 1040.49, 252.933, 0.628317, 0, 0, 0.309016, 0.951057, 300, 300, 1, 100, 0, 10),
(@OGUID+243, 1624, 1, 2333.81, 1629.22, 296.476, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10),
(@OGUID+244, 1624, 1, 2352.08, 1573.53, 281.966, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+2, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+3, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+4, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+5, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+6, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+7, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+8, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+9, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+10, 1284, 0, 'Kingsblood', 0, 10), -- Kingsblood in Badlands 21 objects total
(@OGUID+11, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+12, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+13, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+14, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+15, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+16, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+17, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+18, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+19, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+20, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+21, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+22, 1326, 0, 'Kingsblood', 0, 10), -- Kingsblood in Swamp of Sorrows 6 objects total
(@OGUID+23, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+24, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+25, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+26, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+27, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+28, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+29, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+30, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+31, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+32, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+33, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+34, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+35, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+36, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+37, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+38, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+39, 1117, 0, 'Kingsblood', 0, 10), -- Kingsblood in Duskwood 19 objects total
(@OGUID+40, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+41, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+42, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+43, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+44, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+45, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+46, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+47, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+48, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+49, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+50, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+51, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+52, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+53, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+54, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+55, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+56, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+57, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+58, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+59, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+60, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+61, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+62, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+63, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+64, 1155, 0, 'Kingsblood', 0, 10), -- Kingsblood in Wetlands 26 objects total
(@OGUID+65, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+66, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+67, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+68, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+69, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+70, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+71, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+72, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+73, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+74, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+75, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+76, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+77, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+78, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+79, 1039, 0, 'Kingsblood', 0, 10), -- Kingsblood in Dustwallow Marsh 5 objects total
(@OGUID+80, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+81, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+82, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+83, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+84, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+85, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+86, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+87, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+88, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+89, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+90, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+91, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+92, 1038, 0, 'Kingsblood', 0, 10), -- Kingsblood in Barrens 33 objects total
(@OGUID+93, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+94, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+95, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+96, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+97, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+98, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+99, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+100, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+101, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+102, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+103, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+104, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+105, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+106, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+107, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+108, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+109, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+110, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+111, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+112, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+113, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+114, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+115, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+116, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+117, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+118, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+119, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+120, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+121, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+122, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+123, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+124, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+125, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+126, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+127, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+128, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+129, 1170, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stranglethorn 53 objects total
(@OGUID+130, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+131, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+132, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+133, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+134, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+135, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+136, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+137, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+138, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+139, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+140, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+141, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+142, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+143, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+144, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+145, 1057, 0, 'Kingsblood', 0, 10), -- Kingsblood in Alterac 6 objects total
(@OGUID+146, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+147, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+148, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+149, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+150, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+151, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+152, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+153, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+154, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+155, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+156, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+157, 1180, 0, 'Kingsblood', 0, 10), -- Kingsblood in Arathi 25 objects total
(@OGUID+158, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+159, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+160, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+161, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+162, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+163, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+164, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+165, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+166, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+167, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+168, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+169, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+170, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+171, 1051, 0, 'Kingsblood', 0, 10), -- Kingsblood in Hillsbrad 38 objects total
(@OGUID+172, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+173, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+174, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+175, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+176, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+177, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+178, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+179, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+180, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+181, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+182, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+183, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+184, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+185, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+186, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+187, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+188, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale 27 objects total
(@OGUID+189, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+190, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+191, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+192, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+193, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+194, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+195, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+196, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+197, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+198, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+199, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+200, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+201, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+202, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+203, 1136, 0, 'Kingsblood', 0, 10), -- Kingsblood in Thousand Needles 15 objects total
(@OGUID+204, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+205, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+206, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+207, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+208, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+209, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+210, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+211, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+212, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+213, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+214, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+215, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+216, 1138, 0, 'Kingsblood', 0, 10), -- Kingsblood in Desolace 13 objects total
(@OGUID+217, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+218, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+219, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+220, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+221, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+222, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+223, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+224, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+225, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+226, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+227, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+228, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+229, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+230, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+231, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+232, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+233, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+234, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+235, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+236, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+237, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+238, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+239, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+240, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+241, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+242, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+243, 1088, 0, 'Kingsblood', 0, 10), -- Kingsblood in Stonetalon 26 objects total
(@OGUID+244, 1088, 0, 'Kingsblood', 0, 10); -- Kingsblood in Stonetalon 26 objects total

-- Correct Pools
UPDATE `pool_template` SET `description`='Kingsblood in Ashenvale' WHERE  `entry`=1078;
UPDATE `pool_template` SET `description`='Kingsblood in Badlands' WHERE  `entry`=1284;
UPDATE `pool_template` SET `description`='Kingsblood in Barrens' WHERE  `entry`=1038;
UPDATE `pool_template` SET `description`='Kingsblood in Desolace' WHERE  `entry`=1138;
UPDATE `pool_template` SET `description`='Kingsblood in Duskwood' WHERE  `entry`=1117;
UPDATE `pool_template` SET `description`='Kingsblood in Dustwallow Marsh' WHERE  `entry`=1039;
UPDATE `pool_template` SET `description`='Kingsblood in Stonetalon' WHERE  `entry`=1088;
UPDATE `pool_template` SET `description`='Kingsblood in Stranglethorn' WHERE  `entry`=1170;
UPDATE `pool_template` SET `description`='Kingsblood in Swamp of Sorrows' WHERE  `entry`=1326;
UPDATE `pool_template` SET `description`='Kingsblood in Thousand Needles' WHERE  `entry`=1136;
UPDATE `pool_template` SET `description`='Kingsblood in Wetlands' WHERE  `entry`=1155;

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (4363, 4386, 4344, 4407, 4377, 4345, 4419, 4341, 4365, 4351, 4391, 4310, 4394, 4364, 4380, 4301, 4430, 4422, 4410, 4398, 4389, 4306, 4339, 4296, 4307, 4355, 4384, 4385, 4414, 39975, 40011);
DELETE FROM `pool_gameobject` WHERE `guid` IN (4363, 4386, 4344, 4407, 4377, 4345, 4419, 4341, 4365, 4351, 4391, 4310, 4394, 4364, 4380, 4301, 4430, 4422, 4410, 4398, 4389, 4306, 4339, 4296, 4307, 4355, 4384, 4385, 4414, 39975, 40011);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (1624);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=1117;
UPDATE `pool_template` SET `max_limit`=23 WHERE  `entry`=1155;
UPDATE `pool_template` SET `max_limit`=35 WHERE  `entry`=1170;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1180;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1057;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1051;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1039;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=1038;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1136;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1284;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=1078;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1138;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1088;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1326;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
