DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200510195017');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200510195017');
-- Add your query below.


-- Meetingstone gossips.
UPDATE `gossip_menu` SET `entry`=50235 WHERE `entry`=6037;
UPDATE `gossip_menu_option` SET `menu_id`=50235 WHERE `menu_id`=6037;
UPDATE `gossip_menu_option` SET `action_menu_id`=50235 WHERE `action_menu_id`=6037;
UPDATE `gossip_menu` SET `entry`=50236 WHERE `entry`=6024;
UPDATE `gossip_menu_option` SET `menu_id`=50236 WHERE `menu_id`=6024;
UPDATE `gossip_menu_option` SET `action_menu_id`=50236 WHERE `action_menu_id`=6024;

-- Krog
UPDATE `gossip_menu` SET `entry`=1186 WHERE `entry`=1004;
UPDATE `gossip_menu_option` SET `menu_id`=1186 WHERE `menu_id`=1004;
UPDATE `gossip_menu_option` SET `action_menu_id`=1186 WHERE `action_menu_id`=1004;
UPDATE `gossip_menu` SET `entry`=1187 WHERE `entry`=1005;
UPDATE `gossip_menu_option` SET `menu_id`=1187 WHERE `menu_id`=1005;
UPDATE `gossip_menu_option` SET `action_menu_id`=1187 WHERE `action_menu_id`=1005;
UPDATE `gossip_menu` SET `entry`=1188 WHERE `entry`=1006;
UPDATE `gossip_menu_option` SET `menu_id`=1188 WHERE `menu_id`=1006;
UPDATE `gossip_menu_option` SET `action_menu_id`=1188 WHERE `action_menu_id`=1006;
UPDATE `creature_template` SET `gossip_menu_id`=1186 WHERE `entry`=4926;

-- Finkle Einhorn
UPDATE `gossip_menu` SET `entry`=2951 WHERE `entry`=6000;
UPDATE `gossip_menu_option` SET `menu_id`=2951 WHERE `menu_id`=6000;
UPDATE `gossip_menu_option` SET `action_menu_id`=2951 WHERE `action_menu_id`=6000;
UPDATE `gossip_menu` SET `entry`=2950 WHERE `entry`=6001;
UPDATE `gossip_menu_option` SET `menu_id`=2950 WHERE `menu_id`=6001;
UPDATE `gossip_menu_option` SET `action_menu_id`=2950 WHERE `action_menu_id`=6001;
UPDATE `gossip_menu` SET `entry`=2949 WHERE `entry`=6002;
UPDATE `gossip_menu_option` SET `menu_id`=2949 WHERE `menu_id`=6002;
UPDATE `gossip_menu_option` SET `action_menu_id`=2949 WHERE `action_menu_id`=6002;
UPDATE `gossip_menu` SET `entry`=2948 WHERE `entry`=6003;
UPDATE `gossip_menu_option` SET `menu_id`=2948 WHERE `menu_id`=6003;
UPDATE `gossip_menu_option` SET `action_menu_id`=2948 WHERE `action_menu_id`=6003;
UPDATE `gossip_menu` SET `entry`=2947 WHERE `entry`=6004;
UPDATE `gossip_menu_option` SET `menu_id`=2947 WHERE `menu_id`=6004;
UPDATE `gossip_menu_option` SET `action_menu_id`=2947 WHERE `action_menu_id`=6004;
UPDATE `gossip_menu` SET `entry`=2946 WHERE `entry`=6005;
UPDATE `gossip_menu_option` SET `menu_id`=2946 WHERE `menu_id`=6005;
UPDATE `gossip_menu_option` SET `action_menu_id`=2946 WHERE `action_menu_id`=6005;
UPDATE `gossip_menu` SET `entry`=2945 WHERE `entry`=6006;
UPDATE `gossip_menu_option` SET `menu_id`=2945 WHERE `menu_id`=6006;
UPDATE `gossip_menu_option` SET `action_menu_id`=2945 WHERE `action_menu_id`=6006;
UPDATE `creature_template` SET `gossip_menu_id`=2951 WHERE `entry`=10776;

-- Senani Thunderheart
UPDATE `gossip_menu` SET `entry`=4346 WHERE `entry`=1000;
UPDATE `gossip_menu_option` SET `menu_id`=4346 WHERE `menu_id`=1000;
UPDATE `gossip_menu_option` SET `action_menu_id`=4346 WHERE `action_menu_id`=1000;
UPDATE `gossip_menu` SET `entry`=4381 WHERE `entry`=1001;
UPDATE `gossip_menu_option` SET `menu_id`=4381 WHERE `menu_id`=1001;
UPDATE `gossip_menu_option` SET `action_menu_id`=4381 WHERE `action_menu_id`=1001;
UPDATE `gossip_menu` SET `entry`=4383 WHERE `entry`=1002;
UPDATE `gossip_menu_option` SET `menu_id`=4383 WHERE `menu_id`=1002;
UPDATE `gossip_menu_option` SET `action_menu_id`=4383 WHERE `action_menu_id`=1002;
UPDATE `gossip_menu` SET `entry`=4382 WHERE `entry`=1003;
UPDATE `gossip_menu_option` SET `menu_id`=4382 WHERE `menu_id`=1003;
UPDATE `gossip_menu_option` SET `action_menu_id`=4382 WHERE `action_menu_id`=1003;
UPDATE `creature_template` SET `gossip_menu_id`=4346 WHERE `entry`=12696;

-- Xao'tsu
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=10088;

-- Elissa Dumas
DELETE FROM `gossip_menu` WHERE `entry`=4821;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 5875, 91);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 5876, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4821, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4821, 0, 3, 'Please teach me.', 8442, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4821, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4821, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4821 WHERE `entry`=4165;

-- Precious
UPDATE `gossip_menu` SET `entry`=5869 WHERE `entry`=500;
UPDATE `creature_template` SET `gossip_menu_id`=5869 WHERE `entry`=14528;

-- Omusa Thunderhorn
UPDATE `creature_template` SET `gossip_menu_id`=6162 WHERE `entry`=10378;

-- Kym Wildmane
DELETE FROM `gossip_menu` WHERE `entry`=4607;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 5716, 89);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 5717, 88);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4607, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4607, 0, 3, 'I seek further druidic training to have a closer understanding of the Earth Mother\'s will.', 8295, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4607, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4607, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4607, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4607 WHERE `entry`=3036;

-- Gart Mistrunner
DELETE FROM `gossip_menu` WHERE `entry`=4644;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4644, 5716, 89);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4644, 5717, 88);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4644, 0, 3, 'I seek further druidic training to have a closer understanding of the Earth Mother\'s will.', 8295, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4644, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
UPDATE `creature_template` SET `gossip_menu_id`=4644 WHERE `entry`=3060;

-- Fylerian Nightwing
DELETE FROM `gossip_menu` WHERE `entry`=4571;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 4781, 88);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 4782, 89);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4571, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4571, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4571, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4571, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4571, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4571 WHERE `entry`=4219;

-- Sheldras Moontree
DELETE FROM `gossip_menu` WHERE `entry`=4508;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 4783, 88);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 4784, 89);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4508, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4508, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4508, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4508, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4508, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4508 WHERE `entry`=5504;

-- Maldryn
DELETE FROM `gossip_menu` WHERE `entry`=4507;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 4783, 88);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 4784, 89);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4507, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4507, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4507, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4507, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4507, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4507 WHERE `entry`=5506;

