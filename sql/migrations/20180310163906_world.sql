DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180310163906');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180310163906');
-- Add your query below.

UPDATE `creature_template` SET `gossip_menu_id`=12919, `npcflag`=7, `ScriptName`='' WHERE `entry`=12919;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (12919, 7638, 0),(12919, 7639, 8227),(12920, 7640, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (8227, 8, 8227);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(12919, 0, 0, 'I want to catch Gahz\'ranka!  Tell me how!', 10490, 1, 1, 12920, 0, 0, 0, 0, '', 0, 8227),
(12920, 0, 1, 'Nat, I want to buy your mudskunk lures!', 10492, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
