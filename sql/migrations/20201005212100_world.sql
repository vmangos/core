DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201005212100');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201005212100');
-- Add your query below.


-- Dughal Stormwing
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2207, 9, 4322, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2208, 34, 38, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2209, -1, 2207, 2208, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2209, 2846);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2209, 0, 0, 'You\'re free, Dughal! Get out of here!', 5212, 1, 1, -1, 0, 2209, 0, 0, NULL, 0, 2209);
DELETE FROM `gossip_scripts` WHERE `id`=2209;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2209, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dughal Stormwing - Start Escort');
UPDATE `creature_template` SET `gossip_menu_id`=2209 WHERE `entry`=9022;

-- Sraaz <Pie Vendor>
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001663);
DELETE FROM `creature_ai_events` WHERE `creature_id`=9099;
DELETE FROM `gossip_menu` WHERE `entry`=9528;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9528;
UPDATE `creature_template` SET `gossip_menu_id`=1721, `ai_name`='' WHERE `entry`=9099;

-- Golhine the Hooded <Druid Trainer>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4689, 0, 3, 'I seek training as a druid.', 7452, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4689, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 140);
UPDATE `creature_template` SET `gossip_menu_id`=4689 WHERE `entry`=9465;

-- Arathandris Silversky <Emerald Circle>
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (341, 8, 4101, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2208, 2848, 341);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2208, 2844, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2208, 2845, 2);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2360, 3046);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (342, 23, 11511, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (343, -1, 341, 342, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2208, 0, 0, 'I need a Cenarion beacon.', 5243, 1, 1, -1, 0, 2208, 0, 0, '', 0, 343);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2208, 1, 0, 'What plants are in Felwood that might be corrupted?', 5384, 1, 1, 2360, 0, 0, 0, 0, '', 0, 341);
DELETE FROM `gossip_scripts` WHERE `id`=2208;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2208, 0, 15, 15120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arathandris Silversky - Cast Spell Cenarion Beacon');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5245, 0, 0, 0, 0, 0, 0, 0, 0, 'Arathandris Silversky - Say Text');
UPDATE `creature_template` SET `gossip_menu_id`=2208, `script_name`='' WHERE `entry`=9528;

-- Maybess Riverbreeze <Emerald Circle>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2207, 2842, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2207, 2843, 3);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (344, 8, 4102, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2207, 2849, 344);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (345, -1, 344, 342, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2207, 0, 0, 'I need a Cenarion beacon.', 5243, 1, 1, -1, 0, 2207, 0, 0, '', 0, 345);
DELETE FROM `gossip_scripts` WHERE `id`=2207;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2207, 0, 15, 15120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arathandris Silversky - Cast Spell Cenarion Beacon');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5244, 0, 0, 0, 0, 0, 0, 0, 0, 'Arathandris Silversky - Say Text');
UPDATE `creature_template` SET `gossip_menu_id`=2207, `script_name`='' WHERE `entry`=9529;

-- Ragged John
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4866, 1, 16468, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2061, 2713);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2064, 2725);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2065, 2723);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2066, 2722);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2067, 2721);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2068, 2720);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2069, 2719);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2070, 2718);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2071, 2717);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2072, 2716);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2073, 2715);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2074, 2714);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2802, 3496);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4224, 9, 4224, 1, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2061, 0, 0, 'Official business, John. I need some information about Marshal Windsor. Tell me about the last time you saw him.', 5007, 1, 1, 2074, 0, 0, 0, 0, NULL, 0, 4224);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2064, 0, 0, 'Thanks, Ragged John. Your story was very uplifting and informative. ', 5038, 1, 1, -1, 0, 2064, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2065, 0, 0, 'Ahhh... Ironfoe.\n', 5034, 1, 1, 2064, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2066, 0, 0, '300? So the Dark Irons killed him and dragged him into the Depths?', 5030, 1, 1, 2065, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2067, 0, 0, 'WHY is he in Blackrock Depths?', 5027, 1, 1, 2066, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2068, 0, 0, 'Ok, so where the hell is he? Wait a minute! Are you drunk?', 5024, 1, 1, 2067, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2069, 0, 0, 'So how did he die?', 5021, 1, 1, 2068, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2070, 0, 0, 'So that\'s how Windsor died...', 5019, 1, 1, 2069, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2071, 0, 0, 'Interesting... continue, John.', 5017, 1, 1, 2070, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2072, 0, 0, 'Ironfoe?\n', 5015, 1, 1, 2071, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2073, 0, 0, 'Start making sense, dwarf. I don\'t want to have anything to do with your cracker, your pappy, or any sort of \'discreditin.\'\n', 5013, 1, 1, 2072, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2074, 0, 0, 'So what did you do?', 5010, 1, 1, 2073, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2061, 2, 0, 'Milk me, John.', 5833, 1, 1, 2802, 0, 0, 0, 0, NULL, 0, 4866);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2802, 0, 0, 'Do it... Do it now.', 5835, 1, 1, -1, 0, 2802, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=2064;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2064, 0, 7, 4224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ragged John - Complete Quest The True Masters');
DELETE FROM `gossip_scripts` WHERE `id`=2802;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2802, 0, 15, 16472, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ragged John - Cast Spell Wicked Milking');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2802, 0, 7, 4866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ragged John - Complete Quest Mother\'s Milk');
UPDATE `creature_template` SET `gossip_menu_id`=2061, `script_name`='' WHERE `entry`=9563;