-- Loganaar
DELETE FROM `gossip_menu` WHERE `entry`=4687;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4687, 4783, 88);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4687, 4784, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4687, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4687, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
UPDATE `creature_template` SET `gossip_menu_id`=4687 WHERE `entry`=12042;

-- Zayus
DELETE FROM `gossip_menu` WHERE `entry`=4522;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 4440, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 4441, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8263, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4522, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4522, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4522, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4522, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4522, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4522 WHERE `entry`=5994;

-- Lanka Farshot
DELETE FROM `gossip_menu` WHERE `entry`=4647;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4647, 4997, 96);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4647, 4998, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4647, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4647, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
UPDATE `creature_template` SET `gossip_menu_id`=4647 WHERE `entry`=3061;

-- Xor'juul
DELETE FROM `gossip_menu` WHERE `entry`=4506;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 4987, 96);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 5004, 97);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8263, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4506, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4506, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4506, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4506, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4506, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4506 WHERE `entry`=3406;

-- Sian'dur
UPDATE `creature_template` SET `gossip_menu_id`=4506 WHERE `entry`=3407;

-- Jocaste
DELETE FROM `gossip_menu` WHERE `entry`=4008;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 4863, 96);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 4993, 97);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4008, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4008, 0, 3, 'I\'d like to train.', 7149, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4008, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4008, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4008, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4008 WHERE `entry`=4146;

-- Daera Brightspear
DELETE FROM `gossip_menu` WHERE `entry`=4549;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 4999, 96);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 5000, 97);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8254, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4549, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4549, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4549, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4549, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4549, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4549 WHERE `entry`=5115;

-- Regnus Thundergranite
DELETE FROM `gossip_menu` WHERE `entry`=4551;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 4999, 96);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 5000, 97);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8254, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4551, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4551, 0, 3, 'I am here for training.', 4510, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4551, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4551, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4551, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4551 WHERE `entry`=5117;

-- Kaerbrus
DELETE FROM `gossip_menu` WHERE `entry`=4694;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4694, 4993, 97);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4694, 6160, 96);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4694, 0, 3, 'I\'d like to train.', 7149, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4694, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
UPDATE `creature_template` SET `gossip_menu_id`=4694 WHERE `entry`=5501;

