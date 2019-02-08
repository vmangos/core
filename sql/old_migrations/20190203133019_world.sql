DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190203133019');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190203133019');
-- Add your query below.


UPDATE `mangos_string` SET `content_default`='Invalid virtual item slot (%u)' WHERE `entry`=505;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (1509, 'Motion type = %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
