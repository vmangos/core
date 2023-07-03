DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230703185905');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230703185905');
-- Add your query below.


SET @OGUID = 232257;
SET @PTEMPLATE = 21677;

DELETE FROM `gameobject` WHERE `guid` IN (13305, 13309, 13310, 48651, 48765, 48774);
DELETE FROM `pool_gameobject` WHERE `guid` IN (13305, 13309, 13310, 48651, 48765, 48774);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (13305, 13309, 13310, 48651, 48765, 48774));

-- Barrens
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3660, 1, -1373.69, -3596.82, 91.7501, 1.0821, 0, 0, 0.515038, 0.857167, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3660, 1, -1574.72, -3902.17, 12.9352, 3.59538, 0, 0, -0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3660, 1, -1568.41, -3894.21, 14.4994, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3660, 1, -1516.98, -3815.31, 22.7504, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3660, 1, -1493.29, -3815.57, 24.6679, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3660, 1, -1443.09, -3652.76, 92.2653, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3660, 1, -1441.32, -3645.93, 92.1507, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3660, 1, -1374.43, -3906.73, 10.0213, 2.56563, 0, 0, 0.958819, 0.284016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3660, 1, -1360.28, -3913.57, 9.11687, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3660, 1, -483.763, -2601.68, 127.867, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3660, 1, -481.966, -2595.26, 103.638, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3660, 1, -332.152, -2559.53, 95.7875, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3660, 1, -1726.4, -3830.48, 10.7884, 5.16618, 0, 0, -0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3660, 1, -1385.77, -3590.06, 91.6753, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3661, 1, -1373.69, -3596.82, 91.7501, 1.0821, 0, 0, 0.515038, 0.857167, 3600, 3600, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3661, 1, -1574.72, -3902.17, 12.9352, 3.59538, 0, 0, -0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3661, 1, -1568.41, -3894.21, 14.4994, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3661, 1, -1516.98, -3815.31, 22.7504, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3661, 1, -1493.29, -3815.57, 24.6679, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3661, 1, -1443.09, -3652.76, 92.2653, 5.42797, 0, 0, -0.414693, 0.909961, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3661, 1, -1441.32, -3645.93, 92.1507, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3661, 1, -1374.43, -3906.73, 10.0213, 2.56563, 0, 0, 0.958819, 0.284016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3661, 1, -1360.28, -3913.57, 9.11687, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3661, 1, -483.763, -2601.68, 127.867, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3661, 1, -481.966, -2595.26, 103.638, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3661, 1, -332.152, -2559.53, 95.7875, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3661, 1, -1726.4, -3830.48, 10.7884, 5.16618, 0, 0, -0.529919, 0.848048, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3661, 1, -1385.77, -3590.06, 91.6753, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+2, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+3, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+4, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+5, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+6, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+7, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+8, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+9, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+10, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+11, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+12, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+13, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@PTEMPLATE+14, 1, 'Weapon Crates / Armor Crate - Barrens', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+15, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+16, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+17, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+18, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+19, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+20, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+21, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+22, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+23, @PTEMPLATE+9, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+24, @PTEMPLATE+10, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+25, @PTEMPLATE+11, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+26, @PTEMPLATE+12, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+27, @PTEMPLATE+13, 'Weapon Crates / Armor Crate - Barrens', 0, 10),
(@OGUID+28, @PTEMPLATE+14, 'Weapon Crates / Armor Crate - Barrens', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 5, 'Barrens - Weapon Crates / Armor Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+2, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+3, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+4, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+5, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+6, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+7, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+8, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+9, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+10, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+11, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+12, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+13, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0),
(@PTEMPLATE+14, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Barrens', 0);

SET @OGUID = 232830;
SET @PTEMPLATE = 22983;

-- Darkshore
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3660, 1, 5470.45, 583.138, -0.04548, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3660, 1, 5566.8, 575.271, -1.72532, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3660, 1, 6103.46, 815.634, -33.4195, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3660, 1, 7046.27, 407.369, -22.604, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3660, 1, 7050, 392.654, -6.14862, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3660, 1, 7131.98, 345.849, -41.7792, 5.65487, 0, 0, -0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3660, 1, 7133.91, 303.566, -40.9871, 3.76991, 0, 0, -0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3660, 1, 7444.92, -227.195, -0.214618, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3660, 1, 7472.67, -446.01, -0.074509, 6.0912, 0, 0, -0.0958452, 0.995396, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3660, 1, 7558.19, -376.235, -1.87434, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3660, 1, 7869.38, -918.659, -24.3792, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3660, 1, 8059.07, -1012.45, -6.44795, 0.767944, 0, 0, 0.374606, 0.927184, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3660, 1, 5404.55, 534.358, 0.043727, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3660, 1, 7457.84, -103.508, -0.007202, 6.02139, 0, 0, -0.130526, 0.991445, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3661, 1, 5470.45, 583.138, -0.04548, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3661, 1, 5566.8, 575.271, -1.72532, 5.21854, 0, 0, -0.507538, 0.861629, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3661, 1, 6103.46, 815.634, -33.4195, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3661, 1, 7046.27, 407.369, -22.604, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3661, 1, 7050, 392.654, -6.14862, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3661, 1, 7131.98, 345.849, -41.7792, 5.65487, 0, 0, -0.309016, 0.951057, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3661, 1, 7133.91, 303.566, -40.9871, 3.76991, 0, 0, -0.951056, 0.309017, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3661, 1, 7444.92, -227.195, -0.214618, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3661, 1, 7472.67, -446.01, -0.074509, 6.0912, 0, 0, -0.0958452, 0.995396, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3661, 1, 7558.19, -376.235, -1.87434, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3661, 1, 7869.38, -918.659, -24.3792, 1.58825, 0, 0, 0.71325, 0.70091, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3661, 1, 8059.07, -1012.45, -6.44795, 0.767944, 0, 0, 0.374606, 0.927184, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3661, 1, 5404.55, 534.358, 0.043727, 2.28638, 0, 0, 0.909961, 0.414694, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3661, 1, 7457.84, -103.508, -0.007202, 6.02139, 0, 0, -0.130526, 0.991445, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+2, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+3, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+4, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+5, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+6, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+7, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+8, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+9, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+10, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+11, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+12, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+13, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@PTEMPLATE+14, 1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+15, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+16, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+17, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+18, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+19, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+20, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+21, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+22, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+23, @PTEMPLATE+9, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+24, @PTEMPLATE+10, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+25, @PTEMPLATE+11, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+26, @PTEMPLATE+12, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+27, @PTEMPLATE+13, 'Weapon Crates / Armor Crate - Darkshore', 0, 10),
(@OGUID+28, @PTEMPLATE+14, 'Weapon Crates / Armor Crate - Darkshore', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 5, 'Darkshore - Weapon Crates / Armor Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+2, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+3, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+4, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+5, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+6, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+7, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+8, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+9, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+10, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+11, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+12, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+13, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0),
(@PTEMPLATE+14, @PTEMPLATE+15, 0, 'Weapon Crates / Armor Crate - Darkshore', 0);

-- Ashenvale
SET @OGUID = 3487;
SET @PTEMPLATE = 14301;

DELETE FROM `gameobject` WHERE `guid` IN (47973, 198, 197, 47972, 199);
DELETE FROM `pool_gameobject` WHERE `guid` IN (47973, 198, 197, 47972, 199);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (47973, 198, 197, 47972, 199));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3689, 1, 1789.23, -2747.89, 73.577, 0.994837, 0, 0, 0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3689, 1, 1809.6, -2790.47, 82.8923, 5.32326, 0, 0, -0.461748, 0.887011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3689, 1, 1817.35, -2628.76, 61.1289, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3689, 1, 1822.49, -2647.19, 53.1286, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3689, 1, 1831.57, -2754.73, 82.8331, 4.92183, 0, 0, -0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3689, 1, 1838.71, -2802.68, 52.0411, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3689, 1, 1865.96, -2635.36, 57.6073, 0.226892, 0, 0, 0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3689, 1, 1914.78, -2641.69, 82.8735, 0.209439, 0, 0, 0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3702, 1, 1789.23, -2747.89, 73.577, 0.994837, 0, 0, 0.477159, 0.878817, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3702, 1, 1809.6, -2790.47, 82.8923, 5.32326, 0, 0, -0.461748, 0.887011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3702, 1, 1817.35, -2628.76, 61.1289, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3702, 1, 1822.49, -2647.19, 53.1286, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3702, 1, 1831.57, -2754.73, 82.8331, 4.92183, 0, 0, -0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3702, 1, 1838.71, -2802.68, 52.0411, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3702, 1, 1865.96, -2635.36, 57.6073, 0.226892, 0, 0, 0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3702, 1, 1914.78, -2641.69, 82.8735, 0.209439, 0, 0, 0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+2, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+3, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+4, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+5, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+6, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+7, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@PTEMPLATE+8, 1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+9, @PTEMPLATE+1, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+10, @PTEMPLATE+2, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+11, @PTEMPLATE+3, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+12, @PTEMPLATE+4, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+13, @PTEMPLATE+5, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+14, @PTEMPLATE+6, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+15, @PTEMPLATE+7, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10),
(@OGUID+16, @PTEMPLATE+8, 'Weapon Crates / Armor Crate - Ashenvale', 0, 10);


UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (3702, 3703, 3660, 3689, 3704, 3661);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
