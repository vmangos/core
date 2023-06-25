DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230625171757');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230625171757');
-- Add your query below.


SET @OGUID = 185;
SET @PTEMPLATE = 2509;

-- Missing Weapon Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3689, 1, -1035.84, -3986.77, -75.3307, 5.8294, 0, 0, -0.224951, 0.97437, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55898 at 204.988693 yards.
(@OGUID+2, 3689, 1, -1778.77, -3946.77, -5.78729, 0.418879, 0, 0, 0.207911, 0.978148, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55916 at 160.389771 yards.
(@OGUID+3, 3689, 1, -2120.48, -3896.26, -10.2095, 1.0472, 0, 0, 0.5, 0.866025, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55916 at 505.426819 yards.
(@OGUID+4, 3689, 1, -1136.38, -4072.17, -87.6331, 5.21854, 0, 0, -0.507538, 0.861629, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55898 at 301.884796 yards.
(@OGUID+5, 3689, 1, -2008.18, -3819.33, -9.58786, 2.49582, 0, 0, 0.948323, 0.317306, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55916 at 413.046478 yards.
(@OGUID+6, 3689, 1, -1850.05, -3819.51, -6.28771, 5.02655, 0, 0, -0.587785, 0.809017, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55916 at 269.005035 yards.
(@OGUID+7, 3689, 1, -1278.59, -3934.91, -10.439, 4.2237, 0, 0, -0.857167, 0.515038, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55898 at 268.996582 yards.
(@OGUID+8, 3689, 1, -1476.84, -3908.77, -0.348957, 4.03171, 0, 0, -0.902585, 0.430512, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55916 at 149.852463 yards.
(@OGUID+9, 3689, 1, -1037.3, -3923.91, -73.2812, 1.37881, 0, 0, 0.636078, 0.771625, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 55898 at 144.346252 yards.
(@OGUID+10, 3689, 1, -4049.89, -2390.31, 126.13, 3.00195, 0, 0, 0.997563, 0.0697661, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13438 at 30.856859 yards.
(@OGUID+11, 3689, 1, -4070.11, -2380.71, 110.297, 2.04204, 0, 0, 0.85264, 0.522499, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13435 at 31.332472 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 6, 'Weapon Crate - Barrens', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+2, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+3, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+4, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+5, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+6, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+7, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+8, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+9, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+10, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(@OGUID+11, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(13439, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(55898, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(55916, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(13438, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10),
(13435, @PTEMPLATE+1, 'Weapon Crate - Barrens', 0, 10);

-- Missing Weapon Crate spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 3689, 1, 1831.57, -2754.73, 82.8331, 4.92183, 0, 0, -0.62932, 0.777146, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47973 at 41.952713 yards.
(@OGUID+13, 3689, 1, 1817.35, -2628.76, 61.1289, 1.67551, 0, 0, 0.743144, 0.669131, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47972 at 49.182247 yards.
(@OGUID+14, 3689, 1, 1914.78, -2641.69, 82.8735, 0.209439, 0, 0, 0.104528, 0.994522, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 47972 at 55.333958 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 3, 'Weapon Crate - Ashenvale', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+12, @PTEMPLATE+2, 'Weapon Crate - Ashenvale', 0, 10),
(@OGUID+13, @PTEMPLATE+2, 'Weapon Crate - Ashenvale', 0, 10),
(@OGUID+14, @PTEMPLATE+2, 'Weapon Crate - Ashenvale', 0, 10),
(47972, @PTEMPLATE+2, 'Weapon Crate - Ashenvale', 0, 10),
(47973, @PTEMPLATE+2, 'Weapon Crate - Ashenvale', 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
