DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241217175923');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241217175923');
-- Add your query below.


-- Anchor
UPDATE `gameobject` SET `position_x`=-10169.2, `position_y`=2317.47, `position_z`=-49.5841, `orientation`=0.663223, `rotation0`=0, `rotation1`=0, `rotation2`=0.325567, `rotation3`=0.945519 WHERE `guid`=16879;

-- Gaea Dirt Mound
UPDATE `gameobject` SET `position_x`=917.972, `position_y`=1715.87, `position_z`=-14.7383, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=20684;
UPDATE `gameobject` SET `position_x`=703.858, `position_y`=1485.01, `position_z`=-15.65, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=20676;
UPDATE `gameobject` SET `position_x`=637.28, `position_y`=1493.22, `position_z`=-12.2789, `orientation`=0.872664, `rotation0`=0, `rotation1`=0, `rotation2`=0.422618, `rotation3`=0.906308 WHERE `guid`=20697;
UPDATE `gameobject` SET `position_x`=667.014, `position_y`=1562.03, `position_z`=-19.2776, `orientation`=4.36332, `rotation0`=0, `rotation1`=0, `rotation2`=-0.819152, `rotation3`=0.573577 WHERE `guid`=20704;
UPDATE `gameobject` SET `position_x`=563.785, `position_y`=1551.61, `position_z`=-9.38759, `orientation`=1.74533, `rotation0`=0, `rotation1`=0, `rotation2`=0.766044, `rotation3`=0.642789 WHERE `guid`=20706;
UPDATE `gameobject` SET `position_x`=541.104, `position_y`=1600.31, `position_z`=-3.84041, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=20694;
UPDATE `gameobject` SET `position_x`=761.091, `position_y`=1399.94, `position_z`=-15.806, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=20678;
UPDATE `gameobject` SET `position_x`=749.38, `position_y`=1741.49, `position_z`=-20.6867, `orientation`=0.488691, `rotation0`=0, `rotation1`=0, `rotation2`=0.241921, `rotation3`=0.970296 WHERE `guid`=20703;
UPDATE `gameobject` SET `position_x`=824.819, `position_y`=1688.19, `position_z`=-25.2748, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=20696;
UPDATE `gameobject` SET `position_x`=611.429, `position_y`=1756.65, `position_z`=-11.6971, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=20702;
UPDATE `gameobject` SET `position_x`=593.536, `position_y`=1799.24, `position_z`=-7.52801, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=20695;
UPDATE `gameobject` SET `position_x`=734.333, `position_y`=1602.32, `position_z`=-23.6011, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=20693;
UPDATE `gameobject` SET `position_x`=792.721, `position_y`=1487.82, `position_z`=-18.3508, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=20708;
UPDATE `gameobject` SET `position_x`=841.456, `position_y`=1526.23, `position_z`=-18.7355, `orientation`=4.45059, `rotation0`=0, `rotation1`=0, `rotation2`=-0.793353, `rotation3`=0.608762 WHERE `guid`=20685;
UPDATE `gameobject` SET `position_x`=609.719, `position_y`=1602.23, `position_z`=-11.1704, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=20692;
UPDATE `gameobject` SET `position_x`=674.535, `position_y`=1826.9, `position_z`=-12.1548, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=20690;

-- Hot Coal
UPDATE `gameobject` SET `position_x`=736.653, `position_y`=-1176.32, `position_z`=-118.097, `orientation`=5.60251, `rotation0`=0, `rotation1`=0, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=361786;

-- Lava Crack
UPDATE `gameobject` SET `position_x`=765.562, `position_y`=-995.398, `position_z`=-197.221, `orientation`=2.19911, `rotation0`=0, `rotation1`=0, `rotation2`=0.891006, `rotation3`=0.453991 WHERE `guid`=3998297;

-- Dire Pool
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1936, 178224, 1, -4033.24, 1345.66, 159.614, 3.14159, 0, 0, -1, 0, 900, 900, 100, 1, 0, 10); -- Feralas

