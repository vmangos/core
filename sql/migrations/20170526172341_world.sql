INSERT INTO `migrations` VALUES ('20170526172341'); 

-- Innkeeper Farley
DELETE FROM `npc_gossip` WHERE `npc_guid`=80346;
INSERT INTO `conditions` VALUES (108, 12, 12, 0);
INSERT INTO `conditions` VALUES (111, 11, 24755, 0);
INSERT INTO `conditions` VALUES (164, -1, 108, 111);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1291;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 1, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 2, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1291, 4, 0, 'GOSSIP_OPTION_QUESTGIVER', 2, 2, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (342, 0, 15, 24751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Trick or Treat cast');
UPDATE `creature_template` SET `gossip_menu_id`=1291 WHERE `entry`=295;

-- Innkeeper Belm
DELETE FROM `npc_gossip` WHERE `npc_guid`=199;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1297;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1297, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1297, 1, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1297, 2, 1, 'Let me browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1297, 3, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1297 WHERE `entry`=1247;

-- Innkeeper Helbrek
UPDATE `creature_template` SET `gossip_menu_id`=345 WHERE `entry`=1464;

-- Innkeeper Anderson
DELETE FROM `npc_gossip` WHERE `npc_guid`=15326;
UPDATE `creature_template` SET `gossip_menu_id`=1291 WHERE `entry`=2352;

-- Innkeeper Shay
DELETE FROM `npc_gossip` WHERE `npc_guid`=15287;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1296;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 1, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 2, 1, 'Let me browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 3, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1296, 4, 0, 'GOSSIP_OPTION_QUESTGIVER', 2, 2, 0, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1296 WHERE `entry`=2388;

-- Innkeeper Boorand Plainswind
DELETE FROM `npc_gossip` WHERE `npc_guid`=14139;
INSERT INTO `gossip_menu` VALUES (344, 822, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (344, 2, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (344, 3, 1, 'Let me browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=3934;

-- Innkeeper Firebrew
DELETE FROM `npc_gossip` WHERE `npc_guid`=1745;
UPDATE `creature_template` SET `gossip_menu_id`=345 WHERE `entry`=5111;

-- Innkeeper Renee
DELETE FROM `npc_gossip` WHERE `npc_guid`=28474;
UPDATE `creature_template` SET `gossip_menu_id`=1296 WHERE `entry`=5688;

-- Innkeeper Thulbek
DELETE FROM `npc_gossip` WHERE `npc_guid`=690;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1290, 2, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1290, 3, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1290, 4, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=5814;

-- Innkeeper Janene
DELETE FROM `gossip_menu_option` WHERE `menu_id`=342;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (342, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, '', 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (342, 2, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (342, 3, 1, 'Let me browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=342 WHERE `entry`=6272;

-- Innkeeper Brianna
DELETE FROM `npc_gossip` WHERE `npc_guid`=10076;
UPDATE `creature_template` SET `gossip_menu_id`=1291 WHERE `entry`=6727;

-- Innkeeper Hearthstove
DELETE FROM `npc_gossip` WHERE `npc_guid`=8219;
UPDATE `creature_template` SET `gossip_menu_id`=1297 WHERE `entry`=6734;

-- Innkeeper Saelienne
DELETE FROM `npc_gossip` WHERE `npc_guid`=46341;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1581;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1581, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1581, 2, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1581, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1581 WHERE `entry`=6735;

-- Innkeeper Keldamyr
DELETE FROM `npc_gossip` WHERE `npc_guid`=46343;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1293;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1293, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1293, 1, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1293, 2, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1293, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1293 WHERE `entry`=6736;

-- Innkeeper Shaussiy
DELETE FROM `npc_gossip` WHERE `npc_guid`=37069;
INSERT INTO `gossip_menu` VALUES (347, 824, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (347, 0, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (347, 1, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (347, 2, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (347, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=347 WHERE `entry`=6737;

-- Innkeeper Kimlya
DELETE FROM `npc_gossip` WHERE `npc_guid`=32451;
UPDATE `creature_template` SET `gossip_menu_id`=1581 WHERE `entry`=6738;

-- Innkeeper Bates
DELETE FROM `npc_gossip` WHERE `npc_guid`=17865;
UPDATE `creature_template` SET `gossip_menu_id`=1296 WHERE `entry`=6739;

-- Innkeeper Allison
DELETE FROM `npc_gossip` WHERE `npc_guid`=79841;
UPDATE `creature_template` SET `gossip_menu_id`=342 WHERE `entry`=6740;

-- Innkeeper Norman
DELETE FROM `npc_gossip` WHERE `npc_guid`=38407;
UPDATE `creature_template` SET `gossip_menu_id`=1296 WHERE `entry`=6741;

-- Innkeeper Pala
DELETE FROM `npc_gossip` WHERE `npc_guid`=24772;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=6746;

-- Innkeeper Kauth
DELETE FROM `npc_gossip` WHERE `npc_guid`=24774;
INSERT INTO `gossip_menu` VALUES (1294, 822, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1294, 1, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1294, 2, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1294, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1294 WHERE `entry`=6747;

-- Innkeeper Trelayne
DELETE FROM `npc_gossip` WHERE `npc_guid`=4208;
UPDATE `creature_template` SET `gossip_menu_id`=1291 WHERE `entry`=6790;

-- Innkeeper Wiley
DELETE FROM `npc_gossip` WHERE `npc_guid`=14986;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (349, 2, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (349, 3, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=349 WHERE `entry`=6791;

-- Innkeeper Skindle
DELETE FROM `npc_gossip` WHERE `npc_guid`=537;
UPDATE `creature_template` SET `gossip_menu_id`=349 WHERE `entry`=6807;

-- Innkeeper Grosk
DELETE FROM `npc_gossip` WHERE `npc_guid`=7671;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=6928;

-- Innkeeper Gryshka
DELETE FROM `npc_gossip` WHERE `npc_guid`=4661;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=6929;

-- Innkeeper Karakul
DELETE FROM `npc_gossip` WHERE `npc_guid`=31947;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=6930;

-- Innkeeper Byula
DELETE FROM `npc_gossip` WHERE `npc_guid`=13550;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=7714;

-- Innkeeper Jayka
DELETE FROM `npc_gossip` WHERE `npc_guid`=29233;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=7731;

-- Innkeeper Fizzgrimble
DELETE FROM `npc_gossip` WHERE `npc_guid`=22681;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2890;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2890, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2890, 1, 5, 'Make this inn my home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2890, 2, 0, 'GOSSIP_OPTION_QUESTGIVER', 2, 2, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2890, 5, 1, 'I want to browse your goods.', 3, 4, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=2890 WHERE `entry`=7733;

-- Innkeeper Shyria
DELETE FROM `npc_gossip` WHERE `npc_guid`=50059;
UPDATE `creature_template` SET `gossip_menu_id`=1581 WHERE `entry`=7736;

-- Innkeeper Greul
DELETE FROM `npc_gossip` WHERE `npc_guid`=50060;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=7737;

-- Innkeeper Thulfram
UPDATE `creature_template` SET `gossip_menu_id`=345 WHERE `entry`=7744;

-- Innkeeper Heather
UPDATE `creature_template` SET `gossip_menu_id`=342 WHERE `entry`=8931;

-- Innkeeper Shul'kar
DELETE FROM `npc_gossip` WHERE `npc_guid`=6889;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=9356;

-- Innkeeper Adegwa
DELETE FROM `npc_gossip` WHERE `npc_guid`=11273;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=9501;

-- Innkeeper Lyshaerya
DELETE FROM `npc_gossip` WHERE `npc_guid`=28304;
UPDATE `creature_template` SET `gossip_menu_id`=1581 WHERE `entry`=11103;

-- Innkeeper Sikewa
DELETE FROM `npc_gossip` WHERE `npc_guid`=28340;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=11106;

-- Innkeeper Abeqwa
DELETE FROM `npc_gossip` WHERE `npc_guid`=21575;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=11116;

-- Innkeeper Vizzie
DELETE FROM `npc_gossip` WHERE `npc_guid`=42181;
UPDATE `creature_template` SET `gossip_menu_id`=349 WHERE `entry`=11118;

-- Innkeeper Kaylisk
DELETE FROM `npc_gossip` WHERE `npc_guid`=33073;
UPDATE `creature_template` SET `gossip_menu_id`=1290 WHERE `entry`=12196;

-- Lard
DELETE FROM `npc_gossip` WHERE `npc_guid`=92884;
INSERT INTO `gossip_menu` VALUES (6059, 7211, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6059, 0, 0, 'Trick or Treat!', 1, 1, -1, 0, 342, 0, 0, NULL, 164);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6059, 1, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6059, 2, 0, 'What can I do at an inn?', 1, 1, 1221, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6059, 3, 1, 'Let me browse your goods.', 3, 4, 0, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6059 WHERE `entry`=14731;

-- Calandrath
DELETE FROM `npc_gossip` WHERE `npc_guid`=42755;
INSERT INTO `gossip_menu` VALUES (6525, 7727, 0);
INSERT INTO `gossip_menu` VALUES (6525, 7820, 18);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6525, 2, 1, 'I wish to browse your wares, Calandrath.', 3, 4, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (6525, 3, 5, 'Make this inn your home.', 8, 128, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=6525 WHERE `entry`=15174;

-- Innkeeper Faralia
DELETE FROM `npc_gossip` WHERE `npc_guid`=29239;
UPDATE `creature_template` SET `gossip_menu_id`=1581 WHERE `entry`=16458;