-- Tobias Seecher
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2210, 2847);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2210, 0, 0, 'Get out of here, Tobias, you\'re free!', 5220, 1, 1, -1, 0, 2210, 0, 0, NULL, 0, 2209);
DELETE FROM `gossip_scripts` WHERE `id`=2210;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2210, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tobias Seecher - Start Escort');
UPDATE `creature_template` SET `gossip_menu_id`=2210 WHERE `entry`=9679;

-- Mathredis Firestar
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2301, 2993);
UPDATE `creature_template` SET `gossip_menu_id`=2301 WHERE `entry`=9836;

-- Ranshalla
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (979, 8, 979, 0, 0, 0, 0);
UPDATE `gossip_menu` SET `condition_id`=979 WHERE `entry`=3131 && `text_id`=4788;
UPDATE `creature_template` SET `gossip_menu_id`=3131 WHERE `entry`=10300;

-- Sindrayl <Hippogryph Master>
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=10897;

-- Captured Arko'narin
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (3129, 3865);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3129, 4113, 5202);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5202, 8, 5202, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3129 WHERE `entry`=11016;

-- Alchemist Arbington
DELETE FROM `gossip_menu` WHERE `entry`=3228;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (278, 8, 5237, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3228, 3985, 278);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3228, 3984, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (272, 23, 13370, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (280, -1, 272, 278, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 0, 0, 'I need a vitreous focuser.', 6531, 1, 1, -1, 0, 3223, 0, 0, '', 0, 280);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 1, 1, 'I wish to purchase arcane quickener from you.', 6513, 3, 4, 0, 0, 0, 0, 0, '', 0, 278);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3224, 3980, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 2, 0, 'What\'s needed for the cauldron at Felstone Field?', 6516, 1, 1, 3224, 0, 0, 0, 0, '', 0, 278);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3225, 3981, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 3, 0, 'What\'s needed for the cauldron at Dalson\'s Tears?', 6517, 1, 1, 3225, 0, 0, 0, 0, '', 0, 278);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3226, 3982, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 4, 0, 'What\'s needed for the cauldron at the Writhing Haunt?', 6518, 1, 1, 3226, 0, 0, 0, 0, '', 0, 278);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3227, 3983, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3228, 5, 0, 'What\'s needed for the cauldron at Gahrron\'s Withering?', 6519, 1, 1, 3227, 0, 0, 0, 0, '', 0, 278);
DELETE FROM `gossip_scripts` WHERE `id`=3223;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3223, 0, 15, 17529, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alchemist Arbington - Cast Spell Vitreous Focuser');
UPDATE `creature_template` SET `gossip_menu_id`=3228, `script_name`='' WHERE `entry`=11056;

-- Apothecary Dithers
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (277, 8, 5238, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (279, -1, 272, 277, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3223, 3978, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3223, 3979, 277);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 0, 0, 'I need a vitreous focuser.', 6531, 1, 1, -1, 0, 3223, 0, 0, '', 0, 279);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 1, 1, 'I wish to purchase arcane quickener from you.', 6513, 3, 4, 0, 0, 0, 0, 0, '', 0, 277);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 2, 0, 'What\'s needed for the cauldron at Felstone Field?', 6516, 1, 1, 3224, 0, 0, 0, 0, '', 0, 277);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 3, 0, 'What\'s needed for the cauldron at Dalson\'s Tears?', 6517, 1, 1, 3225, 0, 0, 0, 0, '', 0, 277);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 4, 0, 'What\'s needed for the cauldron at the Writhing Haunt?', 6518, 1, 1, 3226, 0, 0, 0, 0, '', 0, 277);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3223, 5, 0, 'What\'s needed for the cauldron at Gahrron\'s Withering?', 6519, 1, 1, 3227, 0, 0, 0, 0, '', 0, 277);
UPDATE `creature_template` SET `gossip_menu_id`=3223, `script_name`='' WHERE `entry`=11057;

