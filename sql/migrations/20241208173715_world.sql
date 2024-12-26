DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241208173715');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241208173715');
-- Add your query below.


-- Pool Truesilver / Small Thorium Vein spawns in Silithus.
SET @OGUID = 85000;
SET @PTEMPLATE = 23003;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, -8068.27, 684.527, 8.24523, -0.645772, 0, 0, 0.317305, -0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23483 at 208.762939 yards.
(@OGUID+2, 2047, 1, -8078.43, 1377.69, 4.93745, 1.67552, 0, 0, 0.743145, 0.669131, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23495 at 178.247742 yards.
(@OGUID+3, 2047, 1, -7567.15, 1733.04, 17.2376, -1.67552, 0, 0, 0.743145, -0.669131, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(23541, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(23560, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(23561, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0);

-- Pool Truesilver / Small Thorium Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 2047, 1, 7320.12, -4313.58, 699.424, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 100311 at 243.589661 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(100341, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+4, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0);
DELETE FROM `gameobject` WHERE `guid` = 3998690;

-- Pool Truesilver / Small Thorium Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 2047, 1, -5561.75, 988.424, 16.2939, 1.29154, 0, 0, 0.601815, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21144 at 77.410103 yards.
(@OGUID+6, 2047, 1, -5313.68, 2163.53, 17.5947, -1.36136, 0, 0, 0.629321, -0.777146, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21143 at 296.426453 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10),
(21155, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10),
(21156, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+5, 985, 0, 'Feralas - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+6, 985, 0, 'Feralas - Truesilver Deposit / Small Thorium Vein', 0);

-- Pool Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 2047, 0, -6737.71, -610.845, 241.217, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29693 at 126.863914 yards.
(@OGUID+8, 1734, 0, -6737.71, -610.845, 241.217, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29693 at 126.863914 yards.
(@OGUID+9, 2040, 0, -6737.71, -610.845, 241.217, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 29693 at 126.863914 yards.
(@OGUID+10, 165658, 0, -6737.71, -610.845, 241.217, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 1, 100, 5, 10); -- Closest existing guid is 29693 at 126.863914 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+8, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+9, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+10, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(29701, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+7, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);
UPDATE `pool_gameobject` SET `patch_min` = 5 WHERE `guid` = @OGUID+10;

-- Pool Mithril Deposit / Truesilver Deposit / Small Thorium Vein spawns in The Hinterlands.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(16701, 17206, 'Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Hinterlands', 10);
UPDATE `pool_gameobject` SET `description` = 'Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Hinterlands' WHERE  `guid` IN (427576, 427578);
UPDATE `pool_pool` SET `mother_pool` = 1070, `description`='Hinterlands - Mithril Deposit / Truesilver Deposit / Small Thorium Vein' WHERE  `pool_id`=17206;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid` IN (427578, 16701);

-- Pool Truesilver / Small Thorium Vein spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 2047, 0, 2282.94, -2285.57, 63.0433, 1.13446, 0, 0, 0.5373, 0.843391, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 261642 at 94.035774 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+11, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(261650, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+8, 1331, 0, 'Western Plaguelands - Truesilver Deposit / Small Thorium Vein', 0);

-- Pool Truesilver / Small Thorium Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 2047, 0, -10805, -2666.73, 12.1114, 0.925024, 0, 0, 0.446198, 0.894934, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 27658 at 91.105774 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+12, @PTEMPLATE+9, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(27672, @PTEMPLATE+9, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+9, 1359, 0, 'Blasted Lands - Truesilver Deposit / Small Thorium Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 1733, 1, 928.468, -274.892, -0.162452, 3.08923, 0, 0, 0.731354, 0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27222 at 24.629126 yards.
(@OGUID+14, 1733, 1, 1661.98, 122.839, 119.924, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27235 at 193.096375 yards.
(@OGUID+15, 1733, 1, -42.6393, 371.164, 119.746, 2.0944, 0, 0, 0.819152, -0.573576, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 27210 at 40.276657 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+12, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+13, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+14, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+15, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(27303, @PTEMPLATE+10, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(27304, @PTEMPLATE+11, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(27305, @PTEMPLATE+12, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+10, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+11, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+12, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 1733, 0, -11302.4, 1478.61, 91.7132, -1.72788, 0, 0, 0.760406, -0.649448, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23371 at 108.026428 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Tin Vein / Silver Vein - Westfall', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+16, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Westfall', 10),
(23540, @PTEMPLATE+13, 'Tin Vein / Silver Vein - Westfall', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+13, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+17, 1733, 0, -5787, -4132.4, 392.252, 1.29154, 0, 0, 0.601815, 0.798636, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23210 at 95.130562 yards.
(@OGUID+18, 1733, 0, -4773.33, -3700.73, 314.729, 3.07178, 0, 0, 0.999391, 0.0348995, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 251644 at 69.460320 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+15, 1, 'Tin Vein / Silver Vein - Loch Modan', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+17, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+18, @PTEMPLATE+15, 'Tin Vein / Silver Vein - Loch Modan', 10),
(23211, @PTEMPLATE+14, 'Tin Vein / Silver Vein - Loch Modan', 10),
(251654, @PTEMPLATE+15, 'Tin Vein / Silver Vein - Loch Modan', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+14, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+15, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in The Barrens.
DELETE FROM `pool_gameobject` WHERE `guid` = 34630;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+19, 1733, 1, -1660.13, -2293.41, 87.9985, -0.959931, 0, 0, 0.461749, -0.887011, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34625 at 73.852585 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+16, 1, 'Tin Vein / Silver Vein - Barrens', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+19, @PTEMPLATE+16, 'Tin Vein / Silver Vein - Barrens', 10),
(34630, @PTEMPLATE+16, 'Tin Vein / Silver Vein - Barrens', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+16, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+20, 1733, 0, -4318.25, -3030.73, 12.2277, -1.32645, 0, 0, 0.615661, -0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22836 at 44.023846 yards.
(@OGUID+21, 1733, 0, -3556.3, -1769.77, 76.4529, -1.25664, 0, 0, 0.587785, -0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22850 at 113.116913 yards.
(@OGUID+22, 1733, 0, -3061.29, -3257.71, 70.5456, -2.79253, 0, 0, 0.984808, -0.173648, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22869 at 52.405243 yards.
(@OGUID+23, 1733, 0, -2659.07, -2014.63, 19.8238, -0.785398, 0, 0, 0.382683, -0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22873 at 76.461021 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+17, 1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@PTEMPLATE+18, 1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@PTEMPLATE+19, 1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@PTEMPLATE+20, 1, 'Tin Vein / Silver Vein - Wetlands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+20, @PTEMPLATE+17, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+21, @PTEMPLATE+18, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+22, @PTEMPLATE+19, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+23, @PTEMPLATE+20, 'Tin Vein / Silver Vein - Wetlands', 10),
(22914, @PTEMPLATE+17, 'Tin Vein / Silver Vein - Wetlands', 10),
(22915, @PTEMPLATE+18, 'Tin Vein / Silver Vein - Wetlands', 10),
(22916, @PTEMPLATE+19, 'Tin Vein / Silver Vein - Wetlands', 10),
(22917, @PTEMPLATE+20, 'Tin Vein / Silver Vein - Wetlands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+17, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+18, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+19, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+20, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Pool Tin Vein / Silver Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+24, 1732, 1, 935.066, -262.797, 21.6798, -0.174533, 0, 0, 0.0871559, -0.996195, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 27268 at 29.385189 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+21, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+24, @PTEMPLATE+21, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(27302, @PTEMPLATE+21, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+21, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- pool Silver Vein / Gold Vein / Iron Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+25, 1734, 1, -4558.38, -139.326, 109.76, -0.418879, 0, 0, 0.207912, -0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22780 at 412.805145 yards.
(@OGUID+26, 1735, 1, -4558.38, -139.326, 109.76, -0.418879, 0, 0, 0.207912, -0.978148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22780 at 412.805145 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+22, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+25, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+26, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(22814, @PTEMPLATE+22, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+22, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Missing Silver Vein spawns in Alterac Mountains.
DELETE FROM `pool_gameobject` WHERE `guid` IN (427023, 427134);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+23, 1, 'Silver Vein / Iron Deposit - Alterac Mountains', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427134, @PTEMPLATE+23, 'Silver Vein / Iron Deposit - Alterac Mountains', 10),
(427023, @PTEMPLATE+23, 'Silver Vein / Iron Deposit - Alterac Mountains', 10);

-- Missing Silver Vein spawns in Stranglethorn Vale.
DELETE FROM `pool_gameobject` WHERE `guid` IN (31587, 251502);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+24, 1, 'Tin Vein / Silver Vein - Stranglethorn', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(31587, @PTEMPLATE+24, 'Tin Vein / Silver Vein - Stranglethorn', 10),
(251502, @PTEMPLATE+24, 'Tin Vein / Silver Vein - Stranglethorn', 10);

-- Missing Gold Vein spawns in Desolace.
DELETE FROM `pool_gameobject` WHERE `guid` IN (34210, 20790);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+25, 1, 'Gold Vein / Iron Deposit - Desolace', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34210, @PTEMPLATE+25, 'Gold Vein / Iron Deposit - Desolace', 10),
(20790, @PTEMPLATE+25, 'Gold Vein / Iron Deposit - Desolace', 10);

-- Missing Silver Vein spawns in Thousand Needles.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(3996274, 3206, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);

-- Pool Gold Vein / Mithril Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+27, 2040, 1, -5531.73, 3587.94, -12.624, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21338 at 55.558098 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+26, 1, 'Gold Vein / Mithril Deposit - Feralas', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+27, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit - Feralas', 10),
(21385, @PTEMPLATE+26, 'Gold Vein / Mithril Deposit - Feralas', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+26, 1357, 0, 'Feralas - Gold Vein / Mithril Deposit', 0);

-- Pool Gold Vein / Mithril Deposit / Truesilver Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+28, 2040, 1, 5024.58, -7276.83, -4.43215, 1.16937, 0, 0, 0.551937, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66353 at 284.685760 yards.
(@OGUID+29, 2047, 1, 5024.58, -7276.83, -4.43215, 1.16937, 0, 0, 0.551937, 0.833886, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66353 at 284.685760 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+27, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+28, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+29, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(66469, @PTEMPLATE+27, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+27,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0);

-- Pool Mithril Deposit / Truesilver Deposit spawns in Silithus.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+30, 2047, 1, -7318.67, 377.435, 18.0047, 0.10472, 0, 0, 0.052336, 0.99863, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427513 at 314.044739 yards.
(@OGUID+31, 2047, 1, -8009.26, 1984.93, 15.7425, -1.79769, 0, 0, 0.782608, -0.622515, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16848 at 229.306900 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+28, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+29, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+30, @PTEMPLATE+28, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+31, @PTEMPLATE+29, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(427523, @PTEMPLATE+28, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(16899, @PTEMPLATE+29, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+28,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0),
(@PTEMPLATE+29,  2338, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 0);

-- Pool Gold Vein / Mithril Deposit / Truesilver Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+32, 1734, 1, 4293.85, -6170.96, 133.361, -2.19912, 0, 0, 0.891007, -0.45399, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66377 at 164.510544 yards.
(@OGUID+33, 1734, 1, 4853.9, -6549.07, 118.069, -1.06465, 0, 0, 0.507538, -0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66406 at 175.840027 yards.
(@OGUID+34, 1734, 1, 2002.13, -5895.49, -6.39748, -0.715585, 0, 0, 0.350207, -0.936672, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66391 at 278.309875 yards.
(@OGUID+35, 2047, 1, 4293.85, -6170.96, 133.361, -2.19912, 0, 0, 0.891007, -0.45399, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66377 at 164.510544 yards.
(@OGUID+36, 2047, 1, 4853.9, -6549.07, 118.069, -1.06465, 0, 0, 0.507538, -0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 66406 at 175.840027 yards.
(@OGUID+37, 2047, 1, 2002.13, -5895.49, -6.39748, -0.715585, 0, 0, 0.350207, -0.936672, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66391 at 278.309875 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+30, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+31, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@PTEMPLATE+32, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+32, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+33, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+34, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+35, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+36, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(@OGUID+37, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(66455, @PTEMPLATE+30, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(66456, @PTEMPLATE+31, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10),
(66459, @PTEMPLATE+32, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+30, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+31, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+32, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0);

-- Pool Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit spawns in Swamp of Sorrows.
DELETE FROM `gameobject` WHERE `guid` IN (26108, 26131, 26154);
DELETE FROM `pool_gameobject` WHERE `guid` IN (26108, 26131, 26154);
DELETE FROM `pool_template` WHERE `entry` = 21589;
DELETE FROM `pool_pool` WHERE `pool_id` = 21589;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+38, 1733, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23163 at 36.635441 yards.
(@OGUID+39, 1733, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23168 at 126.328918 yards.
(@OGUID+40, 1734, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23163 at 36.635441 yards.
(@OGUID+41, 1734, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23168 at 126.328918 yards.
(@OGUID+42, 1735, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23163 at 36.635441 yards.
(@OGUID+43, 1735, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23168 at 126.328918 yards.
(@OGUID+44, 2047, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23163 at 36.635441 yards.
(@OGUID+45, 2047, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23168 at 126.328918 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+33, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+34, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+38, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+39, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+40, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+41, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+42, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+43, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+44, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+45, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(23189, @PTEMPLATE+33, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(23190, @PTEMPLATE+34, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+33, 1332, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+34, 1332, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Pool Gold Vein / Mithril Deposit spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+46, 1734, 1, -5752.27, 3677.47, -8.37481, -0.750491, 0, 0, 0.366501, -0.930418, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21364 at 197.964096 yards.
(@OGUID+47, 1734, 1, -5585.74, 3546.6, -2.5983, -2.56563, 0, 0, 0.95882, -0.284015, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21365 at 70.341942 yards.
(@OGUID+48, 1734, 1, -5581.2, 3514.24, 19.1351, -2.49582, 0, 0, 0.948324, -0.317305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 21365 at 49.433422 yards.
(@OGUID+49, 1734, 1, -3119.27, 2513.86, 72.785, 3.05433, 0, 0, 0.999048, 0.0436195, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21379 at 363.617218 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+35, 1, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@PTEMPLATE+36, 1, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@PTEMPLATE+37, 1, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@PTEMPLATE+38, 1, 'Gold Vein / Mithril Deposit - Feralas', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+46, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@OGUID+47, @PTEMPLATE+36, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@OGUID+48, @PTEMPLATE+37, 'Gold Vein / Mithril Deposit - Feralas', 10),
(@OGUID+49, @PTEMPLATE+38, 'Gold Vein / Mithril Deposit - Feralas', 10),
(21381, @PTEMPLATE+35, 'Gold Vein / Mithril Deposit - Feralas', 10),
(21382, @PTEMPLATE+36, 'Gold Vein / Mithril Deposit - Feralas', 10),
(21383, @PTEMPLATE+37, 'Gold Vein / Mithril Deposit - Feralas', 10),
(21384, @PTEMPLATE+38, 'Gold Vein / Mithril Deposit - Feralas', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+35, 1357, 0, 'Feralas - Gold Vein / Mithril Deposit', 0),
(@PTEMPLATE+36, 1357, 0, 'Feralas - Gold Vein / Mithril Deposit', 0),
(@PTEMPLATE+37, 1357, 0, 'Feralas - Gold Vein / Mithril Deposit', 0),
(@PTEMPLATE+38, 1357, 0, 'Feralas - Gold Vein / Mithril Deposit', 0);

-- Pool Gold Vein / Mithril Deposit / Truesilver Deposit spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+50, 1734, 1, -8783.8, -4489.43, 44.7562, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427495 at 130.258896 yards.
(@OGUID+51, 1734, 1, -9300.68, -2166.02, 21.5652, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22678 at 100.853592 yards.
(@OGUID+52, 1734, 1, -9526.4, -2399.89, 45.5343, -2.46091, 0, 0, 0.942641, -0.333807, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22705 at 213.071808 yards.
(@OGUID+53, 2047, 1, -8783.8, -4489.43, 44.7562, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427495 at 130.258896 yards.
(@OGUID+54, 2047, 1, -9300.68, -2166.02, 21.5652, 2.58309, 0, 0, 0.961262, 0.275637, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 22678 at 100.853592 yards.
(@OGUID+55, 2047, 1, -9526.4, -2399.89, 45.5343, -2.46091, 0, 0, 0.942641, -0.333807, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22705 at 213.071808 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+39, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+40, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+41, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+50, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+51, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+52, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+53, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+54, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+55, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(427512, @PTEMPLATE+39, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(22772, @PTEMPLATE+40, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(22773, @PTEMPLATE+41, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+39, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+40, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+41, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Pool Tin Vein / Silver Vein / Gold Vein / Iron Deposit spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+56, 1732, 0, -11080.6, -1109.6, 45.5113, -1.51844, 0, 0, 0.688354, -0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25286 at 49.795357 yards.
(@OGUID+57, 1733, 0, -11080.6, -1109.6, 45.5113, -1.51844, 0, 0, 0.688354, -0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25286 at 49.795357 yards.
(@OGUID+58, 1734, 0, -11080.6, -1109.6, 45.5113, -1.51844, 0, 0, 0.688354, -0.725374, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 25286 at 49.795357 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+42, 1, 'Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+56, @PTEMPLATE+42, 'Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+57, @PTEMPLATE+42, 'Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+58, @PTEMPLATE+42, 'Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood', 10),
(25288, @PTEMPLATE+42, 'Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+42, 18830, 0, 'Duskwood - Tin Vein / Silver Vein / Gold Vein / Iron Deposit', 0);

-- Missing Iron Deposit spawns in Dustwallow Marsh.
DELETE FROM `pool_gameobject` WHERE `guid` IN (220414, 56033);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+43, 1, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220414, @PTEMPLATE+43, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10),
(56033, @PTEMPLATE+43, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);

-- Missing Iron Deposit spawns in Alterac Mountains.
DELETE FROM `pool_gameobject` WHERE `guid` IN (10254, 427055);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+44, 1, 'Gold Vein / Iron Deposit - Alterac Mountains', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(10254, @PTEMPLATE+44, 0, 'Gold Vein / Iron Deposit - Alterac Mountains', 0, 10),
(427055, @PTEMPLATE+44, 0, 'Gold Vein / Iron Deposit - Alterac Mountains', 0, 10);

-- Pool Silver Vein / Gold Vein / Iron Deposit in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+59, 1733, 1, -6222.05, -4367.97, -56.7603, -0.226893, 0, 0, 0.113203, -0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27964 at 253.433441 yards.
(@OGUID+60, 1733, 1, -5086.62, -950.802, 1.68455, 0.191986, 0, 0, 0.0958458, 0.995396, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427280 at 77.470131 yards.
(@OGUID+61, 1734, 1, -6222.05, -4367.97, -56.7603, -0.226893, 0, 0, 0.113203, -0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 27964 at 253.433441 yards.
(@OGUID+62, 1734, 1, -5086.62, -950.802, 1.68455, 0.191986, 0, 0, 0.0958458, 0.995396, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427280 at 77.470131 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+45, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+46, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+59, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+60, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+61, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+62, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(28021, @PTEMPLATE+45, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(427294, @PTEMPLATE+46, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+45, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+46, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Missing Mithril Deposit spawns in Badlands.
DELETE FROM `gameobject` WHERE `guid` = 25228;
UPDATE `gameobject` SET `id` = 2040 WHERE `guid` = 31736;
UPDATE `gameobject` SET `id` = 2047 WHERE `guid` = 31794;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands' WHERE `entry`=1756;
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands' WHERE `guid` IN (31736, 31794, 31852);
UPDATE `pool_pool` SET `description` = 'Badlands - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE `pool_id` IN (2186, 1756, 2197, 2212);
UPDATE `pool_pool` SET `mother_pool` = 1288 WHERE `pool_id` = 1756;

-- Missing Mithril Deposit spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+63, 1734, 0, -6437.13, -4166.62, 293.283, -1.64061, 0, 0, 0.731354, -0.681998, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 25168 at 104.834045 yards.
(@OGUID+64, 2047, 0, -6437.13, -4166.62, 293.283, -1.64061, 0, 0, 0.731354, -0.681998, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 25168 at 104.834045 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+47, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+63, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 10),
(@OGUID+64, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 10),
(25229, @PTEMPLATE+47, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+47, 1288, 0, 'Badlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Missing Iron Deposit spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+65, 1733, 0, -1937.67, -3216.95, 78.7885, -0.418879, 0, 0, 0.207912, -0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34496 at 60.664383 yards.
(@OGUID+66, 1733, 0, -2060.62, -2789.07, 68.599, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427227 at 15.839430 yards.
(@OGUID+67, 1733, 0, -570.907, -1973.91, 61.6349, 1.93732, 0, 0, 0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427040 at 117.574150 yards.
(@OGUID+68, 1734, 0, -1937.67, -3216.95, 78.7885, -0.418879, 0, 0, 0.207912, -0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34496 at 60.664383 yards.
(@OGUID+69, 1734, 0, -2060.62, -2789.07, 68.599, 1.15192, 0, 0, 0.544639, 0.838671, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427227 at 15.839430 yards.
(@OGUID+70, 1734, 0, -570.907, -1973.91, 61.6349, 1.93732, 0, 0, 0.824126, 0.566406, 300, 300, 1, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+48, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+49, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+50, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+65, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+66, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+67, @PTEMPLATE+50, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+68, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+69, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+70, @PTEMPLATE+50, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(34590, @PTEMPLATE+48, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(427245, @PTEMPLATE+49, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(427052, @PTEMPLATE+50, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+48, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+49, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+50, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Missing Silver Vein spawns in Arathi Highlands.
DELETE FROM `pool_gameobject` WHERE `guid` IN (25336, 25334);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+51, 1, 'Lesser Bloodstone Deposit / Silver Vein - Arathi Highlands', 10),
(@PTEMPLATE+52, 1, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427547, @PTEMPLATE+51, 'Lesser Bloodstone Deposit / Silver Vein - Arathi Highlands', 10),
(25334, @PTEMPLATE+51, 'Lesser Bloodstone Deposit / Silver Vein - Arathi Highlands', 10),
(427540, @PTEMPLATE+52, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10),
(25336, @PTEMPLATE+52, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+51, 2222, 0, 'Arathi Highlands - Lesser Bloodstone Deposit / Silver Vein', 0),
(@PTEMPLATE+52, 2222, 0, 'Arathi Highlands - Lesser Bloodstone Deposit / Iron Deposit', 0);

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `guid` IN (16701, 16899, 21155, 21156, 21381, 21382, 21383, 21384, 21385, 22772, 22773, 22814, 22914, 22915, 22916, 22917, 23189, 23190, 23211, 23540, 23541, 23560, 23561, 25228, 25229, 25288, 27302, 27303, 27304, 27305, 27672, 28021, 29701, 31587, 31588, 34210, 34590, 66455, 66456, 66459, 66469, 100341, 118820, 251654, 261650, 427052, 427245, 427294, 427512, 427523, 427540, 427547, 3996274);

-- Master Pools For Alterac, STV, Desolace
-- Alterac
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+53, 4, 'Alterac Mountains - Mining Nodes (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2916, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2917, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2918, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2919, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2920, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2921, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2922, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2923, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2924, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2925, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2926, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2927, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(9003, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2907, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2908, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2909, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2910, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2911, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2912, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2913, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2914, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2915, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2901, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2902, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2903, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2904, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2905, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2906, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(2928, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(18870, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(18871, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(23047, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0),
(@PTEMPLATE+23, @PTEMPLATE+53, 0, 'Alterac Mountains - Mining Nodes', 0);

-- STV
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+54, 4, 'Stranglethorn Vale - Mining Nodes (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2885, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2886, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2887, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2888, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2889, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2890, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2891, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2892, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2893, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2900, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2894, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2895, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2896, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2897, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2898, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2899, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2876, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2877, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2878, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2879, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2880, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2881, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2882, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2883, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(2884, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0),
(@PTEMPLATE+24, @PTEMPLATE+54, 0, 'Stranglethorn Vale - Mining Nodes', 0);

-- Desolace
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+55, 44, 'Desolace - Mining Nodes (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3663, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3664, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3665, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3666, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3667, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3668, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3669, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3670, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3671, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(2761, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3679, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3680, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3681, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3682, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3683, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3684, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3685, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3686, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3687, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3688, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3689, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3690, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3691, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(9004, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3672, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3673, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3674, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3675, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3676, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3677, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3678, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3661, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(3662, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0),
(@PTEMPLATE+25, @PTEMPLATE+55, 0, 'Desolace - Mining Nodes', 0);

-- Update Chance
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);

UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 25 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Barrens" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Azshara" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Tin Vein / Silver Vein / Gold Vein / Iron Deposit - Duskwood" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

-- Pool Tin Vein / Silver Vein / Incendicite Mineral Vein spawns in Wetlands
SET @OGUID = 58900;
SET @PTEMPLATE = 4600;

DELETE FROM `gameobject` WHERE `guid` IN (24773, 24774, 24775, 24776, 24777, 24778, 24779, 24780, 24781, 24782, 24783, 24784, 24785, 24786, 24787, 24788, 24789, 24790, 24791, 24792, 24793, 24794, 24795, 24796, 24797, 24798, 24799, 24840, 112803, 112804, 118805, 118806, 118807, 118808, 118809, 118810, 118811, 118812, 118813, 118814, 118815, 118816, 118817, 118818, 118819, 118821, 371794, 371795, 371796, 371797, 371798, 371799, 371800, 371801, 371802, 371803);
DELETE FROM `pool_gameobject` WHERE `guid` IN (24773, 24774, 24775, 24776, 24777, 24778, 24779, 24780, 24781, 24782, 24783, 24784, 24785, 24786, 24787, 24788, 24789, 24790, 24791, 24792, 24793, 24794, 24795, 24796, 24797, 24798, 24799, 24840, 112803, 112804, 118805, 118806, 118807, 118808, 118809, 118810, 118811, 118812, 118813, 118814, 118815, 118816, 118817, 118818, 118819, 118821, 371794, 371795, 371796, 371797, 371798, 371799, 371800, 371801, 371802, 371803);
DELETE FROM `pool_template` WHERE `entry` IN (3660, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 3655, 17009, 17009, 17009, 17010, 17010, 17010, 17011, 17011, 17011, 17012, 17012, 17012, 17013, 17013, 17013, 43527, 43527, 43527, 43528, 43528, 43528, 43529, 43529, 43529, 43530, 43530, 43530, 43531, 43531, 43531, 43532, 43532, 43532, 43533, 43533, 43533, 43534, 43534, 43534, 43535, 43535, 43535);
DELETE FROM `pool_pool` WHERE `mother_pool` = 3660;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1610, 0, -3942.23, -2285.07, 17.1541, -0.2618, 0, 0, 0.130526, -0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1610, 0, -3929.86, -2318.63, 23.0019, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1610, 0, -3895.7, -2362.62, 22.8919, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1610, 0, -3886.07, -2401.82, 26.3338, 0.331613, 0, 0, 0.165048, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1610, 0, -3884.85, -2310.76, 25.4112, 2.89725, 0, 0, 0.992546, 0.121868, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1610, 0, -3880.72, -2459.3, 34.2359, 1.294, 0, 0, 0.602795, 0.797896, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1610, 0, -3877.42, -2484.44, 41.5919, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1610, 0, -3875.72, -2586.04, 44.1806, 2.74017, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1610, 0, -3870.25, -2383.63, 26.5792, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1610, 0, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515036, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1610, 0, -3863.12, -2476.62, 41.4935, -0.069813, 0, 0, -0.0348994, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1610, 0, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, -0.5225, 0.852639, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1610, 0, -3836.94, -2481.73, 35.6039, -0.069813, 0, 0, 0.034899, -0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1610, 0, -3833.58, -2299.88, 30.4736, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1610, 0, -3830.66, -2501.42, 38.5958, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1610, 0, -3830.57, -2431.7, 26.5262, 2.67035, 0, 0, 0.972369, 0.233447, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1610, 0, -3829.84, -2420.19, 27.287, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1610, 0, -3813.83, -2279.43, 33.753, -2.1293, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1610, 0, -3809.23, -2396.89, 28.0163, -1.81514, 0, 0, 0.788011, -0.615661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1610, 0, -3805.75, -2471.3, 27.4686, -0.785398, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1610, 0, -3801.1, -2353.66, 33.2039, 0.034907, 0, 0, 0.017452, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1610, 0, -3799.52, -2390.45, 28.5253, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1610, 0, -3785.22, -2375.88, 30.6012, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1610, 0, -3779.64, -2485.89, 26.3598, 3.624, 0, 0, 0.971051, -0.238872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1610, 0, -3758.25, -2456.14, 28.3123, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1610, 0, -3756.49, -2480.01, 32.6535, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1610, 0, -3874.11, -2340.36, 22.3002, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1667, 0, -3942.23, -2285.07, 17.1541, -0.2618, 0, 0, 0.130526, -0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1667, 0, -3929.86, -2318.63, 23.0019, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1667, 0, -3895.7, -2362.62, 22.8919, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1667, 0, -3886.07, -2401.82, 26.3338, 0.331613, 0, 0, 0.165048, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1667, 0, -3884.85, -2310.76, 25.4112, 2.89725, 0, 0, 0.992546, 0.121868, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1667, 0, -3880.72, -2459.3, 34.2359, 1.294, 0, 0, 0.602795, 0.797896, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1667, 0, -3877.42, -2484.44, 41.5919, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1667, 0, -3875.72, -2586.04, 44.1806, 2.74017, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1667, 0, -3870.25, -2383.63, 26.5792, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1667, 0, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515036, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1667, 0, -3863.12, -2476.62, 41.4935, -0.069813, 0, 0, -0.0348994, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1667, 0, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, -0.5225, 0.852639, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1667, 0, -3836.94, -2481.73, 35.6039, -0.069813, 0, 0, 0.034899, -0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1667, 0, -3833.58, -2299.88, 30.4736, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1667, 0, -3830.66, -2501.42, 38.5958, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1667, 0, -3830.57, -2431.7, 26.5262, 2.67035, 0, 0, 0.972369, 0.233447, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1667, 0, -3829.84, -2420.19, 27.287, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1667, 0, -3813.83, -2279.43, 33.753, -2.1293, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1667, 0, -3809.23, -2396.89, 28.0163, -1.81514, 0, 0, 0.788011, -0.615661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1667, 0, -3805.75, -2471.3, 27.4686, -0.785398, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1667, 0, -3801.1, -2353.66, 33.2039, 0.034907, 0, 0, 0.017452, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1667, 0, -3799.52, -2390.45, 28.5253, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1667, 0, -3785.22, -2375.88, 30.6012, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1667, 0, -3779.64, -2485.89, 26.3598, 3.624, 0, 0, 0.971051, -0.238872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1667, 0, -3758.25, -2456.14, 28.3123, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1667, 0, -3756.49, -2480.01, 32.6535, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1667, 0, -3874.11, -2340.36, 22.3002, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1732, 0, -3942.23, -2285.07, 17.1541, -0.2618, 0, 0, 0.130526, -0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1732, 0, -3929.86, -2318.63, 23.0019, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1732, 0, -3895.7, -2362.62, 22.8919, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1732, 0, -3886.07, -2401.82, 26.3338, 0.331613, 0, 0, 0.165048, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1732, 0, -3884.85, -2310.76, 25.4112, 2.89725, 0, 0, 0.992546, 0.121868, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1732, 0, -3880.72, -2459.3, 34.2359, 1.294, 0, 0, 0.602795, 0.797896, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1732, 0, -3877.42, -2484.44, 41.5919, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1732, 0, -3875.72, -2586.04, 44.1806, 2.74017, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1732, 0, -3870.25, -2383.63, 26.5792, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 1732, 0, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515036, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1732, 0, -3863.12, -2476.62, 41.4935, -0.069813, 0, 0, -0.0348994, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 1732, 0, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, -0.5225, 0.852639, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 1732, 0, -3836.94, -2481.73, 35.6039, -0.069813, 0, 0, 0.034899, -0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 1732, 0, -3833.58, -2299.88, 30.4736, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 1732, 0, -3830.66, -2501.42, 38.5958, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 1732, 0, -3830.57, -2431.7, 26.5262, 2.67035, 0, 0, 0.972369, 0.233447, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 1732, 0, -3829.84, -2420.19, 27.287, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 1732, 0, -3813.83, -2279.43, 33.753, -2.1293, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 1732, 0, -3809.23, -2396.89, 28.0163, -1.81514, 0, 0, 0.788011, -0.615661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 1732, 0, -3805.75, -2471.3, 27.4686, -0.785398, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 1732, 0, -3801.1, -2353.66, 33.2039, 0.034907, 0, 0, 0.017452, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 1732, 0, -3799.52, -2390.45, 28.5253, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 1732, 0, -3785.22, -2375.88, 30.6012, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 1732, 0, -3779.64, -2485.89, 26.3598, 3.624, 0, 0, 0.971051, -0.238872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 1732, 0, -3758.25, -2456.14, 28.3123, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 1732, 0, -3756.49, -2480.01, 32.6535, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 1732, 0, -3874.11, -2340.36, 22.3002, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 1733, 0, -3942.23, -2285.07, 17.1541, -0.2618, 0, 0, 0.130526, -0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 1733, 0, -3929.86, -2318.63, 23.0019, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 1733, 0, -3895.7, -2362.62, 22.8919, 0.994838, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 1733, 0, -3886.07, -2401.82, 26.3338, 0.331613, 0, 0, 0.165048, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 1733, 0, -3884.85, -2310.76, 25.4112, 2.89725, 0, 0, 0.992546, 0.121868, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 1733, 0, -3880.72, -2459.3, 34.2359, 1.294, 0, 0, 0.602795, 0.797896, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 1733, 0, -3877.42, -2484.44, 41.5919, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 1733, 0, -3875.72, -2586.04, 44.1806, 2.74017, 0, 0, 0.979925, 0.199368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 1733, 0, -3870.25, -2383.63, 26.5792, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 1733, 0, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515036, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 1733, 0, -3863.12, -2476.62, 41.4935, -0.069813, 0, 0, -0.0348994, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 1733, 0, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, -0.5225, 0.852639, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 1733, 0, -3836.94, -2481.73, 35.6039, -0.069813, 0, 0, 0.034899, -0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 1733, 0, -3833.58, -2299.88, 30.4736, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 1733, 0, -3830.66, -2501.42, 38.5958, 2.51327, 0, 0, 0.951057, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 1733, 0, -3830.57, -2431.7, 26.5262, 2.67035, 0, 0, 0.972369, 0.233447, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 1733, 0, -3829.84, -2420.19, 27.287, 2.67035, 0, 0, 0.97237, 0.233445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 1733, 0, -3813.83, -2279.43, 33.753, -2.1293, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 1733, 0, -3809.23, -2396.89, 28.0163, -1.81514, 0, 0, 0.788011, -0.615661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 1733, 0, -3805.75, -2471.3, 27.4686, -0.785398, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 1733, 0, -3801.1, -2353.66, 33.2039, 0.034907, 0, 0, 0.017452, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 1733, 0, -3799.52, -2390.45, 28.5253, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 1733, 0, -3785.22, -2375.88, 30.6012, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 1733, 0, -3779.64, -2485.89, 26.3598, 3.624, 0, 0, 0.971051, -0.238872, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 1733, 0, -3758.25, -2456.14, 28.3123, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 1733, 0, -3756.49, -2480.01, 32.6535, 1.09956, 0, 0, 0.522499, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+108, 1733, 0, -3874.11, -2340.36, 22.3002, -0.349066, 0, 0, 0.173648, -0.984808, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+12, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+13, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+14, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+15, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+16, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+17, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+18, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+19, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+20, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+21, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+22, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+23, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+24, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+25, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+26, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@PTEMPLATE+27, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+10, @PTEMPLATE+10, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+11, @PTEMPLATE+11, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+12, @PTEMPLATE+12, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+13, @PTEMPLATE+13, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+14, @PTEMPLATE+14, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+15, @PTEMPLATE+15, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+16, @PTEMPLATE+16, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+17, @PTEMPLATE+17, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+18, @PTEMPLATE+18, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+19, @PTEMPLATE+19, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+20, @PTEMPLATE+20, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+21, @PTEMPLATE+21, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+22, @PTEMPLATE+22, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+23, @PTEMPLATE+23, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+24, @PTEMPLATE+24, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+25, @PTEMPLATE+25, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+26, @PTEMPLATE+26, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+27, @PTEMPLATE+27, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+28, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+29, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+30, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+31, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+32, @PTEMPLATE+5, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+33, @PTEMPLATE+6, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+34, @PTEMPLATE+7, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+35, @PTEMPLATE+8, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+36, @PTEMPLATE+9, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+37, @PTEMPLATE+10, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+38, @PTEMPLATE+11, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+39, @PTEMPLATE+12, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+40, @PTEMPLATE+13, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+41, @PTEMPLATE+14, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+42, @PTEMPLATE+15, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+43, @PTEMPLATE+16, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+44, @PTEMPLATE+17, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+45, @PTEMPLATE+18, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+46, @PTEMPLATE+19, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+47, @PTEMPLATE+20, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+48, @PTEMPLATE+21, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+49, @PTEMPLATE+22, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+50, @PTEMPLATE+23, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+51, @PTEMPLATE+24, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+52, @PTEMPLATE+25, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+53, @PTEMPLATE+26, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+54, @PTEMPLATE+27, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+55, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+56, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+57, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+58, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+59, @PTEMPLATE+5, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+60, @PTEMPLATE+6, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+61, @PTEMPLATE+7, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+62, @PTEMPLATE+8, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+63, @PTEMPLATE+9, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+64, @PTEMPLATE+10, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+65, @PTEMPLATE+11, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+66, @PTEMPLATE+12, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+67, @PTEMPLATE+13, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+68, @PTEMPLATE+14, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+69, @PTEMPLATE+15, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+70, @PTEMPLATE+16, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+71, @PTEMPLATE+17, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+72, @PTEMPLATE+18, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+73, @PTEMPLATE+19, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+74, @PTEMPLATE+20, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+75, @PTEMPLATE+21, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+76, @PTEMPLATE+22, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+77, @PTEMPLATE+23, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+78, @PTEMPLATE+24, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+79, @PTEMPLATE+25, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+80, @PTEMPLATE+26, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+81, @PTEMPLATE+27, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+82, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+83, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+84, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+85, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+86, @PTEMPLATE+5, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+87, @PTEMPLATE+6, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+88, @PTEMPLATE+7, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+89, @PTEMPLATE+8, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+90, @PTEMPLATE+9, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+91, @PTEMPLATE+10, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+92, @PTEMPLATE+11, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+93, @PTEMPLATE+12, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+94, @PTEMPLATE+13, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+95, @PTEMPLATE+14, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+96, @PTEMPLATE+15, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+97, @PTEMPLATE+16, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+98, @PTEMPLATE+17, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+99, @PTEMPLATE+18, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+100, @PTEMPLATE+19, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+101, @PTEMPLATE+20, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+102, @PTEMPLATE+21, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+103, @PTEMPLATE+22, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+104, @PTEMPLATE+23, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+105, @PTEMPLATE+24, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+106, @PTEMPLATE+25, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+107, @PTEMPLATE+26, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10),
(@OGUID+108, @PTEMPLATE+27, 'Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3660, 4, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+2, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+3, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+4, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+5, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+6, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+7, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+8, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+9, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+10, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+11, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+12, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+13, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+14, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+15, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+16, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+17, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+18, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+19, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+20, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+21, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+22, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+23, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+24, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+25, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+26, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+27, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0);

-- Chance
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1610);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Tin Vein / Silver Vein / Incendicite Mineral Vein - Wetlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1667);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
