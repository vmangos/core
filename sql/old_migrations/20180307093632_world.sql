DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180307093632');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180307093632');
-- Add your query below.

-- Fix Alliance First Aid trainers.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES (4762, 0, 3, 'I require training', 6503, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0);

-- Fix Betina Bigglezink gossip option for Dawn's Gambit.
UPDATE `gossip_scripts` SET `data_flags`=0 WHERE `id`=50407;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
