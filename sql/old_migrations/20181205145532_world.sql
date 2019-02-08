DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181205145532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181205145532');
-- Add your query below.


-- Add gossip menu for Flik
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (54417, 56625);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6231, 0, 1, 'You mean to tell me you sell frogs?', 10186, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6231 WHERE `entry` = 14860;

-- Add gossip menu for Lhara
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (54402, 56497);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6233, 7389, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6233, 0, 1, 'What do you have for sale?', 10182, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6233 WHERE `entry` = 14846;

-- Add gossip menu for Sylannia
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (54398, 56623);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6230, 7404, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6230, 0, 1, 'Show me the drinks!', 10179, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6230 WHERE `entry` = 14844;

-- Add gossip menu & fix gossip text for Maxima Blastenheimer
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (52415, 1182594);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(6574, 7790, 0),
(6575, 7789, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(6575, 0, 0, 'How do I use the cannon?', 10769, 1, 1, 6574, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id` = 6575 WHERE `entry` = 15303;

-- Add gossip menu for Quartermaster Lewis
DELETE FROM `npc_gossip` WHERE `npc_guid` = 48879;
UPDATE `creature_template` SET `gossip_menu_id` = 4107 WHERE `entry` = 491;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
