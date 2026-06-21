DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260620100323');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260620100323');
-- Add your query below.


-- Highborne Relic Fragment
DELETE FROM `gameobject_template` WHERE `entry`=175891;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175891, 0, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13607, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175891, 6, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13607, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Highborne Relic Fragment
DELETE FROM `gameobject_template` WHERE `entry`=175892;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175892, 0, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13608, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175892, 6, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13608, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Highborne Relic Fragment
DELETE FROM `gameobject_template` WHERE `entry`=175888;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175888, 0, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175888, 6, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13606, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Highborne Relic Fragment
DELETE FROM `gameobject_template` WHERE `entry`=175893;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175893, 0, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13609, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175893, 6, 3, 3991, 'Highborne Relic Fragment', '', 0, 4, 1, 979, 13609, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Bolt Charged Bramble
UPDATE `gameobject_template` SET `data8` = 0 /*questId*/ WHERE `entry`=103662;

-- Arathi Basin Banners
DELETE FROM `gameobject_template` WHERE `entry` IN (180087, 180088, 180089, 180090, 180091);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(180087, 5, 10, 6271, 'Stable Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23932, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180088, 5, 10, 6271, 'Blacksmith Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23936, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180089, 5, 10, 6271, 'Farm Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23935, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180090, 5, 10, 6271, 'Lumber Mill Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23938, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180091, 5, 10, 6271, 'Mine Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23937, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180087, 6, 10, 6271, 'Stable Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23932, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180088, 6, 10, 6271, 'Blacksmith Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23936, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180089, 6, 10, 6271, 'Farm Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23935, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180090, 6, 10, 6271, 'Lumber Mill Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23938, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180091, 6, 10, 6271, 'Mine Banner', '', 35, 0, 1, 1479, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 23937, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Contested Banner
DELETE FROM `gameobject_template` WHERE `entry`=180067;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180067, 5, 1, 6253, 'Contested Banner', '', 84, 32, 1, 0, 1479, 0, 180102, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180067, 6, 1, 6254, 'Contested Banner', '', 84, 32, 1, 0, 1479, 0, 180102, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Harvest Nectar
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=180373;

-- Harvest Nectar
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=180374;

-- Harvest Fruit
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=180370;

-- Harvest Fish
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=180371;

-- Harvest Boar
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=180372;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
