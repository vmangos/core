DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210124213854');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210124213854');
-- Add your query below.


-- fix incorrect creature coordinates that cause db error
UPDATE `creature` SET `position_x` = -11635.7, `position_y` = 639.049, `position_z` = 51.2367 WHERE `guid` = 1083;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
