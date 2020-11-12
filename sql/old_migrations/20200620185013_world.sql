DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620185013');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620185013');
-- Add your query below.


-- Lord Victor Nefarius
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5981, 34, 6, 3, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5981, 7134, 0);
INSERT INTO `gossip_menu` VALUES (6045, 7199, 0);
INSERT INTO `gossip_menu` VALUES (6046, 7198, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5981, 0, 0, 'I\'ve made no mistakes.', 9902, 1, 1, 6046, 0, 0, 0, 0, NULL, 0, 5981);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6045, 0, 0, 'Please do.', 9906, 1, 1, -1, 0, 604500, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6046, 0, 0, 'You have lost your mind, Nefarius. You speak in riddles.', 9904, 1, 1, 6045, 0, 0, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=604500;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (604500, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Stand Up');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (604500, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Remove Gossip Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (604500, 0, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Add Not Selectable Flag');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (604500, 0, 37, 6045, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Set Data to Start Battle');
UPDATE `creature_template` SET `gossip_menu_id`=5981 WHERE `entry`=10162;

-- Witch Doctor Mau'ari
DELETE FROM `gossip_menu` WHERE `entry`=2703;
INSERT INTO `gossip_menu` VALUES (2703, 3375, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (256, 8, 975, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2703, 3377, 256);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (257, 23, 12384, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (258, -1, 256, 257, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (2704, 3382, 0);
INSERT INTO `gossip_menu` VALUES (2705, 3383, 0);
INSERT INTO `gossip_menu` VALUES (50300, 3425, 0);
DELETE FROM `gossip_scripts` WHERE `id`=270302;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (270302, 0, 15, 16351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Mau\'ari - Cast Spell ');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (259, 23, 12384, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (271, -1, 256, 259, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2703, 0, 0, 'How do I use the Cache of Mau\'ari?', 5662, 1, 1, 2704, 0, 0, 0, 0, '', 0, 258);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2703, 1, 0, 'What is E\'ko?', 5698, 1, 1, 2705, 0, 0, 0, 0, '', 0, 256);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (2703, 2, 0, 'I lost the Cache of Mau\'ari. What can I do?', 5758, 1, 1, 50300, 0, 270302, 0, 0, '', 0, 271);
UPDATE `creature_template` SET `gossip_menu_id`=2703, `script_name`='' WHERE `entry`=10307;

-- Vectus
INSERT INTO `gossip_menu` VALUES (3648, 4446, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3648 WHERE `entry`=10432;

-- Old Ironbark
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11491, 34, 4, 3, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (11492, -1, 3705, 11491, 0, 0, 0);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11491;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1149101, 11491, 11491, 1, 0, 100, 0, 1000, 1000, 0, 0, 1149101, 0, 0, 'Old Ironbark - Update Entry on Zevrim Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1149101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1149101, 0, 27, 14241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Update Entry');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1149101, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9104, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Say Text');
INSERT INTO `gossip_menu` VALUES (5601, 6694, 0);
INSERT INTO `gossip_menu` VALUES (5601, 6695, 11492);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5601, 0, 0, 'Thank you, Ironbark. We are ready for you to open the door.', 9103, 1, 1, -1, 0, 560100, 0, 0, NULL, 0, 11492);
DELETE FROM `gossip_scripts` WHERE `id`=560100;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9099, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 0, 3, 0, 10000, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 123.706, -278.828, -55.868, -10, 0, 'Old Ironbark - Move');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Set Data');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 10, 80, 2, 0, 0, 0, 179549, 10, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Set Door State');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9100, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Say Text');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 10, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Emote');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (560100, 12, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Die');
UPDATE `creature_template` SET `gossip_menu_id`=5601, `ai_name`='EventAI', `script_name`='' WHERE `entry`=11491;
UPDATE `creature_template` SET `gossip_menu_id`=5601, `script_name`='' WHERE `entry`=14241;

-- Cork Gizelton
INSERT INTO `gossip_menu` VALUES (3961, 4813, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3961 WHERE `entry`=11625;

-- Rigger Gizelton
INSERT INTO `gossip_menu` VALUES (3963, 4815, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3963 WHERE `entry`=11626;

-- Maggran Earthbinder
INSERT INTO `gossip_menu` VALUES (4271, 5443, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4271 WHERE `entry`=11860;

-- Vendor-Tron 1000
INSERT INTO `gossip_menu` VALUES (4003, 4857, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4003, 0, 1, 'I am curious to see what a bucket of bolts has to offer.', 7501, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4003, `script_name`='' WHERE `entry`=12245;
UPDATE `creature` SET `spawn_flags`=64 WHERE `id`=12245;

-- Super-Seller 680
INSERT INTO `gossip_menu` VALUES (4002, 4856, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4002, 0, 1, 'Let me take a look at what you have to offer.', 7487, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=4002, `npc_flags`=5, `script_name`='' WHERE `entry`=12246;
UPDATE `creature` SET `spawn_flags`=64 WHERE `id`=12246;

-- Doctor Gregory Victor
DELETE FROM `gossip_menu` WHERE `entry`=5382 && `text_id`=6413;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5381, 6413, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5381, 6414, 66);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5381, 6573, 396);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5381, 0, 0, 'Teach me how to create and apply a Heavy Mageweave Bandage, Doctor.', 8971, 1, 1, -1, 0, 5382, 0, 0, '', 0, 193);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5381, 1, 0, 'Teach me how to create and apply a Runecloth Bandage, Doctor.', 8972, 1, 1, -1, 0, 5383, 0, 0, '', 0, 194);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5381, 2, 0, 'Teach me how to create and apply a Heavy Runecloth Bandage, Doctor.', 8973, 1, 1, -1, 0, 5384, 0, 0, '', 0, 195);
UPDATE `creature_template` SET `gossip_menu_id`=5381 WHERE `entry`=12920;

-- Guard Fengus
UPDATE `gossip_menu` SET `entry`=5731 WHERE `entry`=5734;
UPDATE `gossip_menu_option` SET `menu_id`=5731, `option_icon`=0, `action_menu_id`=5730, `action_script_id`=573100 WHERE `menu_id`=5734;
UPDATE `gossip_scripts` SET `id`=573100 WHERE `id`=1;
INSERT INTO `gossip_menu` VALUES (5730, 6904, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5731 WHERE `entry`=14321;

-- Guard Slip'kik
UPDATE `gossip_menu_option` SET `option_icon`=0, `action_menu_id`=5732, `action_script_id`=573300 WHERE `menu_id`=5733;
UPDATE `gossip_scripts` SET `id`=573300 WHERE `id`=2;
INSERT INTO `gossip_menu` VALUES (5732, 6906, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=5733 WHERE `entry`=14323;

-- Guard Mol'dar
UPDATE `gossip_menu_option` SET `option_icon`=0, `action_menu_id`=5734, `action_script_id`=573500 WHERE `menu_id`=5735;
UPDATE `gossip_scripts` SET `id`=573500 WHERE `id`=3;
INSERT INTO `gossip_menu` VALUES (5734, 6908, 0);
-- UPDATE `creature_template` SET `gossip_menu_id`=5735 WHERE `entry`=14326;

-- Cho'Rush the Observer
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5742, 1, 22799, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5742, 6918, 5742);
INSERT INTO `gossip_menu` VALUES (5742, 6923, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5742 WHERE `entry`=14324;

-- Mizzle the Crafty
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5708, 1, 22799, 0, 0, 0, 1);
INSERT INTO `gossip_menu` VALUES (5708, 6876, 0);
INSERT INTO `gossip_menu` VALUES (5708, 6895, 5742);
INSERT INTO `gossip_menu` VALUES (5715, 6882, 0);
INSERT INTO `gossip_menu` VALUES (5740, 6916, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5708, 0, 0, 'I\'m the new king?  What are you talking about?', 9365, 1, 1, 5715, 0, 0, 0, 0, NULL, 0, 5708);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5708, 1, 0, 'Henchmen?  Tribute?', 9440, 1, 1, 5740, 0, 0, 0, 0, NULL, 0, 5742);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5715, 0, 0, 'It\'s good to be the king!  Now, let\'s get back to what you were talking about before...', 9441, 1, 1, -1, 0, 571500, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5740, 0, 0, 'Well then... show me the tribute!', 9367, 1, 1, -1, 0, 574000, 0, 0, NULL, 0, 5740);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5740, 34, 6, 3, 0, 0, 1);
DELETE FROM `gossip_scripts` WHERE `id`=571500;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (571500, 0, 15, 22799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mizzle the Crafty - Cast Spell Kind of Gordok');
DELETE FROM `gossip_scripts` WHERE `id`=574000;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (574000, 0, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5740, 'Mizzle the Crafty - Set Data');
UPDATE `creature_template` SET `gossip_menu_id`=5708 WHERE `entry`=14353;

-- Sayge
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (855, 1, 23768, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (856, 1, 23769, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (863, -2, 855, 856, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (857, 1, 23767, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (858, 1, 23738, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (864, -2, 857, 858, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (867, -2, 863, 864, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (859, 1, 23766, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (860, 1, 23737, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (865, -2, 859, 860, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (861, 1, 23736, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (862, 1, 23735, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (866, -2, 861, 862, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (868, -2, 865, 866, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (869, -2, 867, 868, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (870, -3, 869, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (6186, 7339, 870);
INSERT INTO `gossip_menu` VALUES (6186, 7393, 0);
INSERT INTO `gossip_menu` VALUES (6185, 7340, 0);
INSERT INTO `gossip_menu` VALUES (6187, 7341, 0);
INSERT INTO `gossip_menu` VALUES (6211, 7364, 0);
INSERT INTO `gossip_menu` VALUES (6212, 7365, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6211, 0, 0, 'I\'d love to get one of those written fortunes you mentioned!  I\'ve got the space in my inventory for it.', 10091, 1, 1, 6212, 0, 6211, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6187, 0, 0, 'I execute him as per my liege\'s instructions, and do it in such a manner that he suffers painfully before he dies as retribution for his crimes against my people.', 10075, 1, 1, 6211, 0, 618701, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6187, 1, 0, 'I execute him as per my liege\'s instructions, but doing so in as painless of a way as possible.  Justice must be served, but I can show some compassion.\n', 10076, 1, 1, 6211, 0, 618702, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6187, 2, 0, 'I risk my own life and free him so that he may prove his innocence.  If I can, I\'ll help him in any way.', 10077, 1, 1, 6211, 0, 618703, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6185, 0, 0, 'I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar.', 10049, 1, 1, 6187, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (6208, 7361, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6208, 0, 0, 'I confront the ruler on his malicious behavior, upholding my liege\'s honor at the risk of any future diplomacy.', 10079, 1, 1, 6211, 0, 620801, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6208, 1, 0, 'I not-so-quietly ignore the insult, hoping to instill a fear in the ruler that he may have gaffed.  I then inform my liege of the insult when I return.', 10080, 1, 1, 6211, 0, 620802, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6208, 2, 0, 'I quietly ignore the insult.  I will not tell my liege, as I am to secure peace at all costs.  It\'s only an insult - not a declaration of war.', 10081, 1, 1, 6211, 0, 618702, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6185, 1, 0, 'I turn over the man to my liege for punishment, as he has broken the law of the land and it is my sworn duty to enforce it.', 10050, 1, 1, 6208, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (6209, 7362, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6209, 0, 0, 'I would speak against my brother joining the order, rushing a permanent breech in our relationship.  He would be a danger to himself and those around him, and that is too great a risk hoping he would improve over time.', 10083, 1, 1, 6211, 0, 620901, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6209, 1, 0, 'I would speak for my brother joining the order, potentially risking the safety of the order.  I could help him with the order\'s regimens, and I\'d have faith in his ability to adapt and learn.', 10084, 1, 1, 6211, 0, 620902, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6209, 2, 0, 'I would create some surreptitious means to keep my brother out of the order.  I can keep him out without him being any bit wiser, thereby saving our familial bonds.', 10085, 1, 1, 6211, 0, 620903, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6185, 2, 0, 'I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family.', 10051, 1, 1, 6209, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu` VALUES (6210, 7363, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6210, 0, 0, 'I would show my liege the beast\'s ear and claim the beast\'s death as my own, taking the reward for my own use.  It is wrong to claim a deed as your own that someone else in fact did.\n', 10087, 1, 1, 6211, 0, 620802, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6210, 1, 0, 'I would show my liege the beast\'s ear and claim the beast\'s death as my own - after all, I did slay it.  I would then offer some of the reward to the destitute knight to help his family.', 10088, 1, 1, 6211, 0, 620801, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6210, 2, 0, 'I would remain silent about the kill and allow the knight to claim the reward to aid his family.', 10089, 1, 1, 6211, 0, 618703, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6185, 3, 0, 'I allow the man to take enough corn to feed his family for a couple of days, encouraging him to leave the land.', 10052, 1, 1, 6210, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (6186, 0, 0, 'I am ready to discover where my fortune lies!', 10047, 1, 1, 6185, 0, 0, 0, 0, '', 0, 870);
DELETE FROM `gossip_scripts` WHERE `id`=6211;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6211, 0, 15, 23765, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Darkmoon Faire Fortune');
DELETE FROM `gossip_scripts` WHERE `id`=618701;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (618701, 0, 15, 23768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Damage');
DELETE FROM `gossip_scripts` WHERE `id`=618702;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (618702, 0, 15, 23769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Resistance');
DELETE FROM `gossip_scripts` WHERE `id`=618703;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (618703, 0, 15, 23767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Armor');
DELETE FROM `gossip_scripts` WHERE `id`=620801;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (620801, 0, 15, 23738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Spirit');
DELETE FROM `gossip_scripts` WHERE `id`=620802;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (620802, 0, 15, 23766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Intelligence');
DELETE FROM `gossip_scripts` WHERE `id`=620901;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (620901, 0, 15, 23737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Stamina');
DELETE FROM `gossip_scripts` WHERE `id`=620902;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (620902, 0, 15, 23735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Strength');
DELETE FROM `gossip_scripts` WHERE `id`=620903;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (620903, 0, 15, 23736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sayge - Cast Spell Sayge\'s Dark Fortune of Agility');
UPDATE `creature_template` SET `gossip_menu_id`=6186, `script_name`='' WHERE `entry`=14822;

-- Zanza the Restless
INSERT INTO `gossip_menu` VALUES (6401, 7594, 0);
INSERT INTO `gossip_menu` VALUES (6402, 7598, 0);
INSERT INTO `gossip_menu` VALUES (6403, 7597, 0);
INSERT INTO `gossip_menu` VALUES (6404, 7596, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (6401, 0, 0, 'I think I have heard of this magic.', 10465, 1, 1, 6404);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (6403, 0, 0, 'What are the components?', 10469, 1, 1, 6402);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (6404, 0, 0, 'Arcanum? That sounds very familiar.', 10467, 1, 1, 6403);
UPDATE `creature_template` SET `gossip_menu_id`=6401 WHERE `entry`=15042;

-- Wickerman Guardian
INSERT INTO `gossip_menu` VALUES (6536, 7739, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6536, `npc_flags`=1 WHERE `entry`=15195;

-- Rachelle Gothena
INSERT INTO `gossip_menu` VALUES (6590, 7806, 0);
INSERT INTO `gossip_menu` VALUES (6593, 7812, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (6590, 0, 1, 'What Hallow\'s End candy do you have for sale?', 10815, 3, 4, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES (6590, 1, 0, 'What is there to do on Hallow\'s End?', 10816, 1, 1, 6593);
UPDATE `creature_template` SET `gossip_menu_id`=6590 WHERE `entry`=15354;

-- Officer Vu'Shalay
INSERT INTO `gossip_menu` VALUES (6807, 8127, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6807 WHERE `entry`=15761;

-- Officer Redblade
INSERT INTO `gossip_menu` VALUES (6808, 8131, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6808 WHERE `entry`=15765;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
