DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230627153714');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230627153714');
-- Add your query below.


SET @OGUID = 3664;
SET @PTEMPLATE = 3714;

-- Stonetalon Mountains
DELETE FROM `gameobject` WHERE `guid` IN (5124, 5169, 47618, 47619, 47620, 47621, 47622, 47623, 47624);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5124, 5169, 47618, 47619, 47620, 47621, 47622, 47623, 47624);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (5124, 5169, 47618, 47619, 47620, 47621, 47622, 47623, 47624));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180661, 1, 1081.2, -333.738, -9.73216, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180661, 1, 1123.77, -314.828, -9.73216, 0.715585, 0, 0, 0.350207, 0.936672, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180661, 1, 1155.98, -50.0632, -9.73216, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180661, 1, 1198.36, -199.304, -9.73216, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180661, 1, 1201.43, -256.563, -9.73216, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180661, 1, 1213.56, 39.9466, -8.67718, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180661, 1, 1241.08, -94.5104, -9.73216, 0.0698117, 0, 0, 0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180661, 1, 1271.78, -247.527, -9.73216, 1.23918, 0, 0, 0.580703, 0.814116, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180661, 1, 1475.97, 143.181, 11.2851, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180661, 1, 1483.95, 127.112, 11.2851, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180661, 1, 1485.93, 45.0885, 11.2851, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180661, 1, 1487.37, 0.364583, 11.2851, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180661, 1, 1574.21, -85.732, 11.2851, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180661, 1, 1434.25, 186.711, 11.2755, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180662, 1, 1081.2, -333.738, -9.73216, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+16, 180662, 1, 1123.77, -314.828, -9.73216, 0.715585, 0, 0, 0.350207, 0.936672, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+17, 180662, 1, 1155.98, -50.0632, -9.73216, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+18, 180662, 1, 1198.36, -199.304, -9.73216, 6.10865, 0, 0, -0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+19, 180662, 1, 1201.43, -256.563, -9.73216, 3.97935, 0, 0, -0.913545, 0.406738, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+20, 180662, 1, 1213.56, 39.9466, -8.67718, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+21, 180662, 1, 1241.08, -94.5104, -9.73216, 0.0698117, 0, 0, 0.0348988, 0.999391, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+22, 180662, 1, 1271.78, -247.527, -9.73216, 1.23918, 0, 0, 0.580703, 0.814116, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+23, 180662, 1, 1475.97, 143.181, 11.2851, 5.28835, 0, 0, -0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+24, 180662, 1, 1483.95, 127.112, 11.2851, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+25, 180662, 1, 1485.93, 45.0885, 11.2851, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+26, 180662, 1, 1487.37, 0.364583, 11.2851, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+27, 180662, 1, 1574.21, -85.732, 11.2851, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+28, 180662, 1, 1434.25, 186.711, 11.2755, 0.122173, 0, 0, 0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+2, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+3, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+4, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+5, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+6, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+7, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+8, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+9, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+10, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+11, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+12, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+13, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@PTEMPLATE+14, 1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+7, @PTEMPLATE+7, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+8, @PTEMPLATE+8, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+9, @PTEMPLATE+9, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+10, @PTEMPLATE+10, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+11, @PTEMPLATE+11, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+12, @PTEMPLATE+12, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+13, @PTEMPLATE+13, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+14, @PTEMPLATE+14, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+15, @PTEMPLATE+1, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+16, @PTEMPLATE+2, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+17, @PTEMPLATE+3, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+18, @PTEMPLATE+4, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+19, @PTEMPLATE+5, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+20, @PTEMPLATE+6, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+21, @PTEMPLATE+7, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+22, @PTEMPLATE+8, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+23, @PTEMPLATE+9, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+24, @PTEMPLATE+10, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+25, @PTEMPLATE+11, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+26, @PTEMPLATE+12, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+27, @PTEMPLATE+13, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10),
(@OGUID+28, @PTEMPLATE+14, 'Oil Spill / Floating Wreckage - Stonetalon', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 5, 'Stonetalon - Oil Spill / Floating Wreckage (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+2, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+3, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+4, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+5, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+6, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+7, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+8, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+9, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+10, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+11, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+12, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+13, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0),
(@PTEMPLATE+14, @PTEMPLATE+15, 0, 'Oil Spill / Floating Wreckage - Stonetalon', 0);

UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Oil Spill / Floating Wreckage - Stonetalon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180661);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Oil Spill / Floating Wreckage - Stonetalon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180662);

SET @OGUID = 371;
SET @PTEMPLATE = 2572;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180662, 1, 1517.18, 883.797, 122.101, 4.25861, 0, 0, -0.848047, 0.529921, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180662, 1, 1558.36, 955.16, 122.101, 4.85202, 0, 0, -0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180662, 1, 1585.51, 804.599, 122.101, 4.31097, 0, 0, -0.833885, 0.551938, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180662, 1, 1609.57, 919.34, 122.101, 2.42601, 0, 0, 0.936672, 0.350207, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180662, 1, 1670.89, 921.875, 122.101, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180662, 1, 1686.51, 833.11, 122.101, 3.61284, 0, 0, -0.972369, 0.233448, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180663, 1, 1517.18, 883.797, 122.101, 4.25861, 0, 0, -0.848047, 0.529921, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180663, 1, 1558.36, 955.16, 122.101, 4.85202, 0, 0, -0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180663, 1, 1585.51, 804.599, 122.101, 4.31097, 0, 0, -0.833885, 0.551938, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180663, 1, 1609.57, 919.34, 122.101, 2.42601, 0, 0, 0.936672, 0.350207, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180663, 1, 1670.89, 921.875, 122.101, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180663, 1, 1686.51, 833.11, 122.101, 3.61284, 0, 0, -0.972369, 0.233448, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@PTEMPLATE+2, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@PTEMPLATE+3, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@PTEMPLATE+4, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@PTEMPLATE+5, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@PTEMPLATE+6, 1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+6, @PTEMPLATE+6, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+7, @PTEMPLATE+1, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+8, @PTEMPLATE+2, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+9, @PTEMPLATE+3, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+10, @PTEMPLATE+4, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+11, @PTEMPLATE+5, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10),
(@OGUID+12, @PTEMPLATE+6, 'Floating Wreckage / Sagefish School - Stonetalon', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 3, 'Stonetalon - Floating Wreckage / Sagefish School (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0),
(@PTEMPLATE+2, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0),
(@PTEMPLATE+3, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0),
(@PTEMPLATE+4, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0),
(@PTEMPLATE+5, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0),
(@PTEMPLATE+6, @PTEMPLATE+7, 0, 'Floating Wreckage / Sagefish School - Stonetalon', 0);

UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Floating Wreckage / Sagefish School - Stonetalon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180662);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Floating Wreckage / Sagefish School - Stonetalon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180663);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
