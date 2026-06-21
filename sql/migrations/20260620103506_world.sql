DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260620103506');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260620103506');
-- Add your query below.


-- Dwarven Brazier
DELETE FROM `gameobject_template` WHERE `entry` IN (26499, 171696, 171697, 171698, 176624, 176625, 176626, 176627, 176628, 176629);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(26499, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171696, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171697, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171698, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176624, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176625, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176626, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176627, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176628, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176629, 0, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(26499, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171696, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171697, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(171698, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176624, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176625, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176626, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176627, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176628, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(176629, 1, 8, 197, 'Dwarven Brazier', '', 0, 0, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Campfire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=1927;

-- Lucius's Lockbox
DELETE FROM `gameobject_template` WHERE `entry`=121264;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (121264, 0, 3, 41, 'Lucius\'s Lockbox', '', 0, 6, 1, 24, 5026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (121264, 1, 3, 41, 'Lucius\'s Lockbox', '', 0, 6, 1, 23, 5026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Wooden Chairs
DELETE FROM `gameobject_template` WHERE `entry` IN (174995, 174997, 174998, 174994, 174996);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `icon`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES 
(174994, 0, 7, 39, 'Doodad_GeneralChairLoEnd02', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174994, 1, 7, 39, 'Wooden Chair', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174995, 0, 7, 39, 'Doodad_GeneralChairLoEnd03', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174995, 1, 7, 39, 'Wooden Chair', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174996, 0, 7, 39, 'Doodad_GeneralChairLoEnd04', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174996, 1, 7, 39, 'Wooden Chair', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174997, 0, 7, 39, 'Doodad_GeneralChairLoEnd05', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174997, 1, 7, 39, 'Wooden Chair', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174998, 0, 7, 39, 'Doodad_GeneralChairLoEnd06', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(174998, 1, 7, 39, 'Wooden Chair', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Mighty Blaze
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=173229;

-- Mighty Blaze
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=173230;

-- Mighty Blaze
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=173228;

-- Mighty Blaze
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=173231;

-- Mighty Blaze
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=173126;

-- Roaring Fire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=164700;

-- Roaring Fire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=164701;

-- Blazing Fire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=164702;

-- Blazing Fire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=164703;

-- Blazing Fire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=164705;

-- Lamppost
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=57750;

-- Lamppost
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=57749;

-- Lamppost
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=57751;

-- Lamppost
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=57753;

-- Lamppost
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2061 /*linkedTrapId*/ WHERE `entry`=57752;

-- Bonfire
UPDATE `gameobject_template` SET `data0` = 4 /*focusId*/, `data2` = 2066 /*linkedTrapId*/ WHERE `entry`=176505;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
