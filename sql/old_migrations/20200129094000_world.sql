DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200129094000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200129094000');
-- Add your query below.

-- Added gossip for npc 2239 (Drull)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (270, 9, 498, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (262, 759, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (261, 760, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (262, 0, 0, 'How can I free you?', 2743, 1, 1, 261, 0, 0, 0, 0, NULL, 0, 270);
UPDATE `creature_template` SET `gossip_menu_id`=262 WHERE `entry`=2239;


END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
