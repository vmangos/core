DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250206163717');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250206163717');
-- Add your query below.


-- Hillsbrad Foothills
UPDATE `pool_pool` SET `description` = 'Hillsbrad Foothills - Azurelode Mine - Tin Vein / Silver Vein' WHERE `pool_id` IN (1468, 1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1482, 14445, 14446);
UPDATE `pool_template` SET `description` = 'Copper Veins - Hillsbrad Foothills (Master Pool)' WHERE `entry` = 1066;
UPDATE `pool_template` SET `description` = 'Hillsbrad Foothills - Tin Vein / Silver Vein (Master Pool)' WHERE `entry` = 1273;
UPDATE `pool_template` SET `description` = 'Hillsbrad Foothills - Azurelode Mine - Tin Vein / Silver Vein (Master Pool)' WHERE `entry` = 3310;

-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Hillsbrad Foothills' WHERE `guid` IN (220452, 220453, 21297);
UPDATE `gameobject` SET `id` = 1732 WHERE `guid` = 220453;
UPDATE `gameobject` SET `id` = 1733 WHERE `guid` = 21297;
UPDATE `pool_pool` SET `mother_pool` = 1273, `description` = 'Hillsbrad Foothills - Tin Vein / Silver Vein' WHERE `pool_id` = 17008;
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Hillsbrad Foothills' WHERE `entry` = 17008;
DELETE FROM `pool_gameobject` WHERE  `guid` = 220452;
DELETE FROM `gameobject` WHERE  `guid` = 220452;

-- Silver Vein / Gold Vein / Iron Deposit
SET @OGUID = 100207;
SET @PTEMPLATE = 7244;

