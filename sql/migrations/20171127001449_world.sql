DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171127001449');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171127001449');
-- Add your query below.


-- Fix gameobject templates for the Meeting Stones.
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178824, 23, 5491, 'Meeting Stone', 35, 0, 1, 37, 46, 722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178825, 23, 5491, 'Meeting Stone', 35, 0, 1, 29, 38, 491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178826, 23, 5492, 'Meeting Stone', 35, 0, 0.94, 56, 60, 2557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178827, 23, 5491, 'Meeting Stone', 35, 0, 1, 40, 52, 2100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178828, 23, 5494, 'Meeting Stone', 35, 0, 1, 24, 32, 719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178829, 23, 5491, 'Meeting Stone', 35, 0, 1, 44, 54, 978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178831, 23, 5495, 'Meeting Stone', 35, 0, 1, 58, 60, 2017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178832, 23, 5494, 'Meeting Stone', 35, 0, 1, 58, 60, 2057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178833, 23, 5491, 'Meeting Stone', 35, 0, 1, 41, 51, 1517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178834, 23, 5494, 'Meeting Stone', 35, 0, 1, 17, 26, 1581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178844, 23, 5492, 'Meeting Stone', 35, 0, 1, 34, 45, 796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178845, 23, 5498, 'Meeting Stone', 35, 0, 1, 22, 30, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (178884, 23, 5491, 'Meeting Stone', 35, 0, 1, 17, 24, 718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179554, 23, 5498, 'Meeting Stone', 35, 0, 1, 50, 60, 1477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179555, 23, 5491, 'Meeting Stone', 35, 0, 1, 29, 38, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179584, 23, 5495, 'Meeting Stone', 35, 0, 1, 52, 60, 1584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179585, 23, 5495, 'Meeting Stone', 35, 0, 1, 55, 60, 1583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179586, 23, 5495, 'Meeting Stone', 0, 0, 1, 48, 60, 1584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179587, 23, 5495, 'Meeting Stone', 0, 0, 1, 55, 60, 1583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179595, 23, 5494, 'Meeting Stone', 35, 0, 1, 24, 32, 717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`) VALUES (179596, 23, 5498, 'Meeting Stone', 35, 0, 1, 13, 20, 2437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add conditions for the innkeeper gossip options.
INSERT INTO `conditions` VALUES (4013, 37, 3, 1);
INSERT INTO `conditions` VALUES (402, 15, 17, 1);
INSERT INTO `conditions` VALUES (403, 15, 13, 1);
INSERT INTO `conditions` VALUES (404, 15, 20, 2);
INSERT INTO `conditions` VALUES (405, -1, 403, 404);
INSERT INTO `conditions` VALUES (406, 15, 26, 2);
INSERT INTO `conditions` VALUES (407, -1, 402, 406);
INSERT INTO `conditions` VALUES (408, 15, 24, 2);
INSERT INTO `conditions` VALUES (409, -1, 402, 408);
INSERT INTO `conditions` VALUES (410, 15, 22, 1);
INSERT INTO `conditions` VALUES (411, 15, 30, 2);
INSERT INTO `conditions` VALUES (412, -1, 410, 411);
INSERT INTO `conditions` VALUES (414, 15, 32, 2);
INSERT INTO `conditions` VALUES (415, -1, 168, 414);
INSERT INTO `conditions` VALUES (416, 15, 29, 1);
INSERT INTO `conditions` VALUES (417, 15, 38, 2);
INSERT INTO `conditions` VALUES (418, -1, 416, 417);
INSERT INTO `conditions` VALUES (419, 15, 34, 1);
INSERT INTO `conditions` VALUES (420, 15, 45, 2);
INSERT INTO `conditions` VALUES (421, -1, 419, 420);
INSERT INTO `conditions` VALUES (422, 15, 37, 1);
INSERT INTO `conditions` VALUES (423, 15, 46, 2);
INSERT INTO `conditions` VALUES (424, -1, 422, 423);
INSERT INTO `conditions` VALUES (426, 15, 52, 2);
INSERT INTO `conditions` VALUES (427, -1, 178, 426);
INSERT INTO `conditions` VALUES (428, 15, 41, 1);
INSERT INTO `conditions` VALUES (429, 15, 51, 2);
INSERT INTO `conditions` VALUES (430, -1, 428, 429);
INSERT INTO `conditions` VALUES (431, 15, 44, 1);
INSERT INTO `conditions` VALUES (432, 15, 55, 2);
INSERT INTO `conditions` VALUES (433, -1, 431, 432);
INSERT INTO `conditions` VALUES (434, 15, 52, 1);
INSERT INTO `conditions` VALUES (435, 15, 50, 1);
INSERT INTO `conditions` VALUES (436, 15, 55, 1);
INSERT INTO `conditions` VALUES (437, 15, 56, 1);
INSERT INTO `conditions` VALUES (438, 15, 58, 1);
INSERT INTO `conditions` VALUES (4500, -1, 402, 4013);

-- Main dungeon gossip menu.
INSERT INTO `gossip_menu` VALUES (6029, 7180, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 0, 0, 'Ragefire', 1, 1, 6037, 0, 0, 0, 0, NULL, 405);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 1, 0, 'Deadmines', 1, 1, 50200, 0, 0, 0, 0, NULL, 407);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 2, 0, 'Wailing Caverns', 1, 1, 50202, 0, 0, 0, 0, NULL, 409);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 3, 0, 'Shadowfang Keep', 1, 1, 50204, 0, 0, 0, 0, NULL, 412);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 4, 0, 'Blackfathom Deeps', 1, 1, 50206, 0, 0, 0, 0, NULL, 415);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 5, 0, 'Stormwind Stockade', 1, 1, 50208, 0, 0, 0, 0, NULL, 415);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 6, 0, 'Razorfen Kraul', 1, 1, 50210, 0, 0, 0, 0, NULL, 418);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 7, 0, 'Gnomeregan', 1, 1, 50212, 0, 0, 0, 0, NULL, 418);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 8, 0, 'Scarlet Monastery', 1, 1, 50214, 0, 0, 0, 0, NULL, 421);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 9, 0, 'Razorfen Downs', 1, 1, 50216, 0, 0, 0, 0, NULL, 424);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 10, 0, 'Maraudon', 1, 1, 50218, 0, 0, 0, 0, NULL, 427);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 11, 0, 'Uldaman', 1, 1, 50220, 0, 0, 0, 0, NULL, 430);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 12, 0, 'Zul\'Farrak', 1, 1, 50222, 0, 0, 0, 0, NULL, 433);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 13, 0, 'Blackrock Depths', 1, 1, 50224, 0, 0, 0, 0, NULL, 434);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 14, 0, 'Sunken Temple', 1, 1, 50226, 0, 0, 0, 0, NULL, 435);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 15, 0, 'Blackrock Spire', 1, 1, 50228, 0, 0, 0, 0, NULL, 436);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 16, 0, 'Dire Maul', 1, 1, 50230, 0, 0, 0, 0, NULL, 437);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 17, 0, 'Stratholme', 1, 1, 50232, 0, 0, 0, 0, NULL, 438);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6029, 18, 0, 'Scholomance', 1, 1, 50234, 0, 0, 0, 0, NULL, 438);
-- Ragefire Chasm
INSERT INTO `gossip_menu` VALUES (6037, 7191, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6037, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2000, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6037, 1, 0, 'Can you tell me more about this place?', 1, 1, 6024, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (6024, 7177, 0);
-- Deadmines
INSERT INTO `gossip_menu` VALUES (50200, 7227, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50200, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2001, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50200, 1, 0, 'Can you tell me more about this place?', 1, 1, 50201, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50201, 7187, 0);
-- Wailing Caverns
INSERT INTO `gossip_menu` VALUES (50202, 7192, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50202, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2002, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50202, 1, 0, 'Can you tell me more about this place?', 1, 1, 50203, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50203, 7183, 0);
-- Shadowfang Keep
INSERT INTO `gossip_menu` VALUES (50204, 7197, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50204, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2003, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50204, 1, 0, 'Can you tell me more about this place?', 1, 1, 50205, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50205, 7185, 0);
-- Blackfathom Depths
INSERT INTO `gossip_menu` VALUES (50206, 7200, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50206, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2004, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50206, 1, 0, 'Can you tell me more about this place?', 1, 1, 50207, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50207, 7201, 0);
-- Stormwind Stockade
INSERT INTO `gossip_menu` VALUES (50208, 7229, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50208, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2005, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50208, 1, 0, 'Can you tell me more about this place?', 1, 1, 50209, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50209, 7230, 0);
-- Razorfen Kraul
INSERT INTO `gossip_menu` VALUES (50210, 7204, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50210, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2006, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50210, 1, 0, 'Can you tell me more about this place?', 1, 1, 50211, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50211, 7205, 0);
-- Gnomeregan
INSERT INTO `gossip_menu` VALUES (50212, 7202, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50212, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2007, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50212, 1, 0, 'Can you tell me more about this place?', 1, 1, 50213, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50213, 7203, 0);
-- Scarlet Monestary
INSERT INTO `gossip_menu` VALUES (50214, 7206, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50214, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2008, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50214, 1, 0, 'Can you tell me more about this place?', 1, 1, 50215, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50215, 7207, 0);
-- Razorfen Downs
INSERT INTO `gossip_menu` VALUES (50216, 7208, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50216, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2009, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50216, 1, 0, 'Can you tell me more about this place?', 1, 1, 50217, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50217, 7209, 0);
-- Maraudon
INSERT INTO `gossip_menu` VALUES (50218, 7215, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50218, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2010, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50218, 1, 0, 'Can you tell me more about this place?', 1, 1, 50219, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50219, 7216, 0);
-- Uldaman
INSERT INTO `gossip_menu` VALUES (50220, 7210, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50220, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2011, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50220, 1, 0, 'Can you tell me more about this place?', 1, 1, 50221, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50221, 7212, 0);
-- Zul'Farrak
INSERT INTO `gossip_menu` VALUES (50222, 7213, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50222, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2012, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50222, 1, 0, 'Can you tell me more about this place?', 1, 1, 50223, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50223, 7214, 0);
-- Blackrock Depths
INSERT INTO `gossip_menu` VALUES (50224, 7218, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50224, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2013, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50224, 1, 0, 'Can you tell me more about this place?', 1, 1, 50225, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50225, 7219, 0);
-- Sunken Temple
INSERT INTO `gossip_menu` VALUES (50226, 7217, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50226, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2014, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50226, 1, 0, 'Can you tell me more about this place?', 1, 1, 50227, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50227, 7228, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7228, 9936, 1);
-- Blackrock Spire
INSERT INTO `gossip_menu` VALUES (50228, 7218, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50228, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2015, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50228, 1, 0, 'Can you tell me more about this place?', 1, 1, 50229, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50229, 7220, 0);
-- Dire Maul
INSERT INTO `gossip_menu` VALUES (50230, 7221, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50230, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2016, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50230, 1, 0, 'Can you tell me more about this place?', 1, 1, 50231, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50231, 7222, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7222, 9944, 1);
-- Strattholme
INSERT INTO `gossip_menu` VALUES (50232, 7225, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50232, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2017, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50232, 1, 0, 'Can you tell me more about this place?', 1, 1, 50233, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50233, 7226, 0);
-- Scholomance
INSERT INTO `gossip_menu` VALUES (50234, 7223, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50234, 0, 5, 'Join a group going to this dungeon.    <This choice will place you in a meetingstone queue>    ', 1, 1, -1, 0, 2018, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (50234, 1, 0, 'Can you tell me more about this place?', 1, 1, 50235, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu` VALUES (50235, 7224, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7224, 9947, 1);
-- Add the gossip option to all the innkeepers.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (342, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (344, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (345, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (347, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (349, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1290, 5, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 5, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1293, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1294, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 5, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1297, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1581, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2890, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6059, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6525, 4, 0, 'Tell me about dungeons I could explore.', 1, 1, 6029, 0, 0, 0, 0, NULL, 4500);

-- Scripts to queue for the dungeons.
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2000, 0, 36, 2437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Ragefire Chasm');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2001, 0, 36, 1581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - The Deadmines');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2002, 0, 36, 718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Wailing Caverns');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2003, 0, 36, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Shadowfang Keep');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2004, 0, 36, 719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Blackfathom Depths');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2005, 0, 36, 717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - The Stockade');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2006, 0, 36, 491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Razorfen Kraul');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2007, 0, 36, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Gnomeregan');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2008, 0, 36, 796, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Scarlet Monastery');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2009, 0, 36, 722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Razorfen Downs');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2010, 0, 36, 2100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Maraudon');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2011, 0, 36, 1517, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Uldaman');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2012, 0, 36, 978, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Zul\'Farrak');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2013, 0, 36, 1584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Blackrock Depths');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2014, 0, 36, 1477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Sunken Temple');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2015, 0, 36, 1583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Blackrock Spire');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2016, 0, 36, 2557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Dire Maul');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2017, 0, 36, 2017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Stratholme');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2018, 0, 36, 2057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Meetingstone - Scholomance');

-- Add min and max patch support to gameobject table.
ALTER TABLE `gameobject`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `visibilitymod`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;

-- Assign minimum patch to meeting stone spawns.
UPDATE `gameobject` SET `patch_min`=1 WHERE `id` IN (178824, 178825, 178826, 178827, 178828, 178829, 178831, 178832, 178833, 178834, 178844, 178845, 178884, 179554, 179555, 179584, 179585, 179595, 179596);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
