DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230311102830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230311102830');
-- Add your query below.


-- TEMP Foulweald Totem Mound
DELETE FROM `gameobject_template` WHERE `entry`=300131;
UPDATE `gameobject` SET `id`=178206 WHERE `id`=300131;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES
(178206, 0, 8, 327, 'Foulweald Totem Mound', 1, 1063, 7, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_foulweald_totem_mound');

-- TEMP Cliffspring River Waterfall
DELETE FROM `gameobject_template` WHERE `entry`=300132;
UPDATE `gameobject` SET `id`=175371 WHERE `id`=300132;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(175371, 0, 8, 299, 'Cliffspring River Waterfall', 1, 705, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP First Tide Pool
DELETE FROM `gameobject_template` WHERE `entry`=300133;
UPDATE `gameobject` SET `id`=152598 WHERE `id`=300133;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(152598, 0, 8, 299, 'the First Tide Pool', 1, 443, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Second Tide Pool
DELETE FROM `gameobject_template` WHERE `entry`=300134;
UPDATE `gameobject` SET `id`=152604 WHERE `id`=300134;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(152604, 0, 8, 299, 'the Second Tide Pool', 1, 444, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Third Tide Pool
DELETE FROM `gameobject_template` WHERE `entry`=300135;
UPDATE `gameobject` SET `id`=152605 WHERE `id`=300135;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(152605, 0, 8, 299, 'the Third Tide Pool', 1, 445, 13, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Fourth Tide Pool
DELETE FROM `gameobject_template` WHERE `entry`=300136;
UPDATE `gameobject` SET `id`=152606 WHERE `id`=300136;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(152606, 0, 8, 299, 'the Fourth Tide Pool', 1, 446, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Shards of Myzrael
DELETE FROM `gameobject_template` WHERE `entry`=300139;
UPDATE `gameobject` SET `id`=2705 WHERE `id`=300139;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(2705, 0, 8, 244, 'Shards of Myzrael', 3.47, 5, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP The Great Ossuary
DELETE FROM `gameobject_template` WHERE `entry`=300144;
UPDATE `gameobject` SET `id`=179746 WHERE `id`=300144;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(179746, 0, 8, 299, 'The Great Ossuary', 1, 1283, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `generic_scripts` SET `target_param1`=179746 WHERE `target_param1`=300144 && `target_type`=11;

-- TEMP Jintha'Alor Altar
DELETE FROM `gameobject_template` WHERE `entry`=300137;
UPDATE `gameobject` SET `id`=142180 WHERE `id`=300137;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(142180, 0, 8, 327, 'Jintha\'Alor Alter', 1, 263, 6, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Machine Shop
DELETE FROM `gameobject_template` WHERE `entry`=300010;

-- TEMP Nearby Tubers
DELETE FROM `locales_gameobject` WHERE `entry`=300011;
DELETE FROM `gameobject_template` WHERE `entry`=300011;
UPDATE `gameobject` SET `id`=20919 WHERE `id`=300011;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(20919, 0, 8, 327, 'Tuber Node', 1, 23, 50, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Stone of Outer Binding
DELETE FROM `gameobject_template` WHERE `entry`=300012;
UPDATE `gameobject` SET `id`=103660 WHERE `id`=300012;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(103660, 0, 8, 327, 'Stone of Outer Binding Spell Focus', 2.18, 164, 3, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Mana Rift Disturbance
DELETE FROM `gameobject_template` WHERE `entry`=300013;
UPDATE `gameobject` SET `id`=103708 WHERE `id`=300013;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(103708, 0, 8, 327, 'Mana Rift Disturbance', 1, 183, 50, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Water Purity - Silverpine
DELETE FROM `locales_gameobject` WHERE `entry`=300014;
DELETE FROM `gameobject_template` WHERE `entry`=300014;
UPDATE `gameobject` SET `id`=107044 WHERE `id`=300014;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(107044, 0, 8, 299, 'Shaman Holy Lake', 1, 225, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Pirate Ship Bilge
DELETE FROM `gameobject_template` WHERE `entry`=300015;

-- TEMP Witherbark Village
DELETE FROM `gameobject_template` WHERE `entry`=300016;
UPDATE `gameobject` SET `id`=142698 WHERE `id`=300016 && `guid`!=99874;
UPDATE `gameobject` SET `id`=142700 WHERE `id`=300016 && `guid`=99874;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
-- (142698, 0, 8, 0, 'Witherbark Village', 1, 303, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142700, 0, 8, 327, 'Witherbark Village Spell Focus 02', 3.22, 303, 25, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Shadra'Alor Altar
DELETE FROM `gameobject_template` WHERE `entry`=300017;
UPDATE `gameobject` SET `id`=142716 WHERE `id`=300017;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(142716, 0, 8, 327, 'Shadra\'Alor Altar', 2.31, 304, 7, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Hatetalon Stones
DELETE FROM `gameobject_template` WHERE `entry`=300018;
UPDATE `gameobject` SET `id`=144569 WHERE `id`=300018;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(144569, 0, 8, 327, 'Edana Hatetalon Spell Focus (DND)', 1, 343, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Sanctum of the Fallen God
DELETE FROM `gameobject_template` WHERE `entry`=300019;
UPDATE `gameobject` SET `id`=148422 WHERE `id`=300019;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(148422, 0, 8, 327, 'Evil God Spell Focus (DND)', 1, 424, 40, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Miblon Snarltooth
DELETE FROM `gameobject_template` WHERE `entry`=300020;
UPDATE `gameobject` SET `id`=164738 WHERE `id`=300020;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(164738, 0, 8, 2770, 'Miblon\'s Spell Focus (DND)', 1, 483, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Gadgetzan Graveyard
DELETE FROM `gameobject_template` WHERE `entry`=300021;
UPDATE `gameobject` SET `id`=164799 WHERE `id`=300021;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(164799, 0, 8, 2770, 'Videre Elixir Spell Focus (DND)', 1, 503, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP the ruins of Irontree Woods
DELETE FROM `gameobject_template` WHERE `entry`=300022;
UPDATE `gameobject` SET `id`=165760 WHERE `id`=300022;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(165760, 0, 8, 2770, 'Arei Spell Focus', 1, 523, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Golakka Crater
DELETE FROM `gameobject_template` WHERE `entry`=300023;
UPDATE `gameobject` SET `id`=165678 WHERE `id`=300023;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(165678, 0, 8, 327, 'Golakka Crater', 3.43, 563, 17, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP NIU Tomb of the Seven
DELETE FROM `gameobject_template` WHERE `entry`=300024;
UPDATE `gameobject` SET `id`=166807 WHERE `id`=300024;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(166807, 0, 8, 327, 'Spell Focus: Tomb of the Seven (DND)', 1, 583, 50, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Corrupted Moonwell
DELETE FROM `gameobject_template` WHERE `entry`=300025;
UPDATE `gameobject` SET `id`=148501 WHERE `id`=300025;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(148501, 0, 8, 327, 'Corrupted Moonwell Spell Focus (DND)', 1, 644, 25, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Blackwood Furbolg North Bonfire
DELETE FROM `gameobject_template` WHERE `entry`=300026;
UPDATE `gameobject` SET `id`=175338 WHERE `id`=300026;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(175338, 0, 8, 299, 'Blackwood Furbolg North Bonfire', 1, 704, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Stone of Shy-Rotam
DELETE FROM `gameobject_template` WHERE `entry`=300027;
UPDATE `gameobject` SET `id`=103819 WHERE `id`=300027;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(103819, 0, 8, 362, 'Stone of Shy-Rotam', 3, 783, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Sacred Fire of Life
DELETE FROM `gameobject_template` WHERE `entry`=300028;

-- TEMP Scarlet Crusade Forward Camp
DELETE FROM `gameobject_template` WHERE `entry`=300029;
UPDATE `gameobject` SET `id`=176088 WHERE `id`=300029;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(176088, 0, 8, 299, 'Scarlet Crusade Forward Camp', 1, 804, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Andorhal Tower
DELETE FROM `gameobject_template` WHERE `entry`=300030;
UPDATE `gameobject` SET `id`=176094 WHERE `id`=300030 && `guid`=99887;
UPDATE `gameobject` SET `id`=176095 WHERE `id`=300030 && `guid`=99886;
UPDATE `gameobject` SET `id`=176096 WHERE `id`=300030 && `guid`=99889;
UPDATE `gameobject` SET `id`=176097 WHERE `id`=300030 && `guid`=99888;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(176094, 0, 8, 299, 'Andorhal Tower One', 1, 805, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176095, 0, 8, 0, 'Andorhal Tower', 1, 805, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176096, 0, 8, 299, 'Andorhal Tower Three', 1, 805, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176097, 0, 8, 299, 'Andorhal Tower Four', 1, 805, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Scholomance Viewing Room
DELETE FROM `gameobject_template` WHERE `entry`=300031;
UPDATE `gameobject` SET `id`=176111 WHERE `id`=300031;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(176111, 0, 8, 327, 'Scholomance Viewing Room Spell Focus (DND)', 1, 823, 35, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Umi's Friend
DELETE FROM `gameobject_template` WHERE `entry`=300032;
UPDATE `gameobject` SET `id`=176193 WHERE `id`=300032;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(176193, 0, 8, 327, 'Umi Friend Spell Focus (DND)', 1, 863, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP the crate in the center of the Northridge Lumber Mill
DELETE FROM `locales_gameobject` WHERE `entry`=300033;
DELETE FROM `gameobject_template` WHERE `entry`=300033;
UPDATE `gameobject` SET `id`=177492 WHERE `id`=300033;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(177492, 0, 8, 335, 'Northridge Lumber Mill Crate', 0.1, 923, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Darrowshire Town Square
DELETE FROM `gameobject_template` WHERE `entry`=300034;
UPDATE `gameobject` SET `id`=177528 WHERE `id`=300034;
-- INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
-- (177528, 0, 8, 327, 'Darrowshire Town Square spell focus (DND)', 1, 944, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP NIU Bright Light Beam
DELETE FROM `gameobject_template` WHERE `entry`=300035;
UPDATE `gameobject` SET `id`=177584 WHERE `id`=300035;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(177584, 0, 8, 2770, 'Light Beam Spell Focus (DND)', 1, 963, 7, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP The Dead Goliaths
DELETE FROM `gameobject_template` WHERE `entry`=300036;
UPDATE `gameobject` SET `id`=177748 WHERE `id`=300036;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(177748, 0, 8, 327, 'Ghost Magnet Spell Focus (DND)', 1, 1023, 30, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Maraudon Portal
DELETE FROM `gameobject_template` WHERE `entry`=300037;
UPDATE `gameobject` SET `id`=178405 WHERE `id`=300037;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
-- (178400, 0, 8, 0, 'Maraudon Portal', 1, 1103, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178405, 0, 8, 0, 'Maraudon Spell Focus', 1, 1103, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP NIU Horde Globe of Scrying
DELETE FROM `gameobject_template` WHERE `entry`=300038;
UPDATE `gameobject` SET `id`=178439 WHERE `id`=300038;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178439, 3, 8, 5265, 'Globe of Scrying', 1, 1123, 3, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Eastern Crater
DELETE FROM `gameobject_template` WHERE `entry`=300039;
UPDATE `gameobject` SET `id`=178546 WHERE `id`=300039;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178546, 3, 8, 0, 'Guse\'s Beacon Spell Focus', 1, 1143, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Western Crater
DELETE FROM `gameobject_template` WHERE `entry`=300040;
UPDATE `gameobject` SET `id`=178548 WHERE `id`=300040;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178548, 3, 8, 0, 'Jeztor\'s Beacon Spell Focus', 1, 1144, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Snowfall Graveyard
DELETE FROM `gameobject_template` WHERE `entry`=300041;
UPDATE `gameobject` SET `id`=178550 WHERE `id`=300041;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178550, 3, 8, 0, 'Mulverick\'s Beacon Spell Focus', 1, 1145, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Alliance Globe of Scrying
DELETE FROM `gameobject_template` WHERE `entry`=300042;
UPDATE `gameobject` SET `id`=178604 WHERE `id`=300042;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178604, 3, 8, 5265, 'Globe of Scrying', 1, 1163, 3, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Dun Baldar Courtyard
DELETE FROM `gameobject_template` WHERE `entry`=300043;
UPDATE `gameobject` SET `id`=178606 WHERE `id`=300043;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178606, 3, 8, 0, 'Ryson\'s Beacon Spell Focus', 1, 1164, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Frostwolf Keep Courtyard
DELETE FROM `gameobject_template` WHERE `entry`=300044;
UPDATE `gameobject` SET `id`=178608 WHERE `id`=300044;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178608, 3, 8, 0, 'Ryson\'s Beacon Spell Focus', 1, 1165, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Snowfall Graveyard
DELETE FROM `gameobject_template` WHERE `entry`=300045;
UPDATE `gameobject` SET `id`=178729 WHERE `id`=300045;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178729, 3, 8, 0, 'Ichman\'s Beacon Spell Focus', 1, 1183, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP East Crater
DELETE FROM `gameobject_template` WHERE `entry`=300046;
UPDATE `gameobject` SET `id`=178728 WHERE `id`=300046;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178728, 3, 8, 0, 'Slidore\'s Beacon Spell Focus', 1, 1184, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP West Crater
DELETE FROM `gameobject_template` WHERE `entry`=300047;
UPDATE `gameobject` SET `id`=178727 WHERE `id`=300047;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178727, 3, 8, 0, 'Vipore\'s Beacon Spell Focus', 1, 1185, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Orange Crystal Pool
DELETE FROM `gameobject_template` WHERE `entry`=300048;
UPDATE `gameobject` SET `id`=178907 WHERE `id`=300048;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(178907, 0, 8, 2770, 'Maraudon Orange Pool Spell Focus', 1, 1203, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Kroshius' Remains
DELETE FROM `gameobject_template` WHERE `entry`=300049;
UPDATE `gameobject` SET `id`=179677 WHERE `id`=300049;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(179677, 2, 8, 0, 'Kroshius\' Remains', 1, 1243, 15, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Pedestal of Immol'thar
DELETE FROM `gameobject_template` WHERE `entry`=300050;
UPDATE `gameobject` SET `id`=179701 WHERE `id`=300050;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES
(179701, 2, 8, 327, 'Circle Loc (spell focus)', 1, 1263, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_pedestal_of_immol_thar');

-- TEMP Circle of Dark Summoning
DELETE FROM `gameobject_template` WHERE `entry`=300051;
UPDATE `gameobject` SET `id`=179675 WHERE `id`=300051;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(179675, 2, 8, 327, 'Warlock Mount Quest Portal Spell Focus', 4, 1264, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Altar of Zanza
DELETE FROM `gameobject_template` WHERE `entry`=300053;
UPDATE `gameobject` SET `id`=180375 WHERE `id`=300053;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(180375, 5, 8, 299, 'Altar of Zanza Spell Focus', 1, 1344, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Southshore
DELETE FROM `gameobject_template` WHERE `entry`=300054;
UPDATE `gameobject` SET `id`=180504 WHERE `id`=300054;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(180504, 6, 8, 299, 'Southshore Spell Focus', 1, 1345, 50, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Bones of Grakkarond
DELETE FROM `gameobject_template` WHERE `entry`=300055;
UPDATE `gameobject` SET `id`=180505 WHERE `id`=300055;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(180505, 6, 8, 0, 'Bones of Grakkarond Spell Focus', 1, 1346, 35, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Forsaken Stink Bomb
DELETE FROM `gameobject_template` WHERE `entry`=300056;

-- TEMP Voone's Chamber
DELETE FROM `gameobject_template` WHERE `entry`=300059;
UPDATE `gameobject` SET `id`=181046 WHERE `id`=300059;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181046, 8, 8, 2770, 'Mor Grayhoof Brazier Spell Focus', 1, 1354, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Alzzin's Chamber
DELETE FROM `gameobject_template` WHERE `entry`=300060;
UPDATE `gameobject` SET `id`=181047 WHERE `id`=300060;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181047, 8, 8, 2770, 'Isalien Brazier Spell Focus', 1, 1355, 40, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP The Crimson Throne
DELETE FROM `gameobject_template` WHERE `entry`=300061;
UPDATE `gameobject` SET `id`=181048 WHERE `id`=300061;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181048, 8, 8, 2770, 'Jarien and Sothos Brazier Spell Focus', 1, 1356, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Ras Frostwhisper's Chamber
DELETE FROM `gameobject_template` WHERE `entry`=300062;
UPDATE `gameobject` SET `id`=181049 WHERE `id`=300062;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181049, 8, 8, 2770, 'Kormok Brazier Spell Focus', 1, 1357, 40, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP The Beast's Chamber
DELETE FROM `gameobject_template` WHERE `entry`=300063;
UPDATE `gameobject` SET `id`=181050 WHERE `id`=300063;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181050, 8, 8, 2770, 'Lord Valthalak Brazier Spell Focus', 1, 1358, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Haunted Locus
DELETE FROM `gameobject_template` WHERE `entry`=300064;
UPDATE `gameobject` SET `id`=181052 WHERE `id`=300064 && `guid` IN (396327, 399471);
UPDATE `gameobject` SET `id`=181094 WHERE `id`=300064 && `guid` IN (396330, 396328);
UPDATE `gameobject` SET `id`=181096 WHERE `id`=300064 && `guid` IN (396329);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181052, 8, 8, 327, 'Brazier of Invocation Spell Focus 10 yd', 1, 1359, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181094, 8, 8, 327, 'Brazier of Invocation Spell Focus 40 yd', 1, 1359, 40, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181096, 8, 8, 327, 'Brazier of Invocation Spell Focus 20 yd', 1, 1359, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Blackrock Depths Arena
DELETE FROM `gameobject_template` WHERE `entry`=300065;
UPDATE `gameobject` SET `id`=181059 WHERE `id`=300065;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181059, 8, 8, 2770, 'Blackrock Depths Arena Thelrin Focus', 1, 1360, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP [PH] Crystal Corpse
DELETE FROM `gameobject_template` WHERE `entry`=300066;
UPDATE `gameobject` SET `id`=181113 WHERE `id`=300066;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(181113, 9, 8, 2770, 'Crystal Corpse', 1, 1361, 10, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Underground Water Source
DELETE FROM `gameobject_template` WHERE `entry`=300078;
DELETE FROM `gameobject` WHERE `id`=300078;

-- TEMP High Chief Winterfall's Cave
DELETE FROM `gameobject_template` WHERE `entry`=300141;
UPDATE `gameobject` SET `id`=180673 WHERE `id`=300141;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(180673, 7, 8, 299, 'High Chief Winterfall Cave Mouth Spell Focus', 1, 1350, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Shrine of Remulos
DELETE FROM `gameobject_template` WHERE `entry`=300142;
UPDATE `gameobject` SET `id`=177788 WHERE `id`=300142;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(177788, 0, 8, 299, 'Shrine of Remulos', 1, 1043, 20, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- TEMP Swamplight Manor Dock
DELETE FROM `gameobject_template` WHERE `entry`=300143;
DELETE FROM `gameobject` WHERE `id`=300143;

-- TEMP Blackhoof Village Windmill
DELETE FROM `gameobject_template` WHERE `entry`=300149;
DELETE FROM `gameobject` WHERE `id`=300149;

-- TEMP Grimtotem Tent
DELETE FROM `gameobject_template` WHERE `entry`=300150;
DELETE FROM `gameobject` WHERE `id`=300150;

-- TEMP Hyjal Family Monument
DELETE FROM `gameobject_template` WHERE `entry`=300151;
DELETE FROM `gameobject` WHERE `id`=300151;

-- TEMP Entrance to Onyxia's Lair
DELETE FROM `gameobject_template` WHERE `entry`=300153;
DELETE FROM `gameobject` WHERE `id`=300153;

-- TEMP Un'Goro Flat Rock
DELETE FROM `locales_gameobject` WHERE `entry`=300119;
DELETE FROM `gameobject_template` WHERE `entry`=300119;
UPDATE `gameobject` SET `id`=172619 WHERE `id`=300119;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`) VALUES
(172619, 0, 8, 299, 'Un\'Goro Flat Rock', 2, 603, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
