DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230715212000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230715212000');
-- Add your query below.


-- Blackrock Spire / 153464 / 153469 / Large Solid Chest / Large Mithril Bound Chest
SET @OGUID = 20199;
SET @PTEMPLATE = 3566;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (25437, 25438, 25439, 25450, 25451, 25452, 349151, 349152));
DELETE FROM `gameobject` WHERE `guid` IN (25437, 25438, 25439, 25450, 25451, 25452, 349151, 349152);
DELETE FROM `pool_gameobject` WHERE `guid` IN (25437, 25438, 25439, 25450, 25451, 25452, 349151, 349152);

-- Lower
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 153464, 229, -161.149, -494.667, -18.4564, 5.65487, 0, 0, -0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 153464, 229, -84.2677, -350.104, 70.9524, 1.91986, 0, 0, 0.819152, 0.573577, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 153464, 229, -20.2914, -361.811, 50.6356, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 153464, 229, 86.8551, -587.501, 30.6085, 3.05779, 0, 0, 0.999122, 0.0418896, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 153464, 229, -211.487, -486.088, 87.3902, 0.0523589, 0, 0, 0.0261765, 0.999657, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 153464, 229, -110.612, -423.628, -18.935, 3.4034, 0, 0, -0.991445, 0.130528, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 153464, 229, -78.8378, -582.575, -18.8325, 0.837757, 0, 0, 0.406736, 0.913546, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 153464, 229, -73.9985, -453.335, -18.935, 3.194, 0, 0, -0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 153464, 229, -71.4806, -542.878, 29.1909, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 153464, 229, -64.869, -586.896, 29.1909, 0.890117, 0, 0, 0.430511, 0.902586, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 153464, 229, -43.7227, -302.812, 70.9442, 3.21142, 0, 0, -0.999391, 0.0349061, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 153464, 229, -39.6464, -472.58, -18.765, 4.81711, 0, 0, -0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 153464, 229, -36.1176, -583.828, -18.8201, 1.97222, 0, 0, 0.833885, 0.551938, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 153464, 229, 1.77013, -476.38, -18.7952, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 153464, 229, 62.9164, -471.06, 26.0547, 2.75761, 0, 0, 0.981627, 0.190812, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 153469, 229, -161.149, -494.667, -18.4564, 5.65487, 0, 0, -0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 153469, 229, -84.2677, -350.104, 70.9524, 1.91986, 0, 0, 0.819152, 0.573577, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 153469, 229, -20.2914, -361.811, 50.6356, 4.64258, 0, 0, -0.731354, 0.681998, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 153469, 229, 86.8551, -587.501, 30.6085, 3.05779, 0, 0, 0.999122, 0.0418896, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 153469, 229, -211.487, -486.088, 87.3902, 0.0523589, 0, 0, 0.0261765, 0.999657, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 153469, 229, -110.612, -423.628, -18.935, 3.4034, 0, 0, -0.991445, 0.130528, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 153469, 229, -78.8378, -582.575, -18.8325, 0.837757, 0, 0, 0.406736, 0.913546, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 153469, 229, -73.9985, -453.335, -18.935, 3.194, 0, 0, -0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 153469, 229, -71.4806, -542.878, 29.1909, 0.453785, 0, 0, 0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 153469, 229, -64.869, -586.896, 29.1909, 0.890117, 0, 0, 0.430511, 0.902586, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 153469, 229, -43.7227, -302.812, 70.9442, 3.21142, 0, 0, -0.999391, 0.0349061, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 153469, 229, -39.6464, -472.58, -18.765, 4.81711, 0, 0, -0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 153469, 229, -36.1176, -583.828, -18.8201, 1.97222, 0, 0, 0.833885, 0.551938, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 153469, 229, 1.77013, -476.38, -18.7952, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 153469, 229, 62.9164, -471.06, 26.0547, 2.75761, 0, 0, 0.981627, 0.190812, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+2, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+3, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+4, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+5, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+6, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+7, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+8, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+9, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+10, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+11, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+12, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+13, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+14, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@PTEMPLATE+15, 1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+16, @PTEMPLATE+1, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+17, @PTEMPLATE+2, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+18, @PTEMPLATE+3, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+19, @PTEMPLATE+4, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+20, @PTEMPLATE+5, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+21, @PTEMPLATE+6, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+22, @PTEMPLATE+7, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+23, @PTEMPLATE+8, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+24, @PTEMPLATE+9, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+25, @PTEMPLATE+10, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+26, @PTEMPLATE+11, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+27, @PTEMPLATE+12, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+28, @PTEMPLATE+13, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+29, @PTEMPLATE+14, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10),
(@OGUID+30, @PTEMPLATE+15, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 5, 'Lower Blackrock Spire - Large Solid Chest / Large Mithril Bound Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+2, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+3, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+4, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+5, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+6, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+7, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+8, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+9, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+10, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+11, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+12, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+13, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+14, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0),
(@PTEMPLATE+15, @PTEMPLATE+16, 0, 'Large Solid Chest / Large Mithril Bound Chest - Lower Blackrock Spire', 0);

SET @OGUID = 2531;
SET @PTEMPLATE = 287;

-- Upper
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 153464, 229, 163.142, -241.759, 110.949, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 153464, 229, 171.163, -290.776, 110.942, 3.08918, 0, 0, 0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 153464, 229, 170.919, -334.745, 110.951, 3.08918, 0, 0, 0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 153464, 229, 183.647, -369.15, 117.143, 2.44346, 0, 0, 0.939692, 0.34202, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 153469, 229, 163.142, -241.759, 110.949, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 153469, 229, 171.163, -290.776, 110.942, 3.08918, 0, 0, 0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 153469, 229, 170.919, -334.745, 110.951, 3.08918, 0, 0, 0.999657, 0.0262016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 153469, 229, 183.647, -369.15, 117.143, 2.44346, 0, 0, 0.939692, 0.34202, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@PTEMPLATE+2, 1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@PTEMPLATE+3, 1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@PTEMPLATE+4, 1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+5, @PTEMPLATE+1, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+6, @PTEMPLATE+2, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+7, @PTEMPLATE+3, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10),
(@OGUID+8, @PTEMPLATE+4, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Upper Blackrock Spire - Large Solid Chest / Large Mithril Bound Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+5, 0, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0),
(@PTEMPLATE+2, @PTEMPLATE+5, 0, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0),
(@PTEMPLATE+3, @PTEMPLATE+5, 0, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0),
(@PTEMPLATE+4, @PTEMPLATE+5, 0, 'Large Solid Chest / Large Mithril Bound Chest - Upper Blackrock Spire', 0);

DELETE FROM `gameobject_requirement` WHERE `guid` = 349151;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