-- Darrowshire Spirit
DELETE FROM `creature_ai_events` WHERE `creature_id`=11064;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1106401, 11064, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1106401, 0, 0, 'Darrowshire Spirit - Cast Spell on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1106401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1106401, 0, 15, 17321, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darrowshire Spirit - Cast Spell Spirit Spawn-in');
UPDATE `gossip_menu` SET `script_id`=3141 WHERE `entry`=3141;
DELETE FROM `gossip_scripts` WHERE `id`=3141;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3141, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darrowshire Spirit - Grant Quest Credit');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3141, 0, 18, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darrowshire Spirit - Despawn');
UPDATE `creature_template` SET `gossip_menu_id`=3141, `script_name`='' WHERE `entry`=11064;

-- Lui'Mala <Fisherman>
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=12032;

-- Mishellena <Hippogryph Master>
UPDATE `creature_template` SET `gossip_menu_id`=6944, `npc_flags`=9 WHERE `entry`=12578;

-- Commander Karl Philips
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5562, 6655);
UPDATE `creature_template` SET `gossip_menu_id`=5562, `npc_flags`=3 WHERE `entry`=13320;

-- Highlord Demitrian
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5781, 6955, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5784, 6956, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5783, 6958, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5675, 6812, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5675, 6954, 313);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (312, 8, 7785, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (313, -1, 311, 312, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5670, 20, 14435, 200, 1, 1, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5671, 20, 14435, 200, 0, 1, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5672, 22, 7787, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5673, 23, 19018, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5674, -1, 5670, 5671, 5672, 5673, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5675, -1, 26, 5674, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5676, -3, 311, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5677, -1, 312, 5676, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5689, 6842, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5688, 6843, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5687, 6844, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5702, 6867, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5701, 6868, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5704, 6869, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5703, 6870, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (50001, 6984, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5704, 0, 0, 'So what did Ragnaros do next?', 9336, 1, 1, 5703, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5701, 0, 0, 'Caught unaware? How?', 9334, 1, 1, 5704, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5702, 0, 0, '<Nod>', 0, 1, 1, 5701, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5687, 0, 0, 'A battle?', 9330, 1, 1, 5702, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5688, 0, 0, 'Continue, please.', 9300, 1, 1, 5687, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5689, 0, 0, 'I am listening, Demitrian.', 9298, 1, 1, 5688, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5675, 0, 0, 'What do you know of it?', 9296, 1, 1, 5689, 0, 0, 0, 0, '', 0, 5677);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5675, 2, 0, 'What must be done?', 9547, 1, 1, 5781, 0, 0, 0, 0, NULL, 0, 313);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5781, 0, 0, 'The Firelord and all who dare stand in my way shall reel from my wrath.', 9549, 1, 1, 5784, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5784, 0, 0, 'I shall scour the earth for this Earthshaper. What of the essence?', 9552, 1, 1, 5783, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5783, 0, 0, 'Give me the vessel, Highlord.', 9554, 1, 1, -1, 0, 5783, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=5783;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5783, 0, 15, 22958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Demitrian - Cast Spell Summon Vessel of Rebirth DND');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5675, 1, 0, 'Summon forth your cowardly master, fool! Let him face me!', 9574, 1, 1, 50001, 0, 5675, 0, 0, NULL, 0, 5675);
DELETE FROM `gossip_scripts` WHERE `id`=5675;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5675, 0, 10, 14435, 1800000, 1, 200, 0, 0, 0, 0, 8, 0, 6, 1, -6255, 1706.59, 6.137, 1.323, 0, 'Highlord Demitrian - Summon Prince Thunderaan');
UPDATE `creature_template` SET `gossip_menu_id`=5675, `script_name`='' WHERE `entry`=14347;

