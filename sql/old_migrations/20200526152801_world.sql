DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200526152801');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200526152801');
-- Add your query below.


-- Keldric Boucher <Arcane Goods Vendor>
DELETE FROM `gossip_menu` WHERE `entry`=9012;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9012;
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=1257;

-- Kyra Boucher <Reagent Vendor>
DELETE FROM `gossip_menu` WHERE `entry`=9014;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9014;
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry`=1275;

-- Thurman Mullby <General Goods Vendor>
UPDATE `gossip_menu` SET `entry`=687 WHERE `entry`=9015;
UPDATE `gossip_menu_option` SET `menu_id`=687 WHERE `menu_id`=9015;
UPDATE `creature_template` SET `gossip_menu_id`=687 WHERE `entry`=1285;

-- Edna Mullby <Edna Mullby>
DELETE FROM `gossip_menu` WHERE `entry`=9016;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9016;
UPDATE `creature_template` SET `gossip_menu_id`=687 WHERE `entry`=1286;

-- Gunther Weller <Weapons Merchant>
DELETE FROM `gossip_menu` WHERE `entry`=9018;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9018;
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=1289;

-- Aldric Moore <Mail Armor Merchant>
DELETE FROM `gossip_menu` WHERE `entry`=9021;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9021;
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=1294;

-- Lina Stover <Bow & Gun Merchant>
DELETE FROM `gossip_menu` WHERE `entry`=9023;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9023;
UPDATE `creature_template` SET `gossip_menu_id`=686 WHERE `entry`=1297;

-- Allan Hafgan <Staves Merchant>
DELETE FROM `gossip_menu` WHERE `entry`=9039;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9039;
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry`=1315;

