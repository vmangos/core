DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241226150330');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241226150330');
-- Add your query below.


-- Earth Elemental Rift
-- Event 70: Elemental Invasion: Earth (Azshara)
DELETE FROM `gameobject` WHERE `id`=179664;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
(399355, 179664, 1, 4531.51, -7096.53, 102.136, 4.46804, 0, 0, -0.788011, 0.615662, 25, 25, 100, 1, 2, 10),
(399356, 179664, 1, 4609.79, -7151.82, 115.72, 5.75959, 0, 0, -0.258819, 0.965926, 25, 25, 100, 1, 2, 10),
(399357, 179664, 1, 4688.51, -7310.85, 87.5106, 0.401425, 0, 0, 0.199368, 0.979925, 25, 25, 100, 1, 2, 10),
(399358, 179664, 1, 4714.12, -7420.39, 73.3744, 0.314158, 0, 0, 0.156434, 0.987688, 25, 25, 100, 1, 2, 10),
(399359, 179664, 1, 4606.7, -7423.01, 89.4339, 2.42601, 0, 0, 0.936672, 0.350207, 25, 25, 100, 1, 2, 10),
(399360, 179664, 1, 4515.68, -7416.42, 82.5434, 4.97419, 0, 0, -0.608761, 0.793354, 25, 25, 100, 1, 2, 10),
(399361, 179664, 1, 4553.76, -7269.88, 112.396, 3.29869, 0, 0, -0.996917, 0.0784664, 25, 25, 100, 1, 2, 10),
(399362, 179664, 1, 4751.65, -7079.59, 92.7444, 2.30383, 0, 0, 0.913545, 0.406738, 25, 25, 100, 1, 2, 10);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (399363, 399364);

-- Fire Elemental Rift
-- Event 68: Elemental Invasion: Fire (Un'goro Crater)
DELETE FROM `gameobject` WHERE `id`=179666;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
(399354, 179666, 1, -7347.25, -1334.56, -263.032, 3.3685, 0, 0, -0.993571, 0.113208, 25, 25, 100, 1, 2, 10),
(399353, 179666, 1, -7340.23, -1488.26, -257.98, 0.663223, 0, 0, 0.325567, 0.945519, 25, 25, 100, 1, 2, 10),
(399352, 179666, 1, -7331.47, -1196.34, -265.41, 2.58308, 0, 0, 0.961261, 0.27564, 25, 25, 100, 1, 2, 10),
(399351, 179666, 1, -7185.73, -1108.07, -271.805, 0.471238, 0, 0, 0.233445, 0.97237, 25, 25, 100, 1, 2, 10),
(399350, 179666, 1, -7105.06, -1550.73, -272.101, 0, 0, 0, 0, 1, 25, 25, 100, 1, 2, 10),
(399349, 179666, 1, -7076.77, -1235.5, -261.146, 6.17847, 0, 0, -0.0523357, 0.99863, 25, 25, 100, 1, 2, 10),
(399348, 179666, 1, -7007.57, -1393.05, -262.891, 2.67035, 0, 0, 0.972369, 0.233448, 25, 25, 100, 1, 2, 10);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (399347, 399346, 399345, 399344, 399343, 399342, 399341, 399340);

-- Warlock Mount Ritual Circle
UPDATE `gameobject` SET `position_x`=-38.5911, `position_y`=812.632, `position_z`=-29.5358, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199368, `rotation3`=0.979925 WHERE `guid`=99784;

-- Warlock Mount Quest Symbol 1
UPDATE `gameobject` SET `position_x`=-57.1792, `position_y`=812.96, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99779;
UPDATE `gameobject` SET `position_x`=-28.8647, `position_y`=828.021, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99776;
UPDATE `gameobject` SET `position_x`=-25.8848, `position_y`=798.921, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99782;

-- Warlock Mount Quest Symbol 2
UPDATE `gameobject` SET `position_x`=-50.8857, `position_y`=826.376, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99781;
UPDATE `gameobject` SET `position_x`=-21.8534, `position_y`=820.043, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99778;
UPDATE `gameobject` SET `position_x`=-37.3899, `position_y`=793.225, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99775;

-- Warlock Mount Quest Symbol 3
UPDATE `gameobject` SET `position_x`=-38.9241, `position_y`=831.486, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99777;
UPDATE `gameobject` SET `position_x`=-20.693, `position_y`=807.962, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99774;
UPDATE `gameobject` SET `position_x`=-53.5593, `position_y`=801.216, `position_z`=-29.5358, `orientation`=4.27606, `rotation0`=0, `rotation1`=0, `rotation2`=-0.843391, `rotation3`=0.5373 WHERE `guid`=99780;

-- Wheel of the Black March
UPDATE `gameobject` SET `position_x`=-46.7888, `position_y`=822.351, `position_z`=-29.5358, `orientation`=5.42797, `rotation0`=0, `rotation1`=0, `rotation2`=-0.414693, `rotation3`=0.909961 WHERE `guid`=99786;

-- Doomsday Candle
UPDATE `gameobject` SET `position_x`=-43.4643, `position_y`=800.206, `position_z`=-29.5358, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=99785;

-- Bell of Dethmoora
UPDATE `gameobject` SET `position_x`=-26.4932, `position_y`=814.841, `position_z`=-29.5358, `orientation`=0.59341, `rotation0`=0, `rotation1`=0, `rotation2`=0.292371, `rotation3`=0.956305 WHERE `guid`=99787;

-- Cauldron
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2832, 179700, 0, -11548.4, -1247.55, 78.2675, 2.522, 0, 0, 0.952395, 0.304865, 180, 180, 100, 1, 0, 10); -- Stranglethorn Vale

-- Cache of the Firelord
UPDATE `gameobject` SET `position_x`=756.897, `position_y`=-1180.7, `position_z`=-118.596, `orientation`=2.91469, `rotation0`=0, `rotation1`=0, `rotation2`=0.993571, `rotation3`=0.113208 WHERE `guid`=362148;

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2839, 179945, 30, -1070.53, -617.908, 51.3249, 5.83813, 0, 0, -0.220697, 0.975342, 180, 180, 100, 1, 3, 10); -- Alterac Valley

