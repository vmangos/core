DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250223172624');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250223172624');
-- Add your query below.


-- Water Barrel
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(346, 3658, 0, 2792.66, 1080.72, 110.792, 1.6057, 0, 0, 0.71934, 0.694658, 180, 180, 100, 1, 0, 10), -- Tirisfal Glades
(347, 153472, 0, 2792.66, 1080.72, 110.792, 1.6057, 0, 0, 0.71934, 0.694658, 180, 180, 100, 1, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(456, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(346, 456, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(347, 456, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(456, 3902, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0);

-- Water Barrel
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(349, 3658, 1, 10623.6, 2075.09, 1335.81, -0.890118, 0, 0, 0.430511, -0.902585, 180, 180, 100, 1, 0, 10), -- Teldrassil
(350, 3719, 1, 10623.6, 2075.09, 1335.81, -0.890118, 0, 0, 0.430511, -0.902585, 180, 180, 100, 1, 0, 10); -- Teldrassil
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(997, 1, 'Water Barrel / Food Crate - Teldrassil', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(349, 997, 'Water Barrel / Food Crate - Teldrassil', 0, 10),
(350, 997, 'Water Barrel / Food Crate - Teldrassil', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(997, 241, 0, 'Water Barrel / Food Crate - Teldrassil', 0);

-- Barrel of Melon Juice
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(362, 3659, 0, -2958.68, -1945.01, 9.31024, 2.93215, 0, 0, 0.994522, 0.104528, 180, 180, 100, 1, 0, 10), -- Wetlands
(363, 3659, 0, -4142.24, -786.095, 0.393803, 2.75762, 0, 0, 0.981627, 0.190809, 180, 180, 100, 1, 0, 10), -- Wetlands
(364, 3695, 0, -2958.68, -1945.01, 9.31024, 2.93215, 0, 0, 0.994522, 0.104528, 180, 180, 100, 1, 0, 10), -- Wetlands
(365, 3695, 0, -4142.24, -786.095, 0.393803, 2.75762, 0, 0, 0.981627, 0.190809, 180, 180, 100, 1, 0, 10); -- Wetlands
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1034, 1, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10),
(1045, 1, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(362, 1034, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10),
(363, 1045, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10),
(364, 1034, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10),
(365, 1045, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1034, 2704, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0),
(1045, 2704, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0);

-- Barrel of Melon Juice
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(366, 3659, 0, -980.275, 320.56, -0.050727, 0.872665, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 10), -- Hillsbrad Foothills
(367, 3659, 0, -1349.51, 565.977, 103.526, -2.86234, 0, 0, 0.990268, -0.139173, 180, 180, 100, 1, 0, 10), -- Hillsbrad Foothills
(368, 3695, 0, -980.275, 320.56, -0.050727, 0.872665, 0, 0, 0.422618, 0.906308, 180, 180, 100, 1, 0, 10), -- Hillsbrad Foothills
(369, 3695, 0, -1349.51, 565.977, 103.526, -2.86234, 0, 0, 0.990268, -0.139173, 180, 180, 100, 1, 0, 10); -- Hillsbrad Foothills
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1068, 1, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10),
(1069, 1, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(366, 1068, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10),
(367, 1069, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10),
(368, 1068, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10),
(369, 1069, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1068, 3941, 0, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0),
(1069, 3941, 0, 'Barrel of Melon Juice / Food Crate - Hillsbrad Foothills', 0);

-- Barrel of Melon Juice
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(370, 3659, 1, 1548.29, -2841.2, 182.963, 0.959931, 0, 0, 0.461749, 0.887011, 180, 180, 100, 1, 0, 10), -- Ashenvale
(384, 3659, 1, 3776.63, -160.454, 2.2696, 0.261799, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 10), -- Ashenvale
(385, 3659, 1, 3355.13, -463.157, 154.107, 0.418879, 0, 0, 0.207912, 0.978148, 180, 180, 100, 1, 0, 10), -- Ashenvale
(386, 3695, 1, 1548.29, -2841.2, 182.963, 0.959931, 0, 0, 0.461749, 0.887011, 180, 180, 100, 1, 0, 10), -- Ashenvale
(387, 3695, 1, 3776.63, -160.454, 2.2696, 0.261799, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 10), -- Ashenvale
(453, 3695, 1, 3355.13, -463.157, 154.107, 0.418879, 0, 0, 0.207912, 0.978148, 180, 180, 100, 1, 0, 10); -- Ashenvale
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1074, 1, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(1079, 1, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(1092, 1, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(370, 1074, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(384, 1079, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(385, 1092, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(386, 1074, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(387, 1079, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10),
(453, 1092, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1074, 4244, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0),
(1079, 4244, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0),
(1092, 4244, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0);

-- Barrel of Melon Juice
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(454, 3659, 0, -10789.8, -1367.54, 38.8847, -1.69297, 0, 0, 0.748956, -0.66262, 180, 180, 100, 1, 0, 10), -- Duskwood
(455, 3695, 0, -10789.8, -1367.54, 38.8847, -1.69297, 0, 0, 0.748956, -0.66262, 180, 180, 100, 1, 0, 10); -- Duskwood
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1093, 1, 'Barrel of Melon Juice / Food Crate - Duskwood', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(454, 1093, 'Barrel of Melon Juice / Food Crate - Duskwood', 0, 10),
(455, 1093, 'Barrel of Melon Juice / Food Crate - Duskwood', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1093, 2082, 0, 'Barrel of Melon Juice / Food Crate - Duskwood', 0);

-- Food Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(458, 3689, 1, -4032.99, -2402.04, 126.131, -2.09439, 0, 0, 0.866025, -0.5, 180, 180, 100, 1, 0, 10), -- The Barrens
(462, 3695, 1, -4032.99, -2402.04, 126.131, -2.09439, 0, 0, 0.866025, -0.5, 180, 180, 100, 1, 0, 10), -- The Barrens
(466, 3702, 1, -4032.99, -2402.04, 126.131, -2.09439, 0, 0, 0.866025, -0.5, 180, 180, 100, 1, 0, 10); -- The Barrens
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1118, 1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(458, 1118, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(462, 1118, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(466, 1118, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1118, 18843, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0);

-- Barrel of Milk
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(469, 3662, 0, -9722.53, 1455.46, 44.8444, 2.05949, 0, 0, 0.857167, 0.515038, 180, 180, 100, 1, 0, 10), -- Westfall
(473, 3705, 0, -9722.53, 1455.46, 44.8444, 2.05949, 0, 0, 0.857167, 0.515038, 180, 180, 100, 1, 0, 10); -- Westfall
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1121, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(469, 1121, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(473, 1121, 'Food Crate / Barrel of Milk - Westfall', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1121, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0);

-- Barrel of Milk
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(478, 3662, 1, 831.808, 941.359, 154.929, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 0, 10), -- Stonetalon Mountains
(479, 3705, 1, 831.808, 941.359, 154.929, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 0, 10); -- Stonetalon Mountains
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1125, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(478, 1125, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10),
(479, 1125, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1125, 14396, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0);

-- Food Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(482, 3658, 1, -1453.69, -1038.54, 142.44, 0.488692, 0, 0, 0.241922, 0.970296, 180, 180, 100, 1, 0, 10), -- Mulgore
(484, 3658, 1, -1832.36, -1147.07, 99.9194, -1.23918, 0, 0, 0.580703, -0.814116, 180, 180, 100, 1, 0, 10), -- Mulgore
(490, 3658, 1, -2381.76, 372.344, 65.9398, -0.802851, 0, 0, 0.390731, -0.920505, 180, 180, 100, 1, 0, 10), -- Mulgore
(507, 3719, 1, -1453.69, -1038.54, 142.44, 0.488692, 0, 0, 0.241922, 0.970296, 180, 180, 100, 1, 0, 10), -- Mulgore
(520, 3719, 1, -1832.36, -1147.07, 99.9194, -1.23918, 0, 0, 0.580703, -0.814116, 180, 180, 100, 1, 0, 10), -- Mulgore
(523, 3719, 1, -2381.76, 372.344, 65.9398, -0.802851, 0, 0, 0.390731, -0.920505, 180, 180, 100, 1, 0, 10); -- Mulgore
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1129, 1, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(1130, 1, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(1135, 1, 'Water Barrel / Food Crate - Mulgore', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(482, 1129, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(484, 1130, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(490, 1135, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(507, 1129, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(520, 1130, 'Water Barrel / Food Crate - Mulgore', 0, 10),
(523, 1135, 'Water Barrel / Food Crate - Mulgore', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1129, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0),
(1130, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0),
(1135, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0);

-- Food Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(525, 3658, 0, 2271.1, 1319.42, 33.8804, 0.663225, 0, 0, 0.325568, 0.945519, 180, 180, 100, 1, 0, 10), -- Tirisfal Glades
(540, 153473, 0, 2271.1, 1319.42, 33.8804, 0.663225, 0, 0, 0.325568, 0.945519, 180, 180, 100, 1, 0, 10); -- Tirisfal Glades
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(1140, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(525, 1140, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10),
(540, 1140, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1140, 4212, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0);

-- Food Crate
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(543, 3707, 1, -2944.64, -3895.61, 35.0316, 1.8326, 0, 0, 0.793353, 0.608761, 180, 180, 100, 1, 0, 10); -- Dustwallow Marsh
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(543, 2512, 'Food Crate', 10);

UPDATE `gameobject` SET `position_x`=2277.38, `position_y`=254.764, `position_z`=34.1961, `orientation`=-2.40855, `rotation0`=0, `rotation1`=0, `rotation2`=0.93358, `rotation3`=-0.358368 WHERE `guid` IN (38970, 38946);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
