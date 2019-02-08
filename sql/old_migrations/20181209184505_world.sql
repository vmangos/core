DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181209184505');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181209184505');
-- Add your query below.


-- Gann Stonespire
UPDATE `creature_template` SET `gossip_menu_id` = 445 WHERE `entry` = 3341;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 13173;

DELETE FROM `gossip_menu` WHERE `entry` IN (445, 446);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(445, 942),
(446, 943);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=445;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(445,0,0,"Can you tell me where Brine is?",3013,1,1,446,0,0,0,"",0,92);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
