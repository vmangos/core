DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240101090202');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240101090202');
-- Add your query below.


-- Fix unit flags of Marshal Reginald Windsor.
UPDATE `creature_template` SET `unit_flags`=320 WHERE `entry` IN (9023, 9682);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