-- Siln Skychaser
DELETE FROM `gossip_menu` WHERE `entry`=4528;
INSERT INTO `gossip_menu` VALUES (4528, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4528, 5006, 93);
INSERT INTO `gossip_menu` VALUES (4528, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4528, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4528, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4528, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4528, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4528, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4528;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4528, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4528, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4528, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4528, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4528 WHERE `entry` = 3030;

-- Tigor Skychaser
DELETE FROM `gossip_menu` WHERE `entry`=4530;
INSERT INTO `gossip_menu` VALUES (4530, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4530, 5006, 93);
INSERT INTO `gossip_menu` VALUES (4530, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4530, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4530, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4530, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4530, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4530, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4530;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4530, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4530, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4530, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4530, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4530 WHERE `entry` = 3031;

-- Beram Skychaser
DELETE FROM `gossip_menu` WHERE `entry`=4529;
INSERT INTO `gossip_menu` VALUES (4529, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4529, 5006, 93);
INSERT INTO `gossip_menu` VALUES (4529, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4529, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4529, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4529, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4529, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4529, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4529;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4529, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4529, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4529, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4529, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4529 WHERE `entry` = 3032;

-- Sark Ragetotem
DELETE FROM `gossip_menu` WHERE `entry`=4525;
INSERT INTO `gossip_menu` VALUES (4525, 1218, 98);
INSERT INTO `gossip_menu` VALUES (4525, 4973, 99);
INSERT INTO `gossip_menu` VALUES (4525, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4525, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4525, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4525, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4525, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4525, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4525;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4525, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4525, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4525, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4525, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4525 WHERE `entry` = 3042;

-- Ker Ragetotem
DELETE FROM `gossip_menu` WHERE `entry`=4527;
INSERT INTO `gossip_menu` VALUES (4527, 1218, 98);
INSERT INTO `gossip_menu` VALUES (4527, 4973, 99);
INSERT INTO `gossip_menu` VALUES (4527, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4527, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4527, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4527, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4527, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4527, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4527;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4527, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4527, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4527, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4527, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4527 WHERE `entry` = 3043;

-- Miles Welsh
DELETE FROM `gossip_menu` WHERE `entry`=4533;
INSERT INTO `gossip_menu` VALUES (4533, 4442, 94);
INSERT INTO `gossip_menu` VALUES (4533, 4439, 95);
INSERT INTO `gossip_menu` VALUES (4533, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4533, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4533, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4533, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4533, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4533, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4533;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4533, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4533, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4533, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4533, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4533 WHERE `entry` = 3044;

-- Malakai Cross
DELETE FROM `gossip_menu` WHERE `entry`=4531;
INSERT INTO `gossip_menu` VALUES (4531, 4442, 94);
INSERT INTO `gossip_menu` VALUES (4531, 4439, 95);
INSERT INTO `gossip_menu` VALUES (4531, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4531, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4531, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4531, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4531, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4531, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4531;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4531, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4531, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4531, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4531, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4531 WHERE `entry` = 3045;

-- Father Cobb
DELETE FROM `gossip_menu` WHERE `entry`=4532;
INSERT INTO `gossip_menu` VALUES (4532, 4442, 94);
INSERT INTO `gossip_menu` VALUES (4532, 4439, 95);
INSERT INTO `gossip_menu` VALUES (4532, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4532, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4532, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4532, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4532, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4532, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4532;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4532, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4532, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4532, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4532, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4532 WHERE `entry` = 3046;

-- Archmage Shymm
DELETE FROM `gossip_menu` WHERE `entry`=4534;
INSERT INTO `gossip_menu` VALUES (4534, 562, 90);
INSERT INTO `gossip_menu` VALUES (4534, 563, 91);
INSERT INTO `gossip_menu` VALUES (4534, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4534, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4534, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4534, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4534, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4534, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4534;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4534, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4534, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4534, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4534, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4534 WHERE `entry` = 3047;

-- Ursyn Ghull
DELETE FROM `gossip_menu` WHERE `entry`=4536;
INSERT INTO `gossip_menu` VALUES (4536, 562, 90);
INSERT INTO `gossip_menu` VALUES (4536, 563, 91);
INSERT INTO `gossip_menu` VALUES (4536, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4536, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4536, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4536, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4536, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4536, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4536;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4536, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4536, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4536, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4536, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4536 WHERE `entry` = 3048;

-- Thurston Xane
DELETE FROM `gossip_menu` WHERE `entry`=4535;
INSERT INTO `gossip_menu` VALUES (4535, 562, 90);
INSERT INTO `gossip_menu` VALUES (4535, 563, 91);
INSERT INTO `gossip_menu` VALUES (4535, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4535, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4535, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4535, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4535, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4535, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4535;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4535, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4535, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4535, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4535, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4535 WHERE `entry` = 3049;

-- Harutt Thunderhorn
DELETE FROM `gossip_menu` WHERE `entry`=4645;
INSERT INTO `gossip_menu` VALUES (4645, 1218, 98);
INSERT INTO `gossip_menu` VALUES (4645, 4973, 99);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4645;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4645, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4645, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=4645 WHERE `entry` = 3059;

-- Meela Dawnstrider
DELETE FROM `gossip_menu` WHERE `entry`=4103;
INSERT INTO `gossip_menu` VALUES (4103, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4103, 5006, 93);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4103;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4103, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4103, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
UPDATE `creature_template` SET `gossip_menu_id`=4103 WHERE `entry` = 3062;

-- Krang Stonehoof
DELETE FROM `gossip_menu` WHERE `entry`=655;
INSERT INTO `gossip_menu` VALUES (655, 1218, 98);
INSERT INTO `gossip_menu` VALUES (655, 4973, 99);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=655;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (655, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (655, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=655 WHERE `entry` = 3063;

-- Narm Skychaser
UPDATE `creature_template` SET `gossip_menu_id`=4103 WHERE `entry` = 3066;

-- Nartok
DELETE FROM `gossip_menu` WHERE `entry`=4643;
INSERT INTO `gossip_menu` VALUES (4643, 5715, 0);
INSERT INTO `gossip_menu` VALUES (4643, 5714, 67);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4643;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4643, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4643, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4643 WHERE `entry` = 3156;

-- Dhugru Gorelust
DELETE FROM `gossip_menu` WHERE `entry`=4641;
INSERT INTO `gossip_menu` VALUES (4641, 5715, 0);
INSERT INTO `gossip_menu` VALUES (4641, 5714, 67);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4641;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4641, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4641, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4641 WHERE `entry` = 3172;

-- Swart
DELETE FROM `gossip_menu` WHERE `entry`=4104;
INSERT INTO `gossip_menu` VALUES (4104, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4104, 5006, 93);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4104;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4104, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4104, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
UPDATE `creature_template` SET `gossip_menu_id`=4104 WHERE `entry` = 3173;

-- Grol'dar
DELETE FROM `gossip_menu` WHERE `entry`=4603;
INSERT INTO `gossip_menu` VALUES (4603, 5715, 0);
INSERT INTO `gossip_menu` VALUES (4603, 5714, 67);
INSERT INTO `gossip_menu` VALUES (4603, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4603, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4603, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4603, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4603, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4603, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4603;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4603, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4603, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4603, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4603, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4603 WHERE `entry` = 3324;

-- Mirket
DELETE FROM `gossip_menu` WHERE `entry`=4604;
INSERT INTO `gossip_menu` VALUES (4604, 5715, 0);
INSERT INTO `gossip_menu` VALUES (4604, 5714, 67);
INSERT INTO `gossip_menu` VALUES (4604, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4604, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4604, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4604, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4604, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4604, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4604;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4604, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4604, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4604, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4604, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4604 WHERE `entry` = 3325;

-- Zevrost
DELETE FROM `gossip_menu` WHERE `entry`=2384;
INSERT INTO `gossip_menu` VALUES (2384, 5715, 0);
INSERT INTO `gossip_menu` VALUES (2384, 5714, 67);
INSERT INTO `gossip_menu` VALUES (2384, 8298, 455);
INSERT INTO `gossip_menu` VALUES (2384, 8296, 460);
INSERT INTO `gossip_menu` VALUES (2384, 8291, 458);
INSERT INTO `gossip_menu` VALUES (2384, 8285, 454);
INSERT INTO `gossip_menu` VALUES (2384, 8283, 459);
INSERT INTO `gossip_menu` VALUES (2384, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2384;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2384, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2384, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2384, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2384, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=2384 WHERE `entry` = 3326;

-- Kardris Dreamseeker
DELETE FROM `gossip_menu` WHERE `entry`=4516;
INSERT INTO `gossip_menu` VALUES (4516, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4516, 5006, 93);
INSERT INTO `gossip_menu` VALUES (4516, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4516, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4516, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4516, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4516, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4516, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4516;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4516, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4516, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4516, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4516, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4516 WHERE `entry` = 3344;

-- Grezz Ragefist
DELETE FROM `gossip_menu` WHERE `entry`=4509;
INSERT INTO `gossip_menu` VALUES (4509, 1040, 98);
INSERT INTO `gossip_menu` VALUES (4509, 4985, 99);
INSERT INTO `gossip_menu` VALUES (4509, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4509, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4509, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4509, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4509, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4509, 8263, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4509;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4509, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4509, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4509, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4509, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4509 WHERE `entry` = 3353;

-- Sorek
DELETE FROM `gossip_menu` WHERE `entry`=4511;
INSERT INTO `gossip_menu` VALUES (4511, 1040, 98);
INSERT INTO `gossip_menu` VALUES (4511, 4985, 99);
INSERT INTO `gossip_menu` VALUES (4511, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4511, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4511, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4511, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4511, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4511, 8263, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4511;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4511, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4511, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4511, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4511, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4511 WHERE `entry` = 3354;

-- Sildanair
DELETE FROM `gossip_menu` WHERE `entry`=4578;
INSERT INTO `gossip_menu` VALUES (4578, 1217, 98);
INSERT INTO `gossip_menu` VALUES (4578, 5725, 99);
INSERT INTO `gossip_menu` VALUES (4578, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4578, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4578, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4578, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4578, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4578, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4578;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4578, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4578, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4578, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4578, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4578 WHERE `entry` = 4089;

-- Kaal Soulreaper
DELETE FROM `gossip_menu` WHERE `entry`=2383;
INSERT INTO `gossip_menu` VALUES (2383, 5715, 0);
INSERT INTO `gossip_menu` VALUES (2383, 5714, 67);
INSERT INTO `gossip_menu` VALUES (2383, 8298, 455);
INSERT INTO `gossip_menu` VALUES (2383, 8296, 460);
INSERT INTO `gossip_menu` VALUES (2383, 8291, 458);
INSERT INTO `gossip_menu` VALUES (2383, 8285, 454);
INSERT INTO `gossip_menu` VALUES (2383, 8283, 459);
INSERT INTO `gossip_menu` VALUES (2383, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2383;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2383, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2383, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2383, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2383, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=2383 WHERE `entry` = 4563;

-- Luther Pickman
DELETE FROM `gossip_menu` WHERE `entry`=4609;
INSERT INTO `gossip_menu` VALUES (4609, 5720, 0);
INSERT INTO `gossip_menu` VALUES (4609, 5714, 67);
INSERT INTO `gossip_menu` VALUES (4609, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4609, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4609, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4609, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4609, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4609, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4609;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4609, 0, 3, 'I submit myself for further training my master.', 8298, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4609, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4609, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4609, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4609 WHERE `entry` = 4564;

-- Richard Kerwin
DELETE FROM `gossip_menu` WHERE `entry`=4610;
INSERT INTO `gossip_menu` VALUES (4610, 5720, 0);
INSERT INTO `gossip_menu` VALUES (4610, 5714, 67);
INSERT INTO `gossip_menu` VALUES (4610, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4610, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4610, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4610, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4610, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4610, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4610;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4610, 0, 3, 'I submit myself for further training my master.', 8298, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4610, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4610, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4610, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4610 WHERE `entry` = 4565;

-- Kaelystia Hatebringer
DELETE FROM `gossip_menu` WHERE `entry`=4539;
INSERT INTO `gossip_menu` VALUES (4539, 562, 90);
INSERT INTO `gossip_menu` VALUES (4539, 563, 91);
INSERT INTO `gossip_menu` VALUES (4539, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4539, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4539, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4539, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4539, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4539, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4539;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4539, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4539, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4539, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4539, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4539 WHERE `entry` = 4566;

-- Pierce Shackleton
DELETE FROM `gossip_menu` WHERE `entry`=4538;
INSERT INTO `gossip_menu` VALUES (4538, 562, 90);
INSERT INTO `gossip_menu` VALUES (4538, 563, 91);
INSERT INTO `gossip_menu` VALUES (4538, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4538, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4538, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4538, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4538, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4538, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4538;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4538, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4538, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4538, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4538, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4538 WHERE `entry` = 4567;

-- Anastasia Hartwell
DELETE FROM `gossip_menu` WHERE `entry`=4537;
INSERT INTO `gossip_menu` VALUES (4537, 562, 90);
INSERT INTO `gossip_menu` VALUES (4537, 563, 91);
INSERT INTO `gossip_menu` VALUES (4537, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4537, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4537, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4537, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4537, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4537, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4537;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4537, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4537, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4537, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4537, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4537 WHERE `entry` = 4568;

-- Christoph Walker
DELETE FROM `gossip_menu` WHERE `entry`=4548;
INSERT INTO `gossip_menu` VALUES (4548, 1219, 98);
INSERT INTO `gossip_menu` VALUES (4548, 4984, 99);
INSERT INTO `gossip_menu` VALUES (4548, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4548, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4548, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4548, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4548, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4548, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4548;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4548, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4548, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4548, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4548, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4548 WHERE `entry` = 4593;

-- Angela Curthas
DELETE FROM `gossip_menu` WHERE `entry`=4546;
INSERT INTO `gossip_menu` VALUES (4546, 1219, 98);
INSERT INTO `gossip_menu` VALUES (4546, 4984, 99);
INSERT INTO `gossip_menu` VALUES (4546, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4546, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4546, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4546, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4546, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4546, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4546;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4546, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4546, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4546, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4546, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4546 WHERE `entry` = 4594;

-- Baltus Fowler
DELETE FROM `gossip_menu` WHERE `entry`=4547;
INSERT INTO `gossip_menu` VALUES (4547, 1219, 98);
INSERT INTO `gossip_menu` VALUES (4547, 4984, 99);
INSERT INTO `gossip_menu` VALUES (4547, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4547, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4547, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4547, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4547, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4547, 8255, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4547;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4547, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4547, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4547, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4547, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4547 WHERE `entry` = 4595;

-- Father Lazarus
DELETE FROM `gossip_menu` WHERE `entry`=4543;
INSERT INTO `gossip_menu` VALUES (4543, 4442, 94);
INSERT INTO `gossip_menu` VALUES (4543, 4439, 95);
INSERT INTO `gossip_menu` VALUES (4543, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4543, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4543, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4543, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4543, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4543, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4543;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4543, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4543, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4543, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4543, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4543 WHERE `entry` = 4608;

-- Kelv Sternhammer
DELETE FROM `gossip_menu` WHERE `entry`=4570;
INSERT INTO `gossip_menu` VALUES (4570, 1215, 98);
INSERT INTO `gossip_menu` VALUES (4570, 5724, 99);
INSERT INTO `gossip_menu` VALUES (4570, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4570, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4570, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4570, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4570, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4570, 8254, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4570;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4570, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4570, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4570, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4570, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4570 WHERE `entry` = 5113;

-- Valgar Highforge
DELETE FROM `gossip_menu` WHERE `entry`=4557;
INSERT INTO `gossip_menu` VALUES (4557, 3974, 106);
INSERT INTO `gossip_menu` VALUES (4557, 3975, 105);
INSERT INTO `gossip_menu` VALUES (4557, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4557, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4557, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4557, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4557, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4557, 8254, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4557;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4557, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4557, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4557, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4557, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4557 WHERE `entry` = 5147;

-- Beldruk Doombrow
DELETE FROM `gossip_menu` WHERE `entry`=4556;
INSERT INTO `gossip_menu` VALUES (4556, 3974, 106);
INSERT INTO `gossip_menu` VALUES (4556, 3975, 105);
INSERT INTO `gossip_menu` VALUES (4556, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4556, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4556, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4556, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4556, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4556, 8254, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4556;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4556, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4556, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4556, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4556, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4556 WHERE `entry` = 5148;

-- Brother Benjamin
DELETE FROM `gossip_menu` WHERE `entry`=4468;
INSERT INTO `gossip_menu` VALUES (4468, 4433, 94);
INSERT INTO `gossip_menu` VALUES (4468, 4434, 95);
INSERT INTO `gossip_menu` VALUES (4468, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4468, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4468, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4468, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4468, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4468, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4468;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4468, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4468, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4468, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4468, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4468 WHERE `entry` = 5484;

-- Arthur the Faithful
DELETE FROM `gossip_menu` WHERE `entry`=4469;
INSERT INTO `gossip_menu` VALUES (4469, 3976, 0);
INSERT INTO `gossip_menu` VALUES (4469, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4469, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4469, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4469, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4469, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4469, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4469;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4469, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4469, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4469, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4469, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4469 WHERE `entry` = 5491;

-- Katherine the Pure
DELETE FROM `gossip_menu` WHERE `entry`=4470;
INSERT INTO `gossip_menu` VALUES (4470, 3976, 0);
INSERT INTO `gossip_menu` VALUES (4470, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4470, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4470, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4470, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4470, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4470, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4470;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4470, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4470, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4470, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4470, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=4470 WHERE `entry` = 5492;

-- Jennea Cannon
DELETE FROM `gossip_menu` WHERE `entry`=4485;
INSERT INTO `gossip_menu` VALUES (4485, 538, 90);
INSERT INTO `gossip_menu` VALUES (4485, 539, 91);
INSERT INTO `gossip_menu` VALUES (4485, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4485, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4485, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4485, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4485, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4485, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4485;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4485, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4485, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4485, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4485, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4485 WHERE `entry` = 5497;

-- Elsharin
DELETE FROM `gossip_menu` WHERE `entry`=4484;
INSERT INTO `gossip_menu` VALUES (4484, 538, 90);
INSERT INTO `gossip_menu` VALUES (4484, 539, 91);
INSERT INTO `gossip_menu` VALUES (4484, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4484, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4484, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4484, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4484, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4484, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4484;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4484, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4484, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4484, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4484, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4484 WHERE `entry` = 5498;

-- Ulfir Ironbeard
DELETE FROM `gossip_menu` WHERE `entry`=4473;
INSERT INTO `gossip_menu` VALUES (4473, 4893, 96);
INSERT INTO `gossip_menu` VALUES (4473, 5000, 97);
INSERT INTO `gossip_menu` VALUES (4473, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4473, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4473, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4473, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4473, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4473, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4473;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4473, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4473, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4473, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4473, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4473 WHERE `entry` = 5516;

-- Thorfin Stoneshield
DELETE FROM `gossip_menu` WHERE `entry`=4472;
INSERT INTO `gossip_menu` VALUES (4472, 4893, 96);
INSERT INTO `gossip_menu` VALUES (4472, 5000, 97);
INSERT INTO `gossip_menu` VALUES (4472, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4472, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4472, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4472, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4472, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4472, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4472;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4472, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4472, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4472, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4472, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4472 WHERE `entry` = 5517;

-- X'yera
DELETE FROM `gossip_menu` WHERE `entry`=4523;
INSERT INTO `gossip_menu` VALUES (4523, 4441, 94);
INSERT INTO `gossip_menu` VALUES (4523, 4440, 95);
INSERT INTO `gossip_menu` VALUES (4523, 8296, 460);
INSERT INTO `gossip_menu` VALUES (4523, 8283, 459);
INSERT INTO `gossip_menu` VALUES (4523, 8291, 458);
INSERT INTO `gossip_menu` VALUES (4523, 8298, 455);
INSERT INTO `gossip_menu` VALUES (4523, 8285, 454);
INSERT INTO `gossip_menu` VALUES (4523, 8263, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4523;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4523, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4523, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4523, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4523, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4523 WHERE `entry` = 6014;

-- Brother Karman
DELETE FROM `gossip_menu` WHERE `entry`=4662;
INSERT INTO `gossip_menu` VALUES (4662, 3976, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4662;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4662, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4662, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
UPDATE `creature_template` SET `gossip_menu_id`=4662 WHERE `entry` = 8140;

-- Dargh Trueaim
DELETE FROM `gossip_menu` WHERE `entry`=4674;
INSERT INTO `gossip_menu` VALUES (4674, 4999, 96);
INSERT INTO `gossip_menu` VALUES (4674, 5000, 97);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4674;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4674, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4674, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
UPDATE `creature_template` SET `gossip_menu_id`=4674 WHERE `entry` = 10930;

-- Nara Meideros
DELETE FROM `gossip_menu` WHERE `entry`=3643;
INSERT INTO `gossip_menu` VALUES (3643, 4438, 94);
INSERT INTO `gossip_menu` VALUES (3643, 4437, 95);
INSERT INTO `gossip_menu` VALUES (3643, 8285, 454);
INSERT INTO `gossip_menu` VALUES (3643, 8298, 455);
INSERT INTO `gossip_menu` VALUES (3643, 8291, 458);
INSERT INTO `gossip_menu` VALUES (3643, 8283, 459);
INSERT INTO `gossip_menu` VALUES (3643, 8296, 460);
INSERT INTO `gossip_menu` VALUES (3643, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3643;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3643, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3643, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3643, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3643, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=3643 WHERE `entry` = 11397;

-- Lord Tony Romano
DELETE FROM `gossip_menu` WHERE `entry`=5061;
INSERT INTO `gossip_menu` VALUES (5061, 4835, 100);
INSERT INTO `gossip_menu` VALUES (5061, 4837, 101);
INSERT INTO `gossip_menu` VALUES (5061, 5996, 198);
INSERT INTO `gossip_menu` VALUES (5061, 8283, 459);
INSERT INTO `gossip_menu` VALUES (5061, 8285, 454);
INSERT INTO `gossip_menu` VALUES (5061, 8291, 458);
INSERT INTO `gossip_menu` VALUES (5061, 8296, 460);
INSERT INTO `gossip_menu` VALUES (5061, 8298, 455);
INSERT INTO `gossip_menu` VALUES (5061, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5061;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5061, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5061, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5061, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5061, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, '', 0, 461);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5061, 4, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, '', 0, 462);
UPDATE `creature_template` SET `gossip_menu_id`=5061 WHERE `entry` = 13283;

-- Sagorne Creststrider
DELETE FROM `gossip_menu` WHERE `entry`=5123;
INSERT INTO `gossip_menu` VALUES (5123, 5005, 92);
INSERT INTO `gossip_menu` VALUES (5123, 5006, 93);
INSERT INTO `gossip_menu` VALUES (5123, 8285, 454);
INSERT INTO `gossip_menu` VALUES (5123, 8298, 455);
INSERT INTO `gossip_menu` VALUES (5123, 8291, 458);
INSERT INTO `gossip_menu` VALUES (5123, 8283, 459);
INSERT INTO `gossip_menu` VALUES (5123, 8296, 460);
INSERT INTO `gossip_menu` VALUES (5123, 8244, 461);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5123;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5123, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5123, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5123, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5123, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=5123 WHERE `entry` = 13417;

-- Bom'bay
UPDATE `gossip_menu` SET `entry`=3062 WHERE `entry`=10578;
UPDATE `gossip_menu_option` SET `menu_id`=3062 WHERE `menu_id`=10578;
UPDATE `creature_template` SET `gossip_menu_id`=3062 WHERE `entry` = 10578;

-- Raene Wolfrunner
UPDATE `gossip_menu` SET `entry`=5502 WHERE `entry`=50500;
UPDATE `gossip_menu_option` SET `menu_id`=5502 WHERE `menu_id`=50500;
UPDATE `creature_template` SET `gossip_menu_id`=5502 WHERE `entry` = 3691;

-- Yeh'kinya
DELETE FROM `gossip_menu` WHERE `entry`=1470;
UPDATE `gossip_menu` SET `entry`=1470 WHERE `entry`=50408;
UPDATE `gossip_menu_option` SET `menu_id`=1470 WHERE `menu_id`=50408;
UPDATE `creature_template` SET `gossip_menu_id`=1470 WHERE `entry` = 8579;

-- Morja
UPDATE `gossip_menu` SET `entry`=6227 WHERE `entry`=14871;
UPDATE `gossip_menu_option` SET `menu_id`=6227 WHERE `menu_id`=14871;
UPDATE `creature_template` SET `gossip_menu_id`=6227 WHERE `entry` = 14871;

-- Master Sergeant Maclure
DELETE FROM `gossip_menu` WHERE `entry`=6786;
UPDATE `gossip_menu` SET `entry`=6786 WHERE `entry`=20054;
UPDATE `gossip_menu_option` SET `menu_id`=6786 WHERE `menu_id`=20054;
UPDATE `creature_template` SET `gossip_menu_id`=6786 WHERE `entry` = 15708;

-- Marda Weller
DELETE FROM `gossip_menu` WHERE `entry`=9017;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9017;
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry` = 1287;

-- Mayda Thane
DELETE FROM `gossip_menu` WHERE `entry`=9049;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9049;
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1339;

-- Crier Goodman
DELETE FROM `gossip_menu` WHERE `entry`=9084;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9084;
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 2198;

-- Brooke Stonebraid
DELETE FROM `gossip_menu` WHERE `entry`=9387;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9387;
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5514;

-- Courier Hammerfall
DELETE FROM `gossip_menu` WHERE `entry`=9548;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9548;
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10877;

-- Harbinger Balthazad
DELETE FROM `gossip_menu` WHERE `entry`=9549;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9549;
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10879;

-- Charys Yserian
DELETE FROM `gossip_menu` WHERE `entry`=9031;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9031;
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry` = 1307;

-- Ardwyn Cailen
DELETE FROM `gossip_menu` WHERE `entry`=9036;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9036;
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry` = 1312;

-- Maria Lumere
DELETE FROM `gossip_menu` WHERE `entry`=9037;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9037;
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry` = 1313;

-- Alyssa Griffith
DELETE FROM `gossip_menu` WHERE `entry`=9045;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9045;
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry` = 1321;

-- Erika Tate
DELETE FROM `gossip_menu` WHERE `entry`=9376;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9376;
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry` = 5483;

-- Jillian Tanner
DELETE FROM `gossip_menu` WHERE `entry`=9392;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9392;
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry` = 5565;

-- Rexxar
UPDATE `gossip_menu_option` SET `menu_id`=5481 WHERE `menu_id`=10182;

-- Matrix Punchograph 3005-B
UPDATE `gossip_menu` SET `entry`=1047 WHERE `entry`=20003;
UPDATE `gossip_menu_option` SET `menu_id`=1047 WHERE `menu_id`=20003;
UPDATE `gossip_menu_option` SET `action_menu_id`=1047 WHERE `action_menu_id`=20003;
UPDATE `gossip_menu` SET `entry`=1046 WHERE `entry`=20004;
UPDATE `gossip_menu_option` SET `menu_id`=1046 WHERE `menu_id`=20004;
UPDATE `gossip_menu_option` SET `action_menu_id`=1046 WHERE `action_menu_id`=20004;

-- Matrix Punchograph 3005-C
UPDATE `gossip_menu` SET `entry`=1049 WHERE `entry`=20007;
UPDATE `gossip_menu_option` SET `menu_id`=1049 WHERE `menu_id`=20007;
UPDATE `gossip_menu_option` SET `action_menu_id`=1049 WHERE `action_menu_id`=20007;
UPDATE `gossip_menu` SET `entry`=1048 WHERE `entry`=20008;
UPDATE `gossip_menu_option` SET `menu_id`=1048 WHERE `menu_id`=20008;
UPDATE `gossip_menu_option` SET `action_menu_id`=1048 WHERE `action_menu_id`=20008;

-- Matrix Punchograph 3005-D
UPDATE `gameobject_template` SET `data3`=1050 WHERE `entry`=142696;
UPDATE `gossip_menu` SET `entry`=1050 WHERE `entry`=20009;
UPDATE `gossip_menu_option` SET `menu_id`=1050 WHERE `menu_id`=20009;
UPDATE `gossip_menu_option` SET `action_menu_id`=1050 WHERE `action_menu_id`=20009;
UPDATE `gossip_menu` SET `entry`=1052 WHERE `entry`=20010;
UPDATE `gossip_menu_option` SET `menu_id`=1052 WHERE `menu_id`=20010;
UPDATE `gossip_menu_option` SET `action_menu_id`=1052 WHERE `action_menu_id`=20010;

-- Correct wrong gossip ids for multiple mobs.
UPDATE `gossip_menu` SET `entry`=701 WHERE `entry`=9030;
UPDATE `gossip_menu` SET `entry`=700 WHERE `entry`=9035;
UPDATE `gossip_menu` SET `entry`=706 WHERE `entry`=9047;
DELETE FROM `gossip_menu` WHERE `entry`=702;
UPDATE `gossip_menu` SET `entry`=702 WHERE `entry`=9048;
DELETE FROM `gossip_menu` WHERE `entry`=6951;
UPDATE `gossip_menu` SET `entry`=6951 WHERE `entry`=9067;
UPDATE `gossip_menu` SET `entry`=6565 WHERE `entry`=9105;
DELETE FROM `gossip_menu` WHERE `entry`=1624;
UPDATE `gossip_menu` SET `entry`=1624 WHERE `entry`=9146;
DELETE FROM `gossip_menu` WHERE `entry`=980;
UPDATE `gossip_menu` SET `entry`=980 WHERE `entry`=9194;
UPDATE `gossip_menu` SET `entry`=7487 WHERE `entry`=9213;
UPDATE `gossip_menu` SET `entry`=4305 WHERE `entry`=9248;
UPDATE `gossip_menu` SET `entry`=4283 WHERE `entry`=9261;
UPDATE `gossip_menu` SET `entry`=683 WHERE `entry`=9381;
UPDATE `gossip_menu` SET `entry`=5641 WHERE `entry`=9457;
UPDATE `gossip_menu` SET `entry`=6229 WHERE `entry`=9480;
UPDATE `gossip_menu` SET `entry`=1120 WHERE `entry`=9493;
DELETE FROM `gossip_menu` WHERE `entry`=9501;
UPDATE `gossip_menu` SET `entry`=4325 WHERE `entry`=9508;
UPDATE `gossip_menu` SET `entry`=1681 WHERE `entry`=9526;
UPDATE `gossip_menu` SET `entry`=2941 WHERE `entry`=9546;
UPDATE `gossip_menu` SET `entry`=2943 WHERE `entry`=9547;
UPDATE `gossip_menu` SET `entry`=3661 WHERE `entry`=9578;
UPDATE `gossip_menu` SET `entry`=3662 WHERE `entry`=9579;
UPDATE `gossip_menu` SET `entry`=5848 WHERE `entry`=9584;
UPDATE `gossip_menu` SET `entry`=6041 WHERE `entry`=9589;
DELETE FROM `gossip_menu` WHERE `entry`=6043;
UPDATE `gossip_menu` SET `entry`=6043 WHERE `entry`=9590;
DELETE FROM `gossip_menu` WHERE `entry`=6042;
UPDATE `gossip_menu` SET `entry`=6042 WHERE `entry`=9591;
DELETE FROM `gossip_menu` WHERE `entry`=6044;
UPDATE `gossip_menu` SET `entry`=6044 WHERE `entry`=9592;
UPDATE `gossip_menu` SET `entry`=6035 WHERE `entry`=9593;
UPDATE `gossip_menu` SET `entry`=6034 WHERE `entry`=9594;
UPDATE `gossip_menu` SET `entry`=6037 WHERE `entry`=9595;
UPDATE `gossip_menu` SET `entry`=6036 WHERE `entry`=9596;
DELETE FROM `gossip_menu` WHERE `entry`=9601;
DELETE FROM `gossip_menu` WHERE `entry`=9602;
UPDATE `gossip_menu` SET `entry`=5482 WHERE `entry`=10929;
DELETE FROM `gossip_menu` WHERE `entry`=6321;
UPDATE `gossip_menu` SET `entry`=6321 WHERE `entry`=14902;
DELETE FROM `gossip_menu` WHERE `entry`=6322;
UPDATE `gossip_menu` SET `entry`=6322 WHERE `entry`=14903;
DELETE FROM `gossip_menu` WHERE `entry`=6341;
UPDATE `gossip_menu` SET `entry`=6341 WHERE `entry`=14904;
UPDATE `gossip_menu` SET `entry`=6539 WHERE `entry`=15192;
UPDATE `gossip_menu` SET `entry`=6928 WHERE `entry`=15498;
UPDATE `gossip_menu` SET `entry`=6925 WHERE `entry`=15499;
UPDATE `gossip_menu` SET `entry`=6927 WHERE `entry`=15500;
UPDATE `gossip_menu` SET `entry`=1341 WHERE `entry`=16032;
UPDATE `gossip_menu` SET `entry`=7054 WHERE `entry`=16075;
UPDATE `gossip_menu` SET `entry`=5304 WHERE `entry`=50006;
UPDATE `gossip_menu_option` SET `menu_id`=701 WHERE `menu_id`=9030;
UPDATE `gossip_menu_option` SET `menu_id`=700 WHERE `menu_id`=9035;
UPDATE `gossip_menu_option` SET `menu_id`=706 WHERE `menu_id`=9047;
UPDATE `gossip_menu_option` SET `menu_id`=702 WHERE `menu_id`=9048;
UPDATE `gossip_menu_option` SET `menu_id`=6951 WHERE `menu_id`=9067;
UPDATE `gossip_menu_option` SET `menu_id`=6565 WHERE `menu_id`=9105;
UPDATE `gossip_menu_option` SET `menu_id`=1624 WHERE `menu_id`=9146;
UPDATE `gossip_menu_option` SET `menu_id`=980 WHERE `menu_id`=9194;
UPDATE `gossip_menu_option` SET `menu_id`=7487 WHERE `menu_id`=9213;
UPDATE `gossip_menu_option` SET `menu_id`=4305 WHERE `menu_id`=9248;
UPDATE `gossip_menu_option` SET `menu_id`=4283 WHERE `menu_id`=9261;
UPDATE `gossip_menu_option` SET `menu_id`=683 WHERE `menu_id`=9381;
UPDATE `gossip_menu_option` SET `menu_id`=5641 WHERE `menu_id`=9457;
UPDATE `gossip_menu_option` SET `menu_id`=6229 WHERE `menu_id`=9480;
UPDATE `gossip_menu_option` SET `menu_id`=1120 WHERE `menu_id`=9493;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9501;
UPDATE `gossip_menu_option` SET `menu_id`=4325 WHERE `menu_id`=9508;
UPDATE `gossip_menu_option` SET `menu_id`=1681 WHERE `menu_id`=9526;
UPDATE `gossip_menu_option` SET `menu_id`=2941 WHERE `menu_id`=9546;
UPDATE `gossip_menu_option` SET `menu_id`=2943 WHERE `menu_id`=9547;
UPDATE `gossip_menu_option` SET `menu_id`=3661 WHERE `menu_id`=9578;
UPDATE `gossip_menu_option` SET `menu_id`=3662 WHERE `menu_id`=9579;
UPDATE `gossip_menu_option` SET `menu_id`=5848 WHERE `menu_id`=9584;
UPDATE `gossip_menu_option` SET `menu_id`=6041 WHERE `menu_id`=9589;
UPDATE `gossip_menu_option` SET `menu_id`=6043 WHERE `menu_id`=9590;
UPDATE `gossip_menu_option` SET `menu_id`=6042 WHERE `menu_id`=9591;
UPDATE `gossip_menu_option` SET `menu_id`=6044 WHERE `menu_id`=9592;
UPDATE `gossip_menu_option` SET `menu_id`=6035 WHERE `menu_id`=9593;
UPDATE `gossip_menu_option` SET `menu_id`=6034 WHERE `menu_id`=9594;
UPDATE `gossip_menu_option` SET `menu_id`=6037 WHERE `menu_id`=9595;
UPDATE `gossip_menu_option` SET `menu_id`=6036 WHERE `menu_id`=9596;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9601;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9602;
UPDATE `gossip_menu_option` SET `menu_id`=5482 WHERE `menu_id`=10929;
UPDATE `gossip_menu_option` SET `menu_id`=6321 WHERE `menu_id`=14902;
UPDATE `gossip_menu_option` SET `menu_id`=6322 WHERE `menu_id`=14903;
UPDATE `gossip_menu_option` SET `menu_id`=6341 WHERE `menu_id`=14904;
UPDATE `gossip_menu_option` SET `menu_id`=6539 WHERE `menu_id`=15192;
UPDATE `gossip_menu_option` SET `menu_id`=6928 WHERE `menu_id`=15498;
UPDATE `gossip_menu_option` SET `menu_id`=6925 WHERE `menu_id`=15499;
UPDATE `gossip_menu_option` SET `menu_id`=6927 WHERE `menu_id`=15500;
UPDATE `gossip_menu_option` SET `menu_id`=1341 WHERE `menu_id`=16032;
UPDATE `gossip_menu_option` SET `menu_id`=7054 WHERE `menu_id`=16075;
UPDATE `gossip_menu_option` SET `menu_id`=5304 WHERE `menu_id`=50006;
UPDATE `gossip_menu_option` SET `action_menu_id`=701 WHERE `action_menu_id`=9030;
UPDATE `gossip_menu_option` SET `action_menu_id`=700 WHERE `action_menu_id`=9035;
UPDATE `gossip_menu_option` SET `action_menu_id`=706 WHERE `action_menu_id`=9047;
UPDATE `gossip_menu_option` SET `action_menu_id`=702 WHERE `action_menu_id`=9048;
UPDATE `gossip_menu_option` SET `action_menu_id`=6951 WHERE `action_menu_id`=9067;
UPDATE `gossip_menu_option` SET `action_menu_id`=6565 WHERE `action_menu_id`=9105;
UPDATE `gossip_menu_option` SET `action_menu_id`=1624 WHERE `action_menu_id`=9146;
UPDATE `gossip_menu_option` SET `action_menu_id`=980 WHERE `action_menu_id`=9194;
UPDATE `gossip_menu_option` SET `action_menu_id`=7487 WHERE `action_menu_id`=9213;
UPDATE `gossip_menu_option` SET `action_menu_id`=4305 WHERE `action_menu_id`=9248;
UPDATE `gossip_menu_option` SET `action_menu_id`=4283 WHERE `action_menu_id`=9261;
UPDATE `gossip_menu_option` SET `action_menu_id`=683 WHERE `action_menu_id`=9381;
UPDATE `gossip_menu_option` SET `action_menu_id`=5641 WHERE `action_menu_id`=9457;
UPDATE `gossip_menu_option` SET `action_menu_id`=6229 WHERE `action_menu_id`=9480;
UPDATE `gossip_menu_option` SET `action_menu_id`=1120 WHERE `action_menu_id`=9493;
UPDATE `gossip_menu_option` SET `action_menu_id`=6565 WHERE `action_menu_id`=9501;
UPDATE `gossip_menu_option` SET `action_menu_id`=4325 WHERE `action_menu_id`=9508;
UPDATE `gossip_menu_option` SET `action_menu_id`=1681 WHERE `action_menu_id`=9526;
UPDATE `gossip_menu_option` SET `action_menu_id`=2941 WHERE `action_menu_id`=9546;
UPDATE `gossip_menu_option` SET `action_menu_id`=2943 WHERE `action_menu_id`=9547;
UPDATE `gossip_menu_option` SET `action_menu_id`=3661 WHERE `action_menu_id`=9578;
UPDATE `gossip_menu_option` SET `action_menu_id`=3662 WHERE `action_menu_id`=9579;
UPDATE `gossip_menu_option` SET `action_menu_id`=5848 WHERE `action_menu_id`=9584;
UPDATE `gossip_menu_option` SET `action_menu_id`=6041 WHERE `action_menu_id`=9589;
UPDATE `gossip_menu_option` SET `action_menu_id`=6043 WHERE `action_menu_id`=9590;
UPDATE `gossip_menu_option` SET `action_menu_id`=6042 WHERE `action_menu_id`=9591;
UPDATE `gossip_menu_option` SET `action_menu_id`=6044 WHERE `action_menu_id`=9592;
UPDATE `gossip_menu_option` SET `action_menu_id`=6035 WHERE `action_menu_id`=9593;
UPDATE `gossip_menu_option` SET `action_menu_id`=6034 WHERE `action_menu_id`=9594;
UPDATE `gossip_menu_option` SET `action_menu_id`=6037 WHERE `action_menu_id`=9595;
UPDATE `gossip_menu_option` SET `action_menu_id`=6036 WHERE `action_menu_id`=9596;
UPDATE `gossip_menu_option` SET `action_menu_id`=5482 WHERE `action_menu_id`=10929;
UPDATE `gossip_menu_option` SET `action_menu_id`=6321 WHERE `action_menu_id`=14902;
UPDATE `gossip_menu_option` SET `action_menu_id`=6322 WHERE `action_menu_id`=14903;
UPDATE `gossip_menu_option` SET `action_menu_id`=6341 WHERE `action_menu_id`=14904;
UPDATE `gossip_menu_option` SET `action_menu_id`=6539 WHERE `action_menu_id`=15192;
UPDATE `gossip_menu_option` SET `action_menu_id`=6928 WHERE `action_menu_id`=15498;
UPDATE `gossip_menu_option` SET `action_menu_id`=6925 WHERE `action_menu_id`=15499;
UPDATE `gossip_menu_option` SET `action_menu_id`=6927 WHERE `action_menu_id`=15500;
UPDATE `gossip_menu_option` SET `action_menu_id`=1341 WHERE `action_menu_id`=16032;
UPDATE `gossip_menu_option` SET `action_menu_id`=7054 WHERE `action_menu_id`=16075;
UPDATE `gossip_menu_option` SET `action_menu_id`=5304 WHERE `action_menu_id`=50006;
UPDATE `creature_template` SET `gossip_menu_id`=701 WHERE `gossip_menu_id`=9030;
UPDATE `creature_template` SET `gossip_menu_id`=700 WHERE `gossip_menu_id`=9035;
UPDATE `creature_template` SET `gossip_menu_id`=706 WHERE `gossip_menu_id`=9047;
UPDATE `creature_template` SET `gossip_menu_id`=702 WHERE `gossip_menu_id`=9048;
UPDATE `creature_template` SET `gossip_menu_id`=6951 WHERE `gossip_menu_id`=9067;
UPDATE `creature_template` SET `gossip_menu_id`=6565 WHERE `gossip_menu_id`=9105;
UPDATE `creature_template` SET `gossip_menu_id`=1624 WHERE `gossip_menu_id`=9146;
UPDATE `creature_template` SET `gossip_menu_id`=980 WHERE `gossip_menu_id`=9194;
UPDATE `creature_template` SET `gossip_menu_id`=7487 WHERE `gossip_menu_id`=9213;
UPDATE `creature_template` SET `gossip_menu_id`=4305 WHERE `gossip_menu_id`=9248;
UPDATE `creature_template` SET `gossip_menu_id`=4283 WHERE `gossip_menu_id`=9261;
UPDATE `creature_template` SET `gossip_menu_id`=683 WHERE `gossip_menu_id`=9381;
UPDATE `creature_template` SET `gossip_menu_id`=5641 WHERE `gossip_menu_id`=9457;
UPDATE `creature_template` SET `gossip_menu_id`=6229 WHERE `gossip_menu_id`=9480;
UPDATE `creature_template` SET `gossip_menu_id`=1120 WHERE `gossip_menu_id`=9493;
UPDATE `creature_template` SET `gossip_menu_id`=6565 WHERE `gossip_menu_id`=9501;
UPDATE `creature_template` SET `gossip_menu_id`=4325 WHERE `gossip_menu_id`=9508;
UPDATE `creature_template` SET `gossip_menu_id`=1681 WHERE `gossip_menu_id`=9526;
UPDATE `creature_template` SET `gossip_menu_id`=2941 WHERE `gossip_menu_id`=9546;
UPDATE `creature_template` SET `gossip_menu_id`=2943 WHERE `gossip_menu_id`=9547;
UPDATE `creature_template` SET `gossip_menu_id`=3661 WHERE `gossip_menu_id`=9578;
UPDATE `creature_template` SET `gossip_menu_id`=3662 WHERE `gossip_menu_id`=9579;
UPDATE `creature_template` SET `gossip_menu_id`=5848 WHERE `gossip_menu_id`=9584;
UPDATE `creature_template` SET `gossip_menu_id`=6041 WHERE `gossip_menu_id`=9589;
UPDATE `creature_template` SET `gossip_menu_id`=6043 WHERE `gossip_menu_id`=9590;
UPDATE `creature_template` SET `gossip_menu_id`=6042 WHERE `gossip_menu_id`=9591;
UPDATE `creature_template` SET `gossip_menu_id`=6044 WHERE `gossip_menu_id`=9592;
UPDATE `creature_template` SET `gossip_menu_id`=6035 WHERE `gossip_menu_id`=9593;
UPDATE `creature_template` SET `gossip_menu_id`=6034 WHERE `gossip_menu_id`=9594;
UPDATE `creature_template` SET `gossip_menu_id`=6037 WHERE `gossip_menu_id`=9595;
UPDATE `creature_template` SET `gossip_menu_id`=6036 WHERE `gossip_menu_id`=9596;
UPDATE `creature_template` SET `gossip_menu_id`=7034 WHERE `gossip_menu_id`=9601;
UPDATE `creature_template` SET `gossip_menu_id`=7034 WHERE `gossip_menu_id`=9602;
UPDATE `creature_template` SET `gossip_menu_id`=5482 WHERE `gossip_menu_id`=10929;
UPDATE `creature_template` SET `gossip_menu_id`=6321 WHERE `gossip_menu_id`=14902;
UPDATE `creature_template` SET `gossip_menu_id`=6322 WHERE `gossip_menu_id`=14903;
UPDATE `creature_template` SET `gossip_menu_id`=6341 WHERE `gossip_menu_id`=14904;
UPDATE `creature_template` SET `gossip_menu_id`=6539 WHERE `gossip_menu_id`=15192;
UPDATE `creature_template` SET `gossip_menu_id`=6928 WHERE `gossip_menu_id`=15498;
UPDATE `creature_template` SET `gossip_menu_id`=6925 WHERE `gossip_menu_id`=15499;
UPDATE `creature_template` SET `gossip_menu_id`=6927 WHERE `gossip_menu_id`=15500;
UPDATE `creature_template` SET `gossip_menu_id`=1341 WHERE `gossip_menu_id`=16032;
UPDATE `creature_template` SET `gossip_menu_id`=7054 WHERE `gossip_menu_id`=16075;
UPDATE `creature_template` SET `gossip_menu_id`=5304 WHERE `gossip_menu_id`=50006;

-- Remove Valentine options from NPCs without EventAI.
DELETE FROM `gossip_menu` WHERE `entry` IN (4660, 4675, 4684, 4663, 4678, 4653, 3645, 4654, 3645, 4534, 4695) && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (4660, 4675, 4684, 4663, 4678, 4653, 3645, 4654, 3645, 4534, 4695) && `OptionBroadcastTextID`=11723;

-- Cleanup unused gossip_menu.
DELETE FROM `gossip_menu` WHERE `entry` IN (4668, 4669, 4670, 4784, 6611, 9308, 9726, 10182, 65535);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (4668, 4669, 4670, 4784, 6611, 9308, 9726, 10182, 65535);

-- Altar of Suntara
INSERT INTO `gossip_menu` VALUES (1282, 1918, 0);

-- Altar of Hakkar
INSERT INTO `gossip_menu` VALUES (1288, 1923, 0);

-- Book "Soothsaying for Dummies"
INSERT INTO `gossip_menu` VALUES (7058, 8321, 0);

-- Wickerman Ember
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (334, 1, 24705, 0, 0, 0, 1);
INSERT INTO `gossip_menu` VALUES (6535, 7737, 334);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (335, 1, 24705, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (6535, 7738, 335);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6535, 0, 0, 'Smear the ash on my face like war paint!', 10660, 1, 0, -1, 0, 653501, 0, 0, '', 0, 334);
DELETE FROM `gossip_scripts` WHERE `id`=653501;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (653501, 0, 15, 24705, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wickerman Ember - Cast Spell Invocation of the Wickerman');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
