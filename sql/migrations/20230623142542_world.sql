DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230623142542');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230623142542');
-- Add your query below.


-- Azshara
SET @OGUID = 65864;
SET @PTEMPLATE = 9802;

DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1246, 1329, 1244, 1352));
DELETE FROM `pool_gameobject` WHERE `pool_entry` IN (1246, 1329, 1244, 1352);
DELETE FROM `pool_template` WHERE `entry` IN (1246, 1329, 1244, 1352);

-- Rich Thorium / Truesilver
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 175404, 1, 3259.22, -5155.35, 94.4296, -2.25148, 0, 0, 0.902585, -0.430511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 1, 4813.78, -7218.07, 101.907, -0.925024, 0, 0, 0.446198, -0.894934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 1, 2419.03, -6999.06, 108.771, -2.02458, 0, 0, 0.848048, -0.529919, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 175404, 1, 4689.64, -5369.46, 118.006, -0.279253, 0, 0, 0.139173, -0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 175404, 1, 3827.91, -6155.92, 4.86859, 1.91986, 0, 0, 0.819152, 0.573576, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 175404, 1, 4451.39, -6452.65, 138.367, 1.8326, 0, 0, 0.793353, 0.608761, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 175404, 1, 4702.94, -6731.23, 131.381, -1.85005, 0, 0, 0.798635, -0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 175404, 1, 4382.33, -6121.17, 123.339, 2.96706, 0, 0, 0.996195, 0.087156, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 175404, 1, 3217.87, -5454.92, 103.901, 1.02974, 0, 0, 0.492424, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 175404, 1, 3648.63, -6378.19, -52.0457, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 175404, 1, 4210.82, -5213.95, 116.943, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 175404, 1, 3152.03, -6037.21, 4.75105, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 175404, 1, 2093.01, -5585.94, -7.77245, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 175404, 1, 4458.91, -5549.51, 111.424, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 175404, 1, 3413.1, -5354.91, 115.967, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 175404, 1, 3601.63, -5412.79, 118.231, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 175404, 1, 3741.3, -5366.5, 99.7494, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 175404, 1, 3980.69, -6278.7, 8.60821, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 175404, 1, 3075.36, -5776.95, 25.3971, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 175404, 1, 2236.38, -6675.25, 127.433, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 175404, 1, 4695.86, -5989.7, 117.796, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 175404, 1, 4614.32, -5556.65, 105.257, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2047, 1, 3259.22, -5155.35, 94.4296, -2.25148, 0, 0, 0.902585, -0.430511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2047, 1, 4813.78, -7218.07, 101.907, -0.925024, 0, 0, 0.446198, -0.894934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2047, 1, 2419.03, -6999.06, 108.771, -2.02458, 0, 0, 0.848048, -0.529919, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2047, 1, 4689.64, -5369.46, 118.006, -0.279253, 0, 0, 0.139173, -0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2047, 1, 3827.91, -6155.92, 4.86859, 1.91986, 0, 0, 0.819152, 0.573576, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2047, 1, 4451.39, -6452.65, 138.367, 1.8326, 0, 0, 0.793353, 0.608761, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2047, 1, 4702.94, -6731.23, 131.381, -1.85005, 0, 0, 0.798635, -0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2047, 1, 4382.33, -6121.17, 123.339, 2.96706, 0, 0, 0.996195, 0.087156, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2047, 1, 3217.87, -5454.92, 103.901, 1.02974, 0, 0, 0.492424, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2047, 1, 3648.63, -6378.19, -52.0457, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2047, 1, 4210.82, -5213.95, 116.943, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2047, 1, 3152.03, -6037.21, 4.75105, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2047, 1, 2093.01, -5585.94, -7.77245, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2047, 1, 4458.91, -5549.51, 111.424, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 2047, 1, 3413.1, -5354.91, 115.967, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 2047, 1, 3601.63, -5412.79, 118.231, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 2047, 1, 3741.3, -5366.5, 99.7494, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 2047, 1, 3980.69, -6278.7, 8.60821, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 2047, 1, 3075.36, -5776.95, 25.3971, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 2047, 1, 2236.38, -6675.25, 127.433, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 2047, 1, 4695.86, -5989.7, 117.796, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 2047, 1, 4614.32, -5556.65, 105.257, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+10, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+11, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+12, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+13, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+14, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+15, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+16, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+17, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+18, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+19, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+20, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+21, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@PTEMPLATE+22, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+7, @PTEMPLATE+7, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+8, @PTEMPLATE+8, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+9, @PTEMPLATE+9, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+10, @PTEMPLATE+10, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+11, @PTEMPLATE+11, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+12, @PTEMPLATE+12, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+13, @PTEMPLATE+13, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+14, @PTEMPLATE+14, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+15, @PTEMPLATE+15, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+16, @PTEMPLATE+16, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+17, @PTEMPLATE+17, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+18, @PTEMPLATE+18, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+19, @PTEMPLATE+19, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+20, @PTEMPLATE+20, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+21, @PTEMPLATE+21, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+22, @PTEMPLATE+22, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+23, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+24, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+25, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+26, @PTEMPLATE+4, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+27, @PTEMPLATE+5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+28, @PTEMPLATE+6, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+29, @PTEMPLATE+7, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+30, @PTEMPLATE+8, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+31, @PTEMPLATE+9, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+32, @PTEMPLATE+10, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+33, @PTEMPLATE+11, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+34, @PTEMPLATE+12, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+35, @PTEMPLATE+13, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+36, @PTEMPLATE+14, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+37, @PTEMPLATE+15, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+38, @PTEMPLATE+16, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+39, @PTEMPLATE+17, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+40, @PTEMPLATE+18, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+41, @PTEMPLATE+19, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+42, @PTEMPLATE+20, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+43, @PTEMPLATE+21, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10),
(@OGUID+44, @PTEMPLATE+22, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2337, 9, 'Azshara - Truesilver Deposits / Rich Thorium Veins (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+2,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+3,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+4,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+5,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+6,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+7,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+8,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+9,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+10,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+11,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+12,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+13,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+14,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+15,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+16,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+17,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+18,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+19,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+20,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+21,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0),
(@PTEMPLATE+22,  2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0);

UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);

