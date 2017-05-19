INSERT INTO `migrations` VALUES ('20170519115936'); 

/*
	============================
	GOSSIPS FOR PALADIN TRAINERS
	============================
*/

-- Brother Sammuel
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (106, 14, 0, 2);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (134, -1, 106, 107);
INSERT INTO `gossip_menu` VALUES (4663, 3976, 0);
INSERT INTO `gossip_menu` VALUES (4461, 5673, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4663, 0, 3, 'I would like to train further in the ways of the Light.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4663, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 134);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4461, 0, 11, 'Yes. I do.', 16, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=925;

-- Bromos Grummner
DELETE FROM `npc_gossip` WHERE `npc_guid`=403;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (105, 14, 0, 1533);
INSERT INTO `gossip_menu` VALUES (4678, 3974, 106);
INSERT INTO `gossip_menu` VALUES (4678, 3975, 105);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4678, 0, 3, 'I would like to train further in the ways of the Light.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4678, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 134);
UPDATE `creature_template` SET `gossip_menu_id`=4678 WHERE `entry`=926;

-- Brother Wilhelm
DELETE FROM `npc_gossip` WHERE `npc_guid`=80325;
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=927;

-- Lord Grayson Shadowbreaker
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=928;

-- Azar Stronghammer
DELETE FROM `npc_gossip` WHERE `npc_guid`=194;
UPDATE `creature_template` SET `gossip_menu_id`=4678 WHERE `entry`=1232;

-- Valgar Highforge
DELETE FROM `npc_gossip` WHERE `npc_guid`=1778;
UPDATE `creature_template` SET `gossip_menu_id`=4678 WHERE `entry`=5147;

-- Beldruk Doombrow
DELETE FROM `npc_gossip` WHERE `npc_guid`=1769;
UPDATE `creature_template` SET `gossip_menu_id`=4678 WHERE `entry`=5148;

-- Brandur Ironhammer
DELETE FROM `npc_gossip` WHERE `npc_guid`=1781;
INSERT INTO `gossip_menu` VALUES (2304, 2999, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2304, 0, 3, 'I would like to train further in the ways of the Light.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (2304, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 134);
UPDATE `creature_template` SET `gossip_menu_id`=2304 WHERE `entry`=5149;

-- Arthur the Faithful
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=5491;

-- Katherine the Pure
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=5492;

-- Brother Karman
UPDATE `creature_template` SET `gossip_menu_id`=4663 WHERE `entry`=8140;

/*
	==========================
	GOSSIPS FOR ROGUE TRAINERS
	==========================
*/

-- Jorik Kerridan
DELETE FROM `npc_gossip` WHERE `npc_guid`=79986;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (136, -1, 100, 107);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (100, 14, 0, 8);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (101, 14, 0, 1527);
DELETE FROM `gossip_menu` WHERE `entry`=4659;
INSERT INTO `gossip_menu` VALUES (4659, 4835, 100);
INSERT INTO `gossip_menu` VALUES (4659, 4837, 101);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4659;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4659, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4659, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=4659 WHERE `entry`=915;

-- Solm Hargrin
DELETE FROM `npc_gossip` WHERE `npc_guid`=421;
INSERT INTO `gossip_menu` VALUES (4676, 4833, 101);
INSERT INTO `gossip_menu` VALUES (4676, 4835, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4676, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4676, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=4676 WHERE `entry`=916;

-- Keryn Sylvius
DELETE FROM `npc_gossip` WHERE `npc_guid`=79645;
INSERT INTO `gossip_menu` VALUES (381, 4795, 100);
INSERT INTO `gossip_menu` VALUES (381, 4799, 101);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (381, 0, 3, 'I am in need of training, Keryn.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (381, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=381 WHERE `entry`=917;

-- Osborne the Night Man
DELETE FROM `npc_gossip` WHERE `npc_guid`=79788;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (168, 15, 24, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (180, 22, 6681, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (181, -1, 100, 168);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (196, -1, 180, 181);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (197, 16, 17126, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (198, -1, 196, 197);
INSERT INTO `gossip_menu` VALUES (4502, 4835, 100);
INSERT INTO `gossip_menu` VALUES (4502, 4837, 101);
INSERT INTO `gossip_menu` VALUES (4502, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4502, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4502, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4502, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (16, 0, 15, 21100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Conjure Elegant Letter');
UPDATE `creature_template` SET `gossip_menu_id`=4502, `ScriptName`='' WHERE `entry`=918;

-- Hogral Bakkan
DELETE FROM `npc_gossip` WHERE `npc_guid`=188;
INSERT INTO `gossip_menu` VALUES (410, 4795, 100);
INSERT INTO `gossip_menu` VALUES (410, 907, 101);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (410, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (410, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=410 WHERE `entry`=1234;

-- Ormok
DELETE FROM `npc_gossip` WHERE `npc_guid`=6593;
INSERT INTO `gossip_menu` VALUES (4512, 638, 100);
INSERT INTO `gossip_menu` VALUES (4512, 4793, 101);
INSERT INTO `gossip_menu` VALUES (4512, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4512, 0, 3, 'I would like training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4512, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4512, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
UPDATE `creature_template` SET `gossip_menu_id`=4512, `ScriptName`='' WHERE `entry`=3328;

-- Frahun Shadewhisper
DELETE FROM `npc_gossip` WHERE `npc_guid`=46179;
INSERT INTO `gossip_menu` VALUES (4690, 4794, 100);
INSERT INTO `gossip_menu` VALUES (4690, 4796, 101);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4690, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4690, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=4690 WHERE `entry`=3594;

-- Jannok Breezesong
DELETE FROM `gossip_menu` WHERE `entry`=436;
INSERT INTO `gossip_menu` VALUES (436, 4794, 100);
INSERT INTO `gossip_menu` VALUES (436, 4793, 101);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (436, 0, 3, 'Hello! I am a Rogue in need of training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (436, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=436 WHERE `entry`=3599;

-- Syurna
DELETE FROM `npc_gossip` WHERE `npc_guid`=46312;
DELETE FROM `gossip_menu` WHERE `entry`=4576;
INSERT INTO `gossip_menu` VALUES (4576, 4794, 100);
INSERT INTO `gossip_menu` VALUES (4576, 4793, 101);
INSERT INTO `gossip_menu` VALUES (4576, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4576, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4576, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4576, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
UPDATE `creature_template` SET `gossip_menu_id`=4576, `ScriptName`='' WHERE `entry`=4163;

-- Erion Shadewhisper
DELETE FROM `npc_gossip` WHERE `npc_guid`=46469;
UPDATE `creature_template` SET `gossip_menu_id`=4576 WHERE `entry`=4214;

-- Anishar
DELETE FROM `npc_gossip` WHERE `npc_guid`=46470;
UPDATE `creature_template` SET `gossip_menu_id`=4576 WHERE `entry`=4215;

-- Miles Dexter
DELETE FROM `npc_gossip` WHERE `npc_guid`=31885;
INSERT INTO `gossip_menu` VALUES (4540, 581, 100);
INSERT INTO `gossip_menu` VALUES (4540, 4796, 101);
INSERT INTO `gossip_menu` VALUES (4540, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4540, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4540, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4540, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
UPDATE `creature_template` SET `gossip_menu_id`=4540, `ScriptName`='' WHERE `entry`=4583;

-- Hulfdan Blackbeard
DELETE FROM `npc_gossip` WHERE `npc_guid`=1810;
INSERT INTO `gossip_menu` VALUES (411, 908, 100);
INSERT INTO `gossip_menu` VALUES (411, 4798, 101);
INSERT INTO `gossip_menu` VALUES (411, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (411, 0, 3, 'Good day, Hulfdan, I am looking for training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (411, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (411, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
UPDATE `creature_template` SET `gossip_menu_id`=411, `ScriptName`='' WHERE `entry`=5165;

-- Ormyr Flinteye
DELETE FROM `npc_gossip` WHERE `npc_guid`=1806;
INSERT INTO `gossip_menu` VALUES (4562, 4834, 100);
INSERT INTO `gossip_menu` VALUES (4562, 4833, 101);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4562, 0, 3, 'I\'m lookin\' for rogue trainin\'.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4562, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
UPDATE `creature_template` SET `gossip_menu_id`=4562 WHERE `entry`=5166;

-- Fenthwick
DELETE FROM `npc_gossip` WHERE `npc_guid`=1809;
INSERT INTO `gossip_menu` VALUES (4561, 5695, 100);
INSERT INTO `gossip_menu` VALUES (4561, 4833, 101);
INSERT INTO `gossip_menu` VALUES (4561, 5996, 198);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4561, 0, 3, 'I\'m lookin\' for rogue trainin\'.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4561, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 136);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4561, 4, 0, '<Take the letter>', 1, 1, -1, 0, 16, 0, 0, '', 198);
UPDATE `creature_template` SET `gossip_menu_id`=4561, `ScriptName`='' WHERE `entry`=5167;

-- Lord Tony Romano
DELETE FROM `npc_gossip` WHERE `npc_guid`=79787;
UPDATE `creature_template` SET `gossip_menu_id`=4502, `ScriptName`='' WHERE `entry`=13283;

/*
	============================
	GOSSIPS FOR WARRIOR TRAINERS
	============================
*/

-- Llane Beshere
DELETE FROM `npc_gossip` WHERE `npc_guid`=79964;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (133, -1, 98, 107);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (98, 14, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (99, 14, 0, 1534);
INSERT INTO `gossip_menu` VALUES (4650, 1216, 98);
INSERT INTO `gossip_menu` VALUES (4650, 5721, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4650, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4650, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4650 WHERE `entry`=911;

-- Thran Khorman
INSERT INTO `gossip_menu` VALUES (4684, 1215, 98);
INSERT INTO `gossip_menu` VALUES (4684, 5724, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4684, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4684, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4684 WHERE `entry`=912;

-- Lyria Du Lac
DELETE FROM `npc_gossip` WHERE `npc_guid`=80333;
UPDATE `creature_template` SET `gossip_menu_id`=4650 WHERE `entry`=913;

-- Ander Germaine
DELETE FROM `npc_gossip` WHERE `npc_guid`=79780;
UPDATE `creature_template` SET `gossip_menu_id`=4650 WHERE `entry`=914;

-- Malosh
DELETE FROM `npc_gossip` WHERE `npc_guid`=34156;
DELETE FROM `gossip_menu` WHERE `entry`=523;
INSERT INTO `gossip_menu` VALUES (523, 1040, 98);
INSERT INTO `gossip_menu` VALUES (523, 4985, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (523, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (523, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=985;

-- Granis Swiftaxe
DELETE FROM `npc_gossip` WHERE `npc_guid`=196;
UPDATE `creature_template` SET `gossip_menu_id`=4684 WHERE `entry`=1229;

-- Kelstrum Stonebreaker
DELETE FROM `npc_gossip` WHERE `npc_guid`=83;
UPDATE `creature_template` SET `gossip_menu_id`=4684 WHERE `entry`=1901;

-- Dannal Stern
DELETE FROM `npc_gossip` WHERE `npc_guid`=28464;
INSERT INTO `gossip_menu` VALUES (4653, 1219, 98);
INSERT INTO `gossip_menu` VALUES (4653, 4984, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4653, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4653, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4653 WHERE `entry`=2119;

-- Austil de Mon
DELETE FROM `npc_gossip` WHERE `npc_guid`=33720;
UPDATE `creature_template` SET `gossip_menu_id`=4653 WHERE `entry`=2131;

-- Torm Ragetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26759;
INSERT INTO `gossip_menu` VALUES (4526, 1218, 98);
INSERT INTO `gossip_menu` VALUES (4526, 4973, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4526, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4526, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4526 WHERE `entry`=3041;

-- Gossip for Sark Ragetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26768;
UPDATE `creature_template` SET `gossip_menu_id`=4526 WHERE `entry`=3042;

-- Gossip for Ker Ragetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26770;
UPDATE `creature_template` SET `gossip_menu_id`=4526 WHERE `entry`=3043;

-- Gossip for Harutt Thunderhorn
DELETE FROM `npc_gossip` WHERE `npc_guid`=26897;
UPDATE `creature_template` SET `gossip_menu_id`=4526 WHERE `entry`=3059;

-- Gossip for Krang Stonehoof
DELETE FROM `npc_gossip` WHERE `npc_guid`=26902;
UPDATE `creature_template` SET `gossip_menu_id`=4526 WHERE `entry`=3063;

-- Gossip for Frang
DELETE FROM `npc_gossip` WHERE `npc_guid`=7651;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3153;

-- Gossip for Tarshaw Jaggedscar
DELETE FROM `npc_gossip` WHERE `npc_guid`=7291;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3169;

-- Gossip for Grezz Ragefist
DELETE FROM `npc_gossip` WHERE `npc_guid`=7971;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3353;

-- Gossip for Sorek
DELETE FROM `npc_gossip` WHERE `npc_guid`=7443;
UPDATE `creature_template` SET `gossip_menu_id`=523 WHERE `entry`=3354;

-- Zel'mak
DELETE FROM `npc_gossip` WHERE `npc_guid`=6610;
INSERT INTO `gossip_menu` VALUES (4510, 4987, 98);
INSERT INTO `gossip_menu` VALUES (4510, 4986, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4510, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4510, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4510 WHERE `entry`=3408;

-- Alyissia
DELETE FROM `npc_gossip` WHERE `npc_guid`=46178;
DELETE FROM `gossip_menu` WHERE `entry`=4697;
INSERT INTO `gossip_menu` VALUES (4697, 1217, 98);
INSERT INTO `gossip_menu` VALUES (4697, 5725, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4697, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4697, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4697 WHERE `entry`=3593;

-- Gossip for Kyra Windblade
DELETE FROM `npc_gossip` WHERE `npc_guid`=46184;
UPDATE `creature_template` SET `gossip_menu_id`=4697 WHERE `entry`=3598;

-- Gossip for Arias'ta Bladesinger
DELETE FROM `npc_gossip` WHERE `npc_guid`=49851;
UPDATE `creature_template` SET `gossip_menu_id`=4697 WHERE `entry`=4087;

-- Gossip for Sildanair
UPDATE `creature_template` SET `gossip_menu_id`=4697 WHERE `entry`=4089;

-- Gossip for Christoph Walker
DELETE FROM `npc_gossip` WHERE `npc_guid`=31897;
UPDATE `creature_template` SET `gossip_menu_id`=4653 WHERE `entry`=4593;

-- Gossip for Angela Curthas
DELETE FROM `npc_gossip` WHERE `npc_guid`=41841;
UPDATE `creature_template` SET `gossip_menu_id`=4653 WHERE `entry`=4594;

-- Gossip for Baltus Fowler
DELETE FROM `npc_gossip` WHERE `npc_guid`=38128;
UPDATE `creature_template` SET `gossip_menu_id`=4653 WHERE `entry`=4595;

-- Gossip for Kelv Sternhammer
DELETE FROM `npc_gossip` WHERE `npc_guid`=2019;
UPDATE `creature_template` SET `gossip_menu_id`=4684 WHERE `entry`=5113;

-- Bilban Tosslespanner
DELETE FROM `npc_gossip` WHERE `npc_guid`=84;
INSERT INTO `gossip_menu` VALUES (4568, 4989, 98);
INSERT INTO `gossip_menu` VALUES (4568, 4988, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4568, 0, 3, 'I require warrior training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4568, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4568 WHERE `entry`=5114;

-- Gossip for Wu Shen
DELETE FROM `npc_gossip` WHERE `npc_guid`=79779;
UPDATE `creature_template` SET `gossip_menu_id`=4650 WHERE `entry`=5479;

-- Gossip for Ilsa Corbin
DELETE FROM `npc_gossip` WHERE `npc_guid`=79778;
UPDATE `creature_template` SET `gossip_menu_id`=4650 WHERE `entry`=5480;

-- Gossip for Darnath Bladesinger
DELETE FROM `npc_gossip` WHERE `npc_guid`=46809;
UPDATE `creature_template` SET `gossip_menu_id`=4697 WHERE `entry`=7315;

-- Captain Evencane
INSERT INTO `gossip_menu` VALUES (4091, 4992, 98);
INSERT INTO `gossip_menu` VALUES (4091, 4991, 99);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4091, 0, 3, 'Yes. I have.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4091, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 133);
UPDATE `creature_template` SET `gossip_menu_id`=4091 WHERE `entry`=8141;

/*
	===========================
	GOSSIPS FOR HUNTER TRAINERS
	===========================
*/

-- Nalesette Wildbringer (Pet Trainer)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (96, 14, 0, 4);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (97, 14, 0, 1531);
DELETE FROM `gossip_menu` WHERE `entry`=4783;
INSERT INTO `gossip_menu` VALUES (4783, 5838, 96);
INSERT INTO `gossip_menu` VALUES (4783, 5839, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4783, 1, 3, 'How do I train my pet?', 5, 16, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4783, 2, 0, 'I wish to untrain my pet.', 17, 16, 0, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=543;

-- Thorgas Grimson
DELETE FROM `npc_gossip` WHERE `npc_guid`=407;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (135, -1, 96, 107);
INSERT INTO `gossip_menu` VALUES (4675, 4999, 96);
INSERT INTO `gossip_menu` VALUES (4675, 5000, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4675, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4675, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4675 WHERE `entry`=895;

-- Ogromm
DELETE FROM `npc_gossip` WHERE `npc_guid`=31949;
INSERT INTO `gossip_menu` VALUES (4101, 5001, 96);
INSERT INTO `gossip_menu` VALUES (4101, 5002, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4101, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4101, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4101 WHERE `entry`=987;

-- Grif Wildheart
UPDATE `creature_template` SET `gossip_menu_id`=4675 WHERE `entry`=1231;

-- Kragg
DELETE FROM `npc_gossip` WHERE `npc_guid`=364;
UPDATE `creature_template` SET `gossip_menu_id`=4101 WHERE `entry`=1404;

-- Peria Lamenur (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=223;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=2878;

-- Karrina Mekenda (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=2879;

-- Kary Thunderhorn
DELETE FROM `npc_gossip` WHERE `npc_guid`=26755;
INSERT INTO `gossip_menu` VALUES (4011, 4867, 96);
INSERT INTO `gossip_menu` VALUES (4011, 4998, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4011, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4011, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4011 WHERE `entry`=3038;

-- Holt Thunderhorn
DELETE FROM `npc_gossip` WHERE `npc_guid`=26756;
INSERT INTO `gossip_menu` VALUES (4023, 4889, 96);
INSERT INTO `gossip_menu` VALUES (4023, 4996, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4023, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4023, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4023 WHERE `entry`=3039;

-- Urek Thunderhorn
DELETE FROM `npc_gossip` WHERE `npc_guid`=26758;
INSERT INTO `gossip_menu` VALUES (4524, 4997, 96);
INSERT INTO `gossip_menu` VALUES (4524, 4998, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4524, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4524, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4524 WHERE `entry`=3040;

-- Lanka Farshot
DELETE FROM `npc_gossip` WHERE `npc_guid`=26899;
UPDATE `creature_template` SET `gossip_menu_id`=4524 WHERE `entry`=3061;

-- Yaw Sharpmane
DELETE FROM `npc_gossip` WHERE `npc_guid`=26905;
INSERT INTO `gossip_menu` VALUES (4012, 4868, 96);
INSERT INTO `gossip_menu` VALUES (4012, 4998, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4012, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4012, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4012 WHERE `entry`=3065;

-- Jen'shan
DELETE FROM `npc_gossip` WHERE `npc_guid`=7649;
INSERT INTO `gossip_menu` VALUES (4648, 4987, 96);
INSERT INTO `gossip_menu` VALUES (4648, 5004, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4648, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4648, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4648 WHERE `entry`=3154;

-- Thotar
DELETE FROM `npc_gossip` WHERE `npc_guid`=7293;
INSERT INTO `gossip_menu` VALUES (4017, 4888, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4017, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4017, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4017 WHERE `entry`=3171;

-- Keldas (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3306;

-- Ormak Grimshot
DELETE FROM `npc_gossip` WHERE `npc_guid`=7449;
DELETE FROM `gossip_menu` WHERE `entry`=4010;
INSERT INTO `gossip_menu` VALUES (4010, 4866, 96);
INSERT INTO `gossip_menu` VALUES (4010, 5003, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4010, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4010, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4010 WHERE `entry`=3352;

-- Xor'juul
DELETE FROM `npc_gossip` WHERE `npc_guid`=7972;
UPDATE `creature_template` SET `gossip_menu_id`=4648 WHERE `entry`=3406;

-- Sian'dur
DELETE FROM `npc_gossip` WHERE `npc_guid`=6620;
UPDATE `creature_template` SET `gossip_menu_id`=4648 WHERE `entry`=3407;

-- Claude Erksine (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3545;

-- Ayanna Everstride
DELETE FROM `npc_gossip` WHERE `npc_guid`=46182;
INSERT INTO `gossip_menu` VALUES (4695, 4863, 96);
INSERT INTO `gossip_menu` VALUES (4695, 4993, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4695, 0, 3, 'I\'d like to train.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4695, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4695 WHERE `entry`=3596;

-- Dazalar
DELETE FROM `gossip_menu` WHERE `entry`=4009;
INSERT INTO `gossip_menu` VALUES (4009, 4316, 96);
INSERT INTO `gossip_menu` VALUES (4009, 4993, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4009, 0, 3, 'I am in need of training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4009, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4009 WHERE `entry`=3601;

-- Harruk (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=7673;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3620;

-- Grokor (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=34501;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3622;

-- Zudd (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=667;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3624;

-- Reban Freerunner (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=24783;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3688;

-- Bolyun (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=3698;

-- Danlaar Nightstride
INSERT INTO `gossip_menu` VALUES (4092, 4867, 96);
INSERT INTO `gossip_menu` VALUES (4092, 4993, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4092, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4092, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4092 WHERE `entry`=3963;

-- Jeen'ra Nightrunner
DELETE FROM `npc_gossip` WHERE `npc_guid`=46217;
INSERT INTO `gossip_menu` VALUES (4621, 4994, 96);
INSERT INTO `gossip_menu` VALUES (4621, 4993, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4621, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4621, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4621 WHERE `entry`=4138;

-- Jocaste
DELETE FROM `npc_gossip` WHERE `npc_guid`=46221;
UPDATE `creature_template` SET `gossip_menu_id`=4695 WHERE `entry`=4146;

-- Dorion
DELETE FROM `npc_gossip` WHERE `npc_guid`=46415;
INSERT INTO `gossip_menu` VALUES (4693, 6160, 96);
INSERT INTO `gossip_menu` VALUES (4693, 4993, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4693, 0, 3, 'I\'d like to train.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4693, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4693 WHERE `entry`=4205;

-- Caelyb (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=4320;

-- Daera Brightspear
DELETE FROM `npc_gossip` WHERE `npc_guid`=2020;
UPDATE `creature_template` SET `gossip_menu_id`=4675 WHERE `entry`=5115;

-- Olmin Burningbeard
DELETE FROM `npc_gossip` WHERE `npc_guid`=87;
INSERT INTO `gossip_menu` VALUES (4550, 4890, 96);
INSERT INTO `gossip_menu` VALUES (4550, 5000, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4550, 0, 3, 'I am here for training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4550, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4550 WHERE `entry`=5116;

-- Regnus Thundergranite
DELETE FROM `npc_gossip` WHERE `npc_guid`=82;
UPDATE `creature_template` SET `gossip_menu_id`=4550 WHERE `entry`=5117;

-- Kaerbrus
UPDATE `creature_template` SET `gossip_menu_id`=4693 WHERE `entry`=5501;

-- Einris Brightspear
DELETE FROM `npc_gossip` WHERE `npc_guid`=37608;
INSERT INTO `gossip_menu` VALUES (4474, 4893, 96);
INSERT INTO `gossip_menu` VALUES (4474, 5000, 97);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4474, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4474, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 135);
UPDATE `creature_template` SET `gossip_menu_id`=4474 WHERE `entry`=5515;

-- Ulfir Ironbeard
UPDATE `creature_template` SET `gossip_menu_id`=4474 WHERE `entry`=5516;

-- Thorfin Stoneshield
UPDATE `creature_template` SET `gossip_menu_id`=4474 WHERE `entry`=5517;

-- Alenndaar Lapidaar
UPDATE `creature_template` SET `gossip_menu_id`=4092 WHERE `entry`=8308;

-- Hesuwa Thunderhorn (Pet Trainer)
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=10086;

-- Xao'tsu (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=6606;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=10088;

-- Silvaria (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=46410;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=10089;

-- Belia Thundergranite (Pet Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=59;
UPDATE `creature_template` SET `gossip_menu_id`=4783 WHERE `entry`=10090;

-- Dargh Trueaim
UPDATE `creature_template` SET `gossip_menu_id`=4675 WHERE `entry`=10930;

/*
	===========================
	GOSSIPS FOR PRIEST TRAINERS
	===========================
*/

-- Priestess Anetta
DELETE FROM `npc_gossip` WHERE `npc_guid`=79963;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (94, 14, 0, 16);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (95, 14, 0, 1519);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (163, -1, 107, 94);
INSERT INTO `gossip_menu` VALUES (4665, 4433, 94);
INSERT INTO `gossip_menu` VALUES (4665, 4434, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4665, 0, 3, 'I seek more training in the priestly ways.', 5, 16, 0, 0, 0, 0, 0, NULL, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4665, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4665 WHERE `entry`=375;

-- High Priestess Laurena
DELETE FROM `npc_gossip` WHERE `npc_guid`=1079;
UPDATE `creature_template` SET `gossip_menu_id`=4665 WHERE `entry`=376;

-- Priestess Josetta
DELETE FROM `npc_gossip` WHERE `npc_guid`=80347;
UPDATE `creature_template` SET `gossip_menu_id`=4665 WHERE `entry`=377;

-- Branstock Khalder
DELETE FROM `npc_gossip` WHERE `npc_guid`=1023;
DELETE FROM `gossip_menu` WHERE `entry`=4680;
INSERT INTO `gossip_menu` VALUES (4680, 4436, 94);
INSERT INTO `gossip_menu` VALUES (4680, 4435, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4680, 0, 3, 'I seek more training in the priestly ways.', 5, 16, 0, 0, 0, 0, 0, NULL, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4680, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=837;

-- Maxan Anvol
DELETE FROM `npc_gossip` WHERE `npc_guid`=206;
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=1226;

-- Dark Cleric Duesten
DELETE FROM `npc_gossip` WHERE `npc_guid`=28469;
INSERT INTO `gossip_menu` VALUES (3645, 4442, 94);
INSERT INTO `gossip_menu` VALUES (3645, 4439, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3645, 0, 3, 'I seek more training in the priestly ways.', 5, 16, 0, 0, 0, 0, 0, NULL, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3645, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 163);
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=2123;

-- Dark Cleric Beryl
DELETE FROM `npc_gossip` WHERE `npc_guid`=28477;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=2129;

-- Miles Welsh
DELETE FROM `npc_gossip` WHERE `npc_guid`=26771;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=3044;

-- Malakai Cross
DELETE FROM `npc_gossip` WHERE `npc_guid`=26772;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=3045;

-- Father Cobb
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=3046;

-- Shanda
DELETE FROM `npc_gossip` WHERE `npc_guid`=46181;
DELETE FROM `gossip_menu` WHERE `entry`=4691;
INSERT INTO `gossip_menu` VALUES (4691, 4438, 94);
INSERT INTO `gossip_menu` VALUES (4691, 4437, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4691, 0, 3, 'I seek more training in the priestly ways.', 5, 16, 0, 0, 0, 0, 0, NULL, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4691, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=3595;

-- Laurna Morninglight
DELETE FROM `npc_gossip` WHERE `npc_guid`=46186;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=3600;

-- Tai'jin
DELETE FROM `npc_gossip` WHERE `npc_guid`=10429;
INSERT INTO `gossip_menu` VALUES (3644, 4441, 94);
INSERT INTO `gossip_menu` VALUES (3644, 4440, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3644, 0, 3, 'I seek more training in the priestly ways.', 5, 16, 0, 0, 0, 0, 0, NULL, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3644, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 163);
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=3706;

-- Ken'jai
DELETE FROM `npc_gossip` WHERE `npc_guid`=4912;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=3707;

-- Astarii Starseeker
DELETE FROM `npc_gossip` WHERE `npc_guid`=49859;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=4090;

-- Jandria
DELETE FROM `npc_gossip` WHERE `npc_guid`=49903;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=4091;

-- Lariia
DELETE FROM `npc_gossip` WHERE `npc_guid`=49934;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=4092;

-- Aelthalyste
DELETE FROM `npc_gossip` WHERE `npc_guid`=31866;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=4606;

-- Father Lankester
DELETE FROM `npc_gossip` WHERE `npc_guid`=41835;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=4607;

-- Father Lazarus
DELETE FROM `npc_gossip` WHERE `npc_guid`=31865;
UPDATE `creature_template` SET `gossip_menu_id`=3645 WHERE `entry`=4608;

-- Theodrus Frostbeard
DELETE FROM `npc_gossip` WHERE `npc_guid`=1780;
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=5141;

-- Braenna Flintcrag
DELETE FROM `npc_gossip` WHERE `npc_guid`=1770;
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=5142;

-- Toldren Deepiron
DELETE FROM `npc_gossip` WHERE `npc_guid`=1772;
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=5143;

-- Brother Benjamin
UPDATE `creature_template` SET `gossip_menu_id`=4665 WHERE `entry`=5484;

-- Brother Joshua
DELETE FROM `npc_gossip` WHERE `npc_guid`=37571;
UPDATE `creature_template` SET `gossip_menu_id`=4665 WHERE `entry`=5489;

-- Zayus
DELETE FROM `npc_gossip` WHERE `npc_guid`=3615;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=5994;

-- X'yera
DELETE FROM `npc_gossip` WHERE `npc_guid`=3473;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=6014;

-- Ur'kyo
DELETE FROM `npc_gossip` WHERE `npc_guid`=3472;
UPDATE `creature_template` SET `gossip_menu_id`=3644 WHERE `entry`=6018;

-- Nara Meideros
DELETE FROM `npc_gossip` WHERE `npc_guid`=90480;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=11397;

-- Priestess Alathea
DELETE FROM `npc_gossip` WHERE `npc_guid`=46567;
UPDATE `creature_template` SET `gossip_menu_id`=4691 WHERE `entry`=11401;

-- High Priest Rohan
DELETE FROM `npc_gossip` WHERE `npc_guid`=1777;
UPDATE `creature_template` SET `gossip_menu_id`=4680 WHERE `entry`=11406;

/*
	===========================
	GOSSIPS FOR SHAMAN TRAINERS
	===========================
*/

-- Haromm
DELETE FROM `npc_gossip` WHERE `npc_guid`=34147;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (92, 14, 0, 64);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (93, 14, 0, 1471);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (137, -1, 92, 107);
INSERT INTO `gossip_menu` VALUES (4652, 5005, 92);
INSERT INTO `gossip_menu` VALUES (4652, 5006, 93);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4652, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4652, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 137);
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=986;

-- Siln Skychaser
DELETE FROM `npc_gossip` WHERE `npc_guid`=26656;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3030;

-- Tigor Skychaser
DELETE FROM `npc_gossip` WHERE `npc_guid`=26658;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3031;

-- Beram Skychaser
DELETE FROM `npc_gossip` WHERE `npc_guid`=26659;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3032;

-- Meela Dawnstrider
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3062;

-- Narm Skychaser
DELETE FROM `npc_gossip` WHERE `npc_guid`=26906;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3066;

-- Shikrik
DELETE FROM `npc_gossip` WHERE `npc_guid`=7281;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3157;

-- Swart
DELETE FROM `npc_gossip` WHERE `npc_guid`=8419;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3173;

-- Kardris Dreamseeker
DELETE FROM `npc_gossip` WHERE `npc_guid`=4663;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=3344;

-- Sian'tsu
DELETE FROM `npc_gossip` WHERE `npc_guid`=4665;
INSERT INTO `gossip_menu` VALUES (4515, 5007, 92);
INSERT INTO `gossip_menu` VALUES (4515, 5008, 93);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4515, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4515, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 137);
UPDATE `creature_template` SET `gossip_menu_id`=4515 WHERE `entry`=3403;

-- Sagorne Creststrider
DELETE FROM `npc_gossip` WHERE `npc_guid`=4664;
UPDATE `creature_template` SET `gossip_menu_id`=4652 WHERE `entry`=13417;

/*
	=========================
	GOSSIPS FOR MAGE TRAINERS
	=========================
*/

-- Khelden Bremen
DELETE FROM `npc_gossip` WHERE `npc_guid`=79962;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (90, 14, 0, 128);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (91, 14, 0, 1407);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (138, -1, 90, 107);
DELETE FROM `gossip_menu` WHERE `entry`=4660;
INSERT INTO `gossip_menu` VALUES (4660, 538, 90);
INSERT INTO `gossip_menu` VALUES (4660, 539, 91);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4660;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4660, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4660, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 138);
UPDATE `creature_template` SET `gossip_menu_id`=4660 WHERE `entry`=198;

-- Zaldimar Wefhellt
DELETE FROM `npc_gossip` WHERE `npc_guid`=80344;
UPDATE `creature_template` SET `gossip_menu_id`=4660 WHERE `entry`=328;

-- Maginor Dumas
UPDATE `creature_template` SET `gossip_menu_id`=4660 WHERE `entry`=331;

-- Marryk Nurribit
DELETE FROM `npc_gossip` WHERE `npc_guid`=1025;
DELETE FROM `gossip_menu` WHERE `entry`=4552;
INSERT INTO `gossip_menu` VALUES (4552, 560, 90);
INSERT INTO `gossip_menu` VALUES (4552, 561, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4552, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4552, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 138);
UPDATE `creature_template` SET `gossip_menu_id`=4552 WHERE `entry`=944;

-- Magis Sparkmantle
DELETE FROM `npc_gossip` WHERE `npc_guid`=192;
INSERT INTO `gossip_menu` VALUES (4685, 558, 90);
INSERT INTO `gossip_menu` VALUES (4685, 559, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4685, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4685, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 138);
UPDATE `creature_template` SET `gossip_menu_id`=4685 WHERE `entry`=1228;

-- Isabella
DELETE FROM `npc_gossip` WHERE `npc_guid`=28463;
INSERT INTO `gossip_menu` VALUES (4654, 562, 90);
INSERT INTO `gossip_menu` VALUES (4654, 563, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4654, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4654, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 138);
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=2124;

-- Cain Firesong
DELETE FROM `npc_gossip` WHERE `npc_guid`=28476;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=2128;

-- Larimaine Purdue (Portal Trainer)
DELETE FROM `gossip_menu` WHERE `entry`=4822;
INSERT INTO `gossip_menu` VALUES (4822, 5876, 90);
INSERT INTO `gossip_menu` VALUES (4822, 5875, 91);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4822;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4822, 0, 3, 'Please teach me.', 5, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=4822 WHERE `entry`=2485;

-- Milstaff Stormeye (Portal Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=1771;
DELETE FROM `gossip_menu` WHERE `entry`=4823;
INSERT INTO `gossip_menu` VALUES (4823, 5878, 90);
INSERT INTO `gossip_menu` VALUES (4823, 5877, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4823, 0, 3, 'Please teach me.', 5, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=4823 WHERE `entry`=2489;

-- Lexington Mortaim (Portal Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=38072;
DELETE FROM `gossip_menu` WHERE `entry`=4826;
INSERT INTO `gossip_menu` VALUES (4826, 5884, 90);
INSERT INTO `gossip_menu` VALUES (4826, 5883, 91);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4826;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4826, 0, 3, 'Please teach me.', 5, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=4826 WHERE `entry`=2492;

-- Archmage Shymm
DELETE FROM `npc_gossip` WHERE `npc_guid`=26774;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=3047;

-- Ursyn Ghull
DELETE FROM `npc_gossip` WHERE `npc_guid`=26775;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=3048;

-- Thurston Xane
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=3049;

-- Elissa Dumas (Portal Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=46320;
UPDATE `creature_template` SET `gossip_menu_id`=4822 WHERE `entry`=4165;

-- Kaelystia Hatebringer
DELETE FROM `npc_gossip` WHERE `npc_guid`=31869;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=4566;

-- Pierce Shackleton
DELETE FROM `npc_gossip` WHERE `npc_guid`=38416;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=4567;

-- Anastasia Hartwell
DELETE FROM `npc_gossip` WHERE `npc_guid`=38422;
UPDATE `creature_template` SET `gossip_menu_id`=4654 WHERE `entry`=4568;

-- Bink
DELETE FROM `npc_gossip` WHERE `npc_guid`=1773;
UPDATE `creature_template` SET `gossip_menu_id`=4552 WHERE `entry`=5144;

-- Juli Stormkettle
DELETE FROM `npc_gossip` WHERE `npc_guid`=1779;
UPDATE `creature_template` SET `gossip_menu_id`=4552 WHERE `entry`=5145;

-- Nittlebur Sparkfizzle
DELETE FROM `npc_gossip` WHERE `npc_guid`=1782;
UPDATE `creature_template` SET `gossip_menu_id`=4552 WHERE `entry`=5146;

-- Jennea Cannon
DELETE FROM `npc_gossip` WHERE `npc_guid`=90462;
UPDATE `creature_template` SET `gossip_menu_id`=4660 WHERE `entry`=5497;

-- Elsharin
UPDATE `creature_template` SET `gossip_menu_id`=4660 WHERE `entry`=5498;

-- Un'Thuwa
DELETE FROM `gossip_menu` WHERE `entry`=64;
INSERT INTO `gossip_menu` VALUES (64, 564, 90);
INSERT INTO `gossip_menu` VALUES (64, 565, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (64, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (64, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 138);
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5880;

-- Pephredo
DELETE FROM `npc_gossip` WHERE `npc_guid`=3471;
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5882;

-- Enyo
DELETE FROM `npc_gossip` WHERE `npc_guid`=3616;
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5883;

-- Mai'ah
DELETE FROM `npc_gossip` WHERE `npc_guid`=4798;
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5884;

-- Deino
DELETE FROM `npc_gossip` WHERE `npc_guid`=3474;
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=5885;

-- Birgitte Cranston (Portal Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=24768;
INSERT INTO `gossip_menu` VALUES (4825, 5881, 90);
INSERT INTO `gossip_menu` VALUES (4825, 5882, 91);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4825, 0, 3, 'Please teach me.', 5, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=4825 WHERE `entry`=5957;

-- Thuul (Portal Trainer)
DELETE FROM `npc_gossip` WHERE `npc_guid`=3646;
UPDATE `creature_template` SET `gossip_menu_id`=4826 WHERE `entry`=5958;

-- Uthel'nay
DELETE FROM `npc_gossip` WHERE `npc_guid`=3648;
UPDATE `creature_template` SET `gossip_menu_id`=64 WHERE `entry`=7311;

-- Dink
DELETE FROM `npc_gossip` WHERE `npc_guid`=1774;
UPDATE `creature_template` SET `gossip_menu_id`=4552 WHERE `entry`=7312;

/*
	============================
	GOSSIPS FOR WARLOCK TRAINERS
	============================
*/

-- Missing gossip menu options for Drusilla La Salle, Demisette Cloyce, Maximillian Crowe, Alexander Calder, Ursula Deline, Sandahl
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (139, -1, 67, 107);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4667, 0, 3, 'I am interested in warlock training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4667, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 139);

-- Missing gossip menu options for Alamar Grimm, Thistleheart, Briarthorn, Gimrizz Shadowcog
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4668, 0, 3, 'I am interested in warlock training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4668, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 139);

-- Missing gossip menu options for Maximillion, Rupert Boch, Luther Pickman, Richard Kerwin
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4669, 0, 3, 'I submit myself for further training my master.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4669, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 139);

-- Missing gossip menu options for Kartosh, Nartok, Dhugru Gorelust, Grol'dar, Mirket, Zevrost, Kaal Soulreaper
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4670, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4670, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 139);

/*
	==========================
	GOSSIPS FOR DRUID TRAINERS
	==========================
*/

-- Turak Runetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26661;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (88, 14, 0, 511);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (89, 14, 0, 1024);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (140, -1, 89, 107);
INSERT INTO `gossip_menu` VALUES (3921, 4774, 88);
INSERT INTO `gossip_menu` VALUES (3921, 4775, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3921, 0, 3, 'I seek training as a druid.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3921, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=3921 WHERE `entry`=3033;

-- Sheal Runetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26662;
INSERT INTO `gossip_menu` VALUES (4606, 5717, 88);
INSERT INTO `gossip_menu` VALUES (4606, 5716, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4606, 0, 3, 'I seek further druidic training to have a closer understanding of the Earth Mother\'s will.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4606, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=4606 WHERE `entry`=3034;

-- Kym Wildmane
DELETE FROM `npc_gossip` WHERE `npc_guid`=26753;
UPDATE `creature_template` SET `gossip_menu_id`=4606 WHERE `entry`=3036;

-- Gart Mistrunner
DELETE FROM `npc_gossip` WHERE `npc_guid`=26898;
UPDATE `creature_template` SET `gossip_menu_id`=4606 WHERE `entry`=3060;

-- Gennia Runetotem
DELETE FROM `npc_gossip` WHERE `npc_guid`=26903;
INSERT INTO `gossip_menu` VALUES (3926, 4785, 88);
INSERT INTO `gossip_menu` VALUES (3926, 4786, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3926, 0, 3, 'I seek training as a druid.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3926, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=3926 WHERE `entry`=3064;

-- Mardant Strongoak
DELETE FROM `npc_gossip` WHERE `npc_guid`=46183;
INSERT INTO `gossip_menu` VALUES (4688, 4783, 88);
INSERT INTO `gossip_menu` VALUES (4688, 4784, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4688, 0, 3, 'I seek training as a druid.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4688, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=3597;

-- Kal
DELETE FROM `npc_gossip` WHERE `npc_guid`=46189;
INSERT INTO `gossip_menu` VALUES (3923, 4780, 88);
INSERT INTO `gossip_menu` VALUES (3923, 4779, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3923, 0, 3, 'I seek training as a druid.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3923, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=3923 WHERE `entry`=3602;

-- Mathrengyl Bearwalker
DELETE FROM `npc_gossip` WHERE `npc_guid`=46472;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (965, 8, 3785, 0);
DELETE FROM `gossip_menu` WHERE `entry`=1403;
INSERT INTO `gossip_menu` VALUES (1403, 2037, 88);
INSERT INTO `gossip_menu` VALUES (1403, 4782, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1403, 0, 3, 'I am here for training.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1403, 1, 1, 'I\'d like to purchase more Tharlendris seeds.', 3, 4, 0, 0, 0, 0, 0, '', 965);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (1403, 2, 0, 'I wish to unlearn my talents.', 1, 1, 4463, 0, 0, 0, 0, '', 140);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (4463, 0, 11, 'Yes. I do.', 16, 16, 0, 0, 0, 0, 0, '', 0);
UPDATE `creature_template` SET `gossip_menu_id`=1403 WHERE `entry`=4217;

-- Denatharion
DELETE FROM `npc_gossip` WHERE `npc_guid`=46474;
DELETE FROM `gossip_menu` WHERE `entry`=3924;
INSERT INTO `gossip_menu` VALUES (3924, 4781, 88);
INSERT INTO `gossip_menu` VALUES (3924, 4782, 89);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3924, 0, 3, 'I seek training as a druid.', 5, 16, 0, 0, 0, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (3924, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, '', 140);
UPDATE `creature_template` SET `gossip_menu_id`=3924 WHERE `entry`=4218;

-- Fylerian Nightwing
DELETE FROM `npc_gossip` WHERE `npc_guid`=46475;
UPDATE `creature_template` SET `gossip_menu_id`=3924 WHERE `entry`=4219;

-- Sheldras Moontree
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=5504;

-- Theridran
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=5505;

-- Maldryn
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=5506;

-- Jannos Lighthoof
DELETE FROM `npc_gossip` WHERE `npc_guid`=51301;
UPDATE `creature_template` SET `gossip_menu_id`=4606 WHERE `entry`=8142;

-- Golhine the Hooded
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=9465;

-- Loganaar
UPDATE `creature_template` SET `gossip_menu_id`=4688 WHERE `entry`=12042;