-- Spider Egg
UPDATE `gameobject` SET `position_x`=-12284.4, `position_y`=-1636.02, `position_z`=134.073, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=28696;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=977.05, `position_y`=1046.52, `position_z`=-44.8254, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=90025;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=977.01, `position_y`=1046.62, `position_z`=-44.8172, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=90024;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=806.187, `position_y`=874.256, `position_z`=-55.9836, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=90030;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=806.201, `position_y`=874.248, `position_z`=-55.9825, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=90033;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=806.248, `position_y`=874.217, `position_z`=-55.9937, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=90032;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=1146.93, `position_y`=848.185, `position_z`=-110.914, `orientation`=5.5676, `rotation0`=0, `rotation1`=0, `rotation2`=-0.350207, `rotation3`=0.936672 WHERE `guid`=90046;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=1146.93, `position_y`=848.185, `position_z`=-110.916, `orientation`=2.42601, `rotation0`=0, `rotation1`=0, `rotation2`=0.936672, `rotation3`=0.350207 WHERE `guid`=90047;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=1146.93, `position_y`=848.189, `position_z`=-110.918, `orientation`=5.55015, `rotation0`=0, `rotation1`=0, `rotation2`=-0.358368, `rotation3`=0.93358 WHERE `guid`=90048;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=856.157, `position_y`=1148.91, `position_z`=11.2085, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=90039;

-- Alliance Banner
UPDATE `gameobject` SET `position_x`=856.15, `position_y`=1148.92, `position_z`=11.1892, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=90038;

-- Horde Banner
UPDATE `gameobject` SET `position_x`=856.166, `position_y`=1148.91, `position_z`=11.2066, `orientation`=3.97935, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=90040;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=1166.77, `position_y`=1200.15, `position_z`=-56.701, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=90017;

-- Blacksmith Banner
UPDATE `gameobject` SET `position_x`=977.08, `position_y`=1046.54, `position_z`=-44.8303, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=90029;

-- Sungrass
-- Pool 1035: Herbs in Zul'Gurub
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2955, 180164, 309, -12156, -1466.72, 131.101, 4.88692, 0, 0, -0.642787, 0.766045, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2956, 180164, 309, -12352.3, -1672.73, 131.178, 2.75761, 0, 0, 0.981627, 0.190812, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2958, 180164, 309, -11615, -1846.41, 41.4148, 3.07177, 0, 0, 0.999391, 0.0349061, 604800, 604800, 100, 1, 5, 10); -- Zul'Gurub
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2955, 1035, 0, 'Sungrass', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2956, 1035, 0, 'Sungrass', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2958, 1035, 0, 'Sungrass', 0, 5, 10);

-- Purple Lotus
-- Pool 1035: Herbs in Zul'Gurub
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2959, 180165, 309, -11657.7, -1565.71, 41.4168, 4.15388, 0, 0, -0.874619, 0.48481, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2961, 180165, 309, -11995.2, -1621.96, 33.2566, 4.32842, 0, 0, -0.829037, 0.559194, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2962, 180165, 309, -11972.8, -1553, 40.8403, 4.67748, 0, 0, -0.719339, 0.694659, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2963, 180165, 309, -11944.6, -1760.67, 53.5194, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2965, 180165, 309, -11688.1, -1941.78, 56.86, 4.36332, 0, 0, -0.819152, 0.573577, 604800, 604800, 100, 1, 5, 10); -- Zul'Gurub
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2959, 1035, 0, 'Purple Lotus', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2961, 1035, 0, 'Purple Lotus', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2962, 1035, 0, 'Purple Lotus', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2963, 1035, 0, 'Purple Lotus', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2965, 1035, 0, 'Purple Lotus', 0, 5, 10);

-- Mountain Silversage
-- Pool 1035: Herbs in Zul'Gurub
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2967, 180166, 309, -12062.2, -1433.83, 130.23, 3.49067, 0, 0, -0.984807, 0.173652, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2968, 180166, 309, -12255.3, -1963.61, 136.048, 0.610863, 0, 0, 0.300705, 0.953717, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2971, 180166, 309, -12346.8, -1965, 133.195, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2973, 180166, 309, -11561.3, -1805.51, 62.4128, 3.28124, 0, 0, -0.997563, 0.0697661, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2974, 180166, 309, -11657, -1457.02, 61.0002, 4.53786, 0, 0, -0.766044, 0.642789, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2975, 180166, 309, -11526.8, -1493.28, 80.0608, 2.54818, 0, 0, 0.956305, 0.292372, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2976, 180166, 309, -11804.4, -1902, 50.6509, 5.93412, 0, 0, -0.173648, 0.984808, 604800, 604800, 100, 1, 5, 10); -- Zul'Gurub
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2967, 1035, 0, 'Mountain Silversage', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2968, 1035, 0, 'Mountain Silversage', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2971, 1035, 0, 'Mountain Silversage', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2974, 1035, 0, 'Mountain Silversage', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2975, 1035, 0, 'Mountain Silversage', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2976, 1035, 0, 'Mountain Silversage', 0, 5, 10);

-- Golden Sansam
-- Pool 1035: Herbs in Zul'Gurub
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2977, 180167, 309, -11656.2, -1572.16, 39.8062, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2979, 180167, 309, -11985.6, -1717.95, 32.2836, 5.53269, 0, 0, -0.366501, 0.930418, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2980, 180167, 309, -11558.2, -1739.45, 38.6247, 5.75959, 0, 0, -0.258819, 0.965926, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2981, 180167, 309, -12002.8, -1489.2, 80.3559, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2982, 180167, 309, -12288.3, -1625.12, 130.261, 1.309, 0, 0, 0.608761, 0.793354, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2983, 180167, 309, -12197.3, -1983.1, 132.6, 4.83456, 0, 0, -0.66262, 0.748956, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2984, 180167, 309, -11583.7, -1663.03, 50.6409, 5.21854, 0, 0, -0.507538, 0.861629, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2985, 180167, 309, -11786.7, -1896.81, 48.9827, 3.31614, 0, 0, -0.996194, 0.087165, 604800, 604800, 100, 1, 5, 10); -- Zul'Gurub
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2977, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2979, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2980, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2981, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2982, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2983, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2984, 1035, 0, 'Golden Sansam', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2985, 1035, 0, 'Golden Sansam', 0, 5, 10);

