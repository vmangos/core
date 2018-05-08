DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180508203712');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180508203712');
-- Add your query below.


-- Gossip menu for Marin Noggenfogger.
DELETE FROM npc_gossip WHERE npc_guid=23272;
INSERT INTO `conditions` VALUES (68, 8, 2662, 0, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=922;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (922, 0, 1, 'Yes! I want more of that fabulous Noggenfogger Elixir!', 3793, 3, 4, 0, 0, 0, 0, 0, '', 0, 68);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (922, 1, 0, 'Seen any strange things in the desert lately?', 3662, 1, 1, 1423, 0, 0, 0, 0, '', 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (922, 2, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0);
UPDATE creature_template SET gossip_menu_id=922, `ScriptName`='' WHERE entry=7564;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
