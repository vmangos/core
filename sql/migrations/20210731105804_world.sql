DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210731105804');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210731105804');
-- Add your query below.


-- Father Inigo Montoy Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7138, 8400);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7098, 0, 0, 'Tell me about faith, Father.', 12045, 1, 1, 7138);

-- Commander Eligor Dawnbringer Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7110, 8367);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7097, 0, 0, 'What is Redemption armor?', 11976, 1, 1, 7110);

-- Mataus the Wrathcaster Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7136, 8399),
(7137, 8398);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7105, 0, 0, 'What is Plagueheart armor?', 12041, 1, 1, 7137),
(7137, 1, 0, 'I also seek such power.', 12043, 1, 1, 7136);

-- Jessica Chambers Gossip
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`) VALUES
(7173, 5, 0, 'Tell me about dungeons I could explore.', 0, 1, 1);
UPDATE `gossip_menu_option` SET `action_menu_id`=6025, `action_poi_id`=0, `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=7173 && `id`=5;

-- Korfax Gossip
UPDATE `gossip_menu_option` SET `action_menu_id` = 7108 WHERE `menu_id` = 7099 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8363 WHERE `entry` = 7108 AND `text_id` = 8365;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7107 AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7108, 0, 0, 'Continue please.', 0, 1, 1, 7107);

-- Huntsman Loepold Gossip
UPDATE `gossip_menu_option` SET `action_menu_id` = 7112 WHERE `menu_id` = 7102 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8368 WHERE `entry` = 7112 AND `text_id` = 8370;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7111 AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7112, 0, 0, 'Continue please.', 0, 1, 1, 7111);

-- Rohan the Assassin Gossip
UPDATE `gossip_menu_option` SET `action_menu_id` = 7122 WHERE `menu_id` = 7101 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8380 WHERE `entry`= 7122 AND `text_id` = 8384;
UPDATE `gossip_menu` SET `text_id` = 8381 WHERE `entry`=7121 AND `text_id`=8383;
UPDATE `gossip_menu_option` SET `action_menu_id` = 7119 WHERE `menu_id` = 7120 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8383 WHERE `entry` = 7119 AND `text_id` = 8381;
UPDATE `gossip_menu` SET `text_id` = 8384 WHERE `entry` = 7118 AND `text_id` = 8380;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7118 AND `id` = 0;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7121, 0, 0, 'What? Bonescythe?', 12007, 1, 1, 7120),
(7119, 0, 0, 'Hey wait, Gadgetzan has a disco?', 12011, 1, 1, 7118);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7122, 0, 0, 'So what brings you to Light\'s Hope?', 12005, 1, 1, 7121);

-- Rayne
UPDATE `gossip_menu_option` SET `action_menu_id` = 7125 WHERE `menu_id` = 7104 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8385 WHERE `entry` = 7125 AND `text_id` = 8387;
UPDATE `gossip_menu_option` SET `action_menu_id` = 7123 WHERE `menu_id` = 7124 AND `id` = 0;
UPDATE `gossip_menu` SET `text_id` = 8387 WHERE `entry` = 7123 AND `text_id` = 8385;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7123 AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7125, 0, 0, 'Are these lands not beyond healing? They look pretty beat up.', 12017, 1, 1, 7124);

-- Rimblat Earthshatter Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7113, 8371),
(7114, 8372),
(7115, 8373);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`) VALUES
(7103, 0, 0, 'What brings a tauren to the Plaguelands?', 11983, 1, 1, 7113),
(7113, 0, 0, 'Continue please.', 11985, 1, 1, 7114),
(7114, 0, 0, 'Continue please.', 11985, 1, 1, 7115);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`) VALUES
(8371, 11984),
(8372, 11986),
(8373, 11987);

-- Craftsman Wilhelm Gossip
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`) VALUES
(7219, 0, 1, 'Show me your wares, Wilhelm.', 12274, 3, 4);

-- Add Exalted Condition to Gossips
UPDATE `gossip_menu_option` SET `condition_id` = 74 WHERE `menu_id` IN (7099, 7098, 7097, 7101, 7102, 7105, 7103, 7104) AND `id` = 0;

-- Increase Repeat Time For Chapel Event
DELETE FROM `creature_ai_events` WHERE `creature_id`=16115;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1611501, 16115, 0, 1, 0, 100, 1, 0, 0, 900000, 900000, 1611501, 0, 0, 'Commander Eligor Dawnbringer - OOC - Start Script');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1611502, 16115, 0, 1, 1, 100, 1, 1000, 3000, 3000, 5000, 1611502, 0, 0, 'Commander Eligor Dawnbringer - OOC (Phase 1) - Start Script');

-- Assign broadcast text id for some options that are missing it.
UPDATE `gossip_menu_option` SET `option_broadcast_text`=3370 WHERE `option_broadcast_text`=0 && `option_text`='I want to browse your goods.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=4432 WHERE `option_broadcast_text`=0 && `option_text`='Continue please.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=4657 WHERE `option_broadcast_text`=0 && `option_text`='I\'m not a journeyman herbalist -- am I able to still assist you in your work?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=9882 WHERE `option_broadcast_text`=0 && `option_text`='Tell me about dungeons I could explore.';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=11823 WHERE `option_broadcast_text`=0 && `option_text`='Does that heart mean you\'re looking for love?';
UPDATE `gossip_menu_option` SET `option_broadcast_text`=11835 WHERE `option_broadcast_text`=0 && `option_text`='How are the gift standings?  Who\'s the most popular?';

-- Fix Scholomance option in innkeeper meetingstone menu.
UPDATE `gossip_menu` SET `entry`=6074 WHERE `text_id`=7224;
UPDATE `gossip_menu_option` SET `action_menu_id`=6074 WHERE `menu_id`=50234 && `id`=1;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
