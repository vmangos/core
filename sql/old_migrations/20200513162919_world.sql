DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200513162919');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200513162919');
-- Add your query below.


-- Add missing gossip texts and option for Trixie Quikswitch.
INSERT INTO `gossip_menu` VALUES (4147, 5155, 44);
INSERT INTO `gossip_menu` VALUES (4147, 5156, 391);
INSERT INTO `gossip_menu` VALUES (4147, 5153, 392);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4147, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 391);

-- Add missing gossip option for Jemma Quikswitch.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4137, 0, 3, 'Train me.', 3266, 5, 16, 0, 0, 0, 0, 0, '', 0, 0);

-- Assign condition to Springspindle Fizzlegear's training option.
UPDATE `gossip_menu_option` SET `condition_id`=392 WHERE `menu_id`=4150 && `id`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
