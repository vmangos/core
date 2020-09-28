DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200928212443');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200928212443');
-- Add your query below.


-- remove unused ai_name from aska mistrunner
UPDATE `creature_template` SET `ai_name` = '' WHERE `entry` = 3026;

-- remove duplicate gossip_menu_option from urtharo
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1624 AND `id` = 0;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
