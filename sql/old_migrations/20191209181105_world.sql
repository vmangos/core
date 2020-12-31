DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191209181105');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191209181105');
-- Add your query below.


-- Assign gossip menu for Zorbin Fandazzle.
UPDATE `creature_template` SET `gossip_menu_id`=11361 WHERE `entry`=14637;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
