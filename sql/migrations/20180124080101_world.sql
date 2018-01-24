DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180124080101');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180124080101');
-- Add your query below.

UPDATE `creature_template` SET `rank` = 1, `minlevel` = 60 WHERE `entry` = 15334;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
