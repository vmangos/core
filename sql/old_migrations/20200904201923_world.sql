DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200904201923');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200904201923');
-- Add your query below.


-- NPC spawn pre naxxramas entrance
INSERT INTO `creature` VALUES (151317, 8555, 0, 0, 0, 0, 0, 0, 3134.28, -3728.23, 135.685, 4.45059, 345, 345, 0, 100, 0, 0, 0, 0, 0, 8);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
