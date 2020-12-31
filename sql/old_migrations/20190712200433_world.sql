DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190712200433');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190712200433');
-- Add your query below.


-- Fix gossip option for Torwa Pathfinder.
UPDATE `gossip_menu_option` SET `action_menu_id` = 2201 WHERE `menu_id` = 2188 AND `id` = 0 AND `action_menu_id` = 2189;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(2201, 2835, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
