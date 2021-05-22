DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210521232040');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210521232040');
-- Add your query below.


-- Fix Curgle Cranklehop's gossip menu.
UPDATE `gossip_menu_option` SET `action_menu_id`=943 WHERE `menu_id`=942 && `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`=1002 WHERE `menu_id`=942 && `id`=1;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(943, 1521),
(1002, 1646);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
