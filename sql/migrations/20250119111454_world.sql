DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250119111454');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250119111454');
-- Add your query below.


-- Pool Truesilver / Mithril Deposit / Gold Vein Spawns in Desolace.
SET @OGUID = 74100;
SET @PTEMPLATE = 5400;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9907, 13, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427551);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -2078.25, 1179.16, 126.976, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 1, -2078.25, 1179.16, 126.976, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427551, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+1, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+2, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427552);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+3, 1734, 1, -2015.01, 1972.72, 76.5862, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 1, -2015.01, 1972.72, 76.5862, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427552, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+3, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+4, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+2, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427553);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 1734, 1, 146.219, 2856.42, -8.38591, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 1, 146.219, 2856.42, -8.38591, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427553, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+5, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+6, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+3, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34183, 14083);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3679);
DELETE FROM `pool_template` WHERE `entry` IN (3679);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 1734, 1, -1276.49, 2921.21, 74.2758, 1.309, 0, 0, 0.608761, 0.793353, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34183, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(14083, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+7, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+4, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (387717, 29207);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3680);
DELETE FROM `pool_template` WHERE `entry` IN (3680);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+8, 1734, 1, -1313.19, 2791.93, 127.485, 0.575957, 0, 0, 0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(387717, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(29207, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+8, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+5, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14078, 7320);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3681);
DELETE FROM `pool_template` WHERE `entry` IN (3681);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 1734, 1, -1361.49, 2601.74, 73.1999, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14078, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(7320, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+9, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+6, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220420, 34180);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3682);
DELETE FROM `pool_template` WHERE `entry` IN (3682);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+10, 1734, 1, -1395.65, 2749.97, 119.239, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220420, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(34180, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+10, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+7, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220421, 13232);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3683);
DELETE FROM `pool_template` WHERE `entry` IN (3683);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 1734, 1, -1440.75, 2949.23, 124.248, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220421, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(13232, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+11, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+8, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13216, 29217);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3684);
DELETE FROM `pool_template` WHERE `entry` IN (3684);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 1734, 1, -1523.36, 2828.88, 144.781, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13216, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(29217, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+12, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+9, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (27903, 427559);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3685);
DELETE FROM `pool_template` WHERE `entry` IN (3685);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 1734, 1, -1777.43, 1765.9, 83.9239, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(27903, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(427559, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+13, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+10, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (7074, 14094);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3686);
DELETE FROM `pool_template` WHERE `entry` IN (3686);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 1734, 1, -1833.65, 1021.58, 98.3811, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(7074, @PTEMPLATE+11, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(14094, @PTEMPLATE+11, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+14, @PTEMPLATE+11, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+11, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14112, 13607);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3687);
DELETE FROM `pool_template` WHERE `entry` IN (3687);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 1734, 1, -2008.28, 2777.47, 67.2456, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14112, @PTEMPLATE+12, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(13607, @PTEMPLATE+12, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+15, @PTEMPLATE+12, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+12, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427554, 220405);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3688);
DELETE FROM `pool_template` WHERE `entry` IN (3688);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 1734, 1, -2073.42, 2055.29, 76.7987, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427554, @PTEMPLATE+13, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(220405, @PTEMPLATE+13, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+16, @PTEMPLATE+13, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+13, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14023, 220455);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3689);
DELETE FROM `pool_template` WHERE `entry` IN (3689);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+17, 1734, 1, -2118.6, 1952.15, 73.0367, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14023, @PTEMPLATE+14, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(220455, @PTEMPLATE+14, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+17, @PTEMPLATE+14, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+14, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220812, 14091);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3690);
DELETE FROM `pool_template` WHERE `entry` IN (3690);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+18, 1734, 1, -2142.28, 2611.28, 29.1127, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220812, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(14091, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+18, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+15, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34177, 14090);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3691);
DELETE FROM `pool_template` WHERE `entry` IN (3691);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 1734, 1, -2319.18, 2605.48, 63.8411, -1.98968, 0, 0, 0.838671, -0.544639, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34177, @PTEMPLATE+16, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(14090, @PTEMPLATE+16, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+19, @PTEMPLATE+16, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+16, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (2221, 7203);
DELETE FROM `pool_pool` WHERE `pool_id` IN (9004);
DELETE FROM `pool_template` WHERE `entry` IN (9004);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 1734, 1, -1407.62, 2911.05, 93.9409, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(2221, @PTEMPLATE+17, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(7203, @PTEMPLATE+17, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+20, @PTEMPLATE+17, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+17, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34191, 7293);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3670);
DELETE FROM `pool_template` WHERE `entry` IN (3670);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 2047, 1, -1838.55, 882.157, 103.443, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34191, @PTEMPLATE+18, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(7293, @PTEMPLATE+18, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+21, @PTEMPLATE+18, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+18, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (27897, 3996097);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3671);
DELETE FROM `pool_template` WHERE `entry` IN (3671);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+22, 2047, 1, -1338.7, 2898.86, 73.0065, 2.28638, 0, 0, 0.909961, 0.414693, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(27897, @PTEMPLATE+19, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(3996097, @PTEMPLATE+19, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+22, @PTEMPLATE+19, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+19, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (7153, 1898);
DELETE FROM `pool_pool` WHERE `pool_id` IN (2761);
DELETE FROM `pool_template` WHERE `entry` IN (2761);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 2047, 1, -1914.5, 2069.99, 71.4208, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(7153, @PTEMPLATE+20, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(1898, @PTEMPLATE+20, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@OGUID+23, @PTEMPLATE+20, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+20, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Pool Silver Vein / Gold Vein / Iron Deposit Spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9908, 10, 'Desolace - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (10280, 34167);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3663);
DELETE FROM `pool_template` WHERE `entry` IN (3663);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+24, 1733, 1, -274.474, 1849.42, 171.919, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+21, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(10280, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(34167, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+24, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+21, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (43817, 427057);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3664);
DELETE FROM `pool_template` WHERE `entry` IN (3664);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 1733, 1, -857.031, 1367.46, 74.1345, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(43817, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(427057, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+25, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+22, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34188, 20815);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3665);
DELETE FROM `pool_template` WHERE `entry` IN (3665);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+26, 1733, 1, -926.993, 1758.54, 65.4485, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+23, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34188, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(20815, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+26, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+23, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34200, 6366);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3666);
DELETE FROM `pool_template` WHERE `entry` IN (3666);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+27, 1733, 1, -1367.99, 1272.66, 105.93, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+24, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34200, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(6366, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+27, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+24, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34189, 20849);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3667);
DELETE FROM `pool_template` WHERE `entry` IN (3667);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+28, 1733, 1, -1002.77, 2398.7, 101.129, 2.58308, 0, 0, 0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+25, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34189, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(20849, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+28, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+25, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (43808, 34196);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3668);
DELETE FROM `pool_template` WHERE `entry` IN (3668);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+29, 1733, 1, -1628.29, 1604.64, 91.5897, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+26, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(43808, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(34196, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+29, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+26, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34190, 10249);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3669);
DELETE FROM `pool_template` WHERE `entry` IN (3669);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+30, 1733, 1, -1636.06, 2065.69, 75.1803, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+27, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34190, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(10249, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+30, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+27, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34210, 20790);
DELETE FROM `pool_pool` WHERE `pool_id` IN (23028);
DELETE FROM `pool_template` WHERE `entry` IN (23028);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+31, 1733, 1, -857.72, 2428.58, 99.7405, -0.244346, 0, 0, 0.121869, -0.992546, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+28, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34210, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(20790, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+31, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+28, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (3672);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3672, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (3673);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3673, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (3674);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3674, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (34184, 20864);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3675);
DELETE FROM `pool_template` WHERE `entry` IN (3675);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+32, 1734, 1, -1244.74, 2893.57, 124.94, 0.575959, 0, 0, 0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+29, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(34184, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(20864, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+32, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+29, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (10279, 20858);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3676);
DELETE FROM `pool_template` WHERE `entry` IN (3676);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+33, 1734, 1, -1256.88, 886.57, 113.211, 4.06662, 0, 0, -0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+30, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(10279, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(20858, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+33, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+30, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (43800, 6380);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3677);
DELETE FROM `pool_template` WHERE `entry` IN (3677);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+34, 1734, 1, -1328.47, 2576.41, 116.466, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+31, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(43800, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(6380, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+34, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+31, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427042, 6669);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3678);
DELETE FROM `pool_template` WHERE `entry` IN (3678);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+35, 1734, 1, -956.861, 1253.08, 111.268, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+32, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427042, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(6669, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+35, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+32, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427003);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 1734, 1, -894.552, 1317.25, 91.781, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1735, 1, -894.552, 1317.25, 91.781, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+33, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427003, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+36, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10),
(@OGUID+37, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+33, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Pool Tin Vein / Silver Vein Spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9909, 6, 'Desolace - Tin Vein / Silver Vein (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_pool` WHERE `pool_id` IN (3661);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3661, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_pool` WHERE `pool_id` IN (3662);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3662, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0);

-- Remove Unused Pools
DELETE FROM `pool_template` WHERE `entry` IN (1147, 1146, 23058, 321, 1141, 1140);

-- Redo Pools
SET @OGUID = 85300;
SET @PTEMPLATE = 5100;
DELETE FROM `pool_gameobject` WHERE `guid` IN (7060, 7071, 7147, 7160, 7171, 7173, 7178, 7180, 7186, 7187, 7189, 7215, 7232, 7260, 7264, 7270, 7301, 7305, 7325, 7329, 13137, 13210, 13215, 13586, 27892, 27893, 27894, 27895, 27896, 27900, 27901, 27902, 27904, 28321, 34179, 34197, 34198, 34199, 43809, 220403, 220404, 220413, 220813, 220814, 220815, 220816, 220817, 220818, 220819, 220820, 220832, 220833);
DELETE FROM `gameobject` WHERE `guid` IN (7060, 7071, 7147, 7160, 7171, 7173, 7178, 7180, 7186, 7187, 7189, 7215, 7232, 7260, 7264, 7270, 7301, 7305, 7325, 7329, 13137, 13210, 13215, 13586, 27892, 27893, 27894, 27895, 27896, 27900, 27901, 27902, 27904, 28321, 34179, 34197, 34198, 34199, 43809, 220403, 220404, 220413, 220813, 220814, 220815, 220816, 220817, 220818, 220819, 220820, 220832, 220833);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 1734, 1, -1934, 1770.49, 73.479, 1.204, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -1329, 2816.56, 113.447, 0.576, 0, 0, 0.284016, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -1575.95, 861.697, 112.583, 1.51844, 0, 0, 0.688355, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -1234, 2919.74, 87.325, 1.257, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -1412, 2831.07, 114.944, 1.484, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -1807, 792.764, 119.067, -2, 0, 0, -0.771624, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, -1503, 2801.17, 112.181, -2, 0, 0, -0.920505, 0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, -1326, 2885.29, 88.671, 2.286, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 1, -1103, 2806.11, 187.597, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 1, -1965.25, 2658.2, 69.2784, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 1, -1295, 2876.46, 114.007, 1.606, 0, 0, 0.71934, 0.694658, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 1, -1394, 2925.18, 93.983, 2.74, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 1, -1300, 2915.14, 88.297, 1.728, 0, 0, 0.760406, 0.649448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 1, -1906.89, 3012.74, 18.351, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 1, -1515, 2735.78, 111.942, 1.239, 0, 0, 0.580703, 0.814115, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 1, -1144, 2746.2, 119.409, 0.471, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 1, -1352, 2666.24, 111.556, 2.862, 0, 0, 0.990268, 0.139173, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 1, -1747.26, 1657.03, 72.1814, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 1, -1767.4, 2862.34, 61.5412, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 1, -1135, 2847.58, 139.062, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 1, -1951.28, 2900.84, 49.8261, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 1, -1405.84, 2835.96, 78.7253, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 1, -1170.37, 2974.11, 64.7407, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 1, -1375.16, 2722.34, 94.2334, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 1, -1291.37, 3013.82, 88.8554, -0.715585, 0, 0, 0.350207, -0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 1, -1738.91, 1723.86, 71.395, 1.43117, 0, 0, 0.656059, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 1, 126.822, 852.442, 149.675, -1.85005, 0, 0, 0.798635, -0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 1, 11.4729, 2703.64, -73.5529, 1.48353, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 1, -2107.35, 2460.43, 24.257, -2.30383, 0, 0, 0.913545, -0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 1, 198.962, 2670.46, -69.6515, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 1, 213.924, 2735.46, -68.5553, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 1, 267.468, 2632.63, -43.1734, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1734, 1, -1297.31, 2950.38, 120.484, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1734, 1, -2019.15, 3121.25, 18.2197, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1734, 1, -1497.13, 2799.23, 84.7267, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1734, 1, -1563.17, 2683.34, 93.2477, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1734, 1, -1445.41, 2712.28, 78.1281, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1734, 1, -2277.12, 2508.5, 75.3471, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1734, 1, -1930.25, 1766.63, 74.6961, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1734, 1, 29.4768, 852.77, 130.517, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1734, 1, -1844.3, 2087.51, 77.5889, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1734, 1, -1769.87, 2977.38, 39.2272, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1734, 1, -2017.71, 2153.94, 57.9873, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1734, 1, -1772.81, 2008.24, 69.5281, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1734, 1, -1134.3, 2753.29, 129.11, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1734, 1, -945.641, 2493.51, 127.732, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1734, 1, -500.233, 2633.11, 5.49796, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1734, 1, -94.0791, 865.526, 121.01, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1734, 1, -50.3689, 2667.23, -103.501, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1734, 1, -23.8319, 2580.51, -95.5648, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1734, 1, -347.319, 717.753, 92.6404, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1734, 1, -663.746, 2624.86, 45.0553, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 2040, 1, -1934, 1770.49, 73.479, 1.204, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 2040, 1, -1329, 2816.56, 113.447, 0.576, 0, 0, 0.284016, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 2040, 1, -1575.95, 861.697, 112.583, 1.51844, 0, 0, 0.688355, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 2040, 1, -1234, 2919.74, 87.325, 1.257, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 2040, 1, -1412, 2831.07, 114.944, 1.484, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 2040, 1, -1807, 792.764, 119.067, -2, 0, 0, -0.771624, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 2040, 1, -1503, 2801.17, 112.181, -2, 0, 0, -0.920505, 0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 2040, 1, -1326, 2885.29, 88.671, 2.286, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 2040, 1, -1103, 2806.11, 187.597, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 2040, 1, -1965.25, 2658.2, 69.2784, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 2040, 1, -1295, 2876.46, 114.007, 1.606, 0, 0, 0.71934, 0.694658, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 2040, 1, -1394, 2925.18, 93.983, 2.74, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 2040, 1, -1300, 2915.14, 88.297, 1.728, 0, 0, 0.760406, 0.649448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 2040, 1, -1906.89, 3012.74, 18.351, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 2040, 1, -1515, 2735.78, 111.942, 1.239, 0, 0, 0.580703, 0.814115, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 2040, 1, -1144, 2746.2, 119.409, 0.471, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 2040, 1, -1352, 2666.24, 111.556, 2.862, 0, 0, 0.990268, 0.139173, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 2040, 1, -1747.26, 1657.03, 72.1814, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 2040, 1, -1767.4, 2862.34, 61.5412, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 2040, 1, -1135, 2847.58, 139.062, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 2040, 1, -1951.28, 2900.84, 49.8261, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 2040, 1, -1405.84, 2835.96, 78.7253, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 2040, 1, -1170.37, 2974.11, 64.7407, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 2040, 1, -1375.16, 2722.34, 94.2334, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 2040, 1, -1291.37, 3013.82, 88.8554, -0.715585, 0, 0, 0.350207, -0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 2040, 1, -1738.91, 1723.86, 71.395, 1.43117, 0, 0, 0.656059, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 2040, 1, 126.822, 852.442, 149.675, -1.85005, 0, 0, 0.798635, -0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 2040, 1, 11.4729, 2703.64, -73.5529, 1.48353, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 2040, 1, -2107.35, 2460.43, 24.257, -2.30383, 0, 0, 0.913545, -0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 2040, 1, 198.962, 2670.46, -69.6515, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 2040, 1, 213.924, 2735.46, -68.5553, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 2040, 1, 267.468, 2632.63, -43.1734, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 2040, 1, -1297.31, 2950.38, 120.484, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 2040, 1, -2019.15, 3121.25, 18.2197, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 2040, 1, -1497.13, 2799.23, 84.7267, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 2040, 1, -1563.17, 2683.34, 93.2477, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 2040, 1, -1445.41, 2712.28, 78.1281, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 2040, 1, -2277.12, 2508.5, 75.3471, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 2040, 1, -1930.25, 1766.63, 74.6961, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 2040, 1, 29.4768, 852.77, 130.517, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 2040, 1, -1844.3, 2087.51, 77.5889, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 2040, 1, -1769.87, 2977.38, 39.2272, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 2040, 1, -2017.71, 2153.94, 57.9873, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 2040, 1, -1772.81, 2008.24, 69.5281, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 2040, 1, -1134.3, 2753.29, 129.11, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 2040, 1, -945.641, 2493.51, 127.732, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 2040, 1, -500.233, 2633.11, 5.49796, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 2040, 1, -94.0791, 865.526, 121.01, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 2040, 1, -50.3689, 2667.23, -103.501, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 2040, 1, -23.8319, 2580.51, -95.5648, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 2040, 1, -347.319, 717.753, 92.6404, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 2040, 1, -663.746, 2624.86, 45.0553, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 2047, 1, -1934, 1770.49, 73.479, 1.204, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 2047, 1, -1329, 2816.56, 113.447, 0.576, 0, 0, 0.284016, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 2047, 1, -1575.95, 861.697, 112.583, 1.51844, 0, 0, 0.688355, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+108, 2047, 1, -1234, 2919.74, 87.325, 1.257, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+109, 2047, 1, -1412, 2831.07, 114.944, 1.484, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+110, 2047, 1, -1807, 792.764, 119.067, -2, 0, 0, -0.771624, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+111, 2047, 1, -1503, 2801.17, 112.181, -2, 0, 0, -0.920505, 0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+112, 2047, 1, -1326, 2885.29, 88.671, 2.286, 0, 0, 0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+113, 2047, 1, -1103, 2806.11, 187.597, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+114, 2047, 1, -1965.25, 2658.2, 69.2784, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+115, 2047, 1, -1295, 2876.46, 114.007, 1.606, 0, 0, 0.71934, 0.694658, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+116, 2047, 1, -1394, 2925.18, 93.983, 2.74, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+117, 2047, 1, -1300, 2915.14, 88.297, 1.728, 0, 0, 0.760406, 0.649448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+118, 2047, 1, -1906.89, 3012.74, 18.351, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+119, 2047, 1, -1515, 2735.78, 111.942, 1.239, 0, 0, 0.580703, 0.814115, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+120, 2047, 1, -1144, 2746.2, 119.409, 0.471, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+121, 2047, 1, -1352, 2666.24, 111.556, 2.862, 0, 0, 0.990268, 0.139173, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+122, 2047, 1, -1747.26, 1657.03, 72.1814, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+123, 2047, 1, -1767.4, 2862.34, 61.5412, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+124, 2047, 1, -1135, 2847.58, 139.062, 2.042, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+125, 2047, 1, -1951.28, 2900.84, 49.8261, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+126, 2047, 1, -1405.84, 2835.96, 78.7253, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+127, 2047, 1, -1170.37, 2974.11, 64.7407, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+128, 2047, 1, -1375.16, 2722.34, 94.2334, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+129, 2047, 1, -1291.37, 3013.82, 88.8554, -0.715585, 0, 0, 0.350207, -0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+130, 2047, 1, -1738.91, 1723.86, 71.395, 1.43117, 0, 0, 0.656059, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+131, 2047, 1, 126.822, 852.442, 149.675, -1.85005, 0, 0, 0.798635, -0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+132, 2047, 1, 11.4729, 2703.64, -73.5529, 1.48353, 0, 0, 0.67559, 0.737277, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+133, 2047, 1, -2107.35, 2460.43, 24.257, -2.30383, 0, 0, 0.913545, -0.406737, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+134, 2047, 1, 198.962, 2670.46, -69.6515, 5.07891, 0, 0, -0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+135, 2047, 1, 213.924, 2735.46, -68.5553, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+136, 2047, 1, 267.468, 2632.63, -43.1734, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+137, 2047, 1, -1297.31, 2950.38, 120.484, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+138, 2047, 1, -2019.15, 3121.25, 18.2197, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+139, 2047, 1, -1497.13, 2799.23, 84.7267, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+140, 2047, 1, -1563.17, 2683.34, 93.2477, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+141, 2047, 1, -1445.41, 2712.28, 78.1281, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+142, 2047, 1, -2277.12, 2508.5, 75.3471, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+143, 2047, 1, -1930.25, 1766.63, 74.6961, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+144, 2047, 1, 29.4768, 852.77, 130.517, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+145, 2047, 1, -1844.3, 2087.51, 77.5889, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+146, 2047, 1, -1769.87, 2977.38, 39.2272, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+147, 2047, 1, -2017.71, 2153.94, 57.9873, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+148, 2047, 1, -1772.81, 2008.24, 69.5281, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+149, 2047, 1, -1134.3, 2753.29, 129.11, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+150, 2047, 1, -945.641, 2493.51, 127.732, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+151, 2047, 1, -500.233, 2633.11, 5.49796, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+152, 2047, 1, -94.0791, 865.526, 121.01, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+153, 2047, 1, -50.3689, 2667.23, -103.501, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+154, 2047, 1, -23.8319, 2580.51, -95.5648, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+155, 2047, 1, -347.319, 717.753, 92.6404, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+156, 2047, 1, -663.746, 2624.86, 45.0553, -2.77507, 0, 0, 0.983255, -0.182235, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+21, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+22, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+23, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+24, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+25, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+26, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+27, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+28, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+29, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+30, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+31, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+32, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+33, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+34, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+35, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+36, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+37, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+38, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+39, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+40, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+41, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+42, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+43, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+44, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+45, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+46, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+47, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+48, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+49, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+50, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+51, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@PTEMPLATE+52, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+13, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+14, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+15, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+16, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+17, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+18, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+19, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+20, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+21, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+22, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+23, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+24, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+25, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+26, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+27, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+28, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+29, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+30, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+31, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+32, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+33, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+34, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+35, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+36, @PTEMPLATE+36, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+37, @PTEMPLATE+37, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+38, @PTEMPLATE+38, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+39, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+40, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+41, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+42, @PTEMPLATE+42, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+43, @PTEMPLATE+43, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+44, @PTEMPLATE+44, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+45, @PTEMPLATE+45, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+46, @PTEMPLATE+46, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+47, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+48, @PTEMPLATE+48, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+49, @PTEMPLATE+49, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+50, @PTEMPLATE+50, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+51, @PTEMPLATE+51, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+52, @PTEMPLATE+52, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+53, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+54, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+55, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+56, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+57, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+58, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+59, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+60, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+61, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+62, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+63, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+64, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+65, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+66, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+67, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+68, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+69, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+70, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+71, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+72, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+73, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+74, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+75, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+76, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+77, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+78, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+79, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+80, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+81, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+82, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+83, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+84, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+85, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+86, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+87, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+88, @PTEMPLATE+36, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+89, @PTEMPLATE+37, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+90, @PTEMPLATE+38, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+91, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+92, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+93, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+94, @PTEMPLATE+42, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+95, @PTEMPLATE+43, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+96, @PTEMPLATE+44, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+97, @PTEMPLATE+45, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+98, @PTEMPLATE+46, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+99, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+100, @PTEMPLATE+48, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+101, @PTEMPLATE+49, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+102, @PTEMPLATE+50, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+103, @PTEMPLATE+51, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+104, @PTEMPLATE+52, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+105, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+106, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+107, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+108, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+109, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+110, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+111, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+112, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+113, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+114, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+115, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+116, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+117, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+118, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+119, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+120, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+121, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+122, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+123, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+124, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+125, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+126, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+127, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+128, @PTEMPLATE+24, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+129, @PTEMPLATE+25, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+130, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+131, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+132, @PTEMPLATE+28, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+133, @PTEMPLATE+29, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+134, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+135, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+136, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+137, @PTEMPLATE+33, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+138, @PTEMPLATE+34, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+139, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+140, @PTEMPLATE+36, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+141, @PTEMPLATE+37, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+142, @PTEMPLATE+38, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+143, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+144, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+145, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+146, @PTEMPLATE+42, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+147, @PTEMPLATE+43, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+148, @PTEMPLATE+44, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+149, @PTEMPLATE+45, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+150, @PTEMPLATE+46, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+151, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+152, @PTEMPLATE+48, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+153, @PTEMPLATE+49, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+154, @PTEMPLATE+50, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+155, @PTEMPLATE+51, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10),
(@OGUID+156, @PTEMPLATE+52, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+11, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+12, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+13, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+14, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+15, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+16, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+17, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+18, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+19, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+20, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+21, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+22, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+23, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+24, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+25, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+26, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+27, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+28, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+29, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+30, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+31, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+32, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+33, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+34, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+35, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+36, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+37, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+38, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+39, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+40, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+41, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+42, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+43, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+44, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+45, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+46, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+47, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+48, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+49, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+50, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+51, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+52, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

SET @OGUID = 52800;
SET @PTEMPLATE = 5200;
DELETE FROM `pool_gameobject` WHERE `guid` IN (6061, 6074, 6174, 6211, 6253, 6349, 6407, 10082, 10232, 10248, 10323, 10328, 10330, 10331, 10582, 10589, 10590, 10595, 10601, 20770, 20786, 20789, 20792, 20796, 20797, 20814, 20843, 20844, 20846, 20847, 20848, 25454, 34169, 34213, 389469, 389470, 427141, 427142, 427143, 427144, 427145, 427146, 427147, 427148, 427149, 427150, 427151, 427152, 427268);
DELETE FROM `gameobject` WHERE `guid` IN (6061, 6074, 6174, 6211, 6253, 6349, 6407, 10082, 10232, 10248, 10323, 10328, 10330, 10331, 10582, 10589, 10590, 10595, 10601, 20770, 20786, 20789, 20792, 20796, 20797, 20814, 20843, 20844, 20846, 20847, 20848, 25454, 34169, 34213, 389469, 389470, 427141, 427142, 427143, 427144, 427145, 427146, 427147, 427148, 427149, 427150, 427151, 427152, 427268);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -1426, 2782.99, 112.288, 0.89, 0, 0, 0.430511, 0.902585, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -1167.23, 2198.37, 89.178, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -1695.14, 2789.52, 144.595, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, -1202.59, 1346.41, 71.3417, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 1, -1515.7, 1587.06, 83.8948, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, -1082, 2855.4, 155.571, 1.553, 0, 0, 0.700909, 0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, -1685.51, 2907.91, 112.984, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, -905.967, 1554.35, 65.5055, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, -541.81, 1972.59, 99.6952, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, -1780.7, 2332.43, 78.9031, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, -1146.26, 841.045, 135.752, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, -953.958, 858.162, 96.9176, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 1, -654.898, 903.117, 120.886, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 1, -644.395, 764.579, 99.4901, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 1, -505.308, 1586.65, 101.761, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 1, -808.286, 1245.34, 98.5527, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 1, -1079.68, 1495.66, 69.8399, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 1, -1441.55, 1129.64, 97.3767, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1733, 1, -1783.48, 1617.22, 79.1153, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1733, 1, -2248.9, 1933.76, 115.635, -0.994838, 0, 0, 0.477159, -0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1733, 1, 57.0231, 2135.69, 131.945, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1733, 1, -2173.94, 1804.57, 84.9345, 1.3439, 0, 0, 0.622515, 0.782608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1733, 1, -1109.22, 2656.24, 117.811, 2.89725, 0, 0, 0.992546, 0.121869, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1733, 1, -1868.93, 1184.33, 103.297, -2.1293, 0, 0, 0.87462, -0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1733, 1, -783.164, 962.887, 103.31, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1733, 1, -1354.45, 1426.45, 66.6043, 1.97222, 0, 0, 0.833886, 0.551937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1733, 1, -1661.28, 804.258, 113.704, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1733, 1, -1956.47, 1002.19, 120.009, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1733, 1, -2191.98, 2111.58, 82.0862, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1733, 1, -884.113, 1800.19, 69.0845, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1733, 1, -1094.26, 2691.54, 123.094, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1733, 1, -913.527, 1033.02, 96.0823, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1733, 1, -1212.29, 2424.01, 101.576, 2.70526, 0, 0, 0.976296, 0.21644, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1733, 1, -1358.23, 2866.45, 119.355, 1.74533, 0, 0, 0.766044, 0.642788, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1733, 1, -2265.13, 1574.06, 78.2124, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1733, 1, 192.382, 1893.76, 135.219, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1733, 1, -2199.96, 1511.52, 98.9612, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1733, 1, -2002.61, 1662.37, 74.5551, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1733, 1, -1593.27, 2493.74, 142.673, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1733, 1, -1437.98, 2781.71, 116.279, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1733, 1, -1175.74, 684.178, 182.837, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1733, 1, -1082.72, 1344.55, 72.0954, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1733, 1, -859.79, 1664.28, 70.2439, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1733, 1, -840.317, 2114.2, 73.7164, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1733, 1, -581.519, 2129.99, 95.8021, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1733, 1, -172.933, 1551.46, 86.9544, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1733, 1, 85.895, 1468.23, 139.609, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1733, 1, 207.636, 2918.99, 23.1314, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1733, 1, -2248.52, 1271.64, 85.5893, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1734, 1, -1426, 2782.99, 112.288, 0.89, 0, 0, 0.430511, 0.902585, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1734, 1, -1167.23, 2198.37, 89.178, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1734, 1, -1695.14, 2789.52, 144.595, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1734, 1, -1202.59, 1346.41, 71.3417, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1734, 1, -1515.7, 1587.06, 83.8948, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1734, 1, -1082, 2855.4, 155.571, 1.553, 0, 0, 0.700909, 0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1734, 1, -1685.51, 2907.91, 112.984, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1734, 1, -905.967, 1554.35, 65.5055, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1734, 1, -541.81, 1972.59, 99.6952, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1734, 1, -1780.7, 2332.43, 78.9031, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1734, 1, -1146.26, 841.045, 135.752, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1734, 1, -953.958, 858.162, 96.9176, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1734, 1, -654.898, 903.117, 120.886, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1734, 1, -644.395, 764.579, 99.4901, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 1734, 1, -505.308, 1586.65, 101.761, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1734, 1, -808.286, 1245.34, 98.5527, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 1734, 1, -1079.68, 1495.66, 69.8399, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 1734, 1, -1441.55, 1129.64, 97.3767, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 1734, 1, -1783.48, 1617.22, 79.1153, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 1734, 1, -2248.9, 1933.76, 115.635, -0.994838, 0, 0, 0.477159, -0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 1734, 1, 57.0231, 2135.69, 131.945, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 1734, 1, -2173.94, 1804.57, 84.9345, 1.3439, 0, 0, 0.622515, 0.782608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 1734, 1, -1109.22, 2656.24, 117.811, 2.89725, 0, 0, 0.992546, 0.121869, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 1734, 1, -1868.93, 1184.33, 103.297, -2.1293, 0, 0, 0.87462, -0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 1734, 1, -783.164, 962.887, 103.31, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 1734, 1, -1354.45, 1426.45, 66.6043, 1.97222, 0, 0, 0.833886, 0.551937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 1734, 1, -1661.28, 804.258, 113.704, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 1734, 1, -1956.47, 1002.19, 120.009, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 1734, 1, -2191.98, 2111.58, 82.0862, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 1734, 1, -884.113, 1800.19, 69.0845, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 1734, 1, -1094.26, 2691.54, 123.094, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 1734, 1, -913.527, 1033.02, 96.0823, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 1734, 1, -1212.29, 2424.01, 101.576, 2.70526, 0, 0, 0.976296, 0.21644, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 1734, 1, -1358.23, 2866.45, 119.355, 1.74533, 0, 0, 0.766044, 0.642788, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 1734, 1, -2265.13, 1574.06, 78.2124, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 1734, 1, 192.382, 1893.76, 135.219, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 1734, 1, -2199.96, 1511.52, 98.9612, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 1734, 1, -2002.61, 1662.37, 74.5551, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 1734, 1, -1593.27, 2493.74, 142.673, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 1734, 1, -1437.98, 2781.71, 116.279, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 1734, 1, -1175.74, 684.178, 182.837, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 1734, 1, -1082.72, 1344.55, 72.0954, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 1734, 1, -859.79, 1664.28, 70.2439, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 1734, 1, -840.317, 2114.2, 73.7164, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 1734, 1, -581.519, 2129.99, 95.8021, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 1734, 1, -172.933, 1551.46, 86.9544, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 1734, 1, 85.895, 1468.23, 139.609, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 1734, 1, 207.636, 2918.99, 23.1314, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 1734, 1, -2248.52, 1271.64, 85.5893, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 1735, 1, -1426, 2782.99, 112.288, 0.89, 0, 0, 0.430511, 0.902585, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 1735, 1, -1167.23, 2198.37, 89.178, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 1735, 1, -1695.14, 2789.52, 144.595, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 1735, 1, -1202.59, 1346.41, 71.3417, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 1735, 1, -1515.7, 1587.06, 83.8948, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 1735, 1, -1082, 2855.4, 155.571, 1.553, 0, 0, 0.700909, 0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 1735, 1, -1685.51, 2907.91, 112.984, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 1735, 1, -905.967, 1554.35, 65.5055, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 1735, 1, -541.81, 1972.59, 99.6952, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+108, 1735, 1, -1780.7, 2332.43, 78.9031, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+109, 1735, 1, -1146.26, 841.045, 135.752, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+110, 1735, 1, -953.958, 858.162, 96.9176, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+111, 1735, 1, -654.898, 903.117, 120.886, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+112, 1735, 1, -644.395, 764.579, 99.4901, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+113, 1735, 1, -505.308, 1586.65, 101.761, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+114, 1735, 1, -808.286, 1245.34, 98.5527, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+115, 1735, 1, -1079.68, 1495.66, 69.8399, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+116, 1735, 1, -1441.55, 1129.64, 97.3767, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+117, 1735, 1, -1783.48, 1617.22, 79.1153, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+118, 1735, 1, -2248.9, 1933.76, 115.635, -0.994838, 0, 0, 0.477159, -0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+119, 1735, 1, 57.0231, 2135.69, 131.945, 0.383972, 0, 0, 0.190809, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+120, 1735, 1, -2173.94, 1804.57, 84.9345, 1.3439, 0, 0, 0.622515, 0.782608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+121, 1735, 1, -1109.22, 2656.24, 117.811, 2.89725, 0, 0, 0.992546, 0.121869, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+122, 1735, 1, -1868.93, 1184.33, 103.297, -2.1293, 0, 0, 0.87462, -0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+123, 1735, 1, -783.164, 962.887, 103.31, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+124, 1735, 1, -1354.45, 1426.45, 66.6043, 1.97222, 0, 0, 0.833886, 0.551937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+125, 1735, 1, -1661.28, 804.258, 113.704, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+126, 1735, 1, -1956.47, 1002.19, 120.009, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+127, 1735, 1, -2191.98, 2111.58, 82.0862, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+128, 1735, 1, -884.113, 1800.19, 69.0845, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+129, 1735, 1, -1094.26, 2691.54, 123.094, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+130, 1735, 1, -913.527, 1033.02, 96.0823, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+131, 1735, 1, -1212.29, 2424.01, 101.576, 2.70526, 0, 0, 0.976296, 0.21644, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+132, 1735, 1, -1358.23, 2866.45, 119.355, 1.74533, 0, 0, 0.766044, 0.642788, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+133, 1735, 1, -2265.13, 1574.06, 78.2124, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+134, 1735, 1, 192.382, 1893.76, 135.219, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+135, 1735, 1, -2199.96, 1511.52, 98.9612, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+136, 1735, 1, -2002.61, 1662.37, 74.5551, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+137, 1735, 1, -1593.27, 2493.74, 142.673, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+138, 1735, 1, -1437.98, 2781.71, 116.279, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+139, 1735, 1, -1175.74, 684.178, 182.837, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+140, 1735, 1, -1082.72, 1344.55, 72.0954, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+141, 1735, 1, -859.79, 1664.28, 70.2439, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+142, 1735, 1, -840.317, 2114.2, 73.7164, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+143, 1735, 1, -581.519, 2129.99, 95.8021, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+144, 1735, 1, -172.933, 1551.46, 86.9544, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+145, 1735, 1, 85.895, 1468.23, 139.609, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+146, 1735, 1, 207.636, 2918.99, 23.1314, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+147, 1735, 1, -2248.52, 1271.64, 85.5893, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+17, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+18, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+19, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+20, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+21, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+23, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+24, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+25, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+26, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+27, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+28, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+29, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+30, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+31, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+32, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+33, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+34, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+35, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+36, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+37, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+38, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+39, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+40, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+41, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+42, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+43, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+44, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+45, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+46, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+47, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+48, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@PTEMPLATE+49, 1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+12, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+13, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+14, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+15, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+16, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+17, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+18, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+19, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+20, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+21, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+22, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+23, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+24, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+25, @PTEMPLATE+25, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+26, @PTEMPLATE+26, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+27, @PTEMPLATE+27, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+28, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+29, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+30, @PTEMPLATE+30, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+31, @PTEMPLATE+31, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+32, @PTEMPLATE+32, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+33, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+34, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+35, @PTEMPLATE+35, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+36, @PTEMPLATE+36, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+37, @PTEMPLATE+37, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+38, @PTEMPLATE+38, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+39, @PTEMPLATE+39, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+40, @PTEMPLATE+40, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+41, @PTEMPLATE+41, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+42, @PTEMPLATE+42, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+43, @PTEMPLATE+43, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+44, @PTEMPLATE+44, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+45, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+46, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+47, @PTEMPLATE+47, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+48, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+49, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+50, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+51, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+52, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+53, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+54, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+55, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+56, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+57, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+58, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+59, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+60, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+61, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+62, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+63, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+64, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+65, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+66, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+67, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+68, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+69, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+70, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+71, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+72, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+73, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+74, @PTEMPLATE+25, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+75, @PTEMPLATE+26, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+76, @PTEMPLATE+27, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+77, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+78, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+79, @PTEMPLATE+30, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+80, @PTEMPLATE+31, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+81, @PTEMPLATE+32, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+82, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+83, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+84, @PTEMPLATE+35, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+85, @PTEMPLATE+36, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+86, @PTEMPLATE+37, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+87, @PTEMPLATE+38, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+88, @PTEMPLATE+39, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+89, @PTEMPLATE+40, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+90, @PTEMPLATE+41, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+91, @PTEMPLATE+42, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+92, @PTEMPLATE+43, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+93, @PTEMPLATE+44, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+94, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+95, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+96, @PTEMPLATE+47, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+97, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+98, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+99, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+100, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+101, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+102, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+103, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+104, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+105, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+106, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+107, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+108, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+109, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+110, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+111, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+112, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+113, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+114, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+115, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+116, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+117, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+118, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+119, @PTEMPLATE+21, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+120, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+121, @PTEMPLATE+23, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+122, @PTEMPLATE+24, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+123, @PTEMPLATE+25, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+124, @PTEMPLATE+26, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+125, @PTEMPLATE+27, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+126, @PTEMPLATE+28, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+127, @PTEMPLATE+29, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+128, @PTEMPLATE+30, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+129, @PTEMPLATE+31, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+130, @PTEMPLATE+32, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+131, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+132, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+133, @PTEMPLATE+35, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+134, @PTEMPLATE+36, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+135, @PTEMPLATE+37, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+136, @PTEMPLATE+38, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+137, @PTEMPLATE+39, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+138, @PTEMPLATE+40, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+139, @PTEMPLATE+41, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+140, @PTEMPLATE+42, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+141, @PTEMPLATE+43, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+142, @PTEMPLATE+44, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+143, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+144, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+145, @PTEMPLATE+47, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+146, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10),
(@OGUID+147, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Desolace', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+13, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+14, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+15, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+16, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+17, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+18, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+19, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+20, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+21, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+22, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+23, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+24, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+25, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+26, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+27, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+28, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+29, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+30, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+31, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+32, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+33, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+34, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+35, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+36, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+37, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+38, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+39, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+40, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+41, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+42, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+43, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+44, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+45, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+46, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+47, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+48, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+49, 9908, 0, 'Desolace - Silver Vein / Gold Vein / Iron Deposit', 0);

SET @OGUID = 51210;
SET @PTEMPLATE = 5249;
DELETE FROM `pool_gameobject` WHERE `guid` IN (5500, 5522, 5571, 5600, 5654, 6865, 8912, 8950, 9689, 20725, 20726, 20727, 20728, 20729, 20730, 20754, 20755, 20822, 20824, 20838, 43248, 43249, 43250, 43251, 43253, 251504, 251505, 251506, 251507, 251508, 251509, 251510, 251512);
DELETE FROM `gameobject` WHERE `guid` IN (5500, 5522, 5571, 5600, 5654, 6865, 8912, 8950, 9689, 20725, 20726, 20727, 20728, 20729, 20730, 20754, 20755, 20822, 20824, 20838, 43248, 43249, 43250, 43251, 43253, 251504, 251505, 251506, 251507, 251508, 251509, 251510, 251512);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, -1940.36, 1653.59, 62.6459, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, -1521, 1964.46, 67.374, 1.85, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, -1120.6, 2110.51, 86.2034, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, -1276.26, 2162.55, 99.6269, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, -2057.46, 2282.55, 68.2259, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, -1873.53, 2182.41, 81.0751, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 1, -1716.97, 2435.48, 101.691, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 1, -1942.31, 2602.81, 72.7339, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1732, 1, -1787.2, 2460.57, 78.082, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1732, 1, -217.198, 2298.1, 43.6278, -1.43117, 0, 0, 0.656059, -0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1732, 1, -1847.22, 1463.27, 66.0594, -2.74017, 0, 0, 0.979925, -0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1732, 1, -693.297, 2504.13, 47.6133, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1732, 1, -2288.9, 1347.4, 66.215, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1732, 1, -1439.63, 2146.6, 93.2643, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1732, 1, -1257.96, 988.44, 95.3533, -0.523599, 0, 0, 0.258819, -0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1732, 1, -222.367, 843.651, 91.3909, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1732, 1, -1737.01, 2171.06, 89.2184, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1732, 1, -688.839, 2700.32, 37.8741, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1732, 1, -169.338, 1786.58, 155.518, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1732, 1, -1146.02, 1271.71, 94.6874, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1732, 1, -704.537, 1343.63, 94.3765, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1732, 1, -1443.48, 993.682, 96.2679, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1732, 1, -284.348, 1431.92, 105.729, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1732, 1, 295.198, 1856.66, 111.337, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1732, 1, 210.452, 1705.18, 143.72, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1732, 1, -2063.69, 1770.31, 70.3513, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1732, 1, -508.031, 859.585, 94.608, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1732, 1, -649.171, 2845.33, -11.483, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1732, 1, -499.658, 1782.47, 112.706, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1732, 1, -453.404, 2403.45, 95.6945, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1732, 1, -440.694, 2249.32, 94.6829, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1732, 1, -211.131, 2427.72, 4.66274, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1732, 1, 126.755, 1559.23, 158.139, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1733, 1, -1940.36, 1653.59, 62.6459, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1733, 1, -1521, 1964.46, 67.374, 1.85, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1733, 1, -1120.6, 2110.51, 86.2034, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1733, 1, -1276.26, 2162.55, 99.6269, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1733, 1, -2057.46, 2282.55, 68.2259, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1733, 1, -1873.53, 2182.41, 81.0751, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1733, 1, -1716.97, 2435.48, 101.691, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1733, 1, -1942.31, 2602.81, 72.7339, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1733, 1, -1787.2, 2460.57, 78.082, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1733, 1, -217.198, 2298.1, 43.6278, -1.43117, 0, 0, 0.656059, -0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1733, 1, -1847.22, 1463.27, 66.0594, -2.74017, 0, 0, 0.979925, -0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1733, 1, -693.297, 2504.13, 47.6133, 2.21657, 0, 0, 0.894934, 0.446198, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1733, 1, -2288.9, 1347.4, 66.215, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1733, 1, -1439.63, 2146.6, 93.2643, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1733, 1, -1257.96, 988.44, 95.3533, -0.523599, 0, 0, 0.258819, -0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1733, 1, -222.367, 843.651, 91.3909, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1733, 1, -1737.01, 2171.06, 89.2184, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1733, 1, -688.839, 2700.32, 37.8741, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1733, 1, -169.338, 1786.58, 155.518, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1733, 1, -1146.02, 1271.71, 94.6874, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1733, 1, -704.537, 1343.63, 94.3765, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1733, 1, -1443.48, 993.682, 96.2679, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1733, 1, -284.348, 1431.92, 105.729, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1733, 1, 295.198, 1856.66, 111.337, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1733, 1, 210.452, 1705.18, 143.72, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1733, 1, -2063.69, 1770.31, 70.3513, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1733, 1, -508.031, 859.585, 94.608, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1733, 1, -649.171, 2845.33, -11.483, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1733, 1, -499.658, 1782.47, 112.706, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1733, 1, -453.404, 2403.45, 95.6945, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 1733, 1, -440.694, 2249.32, 94.6829, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1733, 1, -211.131, 2427.72, 4.66274, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 1733, 1, 126.755, 1559.23, 158.139, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+12, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+13, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+14, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+15, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+16, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+17, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+18, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+19, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+20, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+21, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+22, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+23, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+24, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+25, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+26, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+27, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+28, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+29, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+30, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+31, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+32, 1, 'Tin Vein / Silver Vein - Desolace', 10),
(@PTEMPLATE+33, 1, 'Tin Vein / Silver Vein - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+10, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+11, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+12, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+13, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+14, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+15, @PTEMPLATE+15, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+16, @PTEMPLATE+16, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+17, @PTEMPLATE+17, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+18, @PTEMPLATE+18, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+19, @PTEMPLATE+19, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+20, @PTEMPLATE+20, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+21, @PTEMPLATE+21, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+22, @PTEMPLATE+22, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+23, @PTEMPLATE+23, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+24, @PTEMPLATE+24, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+25, @PTEMPLATE+25, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+26, @PTEMPLATE+26, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+27, @PTEMPLATE+27, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+28, @PTEMPLATE+28, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+29, @PTEMPLATE+29, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+30, @PTEMPLATE+30, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+31, @PTEMPLATE+31, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+32, @PTEMPLATE+32, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+33, @PTEMPLATE+33, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+34, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+35, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+36, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+37, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+38, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+39, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+40, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+41, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+42, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+43, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+44, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+45, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+46, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+47, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+48, @PTEMPLATE+15, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+49, @PTEMPLATE+16, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+50, @PTEMPLATE+17, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+51, @PTEMPLATE+18, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+52, @PTEMPLATE+19, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+53, @PTEMPLATE+20, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+54, @PTEMPLATE+21, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+55, @PTEMPLATE+22, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+56, @PTEMPLATE+23, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+57, @PTEMPLATE+24, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+58, @PTEMPLATE+25, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+59, @PTEMPLATE+26, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+60, @PTEMPLATE+27, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+61, @PTEMPLATE+28, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+62, @PTEMPLATE+29, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+63, @PTEMPLATE+30, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+64, @PTEMPLATE+31, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+65, @PTEMPLATE+32, 'Tin Vein / Silver Vein - Desolace', 10),
(@OGUID+66, @PTEMPLATE+33, 'Tin Vein / Silver Vein - Desolace', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+9, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+10, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+11, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+12, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+13, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+14, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+15, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+16, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+17, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+18, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+19, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+20, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+21, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+22, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+23, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+24, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+25, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+26, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+27, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+28, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+29, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+30, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+31, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+32, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+33, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0);

-- Add Chance
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Desolace" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