DELETE FROM `gameobject` WHERE `guid` IN (22035, 22082, 20295, 20263, 20264, 20265, 20266, 20267, 20268, 20269, 20270, 20271, 20272, 20273, 20274, 20275, 20276, 20277, 20278, 20279, 20280, 20281, 20282, 20283, 20284, 20285, 20286, 20287, 20288, 20289, 20290, 20291, 20292, 20293, 20294, 22129, 22130, 43325, 43326, 427067, 427068, 427246, 427247, 427248, 427249, 427250, 427251, 427252, 427253, 427254, 427255);
DELETE FROM `pool_gameobject` WHERE `guid` IN (22035, 22082, 20295, 20263, 20264, 20265, 20266, 20267, 20268, 20269, 20270, 20271, 20272, 20273, 20274, 20275, 20276, 20277, 20278, 20279, 20280, 20281, 20282, 20283, 20284, 20285, 20286, 20287, 20288, 20289, 20290, 20291, 20292, 20293, 20294, 22129, 22130, 43325, 43326, 427067, 427068, 427246, 427247, 427248, 427249, 427250, 427251, 427252, 427253, 427254, 427255);
DELETE FROM `pool_template` WHERE `entry` IN (1274, 1503, 1567, 1568, 1569, 1570, 1571, 1572, 1573, 1574, 1575, 1576, 1577, 1578, 1579, 1580, 1581, 1582, 17051, 17092, 17093, 17094, 17095, 17096, 21698);
DELETE FROM `pool_pool` WHERE `mother_pool` IN (1274);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -356.236, -1705.29, 96.5566, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -1179.44, -1261.21, 50.4825, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -403.738, -1772.86, 103.414, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -256.987, -1494.96, 100.147, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -1289.16, 635.334, 54.1088, 0.174533, 0, 0, 0.087156, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -261.954, -1771.5, 128.367, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -156.347, -135.198, 114.634, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, 321.191, -1061.54, 97.7876, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -1373.79, -1072.68, 19.7061, 2.21656, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -498.583, -1658.01, 84.0551, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -166.388, -198.118, 109.465, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -164.338, -497.122, 80.3264, -2.51327, 0, 0, 0.951057, -0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -558.954, -1738.67, 75.4942, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -1236.35, -986.903, 16.5418, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -1212.15, -1247.16, 52.4297, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 0, -1389.83, -1202.56, 54.0563, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 0, -152.853, -402.945, 90.7132, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1733, 0, -1329.09, 469.776, 34.2974, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1733, 0, -1316.33, -1155.77, 42.5717, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1733, 0, -1310.49, 564.733, 106.517, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1733, 0, -1110.85, -1301.28, 60.684, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1733, 0, -1012.89, -1185.04, 65.5292, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1733, 0, -284.476, -1593.24, 96.5185, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 0, -356.236, -1705.29, 96.5566, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 0, -1179.44, -1261.21, 50.4825, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 0, -403.738, -1772.86, 103.414, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 0, -256.987, -1494.96, 100.147, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 0, -1289.16, 635.334, 54.1088, 0.174533, 0, 0, 0.087156, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 0, -261.954, -1771.5, 128.367, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 0, -156.347, -135.198, 114.634, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1734, 0, 321.191, -1061.54, 97.7876, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1734, 0, -1373.79, -1072.68, 19.7061, 2.21656, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1734, 0, -498.583, -1658.01, 84.0551, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1734, 0, -166.388, -198.118, 109.465, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1734, 0, -164.338, -497.122, 80.3264, -2.51327, 0, 0, 0.951057, -0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1734, 0, -558.954, -1738.67, 75.4942, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1734, 0, -1236.35, -986.903, 16.5418, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1734, 0, -1212.15, -1247.16, 52.4297, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1734, 0, -1389.83, -1202.56, 54.0563, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1734, 0, -152.853, -402.945, 90.7132, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1734, 0, -1329.09, 469.776, 34.2974, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1734, 0, -1316.33, -1155.77, 42.5717, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1734, 0, -1310.49, 564.733, 106.517, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1734, 0, -1110.85, -1301.28, 60.684, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1734, 0, -1012.89, -1185.04, 65.5292, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1734, 0, -284.476, -1593.24, 96.5185, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1735, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1735, 0, -356.236, -1705.29, 96.5566, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1735, 0, -1179.44, -1261.21, 50.4825, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1735, 0, -403.738, -1772.86, 103.414, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1735, 0, -256.987, -1494.96, 100.147, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1735, 0, -1289.16, 635.334, 54.1088, 0.174533, 0, 0, 0.087156, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1735, 0, -261.954, -1771.5, 128.367, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1735, 0, -156.347, -135.198, 114.634, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1735, 0, 321.191, -1061.54, 97.7876, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1735, 0, -1373.79, -1072.68, 19.7061, 2.21656, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1735, 0, -498.583, -1658.01, 84.0551, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1735, 0, -166.388, -198.118, 109.465, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1735, 0, -164.338, -497.122, 80.3264, -2.51327, 0, 0, 0.951057, -0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1735, 0, -558.954, -1738.67, 75.4942, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1735, 0, -1236.35, -986.903, 16.5418, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 1735, 0, -1212.15, -1247.16, 52.4297, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1735, 0, -1389.83, -1202.56, 54.0563, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 1735, 0, -152.853, -402.945, 90.7132, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 1735, 0, -1329.09, 469.776, 34.2974, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 1735, 0, -1316.33, -1155.77, 42.5717, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 1735, 0, -1310.49, 564.733, 106.517, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 1735, 0, -1110.85, -1301.28, 60.684, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 1735, 0, -1012.89, -1185.04, 65.5292, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 1735, 0, -284.476, -1593.24, 96.5185, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+17, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+18, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+19, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+20, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+21, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+23, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+24, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+12, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+13, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+14, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+15, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+16, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+17, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+18, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+19, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+20, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+21, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+22, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+23, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+24, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+25, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+26, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+27, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+28, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+29, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+30, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+31, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+32, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+33, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+34, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+35, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+36, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+37, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+38, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+39, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+40, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+41, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+42, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+43, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+44, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+45, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+46, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+47, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+48, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+49, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+50, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+51, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+52, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+53, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+54, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+55, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+56, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+57, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+58, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+59, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+60, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+61, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+62, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+63, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+64, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+65, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+66, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+67, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+68, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+69, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+70, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+71, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+72, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1274, 4, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+13, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+14, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+15, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+16, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+17, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+18, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+19, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+20, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+21, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+22, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+23, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+24, 1274, 0, 'Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Darrow Hill
DELETE FROM `gameobject` WHERE `guid` IN (21924, 21925, 21926, 21927, 21928, 21929, 21930, 21931, 21932, 21933, 21934, 21935, 21936, 21937, 21938, 21939, 21940, 21941, 21942, 21943, 21944, 21945, 21946, 21947, 21948, 21949, 21950, 21951, 21952, 21953, 21954, 21955, 21956, 21957, 21958, 21959, 21960, 21961, 21962, 21963, 21964, 21965, 21966, 21967, 21968, 21969, 21970, 21971, 21972, 21973, 21974, 21975, 21976, 21977, 21978, 21979, 21980, 21981, 21982, 21983, 21984, 21985, 21986, 21987, 21988, 43280, 43281, 43282, 43283, 43284, 43285, 43286, 43287, 43288, 43289, 43290, 43291, 43292, 43293, 43294, 427351, 427352, 427353, 427354, 427355);
DELETE FROM `pool_gameobject` WHERE `guid` IN (21924, 21925, 21926, 21927, 21928, 21929, 21930, 21931, 21932, 21933, 21934, 21935, 21936, 21937, 21938, 21939, 21940, 21941, 21942, 21943, 21944, 21945, 21946, 21947, 21948, 21949, 21950, 21951, 21952, 21953, 21954, 21955, 21956, 21957, 21958, 21959, 21960, 21961, 21962, 21963, 21964, 21965, 21966, 21967, 21968, 21969, 21970, 21971, 21972, 21973, 21974, 21975, 21976, 21977, 21978, 21979, 21980, 21981, 21982, 21983, 21984, 21985, 21986, 21987, 21988, 43280, 43281, 43282, 43283, 43284, 43285, 43286, 43287, 43288, 43289, 43290, 43291, 43292, 43293, 43294, 427351, 427352, 427353, 427354, 427355);
DELETE FROM `pool_template` WHERE `entry` IN (322, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3610, 3611, 3612, 3613, 3614, 17134, 21667, 21668, 21669);
DELETE FROM `pool_pool` WHERE `mother_pool` IN (322);
-- Silver Vein / Gold Vein / Iron Deposit
SET @OGUID = 100449;
SET @PTEMPLATE = 7268;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -274.632, -415.753, 68.9685, 4.20625, 0, 0, -0.861629, 0.507539, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -271.124, -337.963, 64.5877, 6.14356, 0, 0, -0.0697556, 0.997564, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -265.678, -269.988, 52.5609, 0.767944, 0, 0, 0.374606, 0.927184, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -253.921, -378.497, 47.6516, 6.16101, 0, 0, -0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -200.169, -357.171, 72.8802, 1.88495, 0, 0, 0.809016, 0.587786, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -190.746, -312.664, 73.9734, 2.53072, 0, 0, 0.953716, 0.300708, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -188.376, -353.486, 54.2951, 1.0472, 0, 0, 0.5, 0.866025, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -175.098, -386.277, 51.7808, 1.93731, 0, 0, 0.824125, 0.566408, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 0, -274.632, -415.753, 68.9685, 4.20625, 0, 0, -0.861629, 0.507539, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 0, -271.124, -337.963, 64.5877, 6.14356, 0, 0, -0.0697556, 0.997564, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 0, -265.678, -269.988, 52.5609, 0.767944, 0, 0, 0.374606, 0.927184, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 0, -253.921, -378.497, 47.6516, 6.16101, 0, 0, -0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 0, -200.169, -357.171, 72.8802, 1.88495, 0, 0, 0.809016, 0.587786, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 0, -190.746, -312.664, 73.9734, 2.53072, 0, 0, 0.953716, 0.300708, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 0, -188.376, -353.486, 54.2951, 1.0472, 0, 0, 0.5, 0.866025, 300, 600, 2700, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 0, -175.098, -386.277, 51.7808, 1.93731, 0, 0, 0.824125, 0.566408, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1735, 0, -274.632, -415.753, 68.9685, 4.20625, 0, 0, -0.861629, 0.507539, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1735, 0, -271.124, -337.963, 64.5877, 6.14356, 0, 0, -0.0697556, 0.997564, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1735, 0, -265.678, -269.988, 52.5609, 0.767944, 0, 0, 0.374606, 0.927184, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1735, 0, -253.921, -378.497, 47.6516, 6.16101, 0, 0, -0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1735, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1735, 0, -200.169, -357.171, 72.8802, 1.88495, 0, 0, 0.809016, 0.587786, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1735, 0, -190.746, -312.664, 73.9734, 2.53072, 0, 0, 0.953716, 0.300708, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1735, 0, -188.376, -353.486, 54.2951, 1.0472, 0, 0, 0.5, 0.866025, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1735, 0, -175.098, -386.277, 51.7808, 1.93731, 0, 0, 0.824125, 0.566408, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1735, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+12, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+13, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+14, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+15, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+16, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+17, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+18, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+19, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+20, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+21, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+22, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+23, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+24, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+25, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+26, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+27, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+28, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+29, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+30, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+31, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+32, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+33, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(322, 3, 'Hillsbrad Foothills - Darrow Hill - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit
SET @OGUID = 100482;
SET @PTEMPLATE = 7279;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -291.373, -291.808, 44.137, 1.97222, 0, 0, 0.833885, 0.551938, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -252.057, -306.233, 54.1448, 3.35105, 0, 0, -0.994521, 0.104536, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -219.275, -317.052, 73.0997, 3.63029, 0, 0, -0.970295, 0.241925, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -154.448, -345.575, 50.5997, 1.27409, 0, 0, 0.594822, 0.803857, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -121.89, -364.606, 53.3096, 5.09636, 0, 0, -0.559193, 0.829038, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -291.373, -291.808, 44.137, 1.97222, 0, 0, 0.833885, 0.551938, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -252.057, -306.233, 54.1448, 3.35105, 0, 0, -0.994521, 0.104536, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 0, -219.275, -317.052, 73.0997, 3.63029, 0, 0, -0.970295, 0.241925, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 0, -154.448, -345.575, 50.5997, 1.27409, 0, 0, 0.594822, 0.803857, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 0, -121.89, -364.606, 53.3096, 5.09636, 0, 0, -0.559193, 0.829038, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 0, -291.373, -291.808, 44.137, 1.97222, 0, 0, 0.833885, 0.551938, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 0, -252.057, -306.233, 54.1448, 3.35105, 0, 0, -0.994521, 0.104536, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 0, -219.275, -317.052, 73.0997, 3.63029, 0, 0, -0.970295, 0.241925, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2047, 0, -154.448, -345.575, 50.5997, 1.27409, 0, 0, 0.594822, 0.803857, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2047, 0, -121.89, -364.606, 53.3096, 5.09636, 0, 0, -0.559193, 0.829038, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2047, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+10, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+11, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+12, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