-- Aurora's Aura
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1944, 178230, 0, 3235.85, -4263.02, 100.385, 3.99681, 0, 0, -0.909961, 0.414694, -12, -12, 100, 1, 0, 10); -- Eastern Plaguelands (SPAWN)
DELETE FROM `quest_end_scripts` WHERE `id`=5247;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5247, 0, 3, 0, 1788, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3234.29, -4260.34, 98.4239, 0, 0, 'Fragments of the Past: Aurora Skycaller - Move'),
(5247, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Remove Npc Flags'),
(5247, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8332, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Say Text'),
(5247, 4, 9, 88, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Respawn GameObject Aurora\'s Book'),
(5247, 7, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 8, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 9, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 10, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8333, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Say Text'),
(5247, 11, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 12, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 13, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 14, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 15, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 16, 9, 1944, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Respawn GameObject Aurora\'s Aura'),
(5247, 16, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 17, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 18, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 18, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3234.29, -4260.34, 98.4239, 0, 0, 'Fragments of the Past: Aurora Skycaller - Move'),
(5247, 18, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.33522, 0, 'Fragments of the Past: Aurora Skycaller - Set Orientation'),
(5247, 18, 15, 18953, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Cast Spell Ranshalla Waiting'),
(5247, 19, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 20, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 21, 14, 18953, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurora Skycaller - Remove Aura Ranshalla Waiting'),
(5247, 21, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 22, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 23, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 24, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 25, 89, 0, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 25, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 26, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 27, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 28, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 29, 89, 1, 0, 0, 0, 88, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora\'s Book - Activate Object'),
(5247, 31, 3, 0, 2763, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 3232.28, -4256.48, 98.1997, 0, 0, 'Fragments of the Past: Aurora Skycaller - Move'),
(5247, 34, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.78736, 0, 'Fragments of the Past: Aurora Skycaller - Set Orientation'),
(5247, 36, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Emote OneShotBow'),
(5247, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8338, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Say Text'),
(5247, 39, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past: Aurora Skycaller - Add Npc Flags');

-- Box o' Squirrels
UPDATE `gameobject` SET `position_x`=-22.5045, `position_y`=44.4364, `position_z`=-4.29736, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=20739;
UPDATE `gameobject` SET `position_x`=-16.7718, `position_y`=44.478, `position_z`=-4.29736, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=20740;
UPDATE `gameobject` SET `position_x`=-19.6636, `position_y`=44.2562, `position_z`=-4.29736, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=20738;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-202.623, `position_y`=-112.551, `position_z`=78.4902, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=90374;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=669.317, `position_y`=-294.055, `position_z`=30.2897, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=90370;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=669.007, `position_y`=-294.078, `position_z`=30.2909, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=90356;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-1082.53, `position_y`=-346.567, `position_z`=54.9771, `orientation`=4.72984, `rotation0`=0, `rotation1`=0, `rotation2`=-0.700909, `rotation3`=0.713251 WHERE `guid`=90378;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=-1082.43, `position_y`=-346.792, `position_z`=54.9265, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=90364;

-- Christmas Tree (Large)
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1959, 178425, 0, -8747.58, 1075.01, 90.5513, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1959, 2);

-- XMasTreeLargeHorde01
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1961, 178426, 1, -1056.73, -303.276, 159.03, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1961, 2);
UPDATE `gameobject` SET `position_x`=-1258.46, `position_y`=63.6343, `position_z`=127.893, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=41824;
UPDATE `gameobject` SET `position_x`=2276.44, `position_y`=265.839, `position_z`=36.538, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=41859;

-- XMasGift01
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1972, 178428, 0, -8748.77, 1075.06, 90.6098, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 10), -- Stormwind City
(1974, 178428, 0, -8746.23, 1073.4, 90.4405, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 10), -- Stormwind City
(1977, 178428, 1, -1058.07, -305.139, 159.03, 3.33359, 0, 0, -0.995396, 0.0958512, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1978, 178428, 1, -1055.67, -301.665, 159.364, 0.314158, 0, 0, 0.156434, 0.987688, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1979, 178428, 1, -1057.02, -305.2, 159.03, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1980, 178428, 1, -1057.47, -302.564, 159.03, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1981, 178428, 1, -1058.82, -302.106, 159.03, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1983, 178428, 1, -1054.92, -305.088, 159.03, 6.05629, 0, 0, -0.113203, 0.993572, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1988, 178428, 1, -1257.07, 64.9708, 127.775, 0.314158, 0, 0, 0.156434, 0.987688, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1989, 178428, 1, -1257.22, 62.377, 127.852, 3.64774, 0, 0, -0.968147, 0.250381, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(1991, 178428, 1, -1258.5, 65.8874, 127.696, 1.3439, 0, 0, 0.622514, 0.782609, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1972, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1974, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1977, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1978, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1979, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1980, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1981, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1983, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1988, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1989, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (1991, 2);
UPDATE `gameobject` SET `position_x`=2274.7, `position_y`=267.536, `position_z`=36.9303, `orientation`=2.32129, `rotation0`=0, `rotation1`=0, `rotation2`=0.91706, `rotation3`=0.39875 WHERE `guid`=41389;
UPDATE `gameobject` SET `position_x`=2275.88, `position_y`=267.832, `position_z`=36.6364, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=41386;
UPDATE `gameobject` SET `position_x`=2276.27, `position_y`=264.194, `position_z`=36.4091, `orientation`=4.97419, `rotation0`=0, `rotation1`=0, `rotation2`=-0.608761, `rotation3`=0.793354 WHERE `guid`=41380;
UPDATE `gameobject` SET `position_x`=-1056.64, `position_y`=-301.032, `position_z`=159.03, `orientation`=0.610863, `rotation0`=0, `rotation1`=0, `rotation2`=0.300705, `rotation3`=0.953717 WHERE `guid`=41323;
UPDATE `gameobject` SET `position_x`=-1260.46, `position_y`=63.5066, `position_z`=127.678, `orientation`=3.29869, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996917, `rotation3`=0.0784664 WHERE `guid`=41311;

-- XMasGift02
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2001, 178429, 0, -8749.29, 1075.9, 90.6969, 5.3058, 0, 0, -0.469471, 0.882948, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2003, 178429, 0, -8745.95, 1075.42, 90.6242, 5.34071, 0, 0, -0.45399, 0.891007, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2004, 178429, 0, -8747.26, 1073.27, 90.4057, 0.0174525, 0, 0, 0.00872612, 0.999962, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2006, 178429, 1, -1058.28, -302.983, 159.03, 3.24635, 0, 0, -0.998629, 0.0523532, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2007, 178429, 1, -1055.44, -304.288, 159.03, 1.0821, 0, 0, 0.515038, 0.857168, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2016, 178429, 1, -1259.14, 65.0697, 127.72, 4.5204, 0, 0, -0.771625, 0.636078, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2017, 178429, 1, -1257.63, 64.2302, 127.844, 0.331611, 0, 0, 0.165047, 0.986286, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2001, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2003, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2004, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2006, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2007, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2016, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2017, 2);
UPDATE `gameobject` SET `position_x`=2274.87, `position_y`=266.014, `position_z`=36.5332, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=41623;
UPDATE `gameobject` SET `position_x`=2262.02, `position_y`=274.943, `position_z`=38.5493, `orientation`=2.80998, `rotation0`=0, `rotation1`=0, `rotation2`=0.986285, `rotation3`=0.16505 WHERE `guid`=41627;
UPDATE `gameobject` SET `position_x`=2275.43, `position_y`=267.01, `position_z`=36.606, `orientation`=6.07375, `rotation0`=0, `rotation1`=0, `rotation2`=-0.104528, `rotation3`=0.994522 WHERE `guid`=41629;
UPDATE `gameobject` SET `position_x`=2277.24, `position_y`=265.913, `position_z`=36.5408, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=41624;
UPDATE `gameobject` SET `position_x`=-1056.54, `position_y`=-302.14, `position_z`=159.03, `orientation`=1.37881, `rotation0`=0, `rotation1`=0, `rotation2`=0.636078, `rotation3`=0.771625 WHERE `guid`=41619;
UPDATE `gameobject` SET `position_x`=-1258.81, `position_y`=63.1073, `position_z`=127.913, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=41614;

-- XMasGift03
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2021, 178430, 0, 2278.27, 265.41, 36.8502, 2.60054, 0, 0, 0.96363, 0.267241, 180, 180, 100, 1, 0, 10), -- Tirisfal Glades
(2022, 178430, 0, -8746.57, 1076.75, 90.7267, 4.29351, 0, 0, -0.83867, 0.54464, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2023, 178430, 0, -8748.49, 1073.93, 90.5135, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2027, 178430, 1, -1056.35, -303.894, 159.03, 5.14872, 0, 0, -0.537299, 0.843392, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2028, 178430, 1, -1057.69, -301.574, 159.03, 1.53589, 0, 0, 0.694658, 0.71934, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2030, 178430, 1, -1259.53, 62.3401, 127.802, 4.72984, 0, 0, -0.700909, 0.713251, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2031, 178430, 1, -1256.87, 63.8088, 127.856, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2021, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2022, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2023, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2027, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2028, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2030, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2031, 2);
UPDATE `gameobject` SET `position_x`=2274.62, `position_y`=267.351, `position_z`=36.6077, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=41628;
UPDATE `gameobject` SET `position_x`=2278.55, `position_y`=266.297, `position_z`=36.5609, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=41622;
UPDATE `gameobject` SET `position_x`=2277.76, `position_y`=264.943, `position_z`=36.4706, `orientation`=5.53269, `rotation0`=0, `rotation1`=0, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE `guid`=41625;
UPDATE `gameobject` SET `position_x`=-1055.51, `position_y`=-301.717, `position_z`=159.03, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=41617;
UPDATE `gameobject` SET `position_x`=-1260.03, `position_y`=64.7919, `position_z`=127.68, `orientation`=3.01941, `rotation0`=0, `rotation1`=0, `rotation2`=0.998135, `rotation3`=0.0610518 WHERE `guid`=41615;
DELETE FROM `gameobject` WHERE `guid`=41626;
DELETE FROM `game_event_gameobject` WHERE `guid`=41626;

-- XMasGift04
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2042, 178431, 0, -8745.3, 1074.13, 90.5256, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2043, 178431, 0, -8749.71, 1074.41, 90.6102, 3.6652, 0, 0, -0.965925, 0.258821, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2045, 178431, 0, -8747.01, 1075.65, 90.6204, 5.67232, 0, 0, -0.300705, 0.953717, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2048, 178431, 1, -1259.65, 63.336, 127.798, 3.61284, 0, 0, -0.972369, 0.233448, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2050, 178431, 1, -1257.42, 65.9227, 127.69, 4.08407, 0, 0, -0.891006, 0.453991, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2051, 178431, 1, -1259.36, 65.8987, 127.636, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2058, 178431, 1, -1257.15, 63.444, 128.18, 0.488691, 0, 0, 0.241921, 0.970296, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2042, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2043, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2045, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2048, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2050, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2051, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2058, 2);
UPDATE `gameobject` SET `position_x`=2261.46, `position_y`=274.158, `position_z`=38.5348, `orientation`=1.91986, `rotation0`=0, `rotation1`=0, `rotation2`=0.819152, `rotation3`=0.573577 WHERE `guid`=41382;
UPDATE `gameobject` SET `position_x`=2273.98, `position_y`=266.189, `position_z`=36.5466, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=41377;
UPDATE `gameobject` SET `position_x`=2276.46, `position_y`=264.965, `position_z`=36.4797, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=41379;
UPDATE `gameobject` SET `position_x`=2276.95, `position_y`=268.002, `position_z`=36.65, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=41387;
UPDATE `gameobject` SET `position_x`=-1055.11, `position_y`=-303.312, `position_z`=159.03, `orientation`=0.383971, `rotation0`=0, `rotation1`=0, `rotation2`=0.190808, `rotation3`=0.981627 WHERE `guid`=41314;

-- XMasGift05
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2063, 178432, 0, -8747.97, 1076.02, 90.6388, 0.890117, 0, 0, 0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2064, 178432, 0, -8749.36, 1073.35, 90.5155, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2066, 178432, 0, -8746.39, 1074.22, 90.5091, 0.191985, 0, 0, 0.0958452, 0.995396, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2088, 178432, 1, -1057.46, -303.54, 159.03, 3.73501, 0, 0, -0.956305, 0.292372, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2089, 178432, 1, -1056.04, -304.756, 159.03, 4.06662, 0, 0, -0.894934, 0.446199, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2092, 178432, 1, -1259.31, 64.1051, 127.791, 2.72271, 0, 0, 0.978148, 0.207912, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2093, 178432, 1, -1258.29, 64.979, 127.786, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2063, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2064, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2066, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2088, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2089, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2092, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2093, 2);
UPDATE `gameobject` SET `position_x`=2261.01, `position_y`=273.208, `position_z`=38.5199, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=41384;
UPDATE `gameobject` SET `position_x`=2276.62, `position_y`=267.17, `position_z`=36.6111, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=41388;
UPDATE `gameobject` SET `position_x`=2275.39, `position_y`=265.181, `position_z`=36.4726, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=41378;
UPDATE `gameobject` SET `position_x`=-1055.76, `position_y`=-302.703, `position_z`=159.03, `orientation`=0.767944, `rotation0`=0, `rotation1`=0, `rotation2`=0.374606, `rotation3`=0.927184 WHERE `guid`=41313;
UPDATE `gameobject` SET `position_x`=-1257.77, `position_y`=63.0375, `position_z`=127.946, `orientation`=5.32326, `rotation0`=0, `rotation1`=0, `rotation2`=-0.461748, `rotation3`=0.887011 WHERE `guid`=41316;

-- XMasGift06
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2110, 178433, 0, -8747.76, 1077.12, 90.7324, 3.75246, 0, 0, -0.953716, 0.300708, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2112, 178433, 0, -8745, 1074.98, 90.6064, 4.20625, 0, 0, -0.861629, 0.507539, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2113, 178433, 0, -8748, 1072.67, 90.3978, 3.21142, 0, 0, -0.999391, 0.0349061, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2117, 178433, 1, -1057.49, -302.52, 159.44, 6.12611, 0, 0, -0.0784588, 0.996917, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2118, 178433, 1, -1057.93, -301.668, 159.357, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2123, 178433, 1, -1258.25, 62.2292, 127.94, 4.36332, 0, 0, -0.819152, 0.573577, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2124, 178433, 1, -1256.56, 62.7944, 127.795, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2125, 178433, 1, -1258.26, 64.931, 128.651, 3.4383, 0, 0, -0.989016, 0.147811, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2110, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2112, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2113, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2117, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2118, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2123, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2124, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2125, 2);
UPDATE `gameobject` SET `position_x`=2274.38, `position_y`=265.108, `position_z`=36.4497, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=41375;
UPDATE `gameobject` SET `position_x`=2277.77, `position_y`=267.151, `position_z`=36.6077, `orientation`=2.77507, `rotation0`=0, `rotation1`=0, `rotation2`=0.983254, `rotation3`=0.182238 WHERE `guid`=41385;
UPDATE `gameobject` SET `position_x`=-1056.72, `position_y`=-304.123, `position_z`=159.357, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=41312;
UPDATE `gameobject` SET `position_x`=-1260.04, `position_y`=65.2465, `position_z`=127.997, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=41324;

-- XMasStocking01
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2127, 178434, 0, -9082.4, 823.71, 114.636, 0.349065, 0, 0, 0.173648, 0.984808, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2128, 178434, 0, -9084.7, 829.405, 114.636, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2130, 178434, 0, -8452.43, 494.524, 105.99, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2131, 178434, 0, -8457.67, 490.354, 105.984, 2.05949, 0, 0, 0.857167, 0.515038, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2133, 178434, 0, -8609.81, 382.833, 109.131, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2134, 178434, 0, -8604.94, 386.712, 109.104, 2.16421, 0, 0, 0.882947, 0.469473, 180, 180, 100, 1, 6, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2127, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2128, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2130, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2131, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2133, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2134, 2);
UPDATE `gameobject` SET `position_x`=2262.5, `position_y`=276.512, `position_z`=38.3189, `orientation`=2.60054, `rotation0`=0, `rotation1`=0, `rotation2`=0.96363, `rotation3`=0.267241 WHERE `guid`=41381;

-- XMasStocking02
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2144, 178435, 0, -9082.83, 824.757, 114.607, 0.279252, 0, 0, 0.139173, 0.990268, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2145, 178435, 0, -8453.9, 493.354, 105.965, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2146, 178435, 0, -8612.25, 380.898, 109.1, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 100, 1, 6, 10), -- Stormwind City
(2147, 178435, 0, -8605.94, 385.918, 109.113, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 6, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2144, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2145, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2146, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2147, 2);

