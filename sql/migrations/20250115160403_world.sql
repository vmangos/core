DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250115160403');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250115160403');
-- Add your query below.


-- Pool Gold Vein / Mithril Deposit / Truesilver Deposit Spawns in Dustwallow Marsh.
SET @OGUID = 90600;
SET @PTEMPLATE = 6000;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9903, 3, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55949);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -2814.9, -2589.18, 33.667, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -2814.9, -2589.18, 33.667, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55949, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+1, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+2, @PTEMPLATE+1, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56059);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+3, 1734, 1, -4378.36, -2958.63, 27.1648, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, -4378.36, -2958.63, 27.1648, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56059, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+3, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+4, @PTEMPLATE+2, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+2, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56061);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 1734, 1, -4678.96, -4025.91, 50.7891, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 1, -4678.96, -4025.91, 50.7891, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56061, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+5, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+6, @PTEMPLATE+3, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+3, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56063);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 1734, 1, -4399.6, -3014.34, 34.0548, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 1, -4399.6, -3014.34, 34.0548, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56063, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+7, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+8, @PTEMPLATE+4, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+4, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220824);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 1734, 1, -5025.09, -3735.54, 52.0642, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 1, -5025.09, -3735.54, 52.0642, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220824, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+9, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+10, @PTEMPLATE+5, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+5, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220825);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 1734, 1, -2784.04, -2644.28, 32.2065, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 1, -2784.04, -2644.28, 32.2065, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220825, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+11, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+12, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+6, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220826);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 1734, 1, -2742.7, -2574.46, 33.3991, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 1, -2742.7, -2574.46, 33.3991, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220826, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+13, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+14, @PTEMPLATE+7, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+7, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220827);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 1734, 1, -4470.82, -2971.23, 30.2181, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2047, 1, -4470.82, -2971.23, 30.2181, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220827, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+15, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+16, @PTEMPLATE+8, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+8, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427056);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+17, 2040, 1, -4434.57, -2908.51, 27.2165, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2047, 1, -4434.57, -2908.51, 27.2165, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427056, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+17, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+18, @PTEMPLATE+9, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+9, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (2222, 220840);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 1734, 1, -4464.97, -2882.58, 22.3767, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220840, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(2222, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+19, @PTEMPLATE+10, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+10, 9903, 0, 'Dustwallow Marsh - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Pool Silver Vein / Gold Vein / Iron Deposit Spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9904, 9, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56027, 40773);
DELETE FROM `pool_template` WHERE `entry` IN (2872);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 1733, 1, -4337.58, -2598.09, 41.2869, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56027, @PTEMPLATE+11, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(40773, @PTEMPLATE+11, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+20, @PTEMPLATE+11, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+11, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (40775, 13674);
DELETE FROM `pool_template` WHERE `entry` IN (2873);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+21, 1733, 1, -3279.71, -3840.21, 52.5267, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(40775, @PTEMPLATE+12, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(13674, @PTEMPLATE+12, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+21, @PTEMPLATE+12, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+12, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (40774, 55969);
DELETE FROM `pool_template` WHERE `entry` IN (2874);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+22, 1733, 1, -2694.8, -4296.36, 8.4852, 2.46091, 0, 0, 0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(40774, @PTEMPLATE+13, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(55969, @PTEMPLATE+13, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+22, @PTEMPLATE+13, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+13, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (40776, 427162);
DELETE FROM `pool_template` WHERE `entry` IN (2875);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+23, 1733, 1, -2525.41, -3510.83, 50.4315, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(40776, @PTEMPLATE+14, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(427162, @PTEMPLATE+14, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+23, @PTEMPLATE+14, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+14, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (11761);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+24, 1733, 1, -2273.89, -4297.95, 9.49099, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 1, -2273.89, -4297.95, 9.49099, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(11761, @PTEMPLATE+15, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+24, @PTEMPLATE+15, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+25, @PTEMPLATE+15, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+15, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (12108);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+26, 1733, 1, -2327.41, -4118.17, 16.9944, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 1, -2327.41, -4118.17, 16.9944, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(12108, @PTEMPLATE+16, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+26, @PTEMPLATE+16, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+27, @PTEMPLATE+16, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+16, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13669);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+28, 1733, 1, -3408.88, -3554.15, 15.8101, 0.296706, 0, 0, 0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 1, -3408.88, -3554.15, 15.8101, 0.296706, 0, 0, 0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13669, @PTEMPLATE+17, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+28, @PTEMPLATE+17, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+29, @PTEMPLATE+17, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+17, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13673);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+30, 1733, 1, -3240.65, -3501.07, 19.8705, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 1, -3240.65, -3501.07, 19.8705, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13673, @PTEMPLATE+18, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+30, @PTEMPLATE+18, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+31, @PTEMPLATE+18, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+18, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13675);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+32, 1733, 1, -3661.02, -3836.26, 6.66474, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1734, 1, -3661.02, -3836.26, 6.66474, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13675, @PTEMPLATE+19, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+32, @PTEMPLATE+19, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+33, @PTEMPLATE+19, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+19, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14611);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+34, 1733, 1, -2816.17, -2718.79, 37.3436, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1734, 1, -2816.17, -2718.79, 37.3436, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+20, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14611, @PTEMPLATE+20, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+34, @PTEMPLATE+20, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+35, @PTEMPLATE+20, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+20, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14956);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+36, 1733, 1, -2989.55, -3071.86, 41.602, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1734, 1, -2989.55, -3071.86, 41.602, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+21, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14956, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+36, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+37, @PTEMPLATE+21, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+21, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55938);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+38, 1733, 1, -2972.48, -3509.33, 63.2665, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1734, 1, -2972.48, -3509.33, 63.2665, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55938, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+38, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+39, @PTEMPLATE+22, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+22, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55940);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+40, 1733, 1, -3192.54, -3406.31, 14.8458, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1734, 1, -3192.54, -3406.31, 14.8458, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+23, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55940, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+40, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+41, @PTEMPLATE+23, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+23, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55954);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+42, 1733, 1, -2467.5, -2932.2, 43.5339, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1734, 1, -2467.5, -2932.2, 43.5339, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+24, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55954, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+42, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+43, @PTEMPLATE+24, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+24, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55962);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+44, 1733, 1, -2666.44, -4233.33, 13.1624, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1734, 1, -2666.44, -4233.33, 13.1624, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+25, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55962, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+44, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+45, @PTEMPLATE+25, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+25, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55963);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+46, 1733, 1, -2819.24, -4116.35, 45.4726, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1734, 1, -2819.24, -4116.35, 45.4726, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+26, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55963, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+46, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+47, @PTEMPLATE+26, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+26, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55966);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+48, 1733, 1, -2715.27, -3905.9, 66.2966, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1734, 1, -2715.27, -3905.9, 66.2966, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+27, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55966, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+48, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+49, @PTEMPLATE+27, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+27, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55970);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+50, 1733, 1, -2557.49, -3790, 13.52, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1734, 1, -2557.49, -3790, 13.52, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+28, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55970, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+50, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+51, @PTEMPLATE+28, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+28, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56021);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+52, 1733, 1, -3609.48, -3458.61, 46.5524, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1734, 1, -3609.48, -3458.61, 46.5524, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+29, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56021, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+52, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+53, @PTEMPLATE+29, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+29, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56026);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+54, 1733, 1, -4344.76, -2621.94, 37.7756, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1734, 1, -4344.76, -2621.94, 37.7756, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+30, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56026, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+54, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+55, @PTEMPLATE+30, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+30, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56032);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+56, 1733, 1, -3782.45, -2723.36, 63.6209, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1734, 1, -3782.45, -2723.36, 63.6209, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+31, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56032, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+56, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+57, @PTEMPLATE+31, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+31, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (389471);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+58, 1733, 1, -3456.27, -3365.72, 52.7804, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1734, 1, -3456.27, -3365.72, 52.7804, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+32, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(389471, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+58, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+59, @PTEMPLATE+32, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+32, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (389472);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+60, 1733, 1, -3051.64, -3319.91, 52.5062, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1734, 1, -3051.64, -3319.91, 52.5062, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+33, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(389472, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+60, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+61, @PTEMPLATE+33, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+33, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427136);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+62, 1733, 1, -4332.39, -2608.17, 40.8422, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1734, 1, -4332.39, -2608.17, 40.8422, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+34, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427136, @PTEMPLATE+34, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+62, @PTEMPLATE+34, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+63, @PTEMPLATE+34, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+34, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427140);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+64, 1733, 1, -2587.26, -3420.52, 51.0784, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1734, 1, -2587.26, -3420.52, 51.0784, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+35, 1, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427140, @PTEMPLATE+35, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+64, @PTEMPLATE+35, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+65, @PTEMPLATE+35, 0, 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+35, 9904, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit', 0);

