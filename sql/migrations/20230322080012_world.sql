DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230322080012');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230322080012');
-- Add your query below.


-- Fix respawn time of Gromsblood.
UPDATE `gameobject` SET `spawntimesecsmin`=2700, `spawntimesecsmax`=2700 WHERE `id`=142145 && `map`!=429;
UPDATE `gameobject` SET `spawntimesecsmin`=604800, `spawntimesecsmax`=604800 WHERE `id`=142145 && `map`=429;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
