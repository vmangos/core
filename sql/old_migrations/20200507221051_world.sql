DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200507221051');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200507221051');
-- Add your query below.


-- Lord Grayson Shadowbreaker
INSERT INTO `gossip_menu` VALUES (4471, 3976, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4471, 0, 3, 'I would like to train further in the ways of the Light.', 5299, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4471, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 134);
UPDATE `creature_template` SET `gossip_menu_id`=4471 WHERE `entry`=928;

-- Thysta
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=1387;

-- Grimand Elmore
DELETE FROM `gossip_menu` WHERE `entry`=5902;
UPDATE `gossip_menu` SET `entry`=5902 WHERE `entry`=9063;
UPDATE `gossip_menu_option` SET `menu_id`=5902 WHERE `menu_id`=9063;
UPDATE `creature_template` SET `gossip_menu_id`=5902 WHERE `entry`=1416;

-- Cain Firesong
INSERT INTO `gossip_menu` VALUES (63, 563, 91);
INSERT INTO `gossip_menu` VALUES (63, 562, 90);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (63, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (63, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 90);
UPDATE `creature_template` SET `gossip_menu_id`=63 WHERE `entry`=2128;

-- Carolai Anise
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4120, 5043, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4120, 5044, 25);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4120, 5045, 361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4120, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4120 WHERE `entry`=2132;

-- Zarise
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=2389;

-- Gringer
UPDATE `creature_template` SET `gossip_menu_id`=4307 WHERE `entry`=2858;

-- Brave Strongbash
-- UPDATE `creature_template` SET `gossip_menu_id`=3328 WHERE `entry`=3215;

-- Grisha
INSERT INTO `gossip_menu` VALUES (5968, 7123, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5968, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5968 WHERE `entry`=3305;

-- Gann Stonespire
-- INSERT INTO `gossip_menu` VALUES (462, 942, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=462 WHERE `entry`=3341;

-- Caylais Moonfeather
UPDATE `creature_template` SET `gossip_menu_id`=4301, `npc_flags`=9 WHERE `entry`=3841;

-- Tharm
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=4312;

-- Gorkas
UPDATE `creature_template` SET `gossip_menu_id`=6023 WHERE `entry`=4314;

-- Race Master Kronkrider
INSERT INTO `gossip_menu` VALUES (433, 932, 0);
UPDATE `creature_template` SET `gossip_menu_id`=433 WHERE `entry`=4419;

-- Gnome Pit Crewman
UPDATE `gossip_menu` SET `entry`=284 WHERE `entry`=50143;
UPDATE `creature_template` SET `gossip_menu_id`=284 WHERE `entry`=4430;

-- Michael Garrett
UPDATE `creature_template` SET `gossip_menu_id`=4282 WHERE `entry`=4551;

-- Clyde Kellen
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=5690;

-- Nurse Neela
INSERT INTO `gossip_menu` VALUES (5856, 7028, 0);
INSERT INTO `gossip_menu` VALUES (5856, 7025, 65);
INSERT INTO `gossip_menu` VALUES (5856, 7024, 66);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5856, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5856 WHERE `entry`=5759;

-- Ur'kyo
INSERT INTO `gossip_menu` VALUES (4521, 4441, 94);
INSERT INTO `gossip_menu` VALUES (4521, 4440, 95);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4521, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, '', 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4521, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 163);
UPDATE `creature_template` SET `gossip_menu_id`=4521 WHERE `entry`=6018;

-- Breyk
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=6026;

-- Magus Tirth
INSERT INTO `gossip_menu` VALUES (1702, 2354, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1702, 0, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1702 WHERE `entry`=6548;

-- Bunthen Plainswind
INSERT INTO `gossip_menu` VALUES (4042, 4916, 88);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (206, -1, 2, 89, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4042, 4918, 206);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (232, -1, 3, 89, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4042, 4917, 232);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4042, 0, 0, 'I\'d like to fly to Thunder Bluff.', 12804, 1, 1, -1, 0, 4042, 0, 0, '', 0, 206);
DELETE FROM `gossip_scripts` WHERE `id`=4042;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4042, 0, 30, 316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bunthen Plainswind - Start Taxi Path to Thunder Bluff');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (233, 9, 30, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (234, 9, 272, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (357, -2, 233, 234, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4042, 1, 0, 'Do you know where I can find Half Pendant of Aquatic Endurance?', 0, 1, 1, 4223, 0, 0, 0, 0, '', 0, 234);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4042, 2, 0, 'Do you know where I can find Half Pendant of Aquatic Endurance?', 0, 1, 1, 4224, 0, 0, 0, 0, '', 0, 233);
INSERT INTO `gossip_menu` VALUES (4223, 5373, 0);
INSERT INTO `gossip_menu` VALUES (4224, 5374, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4042, `script_name`='' WHERE `entry`=11798;

-- Silva Fil'naveth
INSERT INTO `gossip_menu` VALUES (4041, 4913, 88);
INSERT INTO `gossip_menu` VALUES (4041, 4914, 232);
INSERT INTO `gossip_menu` VALUES (4041, 4915, 206);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4041, 0, 0, 'I\'d like to fly to Rut\'theran Village.', 7573, 1, 1, -1, 0, 4041, 0, 0, '', 0, 232);
DELETE FROM `gossip_scripts` WHERE `id`=4041;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4041, 0, 30, 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silva Fil\'naveth - Start Taxi Path to Rut\'theran VIllage');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4041, 1, 0, 'Do you know where I can find Half Pendant of Aquatic Agility?', 0, 1, 1, 4225, 0, 0, 0, 0, '', 0, 234);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4041, 2, 0, 'Do you know where I can find Half Pendant of Aquatic Agility?', 0, 1, 1, 4226, 0, 0, 0, 0, '', 0, 233);
INSERT INTO `gossip_menu` VALUES (4225, 5375, 234);
INSERT INTO `gossip_menu` VALUES (4226, 5376, 233);
UPDATE `creature_template` SET `gossip_menu_id`=4041, `script_name`='' WHERE `entry`=11800;

