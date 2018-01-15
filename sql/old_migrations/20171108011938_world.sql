DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171108011938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171108011938');
-- Add your query below.

UPDATE `creature_template` SET `flags_extra`=4608 WHERE `entry`=15263;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
