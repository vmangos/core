DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230627054541');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230627054541');
-- Add your query below.


SET @OGUID = 161;
SET @PTEMPLATE = 2434;

-- Ashenvale

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180663, 1, 1884.02, -2826.22, 94.9605, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180663, 1, 1919.61, -1346.88, 89.6561, 4.24115, 0, 0, -0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180663, 1, 1934.6, -1037.14, 89.6561, 2.18166, 0, 0, 0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180663, 1, 1955.51, -1094.91, 89.6561, 1.91986, 0, 0, 0.819152, 0.573577, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180663, 1, 1966.27, -1948.3, 94.7596, 2.63544, 0, 0, 0.968147, 0.250381, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180663, 1, 2016.36, -2869.93, 101.329, 1.62316, 0, 0, 0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180663, 1, 2054.52, -1098.46, 89.6561, 3.52557, 0, 0, -0.981627, 0.190812, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 10, 'Sagefish School - Ashenvale', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+2, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+3, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+4, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+5, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+6, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(@OGUID+7, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(18162, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(18161, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(18158, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48059, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48060, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48061, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48062, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48063, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48064, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48065, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48066, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(48067, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50282, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50285, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50293, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50300, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50330, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10),
(50331, @PTEMPLATE, 'Sagefish School - Ashenvale', 7, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
