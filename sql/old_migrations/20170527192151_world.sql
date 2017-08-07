INSERT INTO `migrations` VALUES ('20170527192151'); 

-- Improvements for quest Plagued Lands
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1780226, 'Be cleansed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 7, 0, 'Tharnariun Treetender cleanses bear');
DELETE FROM `npc_gossip` WHERE `npc_guid`=37294;
INSERT INTO `conditions` VALUES (1092, 9, 2118, 0);
INSERT INTO `conditions` VALUES (1093, 24, 7586, 1);
INSERT INTO `conditions` VALUES (1094, -1, 1092, 1093);
INSERT INTO `gossip_menu` VALUES (10482, 769, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (10482, 0, 0, 'Tharnariun, I have lost the trap. Could you please give me another?', 1, 1, -1, 0, 50232, 0, 0, NULL, 1094);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (50232, 0, 17, 7586, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Lands : Give another trap');
UPDATE `creature_template` SET `gossip_menu_id`=10482, `ScriptName`='npc_tharnariun_treetender' WHERE `entry`=3701;
UPDATE `spell_script_target` SET `targetEntry`=11836 WHERE `entry`=9457;