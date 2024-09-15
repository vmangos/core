DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230713165825');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230713165825');
-- Add your query below.


-- Dark Iron Deposit in BRD
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(130, 165658, 230, 1218.01, -381.236, -98.9694, 3.14159, 0, 0, -1, 0, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(130, 25622, 0, 'Dark Iron Ore', 0, 10);

-- Dark Iron Deposits in Molten Core
DELETE FROM `gameobject` WHERE  `guid` IN (43713, 43725, 43720, 43690);
DELETE FROM `pool_gameobject` WHERE  `guid` IN (43713, 43725, 43720, 43690);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(881, 165658, 409, 1082.8, -833.75, -147.884, 1.85005, 0, 0, 0.798635, 0.601815, 604800, 604800, 100, 1, 0, 0, 0, 10),
(882, 165658, 409, 796.259, -513.453, -210.408, 0.767944, 0, 0, 0.374606, 0.927184, 604800, 604800, 100, 1, 0, 0, 0, 10),
(883, 165658, 409, 646.1, -865.918, -208.326, 4.10153, 0, 0, -0.887011, 0.461749, 604800, 604800, 100, 1, 0, 0, 0, 10),
(884, 165658, 409, 674.777, -1117.28, -154.07, 4.57276, 0, 0, -0.754709, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(881, 25609, 0, 'Dark Iron Ore', 0, 10),
(882, 25609, 0, 'Dark Iron Ore', 0, 10),
(883, 25609, 0, 'Dark Iron Ore', 0, 10),
(884, 25609, 0, 'Dark Iron Ore', 0, 10);

-- Missing Gold Veins in Badlands
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1895, 1734, 0, -7118.27, -3161.17, 248.919, 2.35619, 0, 0, 0.92388, 0.382683, 300, 300, 100, 1, 0, 0, 0, 10),
(1896, 1734, 0, -6880.82, -4142.43, 279.195, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(1897, 1734, 0, -6443.14, -4063.54, 275.157, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(1895, 2186, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 0, 10),
(1896, 2197, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 0, 10),
(1897, 2212, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands', 0, 10);

UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands' WHERE  `entry` IN (2186, 2197, 2212);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands' WHERE  `guid` IN (25142, 25196, 25153, 25207, 25168, 25222);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `guid`=1895;
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `guid`=25142;
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `guid`=1896;
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `guid`=25153;
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `guid`=1897;
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `guid`=25168;

-- Gold Vein in Stonetalon
UPDATE `gameobject` SET position_x = 2450.95, position_y = 1559.48, position_z = 277.567, orientation = 2.86234, rotation2 = 0.990268, rotation3 = 0.139175 WHERE guid IN (27301, 27255);
UPDATE `gameobject` SET `id` = 1734 WHERE `guid` = 27301;

-- Gold Vein / Mithril Deposit in Desolace
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1898, 1734, 1, -1914.5, 2069.99, 71.4208, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2761, 1, 'Gold Vein / Mithril Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(1898, 2761, 'Gold Vein / Mithril Deposit - Desolace', 10);

UPDATE `pool_gameobject` SET `pool_entry` = 2761,`description` = 'Gold Vein / Mithril Deposit - Desolace' WHERE `guid`=7153;

-- Indurium Mineral Vein
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(21110, 19903, 70, -248.926, 220.846, -46.6074, 5.89921, 0, 0, -0.190808, 0.981627, 604800, 604800, 100, 1, 0, 0, 0, 10),
(21111, 19903, 70, -89.2856, 190.29, -48.1824, 2.67035, 0, 0, 0.972369, 0.233448, 604800, 604800, 100, 1, 0, 0, 0, 10),
(21112, 19903, 70, -52.2933, 271.083, -46.7186, 5.60251, 0, 0, -0.333807, 0.942641, 604800, 604800, 100, 1, 0, 0, 0, 10),
(21113, 19903, 70, -7.04951, 401.135, -46.453, 6.00393, 0, 0, -0.139173, 0.990268, 604800, 604800, 100, 1, 0, 0, 0, 10),
(21114, 19903, 70, 37.8897, 214.677, -30.5547, 6.21337, 0, 0, -0.0348988, 0.999391, 604800, 604800, 100, 1, 0, 0, 0, 10),
(21115, 19903, 70, -133.767, 358.587, -42.5509, 4.13643, 0, 0, -0.878817, 0.47716, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(21601, 6, 'Indurium Mineral Vein - Uldaman', 10);

INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(19903, 21601, 'Indurium Mineral Vein - Uldaman');

-- Uldaman
SET @OGUID = 21799;
SET @PTEMPLATE = 2995;

DELETE FROM `gameobject` WHERE `guid` IN (33279, 33278, 25456, 33281, 33280);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1735, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1735, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2040, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2040, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2040, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2040, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2040, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2040, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2040, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2040, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2040, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2040, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2040, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2040, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+19, @PTEMPLATE+7, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+20, @PTEMPLATE+8, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+21, @PTEMPLATE+9, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+22, @PTEMPLATE+10, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+23, @PTEMPLATE+11, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+24, @PTEMPLATE+12, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+25, @PTEMPLATE+1, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+26, @PTEMPLATE+2, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+27, @PTEMPLATE+3, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+28, @PTEMPLATE+4, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+29, @PTEMPLATE+5, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+30, @PTEMPLATE+6, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+31, @PTEMPLATE+7, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+32, @PTEMPLATE+8, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+33, @PTEMPLATE+9, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+34, @PTEMPLATE+10, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+35, @PTEMPLATE+11, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10),
(@OGUID+36, @PTEMPLATE+12, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 4, 'Uldaman - Gold Vein / Iron Deposit / Mithril Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+2, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+3, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+4, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+5, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+6, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+7, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+8, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+9, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+10, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+11, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0),
(@PTEMPLATE+12, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit / Mithril Deposit - Uldaman', 0);

-- Mara
SET @OGUID = 39057;
SET @PTEMPLATE = 3501;
DELETE FROM `gameobject` WHERE `guid` IN (32928, 32922, 32921, 32918, 32900, 25459, 25460, 25461, 25462, 25463);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 349, -147.413, -407.847, -189.262, 0.942477, 0, 0, 0.45399, 0.891007, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 349, -145.529, -386.491, -170.419, 3.33359, 0, 0, -0.995396, 0.0958512, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 349, -94.8945, -237.793, -170.419, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 349, -93.9523, -311.759, -170.417, 1.23918, 0, 0, 0.580703, 0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 349, 10.7415, -143.591, -207.688, 3.38594, 0, 0, -0.992546, 0.12187, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 349, 103.565, -257.051, -167.439, 3.80482, 0, 0, -0.945518, 0.325568, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 349, 141.178, -391.741, -175.001, 4.7822, 0, 0, -0.681998, 0.731354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 349, 197.139, -91.757, -129.589, 4.71239, 0, 0, -0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 349, 225.88, -381.777, -160.314, 5.75959, 0, 0, -0.258819, 0.965926, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 349, 267.057, -324.909, -139.608, 0.314158, 0, 0, 0.156434, 0.987688, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 349, 289.052, 50.4382, -131.01, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 349, 291.651, -49.0027, -130.93, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 349, 318.675, 13.3193, -130.733, 2.30383, 0, 0, 0.913545, 0.406738, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 349, 596.232, -209.992, -64.0246, 1.11701, 0, 0, 0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 349, 719.844, -389.394, -52.0194, 6.0912, 0, 0, -0.0958452, 0.995396, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 349, 755.744, -368.246, -61.4905, 5.8294, 0, 0, -0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 349, 814.429, -238.968, -74.3798, 1.51844, 0, 0, 0.688354, 0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 349, 934.78, -307.637, -49.4134, 2.56563, 0, 0, 0.958819, 0.284016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 349, 943.325, -215.377, -46.5547, 4.17134, 0, 0, -0.870356, 0.492424, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 349, 1033.64, -258.465, -72.2216, 1.46608, 0, 0, 0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 349, 1045.67, -312.662, -38.0973, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 349, -157.535, -284.373, -170.383, 2.35619, 0, 0, 0.92388, 0.382683, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 349, 349.508, -405.274, -124.867, 1.71042, 0, 0, 0.75471, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2040, 349, -147.413, -407.847, -189.262, 0.942477, 0, 0, 0.45399, 0.891007, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2040, 349, -145.529, -386.491, -170.419, 3.33359, 0, 0, -0.995396, 0.0958512, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2040, 349, -94.8945, -237.793, -170.419, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2040, 349, -93.9523, -311.759, -170.417, 1.23918, 0, 0, 0.580703, 0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2040, 349, 10.7415, -143.591, -207.688, 3.38594, 0, 0, -0.992546, 0.12187, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2040, 349, 103.565, -257.051, -167.439, 3.80482, 0, 0, -0.945518, 0.325568, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2040, 349, 141.178, -391.741, -175.001, 4.7822, 0, 0, -0.681998, 0.731354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2040, 349, 197.139, -91.757, -129.589, 4.71239, 0, 0, -0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2040, 349, 225.88, -381.777, -160.314, 5.75959, 0, 0, -0.258819, 0.965926, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2040, 349, 267.057, -324.909, -139.608, 0.314158, 0, 0, 0.156434, 0.987688, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2040, 349, 289.052, 50.4382, -131.01, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2040, 349, 291.651, -49.0027, -130.93, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2040, 349, 318.675, 13.3193, -130.733, 2.30383, 0, 0, 0.913545, 0.406738, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 2040, 349, 596.232, -209.992, -64.0246, 1.11701, 0, 0, 0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 2040, 349, 719.844, -389.394, -52.0194, 6.0912, 0, 0, -0.0958452, 0.995396, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 2040, 349, 755.744, -368.246, -61.4905, 5.8294, 0, 0, -0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 2040, 349, 814.429, -238.968, -74.3798, 1.51844, 0, 0, 0.688354, 0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 2040, 349, 934.78, -307.637, -49.4134, 2.56563, 0, 0, 0.958819, 0.284016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 2040, 349, 943.325, -215.377, -46.5547, 4.17134, 0, 0, -0.870356, 0.492424, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 2040, 349, 1033.64, -258.465, -72.2216, 1.46608, 0, 0, 0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 2040, 349, 1045.67, -312.662, -38.0973, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 2040, 349, -157.535, -284.373, -170.383, 2.35619, 0, 0, 0.92388, 0.382683, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 2040, 349, 349.508, -405.274, -124.867, 1.71042, 0, 0, 0.75471, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 2047, 349, -147.413, -407.847, -189.262, 0.942477, 0, 0, 0.45399, 0.891007, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 2047, 349, -145.529, -386.491, -170.419, 3.33359, 0, 0, -0.995396, 0.0958512, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 2047, 349, -94.8945, -237.793, -170.419, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 2047, 349, -93.9523, -311.759, -170.417, 1.23918, 0, 0, 0.580703, 0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 2047, 349, 10.7415, -143.591, -207.688, 3.38594, 0, 0, -0.992546, 0.12187, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 2047, 349, 103.565, -257.051, -167.439, 3.80482, 0, 0, -0.945518, 0.325568, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 2047, 349, 141.178, -391.741, -175.001, 4.7822, 0, 0, -0.681998, 0.731354, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 2047, 349, 197.139, -91.757, -129.589, 4.71239, 0, 0, -0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 2047, 349, 225.88, -381.777, -160.314, 5.75959, 0, 0, -0.258819, 0.965926, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 2047, 349, 267.057, -324.909, -139.608, 0.314158, 0, 0, 0.156434, 0.987688, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 2047, 349, 289.052, 50.4382, -131.01, 4.62512, 0, 0, -0.737277, 0.675591, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 2047, 349, 291.651, -49.0027, -130.93, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 2047, 349, 318.675, 13.3193, -130.733, 2.30383, 0, 0, 0.913545, 0.406738, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 2047, 349, 596.232, -209.992, -64.0246, 1.11701, 0, 0, 0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 2047, 349, 719.844, -389.394, -52.0194, 6.0912, 0, 0, -0.0958452, 0.995396, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 2047, 349, 755.744, -368.246, -61.4905, 5.8294, 0, 0, -0.224951, 0.97437, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 2047, 349, 814.429, -238.968, -74.3798, 1.51844, 0, 0, 0.688354, 0.725374, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 2047, 349, 934.78, -307.637, -49.4134, 2.56563, 0, 0, 0.958819, 0.284016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 2047, 349, 943.325, -215.377, -46.5547, 4.17134, 0, 0, -0.870356, 0.492424, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 2047, 349, 1033.64, -258.465, -72.2216, 1.46608, 0, 0, 0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 2047, 349, 1045.67, -312.662, -38.0973, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 2047, 349, -157.535, -284.373, -170.383, 2.35619, 0, 0, 0.92388, 0.382683, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 2047, 349, 349.508, -405.274, -124.867, 1.71042, 0, 0, 0.75471, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+15, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+16, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+17, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+18, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+19, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+20, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+21, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+22, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@PTEMPLATE+23, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+18, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+19, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+20, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+21, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+22, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+23, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+24, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+25, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+26, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+27, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+28, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+29, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+30, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+31, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+32, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+33, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+34, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+35, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+36, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+37, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+38, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+39, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+40, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+41, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+42, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+43, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+44, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+45, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+46, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+47, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+48, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+49, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+50, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+51, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+52, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+53, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+54, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+55, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+56, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+57, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+58, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+59, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+60, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+61, @PTEMPLATE+15, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+62, @PTEMPLATE+16, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+63, @PTEMPLATE+17, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+64, @PTEMPLATE+18, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+65, @PTEMPLATE+19, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+66, @PTEMPLATE+20, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+67, @PTEMPLATE+21, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+68, @PTEMPLATE+22, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10),
(@OGUID+69, @PTEMPLATE+23, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+24, 10, 'Maraudon - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+2, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+3, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+4, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+5, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+6, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+7, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+8, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+9, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+10, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+11, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+12, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+13, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+14, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+15, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+16, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+17, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+18, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+19, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+20, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+21, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+22, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0),
(@PTEMPLATE+23, @PTEMPLATE+24, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 0);

-- Garrison Armory
SET @OGUID = 50386;
SET @PTEMPLATE = 3941;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (28526, 28527, 28528, 28529, 28530, 28531, 28532, 28533, 28534, 28535, 28536, 28537, 28538, 28539, 28540, 28541, 28542, 28543, 28544, 28545, 28546, 28547, 28548, 28549, 28616, 28617, 28618, 28619, 28620, 28621, 28622, 28623, 28624, 28625));
DELETE FROM `gameobject` WHERE `guid` IN (28526, 28527, 28528, 28529, 28530, 28531, 28532, 28533, 28534, 28535, 28536, 28537, 28538, 28539, 28540, 28541, 28542, 28543, 28544, 28545, 28546, 28547, 28548, 28549, 28616, 28617, 28618, 28619, 28620, 28621, 28622, 28623, 28624, 28625);
DELETE FROM `pool_gameobject` WHERE `guid` IN (28526, 28527, 28528, 28529, 28530, 28531, 28532, 28533, 28534, 28535, 28536, 28537, 28538, 28539, 28540, 28541, 28542, 28543, 28544, 28545, 28546, 28547, 28548, 28549, 28616, 28617, 28618, 28619, 28620, 28621, 28622, 28623, 28624, 28625);

-- 150079 / 150080
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 150079, 0, -10857.4, -3167.36, 47.1372, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 150079, 0, -10818.7, -3475.05, -21.4749, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 150079, 0, -10801.7, -3064.23, 45.8933, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 150079, 0, -10780.1, -3291.37, -10.1236, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 150079, 0, -10741.1, -3678.92, -10.5593, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 150079, 0, -10705.5, -3127.19, 29.0701, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 150079, 0, -10684.2, -3692.6, -11.4256, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 150079, 0, -10661.6, -3303.15, -9.63558, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 150079, 0, -10659, -3390.33, -12.6527, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 150079, 0, -10603.2, -3214.84, -2.70033, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 150079, 0, -10554.8, -3591.63, -13.6239, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 150079, 0, -10530.1, -3547.74, -9.48959, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 150079, 0, -10494.9, -3214.97, -1.79457, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 150079, 0, -10481.5, -3269.82, -4.87173, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 150080, 0, -10857.4, -3167.36, 47.1372, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 150080, 0, -10818.7, -3475.05, -21.4749, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 150080, 0, -10801.7, -3064.23, 45.8933, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 150080, 0, -10780.1, -3291.37, -10.1236, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 150080, 0, -10741.1, -3678.92, -10.5593, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 150080, 0, -10705.5, -3127.19, 29.0701, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 150080, 0, -10684.2, -3692.6, -11.4256, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 150080, 0, -10661.6, -3303.15, -9.63558, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 150080, 0, -10659, -3390.33, -12.6527, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 150080, 0, -10603.2, -3214.84, -2.70033, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 150080, 0, -10554.8, -3591.63, -13.6239, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 150080, 0, -10530.1, -3547.74, -9.48959, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 150080, 0, -10494.9, -3214.97, -1.79457, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 150080, 0, -10481.5, -3269.82, -4.87173, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+13, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+14, 1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+15, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+16, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+17, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+18, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+19, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+20, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+21, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+22, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+23, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+24, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+25, @PTEMPLATE+11, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+26, @PTEMPLATE+12, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+27, @PTEMPLATE+13, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+28, @PTEMPLATE+14, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 5, 'Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+2, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+3, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+4, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+5, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+6, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+7, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+8, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+9, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+10, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+11, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+12, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+13, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+14, @PTEMPLATE+15, 0, 'Gold Vein / Mithril Deposit - Blasted Lands - Garrison Armory', 0);

SET @OGUID = 55299;
SET @PTEMPLATE = 4329;

-- 150082 / 150081
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 150081, 0, -10736.8, -3450.88, -15.9763, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 150081, 0, -10732.7, -3276.7, -10.6695, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 150081, 0, -10702.7, -3170.85, 24.7436, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 150081, 0, -10673.9, -3564.52, -33.5804, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 150081, 0, -10671.9, -3101.02, 21.8348, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 150081, 0, -10619.1, -3383.08, -13.5731, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 150081, 0, -10614.3, -3279.39, -6.62452, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 150081, 0, -10611.1, -3543.19, -7.88755, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 150081, 0, -10604.6, -3622.64, -12.7788, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 150081, 0, -10594.3, -3199.24, 10.6181, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 150081, 0, -10557.8, -3255.34, 5.07344, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 150081, 0, -10552.4, -3171.3, 5.98372, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 150081, 0, -10550.4, -3393.96, -2.81507, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 150081, 0, -10544.9, -3499.9, -10.4198, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 150081, 0, -10708.4, -3630.8, -10.6296, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 150082, 0, -10736.8, -3450.88, -15.9763, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 150082, 0, -10732.7, -3276.7, -10.6695, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 150082, 0, -10702.7, -3170.85, 24.7436, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 150082, 0, -10673.9, -3564.52, -33.5804, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 150082, 0, -10671.9, -3101.02, 21.8348, 3.03684, 0, 0, 0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 150082, 0, -10619.1, -3383.08, -13.5731, 6.19592, 0, 0, -0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 150082, 0, -10614.3, -3279.39, -6.62452, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 150082, 0, -10611.1, -3543.19, -7.88755, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 150082, 0, -10604.6, -3622.64, -12.7788, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 150082, 0, -10594.3, -3199.24, 10.6181, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 150082, 0, -10557.8, -3255.34, 5.07344, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 150082, 0, -10552.4, -3171.3, 5.98372, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 150082, 0, -10550.4, -3393.96, -2.81507, 0.837757, 0, 0, 0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 150082, 0, -10544.9, -3499.9, -10.4198, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 150082, 0, -10708.4, -3630.8, -10.6296, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+10, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+11, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+12, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+13, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+14, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+15, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+16, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+17, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+18, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+19, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+20, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+21, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+22, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+23, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+24, @PTEMPLATE+9, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+25, @PTEMPLATE+10, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+26, @PTEMPLATE+11, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+27, @PTEMPLATE+12, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+28, @PTEMPLATE+13, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+29, @PTEMPLATE+14, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+30, @PTEMPLATE+15, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 5, 'Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+2, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+3, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+4, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+5, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+6, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+7, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+8, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+9, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+10, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+11, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+12, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+13, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+14, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+15, @PTEMPLATE+16, 0, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0);

-- 150079 / 150080 / 150081
SET @OGUID = 49352;
SET @PTEMPLATE = 4244;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 150079, 0, -10497.4, -3329.15, -4.38601, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 150079, 0, -10678, -3063.91, 19.3301, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 150079, 0, -10613, -3328.92, -7.07186, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 150079, 0, -10503.3, -3453.36, -14.0034, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 150079, 0, -10625, -3655, -15.6897, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 150080, 0, -10497.4, -3329.15, -4.38601, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 150080, 0, -10678, -3063.91, 19.3301, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 150080, 0, -10613, -3328.92, -7.07186, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 150080, 0, -10503.3, -3453.36, -14.0034, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 150080, 0, -10625, -3655, -15.6897, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 150081, 0, -10497.4, -3329.15, -4.38601, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 150081, 0, -10678, -3063.91, 19.3301, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 150081, 0, -10613, -3328.92, -7.07186, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 150081, 0, -10503.3, -3453.36, -14.0034, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 150081, 0, -10625, -3655, -15.6897, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+6, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+7, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+8, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+9, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+10, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+11, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+12, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+13, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+14, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10),
(@OGUID+15, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 4, 'Blasted Lands - Garrison Armory - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+2, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+3, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+4, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0),
(@PTEMPLATE+5, @PTEMPLATE+6, 0, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Garrison Armory', 0);

-- Hakkari Thorium Vein
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(48962, 180215, 309, -11599, -1217.44, 80.3655, 1.72787, 0, 0, 0.760406, 0.649449, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48963, 180215, 309, -11647.4, -1476.96, 50.3857, 4.31097, 0, 0, -0.833885, 0.551938, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48964, 180215, 309, -12310.1, -1465.36, 130.6, 3.9619, 0, 0, -0.91706, 0.39875, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48965, 180215, 309, -12398.2, -1934.43, 133.233, 0.733038, 0, 0, 0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48966, 180215, 309, -11549.5, -1489.06, 73.2133, 3.71755, 0, 0, -0.958819, 0.284016, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48967, 180215, 309, -12177.3, -1910.15, 130.807, 1.93731, 0, 0, 0.824125, 0.566408, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48968, 180215, 309, -11803.5, -1905.71, 52.927, 2.54818, 0, 0, 0.956305, 0.292372, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48969, 180215, 309, -12063.5, -1437.4, 130.23, 1.25664, 0, 0, 0.587785, 0.809017, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48970, 180215, 309, -11546.4, -1745.06, 40.1541, 1.3439, 0, 0, 0.622514, 0.782609, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48971, 180215, 309, -11994.2, -1458.62, 83.1144, 5.044, 0, 0, -0.580703, 0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(48972, 180215, 309, -11545.6, -1237.46, 79.2193, 2.37364, 0, 0, 0.927183, 0.374608, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21401, 5, 'Zul\'Gurub - Hakkari Thorium Vein', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(180215, 21401, 'Zul\'Gurub - Hakkari Thorium Vein');

-- Deadmines
SET @OGUID = 50300;
SET @PTEMPLATE = 4477;

DELETE FROM `gameobject` WHERE `guid` IN (26186, 26187, 26199, 34847, 3996297, 3996298);

-- tin / silver
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 1732, 36, -167.956, -411.293, 58.6313, 2.79252, 0, 0, 0.984807, 0.173652, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 36, -211.943, -518.46, 52.8603, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 36, -139.255, -567.673, 21.0111, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 36, -154.313, -393.34, 58.4521, 4.08407, 0, 0, -0.891006, 0.453991, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 36, -146.761, -519.81, 55.0914, 5.65487, 0, 0, -0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 36, -234.303, -491.65, 50.7398, 4.14472, 0, 0, 0.876833, -0.480796, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 36, -127.872, -444.354, 57.161, 0.349066, 0, 0, 0.173648, 0.984808, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 36, -167.956, -411.293, 58.6313, 2.79252, 0, 0, 0.984807, 0.173652, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 36, -211.943, -518.46, 52.8603, 3.94445, 0, 0, -0.920505, 0.390732, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 36, -139.255, -567.673, 21.0111, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 36, -154.313, -393.34, 58.4521, 4.08407, 0, 0, -0.891006, 0.453991, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 36, -146.761, -519.81, 55.0914, 5.65487, 0, 0, -0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 36, -234.303, -491.65, 50.7398, 4.14472, 0, 0, 0.876833, -0.480796, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 36, -127.872, -444.354, 57.161, 0.349066, 0, 0, 0.173648, 0.984808, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Deadmines', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+8, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+9, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+10, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+11, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+12, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+13, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Deadmines', 0, 10),
(@OGUID+14, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Deadmines', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 2, 'Deadmines - Tin Vein / Silver Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+2, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+3, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+4, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+5, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+6, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0),
(@PTEMPLATE+7, @PTEMPLATE+8, 0, 'Tin Vein / Silver Vein - Deadmines', 0);

UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Tin Vein / Silver Vein - Deadmines" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Tin Vein / Silver Vein - Deadmines" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Copper
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+15, 1731, 36, -56.9023, -349.056, 57.4095, -1.06465, 0, 0, 0.507538, -0.861629, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1731, 36, -281.444, -604.086, 52.2907, 5.28825, 0, 0, 0.477201, -0.878794, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1731, 36, -81.0082, -394.329, 61.5258, 0.436332, 0, 0, 0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1731, 36, -286.104, -577.582, 50.9829, 6.21337, 0, 0, -0.0348988, 0.999391, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1731, 36, -75.6959, -407.331, 56.1338, 4.34587, 0, 0, -0.824126, 0.566406, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1731, 36, -277.478, -572.826, 52.6279, 5.23599, 0, 0, -0.5, 0.866025, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 3, 'Deadmines - Copper Vein', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(@OGUID+15, @PTEMPLATE+9, 'Deadmines - Copper Vein'),
(@OGUID+16, @PTEMPLATE+9, 'Deadmines - Copper Vein'),
(@OGUID+17, @PTEMPLATE+9, 'Deadmines - Copper Vein'),
(@OGUID+18, @PTEMPLATE+9, 'Deadmines - Copper Vein'),
(@OGUID+19, @PTEMPLATE+9, 'Deadmines - Copper Vein'),
(@OGUID+20, @PTEMPLATE+9, 'Deadmines - Copper Vein');

-- Wailing Caverns
SET @OGUID = 49226;
SET @PTEMPLATE = 4785;

DELETE FROM `gameobject` WHERE `guid` IN (35596, 35599, 35626, 35631, 35632, 35650);

-- tin / silver
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 43, -32.2606, 43.5227, -117.543, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 43, -122.103, -121.608, -64.2499, 0.90757, 0, 0, 0.438371, 0.898794, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 43, -60.6188, -19.1028, -58.7328, 4.60767, 0, 0, -0.743144, 0.669131, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 43, -183.977, -366.45, -70.6907, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 43, -89.4373, -314.586, -60.7897, 0.95993, 0, 0, 0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 43, -32.2606, 43.5227, -117.543, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 43, -122.103, -121.608, -64.2499, 0.90757, 0, 0, 0.438371, 0.898794, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 43, -60.6188, -19.1028, -58.7328, 4.60767, 0, 0, -0.743144, 0.669131, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 43, -183.977, -366.45, -70.6907, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 43, -89.4373, -314.586, -60.7897, 0.95993, 0, 0, 0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+6, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+7, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+8, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+9, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10),
(@OGUID+10, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Wailing Caverns', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 2, 'Wailing Caverns - Tin Vein / Silver Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+6, 0, 'Tin Vein / Silver Vein - Wailing Caverns', 0),
(@PTEMPLATE+2, @PTEMPLATE+6, 0, 'Tin Vein / Silver Vein - Wailing Caverns', 0),
(@PTEMPLATE+3, @PTEMPLATE+6, 0, 'Tin Vein / Silver Vein - Wailing Caverns', 0),
(@PTEMPLATE+4, @PTEMPLATE+6, 0, 'Tin Vein / Silver Vein - Wailing Caverns', 0),
(@PTEMPLATE+5, @PTEMPLATE+6, 0, 'Tin Vein / Silver Vein - Wailing Caverns', 0);

UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- copper
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 1731, 43, -12.9076, 366.047, -59.3451, 5.84685, 0, 0, -0.216439, 0.976296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1731, 43, -179.484, -190.661, -60.6078, 5.11382, 0, 0, -0.551936, 0.833886, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1731, 43, -7.34642, -91.6428, -63.41, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1731, 43, 30.1493, -188.35, -85.0525, 5.68977, 0, 0, -0.292372, 0.956305, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1731, 43, -87.6443, -136.019, -65.0488, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1731, 43, -128.53, -217.217, -65.021, 0.226892, 0, 0, 0.113203, 0.993572, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1731, 43, -161.053, 411.129, -72.5271, 3.01942, 0, 0, 0.998135, 0.061049, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 3, 'Deadmines - Copper Vein', 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(@OGUID+11, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+12, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+13, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+14, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+15, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+16, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein'),
(@OGUID+17, @PTEMPLATE+9, 'Wailing Caverns - Copper Vein');

UPDATE `gameobject` SET `id` = 1667 WHERE `guid`=118818;

-- Razorfen Kraul
SET @OGUID = 47644;
SET @PTEMPLATE = 7110;

DELETE FROM `gameobject` WHERE `guid` IN (35737, 35739, 35743, 35751);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1735, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1735, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1733, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1733, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1733, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1733, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1733, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1733, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1733, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1733, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1733, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1733, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1733, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1733, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+11, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@PTEMPLATE+12, 1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+19, @PTEMPLATE+7, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+20, @PTEMPLATE+8, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+21, @PTEMPLATE+9, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+22, @PTEMPLATE+10, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+23, @PTEMPLATE+11, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+24, @PTEMPLATE+12, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+25, @PTEMPLATE+1, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+26, @PTEMPLATE+2, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+27, @PTEMPLATE+3, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+28, @PTEMPLATE+4, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+29, @PTEMPLATE+5, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+30, @PTEMPLATE+6, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+31, @PTEMPLATE+7, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+32, @PTEMPLATE+8, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+33, @PTEMPLATE+9, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+34, @PTEMPLATE+10, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+35, @PTEMPLATE+11, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10),
(@OGUID+36, @PTEMPLATE+12, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 5, 'Razorfen Kraul - Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+2, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+3, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+4, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+5, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+6, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+7, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+8, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+9, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+10, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+11, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0),
(@PTEMPLATE+12, @PTEMPLATE+13, 0, 'Gold Vein / Iron Deposit  - Razorfen Kraul', 0);

UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Iron Deposit  - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Iron Deposit  - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Gold Vein / Iron Deposit  - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

UPDATE `gameobject` SET `id` = 2040 WHERE `guid` = 27656;

-- Missing Silver Veins in Duskwood
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(2225, 1733, 0, -11010, -989.044, 69.0113, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(2226, 1733, 0, -10678.7, -908.818, 68.4815, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2225, 2557, 0, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 10),
(2226, 2558, 0, 'Silver Vein / Gold Vein / Iron Deposit - Duskwood', 0, 10);

UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Duskwood' WHERE  `entry` IN (2557, 2558);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Duskwood' WHERE  `guid` IN (25273, 25255, 25272, 25254);
UPDATE `pool_gameobject` SET `chance`= 20 WHERE `guid`=2225;
UPDATE `pool_gameobject` SET `chance`= 70 WHERE `guid`=25272;
UPDATE `pool_gameobject` SET `chance`= 20 WHERE `guid`=2226;
UPDATE `pool_gameobject` SET `chance`= 70 WHERE `guid`=25273;

-- Tin Vein / Silver Vein in Alterac Mountains
DELETE FROM `pool_gameobject` WHERE `guid` = 31522;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2405, 1732, 0, -19.4989, -33.674, 106.887, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(18870, 1, 'Tin Vein / Silver Vein - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2405, 18870, 'Tin Vein / Silver Vein - Alterac Mountains', 10),
(31522, 18870, 'Tin Vein / Silver Vein - Alterac Mountains', 10);

UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=31522;

-- Tin Vein / Silver Vein / Iron Deposit in Alterac Mountains
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2406, 1732, 0, -16.5498, 463.366, 53.6286, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2406, 2915, 'Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains', 10);

UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=31523;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=396411;

-- Tin Vein / Silver Vein / Iron Deposit in Alterac Mountains
DELETE FROM `pool_gameobject` WHERE `guid` = 220422;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2407, 1732, 0, -254.604, 379.709, 121.872, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(2408, 1733, 0, -254.604, 379.709, 121.872, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(18871, 1, 'Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2407, 18871, 'Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains', 10),
(2408, 18871, 'Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains', 10),
(220422, 18871, 'Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains', 10);

UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Alterac Mountains' WHERE  `guid`=220422;

-- Weapon Crate / Armor Crate 3702 / 3689 in Blackfathom Deeps
DELETE FROM `gameobject` WHERE `guid` IN (566018, 253179, 440644, 272873, 44686, 96, 32624, 2556);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(566018, 3689, 48, -295.378, 316.711, -52.3953, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 100, 1, 0, 0, 0, 10),
(253179, 3689, 48, -614.864, 252.745, -49.4881, 4.81711, 0, 0, -0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(440644, 3702, 48, -295.378, 316.711, -52.3953, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 100, 1, 0, 0, 0, 10),
(272873, 3702, 48, -614.864, 252.745, -49.4881, 4.81711, 0, 0, -0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(8840, 1, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10),
(8841, 1, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(566018, 8840, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10),
(253179, 8841, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10),
(440644, 8840, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10),
(272873, 8841, 'Weapon Crate / Armor Crate - Blackfathom Deeps', 0, 10);

-- Blackfathom Deeps
SET @OGUID = 2189;
SET @PTEMPLATE = 14267;

DELETE FROM `gameobject` WHERE `guid` IN (32623, 32621, 32612, 25455);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 48, -479.657, 295.416, -64.3415, 4.88692, 0, 0, -0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 48, -401.418, 46.9318, -47.7134, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 48, -351.981, 402.932, -53.4195, 5.42797, 0, 0, -0.414693, 0.909961, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 48, -286.652, 324.114, -51.3902, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 48, -812.949, -144.779, -37.2873, 2.74016, 0, 0, 0.979924, 0.19937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 48, -761.542, -166.294, -52.6799, 1.97222, 0, 0, 0.833885, 0.551938, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 48, -479.657, 295.416, -64.3415, 4.88692, 0, 0, -0.642787, 0.766045, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 48, -401.418, 46.9318, -47.7134, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 48, -351.981, 402.932, -53.4195, 5.42797, 0, 0, -0.414693, 0.909961, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 48, -286.652, 324.114, -51.3902, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 48, -812.949, -144.779, -37.2873, 2.74016, 0, 0, 0.979924, 0.19937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 48, -761.542, -166.294, -52.6799, 1.97222, 0, 0, 0.833885, 0.551938, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+7, @PTEMPLATE+1, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+8, @PTEMPLATE+2, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+9, @PTEMPLATE+3, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+10, @PTEMPLATE+4, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+11, @PTEMPLATE+5, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10),
(@OGUID+12, @PTEMPLATE+6, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 4, 'Blackfathom Deeps - Tin Vein / Silver Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0),
(@PTEMPLATE+2, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0),
(@PTEMPLATE+3, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0),
(@PTEMPLATE+4, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0),
(@PTEMPLATE+5, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0),
(@PTEMPLATE+6, @PTEMPLATE+7, 0, 'Tin Vein / Silver Vein  - Blackfathom Deeps', 0);

-- Mithril / Truesilver in Alterac Mountains
DELETE FROM `pool_gameobject` WHERE `guid` = 220409;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2220, 2047, 0, 690.51, -623.184, 166.421, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(9003, 1, 'Mithril Deposit / Truesilver Deposit - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2220, 9003, 'Mithril Deposit / Truesilver Deposit - Alterac Mountains', 10),
(220409, 9003, 'Mithril Deposit / Truesilver Deposit - Alterac Mountains', 10);

-- Mithril / Truesilver in Desolace
DELETE FROM `pool_gameobject` WHERE `guid` = 7203;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2221, 2047, 1, -1407.62, 2911.05, 93.9409, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(9004, 1, 'Mithril Deposit / Truesilver Deposit - Desolace', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2221, 9004, 'Mithril Deposit / Truesilver Deposit - Desolace', 10),
(7203, 9004, 'Mithril Deposit / Truesilver Deposit - Desolace', 10);

-- Mithril / Truesilver in Dustwallow
DELETE FROM `pool_gameobject` WHERE `guid` = 220840;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2222, 2047, 1, -4464.97, -2882.58, 22.3767, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(9005, 1, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2222, 9005, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10),
(220840, 9005, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10);

-- Mithril / Truesilver in Dustwallow
DELETE FROM `pool_gameobject` WHERE `guid` = 220419;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2223, 2047, 1, -2766.39, -2606.88, 34.2974, 5.41052, 0, 0, -0.422618, 0.906308, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(9006, 1, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(2223, 9006, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10),
(220419, 9006, 'Mithril Deposit / Truesilver Deposit - Dustwallow Marsh', 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
