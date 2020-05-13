DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200509205909');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200509205909');
-- Add your query below.


DELETE FROM `gossip_menu` WHERE `entry` IN (643, 648, 660, 698, 1041, 1042, 1468, 2742, 2745, 2747, 2748, 2761, 2782, 4116, 4118, 4123, 4126, 4132, 4137, 4139, 4143, 4144, 4146, 4148, 4149, 4151, 4153, 4154, 4155, 4157, 4158, 4159, 4160, 4161, 4163, 4165, 4166, 4168, 4173, 4183, 4187, 4203, 4204, 4205, 4207, 4209, 4241, 4242, 4262, 4264, 4265, 4266, 4268, 4269, 4345, 4347, 4349, 4351, 4352, 4353, 4354, 4741, 4748, 4843, 4844, 5853, 7690);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (643, 648, 660, 698, 1041, 1042, 1468, 2742, 2745, 2747, 2748, 2761, 2782, 4116, 4118, 4123, 4126, 4132, 4137, 4139, 4143, 4144, 4146, 4148, 4149, 4151, 4153, 4154, 4155, 4157, 4158, 4159, 4160, 4161, 4163, 4165, 4166, 4168, 4173, 4183, 4187, 4203, 4204, 4205, 4207, 4209, 4241, 4242, 4262, 4264, 4265, 4266, 4268, 4269, 4345, 4347, 4349, 4351, 4352, 4353, 4354, 4741, 4748, 4843, 4844, 5853, 7690);