-- Pusillin
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(400, 1, 59.444599, -200.268005, -4.122460, 100.000000, 0, 0.000000, 0),
(400, 2, 1.174250, -199.897995, -4.130260, 100.000000, 0, 0.000000, 0),
(400, 3, -28.589300, -200.091003, -4.128790, 100.000000, 0, 0.000000, 0),
(400, 4, -86.580299, -199.050003, -4.113120, 100.000000, 0, 0.000000, 0),
(400, 5, -160.015747, -198.661758, -4.152906, 100.000000, 0, 0.000000, 0),
(400, 6, -151.796005, -276.088989, -4.156750, 100.000000, 0, 0.000000, 400);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(401, 1, -145.095993, -350.109009, -4.131740, 100.000000, 0, 0.000000, 0),
(401, 2, -116.660004, -354.032990, -4.099420, 100.000000, 0, 0.000000, 0),
(401, 3, -59.472500, -352.454010, -4.087810, 100.000000, 0, 0.000000, 0),
(401, 4, -30.866501, -356.497986, -4.130380, 100.000000, 0, 0.000000, 0),
(401, 5, -1.861810, -354.500000, -4.118980, 100.000000, 0, 0.000000, 0),
(401, 6, 74.061699, -351.326996, -4.070790, 100.000000, 0, 0.000000, 0),
(401, 7, 110.306999, -358.248993, -4.144140, 100.000000, 0, 0.000000, 400);
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(402, 1, 110.792999, -386.904999, -2.923070, 100.000000, 0, 0.000000, 0),
(402, 2, 111.613998, -415.894989, -3.273570, 100.000000, 0, 0.000000, 0),
(402, 3, 111.987000, -445.078003, -3.273570, 100.000000, 0, 0.000000, 0),
(402, 4, 112.219002, -473.152008, -3.682990, 100.000000, 0, 0.000000, 0),
(402, 5, 111.980003, -502.044006, -6.896770, 100.000000, 0, 0.000000, 0),
(402, 6, 111.685997, -530.880981, -11.080800, 100.000000, 0, 0.000000, 0),
(402, 7, 101.414391, -543.261536, -11.078655, 100.000000, 0, 0.000000, 0),
(402, 8, 71.099915, -545.676331, -15.245277, 100.000000, 0, 0.000000, 0),
(402, 9, 49.800423, -563.572266, -19.413242, 100.000000, 0, 0.000000, 0),
(402, 10, 50.438400, -631.018005, -25.108200, 100.000000, 0, 0.000000, 400);
DELETE FROM `creature_movement_scripts` WHERE `id`=400;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (400, 0, 20, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Pusillin - Move Random');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (400, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Add Gossip Flag');
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5709, 6877, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5710, 6878, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5711, 6879, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5712, 6880, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5713, 6881, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5709, 0, 0, 'Game? Are you crazy?', 9352, 1, 1, -1, 0, 5709, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5710, 0, 0, 'Why you little...', 9355, 1, 1, -1, 0, 5710, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5711, 0, 0, 'Mark my words, I will catch you, imp. And when I do!', 9356, 1, 1, -1, 0, 5711, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5712, 0, 0, 'DIE!', 9359, 1, 1, -1, 0, 5712, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5713, 0, 0, 'Prepare to meet your maker.', 9362, 1, 1, -1, 0, 5713, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=5709;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5709, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9349, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5709, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Remove Gossip Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5709, 0, 84, 5710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Gossip Menu');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5709, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Run');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5709, 1, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 400, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Start Waypoints');
DELETE FROM `gossip_scripts` WHERE `id`=5710;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5710, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9353, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5710, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Remove Gossip Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5710, 0, 84, 5711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Gossip Menu');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5710, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Run');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5710, 1, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 401, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Start Waypoints');
DELETE FROM `gossip_scripts` WHERE `id`=5711;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9357, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5711, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Remove Gossip Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5711, 0, 84, 5712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Gossip Menu');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5711, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Run');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5711, 1, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 402, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Start Waypoints');
DELETE FROM `gossip_scripts` WHERE `id`=5712;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9360, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5712, 0, 84, 5713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Gossip Menu');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5712, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Move Idle');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5712, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Run');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5712, 1, 3, 0, 0, 69, 3, 0, 0, 0, 0, 0, 0, 0, 0, 12.7601, -706.167, -12.6426, 2.99199, 0, 'Pusillin - Move');
DELETE FROM `gossip_scripts` WHERE `id`=5713;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18.19, -701.15, -12.64, 0, 0, 'Pusillin - Set Home Position');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9363, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 0, 22, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Set Faction');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 0, 15, 22735, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Cast Spell Spirit of Runn Tum');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8.21669, -668.359, -12.5593, 5.67232, 0, 'Pusillin - Summon Creature Wildspawn Imp 1');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15.2662, -675.445, -12.5593, 5.32325, 0, 'Pusillin - Summon Creature Wildspawn Imp 2');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 22.6441, -682.062, -12.5593, 0.10472, 0, 'Pusillin - Summon Creature Wildspawn Imp 3');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 22.1026, -698.083, -12.5593, 4.59022, 0, 'Pusillin - Summon Creature Wildspawn Imp 4');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5713, 1, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 13.0535, -708.63, -12.5593, 5.89921, 0, 'Pusillin - Summon Creature Wildspawn Imp 5');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (143540, 'Dire Maul - Pusillin', 14145, 100, 1, 0, 0, 0, 1, 4, 8, 8, 0, 22424, 100, 1, 0, 0, 64, 2, 10, 10, 18, 0, 15228, 100, 1, 0, 0, 8, 1, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5709, `script_name`='', `spell_list_id`=143540, `faction`=35, `flags_extra`=`flags_extra` | 16777216 WHERE `entry`=14354;

-- Niby the Almighty
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5845, 7001);
UPDATE `creature_template` SET `gossip_menu_id`=5845 WHERE `entry`=14469;