-- XMasStocking03
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2150, 178436, 0, -9083.24, 825.79, 114.625, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2151, 178436, 0, -9085.09, 830.368, 114.61, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2152, 178436, 0, -8456.85, 491.01, 105.977, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2153, 178436, 0, -8610.99, 381.894, 109.13, 2.16421, 0, 0, 0.882947, 0.469473, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2150, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2151, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2152, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2153, 2);

-- Wreath
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2156, 178437, 0, -8541.71, 459.22, 122.253, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2158, 178437, 0, -8712.76, 465.377, 111.004, 5.32326, 0, 0, -0.461748, 0.887011, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2159, 178437, 0, -8399.86, 677.258, 110.759, 3.78737, 0, 0, -0.948323, 0.317306, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2160, 178437, 1, -1181.29, -91.9861, 172.979, 2.53072, 0, 0, 0.953716, 0.300708, 180, 180, 100, 1, 0, 10), -- Thunder Bluff
(2161, 178437, 1, -1235.7, -89.83, 173.237, 0.488691, 0, 0, 0.241921, 0.970296, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2156, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2158, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2159, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2160, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2161, 2);
UPDATE `gameobject` SET `position_x`=-8861.46, `position_y`=576.599, `position_z`=109.647, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=41660;

-- Lights
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2166, 178438, 0, -9055.89, 831.778, 119.272, 3.50812, 0, 0, -0.983254, 0.182238, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2167, 178438, 0, -9057.16, 835.097, 119.412, 3.49067, 0, 0, -0.984807, 0.173652, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2168, 178438, 0, -8951.18, 981.333, 137.118, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2170, 178438, 0, -8948.97, 983.89, 136.965, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2171, 178438, 0, -8946.24, 985.972, 137.093, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2172, 178438, 0, -8936.93, 993.13, 136.422, 5.23599, 0, 0, -0.5, 0.866025, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2173, 178438, 0, -8939.55, 990.909, 136.777, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2174, 178438, 0, -8933.98, 994.652, 136.309, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2166, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2167, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2168, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2170, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2171, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2172, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2173, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2174, 2);
UPDATE `gameobject` SET `position_x`=2262.82, `position_y`=320.481, `position_z`=40.2215, `orientation`=5.60251, `rotation0`=0, `rotation1`=0, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=41390;
UPDATE `gameobject` SET `position_x`=-8849.09, `position_y`=622.721, `position_z`=101.087, `orientation`=0.349065, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=40916;

