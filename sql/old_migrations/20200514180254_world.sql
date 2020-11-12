DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200514180254');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200514180254');
-- Add your query below.


-- Lysheana has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001270);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4161;
DELETE FROM `gossip_menu` WHERE `entry`=7487;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7487;
UPDATE `creature_template` SET `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=4161;

-- Shalumon has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001471);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5191;
DELETE FROM `gossip_menu` WHERE `entry`=9369;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9369;
UPDATE `creature_template` SET `npc_flags`=4, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5191;

-- Garyl has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001468);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5188;
DELETE FROM `gossip_menu` WHERE `entry`=9366;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9366;
UPDATE `creature_template` SET `npc_flags`=1028, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5188;

-- Thrumn has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001469);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5189;
DELETE FROM `gossip_menu` WHERE `entry`=9367;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9367;
UPDATE `creature_template` SET `npc_flags`=1028, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5189;

-- Merill Pleasance has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001470);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5190;
DELETE FROM `gossip_menu` WHERE `entry`=9368;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9368;
UPDATE `creature_template` SET `npc_flags`=1028, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5190;

-- Lyesa Steelbrow has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001397);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5049;
DELETE FROM `gossip_menu` WHERE `entry`=9316;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9316;
UPDATE `creature_template` SET `npc_flags`=4, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5049;

-- Edward Remington has no gossip in classic.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001398);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5052;
DELETE FROM `npc_vendor` WHERE `entry`=5052;
DELETE FROM `gossip_menu` WHERE `entry`=9317;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9317;
UPDATE `creature_template` SET `npc_flags`=1024, `gossip_menu_id`=0, `ai_name`='' WHERE `entry`=5052;

-- Correct gossip menu for Rebecca Laughlin.
INSERT INTO `gossip_menu` VALUES (707, 1259, 0);
UPDATE `gossip_menu` SET `entry`=707 WHERE `entry`=9370;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9370;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (707, 0, 1, 'I want to browse your goods.', 3370, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (707, 1, 8, 'I want to create a guild crest.', 3415, 11, 1024, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (707, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 402, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (707, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 403, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=707 WHERE `entry`=5193;

-- Correct gossip menu for Arias'ta Bladesinger.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 1217, 98);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 5725, 99);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8244, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8283, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8285, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8291, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8296, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (4581, 8298, 455);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4581, 0, 3, 'I require warrior training.', 3147, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4581, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, '', 0, 133);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4581, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 410, 0, 0, NULL, 0, 462);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4581, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 411, 0, 0, NULL, 0, 461);
UPDATE `creature_template` SET `gossip_menu_id`=4581 WHERE `entry`=4087;

-- Add missing texts to Henry Stern.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1274, 29, 185, 175, 0, 0, 0); -- Cooking skill below 175.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1275, 29, 171, 180, 0, 0, 0); -- Alchemy skill below 180.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1501, 2173, 1274);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (1442, 2174, 1275);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1443;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1443, 0, 0, 'You can cook?  So can I!  Is there a recipe you can teach me?', 4535, 1, 1, 1501, 0, 144300, 0, 0, '', 0, 1271);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1443, 1, 0, 'You can cook?  So can I!  Is there a recipe you can teach me?', 4535, 1, 1, 1501, 0, 0, 0, 0, '', 0, 1274);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1443, 2, 0, 'You\'re an alchemist?  So am I.  Perhaps you can teach me what you know...', 4537, 1, 1, 1442, 0, 144301, 0, 0, '', 0, 1272);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (1443, 3, 0, 'You\'re an alchemist?  So am I.  Perhaps you can teach me what you know...', 4537, 1, 1, 1442, 0, 0, 0, 0, '', 0, 1275);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
