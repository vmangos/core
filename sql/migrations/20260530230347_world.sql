DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260530230347');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260530230347');
-- Add your query below.

-- These fishing trainers are using the wrong menu id.
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry` IN (1683, 1700, 5941);
UPDATE `creature_template` SET `npc_flags`=18, `gossip_menu_id`=0 WHERE `entry`=7946;
DELETE FROM `gossip_menu` WHERE `entry`=4744;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4744;
 
-- Add missing gossip options for Aurora Skycaller.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (4744, 5796);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (4745, 5797);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4743, 0, 0, 'Where can I get Enchanted Thorium?', 8340, 1, 1, 4744, 0, 0, 0, NULL, 0, 805);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (4743, 1, 0, 'Where can I find Crystal Restore?', 8341, 1, 1, 4745, 0, 0, 0, NULL, 0, 805);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
