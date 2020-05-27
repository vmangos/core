DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200516095255');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200516095255');
-- Add your query below.


-- add correct gossip_menu_entries for alchemist narett
UPDATE `gossip_menu` SET `condition_id` = 362 WHERE `entry` = 4122 AND `text_id` = 5050;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4122, 5051, 25),
(4122, 5053, 361);


-- add correct gossip_menu_entries for lilyssia nightbreeze (I believe this is correct as one of the broadcasts mentions the npc next to her)
DELETE FROM `gossip_menu` WHERE `text_id` = 5016 AND `entry` = 4201;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4201, 5316, 0),
(4201, 5317, 361),
(4201, 5314, 362);


-- update gossip menu for tel'athir (I believe this is correct as he should not share the same gossip_menu_id with cyndra kindwhisper)
UPDATE `creature_template` SET `gossip_menu_id` = 4111 WHERE `entry` = 5500;

-- add correct gossip_menu_entries for tel'athir 
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4111, 5019, 0),
(4111, 5020, 25),
(4111, 5021, 361),
(4111, 8244, 461),
(4111, 8283, 459),
(4111, 8285, 454),
(4111, 8291, 458),
(4111, 8296, 460),
(4111, 8298, 455);


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
