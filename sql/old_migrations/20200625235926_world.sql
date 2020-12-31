DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200625235926');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200625235926');
-- Add your query below.


-- Respawn Stonetalon Peak for pre 1.11
-- Chylina
UPDATE `creature` SET `patch_min`='9' WHERE  `guid`=32313;
INSERT INTO `creature` VALUES (32325, 4084, 0, 0, 0, 1, 0, 0, 2735.39, 1489.98, 237.51, 3.038, 300, 300, 0, 100, 0, 0, 0, 0, 0, 8);

-- Illyanie
-- position wasn't changed in 1.11, fail in development by blizzard
UPDATE `creature` SET `position_x`=2690.11, `position_y`=1516.39, `position_z`=235.247, `orientation`=4.93928 WHERE `guid`=29249; 

-- No Mailbox at Stonetalon Peak pre 1.11
UPDATE `gameobject` SET `patch_min`='9' WHERE  `guid`=47593;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
