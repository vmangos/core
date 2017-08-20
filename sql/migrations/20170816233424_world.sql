INSERT INTO `migrations` VALUES ('20170816233424'); 

-- Add gossip menu for Captain Garran Vimes.
INSERT INTO `gossip_menu` VALUES (1161, 1793, 0);
INSERT INTO `gossip_menu` VALUES (1162, 1794, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1161, 0, 0, 'What have you heard of the Shady Rest Inn?', 1, 1, 1162, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1161 WHERE `entry`=4944;

-- This item has a 0 set as description.
UPDATE `item_template` SET `description`='' WHERE `entry`=6075;
