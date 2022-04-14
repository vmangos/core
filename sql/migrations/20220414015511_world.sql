DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220414015511');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220414015511');
-- Add your query below.


-- Naxxramas should be spawned as a transport, not a normal gameobject.
DELETE FROM `gameobject` WHERE `id`=181056;
INSERT INTO `transports` (`entry`, `name`, `period`) VALUES (181056, 'Naxxramas', 1208095);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