SET @OGUID = 66336;
SET @PTEMPLATE = 8803;

-- Gold / Mithril / Truesilver
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 1734, 1, 2828.26, -3994.61, 117.324, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, 4280.41, -7293.17, 17.8182, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, 4111.43, -5137.35, 146.158, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, 4004.27, -5020.26, 144.709, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, 4373.93, -6309.83, 96.4017, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, 3036.39, -4058.49, 123.179, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, 2930.96, -4063.48, 121.14, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 1, 3801.09, -4842.9, 158.188, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 1, 2407.6, -6540.76, 117.029, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 1, 2484.39, -5401, 133.867, -1, 0, 0, -0.267238, 0.96363, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 1, 5025.34, -6505.18, -8.06637, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 1, 4588.05, -6850.55, 140.756, -2.40855, 0, 0, 0.93358, -0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 1, 3283.68, -4261.74, 128.746, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 1, 3681.92, -6041.19, 9.59359, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 1, 2350.47, -6026.23, 36.1732, -2.14675, 0, 0, 0.878817, -0.477159, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 1, 4815.63, -7439.1, 100.707, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 1, 2326.11, -6374.83, 107.362, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 1, 2439.83, -5194.75, 156.308, 2.25148, 0, 0, 0.902585, 0.430511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 1, 2248.41, -5766.5, 6.41299, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 1, 4915.54, -7019, 108.375, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 1, 2740.53, -6057.06, 52.9025, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 1, 3253.48, -4371.95, 126.518, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 1, 3805.53, -5566.64, 26.7421, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 1, 2241.44, -6389.57, 17.3552, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 1, 2691.49, -5241.29, 119.195, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 1, 3547.02, -5481.67, 53.6473, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 1, 3932.33, -4933.86, 159.605, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 1, 4269.99, -7110.64, 45.3157, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 1, 4653.78, -5907.58, 122.904, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 1, 4745.73, -5473.62, 110.335, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 1, 3319.4, -5781.67, 11.9572, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1734, 1, 2809.74, -5501.43, 108.372, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1734, 1, 4680.67, -7671.08, 56.161, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1734, 1, 4684.03, -6503.64, 118.027, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2040, 1, 2828.26, -3994.61, 117.324, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 2040, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 2040, 1, 4280.41, -7293.17, 17.8182, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 2040, 1, 4111.43, -5137.35, 146.158, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 2040, 1, 4004.27, -5020.26, 144.709, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 2040, 1, 4373.93, -6309.83, 96.4017, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 2040, 1, 3036.39, -4058.49, 123.179, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 2040, 1, 2930.96, -4063.48, 121.14, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 2040, 1, 3801.09, -4842.9, 158.188, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 2040, 1, 2407.6, -6540.76, 117.029, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 2040, 1, 2484.39, -5401, 133.867, -1, 0, 0, -0.267238, 0.96363, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 2040, 1, 5025.34, -6505.18, -8.06637, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 2040, 1, 4588.05, -6850.55, 140.756, -2.40855, 0, 0, 0.93358, -0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 2040, 1, 3283.68, -4261.74, 128.746, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 2040, 1, 3681.92, -6041.19, 9.59359, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 2040, 1, 2350.47, -6026.23, 36.1732, -2.14675, 0, 0, 0.878817, -0.477159, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 2040, 1, 4815.63, -7439.1, 100.707, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 2040, 1, 2326.11, -6374.83, 107.362, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 2040, 1, 2439.83, -5194.75, 156.308, 2.25148, 0, 0, 0.902585, 0.430511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 2040, 1, 2248.41, -5766.5, 6.41299, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 2040, 1, 4915.54, -7019, 108.375, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 2040, 1, 2740.53, -6057.06, 52.9025, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 2040, 1, 3253.48, -4371.95, 126.518, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 2040, 1, 3805.53, -5566.64, 26.7421, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 2040, 1, 2241.44, -6389.57, 17.3552, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 2040, 1, 2691.49, -5241.29, 119.195, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 2040, 1, 3547.02, -5481.67, 53.6473, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 2040, 1, 3932.33, -4933.86, 159.605, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 2040, 1, 4269.99, -7110.64, 45.3157, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 2040, 1, 4653.78, -5907.58, 122.904, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 2040, 1, 4745.73, -5473.62, 110.335, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 2040, 1, 3319.4, -5781.67, 11.9572, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 2040, 1, 2809.74, -5501.43, 108.372, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 2040, 1, 4680.67, -7671.08, 56.161, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 2040, 1, 4684.03, -6503.64, 118.027, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 2047, 1, 2828.26, -3994.61, 117.324, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 2047, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 2047, 1, 4280.41, -7293.17, 17.8182, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 2047, 1, 4111.43, -5137.35, 146.158, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 2047, 1, 4004.27, -5020.26, 144.709, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 2047, 1, 4373.93, -6309.83, 96.4017, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 2047, 1, 3036.39, -4058.49, 123.179, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 2047, 1, 2930.96, -4063.48, 121.14, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 2047, 1, 3801.09, -4842.9, 158.188, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 2047, 1, 2407.6, -6540.76, 117.029, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 2047, 1, 2484.39, -5401, 133.867, -1, 0, 0, -0.267238, 0.96363, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 2047, 1, 5025.34, -6505.18, -8.06637, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 2047, 1, 4588.05, -6850.55, 140.756, -2.40855, 0, 0, 0.93358, -0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 2047, 1, 3283.68, -4261.74, 128.746, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 2047, 1, 3681.92, -6041.19, 9.59359, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 2047, 1, 2350.47, -6026.23, 36.1732, -2.14675, 0, 0, 0.878817, -0.477159, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 2047, 1, 4815.63, -7439.1, 100.707, 2.75762, 0, 0, 0.981627, 0.190809, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 2047, 1, 2326.11, -6374.83, 107.362, 2.30383, 0, 0, 0.913545, 0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 2047, 1, 2439.83, -5194.75, 156.308, 2.25148, 0, 0, 0.902585, 0.430511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 2047, 1, 2248.41, -5766.5, 6.41299, 2.82743, 0, 0, 0.987688, 0.156434, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 2047, 1, 4915.54, -7019, 108.375, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 2047, 1, 2740.53, -6057.06, 52.9025, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 2047, 1, 3253.48, -4371.95, 126.518, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 2047, 1, 3805.53, -5566.64, 26.7421, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 2047, 1, 2241.44, -6389.57, 17.3552, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 2047, 1, 2691.49, -5241.29, 119.195, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 2047, 1, 3547.02, -5481.67, 53.6473, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 2047, 1, 3932.33, -4933.86, 159.605, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 2047, 1, 4269.99, -7110.64, 45.3157, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 2047, 1, 4653.78, -5907.58, 122.904, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 2047, 1, 4745.73, -5473.62, 110.335, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 2047, 1, 3319.4, -5781.67, 11.9572, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 2047, 1, 2809.74, -5501.43, 108.372, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 2047, 1, 4680.67, -7671.08, 56.161, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 2047, 1, 4684.03, -6503.64, 118.027, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+21, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+22, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+23, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+24, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+25, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+26, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+27, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+28, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+29, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+30, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+31, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+32, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+33, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+34, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+35, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+13, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+14, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+15, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+16, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+17, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+18, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+19, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+20, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+21, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+22, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+23, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+24, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+25, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+26, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+27, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+28, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+29, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+30, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+31, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+32, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+33, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+34, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+35, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+36, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+37, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+38, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+39, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+40, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+41, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+42, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+43, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+44, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+45, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+46, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+47, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+48, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+49, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+50, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+51, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+52, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+53, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+54, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+55, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+56, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+57, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+58, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+59, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+60, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+61, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+62, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+63, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+64, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+65, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+66, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+67, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+68, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+69, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+70, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+71, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+72, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+73, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+74, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+75, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+76, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+77, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+78, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+79, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+80, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+81, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+82, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+83, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+84, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+85, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+86, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+87, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+88, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+89, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+90, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+91, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+92, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+93, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+94, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+95, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+96, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+97, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+98, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+99, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+100, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+101, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+102, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+103, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+104, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+105, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2338, 15, 'Azshara - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+2,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+3,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+4,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+5,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+6,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+7,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+8,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+9,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+10,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+11,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+12,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+13,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+14,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+15,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+16,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+17,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+18,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+19,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+20,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+21,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+22,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+23,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+24,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+25,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+26,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+27,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+28,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+29,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+30,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+31,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+32,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+33,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+34,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+35,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Desolace
SET @PTEMPLATE = 3660;

