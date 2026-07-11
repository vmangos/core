DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260618213829');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260618213829');
-- Add your query below.


-- Guarded Thunderbrew ale barrel
UPDATE `gameobject_template` SET `name`='Guarded Thunderbrew ale barrel' WHERE `entry`=269 AND `patch`=0;

-- Alchemy Lab
DELETE FROM `gameobject_template` WHERE `entry`=180631;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180631, 6, 8, 6467, 'Alchemy Lab', '', 0, 0, 1, 633, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180631, 7, 8, 6467, 'Alchemy Lab', '', 0, 0, 1, 663, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Unguarded Thunderbrew ale barrel
DELETE FROM `gameobject_template` WHERE `entry`=270;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (270, 0, 2, 32, 'Unguarded Thunderbrew ale barrel', '', 84, 68, 1, 0, 193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (270, 7, 2, 32, 'Unguarded Thunder Ale Barrel', '', 84, 68, 1, 0, 193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Xabraxxis' Demon Bag
UPDATE `gameobject_template` SET `data15` = 0 /*groupLootRules*/ WHERE `entry`=177624;

-- Practice Lockbox
DELETE FROM `gameobject_template` WHERE `entry`=178245;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (178245, 0, 3, 10, 'Practice Lockbox', '', 0, 2, 1, 5, 0, 0, 1, 0, 0, 0, 123355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (178245, 7, 3, 10, 'Practice Lockbox', '', 0, 2, 1, 5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Present
DELETE FROM `gameobject_template` WHERE `entry` IN (178428, 178432, 178429, 178433, 178430, 178431);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(178428, 0, 5, 5254, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178429, 0, 5, 5255, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178430, 0, 5, 5256, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178431, 0, 5, 5257, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178432, 0, 5, 5258, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178433, 0, 5, 5259, 'Present', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178428, 7, 5, 5254, 'XMasGift01', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178429, 7, 5, 5255, 'XMasGift02', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178430, 7, 5, 5256, 'XMasGift03', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178431, 7, 5, 5257, 'XMasGift04', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178432, 7, 5, 5258, 'XMasGift05', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178433, 7, 5, 5259, 'XMasGift06', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Stocking
DELETE FROM `gameobject_template` WHERE `entry` IN (178434, 178435, 178436);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(178434, 0, 5, 5260, 'Stocking', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178435, 0, 5, 5261, 'Stocking', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178436, 0, 5, 5262, 'Stocking', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178434, 7, 5, 5260, 'XMasStocking01', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178435, 7, 5, 5261, 'XMasStocking02', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(178436, 7, 5, 5262, 'XMasStocking03', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- DANGER! Do Not Open! Move Along!
DELETE FROM `gameobject_template` WHERE `entry`=178324;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (178324, 0, 6, 2770, 'DANGER! Do Not Open! Move Along!', '', 114, 0, 1, 95, 20, 0, 21078, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (178324, 7, 6, 2770, 'DANGER! Do Not Open! Move Along!', '', 114, 0, 1, 95, 42, 0, 21078, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- The Demon Seed
UPDATE `gameobject_template` SET `data3` = 65536000 /*autoCloseTime*/, `data5` = 0 /*consumable*/ WHERE `entry`=3524;

-- Circle of Imprisonment
UPDATE `gameobject_template` SET `data1` = -1 /*questId*/ WHERE `entry`=19901;

-- Kadrak Flag Spell Focus (DND)
UPDATE `gameobject_template` SET `name` = 'Kadrak Flag Spell Focus (DND)' WHERE `entry`=152093;

-- Mound of Dirt
UPDATE `gameobject_template` SET `data1` = -1 /*questId*/ WHERE `entry`=19030;

-- Thermaplugg's Safe
UPDATE `gameobject_template` SET `data15` = 0 /*groupLootRules*/ WHERE `entry`=142477;

-- Cleansed Night Dragon
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2247, 2957, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2281, 2957, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2284, 2957, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2303, 2957, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=164881;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164881, 0, 2, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 0, 0, 0, 2247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164881, 7, 10, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 43, 0, 293, 0, 0, 0, 0, 0, 0, 0, 15344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=173325;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (173325, 0, 2, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 0, 0, 0, 2281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (173325, 7, 10, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 43, 0, 4178, 0, 0, 0, 0, 0, 0, 0, 15344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174609;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174609, 0, 2, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 0, 0, 0, 2284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174609, 7, 10, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 43, 0, 4247, 0, 0, 0, 0, 0, 0, 0, 15344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174685;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174685, 0, 2, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 0, 0, 0, 2303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174685, 7, 10, 3252, 'Cleansed Night Dragon', '', 0, 0, 2, 43, 0, 4265, 0, 0, 0, 0, 0, 0, 0, 15344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Cleansed Songflower
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2241, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2243, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2244, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2285, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2286, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2287, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2288, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2289, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2307, 2953, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2308, 2953, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=164882;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164882, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164882, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4059, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=171940;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (171940, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (171940, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 259, 0, 4079, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=171943;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (171943, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (171943, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4083, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174610;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174610, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174610, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4215, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174612;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174612, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174612, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4216, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174613;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174613, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174613, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4217, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174614;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174614, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174614, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4218, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174615;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174615, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174615, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4219, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174714;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174714, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174714, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4276, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174715;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174715, 0, 2, 3232, 'Cleansed Songflower', '', 0, 0, 2, 0, 0, 0, 2308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174715, 7, 10, 3232, 'Cleansed Songflower', '', 0, 0, 2, 43, 0, 4280, 0, 0, 0, 0, 0, 0, 0, 15366, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Cleansed Whipper Root
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2246, 2956, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2296, 2956, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2297, 2956, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2298, 2956, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2299, 2956, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2302, 2956, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=164883;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164883, 0, 2, 3255, 'Cleansed Whipper Root', '', 35, 0, 2, 0, 0, 0, 2246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164883, 7, 10, 3255, 'Cleansed Whipper Root', '', 35, 0, 2, 43, 0, 4118, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174622;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174622, 0, 2, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 0, 0, 0, 2296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174622, 7, 10, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 43, 0, 4234, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174623;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174623, 0, 2, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 0, 0, 0, 2297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174623, 7, 10, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 43, 0, 4235, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174624;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174624, 0, 2, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 0, 0, 0, 2298, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174624, 7, 10, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 43, 0, 4236, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174625;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174625, 0, 2, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 0, 0, 0, 2299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174625, 7, 10, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 43, 0, 4237, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174687;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174687, 0, 2, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 0, 0, 0, 2302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174687, 7, 10, 3255, 'Cleansed Whipper Root', '', 0, 0, 2, 43, 0, 4260, 0, 0, 0, 0, 0, 0, 0, 15343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Cleansed Windblossom
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2245, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2282, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2290, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2291, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2292, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2293, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2294, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2295, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2309, 2955, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (2310, 2955, 0, 0);
DELETE FROM `gameobject_template` WHERE `entry`=164884;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164884, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (164884, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4102, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=173326;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (173326, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (173326, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4185, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174616;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174616, 0, 2, 3254, 'Cleansed Windblossom', '', 35, 0, 1, 0, 0, 0, 2290, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174616, 7, 10, 3254, 'Cleansed Windblossom', '', 35, 0, 1, 259, 0, 4192, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174617;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174617, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174617, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4193, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174618;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174618, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174618, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4194, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174619;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174619, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174619, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 259, 0, 4195, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174620;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174620, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174620, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4196, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174621;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174621, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174621, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4197, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174710;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174710, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174710, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4284, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template` WHERE `entry`=174711;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174711, 0, 2, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 0, 0, 0, 2310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (174711, 7, 10, 3254, 'Cleansed Windblossom', '', 0, 0, 2, 43, 0, 4288, 0, 0, 0, 0, 0, 0, 0, 15342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Option text is made up since we don't have data.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2247, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15344, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2281, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15344, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2284, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15344, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2303, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15344, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2241, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2243, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2244, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2285, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2286, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2287, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2288, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2289, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2307, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2308, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15366, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2246, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2296, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2297, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2298, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2299, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2302, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15343, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2245, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2282, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2290, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2291, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2292, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2293, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2294, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2295, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2309, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2310, 0, 0, '<Take the fruit.>', 0, 1, 1, -1, 0, 15342, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=15344;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15344, 0, 0, 15, 15344, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Night Dragon - Cast Spell Create Night Dragon\'s Breath'),
(15344, 0, 1, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Night Dragon - Remove Object');
DELETE FROM `gossip_scripts` WHERE `id`=15366;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15366, 0, 0, 15, 15366, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Songflower - Cast Spell Songflower Serenade'),
(15366, 0, 1, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Songflower - Remove Object');
DELETE FROM `gossip_scripts` WHERE `id`=15343;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15343, 0, 0, 15, 15343, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Whipper Root - Cast Spell Create Whipper Root Tubers'),
(15343, 0, 1, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Whipper Root - Remove Object');
DELETE FROM `gossip_scripts` WHERE `id`=15342;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15342, 0, 0, 15, 15342, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Windblossom - Cast Spell Create Windblossom Berries'),
(15342, 0, 1, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cleansed Windblossom - Remove Object');

-- Knot Thimblejack's Cache
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=179501;

-- Dirt-stained Map
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=3076;

-- Benedict's Chest
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=3239;

-- Kolkar's Booty
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=152618;

-- Doodad_Ahn_Qiraj_DoorPlug01
UPDATE `gameobject_template` SET `name` = 'Doodad_Ahn_Qiraj_DoorPlug01' WHERE `entry`=176146;

-- Dwarven Campfire
UPDATE `gameobject_template` SET `name` = 'Dwarven Campfire' WHERE `entry`=48404;

-- Gong
DELETE FROM `gameobject_template` WHERE `entry`=148917;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (148917, 0, 10, 2372, '', '', 0, 0, 1, 0, 0, 3130, 196608, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gong');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (148917, 7, 10, 2372, 'Gong', '', 0, 0, 1, 0, 0, 3130, 196608, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gong');

-- Matrix Punchograph 3005-A
UPDATE `gameobject_template` SET `data0` = 93 /*lockId*/ WHERE `entry`=142345;

-- Matrix Punchograph 3005-D
UPDATE `gameobject_template` SET `data0` = 93 /*lockId*/ WHERE `entry`=142696;

-- Fel Reaver Energy Matrix
DELETE FROM `gameobject_template` WHERE `entry`=184862;
DELETE FROM `locales_gameobject` WHERE `entry`=184862;

-- Witch Doctor's Chest
DELETE FROM `gameobject_template` WHERE `entry`=141596;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (141596, 0, 3, 259, 'Witch Doctor\'s Chest', '', 0, 0, 1, 43, 8498, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (141596, 7, 3, 259, 'Witch Doctor\'s Chest', '', 0, 0, 1, 57, 8498, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Large Mithril Bound Chest
UPDATE `gameobject_template` SET `data9` = 0 /*level*/, `data15` = 0 /*groupLootRules*/ WHERE `entry`=153468;

-- Gauntlet Gate
DELETE FROM `gameobject_template` WHERE `entry`=175357;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175357, 0, 0, 3614, 'Gauntlet Gate', '', 0, 0, 1, 0, 879, 655360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gauntlet_gate');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175357, 7, 0, 3614, 'Gauntlet Gate', '', 0, 0, 1, 0, 879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gauntlet_gate');

-- Gauntlet Gate
DELETE FROM `gameobject_template` WHERE `entry`=175356;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175356, 0, 0, 3614, 'Gauntlet Gate', '', 0, 34, 1, 0, 879, 655360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175356, 7, 0, 3614, 'Gauntlet Gate', '', 0, 34, 1, 0, 879, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Angelista's Botique
DELETE FROM `gameobject_template` WHERE `entry`=175470;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175470, 0, 5, 3671, 'Angelista\'s Botique', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (175470, 7, 5, 3671, 'Angelista\'s Boutique', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- The Shadowforge Lock
DELETE FROM `gameobject_template` WHERE `entry`=161460;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (161460, 0, 1, 2851, 'The Shadowforge Lock', '', 0, 0, 1, 0, 759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (161460, 7, 0, 2851, 'The Shadowforge Lock', '', 0, 34, 1, 0, 680, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Lard's Picnic Basket
UPDATE `gameobject_template` SET `data3` = 196608 /*autoCloseTime*/ WHERE `entry`=179910;

-- Campfire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=176786;

-- Atal'ai Artifact
DELETE FROM `gameobject_template` WHERE `entry` IN (30854, 30855, 30856);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30854, 0, 3, 651, 'Atal\'ai Artifact', '', 29, 4, 1, 43, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30854, 7, 3, 651, 'Atal\'ai Artifact', '', 29, 4, 1, 57, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30855, 0, 3, 652, 'Atal\'ai Artifact', '', 29, 4, 1, 43, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30855, 7, 3, 652, 'Atal\'ai Artifact', '', 29, 4, 1, 57, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30856, 0, 3, 653, 'Atal\'ai Artifact', '', 29, 4, 0.1, 43, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (30856, 7, 3, 653, 'Atal\'ai Artifact', '', 29, 4, 0.1, 57, 3598, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Gong of Bethekk
DELETE FROM `gameobject_template` WHERE `entry`=180526;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180526, 5, 10, 1827, 'Gong of Bethekk', '', 0, 0, 1, 0, 0, 9066, 196608, 0, 0, 0, 0, 0, 0, 24967, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gong_of_bethekk');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (180526, 7, 10, 1827, 'Gong of Bethekk', '', 0, 0, 1, 0, 0, 9066, 196608, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_gong_of_bethekk');

-- Dark Cleric Salem's Chest
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=178464;

-- Waterlogged Footlocker
UPDATE `gameobject_template` SET `data9` = 0 /*level*/ WHERE `entry`=179491;

-- Corrupted Windblossom
UPDATE `gameobject_template` SET `data1` = 3614 /*questList*/ WHERE `entry`=174599;

-- Corrupted Windblossom
UPDATE `gameobject_template` SET `data1` = 3619 /*questList*/ WHERE `entry`=174604;

-- Brazier of Pain
UPDATE `gameobject_template` SET `data1` = -1 /*questId*/ WHERE `entry`=176158;

-- Corrupted Night Dragon
UPDATE `gameobject_template` SET `data1` = 3356 /*questList*/ WHERE `entry`=164885;

-- Corrupted Whipper Root
UPDATE `gameobject_template` SET `data1` = 3353 /*questList*/ WHERE `entry`=164888;

-- Corrupted Songflower
UPDATE `gameobject_template` SET `data1` = 3553 /*questList*/ WHERE `entry`=171939;

-- Tome of Mel'Thandris
UPDATE `gameobject_template` SET `data1` = -1 /*questId*/ WHERE `entry`=19027;

-- Doodad_Ahn_Qiraj_DoorRoots01
UPDATE `gameobject_template` SET `name` = 'Doodad_Ahn_Qiraj_DoorRoots01' WHERE `entry`=176147;

-- Doodad_Ahn_Qiraj_DoorRunes01
UPDATE `gameobject_template` SET `name` = 'Doodad_Ahn_Qiraj_DoorRunes01' WHERE `entry`=176148;

-- Brazier
DELETE FROM `gameobject_template` WHERE `entry` IN (180473, 180474, 180475, 180476, 180477, 180478, 180479, 180480);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(180473, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180473, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180474, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180474, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180475, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180475, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180476, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180476, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180477, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180477, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180478, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180478, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180479, 6, 10, 475, 'Brazier', '', 0, 0, 0.671141, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180479, 7, 5, 475, 'Brazier', '', 0, 0, 0.671141, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180480, 6, 10, 475, 'Brazier', '', 0, 0, 1, 0, 0, 0, 196608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(180480, 7, 5, 475, 'Brazier', '', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