-- Small Forge Flame
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2208, 178443, 30, -1250.52, -310.399, 64.3139, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 0, 10), -- Alterac Valley
(2209, 178443, 30, 649.387, -59.0312, 43.1722, 5.20108, 0, 0, -0.515038, 0.857168, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Lights, Broken
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=2261.01, `position_y`=271.304, `position_z`=39.4948, `orientation`=4.17134, `rotation0`=0, `rotation1`=0, `rotation2`=-0.870356, `rotation3`=0.492424 WHERE `guid`=41865;
UPDATE `gameobject` SET `position_x`=2221.76, `position_y`=321.288, `position_z`=47.043, `orientation`=2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=0.292372 WHERE `guid`=41863;
UPDATE `gameobject` SET `position_x`=2273.73, `position_y`=233.259, `position_z`=44.797, `orientation`=3.00195, `rotation0`=0, `rotation1`=0, `rotation2`=0.997563, `rotation3`=0.0697661 WHERE `guid`=41857;
UPDATE `gameobject` SET `position_x`=2263.9, `position_y`=275.988, `position_z`=39.689, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=41864;
UPDATE `gameobject` SET `position_x`=2260.42, `position_y`=317.753, `position_z`=40.3087, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=41870;
UPDATE `gameobject` SET `position_x`=2293.55, `position_y`=243.373, `position_z`=44.9905, `orientation`=6.12611, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0784588, `rotation3`=0.996917 WHERE `guid`=41858;
UPDATE `gameobject` SET `position_x`=2296.19, `position_y`=301.094, `position_z`=81.4187, `orientation`=4.46804, `rotation0`=0, `rotation1`=0, `rotation2`=-0.788011, `rotation3`=0.615662 WHERE `guid`=41880;
UPDATE `gameobject` SET `position_x`=2318.83, `position_y`=266.076, `position_z`=46.8268, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=41869;
UPDATE `gameobject` SET `position_x`=2265.32, `position_y`=352.37, `position_z`=44.8938, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=41871;

-- Mistletoe
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2232, 178554, 1, -1244.14, -94.2062, 169.519, 1.65806, 0, 0, 0.737277, 0.675591, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2232, 2);

