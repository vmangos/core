DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230706171920');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230706171920');
-- Add your query below.


SET @OGUID = 5922;
SET @PTEMPLATE = 4434;

-- 130 Silverpine Forest 3693 / 3705 / Food Crate / Barrel of Milk
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (35476, 35465, 35464, 35452, 35448, 35440, 35435, 35434, 35433, 35432));
DELETE FROM `gameobject` WHERE `guid` IN (35476, 35465, 35464, 35452, 35448, 35440, 35435, 35434, 35433, 35432);
DELETE FROM `pool_gameobject` WHERE `guid` IN (35476, 35465, 35464, 35452, 35448, 35440, 35435, 35434, 35433, 35432);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3693, 0, -440.01, 1517.91, 19.547, 2.82743, 0, 0, 0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3693, 0, -438.84, 1560.23, 19.7135, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3693, 0, -414.799, 1454.96, 27.3901, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3693, 0, -391.284, 1426.28, 26.8483, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3693, 0, -379.69, 1644.21, 10.2635, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3693, 0, -360.588, 1523.31, 24.9354, 1.43117, 0, 0, 0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3693, 0, -336.097, 1530.41, 17.986, 1.93731, 0, 0, 0.824125, 0.566408, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3693, 0, -333.433, 1547.02, 25.2864, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3693, 0, -329.974, 1469.82, 31.7723, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3693, 0, -757.72, 1501.36, 17.1799, 3.07177, 0, 0, 0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3693, 0, -753.444, 1474.05, 17.7094, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3693, 0, -713.535, 1548.99, 18.1574, 4.90438, 0, 0, -0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3693, 0, -707.737, 1585.45, 17.3471, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3693, 0, -444.452, 1536.93, 19.6359, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3693, 0, -405.568, 1568.97, 19.5441, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3693, 0, -355.94, 1584.68, 18.0469, 2.40855, 0, 0, 0.93358, 0.358368, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3705, 0, -440.01, 1517.91, 19.547, 2.82743, 0, 0, 0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3705, 0, -438.84, 1560.23, 19.7135, 5.98648, 0, 0, -0.147809, 0.989016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3705, 0, -414.799, 1454.96, 27.3901, 4.55531, 0, 0, -0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3705, 0, -391.284, 1426.28, 26.8483, 2.07694, 0, 0, 0.861629, 0.507539, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3705, 0, -379.69, 1644.21, 10.2635, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3705, 0, -360.588, 1523.31, 24.9354, 1.43117, 0, 0, 0.656058, 0.75471, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3705, 0, -336.097, 1530.41, 17.986, 1.93731, 0, 0, 0.824125, 0.566408, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3705, 0, -333.433, 1547.02, 25.2864, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3705, 0, -329.974, 1469.82, 31.7723, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3705, 0, -757.72, 1501.36, 17.1799, 3.07177, 0, 0, 0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3705, 0, -753.444, 1474.05, 17.7094, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3705, 0, -713.535, 1548.99, 18.1574, 4.90438, 0, 0, -0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3705, 0, -707.737, 1585.45, 17.3471, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3705, 0, -444.452, 1536.93, 19.6359, 0.855211, 0, 0, 0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3705, 0, -405.568, 1568.97, 19.5441, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3705, 0, -355.94, 1584.68, 18.0469, 2.40855, 0, 0, 0.93358, 0.358368, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+15, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+16, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+17, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+18, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+19, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+20, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+21, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+22, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+23, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+24, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+25, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+26, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+27, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+28, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+29, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+30, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+31, @PTEMPLATE+15, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+32, @PTEMPLATE+16, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 7, 'Silverpine Forest - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+2, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+3, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+4, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+5, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+6, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+7, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+8, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+9, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+10, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+11, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+12, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+13, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+14, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+15, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+16, @PTEMPLATE+17, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0);

SET @OGUID = 35256;
SET @PTEMPLATE = 2434;

-- 3694 / 3705 / Food Crate / Barrel of Milk
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3694, 0, -473.667, 834.02, 96.8562, 4.24115, 0, 0, -0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3694, 0, -218.906, 1007.25, 72.4293, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3694, 0, -198.906, 947.331, 65.6911, 4.67748, 0, 0, -0.719339, 0.694659, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3694, 0, -173.425, 905.788, 65.4189, 3.73501, 0, 0, -0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3694, 0, -82.0719, 822.652, 63.9224, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3694, 0, -55.3036, 985.734, 68.2029, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3694, 0, -8.97906, 1358.51, 60.8921, 2.35619, 0, 0, 0.92388, 0.382683, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3694, 0, 27.1249, 774.611, 63.6768, 3.52557, 0, 0, -0.981627, 0.190812, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3694, 0, 68.8188, 763.112, 63.665, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3694, 0, 77.636, 786.515, 64.1426, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3694, 0, -184.691, 978.297, 65.5431, 4.10153, 0, 0, -0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3694, 0, -116.698, 803.473, 65.1213, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3694, 0, -74.2399, 862.856, 65.2583, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3694, 0, -245.751, 808.898, 73.9651, 0.715585, 0, 0, 0.350207, 0.936672, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3705, 0, -473.667, 834.02, 96.8562, 4.24115, 0, 0, -0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3705, 0, -218.906, 1007.25, 72.4293, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3705, 0, -198.906, 947.331, 65.6911, 4.67748, 0, 0, -0.719339, 0.694659, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3705, 0, -173.425, 905.788, 65.4189, 3.73501, 0, 0, -0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3705, 0, -82.0719, 822.652, 63.9224, 5.48033, 0, 0, -0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3705, 0, -55.3036, 985.734, 68.2029, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3705, 0, -8.97906, 1358.51, 60.8921, 2.35619, 0, 0, 0.92388, 0.382683, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3705, 0, 27.1249, 774.611, 63.6768, 3.52557, 0, 0, -0.981627, 0.190812, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3705, 0, 68.8188, 763.112, 63.665, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3705, 0, 77.636, 786.515, 64.1426, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3705, 0, -184.691, 978.297, 65.5431, 4.10153, 0, 0, -0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3705, 0, -116.698, 803.473, 65.1213, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3705, 0, -74.2399, 862.856, 65.2583, 4.76475, 0, 0, -0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3705, 0, -245.751, 808.898, 73.9651, 0.715585, 0, 0, 0.350207, 0.936672, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+6, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+7, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+8, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+9, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+10, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+11, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+12, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+13, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@PTEMPLATE+14, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+15, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+16, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+17, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+18, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+19, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+20, @PTEMPLATE+6, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+21, @PTEMPLATE+7, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+22, @PTEMPLATE+8, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+23, @PTEMPLATE+9, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+24, @PTEMPLATE+10, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+25, @PTEMPLATE+11, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+26, @PTEMPLATE+12, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+27, @PTEMPLATE+13, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10),
(@OGUID+28, @PTEMPLATE+14, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 6, 'Silverpine Forest - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+2, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+3, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+4, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+5, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+6, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+7, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+8, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+9, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+10, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+11, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+12, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+13, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+14, @PTEMPLATE+15, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