-- Dreamfoil
-- Pool 1035: Herbs in Zul'Gurub
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2986, 180168, 309, -12236.5, -1472.11, 130.657, 4.50295, 0, 0, -0.777145, 0.629321, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(2987, 180168, 309, -12159.4, -1956.99, 134.077, 6.16101, 0, 0, -0.0610485, 0.998135, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(3005, 180168, 309, -11650, -1890.45, 57.2409, 5.46288, 0, 0, -0.398748, 0.91706, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(3006, 180168, 309, -11543.5, -1548.46, 51.7261, 5.02655, 0, 0, -0.587785, 0.809017, 604800, 604800, 100, 1, 5, 10), -- Zul'Gurub
(3007, 180168, 309, -11595.5, -1227.25, 78.2645, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 100, 1, 5, 10); -- Zul'Gurub
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2986, 1035, 0, 'Dreamfoil', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2987, 1035, 0, 'Dreamfoil', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (3005, 1035, 0, 'Dreamfoil', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (3006, 1035, 0, 'Dreamfoil', 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (3007, 1035, 0, 'Dreamfoil', 0, 5, 10);

-- Jinxed Hoodoo Pile
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3053, 180228, 309, -11526.3, -1479.74, 78.0266, 5.13127, 0, 0, -0.544639, 0.838671, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3055, 180228, 309, -11974.8, -1474.54, 79.9835, 2.93214, 0, 0, 0.994521, 0.104536, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3056, 180228, 309, -12357.9, -1836.31, 130.865, 0.453785, 0, 0, 0.224951, 0.97437, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3057, 180228, 309, -11638.4, -1882.91, 57.3159, 3.85718, 0, 0, -0.936671, 0.35021, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3058, 180228, 309, -11742.3, -1930.5, 56.9127, 1.62316, 0, 0, 0.725374, 0.688355, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3060, 180228, 309, -11452.9, -1613.94, 49.0348, 2.53072, 0, 0, 0.953716, 0.300708, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3061, 180228, 309, -11594.7, -1216.66, 81.3685, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3063, 180228, 309, -11539.9, -1247.64, 78.5177, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3064, 180228, 309, -11781.9, -1621.91, 21.149, 3.15906, 0, 0, -0.999962, 0.00873464, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3065, 180228, 309, -11810.1, -1882.4, 46.0745, 3.83973, 0, 0, -0.939692, 0.34202, 7200, 7200, 100, 1, 5, 10); -- Zul'Gurub

-- Jinxed Hoodoo Pile
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3066, 180229, 309, -12376.2, -1661.07, 132.864, 1.43117, 0, 0, 0.656058, 0.75471, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3067, 180229, 309, -12382.4, -1919.37, 131.553, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3068, 180229, 309, -12358.3, -1939.73, 132.353, 0.104719, 0, 0, 0.0523357, 0.99863, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3069, 180229, 309, -12155.9, -1960.37, 133.111, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3070, 180229, 309, -11518.2, -1693.06, 52.485, 1.02974, 0, 0, 0.492423, 0.870356, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3071, 180229, 309, -11542.7, -1544.95, 51.7792, 5.49779, 0, 0, -0.382683, 0.92388, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3072, 180229, 309, -11556, -1725.95, 39.7283, 0.942477, 0, 0, 0.45399, 0.891007, 7200, 7200, 100, 1, 5, 10); -- Zul'Gurub

-- Jinxed Hoodoo Pile
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3073, 180244, 309, -11742.3, -1930.5, 56.9127, 1.62316, 0, 0, 0.725374, 0.688355, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3075, 180244, 309, -11526.3, -1479.74, 78.0266, 5.13127, 0, 0, -0.544639, 0.838671, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3076, 180244, 309, -11974.8, -1474.54, 79.9835, 2.93214, 0, 0, 0.994521, 0.104536, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3078, 180244, 309, -12376.2, -1661.07, 132.864, 1.43117, 0, 0, 0.656058, 0.75471, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3081, 180244, 309, -12357.9, -1836.31, 130.865, 0.453785, 0, 0, 0.224951, 0.97437, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3082, 180244, 309, -12382.4, -1919.37, 131.553, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3083, 180244, 309, -12358.3, -1939.73, 132.353, 0.104719, 0, 0, 0.0523357, 0.99863, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3084, 180244, 309, -12155.9, -1960.37, 133.111, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3085, 180244, 309, -11638.4, -1882.91, 57.3159, 3.85718, 0, 0, -0.936671, 0.35021, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3086, 180244, 309, -11452.9, -1613.94, 49.0348, 2.53072, 0, 0, 0.953716, 0.300708, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3087, 180244, 309, -11518.2, -1693.06, 52.485, 1.02974, 0, 0, 0.492423, 0.870356, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3088, 180244, 309, -11542.7, -1544.95, 51.7792, 5.49779, 0, 0, -0.382683, 0.92388, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3089, 180244, 309, -11556, -1725.95, 39.7283, 0.942477, 0, 0, 0.45399, 0.891007, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3090, 180244, 309, -11539.9, -1247.64, 78.5177, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3092, 180244, 309, -11594.7, -1216.66, 81.3685, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3093, 180244, 309, -11781.9, -1621.91, 21.149, 3.15906, 0, 0, -0.999962, 0.00873464, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3094, 180244, 309, -11810.1, -1882.4, 46.0745, 3.83973, 0, 0, -0.939692, 0.34202, 7200, 7200, 100, 1, 5, 10); -- Zul'Gurub

-- Jinxed Hoodoo Pile
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3095, 180247, 309, -11526.3, -1479.74, 78.0266, 5.13127, 0, 0, -0.544639, 0.838671, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3096, 180247, 309, -11542.7, -1544.95, 51.7792, 5.49779, 0, 0, -0.382683, 0.92388, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3097, 180247, 309, -11556, -1725.95, 39.7283, 0.942477, 0, 0, 0.45399, 0.891007, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3099, 180247, 309, -11974.8, -1474.54, 79.9835, 2.93214, 0, 0, 0.994521, 0.104536, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3100, 180247, 309, -12376.2, -1661.07, 132.864, 1.43117, 0, 0, 0.656058, 0.75471, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3101, 180247, 309, -12357.9, -1836.31, 130.865, 0.453785, 0, 0, 0.224951, 0.97437, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3102, 180247, 309, -12382.4, -1919.37, 131.553, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3103, 180247, 309, -12358.3, -1939.73, 132.353, 0.104719, 0, 0, 0.0523357, 0.99863, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3104, 180247, 309, -12155.9, -1960.37, 133.111, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3105, 180247, 309, -11638.4, -1882.91, 57.3159, 3.85718, 0, 0, -0.936671, 0.35021, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3106, 180247, 309, -11742.3, -1930.5, 56.9127, 1.62316, 0, 0, 0.725374, 0.688355, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3107, 180247, 309, -11518.2, -1693.06, 52.485, 1.02974, 0, 0, 0.492423, 0.870356, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3108, 180247, 309, -11452.9, -1613.94, 49.0348, 2.53072, 0, 0, 0.953716, 0.300708, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3109, 180247, 309, -11594.7, -1216.66, 81.3685, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3111, 180247, 309, -11539.9, -1247.64, 78.5177, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3112, 180247, 309, -11781.9, -1621.91, 21.149, 3.15906, 0, 0, -0.999962, 0.00873464, 7200, 7200, 100, 1, 5, 10), -- Zul'Gurub
(3113, 180247, 309, -11810.1, -1882.4, 46.0745, 3.83973, 0, 0, -0.939692, 0.34202, 7200, 7200, 100, 1, 5, 10); -- Zul'Gurub

