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

-- gossip menu option 6917 should only be available when quest 8868 is in players log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8868, 9, 8868, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `condition_id`= 8868 WHERE `menu_id` = 6917 AND `id` = 0;

-- correct reward text for elunes candle and set to not repeatable
UPDATE `quest_template` SET `OfferRewardText` = 'Very well then - I accept these coins of ancestry.  Please take Elune\'s candle with my blessing.  Also, please enjoy these complimentary fireworks.$b$bMay your Lunar Festival be joyous and filled with merriment, $n.$b$bAnd if you choose to face Omen and his minions, you will find Elune\'s candle quite useful...', `SpecialFlags` = 0 WHERE `entry` = 8862;

-- add progress text for elunes blessing and set to not repeatable
UPDATE `quest_template` SET `OfferRewardEmote1` = 2, `RequestItemsText` = 'Omen yet stirs below below Lake Elune\'ara, $n...', `SpecialFlags` = 2 WHERE `entry` = 8868;

-- update elder farwhisper coords
UPDATE `creature` SET `position_x` = 3705.5, `position_y`= -3466.29, `position_z` = 130.77, `orientation` = 6.22097 WHERE `guid` = 91695;

-- update elder winterhoof coords
UPDATE `creature` SET `position_x` = -14327.47, `position_y`= 458.7897, `position_z` = 7.9709, `orientation` = 2.669944 WHERE `guid` = 91562;

-- correct male tauren elders scale
UPDATE `creature_template` SET `display_scale1` = 1.35 WHERE `entry` IN (15581, 15575, 15586, 15588, 15584, 15583, 15574, 15580, 15576);

-- correct female tauren elders scale
UPDATE `creature_template` SET `display_scale1` = 1.25 WHERE `entry` IN (15572, 15587, 15573, 15582, 15579, 15585, 15577, 15578);

-- correct bluffwatcher scale
UPDATE `creature_template` SET `display_scale1` = 1.35, `display_scale3` = 1.35 WHERE `entry` = 3084;

-- correct storm shadowhoof scale
UPDATE `creature_template` SET `display_scale1` = 1.35 WHERE `entry` = 10303;

-- correct mor grayhoof scale
UPDATE `creature_template` SET `display_scale1` = 1.35 WHERE `entry` = 16080;

-- correct male tauren moonglade warden scale
UPDATE `creature_template` SET `display_scale1` = 1.35 WHERE `entry` = 11822;

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
(84, 21746, 100, 0, 1, 1, 0, 0, 10),
(85, 21746, 100, 0, 1, 1, 0, 0, 10),
(86, 21746, 100, 0, 1, 1, 0, 0, 10),
(88, 21746, 100, 0, 1, 1, 0, 0, 10),
(89, 21746, 100, 0, 1, 1, 0, 0, 10),
(90, 21746, 100, 0, 1, 1, 0, 0, 10),
(91, 21746, 100, 0, 1, 1, 0, 0, 10),
(92, 21746, 100, 0, 1, 1, 0, 0, 10),
(95, 21746, 100, 0, 1, 1, 0, 0, 10),
(96, 21746, 100, 0, 1, 1, 0, 0, 10),
(97, 21746, 100, 0, 1, 1, 0, 0, 10),
(121, 21746, 100, 0, 1, 1, 0, 0, 10),
(124, 21746, 100, 0, 1, 1, 0, 0, 10),
(125, 21746, 100, 0, 1, 1, 0, 0, 10),
(126, 21746, 100, 0, 1, 1, 0, 0, 10),
(127, 21746, 100, 0, 1, 1, 0, 0, 10),
(128, 21746, 100, 0, 1, 1, 0, 0, 10),
(129, 21746, 100, 0, 1, 1, 0, 0, 10),
(130, 21746, 100, 0, 1, 1, 0, 0, 10),
(131, 21746, 100, 0, 1, 1, 0, 0, 10),
(132, 21746, 100, 0, 1, 1, 0, 0, 10),
(133, 21746, 100, 0, 1, 1, 0, 0, 10),
(134, 21746, 100, 0, 1, 1, 0, 0, 10),
(136, 21746, 100, 0, 1, 1, 0, 0, 10),
(137, 21746, 100, 0, 1, 1, 0, 0, 10),
(138, 21746, 100, 0, 1, 1, 0, 0, 10),
(139, 21746, 100, 0, 1, 1, 0, 0, 10),
(140, 21746, 100, 0, 1, 1, 0, 0, 10),
(141, 21746, 100, 0, 1, 1, 0, 0, 10),
(142, 21746, 100, 0, 1, 1, 0, 0, 10),
(143, 21746, 100, 0, 1, 1, 0, 0, 10),
(144, 21746, 100, 0, 1, 1, 0, 0, 10),
(145, 21746, 100, 0, 1, 1, 0, 0, 10),
(146, 21746, 100, 0, 1, 1, 0, 0, 10),
(147, 21746, 100, 0, 1, 1, 0, 0, 10),
(148, 21746, 100, 0, 1, 1, 0, 0, 10),
(149, 21746, 100, 0, 1, 1, 0, 0, 10),
(150, 21746, 100, 0, 1, 1, 0, 0, 10),
(151, 21746, 100, 0, 1, 1, 0, 0, 10),
(152, 21746, 100, 0, 1, 1, 0, 0, 10),
(153, 21746, 100, 0, 1, 1, 0, 0, 10),
(154, 21746, 100, 0, 1, 1, 0, 0, 10),
(155, 21746, 100, 0, 1, 1, 0, 0, 10),
(156, 21746, 100, 0, 1, 1, 0, 0, 10),
(157, 21746, 100, 0, 1, 1, 0, 0, 10),
(158, 21746, 100, 0, 1, 1, 0, 0, 10),
(159, 21746, 100, 0, 1, 1, 0, 0, 10),
(160, 21746, 100, 0, 1, 1, 0, 0, 10),
(168, 21746, 100, 0, 1, 1, 0, 0, 10);

