DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200606212902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200606212902');
-- Add your query below.


-- Grarnik Goodstitch <Expert Tailor>
INSERT INTO `gossip_menu` VALUES (4348, 5535, 0);
INSERT INTO `gossip_menu` VALUES (4348, 5539, 372);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (376, -1, 373, 3, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4348, 5833, 376);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (375, -1, 373, 2, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4348, 5536, 375);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4348, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 372);
UPDATE `creature_template` SET `gossip_menu_id`=4348 WHERE `entry`=2627;

-- Jaxin Chong <Expert Alchemist>
DELETE FROM `gossip_menu` WHERE `entry`=4127;
INSERT INTO `gossip_menu` VALUES (4127, 5074, 0);
INSERT INTO `gossip_menu` VALUES (4127, 5075, 361);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (365, -1, 362, 3, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4127, 5078, 365);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (364, -1, 362, 2, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (4127, 5513, 364);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4127;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4127, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 361);
UPDATE `creature_template` SET `gossip_menu_id`=4127 WHERE `entry`=2837;

-- Molthor <Hand of Rastakhan>
UPDATE `creature_template` SET `gossip_menu_id`=6235 WHERE `entry`=14875;

-- Vinchaxa <Servitor of Zanza>
INSERT INTO `gossip_menu` VALUES (6517, 7717, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6517 WHERE `entry`=15070;

-- Pephredo <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4520, 564, 90),
(4520, 565, 91),
(4520, 8263, 461),
(4520, 8283, 459),
(4520, 8285, 454),
(4520, 8291, 458),
(4520, 8296, 460),
(4520, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4520, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4520, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138),
(4520, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462),
(4520, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4520 WHERE `entry`=5882;

-- Enyo <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4518, 564, 90),
(4518, 565, 91),
(4518, 8263, 461),
(4518, 8283, 459),
(4518, 8285, 454),
(4518, 8291, 458),
(4518, 8296, 460),
(4518, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4518, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4518, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138),
(4518, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462),
(4518, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4518 WHERE `entry`=5883;

-- Deino <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4519, 564, 90),
(4519, 565, 91),
(4519, 8263, 461),
(4519, 8283, 459),
(4519, 8285, 454),
(4519, 8291, 458),
(4519, 8296, 460),
(4519, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4519, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4519, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138),
(4519, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462),
(4519, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4519 WHERE `entry`=5885;

-- Astor Hadren
INSERT INTO `gossip_menu` VALUES (126, 623, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (320, 9, 1886, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (319, 23, 7231, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (321, -1, 320, 319, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (125, 624, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (125, 0, 0, 'You\'ve got something I need, Astor. And I\'ll be taking it now.', 2591, 1, 1, -1, 0, 12501, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (126, 0, 0, 'You\'re Astor Hadren, right?', 2589, 1, 1, 125, 0, 0, 0, 0, '', 0, 321);
DELETE FROM `gossip_scripts` WHERE `id`=12501;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12501, 0, 22, 168, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Astor Hadren - Set Faction');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12501, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Astor Hadren - Start Attack');
UPDATE `creature_template` SET `gossip_menu_id`=126, `script_name`='' WHERE `entry`=6497;

-- Tabetha
INSERT INTO `gossip_menu` VALUES (2916, 3590, 0);
UPDATE `creature_template` SET `gossip_menu_id`=2916 WHERE `entry`=6546;

-- Innkeeper Bates <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=348 WHERE `entry`=6739;

-- Innkeeper Norman <Innkeeper>
INSERT INTO `gossip_menu` VALUES (343, 821, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(343, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(343, 2, 5, 'Make this inn my home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(343, 3, 1, 'Let me browse your goods.', 8097, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(343, 4, 0, 'Tell me about dungeons I could explore.', 9882, 1, 1, 6029, 0, 0, 0, 0, NULL, 0, 4500),
(343, 5, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(343, 6, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440);
UPDATE `creature_template` SET `gossip_menu_id`=343 WHERE `entry`=6741;

-- Innkeeper Gryshka <Innkeeper>
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(441, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(441, 1, 5, 'Make this inn your home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(441, 2, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(441, 3, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440),
(441, 4, 1, 'I want to browse your goods.', 3370, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(441, 5, 0, 'Tell me about dungeons I could explore.', 9882, 1, 1, 6029, 0, 0, 0, 0, NULL, 0, 4500);
UPDATE `creature_template` SET `gossip_menu_id`=441 WHERE `entry`=6929;

-- Uthel'nay <Mage Trainer>
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4517, 564, 90),
(4517, 565, 91),
(4517, 8263, 461),
(4517, 8283, 459),
(4517, 8285, 454),
(4517, 8291, 458),
(4517, 8296, 460),
(4517, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4517, 0, 3, 'I am interested in mage training.', 2522, 5, 16, 0, 0, 0, 0, 0, '', 0, 0),
(4517, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 138),
(4517, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, NULL, 0, 462),
(4517, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4517 WHERE `entry`=7311;

-- Gregan Brewspewer
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (283, 9, 3909, 0, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1801, 0, 0, 'How can I get Evoroot?', 4827, 1, 1, 1915, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1802, 0, 0, 'Can you tell me how I can get a Videre Elixir?', 4721, 1, 1, 1801, 0, 0, 0, NULL, 0, 283);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1802, 1, 1, 'Buy somethin\', will ya?', 4720, 3, 4, 0, 0, 0, 0, 0, '', 0, 283);
UPDATE `creature_template` SET `gossip_menu_id`=1802, `script_name`='' WHERE `entry`=7775;

-- Jediga
INSERT INTO `gossip_menu` VALUES (1402, 2035, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1402 WHERE `entry`=8587;

-- Kharan Mighthammer
INSERT INTO `gossip_menu` VALUES (1822, 2474, 3);
INSERT INTO `gossip_menu` VALUES (1822, 2473, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (340, 9, 4001, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (1830, 2475, 0);
INSERT INTO `gossip_menu` VALUES (1829, 2476, 0);
INSERT INTO `gossip_menu` VALUES (1828, 2477, 0);
INSERT INTO `gossip_menu` VALUES (1827, 2478, 0);
INSERT INTO `gossip_menu` VALUES (1826, 2479, 0);
INSERT INTO `gossip_menu` VALUES (1825, 2480, 0);
INSERT INTO `gossip_menu` VALUES (1824, 2481, 0);
INSERT INTO `gossip_menu` VALUES (1823, 2482, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1823, 0, 0, 'The door is open, Kharan. You are a free man.', 5257, 1, 1, -1, 0, 1823, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1824, 0, 0, 'Indeed.', 4748, 1, 1, 1823, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1825, 0, 0, 'Continue with your story please.', 4746, 1, 1, 1824, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1826, 0, 0, 'So you suspect that someone on the inside was involved? That they were tipped off?', 0, 1, 1, 1825, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1827, 0, 0, 'Continue...', 5256, 1, 1, 1826, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1828, 0, 0, 'So what happened?', 4742, 1, 1, 1827, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1829, 0, 0, 'Not enough, you need to tell me more.', 0, 1, 1, 1828, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1830, 0, 0, 'Gor\'shak is my friend, you can trust me.', 0, 1, 1, 1829, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1822, 0, 0, 'I need to know where the princess are, Kharan!', 0, 1, 1, 1830, 0, 0, 0, 0, '', 0, 340);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1099, 9, 4342, 0, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1822, 1, 0, 'All is not lost, Kharan!', 4734, 1, 1, 1828, 0, 0, 0, 0, '', 0, 1099);
DELETE FROM `gossip_scripts` WHERE `id`=1823;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1823, 0, 7, 4342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kharan Mighthammer - Complete Quest Kharan\'s Tale');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1823, 0, 7, 4001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kharan Mighthammer - Complete Quest What Is Going On?');
UPDATE `creature_template` SET `gossip_menu_id`=1822, `script_name`='' WHERE `entry`=9021;

-- Innkeeper Shul'kar <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=1582 WHERE `entry`=9356;

-- Innkeeper Kaylisk <Innkeeper>
UPDATE `creature_template` SET `gossip_menu_id`=441 WHERE `entry`=12196;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
