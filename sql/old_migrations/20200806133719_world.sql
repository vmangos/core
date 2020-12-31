DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200806133719');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200806133719');
-- Add your query below.


-- Correct UBRS door.
DELETE FROM `gameobject` WHERE `id`=170556 && `map`=229;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (82597, 164725, 229, 126.879, -319.109, 70.935, 3.14159, 0, 0, 1, 0, 180, 180, 100, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
