DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230619040545');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230619040545');
-- Add your query below.


-- Dreadlord should be immune to Enslave Demon.
UPDATE `creature_template` SET `mechanic_immune_mask` = (`mechanic_immune_mask` | 1) WHERE `entry` = 8716;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
