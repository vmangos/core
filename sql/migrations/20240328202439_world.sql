DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240328202439');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240328202439');
-- Add your query below.


-- Hakkari Frostwing should wander and share spawns with Hakkari Sapper.
UPDATE `creature` SET `id2`=8336, `movement_type`=1, `wander_distance`=15 WHERE `id`=5291; 


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