-- Seoman Griffith <Leather Armor Merchant>
DELETE FROM `gossip_menu` WHERE `entry`=9044;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9044;
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry`=1320;

-- Alexandra Bolero <Tailoring Supplies>
UPDATE `gossip_menu` SET `entry`=684 WHERE `entry`=9052;
UPDATE `gossip_menu_option` SET `menu_id`=684 WHERE `menu_id`=9052;
UPDATE `creature_template` SET `gossip_menu_id`=684 WHERE `entry`=1347;

-- Stephen Ryback <Cooking Trainer>
UPDATE `gossip_menu` SET `text_id`=1208 WHERE `text_id`=1207 && `entry`=9375;
UPDATE `gossip_menu` SET `entry`=646 WHERE `entry`=9375;
UPDATE `gossip_menu_option` SET `menu_id`=646 WHERE `menu_id`=9375;
UPDATE `creature_template` SET `gossip_menu_id`=646 WHERE `entry`=5482;

-- Arnold Leland <Fishing Trainer>
INSERT INTO `gossip_menu` VALUES (645, 1206, 0);
UPDATE `gossip_menu` SET `entry`=645 WHERE `entry`=9377;
UPDATE `gossip_menu_option` SET `menu_id`=645 WHERE `menu_id`=9377;
UPDATE `creature_template` SET `gossip_menu_id`=645 WHERE `entry`=5493;

-- Lilyssia Nightbreeze <Expert Alchemist>
UPDATE `gossip_menu_option` SET `condition_id`=361 WHERE `menu_id`=9378 && `id`=3;
UPDATE `gossip_menu` SET `entry`=4201 WHERE `entry`=9378;
UPDATE `gossip_menu_option` SET `menu_id`=4201 WHERE `menu_id`=9378;
UPDATE `creature_template` SET `gossip_menu_id`=4201 WHERE `entry`=5499;

-- Tel'Athir <Journeyman Alchemist>
DELETE FROM `gossip_menu` WHERE `entry`=4112;
UPDATE `gossip_menu` SET `entry`=4112 WHERE `entry`=9379;
UPDATE `gossip_menu_option` SET `menu_id`=4112 WHERE `menu_id`=9379;
UPDATE `creature_template` SET `gossip_menu_id`=4112 WHERE `entry`=5500;

-- Therum Deepforge <Expert Blacksmith>
DELETE FROM `gossip_menu` WHERE `entry`=9384 && `text_id`=3453;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=581;
UPDATE `gossip_menu` SET `entry`=581 WHERE `entry`=9384;
UPDATE `gossip_menu_option` SET `condition_id`=366 WHERE `menu_id`=9384 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=581 WHERE `menu_id`=9384;
UPDATE `creature_template` SET `gossip_menu_id`=581 WHERE `entry`=5511;

-- Dane Lindgren <Journeyman Blacksmith>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2745, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=2745 WHERE `entry`=957;

-- Gretta Finespindle <Journeyman Leatherworker>
UPDATE `gossip_menu` SET `entry`=4182 WHERE `entry`=9072;
UPDATE `gossip_menu_option` SET `menu_id`=4182 WHERE `menu_id`=9072;
UPDATE `creature_template` SET `gossip_menu_id`=4182 WHERE `entry`=1466;

-- Historian Karnik
UPDATE `gossip_menu` SET `entry`=5348 WHERE `entry`=9102;
UPDATE `gossip_menu_option` SET `menu_id`=5348 WHERE `menu_id`=9102;
UPDATE `creature_template` SET `gossip_menu_id`=5348 WHERE `entry`=2916;

-- Golnir Bouldertoe <Mining Supplier>
UPDATE `gossip_menu_option` SET `option_text`='I would like to buy from you.', `OptionBroadcastTextID`=2583 WHERE `menu_id`=9250 && `id`=1;
UPDATE `gossip_menu` SET `entry`=4359 WHERE `entry`=9250;
UPDATE `gossip_menu_option` SET `menu_id`=4359 WHERE `menu_id`=9250;
UPDATE `creature_template` SET `gossip_menu_id`=4359 WHERE `entry`=4256;

-- Grimnur Stonebrand <Fishing Trainer>
UPDATE `gossip_menu_option` SET `option_text`='I require training, Grimnur.', `OptionBroadcastTextID`=8337 WHERE `menu_id`=9357 && `id`=3;
UPDATE `gossip_menu` SET `entry`=4742 WHERE `entry`=9357;
UPDATE `gossip_menu_option` SET `menu_id`=4742 WHERE `menu_id`=9357;
UPDATE `creature_template` SET `gossip_menu_id`=4742 WHERE `entry`=5161;

-- Astaia <Fishing Trainer>
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001267);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4156;
DELETE FROM `gossip_menu` WHERE `entry`=9210;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9210;
UPDATE `creature_template` SET `ai_name`='', `gossip_menu_id`=5665 WHERE `entry`=4156;

-- Ainethil <Artisan Alchemist>
INSERT INTO `gossip_menu` VALUES (4131, 5094, 0);
UPDATE `gossip_menu` SET `entry`=4131 WHERE `entry`=9212;
UPDATE `gossip_menu_option` SET `condition_id`=362 WHERE `menu_id`=9212 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=4131 WHERE `menu_id`=9212;
UPDATE `creature_template` SET `gossip_menu_id`=4131 WHERE `entry`=4160;

-- Milla Fairancora <Journeyman Alchemist>
INSERT INTO `gossip_menu` VALUES (4114, 5025, 0);
INSERT INTO `gossip_menu` VALUES (4114, 5026, 25);
INSERT INTO `gossip_menu` VALUES (4114, 5027, 361);
UPDATE `gossip_menu` SET `entry`=4114 WHERE `entry`=9554;
UPDATE `gossip_menu_option` SET `menu_id`=4114 WHERE `menu_id`=9554;
UPDATE `creature_template` SET `gossip_menu_id`=4114 WHERE `entry`=11041;

-- Kylanna Windwhisper <Master Alchemist>
UPDATE `gossip_menu` SET `entry`=4133 WHERE `entry`=4125;
UPDATE `gossip_menu_option` SET `menu_id`=4133 WHERE `menu_id`=4125;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4133, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4133 WHERE `entry`=7948;

-- Sylvanna Forestmoon <Expert Alchemist>
INSERT INTO `gossip_menu` VALUES
(4125, 5064, 0),
(4125, 5065, 362),
(4125, 5067, 25),
(4125, 5068, 361);
UPDATE `gossip_menu` SET `entry`=4125 WHERE `entry`=9555;
UPDATE `gossip_menu_option` SET `condition_id`=361 WHERE `menu_id`=9555 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=4125 WHERE `menu_id`=9555;
UPDATE `creature_template` SET `gossip_menu_id`=4125 WHERE `entry`=11042;

-- Dan Golthas <Journeyman Leatherworker>
UPDATE `gossip_menu` SET `entry`=4188 WHERE `entry`=9001;
UPDATE `gossip_menu_option` SET `menu_id`=4188 WHERE `menu_id`=9001;
UPDATE `creature_template` SET `gossip_menu_id`=4188 WHERE `entry`=223;

-- Armand Cromwell <Fishing Trainer>
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001345);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4573;
DELETE FROM `gossip_menu` WHERE `entry`=9272;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9272;
UPDATE `creature_template` SET `ai_name`='', `gossip_menu_id`=5665 WHERE `entry`=4573;

-- Arthur Moore <Expert Leatherworker>
UPDATE `gossip_menu_option` SET `condition_id`=377 WHERE `menu_id`=9285 && `id`=3;
UPDATE `gossip_menu` SET `entry`=4210 WHERE `entry`=9285;
UPDATE `gossip_menu_option` SET `menu_id`=4210 WHERE `menu_id`=9285;
UPDATE `creature_template` SET `gossip_menu_id`=4210 WHERE `entry`=4588;

-- James Van Brunt <Expert Blacksmith>
UPDATE `gossip_menu_option` SET `condition_id`=366 WHERE `menu_id`=9289 && `id`=3;
UPDATE `gossip_menu` SET `entry`=1022 WHERE `entry`=9289;
UPDATE `gossip_menu_option` SET `menu_id`=1022 WHERE `menu_id`=9289;
UPDATE `creature_template` SET `gossip_menu_id`=1022 WHERE `entry`=4596;

-- Kylanna <Expert Alchemist> (gossip id unknown)
UPDATE `gossip_menu` SET `entry`=60950 WHERE `entry`=4117;
UPDATE `gossip_menu_option` SET `menu_id`=60950 WHERE `menu_id`=4117;
INSERT INTO `gossip_menu_option`  VALUES (60950, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 361);
UPDATE `creature_template` SET `gossip_menu_id`=60950 WHERE `entry`=3964;

-- Miao'zan <Journeyman Alchemist>
UPDATE `gossip_menu` SET `entry`=4117 WHERE `entry`=4129;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4117, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4117 WHERE `entry`=3184;

-- Serge Hinott <Expert Alchemist>
UPDATE `gossip_menu` SET `entry`=4129 WHERE `entry`=4130;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4129, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4129 WHERE `entry`=2391;

-- Doctor Marsh <Expert Alchemist>
INSERT INTO `gossip_menu` VALUES
(4130, 5090, 362),
(4130, 5092, 25),
(4130, 5093, 361);
UPDATE `gossip_menu` SET `entry`=4130 WHERE `entry`=9299;
UPDATE `gossip_menu_option` SET `condition_id`=361 WHERE `menu_id`=9299 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=4130 WHERE `menu_id`=9299;
UPDATE `creature_template` SET `gossip_menu_id`=4130 WHERE `entry`=4609;

-- Doctor Herbert Halsey <Artisan Alchemist>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4132, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 362);
-- UPDATE `creature_template` SET `gossip_menu_id`=4132 WHERE `entry`=4611;

-- Doctor Martin Felben <Journeyman Alchemist Trainer>
INSERT INTO `gossip_menu` VALUES (4121, 5046, 0);
INSERT INTO `gossip_menu` VALUES (4121, 5047, 25);
INSERT INTO `gossip_menu` VALUES (4121, 5048, 361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4121, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4121 WHERE `entry`=11044;

-- Carolai Anise <Journeyman Alchemist>
DELETE FROM `gossip_menu` WHERE `entry`=4120;
INSERT INTO `gossip_menu` VALUES (4120, 5043, 0);
INSERT INTO `gossip_menu` VALUES (4120, 5044, 25);
INSERT INTO `gossip_menu` VALUES (4120, 5045, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4120 WHERE `entry`=2132;

-- Karn Stonehoof <Expert Blacksmith>
UPDATE `gossip_menu_option` SET `condition_id`=366 WHERE `menu_id`=9108 && `id`=3;
UPDATE `gossip_menu` SET `entry`=1017 WHERE `entry`=9108;
UPDATE `gossip_menu_option` SET `menu_id`=1017 WHERE `menu_id`=9108;
UPDATE `creature_template` SET `gossip_menu_id`=1017 WHERE `entry`=2998;

-- Thrag Stonehoof <Journeyman Blacksmith>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2748, 1, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=2748 WHERE `entry`=10278;

-- Bena Winterhoof <Expert Alchemist>
INSERT INTO `gossip_menu` VALUES
(4128, 5080, 361),
(4128, 5081, 25),
(4128, 5083, 362);
UPDATE `gossip_menu` SET `entry`=4128 WHERE `entry`=9117;
UPDATE `gossip_menu_option` SET `condition_id`=361 WHERE `menu_id`=9117 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=4128 WHERE `menu_id`=9117;
UPDATE `creature_template` SET `gossip_menu_id`=4128 WHERE `entry`=3009;

-- Kray <Journeyman Alchemist>
INSERT INTO `gossip_menu` VALUES
(4119, 5041, 25),
(4119, 5042, 361);
UPDATE `gossip_menu` SET `entry`=4119 WHERE `entry`=9558;
UPDATE `gossip_menu_option` SET `menu_id`=4119 WHERE `menu_id`=9558;
UPDATE `creature_template` SET `gossip_menu_id`=4119 WHERE `entry`=11047;

-- Saru Steelfury <Artisan Blacksmith>
DELETE FROM `gossip_menu` WHERE `entry`=1012;
UPDATE `gossip_menu` SET `entry`=1012 WHERE `entry`=9169;
UPDATE `gossip_menu_option` SET `condition_id`=367 WHERE `menu_id`=9169 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=1012 WHERE `menu_id`=9169;
UPDATE `creature_template` SET `gossip_menu_id`=1012 WHERE `entry`=3355;

-- Ug'thok <Journeyman Blacksmith>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2747, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=2747 WHERE `entry`=10266;

-- Snarl <Expert Blacksmith>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2782, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 366);
-- UPDATE `creature_template` SET `gossip_menu_id`=2782 WHERE `entry`=1383;

-- Mudduk, Aska Mistrunner, Pyall Silentstride, Duhng
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001153);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3026;
UPDATE `gossip_menu` SET `entry`=5854 WHERE `entry`=4747;
DELETE FROM `gossip_menu` WHERE `entry`=9134;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9134;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5854, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5854 WHERE `entry` IN (1382, 3026, 3067, 8306);

-- Eunice Burch <Cooking Trainer>
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001324);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4552;
DELETE FROM `gossip_menu` WHERE `entry`=9257;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9257;
UPDATE `creature_template` SET `ai_name`='', `gossip_menu_id`=5854 WHERE `entry`=4552;

-- Zamja <Cooking Trainer>
UPDATE `gossip_menu` SET `entry`=4747 WHERE `entry`=9186;
UPDATE `gossip_menu_option` SET `option_text`='I require training, Zamja.', `OptionBroadcastTextID`=8347 WHERE `menu_id`=9186 && `id`=3;
UPDATE `gossip_menu_option` SET `menu_id`=4747 WHERE `menu_id`=9186;
UPDATE `creature_template` SET `gossip_menu_id`=4747 WHERE `entry`=3399;

-- Zando'zan
UPDATE `gossip_menu` SET `entry`=522 WHERE `entry`=9188;
UPDATE `gossip_menu_option` SET `menu_id`=522 WHERE `menu_id`=9188;
UPDATE `creature_template` SET `gossip_menu_id`=522 WHERE `entry`=3402;

-- Lexlort <Kargath Expeditionary Force>
UPDATE `gossip_menu` SET `text_id`=6947 WHERE `entry`=50406;
UPDATE `gossip_menu` SET `entry`=5762 WHERE `entry`=50406;
UPDATE `gossip_menu_option` SET `menu_id`=5762 WHERE `menu_id`=50406;
UPDATE `creature_template` SET `gossip_menu_id`=5762 WHERE `entry`=9080;

-- Kah Mistrunner <Fishing Trainer>
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001155);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3028;
DELETE FROM `gossip_menu` WHERE `entry`=9136;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9136;
UPDATE `creature_template` SET `ai_name`='', `gossip_menu_id`=5665 WHERE `entry`=3028;

-- Petra Grossen
UPDATE `gossip_menu` SET `entry`=2421 WHERE `entry`=56003;
UPDATE `gossip_menu_option` SET `menu_id`=2421 WHERE `menu_id`=56003;
UPDATE `creature_template` SET `gossip_menu_id`=2421 WHERE `entry`=9273;

-- Shylamiir <Herbalism Trainer>
INSERT INTO `gossip_menu` VALUES (643, 1202, 0);
INSERT INTO `gossip_menu_option`  VALUES (643, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
DELETE FROM `gossip_menu` WHERE `entry`=9380;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9380;
UPDATE `creature_template` SET `gossip_menu_id`=643 WHERE `entry`=5502;

-- Darianna <Journeyman Leatherworker>
UPDATE `gossip_menu` SET `entry`=4181 WHERE `entry`=9571;
UPDATE `gossip_menu_option` SET `menu_id`=4181 WHERE `menu_id`=9571;
UPDATE `creature_template` SET `gossip_menu_id`=4181 WHERE `entry`=11083;

-- Talvash del Kissel
DELETE FROM `gossip_menu` WHERE `entry`=12855;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=12855;
DELETE FROM `gossip_scripts` WHERE `id`=1285501;
INSERT INTO `gossip_menu` VALUES (1601, 2253, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1601 WHERE `entry`=6826;

-- Master Alchemist
INSERT INTO `gossip_menu_option`  VALUES (4134, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 363);
-- Expert Alchemist
INSERT INTO `gossip_menu_option`  VALUES (4122, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 361);
-- Artisan Blacksmith
INSERT INTO `gossip_menu_option`  VALUES (2762, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 367);
-- Expert Blacksmith
INSERT INTO `gossip_menu_option`  VALUES (2761, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 366);
INSERT INTO `gossip_menu_option`  VALUES (2783, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 366);
-- Master Engineer
INSERT INTO `gossip_menu_option`  VALUES (4152, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 393);
INSERT INTO `gossip_menu_option`  VALUES (1467, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 393);
INSERT INTO `gossip_menu_option`  VALUES (1468, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 393);
-- Artisan Engineer
INSERT INTO `gossip_menu_option`  VALUES (4151, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 392);
-- Expert Engineer
INSERT INTO `gossip_menu_option`  VALUES (4146, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 391);
INSERT INTO `gossip_menu_option`  VALUES (4148, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 391);
INSERT INTO `gossip_menu_option`  VALUES (4149, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 391);
-- Artisan Enchanter
INSERT INTO `gossip_menu_option`  VALUES (4170, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 381);
-- Expert Enchanter
INSERT INTO `gossip_menu_option`  VALUES (4160, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 380);
INSERT INTO `gossip_menu_option`  VALUES (4161, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 380);
INSERT INTO `gossip_menu_option`  VALUES (4165, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 380);
INSERT INTO `gossip_menu_option`  VALUES (4166, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 380);
INSERT INTO `gossip_menu_option`  VALUES (4168, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 380);
-- Master Leatherworker
INSERT INTO `gossip_menu_option`  VALUES (4244, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 379);
INSERT INTO `gossip_menu_option`  VALUES (4243, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 379);
INSERT INTO `gossip_menu_option`  VALUES (3067, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 379);
INSERT INTO `gossip_menu_option`  VALUES (3070, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 379);
-- Artisan Leatherworker
INSERT INTO `gossip_menu_option`  VALUES (4241, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 378);
-- Expert Leatherworker
INSERT INTO `gossip_menu_option`  VALUES (4203, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
INSERT INTO `gossip_menu_option`  VALUES (4204, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
INSERT INTO `gossip_menu_option`  VALUES (4206, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
INSERT INTO `gossip_menu_option`  VALUES (4207, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
INSERT INTO `gossip_menu_option`  VALUES (4208, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
INSERT INTO `gossip_menu_option`  VALUES (4213, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 377);
-- Master Tailor
INSERT INTO `gossip_menu_option`  VALUES (4843, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 374);
INSERT INTO `gossip_menu_option`  VALUES (4355, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 374);
INSERT INTO `gossip_menu_option`  VALUES (4356, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 374);
-- Artisan Tailor
INSERT INTO `gossip_menu_option`  VALUES (4354, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 373);
-- Expert Tailor
INSERT INTO `gossip_menu_option`  VALUES (4347, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 372);
INSERT INTO `gossip_menu_option`  VALUES (4350, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 372);
INSERT INTO `gossip_menu_option`  VALUES (4352, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 372);

-- Other trainers that don't have skill requirement to train.
INSERT INTO `gossip_menu_option`  VALUES (1041, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (1042, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (2742, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (2743, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (2746, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (2749, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (3072, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4110, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4116, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4118, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4136, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4138, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4139, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4140, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4141, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4142, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4143, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4144, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4153, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4154, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4155, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4156, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4157, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4158, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4159, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4167, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4172, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4173, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4183, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4184, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4186, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4187, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4261, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4262, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4263, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4264, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4265, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4266, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4267, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4268, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4269, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option`  VALUES (4744, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);

-- Fix startup errors because of removed npcs.
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (5719, 5718, 5717, 5729, 5749, 5723, 5724, 5725, 7715, 6875, 6858, 6849, 5715);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
