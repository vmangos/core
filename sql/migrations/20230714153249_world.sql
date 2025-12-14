DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230714153249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230714153249');
-- Add your query below.


-- Scarlet Monastery Library /  75296 / 75299 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 315;
SET @PTEMPLATE = 3540;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (15032, 11899));
DELETE FROM `gameobject` WHERE `guid` IN (15032, 11899);
DELETE FROM `pool_gameobject` WHERE `guid` IN (15032, 11899);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75296, 189, 223.898, -292.728, 19.1996, 2.51327, 0, 0, 0.951057, 0.309017, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75296, 189, 278.514, -401.431, 20.3957, 3.03684, 0, 0, 0.998629, 0.0523532, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75296, 189, 175.541, -418.852, 18.868, 6.21337, 0, 0, -0.0348988, 0.999391, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75296, 189, 277.401, -365.671, 20.3969, 3.05433, 0, 0, 0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75299, 189, 223.898, -292.728, 19.1996, 2.51327, 0, 0, 0.951057, 0.309017, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75299, 189, 278.514, -401.431, 20.3957, 3.03684, 0, 0, 0.998629, 0.0523532, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75299, 189, 175.541, -418.852, 18.868, 6.21337, 0, 0, -0.0348988, 0.999391, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75299, 189, 277.401, -365.671, 20.3969, 3.05433, 0, 0, 0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+5, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+6, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+7, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10),
(@OGUID+8, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Scarlet Monastery Library - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0),
(@PTEMPLATE+2, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0),
(@PTEMPLATE+3, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0),
(@PTEMPLATE+4, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Library', 0);

-- Scarlet Monastery Armory / 75297 / 75300 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 2346;
SET @PTEMPLATE = 3550;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32252));
DELETE FROM `gameobject` WHERE `guid` IN (32252);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32252);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75297, 189, 1684.87, -345.412, 18.0233, 0.034907, 0, 0, 0.017452, 0.999848, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75297, 189, 1743.48, -407.254, 8.01026, 0.0174525, 0, 0, 0.00872612, 0.999962, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75300, 189, 1684.87, -345.412, 18.0233, 0.034907, 0, 0, 0.017452, 0.999848, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75300, 189, 1743.48, -407.254, 8.01026, 0.0174525, 0, 0, 0.00872612, 0.999962, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10),
(@OGUID+3, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10),
(@OGUID+4, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 2, 'Scarlet Monastery Armory - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+3, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0),
(@PTEMPLATE+2, @PTEMPLATE+3, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Armory', 0);

-- Scarlet Monastery Armory / 3703 / 3704 / Armor Crate / Weapon Crate
SET @OGUID = 3008;
SET @PTEMPLATE = 3560;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (2557, 2558, 2559, 2560, 32253, 32254));
DELETE FROM `gameobject` WHERE `guid` IN (2557, 2558, 2559, 2560, 32253, 32254);
DELETE FROM `pool_gameobject` WHERE `guid` IN (2557, 2558, 2559, 2560, 32253, 32254);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3703, 189, 1743.97, -389.967, 8.00978, 0.0349062, 0, 0, 0.0174522, 0.999848, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3703, 189, 1782.58, -414.356, 8.01169, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3703, 189, 1795.07, -431.977, 8.01001, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3703, 189, 1803.25, -398.513, 8.01243, 3.12412, 0, 0, 0.999962, 0.00873464, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3703, 189, 1745.17, -357.994, 8.01148, -1.85005, 0, 0, 0.798635, -0.601815, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3703, 189, 1771.76, -377.259, 8.01092, -1.51844, 0, 0, 0.688354, -0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3704, 189, 1743.97, -389.967, 8.00978, 0.0349062, 0, 0, 0.0174522, 0.999848, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3704, 189, 1782.58, -414.356, 8.01169, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3704, 189, 1795.07, -431.977, 8.01001, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3704, 189, 1803.25, -398.513, 8.01243, 3.12412, 0, 0, 0.999962, 0.00873464, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3704, 189, 1745.17, -357.994, 8.01148, -1.85005, 0, 0, 0.798635, -0.601815, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3704, 189, 1771.76, -377.259, 8.01092, -1.51844, 0, 0, 0.688354, -0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+2, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+3, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+4, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+5, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@PTEMPLATE+6, 1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+7, @PTEMPLATE+1, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+8, @PTEMPLATE+2, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+9, @PTEMPLATE+3, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+10, @PTEMPLATE+4, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+11, @PTEMPLATE+5, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10),
(@OGUID+12, @PTEMPLATE+6, 'Armor Crate / Weapon Crate - Scarlet Monastery Armory', 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
