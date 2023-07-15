DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230714152938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230714152938');
-- Add your query below.


-- Gnomeregan / 74447 / 74448 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 2941;
SET @PTEMPLATE = 2766;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32422, 32399, 32440));
DELETE FROM `gameobject` WHERE `guid` IN (32422, 32399, 32440);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32422, 32399, 32440);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 74447, 90, -754.344, 364, -272.596, 2.80998, 0, 0, 0.986286, 0.165048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 74447, 90, -630.556, 66.5022, -183.275, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 74447, 90, -440.175, 81.8185, -151.476, 1.25664, 0, 0, 0.587785, 0.809017, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 74447, 90, -830.873, 278.731, -272.596, 1.36136, 0, 0, 0.62932, 0.777146, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 74447, 90, -622.664, 51.5146, -199.646, 3.05433, 0, 0, 0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 74447, 90, -622.582, 123.07, -199.646, 3.99681, 0, 0, -0.909961, 0.414694, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 74448, 90, -754.344, 364, -272.596, 2.80998, 0, 0, 0.986286, 0.165048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 74448, 90, -630.556, 66.5022, -183.275, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 74448, 90, -440.175, 81.8185, -151.476, 1.25664, 0, 0, 0.587785, 0.809017, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 74448, 90, -830.873, 278.731, -272.596, 1.36136, 0, 0, 0.62932, 0.777146, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 74448, 90, -622.664, 51.5146, -199.646, 3.05433, 0, 0, 0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 74448, 90, -622.582, 123.07, -199.646, 3.99681, 0, 0, -0.909961, 0.414694, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@PTEMPLATE+5, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@PTEMPLATE+6, 1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+7, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+8, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+9, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+10, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+11, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10),
(@OGUID+12, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 2, 'Gnomeregan - Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0),
(@PTEMPLATE+2, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0),
(@PTEMPLATE+3, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0),
(@PTEMPLATE+4, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0),
(@PTEMPLATE+5, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0),
(@PTEMPLATE+6, @PTEMPLATE+7, 0, 'Large Iron Bound Chest / Large Solid Chest - Gnomeregan', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
