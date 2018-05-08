DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180507192521');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180507192521');
-- Add your query below.

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES 
('40457', '-1', '40384', '40385', '0');

REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
('15500', '7', 'I have lost my Shroud of Unspoken Names. Are you able to replace it for me?', '12716', '1', '1', '-1', '40097', '40457');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