-- Wreath scale 1.20
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2233, 178556, 0, -4869.01, -1018.85, 518.948, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Ironforge
(2234, 178556, 0, -4832.99, -1062.69, 528.278, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Ironforge
(2238, 178556, 1, -1420.32, -111.116, 181.054, 5.67232, 0, 0, -0.300705, 0.953717, 180, 180, 100, 1, 0, 10); -- Thunder Bluff
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2233, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2234, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2238, 2);

-- Christmas Tree (Large Snowy)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2240, 178558, 0, -5617.38, -507.915, 403.614, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 10); -- Dun Morogh
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2240, 2);

-- Holiday Snow
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2241, 178609, 0, 512.145, -92.2018, 144.56, 4.5204, 0, 0, -0.771625, 0.636078, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2242, 178609, 0, 551.264, -149.821, 144.644, 3.12412, 0, 0, 0.999962, 0.00873464, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2244, 178609, 0, 608.174, -126.985, 136.969, 2.3911, 0, 0, 0.930417, 0.366502, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2245, 178609, 0, 543.742, -210.844, 146.87, 3.22886, 0, 0, -0.999048, 0.0436193, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2246, 178609, 0, 591.574, -207.003, 143.265, 0.785397, 0, 0, 0.382683, 0.92388, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2249, 178609, 0, 562.808, -362.746, 155.566, 4.59022, 0, 0, -0.748956, 0.66262, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2250, 178609, 0, 533.492, -354.658, 160.894, 2.11185, 0, 0, 0.870356, 0.492424, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2252, 178609, 0, 482.378, -338.249, 166.936, 1.85005, 0, 0, 0.798635, 0.601815, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2253, 178609, 0, 445.085, -323.741, 163.664, 4.29351, 0, 0, -0.83867, 0.54464, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2255, 178609, 0, 457.061, -268.043, 157.343, 4.15388, 0, 0, -0.874619, 0.48481, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2261, 178609, 0, 603.466, -510.643, 175.66, 4.50295, 0, 0, -0.777145, 0.629321, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2263, 178609, 0, 194.935, -240.891, 147.536, 0.383971, 0, 0, 0.190808, 0.981627, 60, 60, 100, 1, 0, 10), -- Alterac Mountains
(2264, 178609, 0, 405.5, -255.171, 159.547, 5.14872, 0, 0, -0.537299, 0.843392, 60, 60, 100, 1, 0, 10); -- Alterac Mountains
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2241, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2242, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2244, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2245, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2246, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2249, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2250, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2252, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2253, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2255, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2261, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2263, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2264, 2);
UPDATE `gameobject` SET `position_x`=815.21, `position_y`=-450.838, `position_z`=133.941, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=42100;
UPDATE `gameobject` SET `position_x`=719.856, `position_y`=-560.284, `position_z`=163.868, `orientation`=0.279252, `rotation0`=0, `rotation1`=0, `rotation2`=0.139173, `rotation3`=0.990268 WHERE `guid`=42095;
UPDATE `gameobject` SET `position_x`=658.658, `position_y`=-557.698, `position_z`=171.221, `orientation`=4.53786, `rotation0`=0, `rotation1`=0, `rotation2`=-0.766044, `rotation3`=0.642789 WHERE `guid`=42102;
UPDATE `gameobject` SET `position_x`=754.528, `position_y`=-648.61, `position_z`=149.558, `orientation`=1.98967, `rotation0`=0, `rotation1`=0, `rotation2`=0.83867, `rotation3`=0.54464 WHERE `guid`=42096;
UPDATE `gameobject` SET `position_x`=822.365, `position_y`=-508.823, `position_z`=141.376, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.430511, `rotation3`=0.902586 WHERE `guid`=42099;
UPDATE `gameobject` SET `position_x`=881.534, `position_y`=-507.152, `position_z`=134.907, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=42101;