-- Riggle Bassbait <Fishmaster>
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6421, 7614);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6421, 7714, 7714);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7714, 12, 15, 0, 0, 0, 1);
UPDATE `creature_template` SET `gossip_menu_id`=6421, `npc_flags`=3 WHERE `entry`=15077;

-- Rutherford Twing <Defilers Supply Officer>
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6521, 7723);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6521, 0, 1, 'What goods have I earned the right to purchase from the Defilers?', 10623, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6521, `npc_flags`=16391 WHERE `entry`=15126;

-- Cloud Skydancer <Hippogryph Master>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6563, 0, 2, 'I need a ride.', 3409, 4, 8, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6563 WHERE `entry`=15177;

-- Geologist Larksbane
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6532, 7734);
UPDATE `creature_template` SET `gossip_menu_id`=6532 WHERE `entry`=15183;

-- Commander Stronghammer <Alliance Ambassador>
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1630, 11, 0, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1631, 11, 1, 1, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`) VALUES (8055, 1, 0, 0, 0, 0, 0, 0, 0, 11263, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6678, 7949);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6678, 8055, 1631);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6679, 7951);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6680, 7952);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6681, 7953);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6682, 7954);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6683, 7955);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6759, 8071);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 0, 0, 'What is the Ahn\'Qiraj war effort?', 11120, 1, 1, 6759, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 1, 0, 'How many metal bars have the Alliance collected so far?', 11135, 1, 1, 6679, 0, 0, 0, NULL, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 2, 0, 'How many herbs have the Alliance collected so far?', 11137, 1, 1, 6680, 0, 0, 0, NULL, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 3, 0, 'How many leather skins have the Alliance collected so far?', 11139, 1, 1, 6681, 0, 0, 0, NULL, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 4, 0, 'How many bandages have the Alliance collected so far?', 11141, 1, 1, 6682, 0, 0, 0, NULL, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6678, 5, 0, 'How many cooked goods have the Alliance collected so far?', 11143, 1, 1, 6683, 0, 0, 0, NULL, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6679, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6680, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6681, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6682, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6683, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6759, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6678, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6678 WHERE `entry`=15458;

-- Field Marshal Snowfall <War Effort Commander>
DELETE FROM `conditions` WHERE `condition_entry` IN (260, 261);
DELETE FROM `gossip_menu` WHERE `entry`=6772;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6772, 8082);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6772, 8084, 1631);
UPDATE `gossip_menu_option` SET `condition_id`=1630 WHERE `menu_id`=6772 && `id` > 0;
-- UPDATE `creature_template` SET `gossip_menu_id`=6772 WHERE `entry`=15701;

-- Lieutenant General Andorov
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6629, 7883); -- <Andorov looks at you grimly.>$B$BIf it bleeds, we can kill it.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7047, 8305); -- My mission is compete. I may have some spare supplies if you need any.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7048, 8304); -- We're on orders from on high to destroy Rajaxx. Terminate with extreme prejudice if you want to get technical.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6629, 0, 0, 'Let\'s find out.', 11026, 1, 1, -1, 0, 6629, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=6629;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6629, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Start Event');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (7047, 0, 1, 'Let\'s see what you have.', 11820, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6629, `flags_extra`=`flags_extra` | 16777216 WHERE `entry`=15471;

-- Priestess of the Moon
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6859, 8164);
UPDATE `creature_template` SET `gossip_menu_id`=6859, `npc_flags`=1, `flags_extra`=`flags_extra` | 16777216 WHERE `entry`=15634;

-- Warlord Gorchuk <War Effort Commander>
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6778, 8092);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6778, 8094, 1631);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6779, 8209);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6780, 8096);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6781, 8097);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6782, 8098);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6783, 8099);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6784, 8100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 0, 0, 'What is the Ahn\'Qiraj war effort?', 11120, 1, 1, 6779, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 1, 0, 'How many metal bars have the Horde collected so far?', 11122, 1, 1, 6780, 0, 0, 0, 0, NULL, 0, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 2, 0, 'How many herbs have the Horde collected so far?', 11124, 1, 1, 6781, 0, 0, 0, 0, NULL, 0, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 3, 0, 'How many leather skins have the Horde collected so far?', 11126, 1, 1, 6782, 0, 0, 0, 0, NULL, 0, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 4, 0, 'How many bandages have the Horde collected so far?', 11128, 1, 1, 6783, 0, 0, 0, 0, NULL, 0, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6778, 5, 0, 'How many cooked goods have the Horde collected so far?', 11130, 1, 1, 6784, 0, 0, 0, 0, NULL, 0, 1630);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6779, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6780, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6781, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6782, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6783, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6784, 0, 0, 'I want to ask you about something else.', 11132, 1, 1, 6778, 0, 0, 0, 0, NULL, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6778 WHERE `entry`=15700;

-- General Zog <Horde Ambassador>
DELETE FROM `conditions` WHERE `condition_entry` IN (262, 263);
DELETE FROM `gossip_menu` WHERE `entry`=6665;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6665, 7942);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6665, 8006, 1631);
-- UPDATE `creature_template` SET `gossip_menu_id`=6665 WHERE `entry`=15539;

-- Senior Sergeant Taiga <War Effort Recruiter>
DELETE FROM `gossip_menu` WHERE `entry`=20050;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6790, 7969, 0, 264);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6790, 8107);
UPDATE `creature_template` SET `gossip_menu_id`=6790 WHERE `entry`=15702;

-- Senior Sergeant Grimsford <War Effort Recruiter>
DELETE FROM `gossip_menu` WHERE `entry`=20051;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6788, 8084, 0, 264);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6788, 8105);
UPDATE `creature_template` SET `gossip_menu_id`=6788 WHERE `entry`=15703;

-- Senior Sergeant Kai'jin <War Effort Recruiter>
DELETE FROM `gossip_menu` WHERE `entry`=20052;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6789, 8094, 0, 264);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6789, 8106);
UPDATE `creature_template` SET `gossip_menu_id`=6789 WHERE `entry`=15704;

-- Master Sergeant Fizzlebolt <War Effort Recruiter>
DELETE FROM `gossip_menu` WHERE `entry`=20053;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6785, 8006, 0, 264);
-- INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6785, 8101);
UPDATE `creature_template` SET `gossip_menu_id`=6785 WHERE `entry`=15707;

-- Master Sergeant Moonshadow <War Effort Recruiter>
DELETE FROM `gossip_menu` WHERE `entry`=20055;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6787, 7969, 0, 264);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6787, 8104);
UPDATE `creature_template` SET `gossip_menu_id`=6787 WHERE `entry`=15709;

-- Darnassus Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6803 WHERE `entry`=15731;

-- Gnomeregan Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6804 WHERE `entry`=15733;

-- Ironforge Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6805 WHERE `entry`=15734;

-- Stormwind Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6806 WHERE `entry`=15735;

-- Orgrimmar Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6808 WHERE `entry`=15736;

-- Darkspear Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6807 WHERE `entry`=15737;

-- Undercity Commendation Officer
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6810, 8133);
UPDATE `creature_template` SET `gossip_menu_id`=6810 WHERE `entry`=15738;

-- Thunder Bluff Commendation Officer
UPDATE `creature_template` SET `gossip_menu_id`=6809 WHERE `entry`=15739;

-- Officer Gothena <Undercity Commendations>
UPDATE `creature_template` SET `gossip_menu_id`=6810 WHERE `entry`=15768;

-- Colossus Researcher Sophia
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6840, 8147);
UPDATE `creature_template` SET `gossip_menu_id`=6840, `npc_flags`=3 WHERE `entry`=15797;

-- Colossus Researcher Nestor
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6839, 8146);
UPDATE `creature_template` SET `gossip_menu_id`=6839, `npc_flags`=3 WHERE `entry`=15798;

-- Colossus Researcher Eazel
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (6838, 8145);
UPDATE `creature_template` SET `gossip_menu_id`=6838, `npc_flags`=3 WHERE `entry`=15799;

-- Ysida Harmon
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7091, 8344);
UPDATE `creature_template` SET `gossip_menu_id`=7091, `npc_flags`=0 WHERE `entry`=16031;

-- Garon Hutchins
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`) VALUES (8960, 1, 0, 0, 0, 0, 0, 0, 0, 14018, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (7418, 8960);
UPDATE `creature_template` SET `gossip_menu_id`=7418, `npc_flags`=5 WHERE `entry`=16543;

-- Phalanx
UPDATE `creature_template` SET `gossip_menu_id`=2283 WHERE `entry`=9502;

-- Braenna Flintcrag <Priest Trainer>
DELETE FROM `gossip_menu` WHERE `entry`=4558;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 4435, 0, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 4436, 0, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8254, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8296, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4558, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4558, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4558, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4558, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4558, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4558 WHERE `entry`=5142;

-- Toldren Deepiron <Priest Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 4435, 0, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 4436, 0, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8254, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8296, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4560, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4560, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4560, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4560, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4560, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4560 WHERE `entry`=5143;

-- Juli Stormkettle <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 560, 0, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 561, 0, 91);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8254, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8296, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4554, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4554, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4554, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4554, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4554, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4554 WHERE `entry`=5145;

