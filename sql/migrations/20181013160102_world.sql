DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181013160102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181013160102');
-- Add your query below.


-- Gossip menu for Kalaran Windblade.
DELETE FROM `npc_gossip` WHERE `npc_guid`=5921;
INSERT INTO `conditions` VALUES (250, 9, 3441, 1, 0, 0, 0); -- Has Incomplete Quest Divine Retribution
INSERT INTO `conditions` VALUES (251, 8, 3454, 0, 0, 0, 0); -- Completed Quest The Torch of Retribution
INSERT INTO `conditions` VALUES (252, 2, 10515, 1, 0, 0, 1); -- Not Have Item Torch of Retribution
INSERT INTO `conditions` VALUES (253, -1, 251, 252, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (1323, 1953, 0);
INSERT INTO `gossip_menu` VALUES (1322, 1954, 0);
INSERT INTO `gossip_menu` VALUES (1321, 1955, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1323, 0, 0, 'Tell me what drives this vengeance?', 4430, 1, 1, 1322, 0, 0, 0, 0, '', 0, 250);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1323, 2, 0, 'Kalaran, I have misplaced my torch. I require another.', 7773, 1, 1, -1, 0, 1323, 0, 0, '', 0, 253);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1322, 0, 0, 'Continue please.', 4432, 1, 1, 1321, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1321, 0, 0, 'Let me confer with my colleagues.', 4434, 1, 1, -1, 0, 1321, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=1323;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1323, 0, 15, 19797, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Cast Spell Conjure Torch of Retribution');
DELETE FROM `gossip_scripts` WHERE `id`=1321;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1321, 0, 7, 3441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Complete Quest Divine Retribution');
UPDATE `creature_template` SET `gossip_menu_id`=1323, `ScriptName`='' WHERE `entry`=8479;

-- Gossip menu for Zamael Lunthistle.
INSERT INTO `conditions` VALUES (254, 9, 3377, 1, 0, 0, 0); -- Has Incomplete Quest Prayer to Elune
INSERT INTO `gossip_menu` VALUES (1285, 1920, 0);
INSERT INTO `gossip_menu` VALUES (1286, 1922, 0);
INSERT INTO `gossip_menu` VALUES (1287, 1921, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1285, 0, 0, 'I wish to hear your tale.', 4408, 1, 1, 1287, 0, 0, 0, 0, '', 0, 254);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1287, 0, 0, 'Please continue, Zamael.', 4410, 1, 1, 1286, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1286, 0, 0, 'Let me think about it, Zamael.', 4412, 1, 1, -1, 0, 1286, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=1286;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1286, 0, 7, 3377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamael Lunthistle - Complete Quest Prayer to Elune');
UPDATE `creature_template` SET `gossip_menu_id`=1285, `ScriptName`='' WHERE `entry`=8436;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
