DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326134342');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326134342');
-- Add your query below.


-- Ur'dan should only sell items after quest Ulathek the Traitor is completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7624, 8, 7624, 0, 0, 0, 0);
INSERT INTO `gossip_menu` VALUES (5864, 7037, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (5864, 0, 1, 'I wish to purchase from you.', 9734, 3, 4, 0, 0, 0, 0, 0, NULL, 0, 7624);
UPDATE `creature_template` SET `gossip_menu_id`=5864, `npc_flags`=5 WHERE `entry`=14522;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
