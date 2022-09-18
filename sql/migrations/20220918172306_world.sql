DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220918172306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220918172306');
-- Add your query below.


SET @OGUID = 4100050;
-- Remove duplicate objects from Alterac Valley
DELETE FROM `gameobject` WHERE `guid` IN (11765, 11766, 11767, 11768, 11769, 90132, 90133, 90134);
-- Add missing objects in Alterac Valley
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 177327 ,30, -251.556, -562.061, 68.1725, 6.11738, 0, 0, -0.0828075, 0.996566, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+2, 177324, 30, -375.018, -523.71, 84.0771, 3.14159, 0, 0, -1, 0, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+3, 177325, 30, -413.51, -521.414, 84.0771, 2.05949, 0, 0, 0.857167, 0.515038, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+4, 177326, 30, -487.402, -526.486, 82.5708, 5.47161, 0, 0, -0.394744, 0.918791, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+5, 177425, 30, -353.118, 37.0957, 65.8904, 3.14159, 0, 0, -1, 0, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+6, 177396, 30, 12.8251, -120.211, 41.6669, 3.14159, 0, 0, -1, 0, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+7, 32571, 30, -100.073, -583.512, 41.7316, 0.00872424, 0, 0, 0.00436211, 0.99999, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+8, 32572, 30, -102.735, -588.775, 41.7316, 5.24472, 0, 0, -0.496216, 0.868199, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+9, 32573, 30, -100.968, -586.958, 41.7316, 5.76831, 0, 0, -0.254601, 0.967046, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+10, 32574, 30, -106.174, -589.721, 41.7316, 4.72112, 0, 0, -0.704014, 0.710186, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+11, 34571, 30, -105.425, -584.352, 42.0149, 2.36492, 0, 0, 0.92554, 0.37865, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+12, 161488, 30, 360.915, -497.099, 71.3389, 3.14159, 0, 0, -1, 0, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+13, 161487, 30, 361.098, -531.693, 71.1898, 4.12771, 0, 0, -0.88089, 0.473321, 120, 120, 0, 1, 0, 0, 3, 10),
(@OGUID+14, 161489, 30, 360.38, -527.549, 71.1205, 4.23242, 0, 0, -0.854912, 0.518773, 120, 120, 0, 1, 0, 0, 3, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
