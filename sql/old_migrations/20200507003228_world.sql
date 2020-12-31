DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200507003228');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200507003228');
-- Add your query below.


-- Marshal McBride
UPDATE `creature_template` SET `gossip_menu_id`=4048 WHERE `entry` = 197;

-- Master Mathias Shaw
INSERT INTO `gossip_menu` VALUES (4941, 5994, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4941 WHERE `entry` = 332;

-- Dungar Longdrink
UPDATE `creature_template` SET `gossip_menu_id`=704 WHERE `entry` = 352;

-- Smith Argus
UPDATE `creature_template` SET `gossip_menu_id`=2744 WHERE `entry` = 514;

-- Thor
UPDATE `creature_template` SET `gossip_menu_id`=4106 WHERE `entry` = 523;

-- Barnil Stonepot
UPDATE `creature_template` SET `gossip_menu_id`=5483 WHERE `entry` = 716;

-- Private Thorsen
INSERT INTO `gossip_menu` VALUES (4086, 4982, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4086 WHERE `entry` = 738;

-- Durnan Furcutter
INSERT INTO `gossip_menu` VALUES (1262, 1914, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1262, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1262 WHERE `entry` = 836;

-- Deputy Rainer
UPDATE `creature_template` SET `gossip_menu_id`=1631 WHERE `entry` = 963;

-- Vyrin Swiftwind
INSERT INTO `gossip_menu` VALUES (2831, 3523, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2831 WHERE `entry` = 1156;

-- Herbalist Pomeroy
-- INSERT INTO `gossip_menu` VALUES (7691, 9385, 0);
-- INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7691, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `npc_flags`=16 WHERE `entry` = 1218;

-- Tognus Flintfire
INSERT INTO `gossip_menu` VALUES (2741, 3396, 4);
INSERT INTO `gossip_menu` VALUES (2741, 3395, 0);
INSERT INTO `gossip_menu` VALUES (2741, 3397, 366);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2741, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2741 WHERE `entry` = 1241;

-- Hegnar Rumbleshot
INSERT INTO `gossip_menu` VALUES (4090, 4990, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4090, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4090 WHERE `entry` = 1243;

-- Mountaineer Kadrell
INSERT INTO `gossip_menu` VALUES (1632, 2288, 0);
INSERT INTO `gossip_menu` VALUES (1632, 2289, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1632 WHERE `entry` = 1340;

-- Cook Ghilm
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1355;

-- Mudduk
INSERT INTO `gossip_menu` VALUES (4747, 7021, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (86, 7, 185, 1, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7015, 86);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (87, 7, 185, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7019, 87);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (127, 7, 185, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4747, 7017, 127);
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 1382;

-- Brawn
INSERT INTO `gossip_menu` VALUES (4208, 5348, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (377, 7, 165, 50, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4208, 5345, 377);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (378, 7, 165, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4208, 5346, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4208 WHERE `entry` = 1385;

-- Rogvar
INSERT INTO `gossip_menu` VALUES (4134, 5108, 0);
INSERT INTO `gossip_menu` VALUES (4134, 5111, 25);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (363, 7, 171, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4134, 5110, 363);
UPDATE `creature_template` SET `gossip_menu_id`=4134 WHERE `entry` = 1386;

-- Tomas
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1430;

-- Telurinon Moonshadow
UPDATE `creature_template` SET `npc_flags`=16 WHERE `entry` = 1458;

-- Ghak Healtouch
INSERT INTO `gossip_menu` VALUES (4115, 5028, 0);
INSERT INTO `gossip_menu` VALUES (4115, 5029, 25);
INSERT INTO `gossip_menu` VALUES (4115, 5030, 361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4115, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4115 WHERE `entry` = 1470;

-- Shadow Priest Sarvis
UPDATE `creature_template` SET `gossip_menu_id`=4044 WHERE `entry` = 1569;

-- Thorgrum Borrelson
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4358, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4358 WHERE `entry` = 1572;

-- Gryth Thurden
UPDATE `creature_template` SET `gossip_menu_id`=4360 WHERE `entry` = 1573;

-- Adele Fielder
INSERT INTO `gossip_menu` VALUES (4172, 5258, 377);
INSERT INTO `gossip_menu` VALUES (4172, 5259, 18);
INSERT INTO `gossip_menu` VALUES (4172, 5257, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4172 WHERE `entry` = 1632;

-- Lee Brown
INSERT INTO `gossip_menu` VALUES (4744, 6961, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (128, 7, 356, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4744, 6793, 128);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (129, 7, 356, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4744, 6960, 129);
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1651;

-- Finbus Geargrind
INSERT INTO `gossip_menu` VALUES (4145, 5142, 0);
INSERT INTO `gossip_menu` VALUES (4145, 5145, 44);
INSERT INTO `gossip_menu` VALUES (4145, 5146, 391);
INSERT INTO `gossip_menu` VALUES (4145, 5143, 392);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4145, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4145 WHERE `entry` = 1676;

-- Matthew Hooper
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1680;

-- Brock Stoneseeker
INSERT INTO `gossip_menu` VALUES (4361, 5583, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4361, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4361 WHERE `entry` = 1681;

-- Warg Deepwater
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1683;

-- Loslor Rudge
INSERT INTO `gossip_menu` VALUES (3501, 4253, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3501, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3501 WHERE `entry` = 1694;

-- Gremlock Pilsnor
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 1699;

-- Paxton Ganter
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 1700;

-- Bronk Guzzlegear
UPDATE `creature_template` SET `gossip_menu_id`=4135 WHERE `entry` = 1702;

-- Conservator Ilthalaine
INSERT INTO `gossip_menu` VALUES (4046, 4936, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4046 WHERE `entry` = 2079;

-- Carolai Anise
INSERT INTO `gossip_menu` VALUES (4127, 5043, 0);
INSERT INTO `gossip_menu` VALUES (4127, 5044, 25);
INSERT INTO `gossip_menu` VALUES (4127, 5045, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4127 WHERE `entry` = 2132;

-- Karos Razok
UPDATE `creature_template` SET `gossip_menu_id`=4281 WHERE `entry` = 2226;

-- Tog'thar
INSERT INTO `gossip_menu` VALUES (264, 761, 0);
UPDATE `creature_template` SET `gossip_menu_id`=264 WHERE `entry` = 2238;

-- Donald Rabonne
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 2367;

-- Serge Hinott
INSERT INTO `gossip_menu` VALUES (4130, 5084, 0);
INSERT INTO `gossip_menu` VALUES (4130, 5087, 25);
INSERT INTO `gossip_menu` VALUES (4130, 5088, 361);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (362, 7, 171, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4130, 5085, 362);
UPDATE `creature_template` SET `gossip_menu_id`=4130 WHERE `entry` = 2391;

-- Christoph Jeffcoat
INSERT INTO `gossip_menu` VALUES (5542, 6595, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5542, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5542 WHERE `entry` = 2393;

-- Daryl Stack
INSERT INTO `gossip_menu` VALUES (4356, 5575, 0);
INSERT INTO `gossip_menu` VALUES (4356, 5578, 14);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (374, 7, 197, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4356, 5577, 374);
UPDATE `creature_template` SET `gossip_menu_id`=4356 WHERE `entry` = 2399;

-- Olivia Burnside
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (699, 0, 6, 'I would like to check my deposit box.', 3398, 9, 256, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2455;

-- Newton Burnside
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2456;

-- John Burnside
UPDATE `creature_template` SET `gossip_menu_id`=699 WHERE `entry` = 2457;

-- Baron Revilgaz
UPDATE `creature_template` SET `gossip_menu_id`=6685 WHERE `entry` = 2496;

-- Grarnik Goodstitch
INSERT INTO `gossip_menu` VALUES (4347, 5530, 0);
INSERT INTO `gossip_menu` VALUES (4347, 5533, 14);
INSERT INTO `gossip_menu` VALUES (4347, 5534, 372);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (373, 7, 197, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4347, 5531, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4347 WHERE `entry` = 2627;

-- Myizz Luckycatch
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 2834;

-- Brikk Keencraft
INSERT INTO `gossip_menu` VALUES (2784, 3488, 0);
INSERT INTO `gossip_menu` VALUES (2784, 3489, 4);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (368, 7, 164, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2784, 3490, 368);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2784, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2784 WHERE `entry` = 2836;

-- Jaxin Chong
UPDATE `creature_template` SET `gossip_menu_id`=4122 WHERE `entry` = 2837;

-- Grull Hawkwind
INSERT INTO `gossip_menu` VALUES (4045, 4935, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4045 WHERE `entry` = 2980;

-- Tal
UPDATE `creature_template` SET `gossip_menu_id`=4326 WHERE `entry` = 2995;

-- Pyall Silentstride
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 3067;

-- Chaw Stronghide
INSERT INTO `gossip_menu` VALUES (4185, 5285, 0);
INSERT INTO `gossip_menu` VALUES (4185, 5287, 18);
INSERT INTO `gossip_menu` VALUES (4185, 5286, 377);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4185, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4185 WHERE `entry` = 3069;

-- Crystal Boughman
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 3087;

-- Clarise Gnarltree
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2781, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2781 WHERE `entry` = 3136;

-- Gornek
UPDATE `creature_template` SET `gossip_menu_id`=2910 WHERE `entry` = 3143;

-- Dwukk
UPDATE `creature_template` SET `gossip_menu_id`=2746 WHERE `entry` = 3174;

-- Harold Riggs
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 3179;

-- Miao'zan
INSERT INTO `gossip_menu` VALUES (4129, 5034, 0);
INSERT INTO `gossip_menu` VALUES (4129, 5035, 25);
INSERT INTO `gossip_menu` VALUES (4129, 5036, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4129 WHERE `entry` = 3184;

-- Deek Fizzlebizz
INSERT INTO `gossip_menu` VALUES (4136, 5116, 391);
INSERT INTO `gossip_menu` VALUES (4136, 5117, 44);
INSERT INTO `gossip_menu` VALUES (4136, 5115, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4136 WHERE `entry` = 3290;

-- Doras
UPDATE `creature_template` SET `gossip_menu_id`=4342 WHERE `entry` = 3310;

-- Jorn Skyseer
INSERT INTO `gossip_menu` VALUES (1242, 1875, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1242 WHERE `entry` = 3387;

-- Thork
UPDATE `creature_template` SET `gossip_menu_id`=2883 WHERE `entry` = 3429;

-- Tatternack Steelforge
INSERT INTO `gossip_menu` VALUES (2942, 3654, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2942 WHERE `entry` = 3433;

-- Tonga Runetotem
UPDATE `creature_template` SET `gossip_menu_id`=4043 WHERE `entry` = 3448;

-- Traugh
UPDATE `creature_template` SET `gossip_menu_id`=2783 WHERE `entry` = 3478;

-- Jahan Hawkwing
UPDATE `creature_template` SET `gossip_menu_id`=4324 WHERE `entry` = 3483;

-- Zargh
UPDATE `creature_template` SET `gossip_menu_id`=4341 WHERE `entry` = 3489;

-- Tinkerwiz
INSERT INTO `gossip_menu` VALUES (4140, 5127, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5129, 44);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (394, -1, 391, 2, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5131, 394);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (395, -1, 391, 3, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4140, 5128, 395);
UPDATE `creature_template` SET `gossip_menu_id`=4140 WHERE `entry` = 3494;

-- Thomas Miller
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry` = 3518;

-- Bowen Brisboise
INSERT INTO `gossip_menu` VALUES (4267, 5431, 0);
INSERT INTO `gossip_menu` VALUES (4267, 5433, 14);
INSERT INTO `gossip_menu` VALUES (4267, 5432, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4267 WHERE `entry` = 3523;

-- Shelene Rhobart
INSERT INTO `gossip_menu` VALUES (4184, 5282, 0);
INSERT INTO `gossip_menu` VALUES (4184, 5284, 18);
INSERT INTO `gossip_menu` VALUES (4184, 5283, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4184 WHERE `entry` = 3549;

-- Guillaume Sorouy
INSERT INTO `gossip_menu` VALUES (2749, 3418, 0);
INSERT INTO `gossip_menu` VALUES (2749, 3419, 4);
INSERT INTO `gossip_menu` VALUES (2749, 3420, 366);
UPDATE `creature_template` SET `gossip_menu_id`=2749 WHERE `entry` = 3557;

-- Cyndra Kindwhisper
INSERT INTO `gossip_menu` VALUES (4112, 5019, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4112 WHERE `entry` = 3603;

-- Nadyia Maneweaver
UPDATE `creature_template` SET `gossip_menu_id`=4174 WHERE `entry` = 3605;

-- Alanna Raveneye
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (380, 7, 333, 50, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4156, 5191, 380);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (203, 7, 333, 1, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4156, 5192, 203);
INSERT INTO `gossip_menu` VALUES (4156, 5190, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4156 WHERE `entry` = 3606;

-- Devrak
UPDATE `creature_template` SET `gossip_menu_id`=4323 WHERE `entry` = 3615;

-- Krulmoo Fullmoon
INSERT INTO `gossip_menu` VALUES (4206, 5335, 0);
INSERT INTO `gossip_menu` VALUES (4206, 5338, 18);
INSERT INTO `gossip_menu` VALUES (4206, 5339, 377);
INSERT INTO `gossip_menu` VALUES (4206, 5336, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4206 WHERE `entry` = 3703;

-- Mahani
INSERT INTO `gossip_menu` VALUES (4350, 5545, 0);
INSERT INTO `gossip_menu` VALUES (4350, 5549, 372);
INSERT INTO `gossip_menu` VALUES (4350, 5546, 373);
UPDATE `creature_template` SET `gossip_menu_id`=4350 WHERE `entry` = 3704;

-- Vesprystus
UPDATE `creature_template` SET `gossip_menu_id`=4302 WHERE `entry` = 3838;

-- Sentinel Velene Starstrike
INSERT INTO `gossip_menu` VALUES (2561, 3233, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2561 WHERE `entry` = 3885;

-- Kylanna
INSERT INTO `gossip_menu` VALUES (4117, 5059, 0);
INSERT INTO `gossip_menu` VALUES (4117, 5051, 25);
INSERT INTO `gossip_menu` VALUES (4117, 5060, 361);
INSERT INTO `gossip_menu` VALUES (4117, 5063, 362);
UPDATE `creature_template` SET `gossip_menu_id`=4117 WHERE `entry` = 3964;

-- Aayndia Floralwind
INSERT INTO `gossip_menu` VALUES (4213, 5360, 0);
INSERT INTO `gossip_menu` VALUES (4213, 5363, 18);
INSERT INTO `gossip_menu` VALUES (4213, 5364, 377);
INSERT INTO `gossip_menu` VALUES (4213, 5361, 378);
UPDATE `creature_template` SET `gossip_menu_id`=4213 WHERE `entry` = 3967;

-- Idriana
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2404, 0, 6, 'I would like to check my deposit box.', 3398, 9, 256, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2404 WHERE `entry` = 4155;

-- Bengus Deepforge
INSERT INTO `gossip_menu` VALUES (2762, 1261, 0);
INSERT INTO `gossip_menu` VALUES (2762, 3482, 4);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (367, 7, 164, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2762, 1262, 367);
INSERT INTO `gossip_menu` VALUES (2762, 3484, 368);
UPDATE `creature_template` SET `gossip_menu_id`=2762 WHERE `entry` = 4258;

-- Goblin Pit Crewman
INSERT INTO `gossip_menu` VALUES (50142, 778, 0);
UPDATE `creature_template` SET `gossip_menu_id`=50142 WHERE `entry` = 4429;

-- Gnome Pit Crewman
INSERT INTO `gossip_menu` VALUES (50143, 780, 0);
UPDATE `creature_template` SET `gossip_menu_id`=50143 WHERE `entry` = 4430;

-- Michael Garrett
UPDATE `creature_template` SET `gossip_menu_id`=4307 WHERE `entry` = 4551;

-- Wharfmaster Lozgil
INSERT INTO `gossip_menu` VALUES (4701, 5753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4701 WHERE `entry` = 4631;

-- Sentry Point Captain
-- INSERT INTO `gossip_menu` VALUES (8793, 11264, 0);
UPDATE `creature_template` SET `npc_flags`=0 WHERE `entry` = 5086;

-- Krinkle Goodsteel
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2242, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2242 WHERE `entry` = 5411;

-- Alchemist Pestlezugg
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (900, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=900 WHERE `entry` = 5594;

-- Clyde Kellen
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5690;

-- Vance Undergloom
INSERT INTO `gossip_menu` VALUES (4167, 5233, 0);
INSERT INTO `gossip_menu` VALUES (4167, 5319, 203);
INSERT INTO `gossip_menu` VALUES (4167, 5318, 380);
UPDATE `creature_template` SET `gossip_menu_id`=4167 WHERE `entry` = 5695;

-- Waldor
INSERT INTO `gossip_menu` VALUES (4186, 5288, 0);
INSERT INTO `gossip_menu` VALUES (4186, 5289, 377);
UPDATE `creature_template` SET `gossip_menu_id`=4186 WHERE `entry` = 5784;

-- Islen Waterseer
INSERT INTO `gossip_menu` VALUES (1281, 1916, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1281 WHERE `entry` = 5901;

-- Uthan Stillwater
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5938;

-- Lau'Tiki
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 5941;

-- Strahad Farsan
INSERT INTO `gossip_menu` VALUES (2385, 2193, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2385 WHERE `entry` = 6251;

-- Acolyte Magaz
INSERT INTO `gossip_menu` VALUES (2912, 3591, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2912 WHERE `entry` = 6252;

-- Acolyte Wytula
INSERT INTO `gossip_menu` VALUES (2913, 3592, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2913 WHERE `entry` = 6254;

-- Menara Voidrender
INSERT INTO `gossip_menu` VALUES (2603, 3298, 0);
INSERT INTO `gossip_menu` VALUES (2603, 3299, 0);
INSERT INTO `gossip_menu` VALUES (2603, 3594, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2603 WHERE `entry` = 6266;

-- Zarrin
UPDATE `creature_template` SET `gossip_menu_id`=5853 WHERE `entry` = 6286;

-- Spirit Healer
UPDATE `creature_template` SET `gossip_menu_id`=83 WHERE `entry` = 6491;

-- Vizzklick
INSERT INTO `gossip_menu` VALUES (1301, 1933, 0);
INSERT INTO `gossip_menu` VALUES (1301, 1934, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1301, 0, 1, 'I wish to browse your wares.', 4424, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1301 WHERE `entry` = 6568;

-- Rokar Bladeshadow
INSERT INTO `gossip_menu` VALUES (181, 678, 0);
UPDATE `creature_template` SET `gossip_menu_id`=181 WHERE `entry` = 6586;

-- Ravenholdt Guard
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1008, 5, 349, 5, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`, `BroadCastTextID2`, `Probability2`, `BroadCastTextID3`, `Probability3`, `BroadCastTextID4`, `Probability4`) VALUES (5935, 8484, 1, 8485, 1, 8486, 1, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5935, 1008);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1005, 30, 349, 4, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1006, 5, 349, 4, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1007, -1, 1005, 1006, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5934, 1007);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1002, 30, 349, 3, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1003, 5, 349, 3, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1004, -1, 1002, 1003, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4861, 5933, 1004);
UPDATE `creature_template` SET `gossip_menu_id`=4861 WHERE `entry` = 6766;

-- Ravenholdt Assassin
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`, `BroadCastTextID2`, `Probability2`, `BroadCastTextID3`, `Probability3`, `BroadCastTextID4`, `Probability4`) VALUES (5940, 8497, 1, 8498, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4862, 5940, 1008);
INSERT INTO `gossip_menu` VALUES (4862, 5939, 1007);
INSERT INTO `gossip_menu` VALUES (4862, 5938, 1004);
UPDATE `creature_template` SET `gossip_menu_id`=4862 WHERE `entry` = 6771;

-- Talvash del Kissel
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (507, -1, 440, 449, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8254, 507);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (505, 1, 26898, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (508, -1, 440, 505, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8283, 508);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (520, -1, 440, 445, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8289, 520);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (518, -1, 440, 450, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8296, 518);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (514, 23, 21815, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (524, -1, 440, 514, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (12855, 8291, 524);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12855, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 440);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (515, -1, 449, 441, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (513, 23, 21815, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (521, -1, 440, 467, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (522, -1, 513, 521, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (523, -1, 515, 522, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (12855, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, 0, 0, 1285501, 0, 0, '', 0, 523);
DELETE FROM `gossip_scripts` WHERE `id`=1285501;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1285501, 0, 15, 27550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Talvash del Kissel - Cast Spell Valentine');
UPDATE `creature_template` SET `gossip_menu_id`=12855 WHERE `entry` = 6826;

-- Doc Mixilpixil
INSERT INTO `gossip_menu` VALUES (5763, 6948, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5763 WHERE `entry` = 7207;

-- Kum'isha the Collector
INSERT INTO `gossip_menu` VALUES (752, 1302, 0);
UPDATE `creature_template` SET `gossip_menu_id`=752 WHERE `entry` = 7363;

-- Bloodmage Drazial
INSERT INTO `gossip_menu` VALUES (800, 1351, 0);
UPDATE `creature_template` SET `gossip_menu_id`=800 WHERE `entry` = 7505;

-- Bloodmage Lynnore
INSERT INTO `gossip_menu` VALUES (820, 1371, 0);
UPDATE `creature_template` SET `gossip_menu_id`=820 WHERE `entry` = 7506;

-- Curgle Cranklehop
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (942, 0, 0, 'Please tell me more about the hippogryphs.', 3814, 1, 1, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (942, 1, 0, 'Please tell me more about the Gordunni ogres.', 3923, 1, 1, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=942 WHERE `entry` = 7763;

-- Marvon Rivetseeker
UPDATE `creature_template` SET `gossip_menu_id`=1404 WHERE `entry` = 7771;

-- Talo Thornhoof
INSERT INTO `gossip_menu` VALUES (2851, 3545, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2851 WHERE `entry` = 7776;

-- Trenton Lighthammer
INSERT INTO `gossip_menu` VALUES (1143, 1759, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1142, 0, 0, 'Tell me more, Trenton.', 4183, 1, 1, 1143, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1142 WHERE `entry` = 7804;

-- Pratt McGrubben
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1965, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1965 WHERE `entry` = 7852;

-- Jangdor Swiftstrider
INSERT INTO `npc_text` (`ID`, `BroadCastTextID0`, `Probability0`) VALUES (2368, 4957, 1);
INSERT INTO `gossip_menu` VALUES (1964, 2368, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1964, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1964 WHERE `entry` = 7854;

-- Hadoken Swiftstrider
INSERT INTO `gossip_menu` VALUES (6228, 7402, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6228 WHERE `entry` = 7875;

-- Erelas Ambersky
UPDATE `creature_template` SET `gossip_menu_id`=1482 WHERE `entry` = 7916;

-- Brannock
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 7946;

-- Kylanna Windwhisper
INSERT INTO `gossip_menu` VALUES (4125, 5104, 0);
INSERT INTO `gossip_menu` VALUES (4125, 5105, 25);
INSERT INTO `gossip_menu` VALUES (4125, 5106, 363);
UPDATE `creature_template` SET `gossip_menu_id`=4125 WHERE `entry` = 7948;

-- Xylinnia Starshine
INSERT INTO `gossip_menu` VALUES (4164, 5218, 0);
INSERT INTO `gossip_menu` VALUES (4164, 5220, 380);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (381, 7, 333, 125, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4164, 5219, 381);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4164, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4164 WHERE `entry` = 7949;

-- Dirge Quikcleave
UPDATE `creature_template` SET `gossip_menu_id`=4746 WHERE `entry` = 8125;

-- Nixx Sprocketspring
INSERT INTO `gossip_menu` VALUES (1469, 2138, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1469, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1469 WHERE `entry` = 8126;

-- Narv Hidecrafter
INSERT INTO `gossip_menu` VALUES (4842, 5335, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4842, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4842 WHERE `entry` = 8153;

-- Duhng
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry` = 8306;

-- Nyrill
INSERT INTO `gossip_menu` VALUES (1362, 1994, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1362 WHERE `entry` = 8399;

-- Raze
INSERT INTO `gossip_menu` VALUES (2306, 3001, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2306 WHERE `entry` = 8441;

-- Squire Maltrake
INSERT INTO `gossip_menu` VALUES (1625, 2279, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1625 WHERE `entry` = 8509;

-- Ag'tor Bloodfist
INSERT INTO `gossip_menu` VALUES (1401, 2033, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1401 WHERE `entry` = 8576;

-- Buzzek Bracketswing
INSERT INTO `gossip_menu` VALUES (4152, 5177, 0);
INSERT INTO `gossip_menu` VALUES (4152, 5180, 44);
INSERT INTO `gossip_menu` VALUES (4152, 5179, 393);
UPDATE `creature_template` SET `gossip_menu_id`=4152 WHERE `entry` = 8736;

-- Vazario Linkgrease
INSERT INTO `gossip_menu` VALUES (1465, 2133, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1465, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1465 WHERE `entry` = 8738;

-- Franclorn Forgewright
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (205, 9, 3801, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (1664, 2316, 0);
INSERT INTO `gossip_menu` VALUES (1665, 2317, 0);
INSERT INTO `gossip_menu` VALUES (1666, 2318, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1665, 0, 0, 'Fascinating. Please, tell me more.', 4652, 1, 1, 1666, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1664, 0, 0, 'Continue please.', 4432, 1, 1, 1665, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1663, 0, 0, 'Amazing! I\'ve never spoken to a ghost. I wish to learn!', 4648, 1, 1, 1664, 0, 0, 0, 0, '', 0, 205);
UPDATE `creature_template` SET `gossip_menu_id`=1663 WHERE `entry` = 8888;

-- Hate'rel
INSERT INTO `gossip_menu` VALUES (1941, 2595, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1941 WHERE `entry` = 9034;

-- Anger'rel
INSERT INTO `gossip_menu` VALUES (1943, 2596, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1943 WHERE `entry` = 9035;

-- Vile'rel
INSERT INTO `gossip_menu` VALUES (1944, 2597, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1944 WHERE `entry` = 9036;

-- Seeth'rel
INSERT INTO `gossip_menu` VALUES (1946, 2600, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1946 WHERE `entry` = 9038;

-- Dope'rel
INSERT INTO `gossip_menu` VALUES (1948, 2602, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1948 WHERE `entry` = 9040;

-- Jenal
INSERT INTO `gossip_menu` VALUES (1661, 2314, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1662, 0, 0, 'What are you doing out here?', 4644, 1, 1, 1661, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1662 WHERE `entry` = 9047;

-- Eridan Bluewind
INSERT INTO `gossip_menu` VALUES (3142, 3874, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (130, 9, 4261, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (146, 23, 11445, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (148, -1, 130, 146, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3142, 0, 0, 'I lost the Flute of the Ancients and require a replacement, Eridan.', 0, 1, 1, -1, 0, 0, 0, 0, '', 0, 148);
UPDATE `creature_template` SET `gossip_menu_id`=3142 WHERE `entry` = 9116;

-- Larion
INSERT INTO `gossip_menu` VALUES (5630, 6741, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5630 WHERE `entry` = 9118;

-- Williden Marshal
UPDATE `creature_template` SET `gossip_menu_id`=2424 WHERE `entry` = 9270;

-- Hol'anyee Marshal
UPDATE `creature_template` SET `gossip_menu_id`=2423 WHERE `entry` = 9271;

-- Petra Grossen
INSERT INTO `gossip_menu` VALUES (56003, 3093, 0);
INSERT INTO `gossip_menu` VALUES (56004, 3793, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (56003, 0, 0, 'What does Dadanga like to eat?', 0, 1, 1, 56004, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=56003 WHERE `entry` = 9273;

-- Donova Snowden
UPDATE `creature_template` SET `gossip_menu_id`=3802 WHERE `entry` = 9298;

-- Miblon Snarltooth
UPDATE `creature_template` SET `gossip_menu_id`=1844 WHERE `entry` = 9467;

-- Yuka Screwspigot
INSERT INTO `gossip_menu` VALUES (5541, 6594, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5541, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5541 WHERE `entry` = 9544;

-- Grim Patron
INSERT INTO `gossip_menu` VALUES (1962, 2636, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1962 WHERE `entry` = 9545;

-- Guzzling Patron
UPDATE `creature_template` SET `gossip_menu_id`=1963 WHERE `entry` = 9547;

-- Hammered Patron
INSERT INTO `gossip_menu` VALUES (1966, 2758, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1966 WHERE `entry` = 9554;

-- Grimble
INSERT INTO `gossip_menu` VALUES (1967, 2640, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1967 WHERE `entry` = 9558;

-- Grizzlowe
INSERT INTO `gossip_menu` VALUES (1968, 2641, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1968 WHERE `entry` = 9559;

-- Karna Remtravel
UPDATE `creature_template` SET `gossip_menu_id`=2081 WHERE `entry` = 9618;

-- Tink Sprocketwhistle
INSERT INTO `gossip_menu` VALUES (2464, 3156, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2464, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2464 WHERE `entry` = 9676;

-- Lanti'gah
INSERT INTO `gossip_menu` VALUES (2362, 3048, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2362 WHERE `entry` = 9990;

-- Spraggle Frock
UPDATE `creature_template` SET `gossip_menu_id`=2852 WHERE `entry` = 9997;

-- Ribbly's Crony
UPDATE `creature_template` SET `gossip_menu_id`=1966 WHERE `entry` = 10043;

-- Gwennyth Bly'Leggonde
INSERT INTO `gossip_menu` VALUES (4863, 5943, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4863 WHERE `entry` = 10219;

-- Tinkee Steamboil
INSERT INTO `gossip_menu` VALUES (2602, 3296, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2602 WHERE `entry` = 10267;

-- Jaron Stoneshaper
UPDATE `creature_template` SET `gossip_menu_id`=3761 WHERE `entry` = 10301;

-- Umi Rumplesnicker
UPDATE `creature_template` SET `gossip_menu_id`=6837 WHERE `entry` = 10305;

-- Gregor Greystone
UPDATE `creature_template` SET `gossip_menu_id`=3985 WHERE `entry` = 10431;

-- Malyfous Darkhammer
UPDATE `creature_template` SET `gossip_menu_id`=2984 WHERE `entry` = 10637;

-- High Executor Derrington
INSERT INTO `gossip_menu` VALUES (3041, 3753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3041 WHERE `entry` = 10837;

-- Commander Ashlam Valorfist
UPDATE `creature_template` SET `gossip_menu_id`=3042 WHERE `entry` = 10838;

-- Argent Quartermaster Hasana
UPDATE `creature_template` SET `gossip_menu_id`=3421 WHERE `entry` = 10856;

-- Herald Moonstalker
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10878;

-- Warcaller Gorlach
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10880;

-- Bluff Runner Windstrider
UPDATE `creature_template` SET `gossip_menu_id`=5782 WHERE `entry` = 10881;

-- Greta Mosshoof
INSERT INTO `gossip_menu` VALUES (3074, 3807, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3074 WHERE `entry` = 10922;

-- Twizwick Sprocketgrind
INSERT INTO `gossip_menu` VALUES (4141, 5130, 0);
INSERT INTO `gossip_menu` VALUES (4141, 5129, 44);
INSERT INTO `gossip_menu` VALUES (4141, 5131, 394);
INSERT INTO `gossip_menu` VALUES (4141, 5128, 395);
UPDATE `creature_template` SET `gossip_menu_id`=4141 WHERE `entry` = 10993;

-- Jessir Moonbow
INSERT INTO `gossip_menu` VALUES (3128, 3864, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3128 WHERE `entry` = 11019;

-- Mukdrak
UPDATE `creature_template` SET `gossip_menu_id`=4142 WHERE `entry` = 11025;

-- Smokey LaRue
UPDATE `creature_template` SET `gossip_menu_id`=7109 WHERE `entry` = 11033;

-- Caretaker Alen
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3181, 0, 1, 'I wish to make a purchase.', 6465, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3181 WHERE `entry` = 11038;

-- Watcher Brownell
INSERT INTO `gossip_menu` VALUES (3133, 3868, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3133 WHERE `entry` = 11040;

-- Carlin Redpath
UPDATE `creature_template` SET `gossip_menu_id`=3864 WHERE `entry` = 11063;

-- Kitta Firewind
INSERT INTO `gossip_menu` VALUES (4169, 5243, 0);
INSERT INTO `gossip_menu` VALUES (4169, 5246, 203);
INSERT INTO `gossip_menu` VALUES (4169, 5247, 381);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (382, 7, 333, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4169, 5244, 382);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4169, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4169 WHERE `entry` = 11072;

-- Hgarth
INSERT INTO `gossip_menu` VALUES (4170, 5248, 0);
INSERT INTO `gossip_menu` VALUES (4170, 5251, 203);
INSERT INTO `gossip_menu` VALUES (4170, 5252, 381);
INSERT INTO `gossip_menu` VALUES (4170, 5249, 382);
UPDATE `creature_template` SET `gossip_menu_id`=4170 WHERE `entry` = 11074;

-- Drakk Stonehand
INSERT INTO `gossip_menu` VALUES (4243, 5403, 0);
INSERT INTO `gossip_menu` VALUES (4243, 5406, 18);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (379, 7, 165, 200, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4243, 5405, 379);
UPDATE `creature_template` SET `gossip_menu_id`=4243 WHERE `entry` = 11097;

-- Hahrana Ironhide
INSERT INTO `gossip_menu` VALUES (4244, 5407, 0);
INSERT INTO `gossip_menu` VALUES (4244, 5410, 18);
INSERT INTO `gossip_menu` VALUES (4244, 5408, 379);
UPDATE `creature_template` SET `gossip_menu_id`=4244 WHERE `entry` = 11098;

-- Jinar'Zillen
INSERT INTO `gossip_menu` VALUES (4025, 4891, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4025 WHERE `entry` = 11317;

-- Var'jun
INSERT INTO `gossip_menu` VALUES (3646, 4443, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3646 WHERE `entry` = 11407;

-- Quartermaster Miranda Breechlock
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 0, 0, 'I need another Argent Dawn Commission.', 6878, 1, 1, -1, 0, 3421, 0, 0, '', 0, 478);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 1, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7208, 8498, 0);
INSERT INTO `gossip_menu` VALUES (7213, 8503, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 0, 0, 'Friendly', 12237, 1, 1, 7213, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7209, 8499, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 1, 0, 'Honored', 12238, 1, 1, 7209, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7210, 8500, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 2, 0, 'Revered', 12239, 1, 1, 7210, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7212, 8502, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7208, 3, 0, 'Exalted', 12240, 1, 1, 7212, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3461, 2, 0, 'Miranda, could you please tell me the insignia cost of items that you are offering for adventurers with other reputations?', 12226, 1, 1, 7208, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3461 WHERE `entry` = 11536;

-- Loh'atu
INSERT INTO `gossip_menu` VALUES (3481, 4233, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (674, 8, 5535, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (675, 8, 5536, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (676, -1, 674, 675, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (3481, 4953, 676);
INSERT INTO `gossip_menu` VALUES (4061, 4954, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 0, 0, 'The land of Azshara.', 7591, 1, 1, 4061, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4062, 4955, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 1, 0, 'The Ruins of Eldarath.', 7593, 1, 1, 4062, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4063, 4956, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 2, 0, 'The mage tower to the north.', 7594, 1, 1, 4063, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4064, 4957, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 3, 0, 'The Timbermaw furbolgs.', 7600, 1, 1, 4064, 0, 0, 0, 0, '', 0, 676);
INSERT INTO `gossip_menu` VALUES (4065, 4958, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3481, 4, 0, 'The presence of blue dragons.', 7601, 1, 1, 4065, 0, 0, 0, 0, '', 0, 676);
UPDATE `creature_template` SET `gossip_menu_id`=3481 WHERE `entry` = 11548;

-- Meilosh
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3626, 0, 3, 'I\'d like to train.', 7149, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3626, 1, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3626 WHERE `entry` = 11557;

-- Kernda
UPDATE `creature_template` SET `gossip_menu_id`=6801 WHERE `entry` = 11558;

-- Bardu Sharpeye
INSERT INTO `gossip_menu` VALUES (3601, 4353, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3601 WHERE `entry` = 11608;

-- Alexia Ironknife
INSERT INTO `gossip_menu` VALUES (3602, 4354, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3602 WHERE `entry` = 11609;

-- Kirsta Deepshadow
UPDATE `creature_template` SET `gossip_menu_id`=3603 WHERE `entry` = 11610;

-- Mickey Levine
INSERT INTO `gossip_menu` VALUES (3604, 4356, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3604 WHERE `entry` = 11615;

-- Nathaniel Dumah
UPDATE `creature_template` SET `gossip_menu_id`=3821 WHERE `entry` = 11616;

-- Ganoosh
UPDATE `creature_template` SET `npc_flags`=2 WHERE `entry` = 11750;

-- Tajarri
INSERT INTO `gossip_menu` VALUES (4084, 4977, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4084 WHERE `entry` = 11799;

-- Rabine Saturna
UPDATE `creature_template` SET `gossip_menu_id`=5102 WHERE `entry` = 11801;

-- Dendrite Starblaze
INSERT INTO `gossip_menu` VALUES (3901, 4753, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3901 WHERE `entry` = 11802;

-- Nathanos Blightcaller
INSERT INTO `gossip_menu` VALUES (3962, 4814, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3962 WHERE `entry` = 11878;

-- Umber
INSERT INTO `gossip_menu` VALUES (5101, 6153, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5101 WHERE `entry` = 11939;

-- Mai'Lahii
INSERT INTO `gossip_menu` VALUES (4066, 4959, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4066, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4066 WHERE `entry` = 12031;

-- Lui'Mala
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 12032;

-- Drulzegar Skraghook
INSERT INTO `gossip_menu` VALUES (4162, 5212, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4162 WHERE `entry` = 12340;

-- Adam Lind
UPDATE `creature_template` SET `gossip_menu_id`=4343 WHERE `entry` = 12658;

-- Pixel
INSERT INTO `gossip_menu` VALUES (5161, 6193, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5161 WHERE `entry` = 12724;

-- Je'neu Sancrea
INSERT INTO `gossip_menu` VALUES (4442, 5654, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4442 WHERE `entry` = 12736;

-- Mastok Wrilehiss
INSERT INTO `gossip_menu` VALUES (4441, 5653, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4441 WHERE `entry` = 12737;

-- Karang Amakkar
INSERT INTO `gossip_menu` VALUES (4401, 5613, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4401 WHERE `entry` = 12757;

-- Warsong Runner
INSERT INTO `gossip_menu` VALUES (4981, 6033, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4981 WHERE `entry` = 12863;

-- Myriam Moonsinger
INSERT INTO `gossip_menu` VALUES (4601, 5713, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4601 WHERE `entry` = 12866;

-- Kil'Hiwana
UPDATE `creature_template` SET `gossip_menu_id`=4744 WHERE `entry` = 12961;

-- Monty
INSERT INTO `gossip_menu` VALUES (4841, 5894, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4841 WHERE `entry` = 12997;

-- Myrokos Silentform
INSERT INTO `gossip_menu` VALUES (4922, 5981, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4922 WHERE `entry` = 13085;

-- Layo Starstrike
UPDATE `creature_template` SET `gossip_menu_id`=5103 WHERE `entry` = 13220;

-- Hydraxian Honor Guard
INSERT INTO `gossip_menu` VALUES (5109, 6161, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5109 WHERE `entry` = 13322;

-- Great-father Winter
INSERT INTO `gossip_menu` VALUES (5232, 6250, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5232 WHERE `entry` = 13445;

-- Cavindra
INSERT INTO `gossip_menu` VALUES (5521, 6574, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5521 WHERE `entry` = 13697;

-- Keeper Marandis
INSERT INTO `gossip_menu` VALUES (5302, 6334, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5302 WHERE `entry` = 13698;

-- Selendra
INSERT INTO `gossip_menu` VALUES (5303, 6335, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5303 WHERE `entry` = 13699;

-- Centaur Pariah
INSERT INTO `gossip_menu` VALUES (5321, 6353, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5321 WHERE `entry` = 13717;

-- Corporal Teeka Bloodsnarl
INSERT INTO `gossip_menu` VALUES (6261, 7434, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6261 WHERE `entry` = 13776;

-- Scholar Runethorn
UPDATE `creature_template` SET `gossip_menu_id`=5741 WHERE `entry` = 14374;

-- Overlord Runthak
INSERT INTO `gossip_menu` VALUES (5752, 6935, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5752 WHERE `entry` = 14392;

-- Daio the Decrepit
INSERT INTO `gossip_menu` VALUES (5824, 6995, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5824 WHERE `entry` = 14463;

-- Short John Mithril
INSERT INTO `gossip_menu` VALUES (5921, 7074, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5921 WHERE `entry` = 14508;

-- Master Smith Burninate
INSERT INTO `gossip_menu` VALUES (5962, 7115, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (228, 5, 59, 5, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5962, 7121, 228);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5962, 0, 1, 'I wish to browse your wares.', 4424, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5962 WHERE `entry` = 14624;

-- Taskmaster Scrange
INSERT INTO `gossip_menu` VALUES (5966, 7120, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5966 WHERE `entry` = 14626;

-- Hansel Heavyhands
INSERT INTO `gossip_menu` VALUES (5963, 7117, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5963 WHERE `entry` = 14627;

-- Evonice Sootsmoker
INSERT INTO `gossip_menu` VALUES (5942, 7095, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5942 WHERE `entry` = 14628;

-- Lookout Captain Lolo Longstriker
INSERT INTO `gossip_menu` VALUES (5941, 7094, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5941 WHERE `entry` = 14634;

-- Smith Slagtree
INSERT INTO `gossip_menu` VALUES (6085, 7239, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6085, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6085 WHERE `entry` = 14737;

-- Otho Moji'ko
INSERT INTO `gossip_menu` VALUES (6083, 7237, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6083, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6083 WHERE `entry` = 14738;

-- Mystic Yayo'jin
INSERT INTO `gossip_menu` VALUES (6086, 7240, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6086, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6086 WHERE `entry` = 14739;

-- Huntsman Markhor
INSERT INTO `gossip_menu` VALUES (6088, 7242, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6088, 1, 0, 'I\'d like to stable my pet here', 0, 14, 8192, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6088 WHERE `entry` = 14741;

-- Captain Shatterskull
INSERT INTO `gossip_menu` VALUES (6524, 7726, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6524 WHERE `entry` = 14781;

-- Burth
INSERT INTO `gossip_menu` VALUES (6184, 7338, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6184 WHERE `entry` = 14827;

-- Gelvas Grimegate
INSERT INTO `gossip_menu` VALUES (6183, 7337, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6183 WHERE `entry` = 14828;

-- Yebb Neblegear
INSERT INTO `gossip_menu` VALUES (6161, 7314, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6161 WHERE `entry` = 14829;

-- Kerri Hicks
INSERT INTO `gossip_menu` VALUES (6223, 7394, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6223 WHERE `entry` = 14832;

-- Chronos
INSERT INTO `gossip_menu` VALUES (6224, 7395, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6224 WHERE `entry` = 14833;

-- Rinling
INSERT INTO `gossip_menu` VALUES (6225, 7397, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6225 WHERE `entry` = 14841;

-- Kruban Darkblade
INSERT INTO `gossip_menu` VALUES (6214, 7366, 0);
INSERT INTO `gossip_menu` VALUES (6221, 7376, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6214, 0, 0, 'When the Darkmoon Faire arrives, where will it be located?', 10109, 1, 1, 6221, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6214 WHERE `entry` = 14843;

-- Flik's Frog
INSERT INTO `gossip_menu` VALUES (6232, 7406, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6232 WHERE `entry` = 14866;

-- Exzhal
UPDATE `creature_template` SET `gossip_menu_id`=6422 WHERE `entry` = 14910;

-- Rin'wosho the Trader
UPDATE `creature_template` SET `gossip_menu_id`=6381 WHERE `entry` = 14921;

-- Wagner Hammerstrike
INSERT INTO `gossip_menu` VALUES (6343, 7536, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6343, 0, 1, 'Let me browse your selection of fireworks.', 10429, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6343 WHERE `entry` = 15011;

-- Javnir Nashak
INSERT INTO `gossip_menu` VALUES (6342, 7535, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6342, 0, 1, 'Let me browse your selection of fireworks.', 10429, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6342 WHERE `entry` = 15012;

-- Deathmaster Dwire
INSERT INTO `gossip_menu` VALUES (6361, 7554, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6361 WHERE `entry` = 15021;

-- Zandalarian Emissary
UPDATE `creature_template` SET `gossip_menu_id`=6519 WHERE `entry` = 15076;

-- Jang
INSERT INTO `gossip_menu` VALUES (6514, 7696, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6514 WHERE `entry` = 15078;

-- Fishbot 5000
INSERT INTO `gossip_menu` VALUES (6447, 7641, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6447 WHERE `entry` = 15079;

-- Ralo'shan the Eternal Watcher
UPDATE `creature_template` SET `gossip_menu_id`=6588 WHERE `entry` = 15169;

-- Vargus
INSERT INTO `gossip_menu` VALUES (6527, 7729, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6527, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6527 WHERE `entry` = 15176;

-- Mishta
INSERT INTO `gossip_menu` VALUES (6528, 7730, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6528, 0, 1, 'Let me browse your goods.', 2823, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6528 WHERE `entry` = 15179;

-- Baristolth of the Shifting Sands
INSERT INTO `gossip_menu` VALUES (6529, 7731, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6529 WHERE `entry` = 15180;

-- Commander Mar'alith
INSERT INTO `gossip_menu` VALUES (6530, 7732, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6530 WHERE `entry` = 15181;

-- Vish Kozus
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1020, 9, 8283, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (6531, 7751, 1020);
INSERT INTO `gossip_menu` VALUES (6531, 7733, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6531 WHERE `entry` = 15182;

-- Huum Wildmane
INSERT INTO `gossip_menu` VALUES (6564, 7779, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6564 WHERE `entry` = 15270;

-- Aurel Goldleaf
INSERT INTO `gossip_menu` VALUES (6567, 7782, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6567 WHERE `entry` = 15282;

-- Bor Wildmane
INSERT INTO `gossip_menu` VALUES (6583, 7797, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6583 WHERE `entry` = 15306;

-- Nafien
UPDATE `creature_template` SET `gossip_menu_id`=6800 WHERE `entry` = 15395;

-- Janela Stouthammer
INSERT INTO `gossip_menu` VALUES (6623, 7874, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6623 WHERE `entry` = 15443;

-- Windcaller Kaldon
INSERT INTO `gossip_menu` VALUES (6796, 8114, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6796 WHERE `entry` = 15540;

-- Merok Longstride
INSERT INTO `gossip_menu` VALUES (6926, 8215, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6926 WHERE `entry` = 15613;

-- Squire Leoren Mal'derath
INSERT INTO `gossip_menu` VALUES (6791, 8108, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6791, 0, 0, 'I\'d like to stable my pet here', 0, 14, 8192, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6791 WHERE `entry` = 15722;

-- Officer Lunalight
UPDATE `creature_template` SET `gossip_menu_id`=6803 WHERE `entry` = 15762;

-- Officer Porterhouse
UPDATE `creature_template` SET `gossip_menu_id`=6804 WHERE `entry` = 15763;

-- Officer Ironbeard
UPDATE `creature_template` SET `gossip_menu_id`=6805 WHERE `entry` = 15764;

-- Officer Maloof
UPDATE `creature_template` SET `gossip_menu_id`=6806 WHERE `entry` = 15766;

-- Valadar Starsong
INSERT INTO `gossip_menu` VALUES (6917, 8202, 0);
INSERT INTO `gossip_menu` VALUES (6936, 8225, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 0, 0, 'How can I summon Omen?', 11689, 1, 1, 6936, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 2, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6917, 3, 0, 'Farewell.', 0, 1, 1, -1, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6917 WHERE `entry` = 15864;

-- Lunar Festival Harbinger
INSERT INTO `gossip_menu` VALUES (6918, 8205, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (229, 8, 8867, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (230, 23, 21711, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (231, -1, 229, 230, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6918, 0, 0, 'I\'d like a new invitation to the Lunar Festival.', 11617, 1, 1, -1, 0, 6918, 0, 0, '', 0, 231);
DELETE FROM `gossip_scripts` WHERE `id`=6918;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6918, 0, 15, 26375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lunar Festival Harbinger - Cast Spell Create Lunar Festival Invitation');
UPDATE `creature_template` SET `gossip_menu_id`=6918 WHERE `entry` = 15895;

-- Sergeant Carnes
INSERT INTO `gossip_menu` VALUES (6923, 8212, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6923 WHERE `entry` = 15903;

-- Vi'el
INSERT INTO `gossip_menu` VALUES (7046, 8292, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7046, 0, 1, 'Hey Vi\'el, show me your wares!', 11913, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7046 WHERE `entry` = 16015;

-- Dirk Thunderwood
INSERT INTO `gossip_menu` VALUES (7045, 8280, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7045 WHERE `entry` = 16091;

-- Korfax, Champion of the Light
INSERT INTO `gossip_menu` VALUES (7099, 8353, 0);
INSERT INTO `gossip_menu` VALUES (7151, 8415, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7099, 1, 0, 'Korfax, where can I find Dark Iron scraps?', 12088, 1, 1, 7151, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7106, 8363, 0);
INSERT INTO `gossip_menu` VALUES (7107, 8364, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8365, 11965, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7108, 8365, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7107, 0, 0, 'Anything else?', 11964, 1, 1, 7108, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7106, 0, 0, 'Continue please.', 11962, 1, 1, 7107, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7099, 0, 0, 'What is Dreadnaught armor?', 11960, 1, 1, 7106, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7099 WHERE `entry` = 16112;

-- Father Inigo Montoy
INSERT INTO `gossip_menu` VALUES (7098, 8352, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7098 WHERE `entry` = 16113;

-- Scarlet Commander Marjhan
INSERT INTO `gossip_menu` VALUES (7100, 8354, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7100 WHERE `entry` = 16114;

-- Commander Eligor Dawnbringer
INSERT INTO `gossip_menu` VALUES (7097, 8351, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7097 WHERE `entry` = 16115;

-- Archmage Angela Dosantos
INSERT INTO `gossip_menu` VALUES (7096, 8350, 0);
INSERT INTO `gossip_menu` VALUES (7135, 8388, 0);
INSERT INTO `gossip_menu` VALUES (7134, 8389, 0);
INSERT INTO `gossip_menu` VALUES (7133, 8390, 0);
INSERT INTO `gossip_menu` VALUES (7132, 8391, 0);
INSERT INTO `gossip_menu` VALUES (7131, 8392, 0);
INSERT INTO `gossip_menu` VALUES (7130, 8393, 0);
INSERT INTO `gossip_menu` VALUES (7129, 8394, 0);
INSERT INTO `gossip_menu` VALUES (7128, 8395, 0);
INSERT INTO `gossip_menu` VALUES (7127, 8396, 0);
INSERT INTO `gossip_menu` VALUES (7126, 8397, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7127, 0, 0, 'Is there anything else?', 12039, 1, 1, 7126, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7128, 0, 0, 'Please, tell me more.', 12037, 1, 1, 7127, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7129, 0, 0, 'This is disturbing. Please continue.', 12035, 1, 1, 7128, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7130, 0, 0, 'What?', 7652, 1, 1, 7129, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7131, 0, 0, 'Please continue.', 4247, 1, 1, 7130, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7132, 0, 0, 'Please continue.', 4247, 1, 1, 7131, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7133, 0, 0, 'What corruption?', 12027, 1, 1, 7132, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7134, 0, 0, 'Please continue.', 4247, 1, 1, 7133, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7135, 0, 0, 'What Guardian? I don\'t understand any of this.', 12023, 1, 1, 7134, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7096, 0, 0, 'What is Atiesh?', 12021, 1, 1, 7135, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (7150, 8414, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7096, 1, 0, 'Where can I find core of elements?', 12086, 1, 1, 7150, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7096 WHERE `entry` = 16116;

-- Rohan the Assassin
INSERT INTO `gossip_menu` VALUES (7101, 8355, 0);
INSERT INTO `gossip_menu` VALUES (7145, 8409, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7101, 1, 0, 'Where can I find bone fragments?', 12077, 1, 1, 7145, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8380, 12004, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7118, 8380, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8381, 12006, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7119, 8381, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8382, 12008, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7120, 8382, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8383, 12010, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7121, 8383, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8384, 12012, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7122, 8384, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7121, 0, 0, 'Hey wait, Gadgetzan has a disco?', 12011, 1, 1, 7122, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7120, 0, 0, 'Wow, you\'re insane, aren\'t you?', 12009, 1, 1, 7121, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7119, 0, 0, 'What? Bonescythe?', 12007, 1, 1, 7120, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7118, 0, 0, 'So what brings you to Light\'s Hope?', 12005, 1, 1, 7119, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7101, 0, 0, 'What is it that you do exactly, Rohan?', 12003, 1, 1, 7118, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7101 WHERE `entry` = 16131;

-- Huntsman Leopold
INSERT INTO `gossip_menu` VALUES (7102, 8356, 0);
INSERT INTO `gossip_menu` VALUES (7144, 8408, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7102, 1, 0, 'Where can I find crypt fiend parts, Leopold?', 12075, 1, 1, 7144, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8369, 11979, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7111, 8369, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8370, 11981, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7112, 8370, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7111, 0, 0, 'Continue please.', 11980, 1, 1, 7112, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7102, 0, 0, 'What is Cryptstalker armor?', 11978, 1, 1, 7111, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7102 WHERE `entry` = 16132;

-- Mataus the Wrathcaster
INSERT INTO `gossip_menu` VALUES (7105, 8359, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7105 WHERE `entry` = 16133;

-- Rimblat Earthshatter
INSERT INTO `gossip_menu` VALUES (7103, 8357, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7103 WHERE `entry` = 16134;

-- Rayne
INSERT INTO `gossip_menu` VALUES (7152, 8416, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7104, 1, 0, 'Rayne, where should I look for savage fronds?', 12090, 1, 1, 7152, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8385, 12016, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7123, 8385, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8386, 12018, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7124, 8386, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadCastTextID1`, `Probability1`) VALUES (8387, 12020, 1, 0, 0);
INSERT INTO `gossip_menu` VALUES (7125, 8387, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7124, 0, 0, 'What kind of services?', 12019, 1, 1, 7125, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7123, 0, 0, 'Are these lands not beyond healing? They look pretty beat up.', 12017, 1, 1, 7124, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (7104, 0, 0, 'Hello, Rayne. What brings the Cenarion Circle to the Plaguelands?', 12015, 1, 1, 7123, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7104 WHERE `entry` = 16135;

-- Bloodsail Traitor
INSERT INTO `gossip_menu` VALUES (7236, 8536, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7236 WHERE `entry` = 16399;

-- Mupsi Shacklefridd
INSERT INTO `gossip_menu` VALUES (7237, 8537, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7237 WHERE `entry` = 16418;

-- Handor
DELETE FROM `gossip_menu` WHERE `entry`=9148;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9148;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry` = 3316;

-- Festival Loremaster
INSERT INTO `gossip_menu` VALUES (7326, 8703, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7326 WHERE `entry` = 16817;

-- Basil Frye
UPDATE `gossip_menu` SET `entry`=2750 WHERE `entry`=9298;
UPDATE `gossip_menu_option` SET `menu_id`=2750 WHERE `menu_id`=9298;
UPDATE `creature_template` SET `gossip_menu_id`=2750 WHERE `entry`=4605;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
