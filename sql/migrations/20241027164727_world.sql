DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241027164727');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241027164727');
-- Add your query below.


-- Missing Ooze Covered Rich Thorium Vein spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23983, 177388, 1, -7816.99, 228.785, -57.6589, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(24052, 177388, 1, -7504.23, 1432.09, -81.8033, 0.436332, 0, 0, 0.21644, 0.976296, 300, 300, 1, 100, 0, 10),
(24053, 123309, 1, -7816.99, 228.785, -57.6589, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(24054, 123309, 1, -7504.23, 1432.09, -81.8033, 0.436332, 0, 0, 0.21644, 0.976296, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3990, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 0, 0, 0, 10),
(3979, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(23983, 3990, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus
(24052, 3979, 0, 'Ooze Covered Rich Thorium Vein', 0, 10), -- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus
(24053, 3990, 0, 'Ooze Covered Truesilver Deposit', 0, 10), -- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus
(24054, 3979, 0, 'Ooze Covered Truesilver Deposit', 0, 10); -- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3990, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(3979, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);

-- Missing Mithril Deposit spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(100095, 176645, 1, 3856.5, -939.226, 265.723, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 1, 100, 0, 10),
(100096, 181108, 1, 3856.5, -939.226, 265.723, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 1, 100, 0, 10),
(100097, 181109, 1, 3856.5, -939.226, 265.723, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(100095, 3980, 0, 'Mithril Deposit', 0, 10),
(100096, 3980, 0, 'Truesilver Deposit', 0, 10),
(100097, 3980, 0, 'Gold Vein', 0, 10); 
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3980, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3980, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Missing Plaguebloom spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(57876, 176641, 1, 6352.08, -1521.3, 440.608, 4.71239, 0, 0, 0.707107, -0.707107, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 57846 at 129.224701 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(57876, 1227, 0, 'Plaguebloom', 0, 10); -- Plaguebloom in Felwood

-- Missing Mountain Silversage spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68866, 176640, 1, 6504.79, -754.948, 487.156, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 68797 at 157.450775 yards.
(66841, 176640, 1, 6058.16, -1623.83, 498.649, 2.70526, 0, 0, 0.976296, 0.21644, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66815 at 248.795975 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68866, 401, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Felwood
(66841, 401, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Felwood

-- Missing Dreamfoil spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15451, 176639, 1, 5350.14, -909.026, 371.589, 3.12414, 0, 0, 0.999962, 0.00872656, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 15443 at 269.966766 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15451, 1228, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Felwood

-- Missing Gromsblood spawns in Felwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42182, 176637, 1, 6602.65, -914.152, 473.603, -0.191986, 0, 0, 0.0958458, -0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42157 at 177.092850 yards.
(42183, 176637, 1, 4004.88, -927.519, 256.765, 1.46608, 0, 0, 0.669131, 0.743145, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42161 at 135.988510 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42182, 1225, 0, 'Gromsblood', 0, 10), -- Gromsblood in Felwood
(42183, 1225, 0, 'Gromsblood', 0, 10); -- Gromsblood in Felwood

-- Correct position of Black Lotus in Eastern Plaguelands (position is off by 2.57532 yards).
UPDATE `gameobject` SET `position_x`=2511.82, `position_y`=-5151.87, `position_z`=74.3906, `orientation`=-2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939693, `rotation3`=-0.34202 WHERE `guid`=3998176;

-- Correct position of Black Lotus in Winterspring (position is off by 2.75315 yards).
UPDATE `gameobject` SET `position_x`=6854.01, `position_y`=-2496.59, `position_z`=562.545, `orientation`=1.0472, `rotation0`=0, `rotation1`=0, `rotation2`=0.5, `rotation3`=0.866025 WHERE `guid`=3998224;

-- Missing Mountain Silversage spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48517, 176586, 1, 2421.39, -5514.54, 125.36, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48431 at 332.288727 yards.
(68932, 176586, 1, 2785.35, -6603.16, 94.6218, 3.03687, 0, 0, 0.99863, 0.052336, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 68763 at 352.976501 yards.
(48523, 176586, 1, 4764.85, -6300.41, 123.801, -0.523599, 0, 0, 0.258819, -0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48429 at 511.980896 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48517, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara
(68932, 1243, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Azshara
(48523, 1243, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Azshara

-- Missing Mountain Silversage spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66842, 176586, 0, -7562.53, -2949.86, 165.952, 0.174533, 0, 0, 0.0871557, 0.996195, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66733 at 103.428452 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(66842, 1302, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Burning Steppes

-- Missing Mountain Silversage spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66844, 176586, 0, 2212.89, -2784.65, 97.4395, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66752 at 199.211212 yards.
(66845, 176586, 0, 2670.15, -3283.07, 128.611, -0.506145, 0, 0, 0.25038, -0.968148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66762 at 254.709015 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(66844, 1269, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Eastern Plaguelands
(66845, 1269, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Eastern Plaguelands

-- Missing Mountain Silversage spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49216, 176586, 1, 8149.54, -3712.11, 742.029, -2.47837, 0, 0, 0.945519, -0.325568, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49112 at 431.771393 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49216, 1237, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Winterspring

-- Missing Mountain Silversage spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49412, 176586, 1, -6545.19, 178.98, 28.6209, -1.16937, 0, 0, 0.551937, -0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49409 at 387.353729 yards.
(66843, 176586, 1, -7652.67, 1714.04, 35.9155, 2.61799, 0, 0, 0.965926, 0.258819, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66838 at 196.368851 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49412, 1222, 0, 'Mountain Silversage', 0, 10), -- Mountain Silversage in Silithus
(66843, 1222, 0, 'Mountain Silversage', 0, 10); -- Mountain Silversage in Silithus

-- Missing Dreamfoil spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48561, 176584, 1, 2806.71, -5287.47, 118.312, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48417 at 103.586563 yards.
(18405, 176584, 1, 2662.95, -5921.48, 94.5993, -0.436333, 0, 0, 0.21644, -0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 18314 at 98.803322 yards.
(48617, 176584, 1, 2610.61, -5536.26, 105.048, -2.74017, 0, 0, 0.979925, -0.199368, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48420 at 198.495361 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48561, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara
(18405, 1242, 0, 'Dreamfoil', 0, 10), -- Dreamfoil in Azshara
(48617, 1242, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Azshara

-- Missing Dreamfoil spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49415, 176584, 1, -6434.44, 353.854, 6.77985, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49401 at 423.791138 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49415, 1221, 0, 'Dreamfoil', 0, 10); -- Dreamfoil in Silithus

-- Missing Golden Sansam spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48631, 176583, 1, 2761.89, -6188.96, 100.631, -0.226893, 0, 0, 0.113203, -0.993572, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48409 at 112.150467 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48631, 1241, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Azshara

-- Missing Golden Sansam spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45909, 176583, 0, 1576.84, -5447.21, 97.0544, 1.58825, 0, 0, 0.71325, 0.700909, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45855 at 38.654415 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45909, 1268, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Eastern Plaguelands

-- Missing Golden Sansam spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50162, 176583, 1, -5145.82, 588.803, 35.7277, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50159 at 576.984863 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50162, 1194, 0, 'Golden Sansam', 0, 10); -- Golden Sansam in Feralas

-- Missing Rich Thorium Vein spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(65911, 175404, 1, 2720.11, -6582.94, 115.067, 0.558505, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(65940, 175404, 1, 2452.2, -6524.34, 14.9098, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(65941, 175404, 1, 2204.92, -7219.3, -15.9546, -2.26893, 0, 0, 0.906308, -0.422618, 300, 300, 1, 100, 0, 10),
(65942, 175404, 1, 3914.46, -6544.54, -11.7006, 1.67552, 0, 0, 0.743145, 0.669131, 300, 300, 1, 100, 0, 10),
(65943, 2047, 1, 2720.11, -6582.94, 115.067, 0.558505, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10),
(65944, 2047, 1, 2452.2, -6524.34, 14.9098, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 1, 100, 0, 10),
(65945, 2047, 1, 2204.92, -7219.3, -15.9546, -2.26893, 0, 0, 0.906308, -0.422618, 300, 300, 1, 100, 0, 10),
(65946, 2047, 1, 3914.46, -6544.54, -11.7006, 1.67552, 0, 0, 0.743145, 0.669131, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(65911, 3981, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65940, 3982, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65941, 3983, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65942, 3984, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65943, 3981, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65944, 3982, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65945, 3983, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65946, 3984, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposit / Rich Thorium Vein - Azshara
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3981, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(3982, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(3983, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(3984, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3981, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(3982, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(3983, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(3984, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0);

-- Missing Rich Thorium Vein spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(25038, 175404, 0, 1534.41, -5413.83, 89.1901, -1.95477, 0, 0, 0.829038, -0.559193, 300, 300, 1, 100, 0, 10),
(25039, 175404, 0, 2486.75, -3615.95, 187.837, 0.698132, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10),
(25040, 2047, 0, 1534.41, -5413.83, 89.1901, -1.95477, 0, 0, 0.829038, -0.559193, 300, 300, 1, 100, 0, 10),
(25041, 2047, 0, 2486.75, -3615.95, 187.837, 0.698132, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(25038, 3985, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands
(25039, 3986, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands
(25040, 3985, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands
(25041, 3986, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3985, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 0, 0, 0, 10),
(3986, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3985, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(3986, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0);

-- Missing Truesilver Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(65947, 2047, 1, 3388.9, -6228.17, -9.65082, -1.95477, 0, 0, 0.829038, -0.559193, 300, 300, 1, 100, 0, 10),
(65948, 175404, 1, 3388.9, -6228.17, -9.65082, -1.95477, 0, 0, 0.829038, -0.559193, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(65947, 3988, 0, 'Truesilver Deposit', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Azshara
(65948, 3988, 0, 'Rich Thorium Vein', 0, 10); -- Truesilver Deposit / Rich Thorium Vein - Azshara
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3988, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3988, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0);

-- Missing Rich Thorium Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(24055, 175404, 1, 4602.58, -4414.16, 894.654, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10),
(24056, 2047, 1, 4602.58, -4414.16, 894.654, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(24055, 3987, 0, 'Rich Thorium Vein', 0, 10), -- Truesilver Deposit / Rich Thorium Vein - Winterspring
(24056, 3987, 0, 'Truesilver Deposit', 0, 10); -- Truesilver Deposit / Rich Thorium Vein - Winterspring
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3987, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3987, 1235, 0, 'Winterspring - Truesilver Deposit / Rich Thorium Vein', 0);

-- Correct position of Dark Iron Deposit in Blackrock Depths (position is off by 3.90073 yards).
UPDATE `gameobject` SET `position_x`=416.557, `position_y`=-157.786, `position_z`=-59.976, `orientation`=0.226893, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=43750;

-- Correct position of Dark Iron Deposit in Blackrock Depths (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=679.721, `position_y`=102.181, `position_z`=-73.2564, `orientation`=-1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=-0.829037 WHERE `guid`=43736;

-- Correct position of Dark Iron Deposit in Searing Gorge (position is off by 1.17595 yards).
UPDATE `gameobject` SET `position_x`=-6717.47, `position_y`=-1252.7, `position_z`=183.796, `orientation`=0.139626, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697565, `rotation3`=0.997564 WHERE `guid`=38499;

-- Missing Gromsblood spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42184, 142145, 0, -11833.3, -3117.83, -24.8101, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42121 at 59.483814 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42184, 1275, 0, 'Gromsblood', 0, 10); -- Gromsblood in Blasted Lands

-- Missing Ghost Mushroom spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66968, 142144, 0, -715.492, -3757.67, 233.908, 1.91986, 0, 0, 0.819152, 0.573576, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66925 at 30.733337 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(66968, 1247, 0, 'Ghost Mushroom', 0, 10); -- Ghost Mushroom in Hinterlands

-- Correct position of Blindweed in Swamp of Sorrows (position is off by 0.0996094 yards).
UPDATE `gameobject` SET `position_x`=-10138.9, `position_y`=-3363.5, `position_z`=20.8903, `orientation`=0.10472, `rotation0`=0, `rotation1`=0, `rotation2`=0.052336, `rotation3`=0.99863 WHERE `guid`=66945;

-- Missing Blindweed spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22188, 142143, 0, -9993.26, -4147.57, 19.973, 2.93215, 0, 0, 0.994522, 0.104528, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22184 at 119.305916 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(22188, 1307, 0, 'Blindweed', 0, 10); -- Blindweed in Swamp of Sorrows

-- Missing Sungrass spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(52650, 142142, 1, 2748.19, -4303.92, 98.4883, 2.6529, 0, 0, 0.970296, 0.241922, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 52507 at 101.798836 yards.
(48647, 142142, 1, 2493.43, -5169.58, 129.286, 1.13446, 0, 0, 0.5373, 0.843391, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48345 at 132.999725 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(52650, 1240, 0, 'Sungrass', 0, 10), -- Sungrass in Azshara
(48647, 1240, 0, 'Sungrass', 0, 10); -- Sungrass in Azshara

-- Missing Sungrass spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(52659, 142142, 0, 2440, -1698.84, 103.015, -1.09956, 0, 0, 0.522499, -0.85264, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 52525 at 28.524130 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(52659, 1261, 0, 'Sungrass', 0, 10); -- Sungrass in Western Plaguelands

-- Missing Sungrass spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(52658, 142142, 1, -4862.91, 222.42, 47.9531, -1.25664, 0, 0, 0.587785, -0.809017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 52592 at 144.369156 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(52658, 1192, 0, 'Sungrass', 0, 10); -- Sungrass in Feralas

-- Missing Arthas' Tears spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45959, 142141, 0, 2683, -3990.08, 97.7073, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45860 at 112.160652 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45959, 1266, 0, 'Arthas\' Tears', 0, 10); -- Arthas Tears in Eastern Plaguelands

-- Missing Purple Lotus spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48648, 142140, 1, 2700.16, -4973.66, 130.448, -2.87979, 0, 0, 0.991445, -0.130526, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48336 at 128.902588 yards.
(29477, 142140, 1, 3162.99, -5451.37, 92.7431, -0.0523599, 0, 0, 0.026177, -0.999657, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29376 at 185.339493 yards.
(48649, 142140, 1, 3836.45, -5431.41, 104.358, 1.58825, 0, 0, 0.71325, 0.700909, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48340 at 80.753662 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48648, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara
(29477, 1239, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Azshara
(48649, 1239, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Azshara

-- Missing Purple Lotus spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29478, 142140, 0, -308.989, -3959.7, 197.014, 2.32129, 0, 0, 0.91706, 0.398749, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29410 at 69.262230 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29478, 1254, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Hinterlands

-- Missing Purple Lotus spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68933, 142140, 1, -4731.61, 3580.24, 14.3961, 0.366519, 0, 0, 0.182236, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 68858 at 76.373497 yards.
(50002, 142140, 1, -4916.57, 3554.16, 23.5495, -1.76278, 0, 0, 0.771625, -0.636078, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49976 at 115.159767 yards.
(50003, 142140, 1, -5318.35, 3634.1, 7.43181, 2.1293, 0, 0, 0.87462, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 49975 at 148.240860 yards.
(68934, 142140, 1, -3120.8, 2768.72, 73.5127, -1.90241, 0, 0, 0.814116, -0.580703, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 68857 at 52.550034 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68933, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas
(50002, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas
(50003, 1324, 0, 'Purple Lotus', 0, 10), -- Purple Lotus in Feralas
(68934, 1324, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Feralas

-- Missing Purple Lotus spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66969, 142140, 1, -3624.59, 958.019, 147.893, -0.523599, 0, 0, 0.258819, -0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66939 at 132.752258 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(66969, 1324, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Feralas

-- Missing Firebloom spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55500, 2866, 0, -7285.83, -1954.9, 297.953, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55495 at 162.061691 yards.
(55528, 2866, 0, -6492.16, -1572.75, 325.039, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55501 at 111.597389 yards.
(55529, 2866, 0, -6695.13, -1607.23, 239.621, -0.802851, 0, 0, 0.390731, -0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55497 at 76.015526 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55500, 1291, 0, 'Firebloom', 0, 10), -- Firebloom in Searing Gorge
(55528, 1291, 0, 'Firebloom', 0, 10), -- Firebloom in Searing Gorge
(55529, 1291, 0, 'Firebloom', 0, 10); -- Firebloom in Searing Gorge

-- Missing Firebloom spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12290, 2866, 1, -7484.37, -3971.08, 11.7882, 0.314159, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 12289 at 180.758606 yards.
(30267, 2866, 1, -8419.26, -4452.26, 9.61771, -1.95477, 0, 0, 0.829038, -0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 30230 at 217.497528 yards.
(55530, 2866, 1, -9316.77, -2273.54, 7.87112, -2.3911, 0, 0, 0.930418, -0.366501, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55513 at 373.778107 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12290, 1208, 0, 'Firebloom', 0, 10), -- Firebloom in Tanaris
(30267, 1208, 0, 'Firebloom', 0, 10), -- Firebloom in Tanaris
(55530, 1208, 0, 'Firebloom', 0, 10); -- Firebloom in Tanaris

-- Missing Copper Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3249, 2055, 0, -8822.76, -1975.59, 124.41, -0.767945, 0, 0, 0.374607, -0.927184, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3248 at 48.997730 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(3249, 1128, 0, 'Copper Vein', 0, 10); -- Copper Veins - Redridge Mountains

-- Missing Tin Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40626, 2054, 0, -8962.55, -1990.87, 137.634, 0.261799, 0, 0, 0.130526, 0.991445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40624 at 67.451447 yards.
(40627, 2054, 0, -8817.11, -2061.81, 131.111, 0.139626, 0, 0, 0.0697565, 0.997564, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40623 at 44.908096 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40626, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins - Redridge Mountains
(40627, 1129, 0, 'Tin Vein', 0, 10); -- Tin Veins - Redridge Mountains

-- Add missing herb pool templates for instances.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1014, 5, 'Herbs in Blackfathom Deeps', 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1035, 10, 'Herbs in Zul\'Gurub', 0, 0, 5, 10);

-- Missing Dreamfoil spawns in Zul'Gurub.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68935, 180168, 309, -11751.7, -1893.15, 56.0957, -1.74533, 0, 0, 0.766044, -0.642788, 604800, 604800, 1, 100, 5, 10), -- Closest existing guid is 68540 at 13.381952 yards.
(28797, 180168, 309, -11517.2, -1688.41, 51.148, -2.79253, 0, 0, 0.984808, -0.173648, 604800, 604800, 1, 100, 5, 10), -- Closest existing guid is 28760 at 101.539925 yards.
(28919, 180168, 309, -11539.7, -1244.56, 78.744, 1.29154, 0, 0, 0.601815, 0.798636, 604800, 604800, 1, 100, 5, 10), -- Closest existing guid is 28762 at 75.231499 yards.
(28732, 180168, 309, -12059.7, -1443.07, 130.177, -2.82743, 0, 0, 0.987688, -0.156434, 604800, 604800, 1, 100, 5, 10); -- Closest existing guid is 28709 at 94.832047 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68935, 1035, 0, 'Dreamfoil', 5, 10), -- Herbs in Zul'Gurub
(28797, 1035, 0, 'Dreamfoil', 5, 10), -- Herbs in Zul'Gurub
(28919, 1035, 0, 'Dreamfoil', 5, 10), -- Herbs in Zul'Gurub
(28732, 1035, 0, 'Dreamfoil', 5, 10); -- Herbs in Zul'Gurub

-- Missing Golden Sansam spawns in Zul'Gurub.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28734, 180167, 309, -11457, -1596.5, 49.6861, -0.750491, 0, 0, 0.366501, -0.930418, 604800, 604800, 1, 100, 5, 10), -- Closest existing guid is 28717 at 130.233856 yards.
(28736, 180167, 309, -11654.1, -1567.02, 40.7272, -2.33874, 0, 0, 0.920505, -0.390731, 604800, 604800, 1, 100, 5, 10); -- Closest existing guid is 28717 at 69.936241 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28734, 1035, 0, 'Golden Sansam', 5, 10), -- Herbs in Zul'Gurub
(28736, 1035, 0, 'Golden Sansam', 5, 10); -- Herbs in Zul'Gurub

-- Missing Purple Lotus spawns in Zul'Gurub.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28921, 180165, 309, -11910.5, -1415.37, 53.417, -1.01229, 0, 0, 0.48481, -0.87462, 604800, 604800, 1, 100, 5, 10); -- Closest existing guid is 28763 at 50.813595 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28921, 1035, 0, 'Purple Lotus', 5, 10); -- Herbs in Zul'Gurub

-- Missing Mountain Silversage spawns in Zul'Gurub.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28920, 180166, 309, -12298.3, -1464.21, 130.6, 2.02458, 0, 0, 0.848048, 0.529919, 604800, 604800, 1, 100, 5, 10), -- Closest existing guid is 28756 at 84.870567 yards.
(28922, 180166, 309, -12275.7, -1941.8, 137.406, 0.610865, 0, 0, 0.300706, 0.953717, 604800, 604800, 1, 100, 5, 10); -- Closest existing guid is 28713 at 73.357323 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28920, 1035, 0, 'Mountain Silversage', 5, 10), -- Herbs in Zul'Gurub
(28922, 1035, 0, 'Mountain Silversage', 5, 10); -- Herbs in Zul'Gurub

-- Missing Dreamfoil spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68936, 176584, 429, 19.51, -336.746, -52.4165, -1.62316, 0, 0, 0.725374, -0.688354, 604800, 604800, 1, 100, 1, 10); -- Closest existing guid is 68535 at 85.987282 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68936, 4291, 0, 'Dreamfoil', 1, 10); -- Herbs in Dire Maul

-- Missing Gromsblood spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68937, 142145, 429, 74.0712, -312.948, -54.7951, 2.19911, 0, 0, 0.891007, 0.453991, 604800, 604800, 1, 100, 1, 10), -- Closest existing guid is 68721 at 35.688110 yards.
(68938, 142145, 429, -29.2692, -335.209, -51.8413, 0.767945, 0, 0, 0.374607, 0.927184, 604800, 604800, 1, 100, 1, 10), -- Closest existing guid is 68722 at 57.686741 yards.
(68939, 142145, 429, 76.7673, -396.059, -4.22162, -0.942478, 0, 0, 0.453991, -0.891006, 604800, 604800, 1, 100, 1, 10), -- Closest existing guid is 68721 at 95.741486 yards.
(68940, 142145, 429, 58.7297, -715.696, -25.1607, 1.15192, 0, 0, 0.544639, 0.838671, 604800, 604800, 1, 100, 1, 10); -- Closest existing guid is 68724 at 310.408752 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68937, 4291, 0, 'Gromsblood', 1, 10), -- Herbs in Dire Maul
(68938, 4291, 0, 'Gromsblood', 1, 10), -- Herbs in Dire Maul
(68939, 4291, 0, 'Gromsblood', 1, 10), -- Herbs in Dire Maul
(68940, 4291, 0, 'Gromsblood', 1, 10); -- Herbs in Dire Maul

-- Missing Ghost Mushroom spawns in Maraudon.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68941, 142144, 349, 926.314, -292.831, -49.8022, 0, 0, 0, 0, 1, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 68651 at 69.555222 yards.
(68942, 142144, 349, 854.992, -323.021, -51.5775, 3.07178, 0, 0, 0.999391, 0.0348995, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 68652 at 101.152557 yards.
(32914, 142144, 349, 992.133, -1.21648, -62.5453, -0.349066, 0, 0, 0.173648, -0.984808, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 32911 at 127.682228 yards.
(68943, 142144, 349, 813.16, -244.633, -60.6847, 2.16421, 0, 0, 0.882948, 0.469472, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 68652 at 97.962120 yards.
(32918, 142144, 349, 640.385, -101.812, -56.1699, 0.977384, 0, 0, 0.469472, 0.882948, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 32912 at 91.669266 yards.
(68944, 142144, 349, 793.028, -402.078, -54.1393, -1.67552, 0, 0, 0.743145, -0.669131, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 68652 at 89.131973 yards.
(32921, 142144, 349, 281.733, -340.384, -117.223, -0.226893, 0, 0, 0.113203, -0.993572, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 32913 at 344.990997 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68941, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(68942, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(32914, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(68943, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(32918, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(68944, 34902, 0, 'Ghost Mushroom', 0, 10), -- Ghost Mushroom Maraudon
(32921, 34902, 0, 'Ghost Mushroom', 0, 10); -- Ghost Mushroom Maraudon

-- Missing Blindweed spawns in Maraudon.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32928, 142143, 349, -89.0383, -389.406, -189.896, -1.85005, 0, 0, 0.798635, -0.601815, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 32923 at 320.449890 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32928, 34902, 0, 'Blindweed', 0, 10); -- Ghost Mushroom Maraudon

-- Missing Arthas' Tears spawns in Razorfen Downs.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68945, 142141, 129, 2397.51, 947.964, 55.0285, 0.279253, 0, 0, 0.139173, 0.990268, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 68335 at 40.201210 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68945, 2003, 0, 'Arthas\' Tears', 0, 10); -- Herbs in Razorfen Downs

-- Missing Indurium Mineral Vein spawns in Uldaman.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40692, 19903, 70, -102.08, 309.573, -49.174, 1.36136, 0, 0, 0.62932, 0.777146, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 40689 at 43.834389 yards.

-- Correct position of Goldthorn in Stranglethorn Vale (position is off by 0.000999451 yards).
UPDATE `gameobject` SET `position_x`=-12979, `position_y`=111.058, `position_z`=38.4194, `orientation`=-2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=-0.5373 WHERE `guid`=42266;

-- Missing Goldthorn spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58810, 2046, 0, -10055.6, -3043.56, 40.0738, 2.86234, 0, 0, 0.990268, 0.139173, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58195 at 130.422119 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58810, 1313, 0, 'Goldthorn', 0, 10); -- Goldthorn in Swamp of Sorrows

-- Missing Goldthorn spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9117, 2046, 0, -11599.7, 724.194, 61.3601, -2.84489, 0, 0, 0.989016, -0.147809, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 9116 at 102.962761 yards.
(42329, 2046, 0, -14648.1, 456.987, 16.368, 1.51844, 0, 0, 0.688355, 0.725374, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42261 at 618.600769 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9117, 1174, 0, 'Goldthorn', 0, 10), -- Goldthorn in Stranglethorn
(42329, 1174, 0, 'Goldthorn', 0, 10); -- Goldthorn in Stranglethorn

-- Missing Goldthorn spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50245, 2046, 1, -5365.35, 3730.35, 29.7129, -2.16421, 0, 0, 0.882948, -0.469472, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50241 at 124.681801 yards.
(42424, 2046, 1, -5105.21, 1447.63, 57.0353, 1.46608, 0, 0, 0.669131, 0.743145, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42347 at 46.891525 yards.
(58811, 2046, 1, -5086.44, 2110.42, 30.4103, 0.15708, 0, 0, 0.0784591, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 58257 at 220.137985 yards.
(42425, 2046, 1, -5080.44, 144.22, 62.2087, 0.418879, 0, 0, 0.207912, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42336 at 131.718918 yards.
(42426, 2046, 1, -3134.84, 2646.5, 50.8501, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42335 at 171.035080 yards.
(42427, 2046, 1, -2882.96, 1652.51, 51.1851, -0.436333, 0, 0, 0.21644, -0.976296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42339 at 447.141907 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50245, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas
(42424, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas
(58811, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas
(42425, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas
(42426, 1191, 0, 'Goldthorn', 0, 10), -- Goldthorn in Feralas
(42427, 1191, 0, 'Goldthorn', 0, 10); -- Goldthorn in Feralas

-- Correct position of Stranglekelp in Swamp of Sorrows (position is off by 2.58549 yards).
UPDATE `gameobject` SET `position_x`=-10820.4, `position_y`=-4390.35, `position_z`=-35.3, `orientation`=2.53073, `rotation0`=0, `rotation1`=0, `rotation2`=0.953717, `rotation3`=0.300706 WHERE `guid`=50482;

-- Missing Stranglekelp spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58817, 2045, 0, -9686.44, -4357.55, -38.4759, -2.1293, 0, 0, 0.87462, -0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 58687 at 171.915970 yards.
(51207, 2045, 0, -10484.6, -4549.76, -24.6417, -0.366519, 0, 0, 0.182236, -0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50477 at 82.393066 yards.
(51208, 2045, 0, -10552.4, -4508.52, -21.5663, -2.18166, 0, 0, 0.887011, -0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50477 at 55.711697 yards.
(58818, 2045, 0, -11071.4, -4303.55, -34.3606, 0.907571, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58693 at 90.818550 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58817, 984, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Swamp of Sorrows
(51207, 984, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Swamp of Sorrows
(51208, 984, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Swamp of Sorrows
(58818, 984, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Swamp of Sorrows

-- Missing Stranglekelp spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(51203, 2045, 0, -2888.96, -819.792, -13.2532, -1.32645, 0, 0, 0.615661, -0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50531 at 82.490356 yards.
(58813, 2045, 0, -3055.46, -792.295, -12.0644, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58702 at 70.452919 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(51203, 1149, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Wetlands
(58813, 1149, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Wetlands

-- Missing Stranglekelp spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48650, 2045, 1, 2166.75, -6329.64, -14.9421, 2.61799, 0, 0, 0.965926, 0.258819, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48483 at 797.992615 yards.
(48651, 2045, 1, 3014.58, -6397.89, -15.7129, -0.139626, 0, 0, 0.0697565, -0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48482 at 561.070068 yards.
(50677, 2045, 1, 3615.13, -7005.96, -24.3289, -1.3439, 0, 0, 0.622515, -0.782608, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50544 at 554.871216 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48650, 1321, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Azshara
(48651, 1321, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Azshara
(50677, 1321, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Azshara

-- Missing Stranglekelp spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(51202, 2045, 1, -1674.97, -4166.33, -1.18867, 1.67552, 0, 0, 0.743145, 0.669131, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50561 at 74.280930 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(51202, 1064, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Barrens

-- Missing Stranglekelp spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(51206, 2045, 0, 702.754, 139.303, 24.0493, 0.610865, 0, 0, 0.300706, 0.953717, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50612 at 194.832932 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(51206, 999, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Alterac Mountains

-- Missing Stranglekelp spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42853, 2045, 0, -9788.41, 1783.04, -5.71438, 1.39626, 0, 0, 0.642788, 0.766044, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42761 at 63.635223 yards.
(51205, 2045, 0, -11515.1, 1894.22, -25.4648, -1.51844, 0, 0, 0.688354, -0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 50623 at 92.963638 yards.
(58815, 2045, 0, -9687.77, 2068.6, -31.3925, -0.942478, 0, 0, 0.453991, -0.891006, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 58728 at 110.420944 yards.
(31025, 2045, 0, -9504.94, 1420.12, -17.7375, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31018 at 222.618698 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42853, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall
(51205, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall
(58815, 1122, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Westfall
(31025, 1122, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Westfall

-- Missing Stranglekelp spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58816, 2045, 0, -1175.37, 194.017, -6.56839, -1.0821, 0, 0, 0.515038, -0.857167, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58762 at 112.882492 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58816, 1123, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Hillsbrad Foothills

-- Missing Stranglekelp spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(51204, 2045, 1, -4993.56, 3140.48, -4.83073, -0.0174535, 0, 0, 0.00872664, -0.999962, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 50707 at 108.791306 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(51204, 1190, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Feralas

-- Missing Stranglekelp spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29204, 2045, 1, -1798.5, 3422.83, -45.1362, 2.96706, 0, 0, 0.996195, 0.0871558, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29200 at 81.321060 yards.
(58812, 2045, 1, -1330.21, 3297.03, -45.741, 0.436332, 0, 0, 0.21644, 0.976296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58780 at 92.626686 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29204, 1145, 0, 'Stranglekelp', 0, 10), -- Stranglekelp in Desolace
(58812, 1145, 0, 'Stranglekelp', 0, 10); -- Stranglekelp in Desolace

-- Missing Stranglekelp spawns in Blackfathom Deeps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32621, 2045, 48, -517.099, 165.319, -75.165, -3.08923, 0, 0, 0.999657, -0.026177, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 32616 at 62.601402 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32621, 1014, 0, 'Stranglekelp', 0, 10); -- Herbs in Blackfathom Deeps

-- Missing Stranglekelp spawns in Maraudon.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32948, 2045, 349, 26.4207, -175.252, -208.4, -1.44862, 0, 0, 0.66262, -0.748956, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 32925 at 49.861259 yards.
(58814, 2045, 349, 1.16174, -258.687, -208.415, 3.07178, 0, 0, 0.999391, 0.0348995, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 58798 at 35.838829 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32948, 34902, 0, 'Stranglekelp', 0, 10), -- Ghost Mushroom Maraudon
(58814, 34902, 0, 'Stranglekelp', 0, 10); -- Ghost Mushroom Maraudon

-- Missing Khadgar's Whisker spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35285, 2043, 0, -10075.4, -4170.35, 24.6821, -1.22173, 0, 0, 0.573576, -0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35040 at 100.215363 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35285, 1309, 0, 'Khadgar\'s Whisker', 0, 10); -- Khadgars Whisker in Swamp of Sorrows

-- Missing Khadgar's Whisker spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35286, 2043, 1, -4620.2, -3086.35, 35.2063, 0.296706, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35057 at 150.218887 yards.
(55935, 2043, 1, -2919.91, -4072.94, 40.5925, -2.89725, 0, 0, 0.992546, -0.121869, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55934 at 249.166016 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35286, 1102, 0, 'Khadgar\'s Whisker', 0, 10), -- Khadgars Whisker in Dustwallow Marsh
(55935, 1102, 0, 'Khadgar\'s Whisker', 0, 10); -- Khadgars Whisker in Dustwallow Marsh

-- Missing Khadgar's Whisker spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58819, 2043, 0, -13389.5, 346.085, 35.1988, 2.33874, 0, 0, 0.920505, 0.390731, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58293 at 78.911293 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58819, 1173, 0, 'Khadgar\'s Whisker', 0, 10); -- Khadgars Whisker in Stranglethorn

-- Missing Khadgar's Whisker spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35287, 2043, 1, -4649.55, 87.6845, 85.7501, 2.16421, 0, 0, 0.882948, 0.469472, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35156 at 281.336975 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35287, 1189, 0, 'Khadgar\'s Whisker', 0, 10); -- Khadgars Whisker in Feralas

-- Correct position of Fadeleaf in Scarlet Monastery (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=187.977, `position_y`=-277.975, `position_z`=18.7037, `orientation`=-0.942478, `rotation0`=0, `rotation1`=0, `rotation2`=0.453991, `rotation3`=-0.891006 WHERE `guid`=6832;

-- Correct position of Fadeleaf in Stranglethorn Vale (position is off by 0.00480182 yards).
UPDATE `gameobject` SET `position_x`=-11879, `position_y`=19.2741, `position_z`=23.6722, `orientation`=-2.75762, `rotation0`=0, `rotation1`=0, `rotation2`=0.981627, `rotation3`=-0.190809 WHERE `guid`=7710;

-- Missing Fadeleaf spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28980, 2042, 0, -38.9596, 192.553, 50.7099, -0.314159, 0, 0, 0.156434, -0.987688, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 28963 at 52.855343 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(28980, 1071, 0, 'Fadeleaf', 0, 10); -- Fadeleaf in Alterac Mountains

-- Missing Fadeleaf spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68946, 2042, 0, -1682.14, -2967.36, 38.6792, -2.07694, 0, 0, 0.861629, -0.507538, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 68617 at 60.696068 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68946, 1183, 0, 'Fadeleaf', 0, 10); -- Fadeleaf in Arathi Highlands

-- Missing Fadeleaf spawns in Razorfen Kraul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68947, 2042, 47, 2207, 1594.41, 80.8867, -1.29154, 0, 0, 0.601815, -0.798635, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 68619 at 112.457672 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68947, 2002, 0, 'Fadeleaf', 0, 10); -- Herbs in Razorfen Kraul

-- Correct position of Liferoot in Scarlet Monastery (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=120.013, `position_y`=-263.812, `position_z`=18.5465, `orientation`=-2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945519, `rotation3`=-0.325568 WHERE `guid`=11904;

-- Missing Liferoot spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12342, 2041, 1, -4521.75, -3746.24, 32.9108, -0.645772, 0, 0, 0.317305, -0.948324, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12340 at 136.292877 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12342, 1104, 0, 'Liferoot', 0, 10); -- Liferoot in Dustwallow Marsh

-- Missing Liferoot spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58820, 2041, 0, -1812.9, -3302.8, 27.5366, 2.87979, 0, 0, 0.991445, 0.130526, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58663 at 63.135490 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58820, 1184, 0, 'Liferoot', 0, 10); -- Liferoot in Arathi Highlands

-- Missing Liferoot spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21444, 2041, 1, -2942.1, 1841.15, 29.4008, 1.72788, 0, 0, 0.760406, 0.649448, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21443 at 161.186676 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21444, 1193, 0, 'Liferoot', 0, 10); -- Liferoot in Feralas

-- Correct position of Mithril Deposit in Searing Gorge (position is off by 2.23478 yards).
UPDATE `gameobject` SET `position_x`=-6471.71, `position_y`=-1194.54, `position_z`=183.035, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601815, `rotation3`=0.798636 WHERE `guid`=38439;

-- Missing Mithril Deposit spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(25228, 2040, 0, -6737.73, -3787.54, 273.026, 2.70526, 0, 0, 0.976296, 0.21644, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 25154 at 164.858948 yards.
(25229, 2040, 0, -6437.13, -4166.62, 293.283, -1.64061, 0, 0, 0.731354, -0.681998, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 25168 at 104.834045 yards.

-- Missing Mithril Deposit spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23189, 2040, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 23163 at 36.635441 yards.
(23190, 2040, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 23168 at 126.328918 yards.

-- Missing Mithril Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66455, 2040, 1, 4293.85, -6170.96, 133.361, -2.19912, 0, 0, 0.891007, -0.45399, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 66377 at 164.510544 yards.
(66456, 2040, 1, 4853.9, -6549.07, 118.069, -1.06465, 0, 0, 0.507538, -0.861629, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 66406 at 175.840027 yards.
(66459, 2040, 1, 2002.13, -5895.49, -6.39748, -0.715585, 0, 0, 0.350207, -0.936672, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 66391 at 278.309875 yards.

-- Missing Mithril Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(220834, 2040, 0, 719.463, -502.486, 171.224, 1.309, 0, 0, 0.608761, 0.793353, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220821 at 115.522217 yards.
(387422, 2040, 0, 654.105, -729.997, 160.305, -2.3911, 0, 0, 0.930418, -0.366501, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 387419 at 22.930285 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(220834, 1069, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Alterac Mountains
(387422, 1069, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Alterac Mountains

-- Missing Mithril Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21381, 2040, 1, -5752.27, 3677.47, -8.37481, -0.750491, 0, 0, 0.366501, -0.930418, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 21364 at 197.964096 yards.
(21382, 2040, 1, -5585.74, 3546.6, -2.5983, -2.56563, 0, 0, 0.95882, -0.284015, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 21365 at 70.341942 yards.
(21383, 2040, 1, -5581.2, 3514.24, 19.1351, -2.49582, 0, 0, 0.948324, -0.317305, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 21365 at 49.433422 yards.
(21384, 2040, 1, -3119.27, 2513.86, 72.785, 3.05433, 0, 0, 0.999048, 0.0436195, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 21379 at 363.617218 yards.

-- Missing Mithril Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(220832, 2040, 1, -347.319, 717.753, 92.6404, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220818 at 294.571136 yards.
(220833, 2040, 1, -663.746, 2624.86, 45.0553, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 220817 at 168.431992 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(220832, 1146, 0, 'Mithril Deposit', 0, 10), -- Mithril Deposits in Desolace
(220833, 1146, 0, 'Mithril Deposit', 0, 10); -- Mithril Deposits in Desolace

-- Missing Mithril Deposit spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427512, 2040, 1, -8783.8, -4489.43, 44.7562, 2.58309, 0, 0, 0.961262, 0.275637, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 427495 at 130.258896 yards.
(22772, 2040, 1, -9300.68, -2166.02, 21.5652, 2.58309, 0, 0, 0.961262, 0.275637, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 22678 at 100.853592 yards.
(22773, 2040, 1, -9526.4, -2399.89, 45.5343, -2.46091, 0, 0, 0.942641, -0.333807, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 22705 at 213.071808 yards.

-- Missing Mithril Deposit spawns in Uldaman.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21836, 2040, 70, -30.7983, 296.949, -45.43, -0.488692, 0, 0, 0.241922, -0.970296, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 21835 at 30.487267 yards.

-- Missing Mithril Deposit spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427523, 2040, 1, -7318.67, 377.435, 18.0047, 0.10472, 0, 0, 0.052336, 0.99863, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 427513 at 314.044739 yards.
(16899, 2040, 1, -8009.26, 1984.93, 15.7425, -1.79769, 0, 0, 0.782608, -0.622515, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 16848 at 229.306900 yards.

-- Missing Mithril Deposit spawns in Maraudon.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(39399, 2040, 349, 245.358, -412.876, -139.555, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 39089 at 42.160126 yards.

-- Correct position of Iron Deposit in Wetlands (position is off by 0.260029 yards).
UPDATE `gameobject` SET `position_x`=-2967.17, `position_y`=-3240.31, `position_z`=54.206, `orientation`=-0.959931, `rotation0`=0, `rotation1`=0, `rotation2`=0.461749, `rotation3`=-0.887011 WHERE `guid`=112836;

-- Correct position of Iron Deposit in Wetlands (position is off by 0.0543794 yards).
UPDATE `gameobject` SET `position_x`=-2906.85, `position_y`=-3236.45, `position_z`=57.6001, `orientation`=2.53073, `rotation0`=0, `rotation1`=0, `rotation2`=0.953717, `rotation3`=0.300706 WHERE `guid`=112839;

-- Missing Iron Deposit spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(25288, 1735, 0, -11080.6, -1109.6, 45.5113, -1.51844, 0, 0, 0.688354, -0.725374, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 25286 at 49.795357 yards.

-- Missing Iron Deposit spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56033, 1735, 1, -4566.88, -2734.63, 45.9512, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 56026 at 249.205154 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56033, 43520, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Dustwallow Marsh

-- Missing Iron Deposit spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427281, 1735, 0, -12796.9, -818.581, 74.8231, 2.6529, 0, 0, 0.970296, 0.241922, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427100 at 168.561646 yards.
(30813, 1735, 0, -13033.3, -352.442, 39.8206, -1.16937, 0, 0, 0.551937, -0.833886, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30810 at 70.098244 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(427281, 1175, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Stranglethorn
(30813, 1175, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Stranglethorn

-- Missing Iron Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10254, 1735, 0, 1220.72, -362.385, 56.5595, -1.25664, 0, 0, 0.587785, -0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10230 at 98.437126 yards.
(35387, 1735, 0, 679.88, -652.475, 159.182, 2.47837, 0, 0, 0.945519, 0.325568, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35384 at 34.901154 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10254, 1068, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Alterac Mountains
(35387, 1068, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Alterac Mountains

-- Missing Iron Deposit spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427540, 1735, 0, -911.687, -3877.76, 141.116, 2.51327, 0, 0, 0.951057, 0.309017, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 427436 at 23.607170 yards.
(34590, 1735, 0, -1937.67, -3216.95, 78.7885, -0.418879, 0, 0, 0.207912, -0.978148, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 34496 at 60.664383 yards.
(427245, 1735, 0, -2060.62, -2789.07, 68.599, 1.15192, 0, 0, 0.544639, 0.838671, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 427227 at 15.839430 yards.
(427052, 1735, 0, -570.907, -1973.91, 61.6349, 1.93732, 0, 0, 0.824126, 0.566406, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 427040 at 117.574150 yards.

-- Missing Iron Deposit spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427356, 1735, 1, 2645.16, -2650.19, 148.121, 1.6057, 0, 0, 0.71934, 0.694658, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427348 at 107.211334 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(427356, 1079, 0, 'Iron Deposit', 0, 10); -- Iron Deposits - Ashenvale

-- Missing Iron Deposit spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28021, 1735, 1, -6222.05, -4367.97, -56.7603, -0.226893, 0, 0, 0.113203, -0.993572, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 27964 at 253.433441 yards.
(427294, 1735, 1, -5086.62, -950.802, 1.68455, 0.191986, 0, 0, 0.0958458, 0.995396, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 427280 at 77.470131 yards.

-- Missing Iron Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10331, 1735, 1, -644.395, 764.579, 99.4901, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10330 at 140.573410 yards.
(427268, 1735, 1, -2248.52, 1271.64, 85.5893, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427141 at 245.110794 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10331, 1141, 0, 'Iron Deposit', 0, 10), -- Iron Deposits in Desolace
(427268, 1141, 0, 'Iron Deposit', 0, 10); -- Iron Deposits in Desolace

-- Correct position of Gold Vein in Searing Gorge (position is off by 0.625114 yards).
UPDATE `gameobject` SET `position_x`=-6599.61, `position_y`=-1431.66, `position_z`=167.413, `orientation`=2.37365, `rotation0`=0, `rotation1`=0, `rotation2`=0.927184, `rotation3`=0.374607 WHERE `guid`=38321;

-- Missing Gold Vein spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66469, 1734, 1, 5024.58, -7276.83, -4.43215, 1.16937, 0, 0, 0.551937, 0.833886, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 66353 at 284.685760 yards.

-- Missing Gold Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21385, 1734, 1, -5531.73, 3587.94, -12.624, 0.802851, 0, 0, 0.390731, 0.920505, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 21338 at 55.558098 yards.

-- Missing Gold Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34210, 1734, 1, -857.72, 2428.58, 99.7405, -0.244346, 0, 0, 0.121869, -0.992546, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 34189 at 148.102219 yards.

-- Missing Gold Vein spawns in Razorfen Kraul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47681, 1734, 47, 2045.91, 1882.22, 57.761, 2.74017, 0, 0, 0.979925, 0.199368, 604800, 604800, 1, 100, 0, 10),
(47682, 1735, 47, 2045.91, 1882.22, 57.761, 2.74017, 0, 0, 0.979925, 0.199368, 604800, 604800, 1, 100, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47681, 3989, 0, 'Gold Vein', 0, 10), -- Gold Vein / Iron Deposit  - Razorfen Kraul
(47682, 3989, 0, 'Iron Deposit', 0, 10); -- Gold Vein / Iron Deposit  - Razorfen Kraul
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3989, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 0, 0, 10);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3989, 7123, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0);

-- Missing Silver Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31587, 1733, 0, -11713, -645.439, 49.3283, 1.93732, 0, 0, 0.824126, 0.566406, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 31532 at 109.834518 yards.
(31588, 1733, 0, -12369.8, -1055.09, 4.36752, 1.8326, 0, 0, 0.793353, 0.608761, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 31532 at 797.549561 yards.

-- Missing Silver Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427023, 1733, 0, 970.277, -916.3, 136.895, 2.37365, 0, 0, 0.927184, 0.374607, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427002 at 284.821381 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(427023, 397, 0, 'Silver Vein', 0, 10); -- Silver Veins in Alterac Mountains

-- Missing Silver Vein spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427547, 1733, 0, -942.624, -3954.16, 146.634, -0.244346, 0, 0, 0.121869, -0.992546, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 427423 at 26.560017 yards.

-- Missing Silver Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22814, 1733, 1, -4558.38, -139.326, 109.76, -0.418879, 0, 0, 0.207912, -0.978148, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 22780 at 412.805145 yards.

-- Missing Silver Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3996274, 1733, 1, -5788.96, -3886.07, -94.2955, -1.67552, 0, 0, 0.743145, -0.669131, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 3996263 at 377.517090 yards.

-- Missing Silver Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27302, 1733, 1, 935.066, -262.797, 21.6798, -0.174533, 0, 0, 0.0871559, -0.996195, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 27268 at 29.385189 yards.

-- Correct position of Tin Vein in The Deadmines (position is off by 0.452807 yards).
UPDATE `gameobject` SET `position_x`=-128.285, `position_y`=-444.187, `position_z`=57.2421, `orientation`=0.349066, `rotation0`=0, `rotation1`=0, `rotation2`=0.173648, `rotation3`=0.984808 WHERE `guid`=50307;

-- Correct position of Tin Vein in Duskwood (position is off by 0.421113 yards).
UPDATE `gameobject` SET `position_x`=-11129.2, `position_y`=-1154.07, `position_z`=44.9921, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515038, `rotation3`=0.857167 WHERE `guid`=23291;

-- Correct position of Tin Vein in Duskwood (position is off by 0.000106812 yards).
UPDATE `gameobject` SET `position_x`=-11101.3, `position_y`=-74.5433, `position_z`=14.5994, `orientation`=-2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=-0.492423 WHERE `guid`=23266;

-- Correct position of Tin Vein in Silverpine Forest (position is off by 0.781399 yards).
UPDATE `gameobject` SET `position_x`=77.5, `position_y`=1519.55, `position_z`=126.13, `orientation`=-2.82743, `rotation0`=0, `rotation1`=0, `rotation2`=0.987688, `rotation3`=-0.156434 WHERE `guid`=5505;

-- Missing Tin Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22914, 1732, 0, -4318.25, -3030.73, 12.2277, -1.32645, 0, 0, 0.615661, -0.788011, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 22836 at 44.023846 yards.
(118820, 1732, 0, -3874.11, -2340.36, 22.3002, -0.349066, 0, 0, 0.173648, -0.984808, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 118805 at 43.651844 yards.
(22915, 1732, 0, -3556.3, -1769.77, 76.4529, -1.25664, 0, 0, 0.587785, -0.809017, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 22850 at 113.116913 yards.
(22916, 1732, 0, -3061.29, -3257.71, 70.5456, -2.79253, 0, 0, 0.984808, -0.173648, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 22869 at 52.405243 yards.
(22917, 1732, 0, -2659.07, -2014.63, 19.8238, -0.785398, 0, 0, 0.382683, -0.92388, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 22873 at 76.461021 yards.

-- Missing Tin Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34630, 1732, 1, -1660.13, -2293.41, 87.9985, -0.959931, 0, 0, 0.461749, -0.887011, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34625 at 73.852585 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34630, 2587, 0, 'Tin Vein', 0, 10); -- Tin Veins (3764) - Barrens

-- Missing Tin Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23211, 1732, 0, -5787, -4132.4, 392.252, 1.29154, 0, 0, 0.601815, 0.798636, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 23210 at 95.130562 yards.
(251654, 1732, 0, -4773.33, -3700.73, 314.729, 3.07178, 0, 0, 0.999391, 0.0348995, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 251644 at 69.460320 yards.

-- Missing Tin Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23540, 1732, 0, -11302.4, 1478.61, 91.7132, -1.72788, 0, 0, 0.760406, -0.649448, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 23371 at 108.026428 yards.

-- Missing Tin Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40628, 1732, 0, -8703.86, -2309.01, 162.106, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40622 at 42.981907 yards.
(40629, 1732, 0, -9354.13, -2989.31, 135.666, -1.97222, 0, 0, 0.833886, -0.551937, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40605 at 69.476509 yards.
(389362, 1732, 0, -9797.6, -3226.64, 61.2402, 0.977384, 0, 0, 0.469472, 0.882948, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 389325 at 70.756432 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40628, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins - Redridge Mountains
(40629, 1129, 0, 'Tin Vein', 0, 10), -- Tin Veins - Redridge Mountains
(389362, 1129, 0, 'Tin Vein', 0, 10); -- Tin Veins - Redridge Mountains

-- Missing Tin Vein spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16909, 1732, 0, -354.726, 908.392, 133.978, -2.82743, 0, 0, 0.987688, -0.156434, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16825 at 15.708691 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16909, 1045, 0, 'Tin Vein', 0, 10); -- Tin Veins - Silverpine Forest

-- Missing Tin Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55853, 1732, 1, 2695.77, -2574.71, 185.855, -2.74017, 0, 0, 0.979925, -0.199368, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55777 at 42.396111 yards.
(251551, 1732, 1, 3103.64, -825.164, 204.386, -0.0349067, 0, 0, 0.0174525, -0.999848, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 251545 at 138.397110 yards.
(55668, 1732, 1, 3226.72, -717.467, 158.211, -0.663225, 0, 0, 0.325568, -0.945519, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55645 at 81.364319 yards.
(55854, 1732, 1, 3596.28, -242.112, 21.8994, -1.01229, 0, 0, 0.48481, -0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55787 at 6.769221 yards.
(55669, 1732, 1, 4128.12, 203.893, 11.717, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55666 at 146.511597 yards.
(251728, 1732, 1, 2314.7, 401.128, 140.828, 2.79253, 0, 0, 0.984808, 0.173648, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 251723 at 353.844238 yards.
(251729, 1732, 1, 1940.27, -180.158, 114.71, -1.69297, 0, 0, 0.748956, -0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 251723 at 754.381653 yards.
(251552, 1732, 1, 1723.4, -1294.55, 168.293, 3.07178, 0, 0, 0.999391, 0.0348995, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 251537 at 155.652664 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55853, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(251551, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(55668, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(55854, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(55669, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(251728, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(251729, 1074, 0, 'Tin Vein', 0, 10), -- Tin Veins - Ashenvale
(251552, 1074, 0, 'Tin Vein', 0, 10); -- Tin Veins - Ashenvale

-- Missing Tin Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20728, 1732, 1, -2288.9, 1347.4, 66.215, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20726 at 456.625732 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20728, 1140, 0, 'Tin Vein', 0, 10); -- Tin Veins in Desolace

-- Missing Tin Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27303, 1732, 1, 928.468, -274.892, -0.162452, 3.08923, 0, 0, 0.731354, 0.681998, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 27222 at 24.629126 yards.
(27304, 1732, 1, 1661.98, 122.839, 119.924, 1.50098, 0, 0, 0.681998, 0.731354, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 27235 at 193.096375 yards.
(27305, 1732, 1, -42.6393, 371.164, 119.746, 2.0944, 0, 0, 0.819152, -0.573576, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 27210 at 40.276657 yards.

-- Missing Tin Vein spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49244, 1732, 43, 17.0352, -139.235, -74.8176, -1.79769, 0, 0, 0.782608, -0.622515, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 49228 at 140.647873 yards.

-- Missing Tin Vein spawns in The Deadmines.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50321, 1732, 36, -134.418, -640.136, 16.6032, 1.309, 0, 0, 0.608761, 0.793353, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 50303 at 72.757919 yards.

-- Correct position of Copper Vein in Darkshore (position is off by 1.31455 yards).
UPDATE `gameobject` SET `position_x`=6060.44, `position_y`=90.7847, `position_z`=44.6887, `orientation`=-0.471239, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=-0.97237 WHERE `guid`=363591;

-- Correct position of Copper Vein in Mulgore (position is off by 1.14973 yards).
UPDATE `gameobject` SET `position_x`=-1665.47, `position_y`=356.142, `position_z`=110.407, `orientation`=2.53073, `rotation0`=0, `rotation1`=0, `rotation2`=0.953717, `rotation3`=0.300706 WHERE `guid`=5323;

-- Correct position of Copper Vein in Mulgore (position is off by 1.03293 yards).
UPDATE `gameobject` SET `position_x`=-1996.73, `position_y`=423.48, `position_z`=133.59, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=4766;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.415984 yards).
UPDATE `gameobject` SET `position_x`=900.216, `position_y`=1704.8, `position_z`=29.1258, `orientation`=-1.13446, `rotation0`=0, `rotation1`=0, `rotation2`=0.5373, `rotation3`=-0.843391 WHERE `guid`=5210;

-- Missing Copper Vein spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10282, 1731, 0, -5047.76, -230.372, 447.539, -1.88496, 0, 0, 0.809017, -0.587785, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10190 at 56.675240 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10282, 1019, 0, 'Copper Vein', 0, 10); -- Copper Veins - Dun Morogh

-- Missing Copper Vein spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27052, 1731, 0, -8792.19, -1055.19, 75.3147, -1.25664, 0, 0, 0.587785, -0.809017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 27040 at 157.884521 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27052, 1015, 0, 'Copper Vein', 0, 10); -- Copper Veins - Elwynn Forest

-- Missing Copper Vein spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4992, 1731, 1, -982.906, -4436.19, 34.2814, 0.418879, 0, 0, 0.207912, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4991 at 66.262703 yards.
(5204, 1731, 1, 656.715, -4542.25, 12.2872, -1.50098, 0, 0, 0.681998, -0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5202 at 63.769676 yards.
(5345, 1731, 1, 947.336, -4220.51, -6.28864, -1.71042, 0, 0, 0.75471, -0.656059, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5344 at 6.911240 yards.
(12918, 1731, 1, 858.186, -4746.79, 38.4411, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12900 at 17.250235 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4992, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins - Durotar
(5204, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins - Durotar
(5345, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins - Durotar
(12918, 1024, 0, 'Copper Vein', 0, 10); -- Copper Veins - Durotar

-- Missing Copper Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40313, 1731, 1, 77.4766, -2138.44, 108.221, 1.58825, 0, 0, 0.71325, 0.700909, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 40306 at 45.809162 yards.
(40329, 1731, 1, -845.568, -1614.51, 92.8366, -2.44346, 0, 0, 0.939693, -0.34202, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40216 at 83.554871 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40313, 4303, 0, 'Copper Vein', 0, 10), -- Copper Veins - Barrens
(40329, 4303, 0, 'Copper Vein', 0, 10); -- Copper Veins - Barrens

-- Missing Copper Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12919, 1731, 0, -5541.88, -4316.9, 399.572, 2.23402, 0, 0, 0.898794, 0.438371, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12887 at 157.214005 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12919, 1166, 0, 'Copper Vein', 0, 10); -- Copper Veins - Loch Modan

-- Missing Copper Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42733, 1731, 0, -11238.7, 832.159, 51.1331, -3.03687, 0, 0, 0.99863, -0.0523359, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 42731 at 156.648361 yards.
(30636, 1731, 0, -9854.38, 1380.9, 38.568, -2.60054, 0, 0, 0.96363, -0.267238, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 30588 at 33.453281 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42733, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins - Westfall
(30636, 1111, 0, 'Copper Vein', 0, 10); -- Copper Veins - Westfall

-- Missing Copper Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5055, 1731, 0, -9343.75, -2926.38, 109.87, 1.58825, 0, 0, 0.71325, 0.700909, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 5053 at 111.982674 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5055, 1128, 0, 'Copper Vein', 0, 10); -- Copper Veins - Redridge Mountains

-- Missing Copper Vein spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(112756, 1731, 0, 2557.3, 1691.01, 8.38937, -2.54818, 0, 0, 0.956305, -0.292372, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 112687 at 102.686089 yards.
(35464, 1731, 0, 1906.74, 1177.61, 50.2644, 2.26893, 0, 0, 0.906308, 0.422618, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 35456 at 80.530891 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(112756, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins - Tirisfal Glades
(35464, 1008, 0, 'Copper Vein', 0, 10); -- Copper Veins - Tirisfal Glades

-- Missing Copper Vein spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35596, 1731, 0, 1407.46, 2004.21, 15.0652, -0.977384, 0, 0, 0.469472, -0.882948, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35535 at 35.927677 yards.
(4848, 1731, 0, -709.825, 1209.56, 89.6936, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 4846 at 170.743576 yards.
(4677, 1731, 0, 647.199, 480.442, 38.1497, -2.61799, 0, 0, 0.965926, -0.258819, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4674 at 230.470688 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35596, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins - Silverpine Forest
(4848, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins - Silverpine Forest
(4677, 1044, 0, 'Copper Vein', 0, 10); -- Copper Veins - Silverpine Forest

-- Missing Copper Vein spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(363610, 1731, 1, 7950.07, -1144.46, 44.5124, -1.43117, 0, 0, 0.656059, -0.75471, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 363554 at 42.847477 yards.
(363611, 1731, 1, 8050.32, -1158.46, 48.5353, 1.8326, 0, 0, 0.793353, 0.608761, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 363554 at 126.777161 yards.
(363612, 1731, 1, 6359.27, -170.509, 44.6075, -0.680679, 0, 0, 0.333807, -0.942641, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 363584 at 23.840961 yards.
(363613, 1731, 1, 7549.97, 328.645, -1.1532, 0.471239, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 363519 at 284.775604 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(363610, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins - Darkshore
(363611, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins - Darkshore
(363612, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins - Darkshore
(363613, 1098, 0, 'Copper Vein', 0, 10); -- Copper Veins - Darkshore

-- Missing Copper Vein spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20731, 1731, 1, -1806.37, -1285.24, 114.504, 0.558505, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20722 at 70.717102 yards.
(20737, 1731, 1, -1645.43, -1202.12, 133.615, 1.72788, 0, 0, 0.760406, 0.649448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20670 at 53.128700 yards.
(20788, 1731, 1, -1604.09, -1398.94, 133.416, -0.0872668, 0, 0, 0.0436195, -0.999048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20671 at 100.919907 yards.
(20841, 1731, 1, -1528.56, -1098.67, 146.551, 2.53073, 0, 0, 0.953717, 0.300706, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20672 at 50.861889 yards.
(20856, 1731, 1, -1638.11, -1089.03, 103.83, 3.08923, 0, 0, 0.999657, 0.026177, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20721 at 25.425829 yards.
(20857, 1731, 1, -1326.67, -1121.95, 140.995, 1.51844, 0, 0, 0.688355, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20643 at 71.302650 yards.
(5096, 1731, 1, -576.656, -724.642, 59.258, 1.32645, 0, 0, 0.615662, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5094 at 63.891354 yards.
(5324, 1731, 1, -1731.5, 446.03, 104.992, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5323 at 112.698418 yards.
(112755, 1731, 1, -2357.45, 464.847, 58.7178, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 112730 at 37.838284 yards.
(20866, 1731, 1, -2462.92, 454.32, 60.1872, 1.98968, 0, 0, 0.838671, 0.544639, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20665 at 68.868164 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20731, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20737, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20788, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20841, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20856, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20857, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(5096, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(5324, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(112755, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins - Mulgore
(20866, 1028, 0, 'Copper Vein', 0, 10); -- Copper Veins - Mulgore

-- Missing Copper Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55587, 1731, 1, 3678.59, -189.18, 23.4133, 0.558505, 0, 0, 0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 55541 at 23.255501 yards.
(55588, 1731, 1, 3840.22, -237.818, 14.0315, -2.05949, 0, 0, 0.857167, -0.515038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55538 at 11.345845 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55587, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins - Ashenvale
(55588, 1075, 0, 'Copper Vein', 0, 10); -- Copper Veins - Ashenvale

-- Missing Copper Vein spawns in The Deadmines.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(50322, 1731, 36, -314.51, -592.77, 51.2438, 0.959931, 0, 0, 0.461749, 0.887011, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 50318 at 32.212517 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(50322, 4486, 0, 'Copper Vein', 0, 10); -- Deadmines - Copper Vein

-- Correct position of Kingsblood in Duskwood (position is off by 0.000602722 yards).
UPDATE `gameobject` SET `position_x`=-10582.2, `position_y`=72.5619, `position_z`=40.2747, `orientation`=-0.366519, `rotation0`=0, `rotation1`=0, `rotation2`=0.182236, `rotation3`=-0.983255 WHERE `guid`=43362;

-- Correct position of Kingsblood in Scarlet Monastery (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=1775.33, `position_y`=1288.49, `position_z`=17.5498, `orientation`=-2.54818, `rotation0`=0, `rotation1`=0, `rotation2`=0.956305, `rotation3`=-0.292372 WHERE `guid`=17730;

-- Missing Kingsblood spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58823, 1624, 0, -10257.9, -801.824, 44.3731, -2.96706, 0, 0, 0.996195, -0.0871558, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58328 at 84.190193 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58823, 1117, 0, 'Kingsblood', 0, 10); -- Kingsblood in Duskwood

-- Missing Kingsblood spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43647, 1624, 0, -2985.19, -1553.93, 9.27713, 2.84489, 0, 0, 0.989016, 0.147809, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 43384 at 135.780899 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(43647, 1155, 0, 'Kingsblood', 0, 10); -- Kingsblood in Wetlands

-- Missing Kingsblood spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43649, 1624, 0, -12870.9, -107.659, 5.75144, 0.907571, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 43439 at 65.642662 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(43649, 1170, 0, 'Kingsblood', 0, 10); -- Kingsblood in Stranglethorn

-- Missing Kingsblood spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58821, 1624, 1, 2750.88, -1204.7, 167.231, -0.575959, 0, 0, 0.284015, -0.95882, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 58391 at 173.898743 yards.
(58822, 1624, 1, 3463.65, -57.8824, 4.57672, 2.0944, 0, 0, 0.866025, 0.5, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58384 at 96.282013 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58821, 1078, 0, 'Kingsblood', 0, 10), -- Kingsblood in Ashenvale
(58822, 1078, 0, 'Kingsblood', 0, 10); -- Kingsblood in Ashenvale

-- Missing Kingsblood spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43650, 1624, 1, -6175.99, -4247.3, -58.75, 0.314159, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 43525 at 209.899338 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(43650, 1136, 0, 'Kingsblood', 0, 10); -- Kingsblood in Thousand Needles

-- Missing Kingsblood spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58824, 1624, 43, -51.4081, 367.112, -59.5331, 2.32129, 0, 0, 0.91706, 0.398749, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 58406 at 75.640228 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58824, 1053, 0, 'Kingsblood', 0, 10); -- Herbs in Wailing Caverns

-- Correct position of Wild Steelbloom in Duskwood (position is off by 1.06086 yards).
UPDATE `gameobject` SET `position_x`=-11117.8, `position_y`=27.1309, `position_z`=64.7471, `orientation`=-2.56563, `rotation0`=0, `rotation1`=0, `rotation2`=0.95882, `rotation3`=-0.284015 WHERE `guid`=4136;

-- Correct position of Wild Steelbloom in Stranglethorn Vale (position is off by 0.332116 yards).
UPDATE `gameobject` SET `position_x`=-11763.3, `position_y`=748.962, `position_z`=59.6303, `orientation`=0.785398, `rotation0`=0, `rotation1`=0, `rotation2`=0.382683, `rotation3`=0.92388 WHERE `guid`=4130;

-- Missing Wild Steelbloom spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56192, 1623, 0, -11116.7, -1294.3, 69.709, -0.366519, 0, 0, 0.182236, -0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 56135 at 69.992027 yards.
(16990, 1623, 0, -10423.6, -133.106, 79.1744, -1.50098, 0, 0, 0.681998, -0.731354, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16987 at 109.458412 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56192, 1114, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Duskwood
(16990, 1114, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Duskwood

-- Missing Wild Steelbloom spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14654, 1623, 0, -3086.79, -3142.49, 100.015, -0.139626, 0, 0, 0.0697565, -0.997564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14646 at 112.312706 yards.
(14690, 1623, 0, -3322.76, -3738.16, 86.4509, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14661 at 169.613647 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14654, 1152, 0, 'Wild Steelbloom', 0, 10), -- Wild Steelbloom in Wetlands
(14690, 1152, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Wetlands

-- Missing Wild Steelbloom spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3700, 1623, 1, -3016.82, -1667.58, 131.386, -1.76278, 0, 0, 0.771625, -0.636078, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 3699 at 334.826447 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(3700, 1168, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Barrens

-- Missing Wild Steelbloom spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4226, 1623, 0, -13391.8, 294.645, 52.2135, -0.10472, 0, 0, 0.052336, -0.99863, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 4225 at 158.762985 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4226, 1169, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Stranglethorn

-- Missing Wild Steelbloom spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58825, 1623, 0, -1397.61, 520.969, 79.0634, -2.1293, 0, 0, 0.87462, -0.48481, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58619 at 72.276054 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58825, 1209, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Hillsbrad Foothills

-- Missing Wild Steelbloom spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(47972, 1623, 1, 2705.8, -790.684, 163.963, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 47943 at 414.680481 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47972, 1081, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Ashenvale

-- Missing Wild Steelbloom spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(18629, 1623, 1, 166.725, 1947.02, 162.469, 2.63545, 0, 0, 0.968148, 0.25038, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 18620 at 204.740173 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(18629, 1142, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Desolace

-- Missing Wild Steelbloom spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56455, 1623, 1, 1297.67, -576.898, 43.6993, 0.296706, 0, 0, 0.147809, 0.989016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 56271 at 200.976425 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56455, 1085, 0, 'Wild Steelbloom', 0, 10); -- Wild Steelbloom in Stonetalon

-- Correct position of Bruiseweed in Darkshore (position is off by 0.957584 yards).
UPDATE `gameobject` SET `position_x`=5684.28, `position_y`=95.6294, `position_z`=32.2958, `orientation`=-0.139626, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697565, `rotation3`=-0.997564 WHERE `guid`=3841;

-- Correct position of Bruiseweed in Duskwood (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-10353.9, `position_y`=200.277, `position_z`=34.39, `orientation`=-0.959931, `rotation0`=0, `rotation1`=0, `rotation2`=0.461749, `rotation3`=-0.887011 WHERE `guid`=24181;

-- Missing Bruiseweed spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(24368, 1622, 0, -11022.4, -1357.99, 51.8596, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 24172 at 24.337526 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(24368, 1115, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Duskwood

-- Missing Bruiseweed spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20879, 1622, 0, -469.625, 363.523, 107.87, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20878 at 169.473541 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20879, 1048, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Hillsbrad Foothills

-- Missing Bruiseweed spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68948, 1622, 1, 1695.12, -3079.58, 112.603, 0.488692, 0, 0, 0.241922, 0.970296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 68467 at 112.043610 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68948, 1072, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Ashenvale

-- Missing Bruiseweed spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(24369, 1622, 1, 1658.9, 782.87, 141.853, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 24351 at 117.128632 yards.
(44742, 1622, 1, 1568.89, -173.073, 55.5419, -2.80998, 0, 0, 0.986286, -0.165048, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44741 at 211.026947 yards.
(24370, 1622, 1, 182.781, -856.857, 7.52579, -0.785398, 0, 0, 0.382683, -0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 24340 at 66.122673 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(24369, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon
(44742, 1086, 0, 'Bruiseweed', 0, 10), -- Bruiseweed in Stonetalon
(24370, 1086, 0, 'Bruiseweed', 0, 10); -- Bruiseweed in Stonetalon

-- Missing Bruiseweed spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68950, 1622, 43, -163.906, -335.976, -68.879, 3.14159, 0, 0, 1, -4.37114e-08, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 68489 at 206.728577 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68950, 1053, 0, 'Bruiseweed', 0, 10); -- Herbs in Wailing Caverns

-- Missing Bruiseweed spawns in Blackfathom Deeps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(68949, 1622, 48, -775.848, -3.82842, -30.7039, 1.55334, 0, 0, 0.700909, 0.71325, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 68493 at 295.093842 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(68949, 1014, 0, 'Bruiseweed', 0, 10); -- Herbs in Blackfathom Deeps

-- Correct position of Briarthorn in Darkshore (position is off by 0.650148 yards).
UPDATE `gameobject` SET `position_x`=5323.75, `position_y`=346.489, `position_z`=30.7388, `orientation`=-0.890118, `rotation0`=0, `rotation1`=0, `rotation2`=0.430511, `rotation3`=-0.902585 WHERE `guid`=2897;

-- Missing Briarthorn spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2708, 1621, 0, -10707.2, -1411.07, 41.8335, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2702 at 212.670715 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2708, 1113, 0, 'Briarthorn', 0, 10); -- Briarthorn in Duskwood

-- Missing Briarthorn spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34102, 1621, 0, -2713.48, -1961.67, 17.293, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34101 at 114.561035 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34102, 1151, 0, 'Briarthorn', 0, 10); -- Briarthorn in Wetlands

-- Missing Briarthorn spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2754, 1621, 0, -9494.92, -2839.76, 71.3364, -1.309, 0, 0, 0.608761, -0.793353, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2752 at 39.101910 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2754, 1127, 0, 'Briarthorn', 0, 10); -- Briarthorn in Redridge

-- Missing Briarthorn spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(39400, 1621, 1, 7792.71, -1043.28, 30.0568, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 38671 at 52.383793 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(39400, 1100, 0, 'Briarthorn', 0, 10); -- Briarthorn in Darkshore

-- Missing Briarthorn spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(39401, 1621, 0, -1185.91, -1002.09, 54.4282, -0.575959, 0, 0, 0.284015, -0.95882, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 38687 at 136.172394 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(39401, 1050, 0, 'Briarthorn', 0, 10); -- Briarthorn in Hillsbrad Foothills

-- Missing Briarthorn spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(32597, 1621, 1, 4131.32, 203.466, 12.4553, -0.401426, 0, 0, 0.199368, -0.979925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 32590 at 469.529053 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32597, 1073, 0, 'Briarthorn', 0, 10); -- Briarthorn in Ashenvale

-- Missing Briarthorn spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(44649, 1621, 1, 804.19, 234.212, 24.7458, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 44648 at 172.531891 yards.
(44643, 1621, 1, 163.633, -713.723, -0.409156, -0.296706, 0, 0, 0.147809, -0.989016, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 44642 at 244.592300 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(44649, 1087, 0, 'Briarthorn', 0, 10), -- Briarthorn in Stonetalon
(44643, 1087, 0, 'Briarthorn', 0, 10); -- Briarthorn in Stonetalon

-- Missing Briarthorn spawns in Razorfen Kraul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35721, 1621, 47, 2140.59, 1593.37, 81.6632, 0.907571, 0, 0, 0.438371, 0.898794, 604800, 604800, 1, 100, 0, 10), -- Closest existing guid is 35706 at 56.814827 yards.
(68951, 1621, 47, 2108.2, 1452.03, 73.8359, 0.383972, 0, 0, 0.190809, 0.981627, 604800, 604800, 1, 100, 0, 10); -- Closest existing guid is 68422 at 47.404644 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35721, 2002, 0, 'Briarthorn', 0, 10), -- Herbs in Razorfen Kraul
(68951, 2002, 0, 'Briarthorn', 0, 10); -- Herbs in Razorfen Kraul

-- Correct position of Mageroyal in Durotar (position is off by 0.295488 yards).
UPDATE `gameobject` SET `position_x`=962.671, `position_y`=-4245.07, `position_z`=-8.28712, `orientation`=-2.98451, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=-0.0784591 WHERE `guid`=2140;

-- Missing Mageroyal spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14722, 1620, 0, -3734.4, -3136.27, 13.2518, -3.00197, 0, 0, 0.997564, -0.0697565, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14720 at 182.945694 yards.
(40595, 1620, 0, -2972.27, -1624.61, 9.31269, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40347 at 152.247818 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14722, 1154, 0, 'Mageroyal', 0, 10), -- Mageroyal in Wetlands
(40595, 1154, 0, 'Mageroyal', 0, 10); -- Mageroyal in Wetlands

-- Missing Mageroyal spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40596, 1620, 0, -9286.99, -3199, 105.201, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40395 at 92.427078 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40596, 1306, 0, 'Mageroyal', 0, 10); -- Mageroyal in Redridge

-- Missing Mageroyal spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(58826, 1620, 1, 9373.69, 599.034, 1320.14, -0.20944, 0, 0, 0.104528, -0.994522, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 58565 at 58.321915 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(58826, 1004, 0, 'Mageroyal', 0, 10); -- Mageroyal in Teldrassil

-- Missing Mageroyal spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2308, 1620, 1, 5261.54, 52.3532, 48.4932, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2305 at 174.065781 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2308, 1097, 0, 'Mageroyal', 0, 10); -- Mageroyal in Darkshore

-- Missing Mageroyal spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40521, 1620, 1, 2171.12, -127.75, 101.352, -2.54818, 0, 0, 0.956305, -0.292372, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 40435 at 455.489746 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40521, 1077, 0, 'Mageroyal', 0, 10); -- Mageroyal in Ashenvale

-- Missing Incendicite Mineral Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(24840, 1610, 0, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, 0.522499, -0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 24795 at 26.703848 yards.
(118821, 1610, 0, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515038, 0.857167, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 118819 at 40.969757 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(24840, 3655, 0, 'Incendicite Mineral Vein', 0, 10), -- Incendicite Mineral Vein (1667) - Wetlands
(118821, 3655, 0, 'Incendicite Mineral Vein', 0, 10); -- Incendicite Mineral Vein (1667) - Wetlands

-- Correct position of Small Thorium Vein in Burning Steppes (position is off by 0.25 yards).
UPDATE `gameobject` SET `position_x`=-7890.92, `position_y`=-2537.66, `position_z`=129.832, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=31161;

-- Missing Small Thorium Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27672, 324, 0, -10805, -2666.73, 12.1114, 0.925024, 0, 0, 0.446198, 0.894934, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 27658 at 91.105774 yards.

-- Missing Small Thorium Vein spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(261650, 324, 0, 2282.94, -2285.57, 63.0433, 1.13446, 0, 0, 0.5373, 0.843391, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 261642 at 94.035774 yards.

-- Missing Small Thorium Vein spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16701, 324, 0, -674.432, -3671.85, 231.279, -2.80998, 0, 0, 0.986286, -0.165048, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 16699 at 104.594063 yards.

-- Missing Small Thorium Vein spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29701, 324, 0, -6737.71, -610.845, 241.217, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 29693 at 126.863914 yards.

-- Missing Small Thorium Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21155, 324, 1, -5561.75, 988.424, 16.2939, 1.29154, 0, 0, 0.601815, 0.798636, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 21144 at 77.410103 yards.
(21156, 324, 1, -5313.68, 2163.53, 17.5947, -1.36136, 0, 0, 0.629321, -0.777146, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 21143 at 296.426453 yards.

-- Missing Small Thorium Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(100341, 324, 1, 7320.12, -4313.58, 699.424, -1.79769, 0, 0, 0.782608, -0.622515, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 100311 at 243.589661 yards.

-- Missing Small Thorium Vein spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23541, 324, 1, -8068.27, 684.527, 8.24523, -0.645772, 0, 0, 0.317305, -0.948324, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 23483 at 208.762939 yards.
(23560, 324, 1, -8078.43, 1377.69, 4.93745, 1.67552, 0, 0, 0.743145, 0.669131, 1800, 3600, 1, 100, 0, 10), -- Closest existing guid is 23495 at 178.247742 yards.
(23561, 324, 1, -7567.15, 1733.04, 17.2376, -1.67552, 0, 0, 0.743145, -0.669131, 1800, 3600, 1, 100, 0, 10); -- Closest existing guid is 23499 at 198.755920 yards.


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