-- Lights x3
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2266, 178645, 0, -9060.05, 841.657, 119.352, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2267, 178645, 0, -9085.32, 827.946, 119.368, 0.383971, 0, 0, 0.190808, 0.981627, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2268, 178645, 0, -8705.73, 851.331, 103.491, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2270, 178645, 0, -8563.6, 604.25, 109.357, 5.37562, 0, 0, -0.438371, 0.898794, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2271, 178645, 0, -8647.99, 443.477, 109.039, 2.25147, 0, 0, 0.902585, 0.430512, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2272, 178645, 0, -8668.04, 396.925, 109.293, 5.35816, 0, 0, -0.446198, 0.894935, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2273, 178645, 0, -8463.01, 509.91, 110.471, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2274, 178645, 0, -8456.9, 501.865, 110.473, 5.37562, 0, 0, -0.438371, 0.898794, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2275, 178645, 0, -8455.49, 490.953, 110.563, 5.37562, 0, 0, -0.438371, 0.898794, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2276, 178645, 0, -8466.47, 494.299, 110.526, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2277, 178645, 0, -8472.49, 502.288, 110.509, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2279, 178645, 0, -8608.75, 382.625, 113.878, 2.21657, 0, 0, 0.894934, 0.446199, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2266, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2267, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2268, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2270, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2271, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2272, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2273, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2274, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2275, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2276, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2277, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2279, 2);

-- Wreath scale 0.75
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2280, 178649, 0, -8851.83, 850.705, 111.139, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2281, 178649, 0, -8942.75, 987.955, 133.911, 5.34071, 0, 0, -0.45399, 0.891007, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2280, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2281, 2);

-- Christmas Tree (Medium)
-- Event 2: Feast of Winter Veil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2285, 178667, 0, -8934.1, 972.866, 117.238, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2287, 178667, 0, -8459.27, 504.501, 99.7773, 1.15192, 0, 0, 0.544639, 0.838671, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2285, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2287, 2);

-- Christmas Tree (Medium)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2289, 178668, 0, -8872.71, 680.677, 104.949, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2289, 2);

-- Alliance Blacksmith Smoke
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2290, 178722, 30, 649.382, -58.908, 47.1585, 3.73501, 0, 0, -0.956305, 0.292372, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Lights x3, Broken
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=2285.62, `position_y`=272.123, `position_z`=46.343, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=41866;
UPDATE `gameobject` SET `position_x`=2291.17, `position_y`=264.637, `position_z`=48.2484, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=41855;
UPDATE `gameobject` SET `position_x`=2289.63, `position_y`=289.637, `position_z`=48.1491, `orientation`=1.309, `rotation0`=0, `rotation1`=0, `rotation2`=0.608761, `rotation3`=0.793354 WHERE `guid`=41888;
UPDATE `gameobject` SET `position_x`=2301.56, `position_y`=304.113, `position_z`=46.9621, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=41889;
UPDATE `gameobject` SET `position_x`=2317.04, `position_y`=258.637, `position_z`=47.4621, `orientation`=2.89725, `rotation0`=0, `rotation1`=0, `rotation2`=0.992546, `rotation3`=0.12187 WHERE `guid`=41868;
UPDATE `gameobject` SET `position_x`=2269.3, `position_y`=342.007, `position_z`=41.7659, `orientation`=2.70526, `rotation0`=0, `rotation1`=0, `rotation2`=0.976295, `rotation3`=0.216442 WHERE `guid`=41881;
UPDATE `gameobject` SET `position_x`=2328.21, `position_y`=277.215, `position_z`=44.2984, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=41885;

