DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250124173349');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250124173349');
-- Add your query below.


-- Pool Small Thorium Vein / Truesilver Deposit in Tanaris.
SET @OGUID = 112757;
SET @PTEMPLATE = 7149;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(9915, 4, 'Tanaris - Truesilver Deposit / Small Thorium Vein (Master Pool)', 0, 0, 0, 10);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13570);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, -9250.91, -4122.72, -53.0446, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13570, @PTEMPLATE+1, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+1, @PTEMPLATE+1, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13571);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+2, 2047, 1, -8894, -2071.01, 21.4428, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13571, @PTEMPLATE+2, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+2, @PTEMPLATE+2, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+2, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13572);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+3, 2047, 1, -8854.05, -2247.24, 10.9005, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13572, @PTEMPLATE+3, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+3, @PTEMPLATE+3, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+3, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13573);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 2047, 1, -7974.58, -2353.84, -24.0715, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13573, @PTEMPLATE+4, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+4, @PTEMPLATE+4, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+4, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13574);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 2047, 1, -9234.02, -4041.78, -39.3105, -2.23402, 0, 0, 0.898794, -0.438371, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13574, @PTEMPLATE+5, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+5, @PTEMPLATE+5, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+5, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13575);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+6, 2047, 1, -9099.4, -2099.06, 24.8635, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13575, @PTEMPLATE+6, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+6, @PTEMPLATE+6, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+6, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13576);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 2047, 1, -8990.3, -4147.92, -30.7274, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13576, @PTEMPLATE+7, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+7, @PTEMPLATE+7, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+7, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13577);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+8, 2047, 1, -8844.1, -2373.4, 17.7803, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13577, @PTEMPLATE+8, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+8, @PTEMPLATE+8, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+8, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13578);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 2047, 1, -8327.19, -4634.65, 14.1491, 3.12414, 0, 0, 0.999962, 0.008727, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13578, @PTEMPLATE+9, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+9, @PTEMPLATE+9, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+9, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13579);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+10, 2047, 1, -8042.74, -4665.4, 30.8037, 1.43117, 0, 0, 0.656059, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13579, @PTEMPLATE+10, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+10, @PTEMPLATE+10, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+10, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13580);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 2047, 1, -7896.6, -2350.58, -21.7524, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13580, @PTEMPLATE+11, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+11, @PTEMPLATE+11, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+11, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (13581);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 2047, 1, -7901.32, -2439.83, -31.0405, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13581, @PTEMPLATE+12, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+12, @PTEMPLATE+12, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+12, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (58136);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 2047, 1, -8998.67, -2266.72, 21.2362, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(58136, @PTEMPLATE+13, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+13, @PTEMPLATE+13, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+13, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (58137);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 2047, 1, -8105.63, -4545.38, 22.5823, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(58137, @PTEMPLATE+14, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+14, @PTEMPLATE+14, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+14, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (58138);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 2047, 1, -8025.82, -2638.29, -44.5267, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(58138, @PTEMPLATE+15, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10),
(@OGUID+15, @PTEMPLATE+15, 0, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+15, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

DELETE FROM `pool_template` WHERE `entry` = 1204;

-- Add Chance
-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);

UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