-- remove incorrect mail reward template 
UPDATE `quest_template` SET `RewMailTemplateId` = 0 WHERE `entry` = 8864;

-- set correct mail delay to elder quests
UPDATE `quest_template` SET `RewMailDelaySecs` = 86400, `RewMailTemplateId` = 137 WHERE `entry` IN (8685, 8686, 8688, 8713, 8714, 8715, 8716, 8717, 8718, 8719, 8720, 8721, 8722, 8723, 8724, 8725, 8726, 8727, 8866, 8678, 8674, 8675, 8676, 8677, 8684, 8619, 8635, 8636, 8642, 8643, 8644, 8645, 8646, 8647, 8648, 8649, 8650, 8651, 8652, 8653, 8654, 8670, 8671, 8672, 8673, 8679, 8680, 8681, 8682, 8683);

-- link mail templates to quests
UPDATE `quest_template` SET `RewMailTemplateId` = 84 WHERE `entry` = 8619;
UPDATE `quest_template` SET `RewMailTemplateId` = 85 WHERE `entry` = 8645;
UPDATE `quest_template` SET `RewMailTemplateId` = 86 WHERE `entry` = 8719;
UPDATE `quest_template` SET `RewMailTemplateId` = 88 WHERE `entry` = 8676;
UPDATE `quest_template` SET `RewMailTemplateId` = 89 WHERE `entry` = 8686;
UPDATE `quest_template` SET `RewMailTemplateId` = 90 WHERE `entry` = 8636;
UPDATE `quest_template` SET `RewMailTemplateId` = 91 WHERE `entry` = 8679;
UPDATE `quest_template` SET `RewMailTemplateId` = 92 WHERE `entry` = 8643;
UPDATE `quest_template` SET `RewMailTemplateId` = 95 WHERE `entry` = 8688;
UPDATE `quest_template` SET `RewMailTemplateId` = 96 WHERE `entry` = 8653;
UPDATE `quest_template` SET `RewMailTemplateId` = 97 WHERE `entry` = 8650;
UPDATE `quest_template` SET `RewMailTemplateId` = 121 WHERE `entry` = 8723;
UPDATE `quest_template` SET `RewMailTemplateId` = 124 WHERE `entry` = 8727;
UPDATE `quest_template` SET `RewMailTemplateId` = 125 WHERE `entry` = 8685;
UPDATE `quest_template` SET `RewMailTemplateId` = 126 WHERE `entry` = 8648;
UPDATE `quest_template` SET `RewMailTemplateId` = 127 WHERE `entry` = 8866;
UPDATE `quest_template` SET `RewMailTemplateId` = 128 WHERE `entry` = 8635;
UPDATE `quest_template` SET `RewMailTemplateId` = 129 WHERE `entry` = 8654;
UPDATE `quest_template` SET `RewMailTemplateId` = 130 WHERE `entry` = 8715;
UPDATE `quest_template` SET `RewMailTemplateId` = 131 WHERE `entry` = 8725;
UPDATE `quest_template` SET `RewMailTemplateId` = 132 WHERE `entry` = 8714;
UPDATE `quest_template` SET `RewMailTemplateId` = 133 WHERE `entry` = 8651;
UPDATE `quest_template` SET `RewMailTemplateId` = 134 WHERE `entry` = 8722;
UPDATE `quest_template` SET `RewMailTemplateId` = 135 WHERE `entry` = 8642;
UPDATE `quest_template` SET `RewMailTemplateId` = 136 WHERE `entry` = 8644;
UPDATE `quest_template` SET `RewMailTemplateId` = 138 WHERE `entry` = 8721;
UPDATE `quest_template` SET `RewMailTemplateId` = 139 WHERE `entry` = 8682;
UPDATE `quest_template` SET `RewMailTemplateId` = 140 WHERE `entry` = 8649;
UPDATE `quest_template` SET `RewMailTemplateId` = 141 WHERE `entry` = 8670;
UPDATE `quest_template` SET `RewMailTemplateId` = 142 WHERE `entry` = 8717;
UPDATE `quest_template` SET `RewMailTemplateId` = 143 WHERE `entry` = 8718;
UPDATE `quest_template` SET `RewMailTemplateId` = 144 WHERE `entry` = 8677;
UPDATE `quest_template` SET `RewMailTemplateId` = 145 WHERE `entry` = 8675;
UPDATE `quest_template` SET `RewMailTemplateId` = 146 WHERE `entry` = 8683;
UPDATE `quest_template` SET `RewMailTemplateId` = 147 WHERE `entry` = 8713;
UPDATE `quest_template` SET `RewMailTemplateId` = 148 WHERE `entry` = 8647;
UPDATE `quest_template` SET `RewMailTemplateId` = 149 WHERE `entry` = 8716;
UPDATE `quest_template` SET `RewMailTemplateId` = 150 WHERE `entry` = 8726;
UPDATE `quest_template` SET `RewMailTemplateId` = 151 WHERE `entry` = 8724;
UPDATE `quest_template` SET `RewMailTemplateId` = 152 WHERE `entry` = 8720;
UPDATE `quest_template` SET `RewMailTemplateId` = 153 WHERE `entry` = 8681;
UPDATE `quest_template` SET `RewMailTemplateId` = 154 WHERE `entry` = 8646;
UPDATE `quest_template` SET `RewMailTemplateId` = 155 WHERE `entry` = 8652;
UPDATE `quest_template` SET `RewMailTemplateId` = 156 WHERE `entry` = 8672;
UPDATE `quest_template` SET `RewMailTemplateId` = 157 WHERE `entry` = 8673;
UPDATE `quest_template` SET `RewMailTemplateId` = 158 WHERE `entry` = 8674;
UPDATE `quest_template` SET `RewMailTemplateId` = 159 WHERE `entry` = 8684;
UPDATE `quest_template` SET `RewMailTemplateId` = 160 WHERE `entry` = 8680;
UPDATE `quest_template` SET `RewMailTemplateId` = 168 WHERE `entry` = 8671;

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
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8874, 20, 2459, 20, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8874 WHERE `entry` = 8874;

