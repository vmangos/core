DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200627201552');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200627201552');
-- Add your query below.


-- High Priestess Laurena <Priest Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 4433, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 4434, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4466, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4466, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4466, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4466, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4466, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4466 WHERE `entry`=376;

-- Ander Germaine <Warrior Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 1216, 98);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 5721, 99);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4475, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4475, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4475, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4475, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4475, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4475 WHERE `entry`=914;

-- Evan Larson <Hatter>
UPDATE `creature_template` SET `gossip_menu_id`=681 WHERE `entry`=1310;

-- Heinrich Stone <Blade Merchant>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 1240, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (690, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (690, 0, 1, 'I want to browse your goods.', 0, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (690, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (690, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=690 WHERE `entry`=1324;

-- Lee Brown <Fisherman>
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=1651;

-- Lady Katrana Prestor
INSERT INTO `gossip_menu` VALUES
(2044, 2693, 0),
(60400, 2694, 0),
(60401, 2695, 0),
(60402, 2696, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4185, 9, 4185, 1, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2044, 0, 0, 'Pardon the intrusion, Lady Prestor, but Highlord Bolvar suggested that I seek your advice.', 4991, 1, 1, 60400, 0, 0, 0, 0, NULL, 0, 4185);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (60400, 0, 0, 'My apologies, Lady Prestor.\n', 4993, 1, 1, 60401, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (60401, 0, 0, 'Begging your pardon, Lady Prestor. That was not my intent.\n', 4995, 1, 1, 60402, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (60402, 0, 0, 'Thank you for your time, Lady Prestor.', 4997, 1, 1, -1, 0, 60402, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=60402;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (60402, 0, 7, 4185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Katrana Prestor - Complete Quest');
UPDATE `creature_template` SET `gossip_menu_id`=2044, `script_name`='' WHERE `entry`=1749;

-- Harold Riggs <Fishing Trainer>
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=3179;

-- Thomas Miller <Baker>
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=3518;

-- Terenthis
INSERT INTO `gossip_menu` VALUES (2662, 3334, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2662 WHERE `entry`=3693;

-- Tharnariun Treetender
UPDATE `gossip_menu` SET `entry`=269 WHERE `entry`=10482;
UPDATE `gossip_menu_option` SET `menu_id`=269 WHERE `menu_id`=10482;
UPDATE `creature_template` SET `gossip_menu_id`=269 WHERE `entry`=3701;

-- Alanndarian Nightsong
INSERT INTO `gossip_menu` VALUES (361, 838, 0);
UPDATE `creature_template` SET `gossip_menu_id`=361 WHERE `entry`=3702;

-- Kylanna <Expert Alchemist>
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`) VALUES (5061, 1, 0, 0, 0, 0, 0, 0, 0, 7725, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu` SET `text_id`=5061 WHERE `text_id`=5051 && `entry`=60950;
UPDATE `gossip_menu` SET `entry`=4124 WHERE `entry`=60950;
UPDATE `gossip_menu_option` SET `menu_id`=4124 WHERE `menu_id`=60950;
UPDATE `creature_template` SET `gossip_menu_id`=4124 WHERE `entry`=3964;

-- Aayndia Floralwind <Expert Leatherworker>
UPDATE `gossip_menu` SET `entry`=4211 WHERE `entry`=4213;
UPDATE `gossip_menu_option` SET `menu_id`=4211 WHERE `menu_id`=4213;
UPDATE `creature_template` SET `gossip_menu_id`=4211 WHERE `entry`=3967;

-- Ben Trias <Apprentice of Cheese>
UPDATE `creature_template` SET `gossip_menu_id`=685 WHERE `entry`=4981;

-- Wu Shen <Warrior Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 1216, 98);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 5721, 99);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4482, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4482, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4482, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4482, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4482, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4482 WHERE `entry`=5479;

-- Ilsa Corbin <Warrior Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 1216, 98);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 5721, 99);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4481, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4481, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4481, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4481, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4481, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4481 WHERE `entry`=5480;

-- Brother Joshua <Priest Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 4433, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 4434, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4467, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4467, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4467, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4467, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4467, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4467 WHERE `entry`=5489;

-- Delfrum Flintbeard <Journeyman Blacksmith>
UPDATE `gossip_menu` SET `text_id`=1598 WHERE `text_id`=3398 && `entry`=2743;
UPDATE `gossip_menu` SET `text_id`=1597 WHERE `text_id`=3399 && `entry`=2743;
UPDATE `gossip_menu` SET `text_id`=1599 WHERE `text_id`=3401 && `entry`=2743;
UPDATE `gossip_menu` SET `entry`=1007 WHERE `entry`=2743;
UPDATE `gossip_menu_option` SET `menu_id`=1007 WHERE `menu_id`=2743;
UPDATE `creature_template` SET `gossip_menu_id`=1007 WHERE `entry`=6299;

-- Gorbold Steelhand <General Trade Supplier>
UPDATE `gossip_menu` SET `entry`=2541 WHERE `entry`=12726;
UPDATE `gossip_menu_option` SET `menu_id`=2541 WHERE `menu_id`=12726;
UPDATE `gossip_menu_option` SET `option_text`='I would like to buy from you.', `OptionBroadcastTextID`=2583 WHERE `menu_id`=2541;
UPDATE `creature_template` SET `gossip_menu_id`=2541 WHERE `entry`=6301;

-- Innkeeper Kimlya <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=347 WHERE `entry`=6738;

-- Innkeeper Trelayne <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=342 WHERE `entry`=6790;

-- Innkeeper Shyria <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=347 WHERE `entry`=7736;

-- Fyldren Moonfeather <Hippogryph Master>
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=8019;

-- Don Pompa
INSERT INTO `gossip_menu` VALUES (4309, 5481, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4309 WHERE `entry`=12657;

-- Illiyana Moonblaze <Silverwing Supply Officer>
INSERT INTO `gossip_menu` VALUES (6142, 7295, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6142, 0, 1, 'What goods have I earned the right to purchase for use in Warsong Gulch?', 10019, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6142, `npc_flags`=16391 WHERE `entry`=14753;

-- League of Arathor Emissary
UPDATE `gossip_menu` SET `entry`=6506 WHERE `entry`=6504;
UPDATE `gossip_menu_option` SET `menu_id`=6506 WHERE `menu_id`=6504;
UPDATE `creature_template` SET `gossip_menu_id`=6506 WHERE `entry`=14991;

-- Stormpike Emissary
DELETE FROM `gossip_menu` WHERE `entry`=6496;
UPDATE `gossip_menu` SET `entry`=6496 WHERE `entry`=8453;
UPDATE `gossip_menu_option` SET `menu_id`=6496 WHERE `menu_id`=8453;
UPDATE `creature_template` SET `gossip_menu_id`=6496 WHERE `entry`=15103;

-- Kurdram Stonehammer
UPDATE `creature_template` SET `npc_flags`=18 WHERE `entry`=6297;

-- Elisa Steelhand
UPDATE `creature_template` SET `npc_flags`=16390 WHERE `entry`=6300;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
