DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230714153102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230714153102');
-- Add your query below.


-- Razorfen Downs / 75297 / 75300 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 5834;
SET @PTEMPLATE = 254;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32032, 35682));
DELETE FROM `gameobject` WHERE `guid` IN (32032, 35682);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32032, 35682);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75297, 129, 2358.62, 966.718, 40.2895, 1.309, 0, 0, 0.608761, 0.793353, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75297, 129, 2502.75, 944.867, 49.1772, -2.05949, 0, 0, 0.857167, -0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75297, 129, 2494.91, 859.182, 48.014, 1.09956, 0, 0, 0.522498, 0.85264, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75297, 129, 2455.52, 956.494, 35.5014, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75297, 129, 2482.92, 774.275, 46.1014, 4.76475, 0, 0, -0.688354, 0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75297, 129, 2435.01, 995.961, 49.3044, 1.37881, 0, 0, 0.636078, 0.771625, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75297, 129, 2418.72, 1030.88, 38.8304, 3.59538, 0, 0, -0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75297, 129, 2541.91, 734.659, 53.7572, 2.1293, 0, 0, 0.874619, 0.48481, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 75300, 129, 2358.62, 966.718, 40.2895, 1.309, 0, 0, 0.608761, 0.793353, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 75300, 129, 2502.75, 944.867, 49.1772, -2.05949, 0, 0, 0.857167, -0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 75300, 129, 2494.91, 859.182, 48.014, 1.09956, 0, 0, 0.522498, 0.85264, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 75300, 129, 2455.52, 956.494, 35.5014, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 75300, 129, 2482.92, 774.275, 46.1014, 4.76475, 0, 0, -0.688354, 0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 75300, 129, 2435.01, 995.961, 49.3044, 1.37881, 0, 0, 0.636078, 0.771625, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 75300, 129, 2418.72, 1030.88, 38.8304, 3.59538, 0, 0, -0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 75300, 129, 2541.91, 734.659, 53.7572, 2.1293, 0, 0, 0.874619, 0.48481, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+5, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+6, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+7, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@PTEMPLATE+8, 1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+9, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+10, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+11, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+12, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+13, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+14, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+15, @PTEMPLATE+7, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10),
(@OGUID+16, @PTEMPLATE+8, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 2, 'Razorfen Downs - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+2, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+3, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+4, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+5, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+6, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+7, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0),
(@PTEMPLATE+8, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Razorfen Downs', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