-- Vance Undergloom <Journeyman Enchanter>
UPDATE `gossip_menu` SET `entry`=4202 WHERE `entry`=4167;
UPDATE `gossip_menu_option` SET `menu_id`=4202 WHERE `menu_id`=4167;
UPDATE `creature_template` SET `gossip_menu_id`=4202 WHERE `entry`=5695;

-- Dink <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 560, 0, 90);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 561, 0, 91);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8254, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8296, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (4553, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4553, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4553, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4553, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4553, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4553 WHERE `entry`=7312;

-- Scholomance Student
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3647, 4445, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3647 WHERE `entry`=10475;

-- High Priest Rohan <Priest Trainer>
DELETE FROM `gossip_menu` WHERE `entry`=3642;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 4435, 0, 95);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 4436, 0, 94);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8254, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8296, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (3642, 8298, 0, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3642, 0, 3, 'I seek more training in the priestly ways.', 7157, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 94);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3642, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 163);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3642, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3642, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=3642 WHERE `entry`=11406;

-- Prince Tortheldrin
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (5736, 6909, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5736, `npc_flags`=1, `unit_flags`=256 WHERE `entry`=11486;

-- Majordomo Executus
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4093, 4995, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4108, 5012, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4109, 5011, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4093, 0, 0, 'Tell me more.', 7675, 1, 1, 4109, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4108, 0, 0, 'You challenged us and we have come. Where is this master you speak of?\n', 7646, 1, 1, -1, 0, 4108, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4109, 0, 0, 'What else do you have to say?', 7673, 1, 1, 4108, 0, 0, 0, 0, '', 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=4108;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4108, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Majordomo Executus - Start Event');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7649, 0, 0, 0, 0, 0, 0, 0, 0, 'Majordomo Executus - Say Text');
UPDATE `creature_template` SET `gossip_menu_id`=4093 WHERE `entry`=12018;

-- Nelson the Nice
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5871, 9, 7636, 1, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5871, 7044, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5871, 0, 0, 'A gnome? How pathetic. Face me, demon!', 9753, 1, 1, -1, 0, 5871, 0, 0, '', 0, 5871);
DELETE FROM `gossip_scripts` WHERE `id`=5871;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5871, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nelson the Nice - Start Event');
UPDATE `creature_template` SET `gossip_menu_id`=5871 WHERE `entry`=14536;

-- Why is this in the world db?
DROP TABLE `playerbot`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
