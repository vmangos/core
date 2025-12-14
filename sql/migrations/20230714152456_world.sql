DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230714152456');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230714152456');
-- Add your query below.


-- Razorfen Kraul / 74447 / 74448 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 353;
SET @PTEMPLATE = 2761;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (35705, 35721));
DELETE FROM `gameobject` WHERE `guid` IN (35705, 35721);
DELETE FROM `pool_gameobject` WHERE `guid` IN (35705, 35721);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 74447, 47, 2111.45, 1613.83, 81.1889, -1.98968, 0, 0, 0.838671, -0.544639, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 74447, 47, 2199.22, 1654.65, 86.1542, -1.37881, 0, 0, 0.636078, -0.771625, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 74447, 47, 2127.73, 1607.64, 81.4757, 1.309, 0, 0, 0.608761, 0.793354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 74447, 47, 2202.04, 1807.37, 64.3126, 2.14675, 0, 0, 0.878817, 0.47716, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 74448, 47, 2111.45, 1613.83, 81.1889, -1.98968, 0, 0, 0.838671, -0.544639, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 74448, 47, 2199.22, 1654.65, 86.1542, -1.37881, 0, 0, 0.636078, -0.771625, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 74448, 47, 2127.73, 1607.64, 81.4757, 1.309, 0, 0, 0.608761, 0.793354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 74448, 47, 2202.04, 1807.37, 64.3126, 2.14675, 0, 0, 0.878817, 0.47716, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+5, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+6, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+7, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10),
(@OGUID+8, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Razorfen Kraul - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0),
(@PTEMPLATE+2, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0),
(@PTEMPLATE+3, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0),
(@PTEMPLATE+4, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Kraul', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
