DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181204152456');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181204152456');
-- Add your query below.


-- Add gossip menu for Stamp Thunderhorn.
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (54400, 56621);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (6234, 7387, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES (6234, 0, 1, 'Mmm... food.', 10185, 3, 4, 0, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6234 WHERE `entry`=14845;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
