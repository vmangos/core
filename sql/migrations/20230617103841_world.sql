DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230617103841');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230617103841');
-- Add your query below.

SET @OGUID = 65815;

-- Correct position of Wintersbite in Alterac Mountains (position is off by 4.40549 yards).
UPDATE `gameobject` SET `position_x`=439.039, `position_y`=-242.432, `position_z`=155.82, `orientation`=2.96704, `rotation0`=0, `rotation1`=0, `rotation2`=0.996194, `rotation3`=0.087165 WHERE `guid`=8211;

-- Correct position of Wintersbite in Alterac Mountains (position is off by 0.637646 yards).
UPDATE `gameobject` SET `position_x`=313.651, `position_y`=-349.851, `position_z`=167.662, `orientation`=4.86947, `rotation0`=0, `rotation1`=0, `rotation2`=-0.649447, `rotation3`=0.760406 WHERE `guid`=8212;

-- Missing Wintersbite spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2044, 0, 544.052, -207.92, 146.243, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8209 at 8.258742 yards.
(@OGUID+2, 2044, 0, 250.224, -412.048, 153.166, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8196 at 10.912564 yards.
(@OGUID+3, 2044, 0, 319.122, -386.163, 170.845, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8212 at 36.625572 yards.
(@OGUID+4, 2044, 0, 783.456, -247.429, 135.859, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 8207 at 182.269623 yards.
(@OGUID+5, 2044, 0, 179.995, -248.8, 149.441, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 2044, 0, 210.969, -220.867, 141.12, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 2044, 0, 319.05, -448.606, 161.647, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 2044, 0, 487.716, -574.645, 180.137, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 2044, 0, 525.429, -133.65, 145.502, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 2044, 0, 681.078, -549.017, 171.199, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 2044, 0, 722.54, -699.398, 159.316, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 2044, 0, 815.014, -513.302, 140.804, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+2, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+3, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+4, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+5, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+6, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+7, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+8, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+9, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+10, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+11, 1062, 0, 'Wintersbite', 0, 10), -- Wintersbite in Alterac 34 objects total
(@OGUID+12, 1062, 0, 'Wintersbite', 0, 10); -- Wintersbite in Alterac 34 objects total

-- Remove Custom Spawns (Non of these spawns exist in the sniff-db)
DELETE FROM `gameobject` WHERE `guid` IN (8190, 8192, 8193, 8195, 8196, 8197, 8198, 8199, 8200, 8201, 8202, 8203, 8204, 8205, 8206, 8208, 8209, 8210, 8213, 8214, 8215);
DELETE FROM `pool_gameobject` WHERE `guid` IN (8190, 8192, 8193, 8195, 8196, 8197, 8198, 8199, 8200, 8201, 8202, 8203, 8204, 8205, 8206, 8208, 8209, 8210, 8213, 8214, 8215);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (2044);

-- Missing Doom Weed spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 176753, 0, 2574.08, 398.103, 33.1812, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 22.711180 yards.
(@OGUID+14, 176753, 0, 2596.32, 396.81, 35.748, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 12.224313 yards.
(@OGUID+15, 176753, 0, 2584.16, 406.246, 34.2144, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45211 at 22.735905 yards.
(@OGUID+16, 176753, 0, 2606.75, 485.595, 22.2602, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45212 at 21.387922 yards.
(@OGUID+17, 176753, 0, 2579.67, 417.986, 32.7585, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45187 at 31.852596 yards.
(@OGUID+18, 176753, 0, 2591.56, 508.857, 21.1091, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45185 at 37.824726 yards.
(@OGUID+19, 176753, 0, 2669.85, 500.801, 14.9761, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45183 at 43.925026 yards.
(@OGUID+20, 176753, 0, 2549.78, 523.822, 15.3514, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45291 at 12.030589 yards.
(@OGUID+21, 176753, 0, 2566.46, 539.654, 15.6006, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45291 at 16.780058 yards.
(@OGUID+22, 176753, 0, 2661.83, 553.988, 15.7135, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 45188 at 6.289917 yards.

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (176753);

-- Correct position of Gloom Weed in Tirisfal Glades (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2204.13, `position_y`=1120.06, `position_z`=34.8163, `orientation`=4.01426, `rotation0`=0, `rotation1`=0, `rotation2`=-0.906307, `rotation3`=0.422619 WHERE `guid`=25562;

-- Missing Gloom Weed spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 175566, 0, 2345, 1134.46, 40.815, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45151 at 27.154045 yards.
(@OGUID+24, 175566, 0, 2236.18, 1132.24, 35.7463, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25562 at 34.289642 yards.
(@OGUID+25, 175566, 0, 2262.6, 1097.4, 33.4581, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45206 at 23.813292 yards.
(@OGUID+26, 175566, 0, 2147.61, 1179.32, 43.0177, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45249 at 39.174145 yards.
(@OGUID+27, 175566, 0, 2110.01, 1025.17, 32.7202, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45247 at 45.436459 yards.
(@OGUID+28, 175566, 0, 2089.86, 930.135, 37.6736, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45289 at 39.898357 yards.
(@OGUID+29, 175566, 0, 2222.67, 1082.27, 31.9708, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25562 at 42.184666 yards.
(@OGUID+30, 175566, 0, 2156.37, 1114.61, 35.3472, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45249 at 44.080013 yards.
(@OGUID+31, 175566, 0, 2194.7, 1155.29, 33.7973, 1.18682, 0, 0, 0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25565 at 27.818230 yards.
(@OGUID+32, 175566, 0, 2025.03, 881.479, 34.3452, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45289 at 41.449284 yards.
(@OGUID+33, 175566, 0, 2145.43, 985.034, 30.369, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25549 at 39.686237 yards.
(@OGUID+34, 175566, 0, 2068.2, 778.964, 37.0121, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45273 at 48.561001 yards.
(@OGUID+35, 175566, 0, 2061.49, 737.939, 37.4144, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45207 at 57.711746 yards.
(@OGUID+36, 175566, 0, 2056.82, 702.233, 40.8026, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45235 at 65.627213 yards.
(@OGUID+37, 175566, 0, 2215.82, 763.169, 35.9284, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45293 at 24.975376 yards.
(@OGUID+38, 175566, 0, 2216.82, 699.65, 35.4347, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25569 at 39.158745 yards.
(@OGUID+39, 175566, 0, 2108.76, 613.144, 35.0265, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45173 at 84.692368 yards.
(@OGUID+40, 175566, 0, 2242.29, 676.938, 37.7281, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45277 at 41.238186 yards.
(@OGUID+41, 175566, 0, 2174.56, 589.332, 43.559, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45283 at 41.075333 yards.
(@OGUID+42, 175566, 0, 2296.36, 575.073, 33.1947, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45262 at 50.826672 yards.
(@OGUID+43, 175566, 0, 2323.93, 607.756, 33.0141, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45274 at 35.737415 yards.
(@OGUID+44, 175566, 0, 2100.14, 476.564, 60.7574, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45237 at 52.236477 yards.
(@OGUID+45, 175566, 0, 2071.39, 598.644, 34.1636, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45173 at 69.193268 yards.
(@OGUID+46, 175566, 0, 2170.57, 480.299, 66.9702, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45237 at 52.559711 yards.
(@OGUID+47, 175566, 0, 2306.28, 494.127, 35.7492, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 45262 at 30.822075 yards.
(@OGUID+48, 175566, 0, 2193.01, 652.462, 32.8342, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25513 at 38.092777 yards.
(@OGUID+49, 175566, 0, 2321.08, 967.793, 57.685, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10);

-- Sync Gobject Data
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300, `spawn_flags` = 0, `animprogress` = 100 WHERE `id` IN (175566);

-- Correct position of Incendia Agave in Thousand Needles (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-4966.54, `position_y`=-1914.79, `position_z`=-41.1326, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=25687;

-- Correct position of Incendia Agave in Thousand Needles (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5028.41, `position_y`=-2000.75, `position_z`=-53.1136, `orientation`=5.37562, `rotation0`=0, `rotation1`=0, `rotation2`=-0.438371, `rotation3`=0.898794 WHERE `guid`=25685;

DELETE FROM `gameobject` WHERE `guid` IN (25689, 25690, 25691, 25692, 25693, 25694, 25695, 25696, 25697);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