-- Smokywood Pastures
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=-1261.01, `position_y`=59.4097, `position_z`=127.041, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861629, `rotation3`=0.507539 WHERE `guid`=41701;

-- Lights
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2318, 178924, 0, -9003.21, 943.705, 122.143, 2.70526, 0, 0, 0.976295, 0.216442, 180, 180, 100, 1, 0, 10), -- Stormwind City
(2326, 178924, 0, -9004.31, 940.953, 122.217, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 100, 1, 0, 10); -- Stormwind City
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2318, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (2326, 2);

-- [PH] Alliance A1 Tower Banner BIG
UPDATE `gameobject` SET `position_x`=557.227, `position_y`=-86.8521, `position_z`=62.1767, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=90322;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=203.238, `position_y`=-360.264, `position_z`=56.3862, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=90308;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=-152.434, `position_y`=-441.615, `position_z`=40.3971, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=90309;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-1297.72, `position_y`=-266.741, `position_z`=114.151, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=90313;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-1302.87, `position_y`=-316.968, `position_z`=113.867, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=90312;

-- Celebras Blue Aura
UPDATE `gameobject` SET `position_x`=650.848, `position_y`=74.0184, `position_z`=-86.8285, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=1262070;

-- Bauble Aura
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2354, 178984, 1, 7713.5, -2534.34, 398.51, 5.84685, 0, 0, -0.216439, 0.976296, 900, 900, 100, 1, 0, 10), -- Moonglade
(2355, 178984, 1, 7592.7, -2779.52, 401.488, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 100, 1, 0, 10), -- Moonglade
(2356, 178984, 1, 7666.62, -2584.24, 400.925, 2.67035, 0, 0, 0.972369, 0.233448, 900, 900, 100, 1, 0, 10), -- Moonglade
(2357, 178984, 1, 7666.5, -2679.52, 392.206, 0, 0, 0, 0, 1, 900, 900, 100, 1, 0, 10), -- Moonglade
(2358, 178984, 1, 7769.78, -2487.91, 417.833, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 100, 1, 0, 10); -- Moonglade

-- Stormpike Banner
UPDATE `gameobject` SET `position_x`=63.2712, `position_y`=5.83762, `position_z`=-4.09622, `orientation`=2.21657, `rotation0`=0, `rotation1`=0, `rotation2`=0.894934, `rotation3`=0.446199 WHERE `guid`=90202;

-- Frostwolf Banner
UPDATE `gameobject` SET `position_x`=-1551.88, `position_y`=-364.188, `position_z`=65.5934, `orientation`=4.32842, `rotation0`=0, `rotation1`=0, `rotation2`=-0.829037, `rotation3`=0.559194 WHERE `guid`=90203;

-- [PH] Alliance Graveyard Mid Banner BIG
UPDATE `gameobject` SET `position_x`=-216.212, `position_y`=-90.7064, `position_z`=79.8071, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=90412;
UPDATE `gameobject` SET `position_x`=-201.284, `position_y`=-134.57, `position_z`=78.8485, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=90411;
UPDATE `gameobject` SET `position_x`=-191.017, `position_y`=-129.963, `position_z`=78.8642, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=90410;

-- [PH] Horde Graveyard Mid Banner BIG
UPDATE `gameobject` SET `position_x`=-190.941, `position_y`=-129.869, `position_z`=78.9326, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=90418;
UPDATE `gameobject` SET `position_x`=-201.444, `position_y`=-134.444, `position_z`=78.9321, `orientation`=5.42797, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909961 WHERE `guid`=90419;
UPDATE `gameobject` SET `position_x`=-215.741, `position_y`=-90.9973, `position_z`=80.0894, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=90420;

-- Campfire
UPDATE `gameobject` SET `position_x`=-2693.04, `position_y`=-4278.89, `position_z`=3.84184, `orientation`=3.93572, `rotation0`=0, `rotation1`=0, `rotation2`=-0.9222, `rotation3`=0.386713 WHERE `guid`=6608;

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2521, 179145, 30, 386.595, 244.761, 15.5951, 3.06303, 0.032527, 0.0510731, 0.997457, 0.0376024, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2522, 179146, 30, 430.327, 276.169, 10.7601, 3.1412, -0.0435858, 0.0392218, 0.998278, 0.0019068, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Giant Clam
UPDATE `gameobject` SET `position_x`=-79.3033, `position_y`=1211.73, `position_z`=-122.818, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=20772;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=77.5044, `position_y`=-404.587, `position_z`=46.8242, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=90358;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=77.7979, `position_y`=-404.696, `position_z`=46.9128, `orientation`=5.42797, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909961 WHERE `guid`=90372;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=669.295, `position_y`=-294.038, `position_z`=30.2897, `orientation`=5.91667, `rotation0`=0, `rotation1`=0, `rotation2`=-0.182235, `rotation3`=0.983255 WHERE `guid`=90398;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-202.394, `position_y`=-113.033, `position_z`=78.4825, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=90388;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-202.613, `position_y`=-112.59, `position_z`=78.4896, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=90388;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=77.8013, `position_y`=-404.7, `position_z`=46.9147, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=90386;

