DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190727181416');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190727181416');
-- Add your query below.


-- Elder Stormbrow (Entry: 15565)
UPDATE `creature_template` SET `gossip_menu_id` = 6821, `npc_flags` = 2+1 WHERE `entry` = 15565;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6821;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6821, 0, 0, "Where is Elder Hammershout?", 11550, 1, 1, 6873, 0, 0, 6873),
(6821, 1, 0, "Where is Elder Rumblerock?", 11534, 1, 1, 6865, 0, 0, 6865),
(6821, 2, 0, "Where is Elder Skychaser?", 11546, 1, 1, 45000, 0, 0, 45000),
(6821, 3, 0, "Where is Elder Starsong?", 11537, 1, 1, 6867, 0, 0, 6867);
DELETE FROM `gossip_menu` WHERE `entry` IN (6821, 6873, 6865, 45000, 6867);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6821, 7933, 0),
(6873, 8174, 0),
(6865, 8168, 0),
(45000, 8172, 0),
(6867, 8169, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6873, 22, 8646, 0, 0, 0, 0), -- Quest ID: 8646 - Not taken & Not rewarded
(6865, 22, 8636, 0, 0, 0, 0), -- Quest ID: 8636 - Not taken & Not rewarded
(45000, 22, 8675, 0, 0, 0, 0), -- Quest ID: 8675 - Not taken & Not rewarded
(6867, 22, 8713, 0, 0, 0, 0); -- Quest ID: 8713 - Not taken & Not rewarded
-- Elder Hammershout (Entry: 15562)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91630;
UPDATE `creature_template` SET `gossip_menu_id` = 6833, `npc_flags` = 2+1 WHERE `entry` = 15562;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6833;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6833, 0, 0, "Where is Elder Bladeswift?", 11554, 1, 1, 6876, 0, 0, 6876),
(6833, 1, 0, "Where is Elder Bronzebeard?", 11512, 1, 1, 6858, 0, 0, 6858),
(6833, 2, 0, "Where is Elder Rumblerock?", 11534, 1, 1, 6865, 0, 0, 6865),
(6833, 3, 0, "Where is Elder Stormbrow?", 11542, 1, 1, 6868, 0, 0, 6868);
DELETE FROM `gossip_menu` WHERE `entry` IN (6833, 6876, 6858, 6868);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6833, 7933, 0),
(6876, 8176, 0),
(6858, 8162, 0),
(6868, 8170, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6876, 22, 8718, 0, 0, 0, 0), -- Quest ID: 8718 - Not taken & Not rewarded
(6858, 22, 8866, 0, 0, 0, 0), -- Quest ID: 8866 - Not taken & Not rewarded
(6868, 22, 8649, 0, 0, 0, 0); -- Quest ID: 8649 - Not taken & Not rewarded
-- Elder Rumblerock (Entry: 15557)
UPDATE `creature_template` SET `gossip_menu_id` = 6872, `npc_flags` = 2+1 WHERE `entry` = 15557;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6872;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6872, 0, 0, "Where is Elder Dawnstrider?", 11548, 1, 1, 45001, 0, 0, 45001),
(6872, 1, 0, "Where is Elder Hammershout?", 11550, 1, 1, 6873, 0, 0, 6873),
(6872, 2, 0, "Where is Elder Stormbrow?", 11542, 1, 1, 6868, 0, 0, 6868),
(6872, 3, 0, "Where is Elder Winterhoof?", 11544, 1, 1, 45002, 0, 0, 45002);
DELETE FROM `gossip_menu` WHERE `entry` IN (6872, 45001, 45002);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6872, 7933, 0),
(45001, 8173, 0),
(45002, 8171, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45001, 22, 8683, 0, 0, 0, 0), -- Quest ID: 8683 - Not taken & Not rewarded
(45002, 22, 8674, 0, 0, 0, 0); -- Quest ID: 8674 - Not taken & Not rewarded
-- Elder Skychaser (Entry: 15577)
UPDATE `creature_template` SET `gossip_menu_id` = 6825, `npc_flags` = 2+1 WHERE `entry` = 15577;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6825;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6825, 0, 0, "Where is Elder Starsong?", 11537, 1, 1, 6867, 0, 0, 6867),
(6825, 1, 0, "Where is Elder Stormbrow?", 11542, 1, 1, 6868, 0, 0, 6868),
(6825, 2, 0, "Where is Elder Winterhoof?", 11544, 1, 1, 45002, 0, 0, 45002);
DELETE FROM `gossip_menu` WHERE `entry` = 6825;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6825, 7935, 0);
-- Elder Starsong (Entry: 15593)
UPDATE `creature_template` SET `gossip_menu_id` = 6874, `npc_flags` = 2+1 WHERE `entry` = 15593;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6874;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6874, 1, 0, "Where is Elder Bellowrage?", 11552, 1, 1, 45003, 0, 0, 45003),
(6874, 2, 0, "Where is Elder Starglade?", 11656, 1, 1, 45004, 0, 0, 45004),
(6874, 3, 0, "Where is Elder Skychaser?", 11546, 1, 1, 45000, 0, 0, 45000),
(6874, 4, 0, "Where is Elder Stormbrow?", 11542, 1, 1, 6868, 0, 0, 6868),
(6874, 5, 0, "Where is Elder Winterhoof?", 11544, 1, 1, 45002, 0, 0, 45002);
DELETE FROM `gossip_menu` WHERE `entry` IN (6874, 45003, 45004);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6874, 7956, 0),
(45003, 8175, 0),
(45004, 8211, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45003, 22, 8647, 0, 0, 0, 0), -- Quest ID: 8647 - Not taken & Not rewarded
(45004, 22, 8716, 0, 0, 0, 0); -- Quest ID: 8716 - Not taken & Not rewarded
-- Elder Bellowrage (Entry: 15563)
UPDATE `creature_template` SET `gossip_menu_id` = 6866, `npc_flags` = 2+1 WHERE `entry` = 15563;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6866;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6866, 0, 0, "Where is Elder Starsong?", 11537, 1, 1, 6867, 0, 0, 6867);
DELETE FROM `gossip_menu` WHERE `entry` = 6866;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6866, 7933, 0);
-- Elder Starglade (Entry: 15596)
UPDATE `creature_template` SET `gossip_menu_id` = 6921, `npc_flags` = 2+1 WHERE `entry` = 15596;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6921;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6921, 0, 0, "Where is Elder Starsong?", 11537, 1, 1, 6867, 0, 0, 6867),
(6921, 1, 0, "Where is Elder Winterhoof?", 11544, 1, 1, 45002, 0, 0, 45002);
DELETE FROM `gossip_menu` WHERE `entry` = 6921;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6921, 7956, 0);
-- Elder Winterhoof (Entry: 15576)
UPDATE `creature_template` SET `gossip_menu_id` = 6829, `npc_flags` = 2+1 WHERE `entry` = 15576;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6829;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6829, 0, 0, "Where is Elder Rumblerock?", 11534, 1, 1, 6865, 0, 0, 6865),
(6829, 1, 0, "Where is Elder Skychaser?", 11546, 1, 1, 45000, 0, 0, 45000),
(6829, 2, 0, "Where is Elder Starglade?", 11656, 1, 1, 45004, 0, 0, 45004),
(6829, 3, 0, "Where is Elder Starsong?", 11537, 1, 1, 6867, 0, 0, 6867);
DELETE FROM `gossip_menu` WHERE `entry` = 6829;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6829, 7935, 0);
-- Elder Morndeep (Entry: 15549)
UPDATE `creature_template` SET `gossip_menu_id` = 6855, `npc_flags` = 2+1 WHERE `entry` = 15549;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6855;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6855, 0, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854);
DELETE FROM `gossip_menu` WHERE `entry` IN (6855, 6854);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6855, 7933, 0),
(6854, 8157, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6854, 22, 8651, 0, 0, 0, 0); -- Quest ID: 8651 - Not taken & Not rewarded
-- Elder Splitrock (Entry: 15556)
UPDATE `creature_template` SET `gossip_menu_id` = 6906, `npc_flags` = 2+1 WHERE `entry` = 15556;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6906;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6906, 0, 0, "Where is Elder Grimtotem?", 11590, 1, 1, 45005, 0, 0, 45005),
(6906, 1, 0, "Where is Elder Mistwalker?", 11592, 1, 1, 45006, 0, 0, 45006);
DELETE FROM `gossip_menu` WHERE `entry` IN (6906, 45005, 45006);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6906, 7933, 0),
(45005, 8192, 0),
(45006, 8193, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45005, 22, 8679, 0, 0, 0, 0), -- Quest ID: 8679 - Not taken & Not rewarded
(45006, 22, 8685, 0, 0, 0, 0); -- Quest ID: 8685 - Not taken & Not rewarded
-- Elder Ironband (Entry: 15567)
UPDATE `creature_template` SET `gossip_menu_id` = 6861, `npc_flags` = 2+1 WHERE `entry` = 15567;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6861;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6861, 0, 0, "Where is Elder Bronzebeard?", 11512, 1, 1, 6858, 0, 0, 6858),
(6861, 1, 0, "Where is Elder Goldwell?", 11509, 1, 1, 45007, 0, 0, 45007),
(6861, 2, 0, "Where is Elder Morndeep?", 11530, 1, 1, 45008, 0, 0, 45008),
(6861, 3, 0, "Where is Elder Silvervein?", 11516, 1, 1, 45009, 0, 0, 45009),
(6861, 4, 0, "Where is Elder Stonefort?", 11532, 1, 1, 45010, 0, 0, 45010);
DELETE FROM `gossip_menu` WHERE `entry` IN (6861, 45007, 45008, 45009, 45010);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6861, 7933, 0),
(45007, 8158, 0),
(45008, 8166, 0),
(45009, 8163, 0),
(45010, 8167, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45007, 22, 8653, 0, 0, 0, 0), -- Quest ID: 8653 - Not taken & Not rewarded
(45008, 22, 8619, 0, 0, 0, 0), -- Quest ID: 8619 - Not taken & Not rewarded
(45009, 22, 8642, 0, 0, 0, 0), -- Quest ID: 8642 - Not taken & Not rewarded
(45010, 22, 8644, 0, 0, 0, 0); -- Quest ID: 8644 - Not taken & Not rewarded
-- Elder Grimtotem (Entry: 15581)
UPDATE `creature_template` SET `gossip_menu_id` = 6905, `npc_flags` = 2+1 WHERE `entry` = 15581;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6905;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6905, 0, 0, "Where is Elder Mistwalker?", 11592, 1, 1, 45006, 0, 0, 45006),
(6905, 1, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6905, 2, 0, "Where is Elder Splitrock?", 11596, 1, 1, 45012, 0, 0, 45012);
DELETE FROM `gossip_menu` WHERE `entry` IN (6905, 45011, 45012);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6905, 7935, 0),
(45011, 8190, 0),
(45012, 8195, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45011, 22, 8724, 0, 0, 0, 0), -- Quest ID: 8724 - Not taken & Not rewarded
(45012, 22, 8635, 0, 0, 0, 0); -- Quest ID: 8635 - Not taken & Not rewarded
-- Elder Mistwalker (Entry: 15587)
UPDATE `creature_template` SET `gossip_menu_id` = 6903, `npc_flags` = 2+1 WHERE `entry` = 15587;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6903;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6903, 0, 0, "Where is Elder Grimtotem?", 11590, 1, 1, 45005, 0, 0, 45005),
(6903, 1, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6903, 2, 0, "Where is Elder Splitrock?", 11596, 1, 1, 45012, 0, 0, 45012);
DELETE FROM `gossip_menu` WHERE `entry` = 6903;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6903, 7935, 0);
-- Elder Morningdew (Entry: 15604)
UPDATE `creature_template` SET `gossip_menu_id` = 6830, `npc_flags` = 2+1 WHERE `entry` = 15604;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6830;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6830, 0, 0, "Where is Elder Grimtotem?", 11590, 1, 1, 45005, 0, 0, 45005),
(6830, 1, 0, "Where is Elder High Mountain?", 11578, 1, 1, 45013, 0, 0, 45013),
(6830, 2, 0, "Where is Elder Mistwalker?", 11592, 1, 1, 45006, 0, 0, 45006),
(6830, 3, 0, "Where is Elder Moonwarden?", 11580, 1, 1, 45014, 0, 0, 45014),
(6830, 4, 0, "Where is Elder Skyseer?", 11594, 1, 1, 45015, 0, 0, 45015),
(6830, 5, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` IN (6830, 45013, 45014, 45015, 45016);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6830, 7956, 0),
(45013, 8186, 0),
(45014, 8187, 0),
(45015, 8194, 0),
(45016, 8185, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45013, 22, 8686, 0, 0, 0, 0), -- Quest ID: 8686 - Not taken & Not rewarded
(45014, 22, 8717, 0, 0, 0, 0), -- Quest ID: 8717 - Not taken & Not rewarded
(45015, 22, 8682, 0, 0, 0, 0), -- Quest ID: 8682 - Not taken & Not rewarded
(45016, 22, 8680, 0, 0, 0, 0); -- Quest ID: 8680 - Not taken & Not rewarded
-- Elder High Mountain (Entry: 15588)
UPDATE `creature_template` SET `gossip_menu_id` = 6818, `npc_flags` = 2+1 WHERE `entry` = 15588;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6818;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6818, 0, 0, "Where is Elder Bloodhoof?", 11574, 1, 1, 45017, 0, 0, 45017),
(6818, 1, 0, "Where is Elder Moonwarden?", 11580, 1, 1, 45014, 0, 0, 45014),
(6818, 2, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6818, 3, 0, "Where is Elder Runetotem?", 11588, 1, 1, 45018, 0, 0, 45018),
(6818, 4, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` IN (6818, 45017, 45018);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6818, 7935, 0),
(45017, 8184, 0),
(45018, 8191, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45017, 22, 8673, 0, 0, 0, 0), -- Quest ID: 8673 - Not taken & Not rewarded
(45018, 22, 8670, 0, 0, 0, 0); -- Quest ID: 8670 - Not taken & Not rewarded
-- Elder Bloodhoof (Entry: 15575)
UPDATE `creature_template` SET `gossip_menu_id` = 6814, `npc_flags` = 2+1 WHERE `entry` = 15575;
-- https://classic.wowhead.com/npc=15580/elder-proudhorn
-- https://wowwiki.fandom.com/wiki/Elder_Ezra_Wheathoof
-- Changed localization only in RU.
UPDATE `broadcast_text` SET `MaleText` = "Where is Elder Proudhorn?", `FemaleText` = "Where is Elder Proudhorn?" WHERE `ID` = 11582;
UPDATE `broadcast_text` SET `MaleText` = "Elder Proudhorn is enjoying the vistas above Mulgore at Thunder Bluff.", `FemaleText` = "Elder Proudhorn is enjoying the vistas above Mulgore at Thunder Bluff." WHERE `ID` = 11583;
UPDATE `locales_broadcast_text` SET `MaleText_loc8` = "Где я могу найти предка Гордого Рога?", `FemaleText_loc8` = "Где я могу найти предка Гордого Рога?" WHERE `ID` = 11582;
UPDATE `locales_broadcast_text` SET `MaleText_loc8` = "Предок Гордый Рог наслаждается видами на Мулгор с Громового Утеса.", `FemaleText_loc8` = "Предок Гордый Рог наслаждается видами на Мулгор с Громового Утеса." WHERE `ID` = 11583;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6814;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6814, 0, 0, "Where is Elder High Mountain?", 11578, 1, 1, 45013, 0, 0, 45013),
(6814, 1, 0, "Where is Elder Moonwarden?", 11580, 1, 1, 45014, 0, 0, 45014),
(6814, 2, 0, "Where is Elder Proudhorn?", 11582, 1, 1, 6895, 0, 0, 6895),
(6814, 3, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` IN (6814, 6895);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6814, 7935, 0),
(6895, 8188, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6895, 22, 8678, 0, 0, 0, 0); -- Quest ID: 8678 - Not taken & Not rewarded
-- Elder Runetotem (Entry: 15572)
UPDATE `creature_template` SET `gossip_menu_id` = 6815, `npc_flags` = 2+1 WHERE `entry` = 15572;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6815;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6815, 0, 0, "Where is Elder Darkhorn?", 11584, 1, 1, 6896, 0, 0, 6896),
(6815, 1, 0, "Where is Elder High Mountain?", 11578, 1, 1, 45013, 0, 0, 45013),
(6815, 2, 0, "Where is Elder Moonwarden?", 11580, 1, 1, 45014, 0, 0, 45014),
(6815, 3, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` IN (6815, 6896);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6815, 7935, 0),
(6896, 8189, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6896, 22, 8677, 0, 0, 0, 0); -- Quest ID: 8677 - Not taken & Not rewarded
-- Elder Darkhorn (Entry: 15579)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91610;
UPDATE `creature_template` SET `gossip_menu_id` = 6899, `npc_flags` = 2+1 WHERE `entry` = 15579;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6899;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6899, 0, 0, "Where is Elder Darkcore?", 11493, 1, 1, 45019, 0, 0, 45019),
(6899, 1, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854),
(6899, 2, 0, "Where is Elder Proudhorn?", 11582, 1, 1, 6895, 0, 0, 6895),
(6899, 3, 0, "Where is Elder Runetotem?", 11588, 1, 1, 45018, 0, 0, 45018),
(6899, 4, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` IN (6899, 45019);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6899, 7935, 0),
(45019, 8150, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45019, 22, 8648, 0, 0, 0, 0); -- Quest ID: 8648 - Not taken & Not rewarded
-- Elder Bronzebeard (Entry: 15871)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91631;
UPDATE `creature_template` SET `gossip_menu_id` = 6841, `npc_flags` = 2+1 WHERE `entry` = 15871;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6841;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6841, 0, 0, "Where is Elder Bladeswift?", 11554, 1, 1, 6876, 0, 0, 6876),
(6841, 1, 0, "Where is Elder Hammershout?", 11550, 1, 1, 6873, 0, 0, 6873),
(6841, 2, 0, "Where is Elder Goldwell?", 11509, 1, 1, 45007, 0, 0, 45007),
(6841, 3, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854);
DELETE FROM `gossip_menu` WHERE `entry` = 6841;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6841, 7933, 0);
-- Elder Proudhorn (Entry: 15580)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91603;
UPDATE `creature_template` SET `gossip_menu_id` = 6890, `npc_flags` = 2+1 WHERE `entry` = 15580;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6890;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6890, 0, 0, "Where is Elder Bloodhoof?", 11574, 1, 1, 45017, 0, 0, 45017),
(6890, 1, 0, "Where is Elder Darkcore?", 11493, 1, 1, 45019, 0, 0, 45019),
(6890, 2, 0, "Where is Elder Darkhorn?", 11584, 1, 1, 6896, 0, 0, 6896),
(6890, 3, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854),
(6890, 4, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` = 6890;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6890, 7935, 0);
-- Elder Windtotem (Entry: 15582)
UPDATE `creature_template` SET `gossip_menu_id` = 6828, `npc_flags` = 2+1 WHERE `entry` = 15582;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6828;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6828, 0, 0, "Where is Elder Bloodhoof?", 11574, 1, 1, 45017, 0, 0, 45017),
(6828, 1, 0, "Where is Elder Darkhorn?", 11584, 1, 1, 6896, 0, 0, 6896),
(6828, 2, 0, "Where is Elder High Mountain?", 11578, 1, 1, 45013, 0, 0, 45013),
(6828, 3, 0, "Where is Elder Moonwarden?", 11580, 1, 1, 45014, 0, 0, 45014),
(6828, 4, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6828, 5, 0, "Where is Elder Proudhorn?", 11582, 1, 1, 6895, 0, 0, 6895),
(6828, 6, 0, "Where is Elder Runetotem?", 11588, 1, 1, 45018, 0, 0, 45018);
DELETE FROM `gossip_menu` WHERE `entry` = 6828;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6828, 7935, 0);
-- Elder Moonwarden (Entry: 15597)
UPDATE `creature_template` SET `gossip_menu_id` = 6817, `npc_flags` = 2+1 WHERE `entry` = 15597;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6817;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6817, 0, 0, "Where is Elder Bloodhoof?", 11574, 1, 1, 45017, 0, 0, 45017),
(6817, 1, 0, "Where is Elder High Mountain?", 11578, 1, 1, 45013, 0, 0, 45013),
(6817, 2, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6817, 3, 0, "Where is Elder Runetotem?", 11588, 1, 1, 45018, 0, 0, 45018),
(6817, 4, 0, "Where is Elder Windtotem?", 11576, 1, 1, 45016, 0, 0, 45016);
DELETE FROM `gossip_menu` WHERE `entry` = 6817;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6817, 7956, 0);
-- Elder Darkcore (Entry: 15564)
UPDATE `creature_template` SET `gossip_menu_id` = 6832, `npc_flags` = 2+1 WHERE `entry` = 15564;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6832;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6832, 0, 0, "Where is Elder Darkhorn?", 11584, 1, 1, 6896, 0, 0, 6896),
(6832, 1, 0, "Where is Elder Graveborn?", 11488, 1, 1, 6842, 0, 0, 6842),
(6832, 2, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854),
(6832, 3, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843),
(6832, 4, 0, "Where is Elder Proudhorn?", 11582, 1, 1, 6895, 0, 0, 6895);
DELETE FROM `gossip_menu` WHERE `entry` IN (6832, 6842, 6843);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6832, 7933, 0),
(6842, 8148, 0),
(6843, 8149, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6842, 22, 8652, 0, 0, 0, 0), -- Quest ID: 8652 - Not taken & Not rewarded
(6843, 22, 8714, 0, 0, 0, 0); -- Quest ID: 8714 - Not taken & Not rewarded
-- Elder Graveborn (Entry: 15568)
UPDATE `creature_template` SET `gossip_menu_id` = 6816, `npc_flags` = 2+1 WHERE `entry` = 15568;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6816;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6816, 1, 0, "Where is Elder Darkcore?", 11493, 1, 1, 45019, 0, 0, 45019),
(6816, 2, 0, "Where is Elder Meadowrun?", 11653, 1, 1, 45020, 0, 0, 45020),
(6816, 3, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843),
(6816, 4, 0, "Where is Elder Obsidian?", 11497, 1, 1, 45021, 0, 0, 45021),
(6816, 5, 0, "Where is Elder Snowcrown?", 11499, 1, 1, 45022, 0, 0, 45022);
DELETE FROM `gossip_menu` WHERE `entry` IN (6816, 45020, 45021, 45022);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6816, 7933, 0),
(45020, 8210, 0),
(45021, 8152, 0),
(45022, 8153, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45020, 22, 8722, 0, 0, 0, 0), -- Quest ID: 8722 - Not taken & Not rewarded
(45021, 22, 8645, 0, 0, 0, 0), -- Quest ID: 8645 - Not taken & Not rewarded
(45022, 22, 8650, 0, 0, 0, 0); -- Quest ID: 8650 - Not taken & Not rewarded
-- Elder Moonstrike (Entry: 15594)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91713;
UPDATE `creature_template` SET `gossip_menu_id` = 6849, `npc_flags` = 2+1 WHERE `entry` = 15594;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6849;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6849, 0, 0, "Where is Elder Darkcore?", 11493, 1, 1, 45019, 0, 0, 45019),
(6849, 1, 0, "Where is Elder Graveborn?", 11488, 1, 1, 6842, 0, 0, 6842),
(6849, 2, 0, "Where is Elder Highpeak?", 11501, 1, 1, 45023, 0, 0, 45023),
(6849, 3, 0, "Where is Elder Meadowrun?", 11653, 1, 1, 45020, 0, 0, 45020),
(6849, 4, 0, "Where is Elder Obsidian?", 11497, 1, 1, 45021, 0, 0, 45021),
(6849, 5, 0, "Where is Elder Snowcrown?", 11499, 1, 1, 45022, 0, 0, 45022),
(6849, 6, 0, "Where is Elder Windrun?", 11503, 1, 1, 45024, 0, 0, 45024);
DELETE FROM `gossip_menu` WHERE `entry` IN (6849, 45023, 45024);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6849, 7956, 0),
(45023, 8154, 0),
(45024, 8155, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45023, 22, 8643, 0, 0, 0, 0), -- Quest ID: 8643 - Not taken & Not rewarded
(45024, 22, 8688, 0, 0, 0, 0); -- Quest ID: 8688 - Not taken & Not rewarded
-- Elder Obsidian (Entry: 15561)
UPDATE `creature_template` SET `gossip_menu_id` = 6819, `npc_flags` = 2+1 WHERE `entry` = 15561;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6819;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6819, 0, 0, "Where is Elder Graveborn?", 11488, 1, 1, 6842, 0, 0, 6842),
(6819, 1, 0, "Where is Elder Highpeak?", 11501, 1, 1, 45023, 0, 0, 45023),
(6819, 2, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843);
DELETE FROM `gossip_menu` WHERE `entry` = 6819;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6819, 7933, 0);
-- Elder Highpeak (Entry: 15559)
DELETE FROM `creature_template_addon` WHERE `entry` = 15559;
INSERT INTO `creature_template_addon` (`entry`, `b2_0_sheath`, `b2_1_flags`, `auras`) VALUES
(15559, 1, 16, "25824");
UPDATE `creature_template` SET `gossip_menu_id` = 6848, `npc_flags` = 2+1 WHERE `entry` = 15559;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6848;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6848, 0, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843);
DELETE FROM `gossip_menu` WHERE `entry` = 6848;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6848, 7933, 0);
-- Elder Snowcrown (Entry: 15566)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91710;
UPDATE `creature_template` SET `gossip_menu_id` = 6834, `npc_flags` = 2+1 WHERE `entry` = 15566;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6834;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6834, 0, 0, "Where is Elder Graveborn?", 11488, 1, 1, 6842, 0, 0, 6842),
(6834, 1, 0, "Where is Elder Farwhisper?", 11505, 1, 1, 45025, 0, 0, 45025),
(6834, 2, 0, "Where is Elder Meadowrun?", 11653, 1, 1, 45020, 0, 0, 45020),
(6834, 3, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843),
(6834, 4, 0, "Where is Elder Windrun?", 11503, 1, 1, 45024, 0, 0, 45024);
DELETE FROM `gossip_menu` WHERE `entry` IN (6834, 45025);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6834, 7933, 0),
(45025, 8156, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45025, 22, 8727, 0, 0, 0, 0); -- Quest ID: 8727 - Not taken & Not rewarded
-- Elder Windrun (Entry: 15592)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91711;
UPDATE `creature_template` SET `gossip_menu_id` = 6852, `npc_flags` = 2+1 WHERE `entry` = 15592;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6852;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6852, 0, 0, "Where is Elder Farwhisper?", 11505, 1, 1, 45025, 0, 0, 45025),
(6852, 1, 0, "Where is Elder Meadowrun?", 11653, 1, 1, 45020, 0, 0, 45020),
(6852, 2, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843),
(6852, 3, 0, "Where is Elder Snowcrown?", 11499, 1, 1, 45022, 0, 0, 45022);
DELETE FROM `gossip_menu` WHERE `entry` = 6852;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6852, 7956, 0);
-- Elder Meadowrun (Entry: 15602)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 91712;
UPDATE `creature_template` SET `gossip_menu_id` = 6919, `npc_flags` = 2+1 WHERE `entry` = 15602;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6919;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6919, 0, 0, "Where is Elder Graveborn?", 11488, 1, 1, 6842, 0, 0, 6842),
(6919, 1, 0, "Where is Elder Moonstrike?", 11491, 1, 1, 6843, 0, 0, 6843),
(6919, 2, 0, "Where is Elder Snowcrown?", 11499, 1, 1, 45022, 0, 0, 45022),
(6919, 3, 0, "Where is Elder Windrun?", 11503, 1, 1, 45024, 0, 0, 45024);
DELETE FROM `gossip_menu` WHERE `entry` = 6919;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6919, 7956, 0);
-- Elder Farwhisper (Entry: 15607)
DELETE FROM `creature_template_addon` WHERE `entry` = 15607;
INSERT INTO `creature_template_addon` (`entry`, `b2_0_sheath`, `b2_1_flags`, `auras`) VALUES
(15607, 1, 16, "25824");
UPDATE `creature_template` SET `gossip_menu_id` = 6853, `npc_flags` = 2+1 WHERE `entry` = 15607;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6853;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6853, 0, 0, "Where is Elder Snowcrown?", 11499, 1, 1, 45022, 0, 0, 45022),
(6853, 1, 0, "Where is Elder Windrun?", 11503, 1, 1, 45024, 0, 0, 45024);
DELETE FROM `gossip_menu` WHERE `entry` = 6853;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6853, 7956, 0);
-- Elder Bladeleaf (Entry: 15595)
UPDATE `creature_template` SET `gossip_menu_id` = 6822, `npc_flags` = 2+1 WHERE `entry` = 15595;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6822;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6822, 0, 0, "Where is Elder Bladeswift?", 11554, 1, 1, 6876, 0, 0, 6876),
(6822, 1, 0, "Where is Elder Skygleam?", 11556, 1, 1, 6877, 0, 0, 6877);
DELETE FROM `gossip_menu` WHERE `entry` IN (6822, 6877);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6822, 7956, 0),
(6877, 8177, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6877, 22, 8720, 0, 0, 0, 0); -- Quest ID: 8720 - Not taken & Not rewarded
-- Elder Bladeswift (Entry: 15598)
UPDATE `creature_template` SET `gossip_menu_id` = 6880, `npc_flags` = 2+1 WHERE `entry` = 15598;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6880;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6880, 0, 0, "Where is Elder Bladeleaf?", 11558, 1, 1, 6878, 0, 0, 6878),
(6880, 1, 0, "Where is Elder Bronzebeard?", 11512, 1, 1, 6858, 0, 0, 6858),
(6880, 2, 0, "Where is Elder Hammershout?", 11550, 1, 1, 6873, 0, 0, 6873),
(6880, 3, 0, "Where is Elder Skygleam?", 11556, 1, 1, 6877, 0, 0, 6877),
(6880, 4, 0, "Where is Elder Starweave?", 11561, 1, 1, 6879, 0, 0, 6879);
DELETE FROM `gossip_menu` WHERE `entry` IN (6880, 6878, 6879);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6880, 7956, 0),
(6878, 8178, 0),
(6879, 8179, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(6878, 22, 8715, 0, 0, 0, 0), -- Quest ID: 8715 - Not taken & Not rewarded
(6879, 22, 8721, 0, 0, 0, 0); -- Quest ID: 8721 - Not taken & Not rewarded
-- Elder Starweave (Entry: 15601)
UPDATE `creature_template` SET `gossip_menu_id` = 6826, `npc_flags` = 2+1 WHERE `entry` = 15601;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6826;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6826, 0, 0, "Where is Elder Bladeswift?", 11554, 1, 1, 6876, 0, 0, 6876),
(6826, 1, 0, "Where is Elder Nightwind?", 11565, 1, 1, 45026, 0, 0, 45026),
(6826, 2, 0, "Where is Elder Riversong?", 11567, 1, 1, 45027, 0, 0, 45027);
DELETE FROM `gossip_menu` WHERE `entry` IN (6826, 45026, 45027);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6826, 7956, 0),
(45026, 8180, 0),
(45027, 8181, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45026, 22, 8723, 0, 0, 0, 0), -- Quest ID: 8723 - Not taken & Not rewarded
(45027, 22, 8725, 0, 0, 0, 0); -- Quest ID: 8725 - Not taken & Not rewarded
-- Elder Nightwind (Entry: 15603)
UPDATE `creature_template` SET `gossip_menu_id` = 6887, `npc_flags` = 2+1 WHERE `entry` = 15603;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6887;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6887, 0, 0, "Where is Elder Brightspear?", 11572, 1, 1, 45028, 0, 0, 45028),
(6887, 1, 0, "Where is Elder Riversong?", 11567, 1, 1, 45027, 0, 0, 45027),
(6887, 2, 0, "Where is Elder Skygleam?", 11556, 1, 1, 6877, 0, 0, 6877),
(6887, 3, 0, "Where is Elder Starweave?", 11561, 1, 1, 6879, 0, 0, 6879),
(6887, 4, 0, "Where is Elder Stonespire?", 11570, 1, 1, 45029, 0, 0, 45029);
DELETE FROM `gossip_menu` WHERE `entry` IN (6887, 45028, 45029);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6887, 7956, 0),
(45028, 8183, 0),
(45029, 8182, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45028, 22, 8726, 0, 0, 0, 0), -- Quest ID: 8726 - Not taken & Not rewarded
(45029, 22, 8672, 0, 0, 0, 0); -- Quest ID: 8672 - Not taken & Not rewarded
-- Elder Dreamseer (Entry: 15586)
UPDATE `creature_template` SET `gossip_menu_id` = 6831, `npc_flags` = 2+1 WHERE `entry` = 15586;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6831;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6831, 0, 0, "Where is Elder Ragetotem?", 11600, 1, 1, 45030, 0, 0, 45030),
(6831, 1, 0, "Where is Elder Skyseer?", 11594, 1, 1, 45015, 0, 0, 45015),
(6831, 2, 0, "Where is Elder Thunderhorn?", 11604, 1, 1, 45031, 0, 0, 45031),
(6831, 3, 0, "Where is Elder Wildmane?", 11602, 1, 1, 45032, 0, 0, 45032);
DELETE FROM `gossip_menu` WHERE `entry` IN (6831, 45030, 45031, 45032);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6831, 7935, 0),
(45030, 8197, 0),
(45031, 8199, 0),
(45032, 8198, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45030, 22, 8671, 0, 0, 0, 0), -- Quest ID: 8671 - Not taken & Not rewarded
(45031, 22, 8681, 0, 0, 0, 0), -- Quest ID: 8681 - Not taken & Not rewarded
(45032, 22, 8676, 0, 0, 0, 0); -- Quest ID: 8676 - Not taken & Not rewarded
-- Elder Stonefort (Entry: 15560)
UPDATE `creature_template` SET `gossip_menu_id` = 6824, `npc_flags` = 2+1 WHERE `entry` = 15560;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6824;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6824, 0, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854);
DELETE FROM `gossip_menu` WHERE `entry` = 6824;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6824, 7933, 0);
-- Elder Silvervein (Entry: 15558)
UPDATE `creature_template` SET `gossip_menu_id` = 6856, `npc_flags` = 2+1 WHERE `entry` = 15558;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6856;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6856, 0, 0, "Where is Elder Goldwell?", 11509, 1, 1, 45007, 0, 0, 45007),
(6856, 1, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854);
DELETE FROM `gossip_menu` WHERE `entry` = 6856;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6856, 7933, 0);
-- Elder Goldwell (Entry: 15569)
UPDATE `creature_template` SET `gossip_menu_id` = 6823, `npc_flags` = 2+1 WHERE `entry` = 15569;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6823;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6823, 0, 0, "Where is Elder Bronzebeard?", 11512, 1, 1, 6858, 0, 0, 6858),
(6823, 1, 0, "Where is Elder Ironband?", 11507, 1, 1, 6854, 0, 0, 6854),
(6823, 2, 0, "Where is Elder Silvervein?", 11516, 1, 1, 45009, 0, 0, 45009);
DELETE FROM `gossip_menu` WHERE `entry` = 6823;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6823, 7933, 0);
-- Elder Primestone (Entry: 15570)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 70575;
UPDATE `creature_template` SET `gossip_menu_id` = 6916, `npc_flags` = 2+1 WHERE `entry` = 15570;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6916;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6916, 0, 0, "Where is Elder Bladesing?", 11606, 1, 1, 45033, 0, 0, 45033),
(6916, 1, 0, "Where is Elder Thunderhorn?", 11604, 1, 1, 45031, 0, 0, 45031);
DELETE FROM `gossip_menu` WHERE `entry` IN (6916, 45033);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6916, 7933, 0),
(45033, 8200, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45033, 22, 8719, 0, 0, 0, 0); -- Quest ID: 8719 - Not taken & Not rewarded
-- Elder Ragetotem (Entry: 15573)
UPDATE `creature_template` SET `gossip_menu_id` = 6911, `npc_flags` = 2+1 WHERE `entry` = 15573;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6911;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6911, 0, 0, "Where is Elder Dreamseer?", 11598, 1, 1, 45034, 0, 0, 45034),
(6911, 1, 0, "Where is Elder Skyseer?", 11594, 1, 1, 45015, 0, 0, 45015),
(6911, 2, 0, "Where is Elder Thunderhorn?", 11604, 1, 1, 45031, 0, 0, 45031),
(6911, 3, 0, "Where is Elder Wildmane?", 11602, 1, 1, 45032, 0, 0, 45032);
DELETE FROM `gossip_menu` WHERE `entry` IN (6911, 45034);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6911, 7935, 0),
(45034, 8196, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45034, 22, 8684, 0, 0, 0, 0); -- Quest ID: 8684 - Not taken & Not rewarded
-- Elder Stonespire (Entry: 15574)
UPDATE `creature_template` SET `gossip_menu_id` = 6885, `npc_flags` = 2+1 WHERE `entry` = 15574;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6885;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6885, 0, 0, "Where is Elder Brightspear?", 11572, 1, 1, 45028, 0, 0, 45028),
(6885, 1, 0, "Where is Elder Nightwind?", 11565, 1, 1, 45026, 0, 0, 45026),
(6885, 2, 0, "Where is Elder Riversong?", 11567, 1, 1, 45027, 0, 0, 45027);
DELETE FROM `gossip_menu` WHERE `entry` = 6885;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6885, 7935, 0);
-- Elder Wildmane (Entry: 15578)
UPDATE `creature_template` SET `gossip_menu_id` = 6912, `npc_flags` = 2+1 WHERE `entry` = 15578;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6912;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6912, 0, 0, "Where is Elder Dreamseer?", 11598, 1, 1, 45034, 0, 0, 45034),
(6912, 1, 0, "Where is Elder Ragetotem?", 11600, 1, 1, 45030, 0, 0, 45030),
(6912, 2, 0, "Where is Elder Skyseer?", 11594, 1, 1, 45015, 0, 0, 45015),
(6912, 3, 0, "Where is Elder Thunderhorn?", 11604, 1, 1, 45031, 0, 0, 45031);
DELETE FROM `gossip_menu` WHERE `entry` = 6912;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6912, 7935, 0);
-- Elder Thunderhorn (Entry: 15583)
UPDATE `creature_template` SET `gossip_menu_id` = 6914, `npc_flags` = 2+1 WHERE `entry` = 15583;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6914;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6914, 0, 0, "Where is Elder Bladesing?", 11606, 1, 1, 45033, 0, 0, 45033),
(6914, 1, 0, "Where is Elder Dreamseer?", 11598, 1, 1, 45034, 0, 0, 45034),
(6914, 2, 0, "Where is Elder Primestone?", 11608, 1, 1, 45035, 0, 0, 45035),
(6914, 3, 0, "Where is Elder Ragetotem?", 11600, 1, 1, 45030, 0, 0, 45030),
(6914, 4, 0, "Where is Elder Wildmane?", 11602, 1, 1, 45032, 0, 0, 45032);
DELETE FROM `gossip_menu` WHERE `entry` IN (6914, 45035);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6914, 7935, 0),
(45035, 8201, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(45035, 22, 8654, 0, 0, 0, 0); -- Quest ID: 8654 - Not taken & Not rewarded
-- Elder Skyseer (Entry: 15584)
UPDATE `creature_template` SET `gossip_menu_id` = 6820, `npc_flags` = 2+1 WHERE `entry` = 15584;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6820;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6820, 0, 0, "Where is Elder Dreamseer?", 11598, 1, 1, 45034, 0, 0, 45034),
(6820, 1, 0, "Where is Elder Morningdew?", 11586, 1, 1, 45011, 0, 0, 45011),
(6820, 2, 0, "Where is Elder Ragetotem?", 11600, 1, 1, 45030, 0, 0, 45030),
(6820, 3, 0, "Where is Elder Wildmane?", 11602, 1, 1, 45032, 0, 0, 45032);
DELETE FROM `gossip_menu` WHERE `entry` = 6820;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6820, 7935, 0);
-- Elder Dawnstrider (Entry: 15585)
UPDATE `creature_template` SET `gossip_menu_id` = 6864, `npc_flags` = 2+1 WHERE `entry` = 15585;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6864;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6864, 0, 0, "Where is Elder Rumblerock?", 11534, 1, 1, 6865, 0, 0, 6865);
DELETE FROM `gossip_menu` WHERE `entry` = 6864;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6864, 7935, 0);
-- Elder Bladesing (Entry: 15599)
DELETE FROM `npc_gossip` WHERE `npc_guid` = 70574;
UPDATE `creature_template` SET `gossip_menu_id` = 6835, `npc_flags` = 2+1 WHERE `entry` = 15599;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6835;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6835, 0, 0, "Where is Elder Primestone?", 11608, 1, 1, 45035, 0, 0, 45035),
(6835, 1, 0, "Where is Elder Thunderhorn?", 11604, 1, 1, 45031, 0, 0, 45031);
DELETE FROM `gossip_menu` WHERE `entry` = 6835;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6835, 7956, 0);
-- Elder Skygleam (Entry: 15600)
UPDATE `creature_template` SET `gossip_menu_id` = 6889, `npc_flags` = 2+1 WHERE `entry` = 15600;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6889;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6889, 0, 0, "Where is Elder Bladeleaf?", 11558, 1, 1, 6878, 0, 0, 6878),
(6889, 1, 0, "Where is Elder Bladeswift?", 11554, 1, 1, 6876, 0, 0, 6876),
(6889, 2, 0, "Where is Elder Nightwind?", 11565, 1, 1, 45026, 0, 0, 45026),
(6889, 3, 0, "Where is Elder Riversong?", 11567, 1, 1, 45027, 0, 0, 45027);
DELETE FROM `gossip_menu` WHERE `entry` = 6889;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6889, 7956, 0);
-- Elder Riversong (Entry: 15605)
UPDATE `creature_template` SET `gossip_menu_id` = 6827, `npc_flags` = 2+1 WHERE `entry` = 15605;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6827;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6827, 0, 0, "Where is Elder Nightwind?", 11565, 1, 1, 45026, 0, 0, 45026),
(6827, 1, 0, "Where is Elder Skygleam?", 11556, 1, 1, 6877, 0, 0, 6877),
(6827, 2, 0, "Where is Elder Starweave?", 11561, 1, 1, 6879, 0, 0, 6879),
(6827, 3, 0, "Where is Elder Stonespire?", 11570, 1, 1, 45029, 0, 0, 45029);
DELETE FROM `gossip_menu` WHERE `entry` = 6827;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6827, 7956, 0);
-- Elder Brightspear (Entry: 15606)
UPDATE `creature_template` SET `gossip_menu_id` = 6888, `npc_flags` = 2+1 WHERE `entry` = 15606;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6888;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `condition_id`) VALUES
(6888, 0, 0, "Where is Elder Nightwind?", 11565, 1, 1, 45026, 0, 0, 45026),
(6888, 1, 0, "Where is Elder Stonespire?", 11570, 1, 1, 45029, 0, 0, 45029);
DELETE FROM `gossip_menu` WHERE `entry` = 6888;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6888, 7956, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
