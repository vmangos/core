DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200508170149');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200508170149');
-- Add your query below.


-- Lara Moore
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry` = 1295;

-- Frederick Stover
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 1298;

-- Lisbeth Schneider
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry` = 1299;

-- Felicia Gump
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (703, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=703 WHERE `entry` = 1303;

-- Darian Singh
INSERT INTO `gossip_menu` VALUES (682, 1232, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (682, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1304;

-- Owen Vaughn
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1308;

-- Evan Larson
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1310;

-- Duncan Cullen
UPDATE `creature_template` SET `gossip_menu_id`=682 WHERE `entry` = 1314;

-- Jessara Cordell
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry` = 1318;

-- Bryan Cross
INSERT INTO `gossip_menu` VALUES (689, 1239, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (689, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1319;

-- Heinrich Stone
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1324;

-- Wilhelm Strang
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry` = 1341;

-- Gregory Ardus
INSERT INTO `gossip_menu` VALUES (692, 1242, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (692, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1348;

-- Agustus Moulaine
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1349;

-- Theresa Moulaine
INSERT INTO `gossip_menu` VALUES (691, 1241, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (691, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=691 WHERE `entry` = 1350;

-- Brother Cassius
UPDATE `creature_template` SET `gossip_menu_id`=692 WHERE `entry` = 1351;

-- Ian Strom
INSERT INTO `gossip_menu` VALUES (4658, 6165, 100);
INSERT INTO `gossip_menu` VALUES (4658, 6164, 101);
INSERT INTO `gossip_menu` VALUES (4658, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1081, -1, 107, 100, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4658, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
UPDATE `creature_template` SET `gossip_menu_id`=4658 WHERE `entry` = 1411;

-- David Trias
INSERT INTO `gossip_menu` VALUES (85, 4796, 101);
INSERT INTO `gossip_menu` VALUES (85, 581, 100);
INSERT INTO `gossip_menu` VALUES (85, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (85, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
UPDATE `creature_template` SET `gossip_menu_id`=85 WHERE `entry` = 2122;

-- Marion Call
UPDATE `creature_template` SET `gossip_menu_id`=85 WHERE `entry` = 2130;

-- Felicia Maline
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2409;

-- Darla Harris
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2432;

-- Xizk Goodstitch
INSERT INTO `gossip_menu` VALUES (2685, 3358, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2685, 1, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2685 WHERE `entry` = 2670;

-- Urda
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2851;

-- Gorrik
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 2861;

-- Kaplak
INSERT INTO `gossip_menu` VALUES (141, 4793, 101);
INSERT INTO `gossip_menu` VALUES (141, 638, 100);
INSERT INTO `gossip_menu` VALUES (141, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (141, 4, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
UPDATE `creature_template` SET `gossip_menu_id`=141 WHERE `entry` = 3170;

-- Gest
INSERT INTO `gossip_menu` VALUES (4513, 4793, 101);
INSERT INTO `gossip_menu` VALUES (4513, 638, 100);
INSERT INTO `gossip_menu` VALUES (4513, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4513, 0, 3, 'I would like training.', 2603, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
UPDATE `creature_template` SET `gossip_menu_id`=4513 WHERE `entry` = 3327;

-- Urtrun Clanbringer
INSERT INTO `gossip_menu` VALUES (1626, 2280, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1626, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1626, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1626 WHERE `entry` = 3370;

-- Shenthul
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1024, 8, 2458, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (50199, 1124, 1024);
INSERT INTO `gossip_menu` VALUES (50199, 1038, 100);
INSERT INTO `gossip_menu` VALUES (50199, 4793, 101);
INSERT INTO `gossip_menu` VALUES (50199, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50199, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=50199 WHERE `entry` = 3401;

-- Daelyshia
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4267;

-- Thyssiana
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4319;

-- Teloren
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 4407;

-- Carolyn Ward
INSERT INTO `gossip_menu` VALUES (4542, 4796, 0);
INSERT INTO `gossip_menu` VALUES (4542, 581, 100);
INSERT INTO `gossip_menu` VALUES (4542, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4542, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=4542 WHERE `entry` = 4582;

-- Gregory Charles
INSERT INTO `gossip_menu` VALUES (4541, 4796, 0);
INSERT INTO `gossip_menu` VALUES (4541, 581, 100);
INSERT INTO `gossip_menu` VALUES (4541, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 0, 3, 'Can you train me how to use rogue skills?', 7491, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 2, 0, '<Take the letter>', 8548, 1, 1, -1, 0, 16, 0, 0, '', 0, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4541, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 136);
UPDATE `creature_template` SET `gossip_menu_id`=4541 WHERE `entry` = 4584;

-- Christopher Drakul
INSERT INTO `gossip_menu` VALUES (5108, 6159, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5108, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5108, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5108 WHERE `entry` = 4613;

-- Aldwin Laughlin
INSERT INTO `gossip_menu` VALUES (708, 1260, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (708, 0, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (708, 1, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=708 WHERE `entry` = 4974;

-- Ben Trias
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 4981;

-- Rutgar Glyphshaper
UPDATE `gossip_menu` SET `entry`=6533 WHERE `entry`=5460;
UPDATE `gossip_menu_option` SET `menu_id`=6534 WHERE `menu_id`=5460;
UPDATE `gossip_menu_option` SET `action_menu_id`=6534 WHERE `action_menu_id`=5460;
UPDATE `gossip_menu` SET `entry`=6551 WHERE `entry`=5461;
UPDATE `gossip_menu_option` SET `menu_id`=6551 WHERE `menu_id`=5461;
UPDATE `gossip_menu_option` SET `action_menu_id`=6551 WHERE `action_menu_id`=5461;
UPDATE `gossip_menu` SET `entry`=6550 WHERE `entry`=5462;
UPDATE `gossip_menu_option` SET `menu_id`=6550 WHERE `menu_id`=5462;
UPDATE `gossip_menu_option` SET `action_menu_id`=6550 WHERE `action_menu_id`=5462;
UPDATE `gossip_menu` SET `entry`=6549 WHERE `entry`=5463;
UPDATE `gossip_menu_option` SET `menu_id`=6549 WHERE `menu_id`=5463;
UPDATE `gossip_menu_option` SET `action_menu_id`=6549 WHERE `action_menu_id`=5463;
UPDATE `gossip_menu` SET `entry`=6548 WHERE `entry`=5464;
UPDATE `gossip_menu_option` SET `menu_id`=6548 WHERE `menu_id`=5464;
UPDATE `gossip_menu_option` SET `action_menu_id`=6548 WHERE `action_menu_id`=5464;
UPDATE `gossip_menu` SET `entry`=6547 WHERE `entry`=5465;
UPDATE `gossip_menu_option` SET `menu_id`=6547 WHERE `menu_id`=5465;
UPDATE `gossip_menu_option` SET `action_menu_id`=6547 WHERE `action_menu_id`=5465;
UPDATE `gossip_menu` SET `entry`=6546 WHERE `entry`=5466;
UPDATE `gossip_menu_option` SET `menu_id`=6546 WHERE `menu_id`=5466;
UPDATE `gossip_menu_option` SET `action_menu_id`=6546 WHERE `action_menu_id`=5466;
UPDATE `gossip_menu` SET `entry`=6545 WHERE `entry`=5467;
UPDATE `gossip_menu_option` SET `menu_id`=6545 WHERE `menu_id`=5467;
UPDATE `gossip_menu_option` SET `action_menu_id`=6545 WHERE `action_menu_id`=5467;
UPDATE `creature_template` SET `gossip_menu_id`=6534 WHERE `entry`=15170;

-- Frankal Stonebridge
UPDATE `gossip_menu` SET `entry`=6534 WHERE `entry`=5450;
UPDATE `gossip_menu_option` SET `menu_id`=6533 WHERE `menu_id`=5450;
UPDATE `gossip_menu_option` SET `action_menu_id`=6533 WHERE `action_menu_id`=5450;
UPDATE `gossip_menu` SET `entry`=6558 WHERE `entry`=5451;
UPDATE `gossip_menu_option` SET `menu_id`=6558 WHERE `menu_id`=5451;
UPDATE `gossip_menu_option` SET `action_menu_id`=6558 WHERE `action_menu_id`=5451;
UPDATE `gossip_menu` SET `entry`=6557 WHERE `entry`=5452;
UPDATE `gossip_menu_option` SET `menu_id`=6557 WHERE `menu_id`=5452;
UPDATE `gossip_menu_option` SET `action_menu_id`=6557 WHERE `action_menu_id`=5452;
UPDATE `gossip_menu` SET `entry`=6556 WHERE `entry`=5453;
UPDATE `gossip_menu_option` SET `menu_id`=6556 WHERE `menu_id`=5453;
UPDATE `gossip_menu_option` SET `action_menu_id`=6556 WHERE `action_menu_id`=5453;
UPDATE `gossip_menu` SET `entry`=6555 WHERE `entry`=5454;
UPDATE `gossip_menu_option` SET `menu_id`=6555 WHERE `menu_id`=5454;
UPDATE `gossip_menu_option` SET `action_menu_id`=6555 WHERE `action_menu_id`=5454;
UPDATE `gossip_menu` SET `entry`=6554 WHERE `entry`=5455;
UPDATE `gossip_menu_option` SET `menu_id`=6554 WHERE `menu_id`=5455;
UPDATE `gossip_menu_option` SET `action_menu_id`=6554 WHERE `action_menu_id`=5455;
UPDATE `gossip_menu` SET `entry`=6553 WHERE `entry`=5456;
UPDATE `gossip_menu_option` SET `menu_id`=6553 WHERE `menu_id`=5456;
UPDATE `gossip_menu_option` SET `action_menu_id`=6553 WHERE `action_menu_id`=5456;
UPDATE `gossip_menu` SET `entry`=6552 WHERE `entry`=5457;
UPDATE `gossip_menu_option` SET `menu_id`=6552 WHERE `menu_id`=5457;
UPDATE `gossip_menu_option` SET `action_menu_id`=6552 WHERE `action_menu_id`=5457;
UPDATE `creature_template` SET `gossip_menu_id`=6533 WHERE `entry`=15171;

-- Krumn
INSERT INTO `gossip_menu` VALUES (5461, 6513, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5461, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5461, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5461 WHERE `entry` = 5054;

-- Jondor Steelbrow
INSERT INTO `gossip_menu` VALUES (5462, 6514, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5462, 0, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5462, 1, 7, 'How do I form a guild?', 3413, 10, 512, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5462 WHERE `entry` = 5130;

-- Kathrum Axehand
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5509;

-- Thulman Flintcrag
INSERT INTO `gossip_menu` VALUES (693, 1243, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (693, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5510;

-- Kaita Deepforge
UPDATE `creature_template` SET `gossip_menu_id`=693 WHERE `entry` = 5512;

-- Baritanas Skyriver
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 6706;

-- Thalon
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 6726;

-- Bera Stonehammer
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 7823;

-- Bulkrek Ragefist
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 7824;

-- Kroum
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 8610;

-- Nessa Shadowsong
UPDATE `creature_template` SET `gossip_menu_id`=4303 WHERE `entry` = 10118;

-- Gryfe
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 10583;

-- Aurius
INSERT INTO `gossip_menu` VALUES (3043, 3755, 0);
INSERT INTO `gossip_menu` VALUES (3043, 3756, 0);
INSERT INTO `gossip_menu` VALUES (3043, 3757, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3043 WHERE `entry` = 10917;

-- Maethrya
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11138;

-- Yugrek
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11139;

-- Gorn One Eye
INSERT INTO `gossip_menu` VALUES (3625, 4399, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3625 WHERE `entry` = 11555;

-- Shardi
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 11899;

-- Jarrodenus
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12577;

-- Bibilfaz Featherwhistle
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12596;

-- Vhulgra
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12616;

-- Khaelyn Steelwing
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12617;

-- Georgia
INSERT INTO `gossip_menu` VALUES (12237, 7778, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12237, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=12237 WHERE `entry` = 12636;

-- Faustron
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 12740;

-- Nipsy
INSERT INTO `gossip_menu` VALUES (4845, 5920, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4845, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4845 WHERE `entry` = 13018;

-- Lorekeeper Lydros
INSERT INTO `gossip_menu` VALUES (5747, 6925, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (189, 8, 7482, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (188, 8, 7481, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (190, -2, 189, 188, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5747, 6926, 190);
/*
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (235, 19, 7508, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5747, 50218, 235);
INSERT INTO `gossip_menu` VALUES (50004, 50219, 0);
INSERT INTO `gossip_menu` VALUES (50005, 50220, 0);
INSERT INTO `gossip_menu` VALUES (50007, 50222, 0);
INSERT INTO `gossip_menu` VALUES (50008, 50223, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50008, 0, 0, 'Maybe... What do I do now?', 9527, 1, 1, -1, 0, 5000801, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50007, 0, 0, 'Eh?', 9525, 1, 1, 50008, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50006, 0, 0, '(Continue.)', 9519, 1, 1, 50007, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50005, 0, 0, '(Continue.)', 9519, 1, 1, 50006, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (50004, 0, 0, '(Continue.)', 9519, 1, 1, 50005, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5747, 0, 0, 'Fascinating, Lorekeeper. Continue please.', 9517, 1, 1, 50004, 0, 0, 0, 0, '', 0, 235);
*/
UPDATE `creature_template` SET `gossip_menu_id`=5747 WHERE `entry` = 14368;

-- Shen'dralar Zealot
INSERT INTO `gossip_menu` VALUES (5737, 6911, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5737 WHERE `entry` = 14369;

-- Lorekeeper Javon
INSERT INTO `gossip_menu` VALUES (5755, 6939, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5755 WHERE `entry` = 14381;

-- Orphan Matron Nightingale
INSERT INTO `gossip_menu` VALUES (5849, 7011, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5849 WHERE `entry` = 14450;

-- Bragok
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry` = 16227;

-- Love is in the Air gossip options.
UPDATE `gossip_menu` SET `entry`=682 WHERE `entry`=9029 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=686 WHERE `entry`=9024 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=689 WHERE `entry`=9043 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=691 WHERE `entry`=9055 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=692 WHERE `entry`=9053 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=693 WHERE `entry`=9383 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=708 WHERE `entry`=9313 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=1626 WHERE `entry`=9183 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4513 WHERE `entry`=9154 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4541 WHERE `entry`=9281 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=4542 WHERE `entry`=9280 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5108 WHERE `entry`=9302 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5461 WHERE `entry`=9318 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5462 WHERE `entry`=9341 && `condition_id`!=0;
UPDATE `gossip_menu` SET `entry`=5849 WHERE `entry`=9583 && `condition_id`!=0;
UPDATE `gossip_menu_option` SET `menu_id`=682 WHERE `option_id`=1 && `menu_id`=9029;
UPDATE `gossip_menu_option` SET `menu_id`=686 WHERE `option_id`=1 && `menu_id`=9024;
UPDATE `gossip_menu_option` SET `menu_id`=689 WHERE `option_id`=1 && `menu_id`=9043;
UPDATE `gossip_menu_option` SET `menu_id`=691 WHERE `option_id`=1 && `menu_id`=9055;
UPDATE `gossip_menu_option` SET `menu_id`=692 WHERE `option_id`=1 && `menu_id`=9053;
UPDATE `gossip_menu_option` SET `menu_id`=693 WHERE `option_id`=1 && `menu_id`=9383;
UPDATE `gossip_menu_option` SET `menu_id`=708 WHERE `option_id`=1 && `menu_id`=9313;
UPDATE `gossip_menu_option` SET `menu_id`=1626 WHERE `option_id`=1 && `menu_id`=9183;
UPDATE `gossip_menu_option` SET `menu_id`=4513 WHERE `option_id`=1 && `menu_id`=9154;
UPDATE `gossip_menu_option` SET `menu_id`=4541 WHERE `option_id`=1 && `menu_id`=9281;
UPDATE `gossip_menu_option` SET `menu_id`=4542 WHERE `option_id`=1 && `menu_id`=9280;
UPDATE `gossip_menu_option` SET `menu_id`=5108 WHERE `option_id`=1 && `menu_id`=9302;
UPDATE `gossip_menu_option` SET `menu_id`=5461 WHERE `option_id`=1 && `menu_id`=9318;
UPDATE `gossip_menu_option` SET `menu_id`=5462 WHERE `option_id`=1 && `menu_id`=9341;
UPDATE `gossip_menu_option` SET `menu_id`=5849 WHERE `option_id`=1 && `menu_id`=9583;
DELETE FROM `gossip_menu` WHERE `entry` IN (9022, 9024, 9025, 9028, 9029, 9032, 9034, 9038, 9042, 9043, 9046, 9050, 9053, 9054, 9055, 9056, 9154, 9183, 9280, 9281, 9302, 9313, 9314, 9318, 9341, 9382, 9383, 9385, 9583);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9022, 9024, 9025, 9028, 9029, 9032, 9034, 9038, 9042, 9043, 9046, 9050, 9053, 9054, 9055, 9056, 9154, 9183, 9280, 9281, 9302, 9313, 9314, 9318, 9341, 9382, 9383, 9385, 9583);
UPDATE `creature_template` SET `npc_flags`=`npc_flags` | 1 WHERE `entry` IN (1295, 1298, 1299, 1303, 1304, 1308, 1310, 1314, 1318, 1319, 1324, 1341, 1348, 1349, 1350, 1351, 1411, 2122, 2130, 2409, 2432, 2670, 2851, 2861, 3170, 3327, 3370, 3401, 4267, 4319, 4407, 4582, 4584, 4613, 4974, 4981, 5054, 5130, 5509, 5510, 5512, 6301, 6706, 6726, 7823, 7824, 8610, 10118, 10583, 10917, 11138, 11139, 11555, 11899, 12577, 12596, 12616, 12617, 12636, 12740, 13018, 14368, 14369, 14381, 14450, 16227);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
