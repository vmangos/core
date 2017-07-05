INSERT INTO `migrations` VALUES ('20170630201907'); 

-- Add gossip menu for Mankrik
DELETE FROM `npc_gossip` WHERE `npc_guid`=14348;
INSERT INTO `conditions` VALUES (941, 8, 899, 0);
INSERT INTO `conditions` VALUES (942, 8, 4921, 0);
INSERT INTO `conditions` VALUES (943, -1, 942, 941);
INSERT INTO `gossip_menu` VALUES (2861, 3553, 0);
INSERT INTO `gossip_menu` VALUES (2861, 3554, 943);
UPDATE `creature_template` SET `gossip_menu_id`=2861 WHERE `entry`=3432;

-- Add missing gossip text for Mebok Myzzyrix
INSERT INTO `npc_text` VALUES (224,'Yes yes yes! You\'re just the $r I\'m looking for!\r\n\r\nSit! We have much to discuss!!','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
INSERT INTO `npc_gossip` VALUES (14408, 224);

-- Add gossip menu for Sputtervalve
DELETE FROM `npc_gossip` WHERE `npc_guid`=14388;
INSERT INTO `conditions` VALUES (315, 19, 894, 0);
INSERT INTO `conditions` VALUES (316, 9, 6981, 0);
INSERT INTO `gossip_menu` VALUES (21, 518, 0);
INSERT INTO `gossip_menu` VALUES (21, 519, 315);
INSERT INTO `gossip_menu` VALUES (22, 520, 0);
INSERT INTO `gossip_menu` VALUES (20025, 2013, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (21, 0, 0, 'How can I help?', 1, 1, 22, 0, 0, 0, 0, NULL, 315);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (21, 1, 0, 'Can you tell me about this shard?', 1, 1, 20025, 0, 21, 0, 0, NULL, 316);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (21, 0, 7, 6981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'quest complete 6981');
UPDATE `creature_template` SET `gossip_menu_id`=21, `ScriptName`='' WHERE `entry`=3442;

-- Add gossip menu for Gorbold Steelhand
DELETE FROM `npc_text` WHERE `ID`=17861;
DELETE FROM `npc_gossip` WHERE `npc_guid`=37980;
INSERT INTO `gossip_menu` VALUES (12726, 3218, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (12726, 0, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=12726 WHERE `entry`=6301;

-- Add gossip menu for Mangletooth
DELETE FROM `npc_gossip` WHERE `npc_guid`=14345;
INSERT INTO `conditions` VALUES (324, 8, 5052, 0);
INSERT INTO `gossip_menu` VALUES (2944, 3656, 0);
INSERT INTO `gossip_menu` VALUES (2944, 3670, 324);
UPDATE `creature_template` SET `gossip_menu_id`=2944 WHERE `entry`=3430;

-- Add gossip menu for Melnan Darkstone
INSERT INTO `gossip_menu` VALUES (6213, 7375, 0);
INSERT INTO `gossip_menu` VALUES (6222, 7379, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6213, 0, 0, 'The Darkmoon Faire has arrived, you say? And where is she now?', 1, 1, 6222, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6213, `npcflag`=3 WHERE `entry`=14842;

-- Add missing gossip text for Wharfmaster Dizzywig
INSERT INTO `npc_text` VALUES (225,'Something I can help you with, $n? There\'s a shipment I\'ve got to see to otherwise.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
INSERT INTO `npc_gossip` VALUES (14419, 225);