-- HORDE DOOR
UPDATE `gameobject` SET `position_x`=708.09, `position_y`=708.448, `position_z`=-17.3899, `orientation`=3.89209, `rotation0`=-0.0502906, `rotation1`=-0.0151262, `rotation2`=-0.929216, `rotation3`=0.365785 WHERE `guid`=90055;

-- Soapbox
-- Event 40: Stranglethorn Fishing Extravaganza: The Crew
-- These are all custom, added during classic to block people from climbing on top of buildings.
/*
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3148, 180403, 0, -11061.4, 1559.99, 48.4474, 0, 0, 0, 0, 1, 0, 0, 100, 1, 5, 10), -- Westfall
(3152, 180403, 30, 669.139, 7.92188, 68.7291, 0, 0, 0, 0, 1, 180, 180, 100, 1, 5, 10), -- Alterac Valley
(3153, 180403, 489, 916.391, 1438.56, 359.832, 0, -1, 0, 0, 0, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3154, 180403, 489, 961.181, 1443.28, 370.236, 2.08869, 0, 0, 0.864594, 0.50247, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3155, 180403, 489, 919.524, 1442.24, 363.677, 1.0472, 0.224144, 0.129409, 0.482963, 0.836517, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3157, 180403, 489, 918.427, 1430.84, 361.458, 0.872664, -0.906308, -0.422618, 0, 0, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3158, 180403, 489, 919.5, 1442, 364.177, 0.523597, 0.369644, 0.0990458, 0.239117, 0.892399, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3159, 180403, 489, 919.524, 1442.24, 365.177, 1.0472, 0.296198, 0.17101, 0.469846, 0.813798, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3160, 180403, 489, 919.524, 1442.24, 362.677, 1.0472, 0.224144, 0.129409, 0.482963, 0.836517, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3161, 180403, 489, 959.444, 1442.2, 370.236, 2.47112, 0, 0, 0.944332, 0.328994, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3162, 180403, 489, 1001.41, 1299.16, 346.076, 0.715774, 0, 0, 0.350296, 0.936639, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3163, 180403, 489, 919.5, 1442, 362.677, 0.523597, 0.369644, 0.0990458, 0.239117, 0.892399, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3164, 180403, 489, 975.889, 1480.86, 345.164, 1.55936, 0.240457, -0.243224, 0.660651, 0.668253, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3165, 180403, 489, 984.967, 1479.36, 346.542, 4.71239, -0.696364, 0.696363, 0.122787, 0.122794, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3167, 180403, 489, 983.738, 1479.41, 346.683, 4.71239, -0.696364, 0.696363, 0.122787, 0.122794, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3168, 180403, 489, 976.316, 1480.87, 345.299, 1.74533, 0.282907, -0.128879, 0.744656, 0.590628, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3169, 180403, 489, 980.755, 1479.3, 346.934, 5.41052, -0.862561, 0.427108, 0.198098, 0.185268, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3170, 180403, 489, 982.016, 1479.59, 346.934, 4.71239, -0.690345, 0.690345, 0.153046, 0.15305, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3171, 180403, 489, 974.115, 1477.57, 348.466, 4.71239, -0.664463, 0.664463, 0.241844, 0.241845, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3172, 180403, 489, 1471.6, 1453.61, 376.997, 1.58093, 0, 0, 0.71068, 0.703515, 180, 180, 100, 1, 5, 10), -- Warsong Gulch
(3174, 180403, 529, 988.517, 986.033, -34.673, 0.334983, 0.0637965, -0.377328, 0.154019, 0.910951, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3175, 180403, 529, 988.061, 986.906, -34.673, 0.030376, 0.00581217, -0.382639, 0.0140314, 0.923773, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3176, 180403, 529, 989.071, 984.741, -34.673, 0.526701, 0.0996189, -0.36949, 0.240501, 0.892027, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3177, 180403, 529, 988.842, 983.075, -35.5109, 0.526701, 0.0996189, -0.36949, 0.240501, 0.892027, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3178, 180403, 529, 991.399, 982.604, -34.9582, 0.526701, 0.0996189, -0.36949, 0.240501, 0.892027, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3179, 180403, 529, 985.705, 990.163, -37.079, 4.57076, 0, 0, -0.755367, 0.655302, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3181, 180403, 529, 1189.63, 1174.47, -56.8299, 5.62235, 0, 0, -0.324437, 0.945907, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3183, 180403, 529, 1190.2, 1175.19, -56.8604, 5.58755, 0, 0, -0.340847, 0.940119, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3184, 180403, 529, 823.677, 842.67, -59.5554, 3.18587, 0, 0, -0.999755, 0.0221389, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3185, 180403, 529, 644.281, 696.366, -12.9313, 4.41691, 0, 0, -0.803493, 0.595315, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3186, 180403, 529, 987.955, 988.846, -34.673, 0.030376, 0.00581217, -0.382639, 0.0140314, 0.923773, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3188, 180403, 529, 1184.93, 1173.48, -51.1228, 5.54172, 0.153114, 0.393906, -0.328355, 0.844735, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3189, 180403, 529, 1196.89, 1185.76, -51.2965, 5.54172, 0.153114, 0.393906, -0.328355, 0.844735, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3190, 180403, 529, 1188.05, 1197.31, -56.6357, 0, 0, 0, 0, 1, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3191, 180403, 529, 1196.79, 1187.79, -51.2965, 5.54172, 0, 0, -0.362299, 0.932062, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3193, 180403, 529, 1189.02, 1197.14, -56.6357, 0, 0, 0, 0, 1, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3194, 180403, 529, 1196.64, 1186.86, -50.3518, 5.54172, 0.138646, 0.356684, -0.334721, 0.861113, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3195, 180403, 529, 809.802, 849.658, -51.7905, 4.68077, 0.117182, -0.35545, -0.623305, 0.686596, 180, 180, 100, 1, 5, 10), -- Arathi Basin
(3196, 180403, 531, -8342.56, 2021.07, 123.736, 0, 0, 0, 0, 1, 180, 180, 100, 1, 7, 10); -- Ahn'Qiraj
*/

