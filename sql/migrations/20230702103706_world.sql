DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230702103706');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230702103706');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Eastern Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(71, 6, 'Solid Chests in Eastern Plaguelands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45734, 71, 0, 'Solid Chest', 0, 10),
(45910, 71, 0, 'Solid Chest', 0, 10),
(45915, 71, 0, 'Solid Chest', 0, 10),
(45931, 71, 0, 'Solid Chest', 0, 10),
(45933, 71, 0, 'Solid Chest', 0, 10),
(45938, 71, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Winterspring.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(72, 5, 'Solid Chests in Winterspring', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49088, 72, 0, 'Solid Chest', 0, 10),
(49089, 72, 0, 'Solid Chest', 0, 10),
(49090, 72, 0, 'Solid Chest', 0, 10),
(49091, 72, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45884, 153454, 0, 3333.82, -5000.1, 168.712, 4.36332, 0, 0, -0.819152, 0.573577, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45734 at 354.426331 yards.
(45885, 153454, 0, 2560.83, -4806.04, 114.984, 0.261798, 0, 0, 0.130526, 0.991445, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45734 at 450.065887 yards.
(45916, 153454, 0, 2506.89, -3804.47, 177.654, 1.62316, 0, 0, 0.725374, 0.688355, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45915 at 106.708992 yards.
(45935, 153454, 0, 2796.36, -5403.23, 162.927, 2.56563, 0, 0, 0.958819, 0.284016, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45931 at 223.274673 yards.
(45937, 153454, 0, 2780.84, -5550.98, 160.7, 0.698131, 0, 0, 0.34202, 0.939693, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45931 at 183.384506 yards.
(45917, 153454, 0, 2416.02, -3709.41, 177.675, 4.46804, 0, 0, -0.788011, 0.615662, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45915 at 128.692413 yards.
(45893, 153454, 0, 3021.77, -4980.58, 106.656, 1.83259, 0, 0, 0.793353, 0.608762, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45734 at 96.062523 yards.
(45940, 153454, 0, 1555.62, -5595.14, 111.171, 6.24828, 0, 0, -0.0174522, 0.999848, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45933 at 270.582367 yards.
(45929, 153454, 0, 3459.3, -4918.52, 170.455, 4.59022, 0, 0, -0.748956, 0.66262, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 45910 at 389.943695 yards.
(45958, 153454, 0, 1599.41, -5315.48, 91.1041, 2.23402, 0, 0, 0.898793, 0.438373, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 45933 at 182.147690 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45884, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45885, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45916, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45935, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45937, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45917, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45893, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45940, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45929, 71, 0, 'Solid Chest', 0, 10), -- Solid Chests in Eastern Plaguelands
(45958, 71, 0, 'Solid Chest', 0, 10); -- Solid Chests in Eastern Plaguelands

-- Missing Solid Chest spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49095, 153454, 1, 6491.73, -3132.61, 570.651, 5.11382, 0, 0, -0.551936, 0.833886, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49089 at 134.646790 yards.
(49139, 153454, 1, 6617.37, -4081.4, 662.525, 1.50098, 0, 0, 0.681998, 0.731354, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49088 at 282.631958 yards.
(49175, 153454, 1, 6313.62, -2395.12, 556.702, 3.52557, 0, 0, -0.981627, 0.190812, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49090 at 554.158752 yards.
(49176, 153454, 1, 6830.53, -3584.34, 718.537, 0.95993, 0, 0, 0.461748, 0.887011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49089 at 468.214447 yards.
(49177, 153454, 1, 6863.55, -5118.35, 695.735, 3.94445, 0, 0, -0.920505, 0.390732, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49091 at 82.700089 yards.
(49186, 153454, 1, 6779, -5047.81, 722.833, 5.37562, 0, 0, -0.438371, 0.898794, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49091 at 104.119934 yards.
(49187, 153454, 1, 6834.71, -5028.53, 691.339, 4.60767, 0, 0, -0.743144, 0.669131, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 49091 at 133.783478 yards.
(49188, 153454, 1, 6843.18, -2482.17, 561.01, 4.29351, 0, 0, -0.83867, 0.54464, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 49090 at 190.344040 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49095, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49139, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49175, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49176, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49177, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49186, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49187, 72, 0, 'Solid Chest', 0, 10), -- Solid Chests in Winterspring
(49188, 72, 0, 'Solid Chest', 0, 10); -- Solid Chests in Winterspring

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 153454;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
