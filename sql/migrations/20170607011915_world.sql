INSERT INTO `migrations` VALUES ('20170607011915'); 

-- Andorgos
UPDATE `creature_template` SET `gossip_menu_id`=6644 WHERE `entry`=15502;
INSERT INTO `gossip_menu` VALUES (6644, 7899, 0);
UPDATE `npc_text` SET `text0_0`='' WHERE `ID`=8702;

-- Kandrostrasz
INSERT INTO `gossip_menu` VALUES (6645, 7900, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6645 WHERE `entry`=15503;