-- G_Pumpkin_02
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-14476.1, `position_y`=461.171, `position_z`=36.5471, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid`=330613;

-- G_Pumpkin_03
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-10464.6, `position_y`=-1183.71, `position_z`=27.5535, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=330833;
UPDATE `gameobject` SET `position_x`=-10491.6, `position_y`=1002.19, `position_z`=67.1605, `orientation`=0.785397, `rotation0`=0, `rotation1`=0, `rotation2`=0.382683, `rotation3`=0.92388 WHERE `guid`=330991;

-- G_HangingSkeleton_01
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-10537.4, `position_y`=-1217.96, `position_z`=33.7167, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=331055;

-- CandleBlack01
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-14469.6, `position_y`=483.56, `position_z`=16.4822, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=331291;

-- Contested Banner
UPDATE `gameobject` SET `position_x`=-202.652, `position_y`=-112.807, `position_z`=78.4871, `orientation`=5.18363, `rotation0`=0, `rotation1`=0, `rotation2`=-0.522498, `rotation3`=0.85264 WHERE `guid`=90402;

-- Alliance Banner Aura, Large
UPDATE `gameobject` SET `position_x`=557.227, `position_y`=-86.8521, `position_z`=62.1767, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=90323;
UPDATE `gameobject` SET `position_x`=-156.47, `position_y`=-449.953, `position_z`=50.6682, `orientation`=6.03884, `rotation0`=0, `rotation1`=0, `rotation2`=-0.121869, `rotation3`=0.992546 WHERE `guid`=90329;

-- Horde Banner Aura, Large
UPDATE `gameobject` SET `position_x`=-1302.73, `position_y`=-316.63, `position_z`=127.503, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=90335;

-- Neutral Banner Aura, Large
UPDATE `gameobject` SET `position_x`=677.592, `position_y`=-139.034, `position_z`=76.2196, `orientation`=4.29351, `rotation0`=0, `rotation1`=0, `rotation2`=-0.83867, `rotation3`=0.54464 WHERE `guid`=90349;
UPDATE `gameobject` SET `position_x`=202.541, `position_y`=-361.858, `position_z`=67.7371, `orientation`=0.610863, `rotation0`=0, `rotation1`=0, `rotation2`=0.300705, `rotation3`=0.953717 WHERE `guid`=90351;
UPDATE `gameobject` SET `position_x`=-572.205, `position_y`=-262.476, `position_z`=88.6647, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=90339;

-- Alterac Valley Gate
UPDATE `gameobject` SET `position_x`=-870.944, `position_y`=-558.578, `position_z`=57.2628, `orientation`=2.16421, `rotation0`=0, `rotation1`=0, `rotation2`=0.882947, `rotation3`=0.469473 WHERE `guid`=90226;
UPDATE `gameobject` SET `position_x`=794.643, `position_y`=-493.475, `position_z`=99.7779, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=90225;

-- Bat01
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-10561.9, `position_y`=-1170.68, `position_z`=42.7257, `orientation`=2.00713, `rotation0`=0, `rotation1`=0, `rotation2`=0.843391, `rotation3`=0.5373 WHERE `guid`=331634;

-- Bat02
-- Event 12: Hallow's End
UPDATE `gameobject` SET `position_x`=-10565.1, `position_y`=-1169.65, `position_z`=46.188, `orientation`=2.60054, `rotation0`=0, `rotation1`=0, `rotation2`=0.96363, `rotation3`=0.267241 WHERE `guid`=331906;

-- Wickerman Ember
-- We temp summon those from script.
/*
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3232, 180437, 0, 1731.56, 514.596, 39.3475, 5.70723, 0, 0, -0.284015, 0.95882, 180, 180, 100, 1, 6, 10), -- Undercity
(3233, 180437, 0, 1741.12, 505.333, 41.3979, 4.64258, 0, 0, -0.731354, 0.681998, 180, 180, 100, 1, 6, 10), -- Undercity
(3234, 180437, 0, 1731.58, 500.123, 42.5049, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 100, 1, 6, 10), -- Undercity
(3235, 180437, 0, 1722.22, 512.332, 39.1567, 0.209439, 0, 0, 0.104528, 0.994522, 180, 180, 100, 1, 6, 10), -- Undercity
(3236, 180437, 0, 1738.43, 512.016, 39.8172, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 100, 1, 6, 10), -- Undercity
(3237, 180437, 0, 1721.45, 505.141, 40.8856, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 100, 1, 6, 10); -- Undercity
*/

-- Glyphed Crystal Prism
-- We temp spawn those in core.
/*
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3238, 180514, 1, -6825.29, 809.125, 51.8699, 0.349065, 0, 0, 0.173648, 0.984808, 180, 180, 100, 0, 6, 10), -- Silithus
(3239, 180514, 1, -6822.21, 808.584, 51.5885, 2.77507, 0, 0, 0.983254, 0.182238, 180, 180, 100, 0, 6, 10), -- Silithus
(3240, 180514, 1, -6823.57, 811.977, 51.4426, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 100, 0, 6, 10); -- Silithus
*/
DELETE FROM `gameobject_template` WHERE `entry`=210342;
DELETE FROM `locales_gameobject` WHERE `entry`=210342;

-- Merithra's Wake
-- We temp spawn those in core.
/*
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(3243, 180604, 1, -8096.71, 1485.86, 2.60941, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3250, 180604, 1, -8080.9, 1523.92, 2.60941, 1.32645, 0, 0, 0.615661, 0.788011, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3251, 180604, 1, -8079.38, 1540.47, 2.6094, 1.41372, 0, 0, 0.649447, 0.760406, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3252, 180604, 1, -8104.83, 1541.22, 3.80065, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3253, 180604, 1, -8104.63, 1504.55, 2.61155, 4.59022, 0, 0, -0.748956, 0.66262, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3254, 180604, 1, -8085.88, 1552.12, 3.30995, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3255, 180604, 1, -8090.99, 1472.81, 2.6521, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3256, 180604, 1, -8099.57, 1526.5, 2.83107, 1.83259, 0, 0, 0.793353, 0.608762, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3258, 180604, 1, -8094.15, 1540.47, 2.69067, 3.28124, 0, 0, -0.997563, 0.0697661, 180, 180, 100, 1, 7, 10), -- Silithus (SPAWN)
(3259, 180604, 1, -8090.24, 1508.85, 3.16068, 2.65289, 0, 0, 0.970295, 0.241925, 180, 180, 100, 1, 7, 10); -- Silithus (SPAWN)
*/

-- IronForgeSteamTank
-- Event 54: AQ War Troop Silithus (NPC & GO) DAY 1
-- Event 55: AQ War Troop Silithus (NPC & GO) DAY 2
-- Event 57: AQ War Troop Silithus (NPC & GO) DAY 4
UPDATE `gameobject` SET `position_x`=-6947.34, `position_y`=962.631, `position_z`=14.3632, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=220202;
UPDATE `gameobject` SET `position_x`=-6786.53, `position_y`=570.164, `position_z`=4.13154, `orientation`=3.71755, `rotation0`=0, `rotation1`=0, `rotation2`=-0.958819, `rotation3`=0.284016 WHERE `guid`=220203;

-- AQWar - Resource, Bandages, Alliance, Tier 1
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4968.33, `position_y`=-1152.89, `position_z`=501.925, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220141;

-- AQWar - Resource, Bandages, Alliance, Tier 2
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4969.21, `position_y`=-1143.84, `position_z`=509.251, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=220142;

-- AQWar - Resource, Bandages, Alliance, Tier 3
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4983, `position_y`=-1136.22, `position_z`=501.659, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=220143;

-- AQWar - Resource, Bandages, Alliance, Tier 4
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4975.6, `position_y`=-1147.33, `position_z`=509.25, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220144;

-- AQWar - Resource, Bandages, Alliance, Tier 5
-- Event 22: AQ War Effort (NPC & GO 'Initial')
UPDATE `gameobject` SET `position_x`=-4974.11, `position_y`=-1148.4, `position_z`=510.848, `orientation`=2.26893, `rotation0`=0, `rotation1`=0, `rotation2`=0.906307, `rotation3`=0.422619 WHERE `guid`=220145;

-- Scarab Coffer
-- Pool 42904: scarab coffers spawn in AQ20
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
(47469, 180691, 509, -8713.44, 1543.34, 32.2034, 0.767944, 0, 0, 0.374606, 0.927184, 604800, 604800, 100, 1, 7, 10),
(47470, 180691, 509, -9090.66, 1500.96, 24.4341, 0.977383, 0, 0, 0.469471, 0.882948, 604800, 604800, 100, 1, 7, 10),
(47471, 180691, 509, -9344.26, 1191.31, 22.0217, 1.309, 0, 0, 0.608761, 0.793354, 604800, 604800, 100, 1, 7, 10),
(47472, 180691, 509, -9006.97, 1988.6, 32.2369, 6.16101, 0, 0, -0.0610485, 0.998135, 604800, 604800, 100, 1, 7, 10),
(47473, 180691, 509, -8938.36, 1860.11, 3.23041, 3.75246, 0, 0, -0.953716, 0.300708, 604800, 604800, 100, 1, 7, 10),
(47474, 180691, 509, -8772.14, 2003.6, 21.907, 2.91469, 0, 0, 0.993571, 0.113208, 604800, 604800, 100, 1, 7, 10),
(47475, 180691, 509, -9121.05, 2180.52, 24.8621, 0.90757, 0, 0, 0.438371, 0.898794, 604800, 604800, 100, 1, 7, 10),
(47476, 180691, 509, -9541.15, 1585.01, 26.5581, 4.04917, 0, 0, -0.898793, 0.438373, 604800, 604800, 100, 1, 7, 10),
(47477, 180691, 509, -9694.64, 1653.44, 22.4991, 5.86431, 0, 0, -0.207911, 0.978148, 604800, 604800, 100, 1, 7, 10),
(47478, 180691, 509, -9519.04, 2003.01, 109.034, 2.42601, 0, 0, 0.936672, 0.350207, 604800, 604800, 100, 1, 7, 10);
DELETE FROM `gameobject` WHERE `guid` IN (3996293, 3996292, 3996291, 3996290, 3996289, 3996288, 3996287);
DELETE FROM `pool_gameobject` WHERE `guid` IN (3996293, 3996292, 3996291, 3996290, 3996289, 3996288, 3996287);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(47469, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47470, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47471, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47472, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47473, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47474, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47475, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47476, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47477, 42904, 0, 'Scarab Coffer', 0, 7, 10),
(47478, 42904, 0, 'Scarab Coffer', 0, 7, 10);

-- Festive Keg
-- Event 34: New Year's Eve
-- Event 38: Chinese New Year
UPDATE `gameobject` SET `position_x`=-14415.9, `position_y`=420.981, `position_z`=22.1447, `orientation`=1.0821, `rotation0`=0, `rotation1`=0, `rotation2`=0.515038, `rotation3`=0.857168 WHERE `guid`=375072;

-- CrateAllianceFirstAid01
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(4082, 180714, 0, -4972.81, -1145.83, 501.65, 3.61284, 0, 0, -0.972369, 0.233448, 180, 180, 100, 1, 7, 10), -- Dun Morogh
(4083, 180714, 0, -4972.44, -1153.13, 510.493, 5.25344, 0, 0, -0.492423, 0.870356, 180, 180, 100, 1, 7, 10), -- Ironforge
(4084, 180714, 0, -4974.84, -1156.88, 503.524, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 7, 10), -- Ironforge
(4085, 180714, 0, -4972.67, -1152.66, 509.25, 0.331611, 0, 0, 0.165047, 0.986286, 180, 180, 100, 1, 7, 10), -- Ironforge
(4087, 180714, 0, -4971.91, -1153.99, 509.25, 5.23599, 0, 0, -0.5, 0.866025, 180, 180, 100, 1, 7, 10), -- Ironforge
(4088, 180714, 0, -4978.42, -1159.34, 501.644, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 7, 10), -- Ironforge
(4089, 180714, 0, -4968.47, -1149.96, 501.925, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 100, 1, 7, 10), -- Ironforge
(4090, 180714, 0, -4968.39, -1150.03, 503.168, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 100, 1, 7, 10), -- Ironforge
(4091, 180714, 0, -4976.95, -1158.3, 502.889, 4.15388, 0, 0, -0.874619, 0.48481, 180, 180, 100, 1, 7, 10), -- Ironforge
(4092, 180714, 0, -4972.68, -1136.95, 509.777, 4.38078, 0, 0, -0.814116, 0.580703, 180, 180, 100, 1, 7, 10), -- Ironforge
(4093, 180714, 0, -4985.94, -1135.93, 501.659, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 7, 10), -- Ironforge
(4094, 180714, 0, -4979.77, -1139.91, 504.139, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 7, 10), -- Ironforge
(4095, 180714, 0, -4979.91, -1139.91, 502.902, 1.48353, 0, 0, 0.67559, 0.737278, 180, 180, 100, 1, 7, 10), -- Ironforge
(4097, 180714, 0, -4984.32, -1135.76, 504.875, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 100, 1, 7, 10), -- Ironforge
(4098, 180714, 0, -4986.02, -1136.78, 502.902, 3.194, 0, 0, -0.999657, 0.0262016, 180, 180, 100, 1, 7, 10), -- Ironforge
(4099, 180714, 0, -4979.8, -1146.88, 502.891, 3.71755, 0, 0, -0.958819, 0.284016, 180, 180, 100, 1, 7, 10), -- Ironforge
(4100, 180714, 0, -4972.92, -1145.82, 504.129, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 100, 1, 7, 10), -- Ironforge
(4101, 180714, 0, -4977.45, -1157.94, 501.649, 3.927, 0, 0, -0.923879, 0.382686, 180, 180, 100, 1, 7, 10), -- Ironforge
(4102, 180714, 0, -4976.29, -1158.75, 501.643, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 7, 10), -- Ironforge
(4104, 180714, 0, -4979.93, -1139.91, 501.659, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 7, 10), -- Ironforge
(4106, 180714, 0, -4972.86, -1145.85, 502.893, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 7, 10), -- Ironforge
(4107, 180714, 0, -4985.74, -1137.55, 501.659, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 100, 1, 7, 10), -- Ironforge
(4109, 180714, 0, -4979.97, -1146.89, 501.655, 4.20625, 0, 0, -0.861629, 0.507539, 180, 180, 100, 1, 7, 10); -- Ironforge
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(4082, 58),
(4083, 58),
(4084, 58),
(4085, 58),
(4087, 58),
(4088, 58),
(4089, 58),
(4090, 58),
(4091, 58),
(4092, 58),
(4093, 58),
(4094, 58),
(4095, 58),
(4097, 58),
(4098, 58),
(4099, 58),
(4100, 58),
(4101, 58),
(4102, 58),
(4104, 58),
(4106, 58),
(4107, 58),
(4109, 58);

-- Holly Preserver
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=-4929.1, `position_y`=-990.27, `position_z`=501.448, `orientation`=2.51327, `rotation0`=0, `rotation1`=0, `rotation2`=0.951056, `rotation3`=0.309017 WHERE `guid`=41673;
UPDATE `gameobject` SET `position_x`=-1256.43, `position_y`=68.1925, `position_z`=127.471, `orientation`=4.62512, `rotation0`=0, `rotation1`=0, `rotation2`=-0.737277, `rotation3`=0.675591 WHERE `guid`=41700;

-- Metzen's Stable
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=-8088.34, `position_y`=-5275.29, `position_z`=0.875843, `orientation`=1.81514, `rotation0`=0, `rotation1`=0, `rotation2`=0.788011, `rotation3`=0.615662 WHERE `guid`=151750;

-- Metzen's Fencing
-- Event 2: Feast of Winter Veil
UPDATE `gameobject` SET `position_x`=-6611.56, `position_y`=-1854.63, `position_z`=244.189, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=151755;
UPDATE `gameobject` SET `position_x`=-6608.53, `position_y`=-1860.06, `position_z`=244.353, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=151758;
UPDATE `gameobject` SET `position_x`=-6611.56, `position_y`=-1857.47, `position_z`=244.22, `orientation`=3.17653, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999847, `rotation3`=0.0174693 WHERE `guid`=151756;
UPDATE `gameobject` SET `position_x`=-6611.44, `position_y`=-1860.28, `position_z`=244.26, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725374 WHERE `guid`=151757;
UPDATE `gameobject` SET `position_x`=-6605.92, `position_y`=-1854.22, `position_z`=244.303, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=151754;
UPDATE `gameobject` SET `position_x`=-6605.74, `position_y`=-1856.93, `position_z`=244.379, `orientation`=0.0523589, `rotation0`=0, `rotation1`=0, `rotation2`=0.0261765, `rotation3`=0.999657 WHERE `guid`=151752;
UPDATE `gameobject` SET `position_x`=-6608.76, `position_y`=-1854.42, `position_z`=244.239, `orientation`=1.62316, `rotation0`=0, `rotation1`=0, `rotation2`=0.725374, `rotation3`=0.688355 WHERE `guid`=151753;
UPDATE `gameobject` SET `position_x`=-6605.64, `position_y`=-1859.81, `position_z`=244.461, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=151751;

-- Carefully Wrapped Present
-- Event 21: Feast of Winter Veil: Gifts
UPDATE `gameobject` SET `position_x`=-4916.04, `position_y`=-981.171, `position_z`=501.848, `orientation`=0.087266, `rotation0`=0, `rotation1`=0, `rotation2`=0.0436192, `rotation3`=0.999048 WHERE `guid`=151767;
UPDATE `gameobject` SET `position_x`=1628.53, `position_y`=-4413.28, `position_z`=15.7934, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=151768;

-- Catapult
-- Event 56: AQ War Troop Silithus (NPC & GO) DAY 3
-- Event 57: AQ War Troop Silithus (NPC & GO) DAY 4
-- Event 58: AQ War Troop Silithus (NPC & GO) DAY 5
DELETE FROM `gameobject` WHERE `id`=180744;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(8152, 180744, 1, -6978.79, 919.586, 9.75189, 0.558504, 0, 0, 0.275637, 0.961262, 25, 25, 100, 1, 7, 10), -- Silithus
(8153, 180744, 1, -6826.49, 560.815, -1.27602, 0.314158, 0, 0, 0.156434, 0.987688, 25, 25, 100, 1, 7, 10), -- Silithus
(8154, 180744, 1, -6828.89, 576.458, -1.265, 5.63741, 0, 0, -0.317305, 0.948324, 25, 25, 100, 1, 7, 10), -- Silithus
(8155, 180744, 1, -6823.92, 551.499, -1.26005, 6.16101, 0, 0, -0.0610485, 0.998135, 25, 25, 100, 1, 7, 10); -- Silithus
UPDATE `game_event_gameobject`  SET `guid`=8152 WHERE `guid`=220204;
UPDATE `game_event_gameobject`  SET `guid`=8153 WHERE `guid`=220206;
UPDATE `game_event_gameobject`  SET `guid`=8154 WHERE `guid`=220205;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (8155, 55);

-- Gently Shaken Gift
-- Event 21: Feast of Winter Veil: Gifts
UPDATE `gameobject` SET `position_x`=1625.37, `position_y`=-4410.19, `position_z`=15.0052, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=151770;

-- Gaily Wrapped Present
-- Event 21: Feast of Winter Veil: Gifts
UPDATE `gameobject` SET `position_x`=-4919.12, `position_y`=-980.604, `position_z`=501.456, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=151761;
UPDATE `gameobject` SET `position_x`=1622.19, `position_y`=-4411.12, `position_z`=14.4452, `orientation`=2.19911, `rotation0`=0, `rotation1`=0, `rotation2`=0.891006, `rotation3`=0.453991 WHERE `guid`=151762;

-- Ticking Present
-- Event 21: Feast of Winter Veil: Gifts
UPDATE `gameobject` SET `position_x`=-4920.98, `position_y`=-981.292, `position_z`=501.462, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697556, `rotation3`=0.997564 WHERE `guid`=151764;
UPDATE `gameobject` SET `position_x`=1626.39, `position_y`=-4412.09, `position_z`=15.6993, `orientation`=3.08918, `rotation0`=0, `rotation1`=0, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=151763;

-- Toasting Goblet
-- Event 39: Post Firework Toasting Goblets
UPDATE `gameobject` SET `position_x`=-5091.94, `position_y`=-776.493, `position_z`=496.144, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=407469;
UPDATE `gameobject` SET `position_x`=-5093.93, `position_y`=-776.219, `position_z`=496.127, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=407472;
UPDATE `gameobject` SET `position_x`=-5165.08, `position_y`=-864.071, `position_z`=508.072, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=407474;
UPDATE `gameobject` SET `position_x`=-5164.99, `position_y`=-865.852, `position_z`=508.073, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=407478;
UPDATE `gameobject` SET `position_x`=-5165.93, `position_y`=-865.201, `position_z`=508.102, `orientation`=2.07694, `rotation0`=0, `rotation1`=0, `rotation2`=0.861629, `rotation3`=0.507539 WHERE `guid`=407477;
UPDATE `gameobject` SET `position_x`=-5164.98, `position_y`=-864.791, `position_z`=508.074, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=407476;
UPDATE `gameobject` SET `position_x`=-5164.17, `position_y`=-865.144, `position_z`=508.053, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=407479;
UPDATE `gameobject` SET `position_x`=-5164.39, `position_y`=-864.583, `position_z`=508.045, `orientation`=4.5204, `rotation0`=0, `rotation1`=0, `rotation2`=-0.771625, `rotation3`=0.636078 WHERE `guid`=407475;
UPDATE `gameobject` SET `position_x`=-14296.9, `position_y`=523.05, `position_z`=9.7606, `orientation`=5.96903, `rotation0`=0, `rotation1`=0, `rotation2`=-0.156434, `rotation3`=0.987688 WHERE `guid`=380436;
UPDATE `gameobject` SET `position_x`=-14296.6, `position_y`=524.092, `position_z`=9.76754, `orientation`=4.06662, `rotation0`=0, `rotation1`=0, `rotation2`=-0.894934, `rotation3`=0.446199 WHERE `guid`=380513;
UPDATE `gameobject` SET `position_x`=-14413.6, `position_y`=419.22, `position_z`=23.278, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=380820;
UPDATE `gameobject` SET `position_x`=1316.62, `position_y`=-4370.39, `position_z`=28.9184, `orientation`=1.37881, `rotation0`=0, `rotation1`=0, `rotation2`=0.636078, `rotation3`=0.771625 WHERE `guid`=407480;

-- Lantern
-- Event 7: Lunar Festival
UPDATE `gameobject` SET `position_x`=10165.4, `position_y`=2580.43, `position_z`=1361.88, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=64761;

-- Lantern
-- Event 7: Lunar Festival
-- Event 38: Chinese New Year
UPDATE `gameobject` SET `position_x`=10159.9, `position_y`=2604.61, `position_z`=1330.83, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=64823;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
