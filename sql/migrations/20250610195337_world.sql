DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250610195337');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250610195337');
-- Add your query below.


-- Ashenvale
SET @GGUID = 6229;
SET @PTEMPLATE = 2185;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 1859.22, -2887.81, 73.4363, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 1900.35, -398.839, 112.942, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, 1926.44, -1132.98, 73.8561, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 1, 1965.52, -1307.89, 77.2878, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 1, 1994.4, -900.537, 77.7512, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 1, 1996.82, -74.7859, 127.016, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1732, 1, 2157.03, -298.969, 96.788, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1732, 1, 2172.4, -112.695, 113.112, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1732, 1, 2537.24, 328.02, 107.395, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1732, 1, 2541.9, -76.526, 108.556, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1732, 1, 2565.62, 630.752, 130.232, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1732, 1, 2912.34, -1019.34, 188.138, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1732, 1, 3027.93, -967.536, 216.16, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1732, 1, 3290.15, -208.41, 126.993, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1732, 1, 3485.57, -501.888, 187.816, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1732, 1, 3525.08, 495.375, 9.41899, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 1732, 1, 3609.35, 382.265, 24.5554, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 1732, 1, 3760.42, 1147.17, -48.0098, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 1732, 1, 4007.01, 645.049, 25.8416, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 1733, 1, 1859.22, -2887.81, 73.4363, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 1733, 1, 1900.35, -398.839, 112.942, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 1733, 1, 1926.44, -1132.98, 73.8561, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 1733, 1, 1965.52, -1307.89, 77.2878, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 1733, 1, 1994.4, -900.537, 77.7512, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 1733, 1, 1996.82, -74.7859, 127.016, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 1733, 1, 2157.03, -298.969, 96.788, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 1733, 1, 2172.4, -112.695, 113.112, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 1733, 1, 2537.24, 328.02, 107.395, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 1733, 1, 2541.9, -76.526, 108.556, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 1733, 1, 2565.62, 630.752, 130.232, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 1733, 1, 2912.34, -1019.34, 188.138, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 1733, 1, 3027.93, -967.536, 216.16, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+32, 1733, 1, 3290.15, -208.41, 126.993, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+33, 1733, 1, 3485.57, -501.888, 187.816, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+34, 1733, 1, 3525.08, 495.375, 9.41899, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+35, 1733, 1, 3609.35, 382.265, 24.5554, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+36, 1733, 1, 3760.42, 1147.17, -48.0098, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+37, 1733, 1, 4007.01, 645.049, 25.8416, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+13, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+14, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+15, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+16, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+17, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+18, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+13, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+14, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+15, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+16, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+17, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+18, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+6, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+7, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+8, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+9, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+10, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+11, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+12, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+32, @PTEMPLATE+13, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+33, @PTEMPLATE+14, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+34, @PTEMPLATE+15, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+35, @PTEMPLATE+16, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+36, @PTEMPLATE+17, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+37, @PTEMPLATE+18, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+9, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+10, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+11, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+12, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+13, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+14, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+15, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+16, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+17, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+18, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0);

-- Desolace
SET @GGUID = 3815;
SET @PTEMPLATE = 1931;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -2318.17, 1871.07, 150.964, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, -1583.74, 2426.71, 102.109, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, -1517.24, 2332.61, 97.4107, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 1, -668.328, 581.859, 148.283, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 1, -566.845, 1117.23, 98.9134, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 1, -503.674, 2639.46, 11.0761, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1732, 1, -55.2245, 597.726, 93.7722, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1732, 1, 16.5767, 1366.56, 116.85, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 1, -2318.17, 1871.07, 150.964, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 1, -1583.74, 2426.71, 102.109, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 1, -1517.24, 2332.61, 97.4107, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 1, -668.328, 581.859, 148.283, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1733, 1, -566.845, 1117.23, 98.9134, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1733, 1, -503.674, 2639.46, 11.0761, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 1733, 1, -55.2245, 597.726, 93.7722, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 1733, 1, 16.5767, 1366.56, 116.85, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+6, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+7, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0);

