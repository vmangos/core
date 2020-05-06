DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191130132339');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191130132339');
-- Add your query below.


-- Remove channeled spell from auras of Scholomance Adept.
UPDATE `creature_addon` SET `auras`='' WHERE `guid`=48784;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