-- Deeprun Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2548, 179345, 369, 57.4358, 1206.98, -121.589, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 100, 1, 0, 10); -- Deeprun Tram

-- Contested Banner
UPDATE `gameobject` SET `position_x`=553.822, `position_y`=-78.7675, `position_z`=51.9387, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=90318;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=674.047, `position_y`=-143.156, `position_z`=63.6614, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`=90319;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-1297.69, `position_y`=-266.73, `position_z`=114.151, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104536 WHERE `guid`=90317;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=638.606, `position_y`=-32.1506, `position_z`=46.0993, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=90368;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=638.657, `position_y`=-32.2294, `position_z`=46.0904, `orientation`=4.66003, `rotation0`=0, `rotation1`=0, `rotation2`=-0.725374, `rotation3`=0.688355 WHERE `guid`=90382;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-1402.28, `position_y`=-307.38, `position_z`=89.442, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=90394;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-1402.19, `position_y`=-307.467, `position_z`=89.4419, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=90380;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-611.523, `position_y`=-396.819, `position_z`=60.8584, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=90390;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=-612.672, `position_y`=-396.693, `position_z`=60.8584, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=90376;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-612.661, `position_y`=-396.699, `position_z`=60.8584, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=90390;

-- Broken Trap
UPDATE `gameobject` SET `position_x`=558.806, `position_y`=550.065, `position_z`=-25.4008, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=396405;

-- Ogre Tannin Basket
UPDATE `gameobject` SET `position_x`=599.299, `position_y`=605.798, `position_z`=-4.7527, `orientation`=0.191985, `rotation0`=0, `rotation1`=0, `rotation2`=0.0958452, `rotation3`=0.995396 WHERE `guid`=44740;

-- Doodad_CorruptedCrystalVine01
UPDATE `gameobject` SET `position_x`=277.695, `position_y`=-423.25, `position_z`=-120.04, `orientation`=3.35977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994056, `rotation3`=0.108872 WHERE `guid`=397167;

-- Doodad_DireMaulBossForceField01
UPDATE `gameobject` SET `position_x`=-38.965, `position_y`=813.709, `position_z`=-27.3178, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=264399;

-- Doodad_DireMaulCrystalGenerator04
UPDATE `gameobject` SET `position_x`=78.1388, `position_y`=737.402, `position_z`=-24.6216, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=262115;

-- Doodad_DireMaulCrystalGenerator05
UPDATE `gameobject` SET `position_x`=-155.433, `position_y`=734.166, `position_z`=-24.6216, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=262117;

-- Doodad_DiremaulMagicVortex01
UPDATE `gameobject` SET `position_x`=-38.7563, `position_y`=812.587, `position_z`=-3.8761, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=397151;

-- Knot's Ball and Chain
UPDATE `gameobject` SET `position_x`=581.241, `position_y`=524.321, `position_z`=-25.4027, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=396421;

-- Fengus's Chest
UPDATE `gameobject` SET `position_x`=380.615, `position_y`=260.057, `position_z`=11.4395, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=35832;

-- Treasure of the Shen'dralar
UPDATE `gameobject` SET `position_x`=129.481, `position_y`=544.967, `position_z`=-48.4663, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=11921;

-- Skeletal Remains of Kariel Winthalus
UPDATE `gameobject` SET `position_x`=163.038, `position_y`=530.182, `position_z`=-48.467, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=44739;

-- The Prince's Chest
UPDATE `gameobject` SET `position_x`=116.135, `position_y`=638.836, `position_z`=-48.467, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=396408;

-- A Dusty Tome
UPDATE `gameobject` SET `position_x`=118.018, `position_y`=-261.472, `position_z`=-4.14639, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=100107;
UPDATE `gameobject` SET `position_x`=512.784, `position_y`=588.036, `position_z`=-25.4023, `orientation`=3.28124, `rotation0`=0, `rotation1`=0, `rotation2`=-0.997563, `rotation3`=0.0697661 WHERE `guid`=100109;

-- Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2902, 179550, 429, 83.2552, 630.546, -24.6315, 5.64614, 0, 0, -0.313164, 0.949699, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Schematic: Field Repair Bot 74A
UPDATE `gameobject` SET `position_x`=841.297, `position_y`=10.7487, `position_z`=-53.7327, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=563;

-- Core Fragment
UPDATE `gameobject` SET `position_x`=1128.01, `position_y`=-471.763, `position_z`=-104.032, `orientation`=3.01941, `rotation0`=0, `rotation1`=0, `rotation2`=0.998135, `rotation3`=0.0610518 WHERE `guid`=234739;

-- Prince's Chest Aura
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2912, 179563, 429, 116.105, 638.89, -48.467, 4.5204, 0, 0, -0.771625, 0.636078, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Gordok Tribute
UPDATE `gameobject` SET `position_x`=808.37, `position_y`=482.128, `position_z`=37.3182, `orientation`=3.194, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999657, `rotation3`=0.0262016 WHERE `guid`=396409;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
