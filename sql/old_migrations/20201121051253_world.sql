DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201121051253');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201121051253');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=-633.39, `position_y`=-1566.65, `position_z`=64.1649, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207912, `rotation3`=0.978148 WHERE `guid`=2869;
UPDATE `gameobject` SET `position_x`=502.74, `position_y`=1208.63, `position_z`=87.6672, `orientation`=1.51844, `rotation0`=0, `rotation1`=0, `rotation2`=0.688354, `rotation3`=0.725375 WHERE `guid`=2727;
UPDATE `gameobject` SET `position_x`=9.14334, `position_y`=1086.47, `position_z`=68.8772, `orientation`=3.68265, `rotation0`=0, `rotation1`=0, `rotation2`=-0.96363, `rotation3`=0.267241 WHERE `guid`=42968;
UPDATE `gameobject` SET `position_x`=-10273.4, `position_y`=841.916, `position_z`=42.2785, `orientation`=5.11382, `rotation0`=0, `rotation1`=0, `rotation2`=-0.551936, `rotation3`=0.833886 WHERE `guid`=2622;
UPDATE `gameobject` SET `position_x`=-10448.7, `position_y`=-1362.45, `position_z`=79.5184, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2595;


-- Missing spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2543, 1621, 0, -11105.6, -731.904, 56.4545, 0.820303, 0, 0, 0.398748, 0.91706, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2543, 1113, 'Briarthorn');                        

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2568, 1621, 0, -952.438, 185.32, 39.5891, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2568, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2587, 1621, 0, -507.498, 242.908, 73.3424, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2587, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2588, 1621, 0, -523.583, 434.796, 85.6967, 4.27606, 0, 0, -0.843391, 0.5373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2588, 1050, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2597, 1621, 0, -921.657, 75.1367, 36.0038, 3.35105, 0, 0, -0.994521, 0.104535, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2597, 1050, 'Briarthorn');                        

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2613, 1621, 0, -5259.97, -3520.82, 300.448, 6.07375, 0, 0, -0.104528, 0.994522, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2613, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2617, 1621, 0, -5177.44, -3443.42, 304.83, 3.22886, 0, 0, -0.999048, 0.0436193, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2617, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2626, 1621, 0, -5147.11, -3496.26, 304.571, 2.35619, 0, 0, 0.92388, 0.382683, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2626, 1165, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2658, 1621, 0, -4874.16, -3374.26, 308.717, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2658, 1165, 'Briarthorn');                        

-- Missing spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2692, 1621, 0, -9100.39, -2601.51, 117.783, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2692, 1127, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2693, 1621, 0, -9567.76, -2131.51, 74.0443, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2693, 1127, 'Briarthorn');                        

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2704, 1621, 0, 691.563, 1286.89, 74.3206, 4.04917, 0, 0, -0.898793, 0.438373, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2704, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2730, 1621, 0, 729.797, 1482.48, 62.22, 0.174532, 0, 0, 0.0871553, 0.996195, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2730, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2788, 1621, 0, -322.612, 1153.8, 70.5041, 2.77507, 0, 0, 0.983254, 0.182238, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2788, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2789, 1621, 0, -495.378, 1155, 63.7513, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2789, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2794, 1621, 0, -493.935, 1189.47, 61.2801, 2.61799, 0, 0, 0.965925, 0.258821, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2794, 1046, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2795, 1621, 0, -517.273, 1045.46, 91.7688, 5.20108, 0, 0, -0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2795, 1046, 'Briarthorn');                        

-- Missing spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2815, 1621, 1, -213.583, -511.994, 10.9339, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2815, 1087, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2823, 1621, 1, 284.004, 238.587, 68.6627, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2823, 1087, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2837, 1621, 1, 1839.3, 957.335, 149.863, 5.02655, 0, 0, -0.587785, 0.809017, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2837, 1087, 'Briarthorn');                        

-- Missing spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2853, 1621, 0, -10605.6, 1229.34, 33.087, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2853, 1109, 'Briarthorn');                        

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2894, 1621, 0, -3925.27, -2591.35, 43.6762, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2894, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2895, 1621, 0, -3141.5, -2912.14, 21.8747, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2895, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`,`id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2896, 1621, 0, -3326.56, -3155.95, 24.4531, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2896, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (30009, 1621, 0, -3402.69, -3235.19, 23.3302, 4.10152, 0, 0, -0.887011, 0.461749, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (30009, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (48641, 1621, 0, -3334.19, -2619.98, 10.2918, 1.6057, 0, 0, 0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (48641, 1151, 'Briarthorn');                        
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (48751, 1621, 0, -3526.27, -2432.7, 56.1001, 3.38594, 0, 0, -0.992546, 0.12187, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (48751, 1151, 'Briarthorn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