-- Dane Lindgren
INSERT INTO `gossip_menu` VALUES (2745, 3408, 366);
INSERT INTO `gossip_menu` VALUES (2745, 3407, 4);
INSERT INTO `gossip_menu` VALUES (2745, 3406, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2745 WHERE `entry` = 957;

-- Vosur Brakthel
INSERT INTO `gossip_menu` VALUES (4116, 5031, 0);
INSERT INTO `gossip_menu` VALUES (4116, 5032, 25);
INSERT INTO `gossip_menu` VALUES (4116, 5033, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4116 WHERE `entry` = 1246;

-- Maris Granger
INSERT INTO `gossip_menu` VALUES (648, 1210, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (648, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=648 WHERE `entry` = 1292;

-- Lawrence Schneider
INSERT INTO `gossip_menu` VALUES (4262, 5417, 372);
INSERT INTO `gossip_menu` VALUES (4262, 5418, 14);
INSERT INTO `gossip_menu` VALUES (4262, 5416, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4262 WHERE `entry` = 1300;

-- Lucan Cordell
INSERT INTO `gossip_menu` VALUES (4161, 5207, 0);
INSERT INTO `gossip_menu` VALUES (4161, 5210, 203);
INSERT INTO `gossip_menu` VALUES (4161, 5211, 380);
INSERT INTO `gossip_menu` VALUES (4161, 5208, 381);
UPDATE `creature_template` SET `gossip_menu_id`=4161 WHERE `entry` = 1317;

-- Georgio Bolero
INSERT INTO `gossip_menu` VALUES (4353, 5561, 0);
INSERT INTO `gossip_menu` VALUES (4353, 5564, 14);
INSERT INTO `gossip_menu` VALUES (4353, 5565, 373);
INSERT INTO `gossip_menu` VALUES (4353, 5562, 374);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4353, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4353 WHERE `entry` = 1346;

-- Snarl
INSERT INTO `gossip_menu` VALUES (2782, 3466, 0);
INSERT INTO `gossip_menu` VALUES (2782, 3467, 4);
INSERT INTO `gossip_menu` VALUES (2782, 3468, 366);
INSERT INTO `gossip_menu` VALUES (2782, 3470, 367);
UPDATE `creature_template` SET `gossip_menu_id`=2782 WHERE `entry` = 1383;

-- Uthrar Threx
INSERT INTO `gossip_menu` VALUES (4264, 5423, 372);
INSERT INTO `gossip_menu` VALUES (4264, 5424, 14);
INSERT INTO `gossip_menu` VALUES (4264, 5422, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4264 WHERE `entry` = 1703;

-- Snang
INSERT INTO `gossip_menu` VALUES (4265, 5425, 0);
INSERT INTO `gossip_menu` VALUES (4265, 5427, 14);
INSERT INTO `gossip_menu` VALUES (4265, 5426, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4265 WHERE `entry` = 2855;

-- Thund
INSERT INTO `gossip_menu` VALUES (4143, 5136, 0);
INSERT INTO `gossip_menu` VALUES (4143, 5138, 44);
INSERT INTO `gossip_menu` VALUES (4143, 5137, 391);
UPDATE `creature_template` SET `gossip_menu_id`=4143 WHERE `entry` = 2857;

-- Brek Stonehoof
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` = 3001;

-- Tepa
INSERT INTO `gossip_menu` VALUES (4351, 5551, 0);
INSERT INTO `gossip_menu` VALUES (4351, 5554, 14);
INSERT INTO `gossip_menu` VALUES (4351, 5555, 372);
INSERT INTO `gossip_menu` VALUES (4351, 5552, 373);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4351, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4351 WHERE `entry` = 3004;

-- Una
INSERT INTO `gossip_menu` VALUES (4242, 5398, 0);
INSERT INTO `gossip_menu` VALUES (4242, 5401, 18);
INSERT INTO `gossip_menu` VALUES (4242, 5402, 378);
INSERT INTO `gossip_menu` VALUES (4242, 5399, 379);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4242, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4242 WHERE `entry` = 3007;

-- Mak
INSERT INTO `gossip_menu` VALUES (4187, 5291, 0);
INSERT INTO `gossip_menu` VALUES (4187, 5293, 18);
INSERT INTO `gossip_menu` VALUES (4187, 5292, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4187 WHERE `entry` = 3008;

-- Teg Dawnstrider
INSERT INTO `gossip_menu` VALUES (4165, 5223, 0);
INSERT INTO `gossip_menu` VALUES (4165, 5226, 203);
INSERT INTO `gossip_menu` VALUES (4165, 5227, 380);
INSERT INTO `gossip_menu` VALUES (4165, 5224, 381);
UPDATE `creature_template` SET `gossip_menu_id`=4165 WHERE `entry` = 3011;

-- Lumak
INSERT INTO `gossip_menu` VALUES (4741, 5793, 0);
INSERT INTO `gossip_menu` VALUES (4741, 5794, 10217);
INSERT INTO `gossip_menu` VALUES (4741, 6793, 128);
INSERT INTO `gossip_menu` VALUES (4741, 6960, 129);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4741, 0, 3, 'I require training, Lumak.', 8335, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4741 WHERE `entry` = 3332;

-- Godan
INSERT INTO `gossip_menu` VALUES (4168, 5238, 0);
INSERT INTO `gossip_menu` VALUES (4168, 5241, 203);
INSERT INTO `gossip_menu` VALUES (4168, 5242, 380);
INSERT INTO `gossip_menu` VALUES (4168, 5239, 381);
UPDATE `creature_template` SET `gossip_menu_id`=4168 WHERE `entry` = 3345;

-- Yelmak
INSERT INTO `gossip_menu` VALUES (4126, 5069, 0);
INSERT INTO `gossip_menu` VALUES (4126, 5072, 25);
INSERT INTO `gossip_menu` VALUES (4126, 5073, 361);
INSERT INTO `gossip_menu` VALUES (4126, 5070, 362);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4126, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4126 WHERE `entry` = 3347;

-- Makaru
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` = 3357;

-- Magar
INSERT INTO `gossip_menu` VALUES (4347, 5530, 0);
INSERT INTO `gossip_menu` VALUES (4347, 5533, 14);
INSERT INTO `gossip_menu` VALUES (4347, 5534, 372);
INSERT INTO `gossip_menu` VALUES (4347, 5531, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4347 WHERE `entry` = 3363;

-- Karolek
INSERT INTO `gossip_menu` VALUES (4209, 5350, 0);
INSERT INTO `gossip_menu` VALUES (4209, 5353, 18);
INSERT INTO `gossip_menu` VALUES (4209, 5354, 377);
INSERT INTO `gossip_menu` VALUES (4209, 5351, 378);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4209, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4209 WHERE `entry` = 3365;

-- Nogg
INSERT INTO `gossip_menu` VALUES (4148, 5157, 0);
INSERT INTO `gossip_menu` VALUES (4148, 5160, 44);
INSERT INTO `gossip_menu` VALUES (4148, 5161, 391);
INSERT INTO `gossip_menu` VALUES (4148, 5158, 392);
UPDATE `creature_template` SET `gossip_menu_id`=4148 WHERE `entry` = 3412;

-- Me'lynn
INSERT INTO `gossip_menu` VALUES (4349, 5540, 0);
INSERT INTO `gossip_menu` VALUES (4349, 5543, 14);
INSERT INTO `gossip_menu` VALUES (4349, 5544, 372);
INSERT INTO `gossip_menu` VALUES (4349, 5541, 373);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4349, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4349 WHERE `entry` = 4159;

-- Alegorn
INSERT INTO `gossip_menu` VALUES (5853, 7021, 0);
INSERT INTO `gossip_menu` VALUES (5853, 7016, 87);
INSERT INTO `gossip_menu` VALUES (5853, 7015, 86);
INSERT INTO `gossip_menu` VALUES (5853, 7017, 127);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5853, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5853, 1, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 4210;

-- Telonis
INSERT INTO `gossip_menu` VALUES (4241, 5393, 0);
INSERT INTO `gossip_menu` VALUES (4241, 5396, 18);
INSERT INTO `gossip_menu` VALUES (4241, 5397, 378);
INSERT INTO `gossip_menu` VALUES (4241, 5394, 379);
UPDATE `creature_template` SET `gossip_menu_id`=4241 WHERE `entry` = 4212;

-- Taladan
INSERT INTO `gossip_menu` VALUES (4163, 5213, 0);
INSERT INTO `gossip_menu` VALUES (4163, 5216, 203);
INSERT INTO `gossip_menu` VALUES (4163, 5217, 380);
INSERT INTO `gossip_menu` VALUES (4163, 5214, 381);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4163, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4163 WHERE `entry` = 4213;

-- Geofram Bouldertoe
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` = 4254;

-- Josef Gregorian
INSERT INTO `gossip_menu` VALUES (4354, 5566, 0);
INSERT INTO `gossip_menu` VALUES (4354, 5569, 14);
INSERT INTO `gossip_menu` VALUES (4354, 5570, 373);
INSERT INTO `gossip_menu` VALUES (4354, 5567, 374);
UPDATE `creature_template` SET `gossip_menu_id`=4354 WHERE `entry` = 4576;

-- Josephine Lister
INSERT INTO `gossip_menu` VALUES (4843, 5918, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4843 WHERE `entry` = 4578;

-- Graham Van Talen
INSERT INTO `gossip_menu` VALUES (4144, 5139, 0);
INSERT INTO `gossip_menu` VALUES (4144, 5141, 44);
INSERT INTO `gossip_menu` VALUES (4144, 5140, 391);
UPDATE `creature_template` SET `gossip_menu_id`=4144 WHERE `entry` = 4586;

-- Brom Killian
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` = 4598;

-- Doctor Herbert Halsey
INSERT INTO `gossip_menu` VALUES (4132, 5099, 0);
INSERT INTO `gossip_menu` VALUES (4132, 5102, 25);
INSERT INTO `gossip_menu` VALUES (4132, 5103, 362);
INSERT INTO `gossip_menu` VALUES (4132, 5100, 363);
UPDATE `creature_template` SET `gossip_menu_id`=4132 WHERE `entry` = 4611;

-- Lavinia Crowe
INSERT INTO `gossip_menu` VALUES (4166, 5228, 0);
INSERT INTO `gossip_menu` VALUES (4166, 5231, 203);
INSERT INTO `gossip_menu` VALUES (4166, 5232, 380);
INSERT INTO `gossip_menu` VALUES (4166, 5229, 381);
UPDATE `creature_template` SET `gossip_menu_id`=4166 WHERE `entry` = 4616;

-- Fimble Finespindle
INSERT INTO `gossip_menu` VALUES (4205, 5330, 0);
INSERT INTO `gossip_menu` VALUES (4205, 5333, 18);
INSERT INTO `gossip_menu` VALUES (4205, 5334, 377);
INSERT INTO `gossip_menu` VALUES (4205, 5331, 378);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4205, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4205 WHERE `entry` = 5127;

-- Jormund Stonebrow
INSERT INTO `gossip_menu` VALUES (4345, 5524, 0);
INSERT INTO `gossip_menu` VALUES (4345, 5527, 14);
INSERT INTO `gossip_menu` VALUES (4345, 5528, 372);
INSERT INTO `gossip_menu` VALUES (4345, 5525, 373);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4345, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4345 WHERE `entry` = 5153;

-- Gimble Thistlefuzz
INSERT INTO `gossip_menu` VALUES (4160, 5202, 0);
INSERT INTO `gossip_menu` VALUES (4160, 5205, 203);
INSERT INTO `gossip_menu` VALUES (4160, 5206, 380);
INSERT INTO `gossip_menu` VALUES (4160, 5203, 381);
UPDATE `creature_template` SET `gossip_menu_id`=4160 WHERE `entry` = 5157;

-- Daryl Riknussun
INSERT INTO `gossip_menu` VALUES (4748, 7017, 127);
INSERT INTO `gossip_menu` VALUES (4748, 7016, 87);
INSERT INTO `gossip_menu` VALUES (4748, 7015, 86);
INSERT INTO `gossip_menu` VALUES (4748, 5800, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4748, 0, 3, 'I require training, Daryl.', 8349, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4748 WHERE `entry` = 5159;

-- Tally Berryfizz
INSERT INTO `gossip_menu` VALUES (4123, 5054, 0);
INSERT INTO `gossip_menu` VALUES (4123, 5057, 25);
INSERT INTO `gossip_menu` VALUES (4123, 5058, 361);
INSERT INTO `gossip_menu` VALUES (4123, 5055, 362);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4123, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4123 WHERE `entry` = 5177;

-- Gelman Stonehand
INSERT INTO `gossip_menu` VALUES (660, 1225, 0);
INSERT INTO `gossip_menu` VALUES (660, 1226, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (660, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=660 WHERE `entry` = 5513;

-- Lilliam Sparkspindle
INSERT INTO `gossip_menu` VALUES (4146, 5147, 0);
INSERT INTO `gossip_menu` VALUES (4146, 5150, 44);
INSERT INTO `gossip_menu` VALUES (4146, 5151, 391);
INSERT INTO `gossip_menu` VALUES (4146, 5148, 392);
UPDATE `creature_template` SET `gossip_menu_id`=4146 WHERE `entry` = 5518;

-- Billibub Cogspinner
INSERT INTO `gossip_menu` VALUES (698, 1249, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (698, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=698 WHERE `entry` = 5519;

-- Simon Tanner
INSERT INTO `gossip_menu` VALUES (4203, 5320, 0);
INSERT INTO `gossip_menu` VALUES (4203, 5323, 18);
INSERT INTO `gossip_menu` VALUES (4203, 5324, 377);
INSERT INTO `gossip_menu` VALUES (4203, 5321, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4203 WHERE `entry` = 5564;

-- Tannysa
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (235, 7, 182, 1, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (643, 1203, 235);
UPDATE `creature_template` SET `gossip_menu_id`=643 WHERE `entry` = 5566;

-- Kamari
INSERT INTO `gossip_menu` VALUES (4183, 5279, 0);
INSERT INTO `gossip_menu` VALUES (4183, 5281, 18);
INSERT INTO `gossip_menu` VALUES (4183, 5280, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4183 WHERE `entry` = 5811;

-- Kelgruk Bloodaxe
INSERT INTO `gossip_menu` VALUES (1042, 1635, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1042 WHERE `entry` = 7231;

-- Borgus Steelhand
INSERT INTO `gossip_menu` VALUES (1041, 1133, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1041 WHERE `entry` = 7232;

-- Tinkmaster Overspark
INSERT INTO `gossip_menu` VALUES (1468, 2137, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1468 WHERE `entry` = 7944;

-- Jalane Ayrole
INSERT INTO `gossip_menu` VALUES (4844, 5919, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4844, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4844 WHERE `entry` = 9584;

-- Ug'thok
INSERT INTO `gossip_menu` VALUES (2747, 3412, 0);
INSERT INTO `gossip_menu` VALUES (2747, 3413, 4);
INSERT INTO `gossip_menu` VALUES (2747, 3414, 366);
UPDATE `creature_template` SET `gossip_menu_id`=2747 WHERE `entry` = 10266;

-- Rotgath Stonebeard
INSERT INTO `gossip_menu` VALUES (2761, 3456, 0);
INSERT INTO `gossip_menu` VALUES (2761, 3457, 4);
INSERT INTO `gossip_menu` VALUES (2761, 3459, 366);
INSERT INTO `gossip_menu` VALUES (2761, 3460, 367);
UPDATE `creature_template` SET `gossip_menu_id`=2761 WHERE `entry` = 10276;

-- Groum Stonebeard
INSERT INTO `gossip_menu` VALUES (2742, 3400, 366);
INSERT INTO `gossip_menu` VALUES (2742, 3399, 4);
INSERT INTO `gossip_menu` VALUES (2742, 3398, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2742 WHERE `entry` = 10277;

-- Thrag Stonehoof
INSERT INTO `gossip_menu` VALUES (2748, 3415, 0);
INSERT INTO `gossip_menu` VALUES (2748, 3416, 4);
INSERT INTO `gossip_menu` VALUES (2748, 3417, 366);
UPDATE `creature_template` SET `gossip_menu_id`=2748 WHERE `entry` = 10278;

-- Roxxik
INSERT INTO `gossip_menu` VALUES (4151, 5172, 0);
INSERT INTO `gossip_menu` VALUES (4151, 5175, 44);
INSERT INTO `gossip_menu` VALUES (4151, 5176, 392);
INSERT INTO `gossip_menu` VALUES (4151, 5173, 393);
UPDATE `creature_template` SET `gossip_menu_id`=4151 WHERE `entry` = 11017;

-- Sprite Jumpsprocket
INSERT INTO `gossip_menu` VALUES (4139, 5124, 0);
INSERT INTO `gossip_menu` VALUES (4139, 5126, 44);
INSERT INTO `gossip_menu` VALUES (4139, 5125, 391);
UPDATE `creature_template` SET `gossip_menu_id`=4139 WHERE `entry` = 11026;

-- Jemma Quikswitch
INSERT INTO `gossip_menu` VALUES (4137, 5119, 391);
INSERT INTO `gossip_menu` VALUES (4137, 5120, 44);
INSERT INTO `gossip_menu` VALUES (4137, 5118, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4137 WHERE `entry` = 11028;

-- Franklin Lloyd
INSERT INTO `gossip_menu` VALUES (4149, 5162, 0);
INSERT INTO `gossip_menu` VALUES (4149, 5165, 44);
INSERT INTO `gossip_menu` VALUES (4149, 5164, 391);
INSERT INTO `gossip_menu` VALUES (4149, 5163, 392);
UPDATE `creature_template` SET `gossip_menu_id`=4149 WHERE `entry` = 11031;

-- Whuut
INSERT INTO `gossip_menu` VALUES (4118, 5037, 0);
INSERT INTO `gossip_menu` VALUES (4118, 5038, 25);
INSERT INTO `gossip_menu` VALUES (4118, 5039, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4118 WHERE `entry` = 11046;

-- Victor Ward
INSERT INTO `gossip_menu` VALUES (4268, 5434, 0);
INSERT INTO `gossip_menu` VALUES (4268, 5436, 14);
INSERT INTO `gossip_menu` VALUES (4268, 5435, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4268 WHERE `entry` = 11048;

-- Rhiannon Davis
INSERT INTO `gossip_menu` VALUES (4352, 5556, 0);
INSERT INTO `gossip_menu` VALUES (4352, 5559, 14);
INSERT INTO `gossip_menu` VALUES (4352, 5560, 372);
INSERT INTO `gossip_menu` VALUES (4352, 5557, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4352 WHERE `entry` = 11049;

-- Trianna
INSERT INTO `gossip_menu` VALUES (4269, 5438, 372);
INSERT INTO `gossip_menu` VALUES (4269, 5439, 14);
INSERT INTO `gossip_menu` VALUES (4269, 5437, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4269 WHERE `entry` = 11050;

-- Vhan
INSERT INTO `gossip_menu` VALUES (4266, 5428, 0);
INSERT INTO `gossip_menu` VALUES (4266, 5430, 14);
INSERT INTO `gossip_menu` VALUES (4266, 5429, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4266 WHERE `entry` = 11051;

-- Thonys Pillarstone
INSERT INTO `gossip_menu` VALUES (4154, 5184, 0);
INSERT INTO `gossip_menu` VALUES (4154, 5186, 203);
INSERT INTO `gossip_menu` VALUES (4154, 5185, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4154 WHERE `entry` = 11065;

-- Jhag
INSERT INTO `gossip_menu` VALUES (4159, 5199, 0);
INSERT INTO `gossip_menu` VALUES (4159, 5201, 203);
INSERT INTO `gossip_menu` VALUES (4159, 5200, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4159 WHERE `entry` = 11066;

-- Malcomb Wynn
INSERT INTO `gossip_menu` VALUES (4157, 5193, 0);
INSERT INTO `gossip_menu` VALUES (4157, 5195, 203);
INSERT INTO `gossip_menu` VALUES (4157, 5194, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4157 WHERE `entry` = 11067;

-- Betty Quin
INSERT INTO `gossip_menu` VALUES (4153, 5182, 380);
INSERT INTO `gossip_menu` VALUES (4153, 5183, 203);
INSERT INTO `gossip_menu` VALUES (4153, 5181, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4153 WHERE `entry` = 11068;

-- Lalina Summermoon
INSERT INTO `gossip_menu` VALUES (4155, 5188, 380);
INSERT INTO `gossip_menu` VALUES (4155, 5189, 203);
INSERT INTO `gossip_menu` VALUES (4155, 5187, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4155 WHERE `entry` = 11070;

-- Mot Dawnstrider
INSERT INTO `gossip_menu` VALUES (4158, 5196, 0);
INSERT INTO `gossip_menu` VALUES (4158, 5198, 203);
INSERT INTO `gossip_menu` VALUES (4158, 5197, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4158 WHERE `entry` = 11071;

-- Faldron
INSERT INTO `gossip_menu` VALUES (4204, 5325, 0);
INSERT INTO `gossip_menu` VALUES (4204, 5328, 18);
INSERT INTO `gossip_menu` VALUES (4204, 5329, 377);
INSERT INTO `gossip_menu` VALUES (4204, 5326, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4204 WHERE `entry` = 11081;

-- Tarn
INSERT INTO `gossip_menu` VALUES (4207, 5340, 0);
INSERT INTO `gossip_menu` VALUES (4207, 5343, 18);
INSERT INTO `gossip_menu` VALUES (4207, 5344, 377);
INSERT INTO `gossip_menu` VALUES (4207, 5341, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4207 WHERE `entry` = 11084;

-- Randal Worth
INSERT INTO `gossip_menu` VALUES (4173, 5260, 0);
INSERT INTO `gossip_menu` VALUES (4173, 5262, 18);
INSERT INTO `gossip_menu` VALUES (4173, 5261, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4173 WHERE `entry` = 11096;

-- Move Love is in the Air gossips.
UPDATE `gossip_menu` SET `entry`=643 WHERE `entry`=9393 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=648 WHERE `entry`=9020 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=660 WHERE `entry`=9386 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=698 WHERE `entry`=9389 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=1041 WHERE `entry`=9486 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=1042 WHERE `entry`=9485 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=1468 WHERE `entry`=9500 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2742 WHERE `entry`=9542 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2745 WHERE `entry`=9008 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2747 WHERE `entry`=9540 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2748 WHERE `entry`=9543 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2761 WHERE `entry`=9541 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=2782 WHERE `entry`=9059 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4116 WHERE `entry`=9011 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4118 WHERE `entry`=9557 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4123 WHERE `entry`=9364 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4126 WHERE `entry`=9165 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4132 WHERE `entry`=9301 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4137 WHERE `entry`=9552 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4139 WHERE `entry`=9551 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4143 WHERE `entry`=9100 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4144 WHERE `entry`=9283 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4146 WHERE `entry`=9388 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4148 WHERE `entry`=9193 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4149 WHERE `entry`=9553 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4151 WHERE `entry`=9550 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4153 WHERE `entry`=9566 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4154 WHERE `entry`=9563 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4155 WHERE `entry`=9568 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4157 WHERE `entry`=9565 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4158 WHERE `entry`=9569 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4159 WHERE `entry`=9564 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4160 WHERE `entry`=9353 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4161 WHERE `entry`=9041 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4163 WHERE `entry`=9230 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4165 WHERE `entry`=9119 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4166 WHERE `entry`=9305 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4168 WHERE `entry`=9163 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4173 WHERE `entry`=9573 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4183 WHERE `entry`=9440 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4187 WHERE `entry`=9116 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4203 WHERE `entry`=9391 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4204 WHERE `entry`=9570 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4205 WHERE `entry`=9338 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4207 WHERE `entry`=9572 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4209 WHERE `entry`=9178 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4241 WHERE `entry`=9229 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4242 WHERE `entry`=9115 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4262 WHERE `entry`=9026 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4264 WHERE `entry`=9078 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4265 WHERE `entry`=9099 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4266 WHERE `entry`=9562 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4268 WHERE `entry`=9559 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4269 WHERE `entry`=9561 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4345 WHERE `entry`=9349 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4347 WHERE `entry`=9176 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4349 WHERE `entry`=9211 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4351 WHERE `entry`=9113 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4352 WHERE `entry`=9560 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4353 WHERE `entry`=9051 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4354 WHERE `entry`=9275 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4741 WHERE `entry`=9158 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4748 WHERE `entry`=9355 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4843 WHERE `entry`=9277 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=4844 WHERE `entry`=9531 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu` SET `entry`=5853 WHERE `entry`=9228 && `text_id` IN (8244, 8254, 8255, 8283, 8285, 8291, 8296, 8298, 8263);
UPDATE `gossip_menu_option` SET `menu_id`=643 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9393;
UPDATE `gossip_menu_option` SET `menu_id`=648 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9020;
UPDATE `gossip_menu_option` SET `menu_id`=660 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9386;
UPDATE `gossip_menu_option` SET `menu_id`=698 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9389;
UPDATE `gossip_menu_option` SET `menu_id`=1041 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9486;
UPDATE `gossip_menu_option` SET `menu_id`=1042 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9485;
UPDATE `gossip_menu_option` SET `menu_id`=1468 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9500;
UPDATE `gossip_menu_option` SET `menu_id`=2742 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9542;
UPDATE `gossip_menu_option` SET `menu_id`=2745 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9008;
UPDATE `gossip_menu_option` SET `menu_id`=2747 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9540;
UPDATE `gossip_menu_option` SET `menu_id`=2748 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9543;
UPDATE `gossip_menu_option` SET `menu_id`=2761 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9541;
UPDATE `gossip_menu_option` SET `menu_id`=2782 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9059;
UPDATE `gossip_menu_option` SET `menu_id`=4116 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9011;
UPDATE `gossip_menu_option` SET `menu_id`=4118 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9557;
UPDATE `gossip_menu_option` SET `menu_id`=4123 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9364;
UPDATE `gossip_menu_option` SET `menu_id`=4126 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9165;
UPDATE `gossip_menu_option` SET `menu_id`=4132 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9301;
UPDATE `gossip_menu_option` SET `menu_id`=4137 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9552;
UPDATE `gossip_menu_option` SET `menu_id`=4139 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9551;
UPDATE `gossip_menu_option` SET `menu_id`=4143 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9100;
UPDATE `gossip_menu_option` SET `menu_id`=4144 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9283;
UPDATE `gossip_menu_option` SET `menu_id`=4146 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9388;
UPDATE `gossip_menu_option` SET `menu_id`=4148 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9193;
UPDATE `gossip_menu_option` SET `menu_id`=4149 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9553;
UPDATE `gossip_menu_option` SET `menu_id`=4151 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9550;
UPDATE `gossip_menu_option` SET `menu_id`=4153 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9566;
UPDATE `gossip_menu_option` SET `menu_id`=4154 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9563;
UPDATE `gossip_menu_option` SET `menu_id`=4155 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9568;
UPDATE `gossip_menu_option` SET `menu_id`=4157 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9565;
UPDATE `gossip_menu_option` SET `menu_id`=4158 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9569;
UPDATE `gossip_menu_option` SET `menu_id`=4159 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9564;
UPDATE `gossip_menu_option` SET `menu_id`=4160 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9353;
UPDATE `gossip_menu_option` SET `menu_id`=4161 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9041;
UPDATE `gossip_menu_option` SET `menu_id`=4163 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9230;
UPDATE `gossip_menu_option` SET `menu_id`=4165 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9119;
UPDATE `gossip_menu_option` SET `menu_id`=4166 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9305;
UPDATE `gossip_menu_option` SET `menu_id`=4168 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9163;
UPDATE `gossip_menu_option` SET `menu_id`=4173 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9573;
UPDATE `gossip_menu_option` SET `menu_id`=4183 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9440;
UPDATE `gossip_menu_option` SET `menu_id`=4187 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9116;
UPDATE `gossip_menu_option` SET `menu_id`=4203 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9391;
UPDATE `gossip_menu_option` SET `menu_id`=4204 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9570;
UPDATE `gossip_menu_option` SET `menu_id`=4205 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9338;
UPDATE `gossip_menu_option` SET `menu_id`=4207 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9572;
UPDATE `gossip_menu_option` SET `menu_id`=4209 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9178;
UPDATE `gossip_menu_option` SET `menu_id`=4241 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9229;
UPDATE `gossip_menu_option` SET `menu_id`=4242 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9115;
UPDATE `gossip_menu_option` SET `menu_id`=4262 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9026;
UPDATE `gossip_menu_option` SET `menu_id`=4264 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9078;
UPDATE `gossip_menu_option` SET `menu_id`=4265 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9099;
UPDATE `gossip_menu_option` SET `menu_id`=4266 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9562;
UPDATE `gossip_menu_option` SET `menu_id`=4268 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9559;
UPDATE `gossip_menu_option` SET `menu_id`=4269 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9561;
UPDATE `gossip_menu_option` SET `menu_id`=4345 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9349;
UPDATE `gossip_menu_option` SET `menu_id`=4347 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9176;
UPDATE `gossip_menu_option` SET `menu_id`=4349 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9211;
UPDATE `gossip_menu_option` SET `menu_id`=4351 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9113;
UPDATE `gossip_menu_option` SET `menu_id`=4352 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9560;
UPDATE `gossip_menu_option` SET `menu_id`=4353 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9051;
UPDATE `gossip_menu_option` SET `menu_id`=4354 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9275;
UPDATE `gossip_menu_option` SET `menu_id`=4741 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9158;
UPDATE `gossip_menu_option` SET `menu_id`=4748 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9355;
UPDATE `gossip_menu_option` SET `menu_id`=4843 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9277;
UPDATE `gossip_menu_option` SET `menu_id`=4844 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9531;
UPDATE `gossip_menu_option` SET `menu_id`=5853 WHERE `OptionBroadcastTextID`=11723 && `menu_id`=9228;
DELETE FROM `gossip_menu` WHERE `entry` IN (9008, 9011, 9020, 9026, 9041, 9051, 9059, 9078, 9099, 9100, 9110, 9113, 9115, 9116, 9119, 9158, 9163, 9165, 9171, 9176, 9178, 9193, 9211, 9228, 9229, 9230, 9249, 9275, 9277, 9283, 9291, 9301, 9305, 9338, 9349, 9353, 9355, 9364, 9386, 9388, 9389, 9391, 9393, 9440, 9485, 9486, 9500, 9531, 9540, 9541, 9542, 9543, 9550, 9551, 9552, 9553, 9557, 9559, 9560, 9561, 9562, 9563, 9564, 9565, 9566, 9568, 9569, 9570, 9572, 9573);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9008, 9011, 9020, 9026, 9041, 9051, 9059, 9078, 9099, 9100, 9110, 9113, 9115, 9116, 9119, 9158, 9163, 9165, 9171, 9176, 9178, 9193, 9211, 9228, 9229, 9230, 9249, 9275, 9277, 9283, 9291, 9301, 9305, 9338, 9349, 9353, 9355, 9364, 9386, 9388, 9389, 9391, 9393, 9440, 9485, 9486, 9500, 9531, 9540, 9541, 9542, 9543, 9550, 9551, 9552, 9553, 9557, 9559, 9560, 9561, 9562, 9563, 9564, 9565, 9566, 9568, 9569, 9570, 9572, 9573);

-- Zaldimar Wefhellt
DELETE FROM `gossip_menu` WHERE `entry`=4661;
INSERT INTO `gossip_menu` VALUES (4661, 538, 90);
INSERT INTO `gossip_menu` VALUES (4661, 539, 91);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4661;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4661, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4661, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
UPDATE `creature_template` SET `gossip_menu_id`=4661 WHERE `entry`=328;

-- Maginor Dumas
DELETE FROM `gossip_menu` WHERE `entry`=4486;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 538, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 539, 91);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4486, 8298, 455);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4486;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4486, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4486, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4486, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4486, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4486 WHERE `entry`=331;

-- Priestess Josetta
DELETE FROM `gossip_menu` WHERE `entry`=4666;
INSERT INTO `gossip_menu` VALUES (4666, 4434, 0);
INSERT INTO `gossip_menu` VALUES (4666, 4433, 94);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4666;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4666, 0, 3, 'Train me', 0, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4666, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4666 WHERE `entry`=377;

-- Lyria Du Lac
DELETE FROM `gossip_menu` WHERE `entry`=4649;
INSERT INTO `gossip_menu` VALUES (4649, 5721, 0);
INSERT INTO `gossip_menu` VALUES (4649, 1216, 98);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4649;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4649, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4649, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=4649 WHERE `entry`=913;

-- Brother Wilhelm
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4664;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4664, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4664, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
UPDATE `creature_template` SET `gossip_menu_id`=4664 WHERE `entry`=927;

-- Kartosh
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (236, 14, 0, 1279, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4642, 5715, 236);
INSERT INTO `gossip_menu` VALUES (4642, 5714, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4642, 0, 3, 'It is a greater knowledge of the ways of the warlock that I crave.', 8292, 5, 16, 0, 0, 0, 0, 0, '', 0, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4642, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4642 WHERE `entry`=988;

-- Granis Swiftaxe
DELETE FROM `gossip_menu` WHERE `entry`=4683;
INSERT INTO `gossip_menu` VALUES (4683, 5724, 0);
INSERT INTO `gossip_menu` VALUES (4683, 1215, 98);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4683, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4683, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=4683 WHERE `entry`=1229;

-- Grif Wildheart
INSERT INTO `gossip_menu` VALUES (4007, 5000, 97);
INSERT INTO `gossip_menu` VALUES (4007, 4999, 96);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4007, 0, 3, 'I\'d like to train.', 7149, 5, 16, 0, 0, 0, 0, 0, '', 0, 96);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4007, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
UPDATE `creature_template` SET `gossip_menu_id`=4007 WHERE `entry`=1231;

-- Azar Stronghammer
INSERT INTO `gossip_menu` VALUES (4677, 3974, 106);
INSERT INTO `gossip_menu` VALUES (4677, 3975, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4677, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4677, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
UPDATE `creature_template` SET `gossip_menu_id`=4677 WHERE `entry`=1232;

-- Kragg
INSERT INTO `gossip_menu` VALUES (4657, 5002, 0);
INSERT INTO `gossip_menu` VALUES (4657, 5001, 96);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4657, 0, 3, 'I seek training in the ways of the Hunter.', 7643, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4657, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 135);
UPDATE `creature_template` SET `gossip_menu_id`=4657 WHERE `entry`=1404;

-- Kelstrum Stonebreaker
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 1215, 98);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 5724, 99);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8254, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4569, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4569, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4569, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4569, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4569, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4569 WHERE `entry`=1901;

-- Maximillion
INSERT INTO `gossip_menu` VALUES (4655, 5720, 236);
INSERT INTO `gossip_menu` VALUES (4655, 5719, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4655, 0, 3, 'I submit myself for further training my master.', 8298, 5, 16, 0, 0, 0, 0, 0, '', 0, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4655, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4655 WHERE `entry`=2126;

-- Rupert Boch
INSERT INTO `gossip_menu` VALUES (4656, 5720, 236);
INSERT INTO `gossip_menu` VALUES (4656, 5719, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4656, 0, 3, 'I submit myself for further training my master.', 8298, 5, 16, 0, 0, 0, 0, 0, '', 0, 67);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4656, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 139);
UPDATE `creature_template` SET `gossip_menu_id`=4656 WHERE `entry`=2127;

-- Austil de Mon
INSERT INTO `gossip_menu` VALUES (656, 4984, 99);
INSERT INTO `gossip_menu` VALUES (656, 1219, 98);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (656, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 98);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (656, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
UPDATE `creature_template` SET `gossip_menu_id`=656 WHERE `entry`=2131;

-- First Aid Trainers
DELETE FROM `gossip_menu` WHERE `entry`=5856;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5856, 7024, 66);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5856, 7025, 65);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5856, 7028, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5856;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5856, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
DELETE FROM `gossip_menu` WHERE `entry`=5855;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5855, 7026, 66);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5855, 7027, 65);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5855, 7028, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5855;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5855, 0, 3, 'I require training', 6503, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu` VALUES (657, 7026, 66);
INSERT INTO `gossip_menu` VALUES (657, 7027, 65);
INSERT INTO `gossip_menu` VALUES (657, 1220, 396);
INSERT INTO `gossip_menu` VALUES (657, 1221, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (657, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5855 WHERE `entry`=2326;
UPDATE `creature_template` SET `gossip_menu_id`=657 WHERE `entry`=2327;
UPDATE `creature_template` SET `gossip_menu_id`=5855 WHERE `entry`=2329;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=2798;
UPDATE `creature_template` SET `gossip_menu_id`=5855 WHERE `entry`=3181;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=3373;
UPDATE `creature_template` SET `gossip_menu_id`=5855 WHERE `entry`=4211;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=4591;
UPDATE `creature_template` SET `gossip_menu_id`=4762 WHERE `entry`=5150;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5759;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5939;
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5943;
UPDATE `creature_template` SET `gossip_menu_id`=5855 WHERE `entry`=6094;

-- Lexington Mortaim
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 5885, 91);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 5886, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8255, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4827, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4827, 0, 3, 'Please teach me.', 8442, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4827, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4827, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4827 WHERE `entry`=2492;

-- Gyll
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4306, 0, 2, 'Sure! Let\'s go for a ride.', 8105, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4306 WHERE `entry`=2859;

-- Lanie Reed
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5967, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5967 WHERE `entry`=2941;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
