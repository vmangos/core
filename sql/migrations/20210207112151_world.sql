DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210207112151');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210207112151');
-- Add your query below.


-- fariel starsong is not a vendor
DELETE FROM `npc_vendor` WHERE `entry` = 15909;
UPDATE `creature_template` SET `npc_flags` = 3 WHERE `entry` = 15909;

-- valadar starsong is not a vendor
DELETE FROM `npc_vendor` WHERE `entry` = 15864;
UPDATE `creature_template` SET `npc_flags` = 3 WHERE `entry` = 15864;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6917 AND `id` IN (2, 3);

-- correct reward text for elunes candle and set to not repeatable
UPDATE `quest_template` SET `OfferRewardText` = 'Very well then - I accept these coins of ancestry.  Please take Elune's candle with my blessing.  Also, please enjoy these complimentary fireworks.$b$bMay your Lunar Festival be joyous and filled with merriment, $n.$b$bAnd if you choose to face Omen and his minions, you will find Elune's candle quite useful...', `Special_Flags` = 0 WHERE `entry` = 8862;

-- add progress text for elunes blessing and set to not repeatable
UPDATE `quest_template` SET `RequestItemsText` = 'Omen yet stirs below below Lake Elune\'ara, $n...', `SpecialFlags` = 2 WHERE `entry` = 8868;


-- update elder farwhisper coords
UPDATE `creature` SET `position_x` = 3705.5, `position_y`= -3466.29, `position_z` = 130.77, `orientation` = 6.22097 WHERE `guid` = 91695

-- add lunar festival ne harbinger template
REPLACE INTO `creature_template` VALUES
(15900, 7, 15871, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Harbinger', '', 6918, 55, 55, 1830, 1830, 5013, 5013, 1644, 35, 3, 1, 1.14286, 20, 5, 0, 0, 1, 316, 316, 0, 248, 1, 2000, 2000, 8, 32768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- use auras for alliance lunar festival harbinger
INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `display_id`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(91626, 0, 0, 0, 26383, 0, 7),
(91632, 0, 0, 0, 26383, 0, 7),
(94919, 0, 0, 0, 26383, 0, 7);

-- add lunar festival ne vendor template
REPLACE INTO `creature_template` VALUES
(15899, 7, 15870, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Vendor', '', 0, 55, 55, 1830, 1830, 5013, 5013, 1644, 35, 4, 1, 1.14286, 20, 5, 0, 0, 1, 316, 316, 0, 248, 1, 2000, 2000, 8, 32768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- use auras for alliance lunar festival vendor
INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `display_id`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(91636, 0, 0, 0, 26384, 0, 7),
(91625, 0, 0, 0, 26384, 0, 7),
(91689, 0, 0, 0, 26384, 0, 7),
(94920, 0, 0, 0, 26384, 0, 7);

-- use auras for alliance lunar festival emissary
INSERT INTO `game_event_creature_data` (`guid`, `entry_id`, `display_id`, `equipment_id`, `spell_start`, `spell_end`, `event`) VALUES
(91623, 0, 0, 0, 26520, 0, 7),
(91628, 0, 0, 0, 26520, 0, 7),
(91634, 0, 0, 0, 26520, 0, 7),
(91624, 0, 0, 0, 26520, 0, 7),
(91629, 0, 0, 0, 26520, 0, 7),
(91633, 0, 0, 0, 26520, 0, 7),
(91622, 0, 0, 0, 26520, 0, 7),
(91637, 0, 0, 0, 26520, 0, 7),
(91688, 0, 0, 0, 26520, 0, 7),
(94927, 0, 0, 0, 26520, 0, 7),
(94926, 0, 0, 0, 26520, 0, 7),
(94928, 0, 0, 0, 26520, 0, 7);

-- add missing mail_loot_template
INSERT INTO `mail_loot_template` VALUES
(137, 21746, 100, 0, 1, 1, 0, 0, 10);

-- add mail template 135 to elder quests
UPDATE `quest_template` SET `RewMailDelaySec` = 86400, `RewMailTemplateId` = 135 WHERE `entry` IN (8619, 8635, 8636, 8642, 8643, 8644, 8645, 8646, 8647, 8648, 8649, 8650, 8651, 8652, 8653, 8654, 8670, 8671, 8672, 8673, 8679, 8680, 8681, 8682, 8683);

-- add mail template 137 to elder quests
UPDATE `quest_template` SET `RewMailDelaySec` = 86400, `RewMailTemplateId` = 137 WHERE `entry` IN (8685, 8686, 8688, 8713, 8714, 8715, 8716, 8717, 8718, 8719, 8720, 8721, 8722, 8723, 8724, 8725, 8726, 8727, 8866, 8678, 8674, 8675, 8676, 8677, 8684);

-- quest 8870 should only be available from creature guid 91623
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8870, 20, 7292, 50, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8870 WHERE `entry` = 8870;

-- quest 8871 should only be available from creature guid 91629
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8871, 20, 6740, 70, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8871 WHERE `entry` = 8871;

-- quest 8872 should only be available from creature guid 91688
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8872, 20, 4209, 70, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8872 WHERE `entry` = 8872;

-- quest 8873 should only be available from creature guid 91595
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8873, 20, 3309, 50, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8873 WHERE `entry` = 8873;

-- quest 8874 should only be available from creature guid 91605
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8874, 20, 2459, 10, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8874 WHERE `entry` = 8874;

-- quest 8875 should only be available from creature guid 91599
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8875, 20, 8362, 10, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8875 WHERE `entry` = 8875;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
