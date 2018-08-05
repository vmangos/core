DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180801070248');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180801070248');
-- Add your query below.


-- The dirt mounds should be spawned by the shovel.
DELETE FROM `pool_template` WHERE `entry`=35701;
DELETE FROM `pool_gameobject` WHERE `pool_entry`=35701;
DELETE FROM `gameobject` WHERE `id`=144064;

-- Fix respawn speed of Gordunni Trap. Same as spawntimesecs.
UPDATE `gameobject_template` SET `data5`=900 WHERE `entry`=144050;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