-- Duskwood
SET @GGUID = 3258;
SET @PTEMPLATE = 2132;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -11191.6, -877.527, 80.8317, -1.39626, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -11154.1, -845.817, 78.1014, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, -11154.1, 116.377, 39.0482, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 0, -11109.5, 63.564, 41.8177, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 0, -11075, -1121.48, 40.2829, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 0, -10936.2, -129.304, 29.9737, -2.11185, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1732, 0, -10670.9, -1400.03, 59.2217, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -11191.6, -877.527, 80.8317, -1.39626, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -11154.1, -845.817, 78.1014, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -11154.1, 116.377, 39.0482, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -11109.5, 63.564, 41.8177, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -11075, -1121.48, 40.2829, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1733, 0, -10936.2, -129.304, 29.9737, -2.11185, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1733, 0, -10670.9, -1400.03, 59.2217, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 95, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+6, 5, 'Tin Vein / Silver Vein - Duskwood', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0);

-- Thelgen Rock
SET @GGUID = 3362;
SET @PTEMPLATE = 2204;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -3889.96, -2517.03, 39.7736, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -3876.79, -2447.74, 30.3868, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, -3876.37, -2487.08, 40.9926, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 0, -3842.15, -2328.59, 46.6512, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 0, -3780.94, -2499.87, 30.969, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 0, -3767.13, -2418.54, 33.4895, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1732, 0, -3740.22, -2442.94, 37.123, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -3889.96, -2517.03, 39.7736, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -3876.79, -2447.74, 30.3868, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -3876.37, -2487.08, 40.9926, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -3842.15, -2328.59, 46.6512, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -3780.94, -2499.87, 30.969, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 1733, 0, -3767.13, -2418.54, 33.4895, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 1733, 0, -3740.22, -2442.94, 37.123, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+6, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0);

-- Vul'Gol Ogre Mound
SET @GGUID = 3378;
SET @PTEMPLATE = 1939;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -11228.9, -194.435, 6.59889, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -11185.8, -104.949, 7.02571, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, -11162.2, -182.4, 12.8593, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 0, -11160.9, -132.727, 10.3712, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 0, -11111.9, -103.866, 12.8918, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 0, -11099.9, -159.898, 13.3211, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -11228.9, -194.435, 6.59889, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -11185.8, -104.949, 7.02571, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -11162.2, -182.4, 12.8593, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -11160.9, -132.727, 10.3712, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -11111.9, -103.866, 12.8918, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -11099.9, -159.898, 13.3211, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0);

-- Redridge
SET @GGUID = 3455;
SET @PTEMPLATE = 2211;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -9679.37, -3221.89, 51.0507, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -9488.62, -3012.98, 135.902, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, -9324.54, -3328.46, 93.2871, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 0, -9197.55, -3367.02, 101.667, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1732, 0, -9084, -3259.22, 112.762, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1732, 0, -8940.11, -2186.78, 140.537, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -9679.37, -3221.89, 51.0507, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -9488.62, -3012.98, 135.902, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -9324.54, -3328.46, 93.2871, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -9197.55, -3367.02, 101.667, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -9084, -3259.22, 112.762, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -8940.11, -2186.78, 140.537, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Redridge Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0);

-- Rethban Caverns
SET @GGUID = 3602;
SET @PTEMPLATE = 2217;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2054, 0, -8974.61, -2020.09, 136.633, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2054, 0, -8877.34, -1944.79, 129.779, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2054, 0, -8871.49, -2012.31, 124.82, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2054, 0, -8863.31, -1979.69, 124.995, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2054, 0, -8846.12, -1897, 127.32, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2054, 0, -8820.87, -1947.33, 133.085, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -8974.61, -2020.09, 136.633, 4.38078, 0, 0, -0.814116, 0.580703, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -8877.34, -1944.79, 129.779, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 0, -8871.49, -2012.31, 124.82, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 0, -8863.31, -1979.69, 124.995, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 0, -8846.12, -1897, 127.32, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 0, -8820.87, -1947.33, 133.085, 0.942477, 0, 0, 0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0);