DELETE FROM `pool_gameobject` WHERE `guid` IN (20862, 251511, 20863, 20753, 34167, 10280, 43817, 427057, 20815, 34188, 6366, 34200, 20849, 34189, 34196, 43808, 10249, 34190, 7293, 34191, 3996097, 27897, 34195, 20855, 20791, 34192, 20854, 10345, 10329, 34194, 20865, 34184, 20864, 10279, 20858, 43800, 6380, 427042, 6669, 34183, 14083, 387717, 29207, 14078, 7320, 220420, 34180, 220421, 13232, 13216, 29217, 27903, 427559, 7074, 14094, 14112, 13607, 427554, 220405, 14023, 220455, 220812, 14091, 34177, 14090);

-- Tin Vein / Silver Vein
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(20862, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Desolace', 10),
(251511, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Desolace', 10),
(20863, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Desolace', 10),
(20753, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Desolace', 10);

-- Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Iron Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34167, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Desolace', 10),
(10280, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Desolace', 10),
(43817, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Desolace', 10),
(427057, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Desolace', 10),
(20815, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Desolace', 10),
(34188, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Desolace', 10),
(6366, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Desolace', 10),
(34200, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Desolace', 10),
(20849, @PTEMPLATE+7, 'Gold Vein / Iron Deposit - Desolace', 10),
(34189, @PTEMPLATE+7, 'Gold Vein / Iron Deposit - Desolace', 10),
(34196, @PTEMPLATE+8, 'Gold Vein / Iron Deposit - Desolace', 10),
(43808, @PTEMPLATE+8, 'Gold Vein / Iron Deposit - Desolace', 10),
(10249, @PTEMPLATE+9, 'Gold Vein / Iron Deposit - Desolace', 10),
(34190, @PTEMPLATE+9, 'Gold Vein / Iron Deposit - Desolace', 10);

-- Gold Vein / Mithril Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit - Desolace', 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(7293, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit - Desolace', 10),
(34191, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit - Desolace', 10),
(3996097, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit - Desolace', 10),
(27897, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit - Desolace', 10);

-- Silver Vein / Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34195, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(20855, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(20791, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(34192, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(20854, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(10345, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(10329, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(34194, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(20865, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10);

-- Silver Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Silver Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+17, 1, 'Silver Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+18, 1, 'Silver Vein / Iron Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34184, @PTEMPLATE+15, 'Silver Vein / Iron Deposit - Desolace', 10),
(20864, @PTEMPLATE+15, 'Silver Vein / Iron Deposit - Desolace', 10),
(10279, @PTEMPLATE+16, 'Silver Vein / Iron Deposit - Desolace', 10),
(20858, @PTEMPLATE+16, 'Silver Vein / Iron Deposit - Desolace', 10),
(43800, @PTEMPLATE+17, 'Silver Vein / Iron Deposit - Desolace', 10),
(6380, @PTEMPLATE+17, 'Silver Vein / Iron Deposit - Desolace', 10),
(427042, @PTEMPLATE+18, 'Silver Vein / Iron Deposit - Desolace', 10),
(6669, @PTEMPLATE+18, 'Silver Vein / Iron Deposit - Desolace', 10);

-- Mithril Deposit / Truesilver Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+19, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+20, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+21, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+22, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+23, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+24, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+25, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+26, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+27, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+28, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+29, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+30, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+31, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34183, @PTEMPLATE+19, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14083, @PTEMPLATE+19, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(387717, @PTEMPLATE+20, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(29207, @PTEMPLATE+20, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14078, @PTEMPLATE+21, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(7320, @PTEMPLATE+21, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(220420, @PTEMPLATE+22, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(34180, @PTEMPLATE+22, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(220421, @PTEMPLATE+23, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(13232, @PTEMPLATE+23, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(13216, @PTEMPLATE+24, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(29217, @PTEMPLATE+24, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(27903, @PTEMPLATE+25, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(427559, @PTEMPLATE+25, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(7074, @PTEMPLATE+26, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14094, @PTEMPLATE+26, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14112, @PTEMPLATE+27, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(13607, @PTEMPLATE+27, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(427554, @PTEMPLATE+28, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(220405, @PTEMPLATE+28, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14023, @PTEMPLATE+29, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(220455, @PTEMPLATE+29, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(220812, @PTEMPLATE+30, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14091, @PTEMPLATE+30, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(34177, @PTEMPLATE+31, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(14090, @PTEMPLATE+31, 'Mithril Deposit / Truesilver Deposit - Desolace', 10);

SET @PTEMPLATE = 2870;

-- Dustwallow Marsh
DELETE FROM `pool_gameobject` WHERE `guid` IN (220828, 56057, 40773, 56027, 40775, 13674, 40774, 55969, 40776, 427162);

-- Iron Deposit / Mithril Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220828, @PTEMPLATE+1, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10),
(56057, @PTEMPLATE+1, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);

-- Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(40773, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(56027, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(40775, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(13674, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(40774, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(55969, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(40776, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10),
(427162, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Dustwallow Marsh', 10);

-- STV
DELETE FROM `pool_gameobject` WHERE `guid` IN (427007, 6550, 389463, 427010, 31518, 12168, 12173, 31532, 31531, 57638, 43245, 31528, 31519, 57644, 31529, 57640, 57642, 31520,6545, 6570, 6571, 389461, 10619, 5854, 6662, 12294, 43805, 43256, 32490, 5959, 43804, 32096, 12286, 389473, 43258, 6470, 220805, 43814, 34751, 11696, 220806, 43815, 7176, 43813, 43801, 31525, 32486, 31526, 11969, 5896, 43802, 7306);

-- Silver Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Iron Deposit - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427007, @PTEMPLATE+6, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(6550, @PTEMPLATE+6, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(389463, @PTEMPLATE+7, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(427010, @PTEMPLATE+7, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(31518, @PTEMPLATE+8, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(12168, @PTEMPLATE+8, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(12173, @PTEMPLATE+9, 'Silver Vein / Iron Deposit - Stranglethorn', 10),
(31532, @PTEMPLATE+9, 'Silver Vein / Iron Deposit - Stranglethorn', 10);

-- Tin Vein / Silver Vein
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(@PTEMPLATE+12, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(@PTEMPLATE+13, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(@PTEMPLATE+14, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(31531, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(57638, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(43245, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(31528, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(31519, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(57644, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(31529, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(57640, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(57642, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(31520, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Stranglethorn', 10);

-- Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+21, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+22, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+23, 1, 'Gold Vein / Iron Deposit - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(6545, @PTEMPLATE+15, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(6570, @PTEMPLATE+15, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(6571, @PTEMPLATE+16, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(389461, @PTEMPLATE+16, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(10619, @PTEMPLATE+17, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(5854, @PTEMPLATE+17, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(6662, @PTEMPLATE+18, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(12294, @PTEMPLATE+18, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(43805, @PTEMPLATE+19, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(43256, @PTEMPLATE+19, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(32490, @PTEMPLATE+20, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(5959, @PTEMPLATE+20, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(43804, @PTEMPLATE+21, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(32096, @PTEMPLATE+21, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(12286, @PTEMPLATE+22, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(389473, @PTEMPLATE+22, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(43258, @PTEMPLATE+23, 'Gold Vein / Iron Deposit - Stranglethorn', 10),
(6470, @PTEMPLATE+23, 'Gold Vein / Iron Deposit - Stranglethorn', 10);

-- Mithril Deposit / Truesilver Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+24, 1, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(@PTEMPLATE+25, 1, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(@PTEMPLATE+26, 1, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(@PTEMPLATE+27, 1, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220805, @PTEMPLATE+24, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(43814, @PTEMPLATE+24, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(34751, @PTEMPLATE+25, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(11696, @PTEMPLATE+25, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(220806, @PTEMPLATE+26, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(43815, @PTEMPLATE+26, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(7176, @PTEMPLATE+27, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10),
(43813, @PTEMPLATE+27, 'Mithril Deposit / Truesilver Deposit - Stranglethorn', 10);

-- Silver Vein / Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+28, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(@PTEMPLATE+29, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43801, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(31525, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(32486, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(31526, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(11969, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(5896, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10);

-- Gold Vein / Mithril Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+30, 1, 'Gold Vein / Mithril Deposit - Stranglethorn', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43802, @PTEMPLATE+30, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10),
(7306, @PTEMPLATE+30, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn', 10);

-- Alterac
DELETE FROM `pool_gameobject` WHERE `guid` IN (31521, 42201, 42202, 220423, 220424, 42204, 43254, 43806, 396411, 31523, 33198, 220425, 220426, 42203, 33196, 220427, 35403, 10622, 220428, 42200, 14483, 427184, 43803, 33185, 31530, 10238, 10572, 6575, 33134, 6489, 32314, 6487, 35374, 31524, 6488, 220429, 220431, 31527, 6460, 10341, 43807, 6494, 12261, 10573, 10571, 6420, 427019, 33290, 9907, 6517, 10583, 427013, 427153, 427002, 32196, 427004);
UPDATE `gameobject` SET `id` = 1735 WHERE `guid` = 396411;

-- Tin Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+31, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+32, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+33, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+34, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+35, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+36, 1, 'Tin Vein / Iron Deposit - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(42202, @PTEMPLATE+31, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220423, @PTEMPLATE+31, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220424, @PTEMPLATE+32, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(42204, @PTEMPLATE+32, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(33198, @PTEMPLATE+33, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220425, @PTEMPLATE+33, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220426, @PTEMPLATE+34, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(42203, @PTEMPLATE+34, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(33196, @PTEMPLATE+35, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220427, @PTEMPLATE+35, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(220428, @PTEMPLATE+36, 'Tin Vein / Iron Deposit - Alterac Mountains', 10),
(42200, @PTEMPLATE+36, 'Tin Vein / Iron Deposit - Alterac Mountains', 10);

-- Silver Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+37, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+38, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+39, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+40, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+41, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+42, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+43, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+44, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+45, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(10583, @PTEMPLATE+37, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427013, @PTEMPLATE+37, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427153, @PTEMPLATE+38, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427002, @PTEMPLATE+38, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(32196, @PTEMPLATE+39, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427004, @PTEMPLATE+39, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427019, @PTEMPLATE+40, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(33290, @PTEMPLATE+40, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(35374, @PTEMPLATE+41, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(31524, @PTEMPLATE+41, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(31530, @PTEMPLATE+42, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(10238, @PTEMPLATE+42, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(220431, @PTEMPLATE+43, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(31527, @PTEMPLATE+43, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(43254, @PTEMPLATE+44, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(43806, @PTEMPLATE+44, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(396411, @PTEMPLATE+45, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(31523, @PTEMPLATE+45, 'Silver Vein / Iron Deposit - Alterac Mountains', 10);

-- Gold Vein / Iron Deposit
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+46, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+47, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+48, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+49, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+50, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+51, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+52, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+53, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+54, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+55, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+56, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(@PTEMPLATE+57, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(35403, @PTEMPLATE+46, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(10622, @PTEMPLATE+46, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(14483, @PTEMPLATE+47, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(427184, @PTEMPLATE+47, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(43803, @PTEMPLATE+48, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(33185, @PTEMPLATE+48, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(10572, @PTEMPLATE+49, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6575, @PTEMPLATE+49, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(33134, @PTEMPLATE+50, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6489, @PTEMPLATE+50, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(32314, @PTEMPLATE+51, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6487, @PTEMPLATE+51, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6488, @PTEMPLATE+52, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(220429, @PTEMPLATE+52, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6460, @PTEMPLATE+53, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(10341, @PTEMPLATE+53, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(43807, @PTEMPLATE+54, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6494, @PTEMPLATE+54, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(12261, @PTEMPLATE+55, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(10573, @PTEMPLATE+55, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(10571, @PTEMPLATE+56, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6420, @PTEMPLATE+56, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(9907, @PTEMPLATE+57, 'Gold Vein / Iron Deposit - Alterac Mountains', 10),
(6517, @PTEMPLATE+57, 'Gold Vein / Iron Deposit - Alterac Mountains', 10);

-- Tin Vein / Silver Vein
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+58, 1, 'Tin Vein / Silver Vein - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(31521, @PTEMPLATE+58, 'Tin Vein / Silver Vein - Alterac Mountains', 10),
(42201, @PTEMPLATE+58, 'Tin Vein / Silver Vein - Alterac Mountains', 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
