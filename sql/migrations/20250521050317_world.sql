DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250521050317');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250521050317');
-- Add your query below.


-- Fix wrong type and data for Sapphiron's Ice Block.
UPDATE `gameobject_template` SET `type`=0, `flags`=32, `faction`=114, `data2`=196608 WHERE `entry`=181247;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
