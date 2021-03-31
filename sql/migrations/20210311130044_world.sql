DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210311130044');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210311130044');
-- Add your query below.


-- Add gossip menu for Fahrad and make him a rogue trainer.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3984, 4839, 101);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (3984, 4838, 100);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3984, 4, 0, '<Take the letter>', 0, 1, 1, -1, 0, 16, 0, 0, '', 0, 196);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3984, 1, 0, 'I wish to unlearn my talents.', 8261, 1, 1, 4461, 0, 0, 0, 0, '', 0, 1081);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (3984, 0, 3, 'Yes, I have. Teach me.', 7495, 5, 16, 0, 0, 0, 0, 0, '', 0, 100);
UPDATE `creature_template` SET `gossip_menu_id`=3984, `npc_flags`=19, `trainer_class`=4 WHERE `entry`=6707;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
