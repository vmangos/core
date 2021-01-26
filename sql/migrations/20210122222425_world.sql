DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210122222425');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210122222425');
-- Add your query below.


-- Fix gossip menu for J.D. Collie.
DELETE FROM `gossip_menu` WHERE `entry` IN (2183, 2185);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2202, 2834);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2203, 2836);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2204, 2837);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2205, 2838);
UPDATE `gossip_menu_option` SET `action_menu_id`=2202 WHERE `menu_id`=2184 && `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`=2203 WHERE `menu_id`=2184 && `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`=2204 WHERE `menu_id`=2184 && `id`=2;
UPDATE `gossip_menu_option` SET `action_menu_id`=2205 WHERE `menu_id`=2184 && `id`=3;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
