DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190727180507');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190727180507');
-- Add your query below.


-- Removing unused db script for Cho'Rush the Observer.
DELETE FROM `creature_ai_events` WHERE `creature_id`=14324;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1432401, 1432402, 1432403, 1432404, 1432405, 1432406, 1432407, 1432408, 1432409, 1432410, 1432411, 1432412, 1432413, 1432414, 1432415, 1432416);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