-- Myranda the Hag
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (293, 1, 17961, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (292, 9, 5862, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (290, 8, 5862, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (291, 8, 5944, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (294, -3, 291, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (295, -1, 290, 294, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (296, -2, 292, 295, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (297, -1, 293, 296, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (3801, 4773, 297);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (3801, 0, 0, 'I am ready for the illusion, Myranda.', 7306, 1, 1, -1, 0, 3801, 0, 0, '', 0, 297);
DELETE FROM `gossip_scripts` WHERE `id`=3801;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3801, 0, 15, 17961, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Myranda the Hag - Cast Spell Scarlet Illusion');
UPDATE `creature_template` SET `gossip_menu_id`=3801, `script_name`='' WHERE `entry`=11872;

-- Brakkar
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=11900;

-- Nat Pagle
UPDATE `gossip_menu` SET `entry`=6445 WHERE `entry`=12919;
UPDATE `gossip_menu_option` SET `menu_id`=6445 WHERE `menu_id`=12919;
UPDATE `creature_template` SET `gossip_menu_id`=6445 WHERE `entry`=12919;

-- Vahgruk
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=13177;

-- Shen'dralar Ancient
INSERT INTO `gossip_menu` VALUES (5729, 6896, 0);
INSERT INTO `gossip_menu` VALUES (5728, 6897, 0);
INSERT INTO `gossip_menu` VALUES (5727, 6898, 0);
INSERT INTO `gossip_menu` VALUES (5726, 6899, 0);
INSERT INTO `gossip_menu` VALUES (5725, 6900, 0);
INSERT INTO `gossip_menu` VALUES (5724, 6901, 0);
INSERT INTO `gossip_menu` VALUES (5723, 6902, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5723, 0, 0, 'A very sad tale. Thank you, spirit.', 9392, 1, 1, -1, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5724, 0, 0, 'We live in a world of endless tragedy.', 9390, 1, 1, 5723, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5725, 0, 0, 'I\'m going to have to kill something, aren\'t I?', 9388, 1, 1, 5724, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5726, 0, 0, 'Fascinating. Continue, please.', 9386, 1, 1, 5725, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5727, 0, 0, 'Continue, please.', 9300, 1, 1, 5726, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5728, 0, 0, 'I know very little of the Highborne and nothing of the Shen\'dralar.', 9382, 1, 1, 5727, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5729, 0, 0, 'What happened here, spirit?', 9380, 1, 1, 5728, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5729, `npc_flags`=3 WHERE `entry`=14358;

-- Lorekeeper Mykos
INSERT INTO `gossip_menu` VALUES (5756, 6940, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5756, `npc_flags`=3 WHERE `entry`=14382;

-- Lorekeeper Kildrath
INSERT INTO `gossip_menu` VALUES (5748, 6927, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5748, `npc_flags`=3 WHERE `entry`=14383;

-- Lothos Riftwaker
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7849, -2, 7848, 7487, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5750, 0, 0, 'Transport me to the Molten Core, Lothos.', 13491, 1, 1, -1, 0, 5750, 0, 0, '', 0, 7849);
DELETE FROM `gossip_scripts` WHERE `id`=5750;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5750, 0, 6, 409, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1091.89, -466.985, -105.084, 3.64, 0, 'Lothos Riftwaker - Teleport Target to Molten Core');
UPDATE `creature_template` SET `gossip_menu_id`=5750, `script_name`='' WHERE `entry`=14387;

-- Eris Havenfire
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7622, 22, 7622, 0, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7029, 9707, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7030, 9717, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7031, 9719, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7032, 9721, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7033, 9723, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7034, 9725, 1);
INSERT INTO `gossip_menu` VALUES (5857, 7029, 0);
INSERT INTO `gossip_menu` VALUES (5858, 7034, 0);
INSERT INTO `gossip_menu` VALUES (5859, 7033, 0);
INSERT INTO `gossip_menu` VALUES (5860, 7032, 0);
INSERT INTO `gossip_menu` VALUES (5861, 7031, 0);
INSERT INTO `gossip_menu` VALUES (5862, 7030, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES (5857, 0, 0, 'The Eye led me here, Eris.', 9716, 1, 1, 5862, 7622);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5859, 0, 0, 'So what can I do to help?', 9724, 1, 1, 5858);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5860, 0, 0, 'Those days are over, Eris.', 9722, 1, 1, 5859);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5861, 0, 0, 'I really did not know what to expect, Eris. I will use my powers to assist you if that is what is asked of me.', 9720, 1, 1, 5860);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (5862, 0, 0, 'And I was suited to see this?', 9718, 1, 1, 5861);
UPDATE `creature_template` SET `gossip_menu_id`=5857, `npc_flags`=3 WHERE `entry`=14494;

-- Falrin Treeshaper
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (8336, 11907, 1);
INSERT INTO `gossip_menu`  VALUES (7084, 8336, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7084, `npc_flags`=3 WHERE `entry`=16032;

-- Officer Thunderstrider
INSERT INTO `gossip_menu` VALUES (6809, 8132, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6809 WHERE `entry`=15767;

-- Lokhtos Darkbargainer
DELETE FROM `gossip_menu` WHERE `entry`=4781;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (289, 5, 59, 4, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4781, 5834, 289);
INSERT INTO `gossip_menu` VALUES (4781, 3673, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (356, 2, 17203, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7604, 22, 7604, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7605, -1, 356, 7604, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4781, 7006, 7605);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4781, 0, 1, 'Show me what I have access to, Lokhtos.', 8401, 3, 4, 0, 0, 0, 0, 0, '', 0, 289);
INSERT INTO `gossip_menu` VALUES (5847, 7007, 0);
INSERT INTO `gossip_menu` VALUES (5846, 7008, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5846, 0, 0, 'Give me the contract.', 9644, 1, 1, -1, 0, 584601, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5847, 0, 0, 'You\'ve got my attention.', 9642, 1, 1, 5846, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4781, 1, 0, 'Hrm, I\'m listening. What is this offer?', 9640, 1, 1, 5847, 0, 0, 0, 0, '', 0, 7605);
DELETE FROM `gossip_scripts` WHERE `id`=584601;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (584601, 0, 15, 23059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lokhtos Darkbargainer - Cast Spell Create Thorium Brotherhood Contract');
UPDATE `creature_template` SET `gossip_menu_id`=4781, `script_name`='' WHERE `entry`=12944;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
