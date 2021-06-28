DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210218152035');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210218152035');
-- Add your query below.

UPDATE `creature_template` SET `call_for_help_range` = 0 WHERE `entry` IN (15344, 15385, 15386, 15387, 15388, 15389, 15390, 15392, 15391);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
