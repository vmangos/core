DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200607122445');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200607122445');
-- Add your query below.


-- add correct gossip_menu_entries for alchemist narett
UPDATE `gossip_menu` SET `condition_id` = 362 WHERE `entry` = 4122 AND `text_id` = 5050;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4122, 5051, 25),
(4122, 5053, 361);


-- add correct gossip_menu_entries for lilyssia nightbreeze
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4201, 5316, 25),
(4201, 5317, 361),
(4201, 5314, 362);


-- add correct gossip_menu_entries for tel'athir 
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4112, 5020, 25),
(4112, 5021, 361);


-- add correct gossip_menu_entries for ainethil
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4131, 5097, 25),
(4131, 5098, 362),
(4131, 5095, 363);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