-- quest 8875 should only be available from creature guid 91599
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8875, 20, 8362, 20, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition` = 8875 WHERE `entry` = 8875;

-- moonglade revelers should launch fireworks
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220584, 52, 220584, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590709, 15907, 220584, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1590709, 0, 0, 'Undercity Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590709, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Undercity Reveler - Cast Small Red Rocket');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220574, 52, 220574, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590609, 15906, 220574, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1590609, 0, 0, 'Ironforge Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590609, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironforge Reveler - Cast Small Red Rocket');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220590, 52, 220590, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1569409, 15694, 220590, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1569409, 0, 0, 'Stormwind Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1569409, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stormwind Reveler - Cast Small Red Rocket');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220554, 52, 220554, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1571909, 15719, 220554, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1571909, 0, 0, 'Thunder Bluff Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1571909, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunder Bluff Reveler - Cast Small Red Rocket');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220577, 52, 220577, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590509, 15905, 220577, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1590509, 0, 0, 'Darnassus Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590509, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darnassus Reveler - Cast Small Red Rocket');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (220558, 52, 220558, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1590809, 15908, 220558, 1, 0, 100, 1, 10000, 15000, 10000, 15000, 1590809, 0, 0, 'Orgrimmar Reveler - Cast Small Red Rocket OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1590809, 0, 15, 26286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orgrimmar Reveler - Cast Small Red Rocket');

-- add trick - critter template
INSERT INTO `creature_template` VALUES
(15219, 0, 6296, 5556, 10992, 11009, 1, 1, 1, 1, 1, 1, 1, 1, 4, 0, 'Trick - Critter', '', 0, 1, 1, 42, 42, 0, 0, 15, 188, 0, 1, 0, 20, 0, 0, 0, 0, 2, 2, 0, 9, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '');

-- Love is in the Air breadcrumb quests should be in exclusive group
UPDATE `quest_template` SET `ExclusiveGroup` = 8897 WHERE `entry` IN (8897, 8899, 8898);
UPDATE `quest_template` SET `ExclusiveGroup` = 8900 WHERE `entry` IN (8900, 8901, 8902);

-- allow quest elunes blessing to complete
DELETE FROM `spell_scripts` WHERE `id`=26393;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (26393, 0, 15, 26394, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Blessing: Target - Cast Elune\'s BLessing (quest credit)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