-- Wetlands
SET @GGUID = 3282;
SET @PTEMPLATE = 1995;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -3399.97, -3331.04, 34.3154, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -3337.65, -3233.6, 30.273, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, -3108.01, -3087.91, 41.4411, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 0, -2816.66, -1908.05, 15.4718, -0.0698117, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, -3399.97, -3331.04, 34.3154, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, -3337.65, -3233.6, 30.273, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 0, -3108.01, -3087.91, 41.4411, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 0, -2816.66, -1908.05, 15.4718, -0.0698117, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Stonetalon
SET @GGUID = 3298;
SET @PTEMPLATE = 2223;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -144.083, -431.061, 3.81289, -1.76278, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 1421.85, 1074.15, 165.379, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, 1640.77, 623.283, 190.87, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 1, 1840.28, 726.798, 175.183, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, -144.083, -431.061, 3.81289, -1.76278, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, 1421.85, 1074.15, 165.379, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 1, 1640.77, 623.283, 190.87, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 1, 1840.28, 726.798, 175.183, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- Wailing Caverns
SET @GGUID = 3036;
SET @PTEMPLATE = 2274;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 43, -90.4213, -265.971, -55.3819, 0.733038, 0, 0, 0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 43, -52.6802, 387.592, -61.6997, 6.17847, 0, 0, -0.0523357, 0.99863, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 43, 45.3749, 529.187, -55.8656, 2.72271, 0, 0, 0.978148, 0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 43, -90.4213, -265.971, -55.3819, 0.733038, 0, 0, 0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 43, -52.6802, 387.592, -61.6997, 6.17847, 0, 0, -0.0523357, 0.99863, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 43, 45.3749, 529.187, -55.8656, 2.72271, 0, 0, 0.978148, 0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 4791, 0, 'Wailing Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 4791, 0, 'Wailing Caverns - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 4791, 0, 'Wailing Caverns - Tin Vein / Silver Vein', 0);

-- Thistlefur Hold
SET @GGUID = 3045;
SET @PTEMPLATE = 2277;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 3271.04, -745.758, 157.882, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 3371.16, -582.341, 187.624, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, 3395.93, -717.548, 171.492, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 3271.04, -745.758, 157.882, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, 3371.16, -582.341, 187.624, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, 3395.93, -717.548, 171.492, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 264, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 264, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 264, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0);

-- Alterac Mountains
SET @GGUID = 3205;
SET @PTEMPLATE = 2280;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -115.369, 448.229, 109.746, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, 522.532, 427.6, 19.4784, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, 1111.69, 65.8071, -4.64941, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -115.369, 448.229, 109.746, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, 522.532, 427.6, 19.4784, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, 1111.69, 65.8071, -4.64941, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Alterac Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9902, 0, 'Alterac Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 9902, 0, 'Alterac Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 9902, 0, 'Alterac Mountains - Tin Vein / Silver Vein', 0);

-- Silverpine Forest
SET @GGUID = 3250;
SET @PTEMPLATE = 2283;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -492.778, 666.138, 89.2055, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, 542.518, 939.009, 135.029, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 0, 984.639, 1367.98, 50.0899, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -492.778, 666.138, 89.2055, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 0, 542.518, 939.009, 135.029, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 0, 984.639, 1367.98, 50.0899, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

-- Beren's Peril
SET @GGUID = 2652;
SET @PTEMPLATE = 1552;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -341.725, 1010.56, 124.809, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, -303.795, 946.772, 132.269, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, -341.725, 1010.56, 124.809, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, -303.795, 946.772, 132.269, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 8101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0);

-- Windshear Mine
SET @GGUID = 2664;
SET @PTEMPLATE = 1581;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 906.947, -285.798, 21.8272, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 921.461, -298.708, 22.0073, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, 906.947, -285.798, 21.8272, 5.74214, 0, 0, -0.267238, 0.963631, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 921.461, -298.708, 22.0073, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 386, 0, 'Stonetalon Mountains - Windshear Mine - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 386, 0, 'Stonetalon Mountains - Windshear Mine - Tin Vein / Silver Vein', 0);

-- Darkshore
SET @GGUID = 2758;
SET @PTEMPLATE = 1592;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 5558.38, 33.1971, 49.1027, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 7343.14, -840.543, 22.8391, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, 5558.38, 33.1971, 49.1027, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 7343.14, -840.543, 22.8391, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0);

-- Deep Elem Mine
SET @GGUID = 2765;
SET @PTEMPLATE = 1598;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, 407.963, 987.618, 108.506, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 0, 420.68, 1023.36, 107.895, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 0, 407.963, 987.618, 108.506, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 0, 420.68, 1023.36, 107.895, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8098, 0, 'Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 8098, 0, 'Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein', 0);

-- Render's Rock
SET @GGUID = 1833;
SET @PTEMPLATE = 1278;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -8709.15, -2227.26, 155.743, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -8709.15, -2227.26, 155.743, 4.18879, 0, 0, -0.866025, 0.500001, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8091, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0);

