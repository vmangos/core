DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240404032513');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240404032513');
-- Add your query below.


-- Add missing npc texts.
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8253, 1, 11749);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8262, 1, 11758);
INSERT INTO `npc_text` (`ID`, `Probability0`, `BroadcastTextID0`) VALUES (8258, 1, 11754);

-- Correct wrong npc texts used in other menus.
UPDATE `gossip_menu` SET `text_id`=8253 WHERE `entry`=6994 AND `text_id`=8254;
UPDATE `gossip_menu` SET `text_id`=8258 WHERE `entry`=7008 AND `text_id`=8244;

-- Add gossip menu for Milstaff Stormeye <Portal Trainer> (Gender: Male) (Faction: Ironforge).
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6998, 8242, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6998, 8244, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6998, 8284, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6998, 8290, 0, 455);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6998, 8291, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6998, 0, 3, 'Please teach me.', 8442, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6998, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 27541, 0, 0, NULL, 0, 460);

-- Add gossip menu for Urek Thunderhorn <Hunter Trainer> (Gender: Male) (Faction: Thunder Bluff).
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7015, 8244, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7015, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7015, 8289, 0, 455);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7015, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7015, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7015, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7015, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7015, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 27549, 0, 0, NULL, 0, 460);


-- Nicholas Atwood <Gun Merchant> (Gender: Male) (Faction: Undercity)
UPDATE `gossip_menu` SET `text_id`=8284 WHERE `entry`=7060 AND `text_id`=8283;

-- Jemma Quikswitch <Journeyman Engineer> (Gender: Female) (Faction: Gnomeregan Exiles)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6991, 8243, 0, 460);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6991, 8245, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6991, 8282, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6991, 8285, 0, 454);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6991, 8286, 0, 458);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6991, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6991, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 27541, 0, 0, NULL, 0, 460);

-- Martin Lindsey <Arathi Basin Battlemaster> (Gender: Male) (Faction: The Defilers)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7014, 8262, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7014, 8284, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7014, 8290, 0, 455);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7014, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7014, 8242, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7014, 0, 9, 'I would like to go to the battleground.', 10355, 12, 2048, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7014, 1, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 27550, 0, 0, NULL, 0, 460);

-- Sagorne Creststrider <Shaman Trainer> (Gender: Male) (Faction: Thunder Bluff)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7031, 8244, 0, 461);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7031, 8283, 0, 459);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7031, 8289, 0, 455);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7031, 8291, 0, 458);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7031, 8296, 0, 460);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7031, 0, 3, 'Teach me the ways of the spirits.', 7658, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7031, 1, 0, 'I wish to unlearn my talents.', 8271, 1, 1, 4461, 0, 0, 0, 0, NULL, 0, 137);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7031, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 27549, 0, 0, NULL, 0, 460);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