DELETE FROM `pool_template` WHERE `entry` IN (43520, 1335, 43524, 9005);

-- Pool Tin Vein / Silver Vein Spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9905, 6, 'Dustwallow Marsh - Tin Vein / Silver Vein (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55955);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+66, 1733, 1, -2512.52, -2842.59, 63.2461, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+36, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55955, @PTEMPLATE+36, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+66, @PTEMPLATE+36, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+36, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56024);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+67, 1733, 1, -4203.84, -3725.7, 56.8925, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+37, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56024, @PTEMPLATE+37, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+67, @PTEMPLATE+37, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+37, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55957);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+68, 1733, 1, -2356.37, -3166.03, 49.9149, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+38, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55957, @PTEMPLATE+38, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+68, @PTEMPLATE+38, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+38, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55960);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+69, 1733, 1, -2748.49, -4020.92, 43.7121, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+39, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55960, @PTEMPLATE+39, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+69, @PTEMPLATE+39, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+39, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56025);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+70, 1733, 1, -3770.91, -3715.19, 48.8534, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+40, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56025, @PTEMPLATE+40, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+70, @PTEMPLATE+40, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+40, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (43247);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+71, 1733, 1, -2632.81, -3647.33, 41.4555, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+41, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(43247, @PTEMPLATE+41, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+71, @PTEMPLATE+41, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+41, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (43246);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+72, 1733, 1, -3876.55, -3889.24, 65.1546, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+42, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(43246, @PTEMPLATE+42, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+72, @PTEMPLATE+42, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+42, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (251533);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+73, 1733, 1, -4117.82, -3831.94, 56.7862, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+43, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(251533, @PTEMPLATE+43, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+73, @PTEMPLATE+43, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+43, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (251534);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+74, 1733, 1, -3608.11, -3567.09, 44.7214, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+44, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(251534, @PTEMPLATE+44, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+74, @PTEMPLATE+44, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+44, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (251535);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+75, 1733, 1, -2737.97, -2789.71, 50.6377, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+45, 1, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(251535, @PTEMPLATE+45, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10),
(@OGUID+75, @PTEMPLATE+45, 0, 'Tin Vein / Silver Vein - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+45, 9905, 0, 'Dustwallow Marsh - Tin Vein / Silver Vein', 0);

DELETE FROM `pool_template` WHERE `entry` IN (43521);

-- Pool Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit Spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9906, 2, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (14612);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+76, 1733, 1, -2788.74, -2610.23, 37.3722, 2.94961, 0, 0, 0.995396, 0.095846, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 1734, 1, -2788.74, -2610.23, 37.3722, 2.94961, 0, 0, 0.995396, 0.095846, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 2040, 1, -2788.74, -2610.23, 37.3722, 2.94961, 0, 0, 0.995396, 0.095846, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 2047, 1, -2788.74, -2610.23, 37.3722, 2.94961, 0, 0, 0.995396, 0.095846, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+46, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(14612, @PTEMPLATE+46, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+76, @PTEMPLATE+46, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+77, @PTEMPLATE+46, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+78, @PTEMPLATE+46, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+79, @PTEMPLATE+46, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+46, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55948);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+80, 1733, 1, -2849.43, -2682.88, 33.2633, 5.88176, 0, 0, -0.199367, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 1734, 1, -2849.43, -2682.88, 33.2633, 5.88176, 0, 0, -0.199367, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 2040, 1, -2849.43, -2682.88, 33.2633, 5.88176, 0, 0, -0.199367, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 2047, 1, -2849.43, -2682.88, 33.2633, 5.88176, 0, 0, -0.199367, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+47, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55948, @PTEMPLATE+47, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+80, @PTEMPLATE+47, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+81, @PTEMPLATE+47, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+82, @PTEMPLATE+47, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+83, @PTEMPLATE+47, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+47, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (55950);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+84, 1733, 1, -2823.51, -2610.95, 37.3061, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 1734, 1, -2823.51, -2610.95, 37.3061, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 2040, 1, -2823.51, -2610.95, 37.3061, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 2047, 1, -2823.51, -2610.95, 37.3061, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+48, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55950, @PTEMPLATE+48, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+84, @PTEMPLATE+48, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+85, @PTEMPLATE+48, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+86, @PTEMPLATE+48, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+87, @PTEMPLATE+48, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+48, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56058);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+88, 1733, 1, -4427.89, -2987.49, 30.9241, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 1734, 1, -4427.89, -2987.49, 30.9241, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 2040, 1, -4427.89, -2987.49, 30.9241, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 2047, 1, -4427.89, -2987.49, 30.9241, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+49, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56058, @PTEMPLATE+49, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+88, @PTEMPLATE+49, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+89, @PTEMPLATE+49, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+90, @PTEMPLATE+49, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+91, @PTEMPLATE+49, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+49, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427135);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+92, 1733, 1, -4420.88, -2947.3, 26.1393, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 1734, 1, -4420.88, -2947.3, 26.1393, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 2040, 1, -4420.88, -2947.3, 26.1393, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 2047, 1, -4420.88, -2947.3, 26.1393, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+50, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427135, @PTEMPLATE+50, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+92, @PTEMPLATE+50, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+93, @PTEMPLATE+50, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+94, @PTEMPLATE+50, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+95, @PTEMPLATE+50, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+50, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427137);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+96, 1733, 1, -2793.1, -2622.57, 33.5015, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 1734, 1, -2793.1, -2622.57, 33.5015, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 2040, 1, -2793.1, -2622.57, 33.5015, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 2047, 1, -2793.1, -2622.57, 33.5015, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+51, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427137, @PTEMPLATE+51, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+96, @PTEMPLATE+51, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+97, @PTEMPLATE+51, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+98, @PTEMPLATE+51, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+99, @PTEMPLATE+51, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+51, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427138);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+100, 1733, 1, -2791.36, -2560.33, 29.9303, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 1734, 1, -2791.36, -2560.33, 29.9303, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 2040, 1, -2791.36, -2560.33, 29.9303, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 2047, 1, -2791.36, -2560.33, 29.9303, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+52, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427138, @PTEMPLATE+52, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+100, @PTEMPLATE+52, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+101, @PTEMPLATE+52, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+102, @PTEMPLATE+52, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+103, @PTEMPLATE+52, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+52, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (427139);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+104, 1733, 1, -2747.91, -2619.6, 29.4423, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 1734, 1, -2747.91, -2619.6, 29.4423, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 2040, 1, -2747.91, -2619.6, 29.4423, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 2047, 1, -2747.91, -2619.6, 29.4423, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+53, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(427139, @PTEMPLATE+53, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+104, @PTEMPLATE+53, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+105, @PTEMPLATE+53, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+106, @PTEMPLATE+53, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+107, @PTEMPLATE+53, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+53, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56057);
DELETE FROM `pool_template` WHERE `entry` = 2871;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+108, 1733, 1, -4381.84, -3001.28, 31.054, 3.194, 0, 0, -0.999657, 0.0262017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+109, 1734, 1, -4381.84, -3001.28, 31.054, 3.194, 0, 0, -0.999657, 0.0262017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+110, 2040, 1, -4381.84, -3001.28, 31.054, 3.194, 0, 0, -0.999657, 0.0262017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+111, 2047, 1, -4381.84, -3001.28, 31.054, 3.194, 0, 0, -0.999657, 0.0262017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+54, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56057, @PTEMPLATE+54, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+108, @PTEMPLATE+54, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+109, @PTEMPLATE+54, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+110, @PTEMPLATE+54, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+111, @PTEMPLATE+54, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+54, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (220828);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+112, 1733, 1, -4381.84, -2918.38, 26.5274, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+113, 1734, 1, -4381.84, -2918.38, 26.5274, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+114, 1735, 1, -4381.84, -2918.38, 26.5274, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+115, 2047, 1, -4381.84, -2918.38, 26.5274, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+55, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(220828, @PTEMPLATE+55, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+112, @PTEMPLATE+55, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+113, @PTEMPLATE+55, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+114, @PTEMPLATE+55, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+115, @PTEMPLATE+55, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+55, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (328, 220415);
DELETE FROM `pool_template` WHERE `entry` = 2223;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+116, 1733, 1, -4346.2, -3005.47, 35.1079, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+117, 1734, 1, -4346.2, -3005.47, 35.1079, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+118, 2047, 1, -4346.2, -3005.47, 35.1079, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+56, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(328, @PTEMPLATE+56, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(220415, @PTEMPLATE+56, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+116, @PTEMPLATE+56, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+117, @PTEMPLATE+56, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+118, @PTEMPLATE+56, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+56, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (56033, 220414);
DELETE FROM `pool_template` WHERE `entry` = 23046;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+119, 1733, 1, -4566.88, -2734.63, 45.9512, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+120, 1734, 1, -4566.88, -2734.63, 45.9512, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+121, 2047, 1, -4566.88, -2734.63, 45.9512, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+57, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(56033, @PTEMPLATE+57, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(220414, @PTEMPLATE+57, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+119, @PTEMPLATE+57, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+120, @PTEMPLATE+57, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+121, @PTEMPLATE+57, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+57, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (2223, 220419);
DELETE FROM `pool_template` WHERE `entry` = 9006;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+122, 1733, 1, -2766.39, -2606.88, 34.2974, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+123, 1734, 1, -2766.39, -2606.88, 34.2974, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+124, 1735, 1, -2766.39, -2606.88, 34.2974, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+58, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(2223, @PTEMPLATE+58, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(220419, @PTEMPLATE+58, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+122, @PTEMPLATE+58, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+123, @PTEMPLATE+58, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10),
(@OGUID+124, @PTEMPLATE+58, 0, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+58, 9906, 0, 'Dustwallow Marsh - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

DELETE FROM `pool_gameobject` WHERE `guid` = 157;
DELETE FROM `gameobject` WHERE `guid` = 157;
DELETE FROM `pool_template` WHERE `entry` = 323;
UPDATE `gameobject` SET `id` = 1734 WHERE `guid` = 22035;

-- Add Chance
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Silver Vein / Gold Vein / Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Tin Vein / Silver Vein
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 45 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
