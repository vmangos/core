DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260711200940');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260711200940');
-- Add your query below.

-- Add Missing
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(21, 2042, 1, -4201.8, -3419, 33.998, 1.0821, 0, 0, 0.515038, 0.857167, 300, 300, 100, 1, 0, 0, 0, 10),
(248, 2042, 1, -4250.24, -3193.22, 38.5821, 1.3439, 0, 0, 0.622515, 0.782608, 300, 300, 100, 1, 0, 0, 0, 10),
(254, 2042, 1, -4402.17, -3523.14, 37.8286, -2.04204, 0, 0, 0.85264, -0.522498, 300, 300, 100, 1, 0, 0, 0, 10),
(261, 2042, 1, -4555.18, -2725.36, 40.8813, -0.994838, 0, 0, 0.477159, -0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(262, 2042, 1, -3975.37, -3070.39, 36.4185, -1.23918, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(263, 2042, 1, -4035.16, -3116.92, 41.9984, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(1138, 2042, 0, -1738.67, -2272.35, 36.9894, -0.977383, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(1139, 2042, 0, -13388.3, -364.414, 17.4184, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(1141, 2042, 0, -13602, -30.4481, 40.0262, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(1146, 2042, 0, -11740.4, 725.001, 51.4672, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(1147, 2042, 0, 1140.04, -581.97, 80.4874, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(1149, 2042, 0, 723.953, -854.599, 162.429, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(21,  1328, 0, 'Fadeleaf', 0, 0, 10),
(248, 1328, 0, 'Fadeleaf', 0, 0, 10),
(254, 1328, 0, 'Fadeleaf', 0, 0, 10),
(261, 1328, 0, 'Fadeleaf', 0, 0, 10),
(262, 1328, 0, 'Fadeleaf', 0, 0, 10),
(263, 1328, 0, 'Fadeleaf', 0, 0, 10),
(1138, 1183, 0, 'Fadeleaf', 0, 0, 10),
(1139, 1172, 0, 'Fadeleaf', 0, 0, 10),
(1141, 1172, 0, 'Fadeleaf', 0, 0, 10),
(1146, 1172, 0, 'Fadeleaf', 0, 0, 10),
(1147, 1071, 0, 'Fadeleaf', 0, 0, 10),
(1149, 1071, 0, 'Fadeleaf', 0, 0, 10);

-- Swamp of Sorrows
SET @PTEMPLATE = 3605;
DELETE FROM `pool_template` WHERE `entry` = 1311;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1311;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Fadeleaf - Swamp of Sorrows - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7586, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1'),
(7706, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1'),
(7737, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1'),
(7754, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1'),
(7830, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1'),
(28938, @PTEMPLATE+1, 'Fadeleaf - Swamp of Sorrows - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Fadeleaf - Swamp of Sorrows - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7643, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2'),
(7735, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2'),
(7767, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2'),
(7816, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2'),
(28936, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2'),
(30349, @PTEMPLATE+2, 'Fadeleaf - Swamp of Sorrows - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Fadeleaf - Swamp of Sorrows - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7673, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3'),
(7782, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3'),
(7802, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3'),
(7803, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3'),
(28937, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3'),
(32755, @PTEMPLATE+3, 'Fadeleaf - Swamp of Sorrows - Group 3');

-- Arathi Highlands
SET @PTEMPLATE = 4969;
DELETE FROM `pool_template` WHERE `entry` = 1183;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1183;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Fadeleaf - Arathi Highlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7648, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1'),
(16813, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1'),
(28971, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1'),
(33378, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1'),
(68615, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1'),
(68618, @PTEMPLATE+1, 'Fadeleaf - Arathi Highlands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Fadeleaf - Arathi Highlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(1138, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2'),
(7612, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2'),
(16936, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2'),
(28969, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2'),
(35556, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2'),
(68616, @PTEMPLATE+2, 'Fadeleaf - Arathi Highlands - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Fadeleaf - Arathi Highlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16941, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3'),
(28970, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3'),
(33388, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3'),
(68614, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3'),
(68617, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3'),
(68946, @PTEMPLATE+3, 'Fadeleaf - Arathi Highlands - Group 3');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Fadeleaf - Arathi Highlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7587, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4'),
(7669, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4'),
(7793, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4'),
(28968, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4'),
(33381, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4'),
(35575, @PTEMPLATE+4, 'Fadeleaf - Arathi Highlands - Group 4');

-- Badlands
SET @PTEMPLATE = 4973;
DELETE FROM `pool_template` WHERE `entry` = 1285;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1285;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Fadeleaf - Badlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7553, @PTEMPLATE+1, 'Fadeleaf - Badlands - Group 1'),
(7638, @PTEMPLATE+1, 'Fadeleaf - Badlands - Group 1'),
(7745, @PTEMPLATE+1, 'Fadeleaf - Badlands - Group 1'),
(11486, @PTEMPLATE+1, 'Fadeleaf - Badlands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Fadeleaf - Badlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7711, @PTEMPLATE+2, 'Fadeleaf - Badlands - Group 2'),
(7821, @PTEMPLATE+2, 'Fadeleaf - Badlands - Group 2'),
(11464, @PTEMPLATE+2, 'Fadeleaf - Badlands - Group 2'),
(28935, @PTEMPLATE+2, 'Fadeleaf - Badlands - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Fadeleaf - Badlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(7565, @PTEMPLATE+3, 'Fadeleaf - Badlands - Group 3'),
(7626, @PTEMPLATE+3, 'Fadeleaf - Badlands - Group 3'),
(7666, @PTEMPLATE+3, 'Fadeleaf - Badlands - Group 3'),
(11466, @PTEMPLATE+3, 'Fadeleaf - Badlands - Group 3');

-- Grave Moss Arathi
SET @PTEMPLATE = 103;
DELETE FROM `pool_template` WHERE `entry` = 104;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 104;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Grave Moss - Arathi Highlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(4469, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1'),
(16751, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1'),
(29130, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1'),
(29131, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1'),
(68706, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1'),
(68707, @PTEMPLATE+1, 'Grave Moss - Arathi Highlands - Group 1');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
