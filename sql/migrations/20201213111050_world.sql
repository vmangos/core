DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201213111050');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201213111050');
-- Add your query below.

-- remove sagefish schools from ratchet fishing pools (pool_entry: 93,256,74)
DELETE FROM `pool_gameobject` WHERE `guid`=1438;  
DELETE FROM `pool_gameobject` WHERE `guid`=15419; 
DELETE FROM `pool_gameobject` WHERE `guid`=936;    

DELETE FROM `gameobject` WHERE `guid`=1438;  
DELETE FROM `gameobject` WHERE `guid`=15419; 
DELETE FROM `gameobject` WHERE `guid`=936;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