-- Raptor Ridge
SET @GGUID = 1844;
SET @PTEMPLATE = 1289;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -3067.06, -3214.77, 60.3775, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -3067.06, -3214.77, 60.3775, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands - Raptor Ridge', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands - Raptor Ridge', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands - Raptor Ridge', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 269, 0, 'Wetlands - Raptor Ridge - Tin Vein / Silver Vein', 0);

-- Azurelode Mine
SET @GGUID = 1857;
SET @PTEMPLATE = 1290;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 103711, 0, -743.478, 134.3, 22.1042, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 105569, 0, -743.478, 134.3, 22.1042, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3310, 0, 'Hillsbrad Foothills - Azurelode Mine - Tin Vein / Silver Vein', 0);

-- Thousand Needles
SET @GGUID = 1895;
SET @PTEMPLATE = 1295;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -5209.42, -2625.23, -42.4866, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -5209.42, -2625.23, -42.4866, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0);

-- Stagnant Oasis
SET @GGUID = 1911;
SET @PTEMPLATE = 1298;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3764, 1, -1264.2, -3037.82, 81.5367, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -1264.2, -3037.82, 81.5367, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Barrens - Stagnant Oasis', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Barrens - Stagnant Oasis', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Barrens - Stagnant Oasis', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1177, 0, 'Barrens - Stagnant Oasis - Tin Vein / Silver Vein', 0);

-- Boulderslide Cavern
SET @GGUID = 1949;
SET @PTEMPLATE = 1304;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -130.585, 237.523, 100.323, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -130.585, 237.523, 100.323, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 334, 0, 'Stonetalon Mountains - Boulderslide Cavern - Tin Vein / Silver Vein', 0);

-- Boulder Lode
SET @GGUID = 2332;
SET @PTEMPLATE = 1310;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3764, 1, 1410.93, -3410.15, 93.4324, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 1410.93, -3410.15, 93.4324, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Barrens - Boulder Lode Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Barrens - Boulder Lode Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Barrens - Boulder Lode Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 395, 0, 'Barrens - Boulder Lode Mine - Tin Vein / Silver Vein', 0);

-- Demon Fall
SET @GGUID = 2351;
SET @PTEMPLATE = 1312;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 1717.4, -3061.5, 127.752, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 1717.4, -3061.5, 127.752, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 265, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0);

-- Cliffspring
SET @GGUID = 2361;
SET @PTEMPLATE = 1315;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 6749.99, -706.986, 70.2771, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 6749.99, -706.986, 70.2771, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8062, 0, 'Darkshore - Cliffspring Falls - Tin Vein / Silver Vein', 0);

-- Barrens
SET @GGUID = 3707;
SET @PTEMPLATE = 2339;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3764, 1, -3696.46, -1520.11, 133.283, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3764, 1, -2300.11, -2566.59, 95.6574, -1.72788, 0, 0, 0.760406, -0.649448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3764, 1, -1935.09, -1744.55, 98.325, -2.72271, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3764, 1, -113.161, -3153.26, 91.9515, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 3764, 1, 466.74, -1133.24, 121.599, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 3764, 1, 810.977, -1256.17, 112.426, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 1, -3696.46, -1520.11, 133.283, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 1, -2300.11, -2566.59, 95.6574, -1.72788, 0, 0, 0.760406, -0.649448, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1733, 1, -1935.09, -1744.55, 98.325, -2.72271, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1733, 1, -113.161, -3153.26, 91.9515, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 1733, 1, 466.74, -1133.24, 121.599, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 1733, 1, 810.977, -1256.17, 112.426, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 95, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+0, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+1, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+2, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+3, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+4, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+5, 5, 'Tin Vein (3764) / Silver Vein - Barrens', 0, 0, 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+1, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+2, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+3, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+4, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0),
(@PTEMPLATE+5, 2587, 0, 'Barrens - Tin Vein (3764) / Silver Vein', 0);

-- Barrens
SET @GGUID = 3327;
SET @PTEMPLATE = 2286;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -1299.46, -1727.31, 94.5518, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, -1092.88, -1708.74, 96.5742, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, 218.566, -1425.22, 93.9965, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1732, 1, 390.295, -1601.26, 114.058, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, -1299.46, -1727.31, 94.5518, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, -1092.88, -1708.74, 96.5742, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1733, 1, 218.566, -1425.22, 93.9965, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1733, 1, 390.295, -1601.26, 114.058, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Barrens', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Barrens', 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0);

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `id` IN (1732, 2054, 3764, 103711) AND `map` IN (0, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
