DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240402183826');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240402183826');
-- Add your query below.


-- Spawn old Ahn Qiraj Gong pre 1.9
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(66333, 177223, 1, -8067.78, 1568.16, 8.03422, 1.26537, 0, 0, 0, 0, 900, 900, 100, 1, 1, 150, 0, 6);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
