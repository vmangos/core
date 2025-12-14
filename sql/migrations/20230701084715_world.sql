DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701084715');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701084715');
-- Add your query below.


SET @OGUID = 31532;
SET @PTEMPLATE = 16965;

DELETE FROM `gameobject` WHERE `guid` IN (13546, 13547, 13548, 13549, 13550, 13551, 13552, 13553, 13554, 13555, 13556, 13557, 13558, 13559, 13560, 13561, 13562, 13563, 13564, 13565, 399301, 399302, 399303, 399304, 399305, 399306, 399307, 399308, 399309, 399310, 399311, 399312, 399313, 399314, 399315, 399316, 399317, 399318, 399319, 399320);
DELETE FROM `pool_gameobject` WHERE `guid` IN (13546, 13547, 13548, 13549, 13550, 13551, 13552, 13553, 13554, 13555, 13556, 13557, 13558, 13559, 13560, 13561, 13562, 13563, 13564, 13565, 399301, 399302, 399303, 399304, 399305, 399306, 399307, 399308, 399309, 399310, 399311, 399312, 399313, 399314, 399315, 399316, 399317, 399318, 399319, 399320);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (13546, 13547, 13548, 13549, 13550, 13551, 13552, 13553, 13554, 13555, 13556, 13557, 13558, 13559, 13560, 13561, 13562, 13563, 13564, 13565, 399301, 399302, 399303, 399304, 399305, 399306, 399307, 399308, 399309, 399310, 399311, 399312, 399313, 399314, 399315, 399316, 399317, 399318, 399319, 399320));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 13359, 1, 7312.25, -954.66, 32.2666, 1.78024, 0, 0, 0.777146, 0.62932, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 13359, 1, 7354.62, -785.463, 7.84792, 4.48903, 0, 0, 0.781507, -0.623897, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 13359, 1, 7388.81, -1064.92, 38.5052, -0.750491, 0, 0, 0.366501, -0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 13359, 1, 7408.95, -919.086, 13.3903, 3.97936, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 13359, 1, 7433.07, -842.923, 16.0331, 0.620163, 0, 0, 0.305136, 0.952309, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 13359, 1, 7445, -1029.63, 17.3113, 2.12421, 0, 0, 0.873383, 0.487034, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 13359, 1, 7452.75, -842.502, 1.44652, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 13359, 1, 7456.14, -1012.32, -9.80946, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 13359, 1, 7474.54, -1069.02, 34.7748, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 13359, 1, 7491.87, -822.89, 15.6482, 1.00502, 0, 0, 0.481625, 0.876378, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 13359, 1, 7532.89, -967.223, -9.72233, 0.0177932, 0, 0, 0.00889647, 0.99996, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 13359, 1, 7537.63, -820.435, 16.0756, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 13359, 1, 7542.35, -968.103, -9.35254, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 13359, 1, 7568.98, -874.125, 16.1728, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 13359, 1, 7586.13, -1053.09, 37.5463, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 13359, 1, 7667.91, -994.121, 35.5219, -3.01942, 0, 0, 0.998135, -0.061048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 13359, 1, 7697.81, -912.961, 20.5101, 2.72507, 0, 0, 0.978392, 0.206759, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 13359, 1, 7248.35, -864.333, 30.7869, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 13359, 1, 7257.43, -913.109, 35.7167, 0.925024, 0, 0, 0.446198, 0.894935, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 13359, 1, 7273.1, -955.21, 34.433, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 13359, 1, 7338.47, -990.344, 32.0613, 0.837757, 0, 0, 0.406736, 0.913546, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 13359, 1, 7357.98, -802.943, 8.16762, 3.29869, 0, 0, -0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 13359, 1, 7416.46, -1061.46, 38.1164, 2.63544, 0, 0, 0.968147, 0.250381, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 13359, 1, 7490.07, -818.734, 15.1527, 5.13127, 0, 0, -0.544639, 0.838671, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 13359, 1, 7610.89, -1008.14, 37.8612, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 13359, 1, 7693.61, -915.8, 20.8482, 0.59341, 0, 0, 0.292371, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 13359, 1, 7417.99, -851.028, 17.6296, 0.628317, 0, 0, 0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 13873, 1, 7312.25, -954.66, 32.2666, 1.78024, 0, 0, 0.777146, 0.62932, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 13873, 1, 7354.62, -785.463, 7.84792, 4.48903, 0, 0, 0.781507, -0.623897, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 13873, 1, 7388.81, -1064.92, 38.5052, -0.750491, 0, 0, 0.366501, -0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 13873, 1, 7408.95, -919.086, 13.3903, 3.97936, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 13873, 1, 7433.07, -842.923, 16.0331, 0.620163, 0, 0, 0.305136, 0.952309, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 13873, 1, 7445, -1029.63, 17.3113, 2.12421, 0, 0, 0.873383, 0.487034, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 13873, 1, 7452.75, -842.502, 1.44652, 2.33874, 0, 0, 0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 13873, 1, 7456.14, -1012.32, -9.80946, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 13873, 1, 7474.54, -1069.02, 34.7748, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 13873, 1, 7491.87, -822.89, 15.6482, 1.00502, 0, 0, 0.481625, 0.876378, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 13873, 1, 7532.89, -967.223, -9.72233, 0.0177932, 0, 0, 0.00889647, 0.99996, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 13873, 1, 7537.63, -820.435, 16.0756, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 13873, 1, 7542.35, -968.103, -9.35254, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 13873, 1, 7568.98, -874.125, 16.1728, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 13873, 1, 7586.13, -1053.09, 37.5463, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 13873, 1, 7667.91, -994.121, 35.5219, -3.01942, 0, 0, 0.998135, -0.061048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 13873, 1, 7697.81, -912.961, 20.5101, 2.72507, 0, 0, 0.978392, 0.206759, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 13873, 1, 7248.35, -864.333, 30.7869, 4.41568, 0, 0, -0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+46, 13873, 1, 7257.43, -913.109, 35.7167, 0.925024, 0, 0, 0.446198, 0.894935, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+47, 13873, 1, 7273.1, -955.21, 34.433, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+48, 13873, 1, 7338.47, -990.344, 32.0613, 0.837757, 0, 0, 0.406736, 0.913546, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+49, 13873, 1, 7357.98, -802.943, 8.16762, 3.29869, 0, 0, -0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+50, 13873, 1, 7416.46, -1061.46, 38.1164, 2.63544, 0, 0, 0.968147, 0.250381, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+51, 13873, 1, 7490.07, -818.734, 15.1527, 5.13127, 0, 0, -0.544639, 0.838671, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+52, 13873, 1, 7610.89, -1008.14, 37.8612, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+53, 13873, 1, 7693.61, -915.8, 20.8482, 0.59341, 0, 0, 0.292371, 0.956305, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+54, 13873, 1, 7417.99, -851.028, 17.6296, 0.628317, 0, 0, 0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+2, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+3, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+4, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+5, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+6, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+7, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+8, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+9, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+10, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+11, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+12, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+13, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+14, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+15, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+16, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+17, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+18, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+19, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+20, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+21, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+22, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+23, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+24, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+25, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+26, 1, 'Cat Figurine - Darkshore', 0, 10),
(@PTEMPLATE+27, 1, 'Cat Figurine - Darkshore', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+24, @PTEMPLATE+24, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+25, @PTEMPLATE+25, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+26, @PTEMPLATE+26, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+27, @PTEMPLATE+27, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+28, @PTEMPLATE+1, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+29, @PTEMPLATE+2, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+30, @PTEMPLATE+3, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+31, @PTEMPLATE+4, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+32, @PTEMPLATE+5, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+33, @PTEMPLATE+6, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+34, @PTEMPLATE+7, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+35, @PTEMPLATE+8, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+36, @PTEMPLATE+9, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+37, @PTEMPLATE+10, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+38, @PTEMPLATE+11, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+39, @PTEMPLATE+12, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+40, @PTEMPLATE+13, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+41, @PTEMPLATE+14, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+42, @PTEMPLATE+15, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+43, @PTEMPLATE+16, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+44, @PTEMPLATE+17, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+45, @PTEMPLATE+18, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+46, @PTEMPLATE+19, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+47, @PTEMPLATE+20, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+48, @PTEMPLATE+21, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+49, @PTEMPLATE+22, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+50, @PTEMPLATE+23, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+51, @PTEMPLATE+24, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+52, @PTEMPLATE+25, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+53, @PTEMPLATE+26, 'Cat Figurine - Darkshore', 0, 10),
(@OGUID+54, @PTEMPLATE+27, 'Cat Figurine - Darkshore', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+28, 11, 'Darkshore - Cat Figurine (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+2, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+3, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+4, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+5, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+6, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+7, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+8, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+9, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+10, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+11, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+12, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+13, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+14, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+15, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+16, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+17, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+18, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+19, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+20, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+21, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+22, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+23, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+24, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+25, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+26, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0),
(@PTEMPLATE+27, @PTEMPLATE+28, 0, 'Cat Figurine - Darkshore', 0);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Cat Figurine - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 13359);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Cat Figurine - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 13873);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
