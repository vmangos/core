DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230713185937');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230713185937');
-- Add your query below.


-- Shadowfang Keep / 75295 / 75298 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 2988;
SET @PTEMPLATE = 2515;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (40662, 40660, 40665));
DELETE FROM `gameobject` WHERE `guid` IN (40662, 40660, 40665);
DELETE FROM `pool_gameobject` WHERE `guid` IN (40662, 40660, 40665);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75295, 33, -189.568, 2122.88, 97.3899, 1.39626, 0, 0, 0.642788, 0.766044, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75295, 33, -107.226, 2168.85, 101.521, 3.03687, 0, 0, 0.921125, -0.389267, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75295, 33, -255.201, 2166.04, 93.9366, 5.88176, 0, 0, -0.199368, 0.979925, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75295, 33, -133.986, 2183.01, 113.132, 4.36332, 0, 0, -0.819152, 0.573577, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75295, 33, -106.541, 2164.01, 101.52, 3.03684, 0, 0, 0.998629, 0.0523532, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75295, 33, -236.728, 2299.61, 94.6765, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75298, 33, -189.568, 2122.88, 97.3899, 1.39626, 0, 0, 0.642788, 0.766044, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75298, 33, -107.226, 2168.85, 101.521, 3.03687, 0, 0, 0.921125, -0.389267, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 75298, 33, -255.201, 2166.04, 93.9366, 5.88176, 0, 0, -0.199368, 0.979925, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 75298, 33, -133.986, 2183.01, 113.132, 4.36332, 0, 0, -0.819152, 0.573577, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 75298, 33, -106.541, 2164.01, 101.52, 3.03684, 0, 0, 0.998629, 0.0523532, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 75298, 33, -236.728, 2299.61, 94.6765, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@PTEMPLATE+5, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@PTEMPLATE+6, 1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+7, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+8, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+9, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+10, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+11, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10),
(@OGUID+12, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 2, 'Shadowfang Keep - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0),
(@PTEMPLATE+2, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0),
(@PTEMPLATE+3, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0),
(@PTEMPLATE+4, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0),
(@PTEMPLATE+5, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0),
(@PTEMPLATE+6, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Shadowfang Keep', 0);

-- 75293 / Large Battered Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 75293, 33, -190.976, 2225.68, 79.7585, -1.23918, 0, 0, 0.580703, -0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 75293, 33, -178.815, 2252.85, 86.6049, 5.68977, 0, 0, -0.292372, 0.956305, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 75293, 33, -214.325, 2151.88, 81.1066, 2.3911, 0, 0, 0.930417, 0.366502, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 75293, 33, -191.652, 2161.52, 79.7475, 5.8294, 0, 0, -0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 2, 'Shadowfang Keep - Large Battered Chest', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(@OGUID+13, @PTEMPLATE+8, 'Shadowfang Keep - Large Battered Chest'),
(@OGUID+14, @PTEMPLATE+8, 'Shadowfang Keep - Large Battered Chest'),
(@OGUID+15, @PTEMPLATE+8, 'Shadowfang Keep - Large Battered Chest'),
(@OGUID+16, @PTEMPLATE+8, 'Shadowfang Keep - Large Battered Chest');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
