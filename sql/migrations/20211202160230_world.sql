DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211202160230');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211202160230');
-- Add your query below.


-- Nixx Sprocketspring
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(1469, 2133, 1367);
UPDATE `gossip_menu_option` SET `option_text` = 'Access secret goblin engineering schemata!', `option_broadcast_text` = 4551 WHERE `menu_id` = 1469 AND `id` = 0;

-- Vazario Linkgrease
UPDATE `gossip_menu_option` SET `option_text` = 'Access secret goblin engineering schemata!', `option_broadcast_text` = 4553 WHERE `menu_id` = 1465 AND `id` = 0;

-- Tinkmaster Overspark
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(1468, 2134, 1368);

-- Tinkmaster Overspark and Oglethorpe Obnoticus
UPDATE `gossip_menu_option` SET `option_text` = 'Access secret gnome engineering schemata!', `option_broadcast_text` = 4553 WHERE `menu_id` IN (1467, 1468) AND `id` = 0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
