DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250214155403');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250214155403');
-- Add your query below.


-- Tanaris
SET @OGUID = 100600;
SET @PTEMPLATE = 2164;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -8231.05175781250, -2637.931884765625, 11.71840476989746093, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -8950.98828125000, -3635.419189453125, 12.20802307128906250, 3.141592741012573242, 0, 0, -00000000000000001.0, 0.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -8231.05175781250, -2637.931884765625, 11.71840476989746093, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -8950.98828125000, -3635.419189453125, 12.20802307128906250, 3.141592741012573242, 0, 0, -00000000000000001.0, 0.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 1, -8231.05175781250, -2637.931884765625, 11.71840476989746093, 1.623155713081359863, 0, 0, 0.725374221801757812, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 1, -8950.98828125000, -3635.419189453125, 12.20802307128906250, 3.141592741012573242, 0, 0, -00000000000000001.0, 0.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+4, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Feralas
SET @OGUID = 100606;
SET @PTEMPLATE = 2166;

DELETE FROM `gameobject` WHERE `guid` IN (22784, 22810, 22797);
DELETE FROM `pool_gameobject` WHERE `guid` IN (22784, 22810, 22797);
DELETE FROM `pool_pool` WHERE `pool_id` = 32990;
DELETE FROM `pool_template` WHERE `entry` = 32990;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -5003.420410156250, 1838.757812500000000, 78.24241638183593750, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -5003.420410156250, 1838.757812500000000, 78.24241638183593750, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 1, -5003.420410156250, 1838.757812500000000, 78.24241638183593750, 4.555310726165771484, 0, 0, -0.76040554046630859, 0.649448513984680175, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+2, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Wetlands
DELETE FROM `gameobject` WHERE `guid` IN (74547, 74525, 74569);
DELETE FROM `pool_gameobject` WHERE `guid` IN (74547, 74525, 74569);
DELETE FROM `pool_pool` WHERE `pool_id` = 6124;
DELETE FROM `pool_template` WHERE `entry` = 6124;

DELETE FROM `gameobject` WHERE `guid` IN (74570, 74526, 74548);
DELETE FROM `pool_gameobject` WHERE `guid` IN (74570, 74526, 74548);
DELETE FROM `pool_pool` WHERE `pool_id` = 6125;
DELETE FROM `pool_template` WHERE `entry` = 6125;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(29678, 1734, 0, -3029.73, -3194.98, 59.5924, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10);
UPDATE `gameobject` SET `id` = 1735 WHERE  `guid` = 112842;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES (29678, 17025, 5, 'Silver Vein / Gold Vein / Iron Deposit - Wetlands');
UPDATE `pool_gameobject` SET `chance` = 90 WHERE  `guid` = 112842;
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands' WHERE  `guid` IN (112842, 112843);
UPDATE `pool_pool` SET `mother_pool` = 1355, `description` = 'Wetlands - Silver Vein / Gold Vein / Iron Deposit' WHERE `pool_id` = 17025;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands' WHERE `entry` = 17025;

-- Hinterlands
UPDATE `pool_template` SET `description` = 'Hinterlands -  Silver Vein / Gold Vein / Iron Deposit (Master Pool)' WHERE `entry` = 1349;
SET @OGUID = 100609;
SET @PTEMPLATE = 2167;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -283.979766845703125, -2519.599121093750, 128.2614135742187500, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -283.979766845703125, -2519.599121093750, 128.2614135742187500, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -283.979766845703125, -2519.599121093750, 128.2614135742187500, 1.169368624687194824, 0, 0, 0.551936149597167968, 0.833886384963989257, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1349, 0, 'Hinterlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Razorfen Kraul
SET @OGUID = 100612;
SET @PTEMPLATE = 2168;

DELETE FROM `gameobject` WHERE `guid` IN (47645, 47657, 47669, 47646, 47658, 47670, 47647, 47659, 47671, 47648, 47660, 47672, 47649, 47661, 47673, 47650, 47662, 47674, 47651, 47663, 47675, 47652, 47664, 47676, 47653, 47665, 47677, 47654, 47666, 47678, 47655, 47667, 47679, 47656, 47668, 47680, 47681, 47682);
DELETE FROM `pool_gameobject` WHERE `guid` IN (47645, 47657, 47669, 47646, 47658, 47670, 47647, 47659, 47671, 47648, 47660, 47672, 47649, 47661, 47673, 47650, 47662, 47674, 47651, 47663, 47675, 47652, 47664, 47676, 47653, 47665, 47677, 47654, 47666, 47678, 47655, 47667, 47679, 47656, 47668, 47680, 47681, 47682);
DELETE FROM `pool_pool` WHERE `pool_id` IN (3989, 7111, 7112, 7113, 7114, 7115, 7116, 7117, 7118, 7119, 7120, 7121, 7122);
DELETE FROM `pool_template` WHERE `entry` IN (7123, 3989, 7111, 7112, 7113, 7114, 7115, 7116, 7117, 7118, 7119, 7120, 7121, 7122);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 47, 2045.91, 1882.22, 57.761, 2.74017, 0, 0, 0.979925, 0.199368, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 47, 2041.6707763671875, 1541.7465820312500, 65.69308471679687500, 1.850048899650573730, 0, 0, 0.798635482788085937, 0.601815044879913330, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 47, 2106.1533203125000, 2016.0100097656250, 65.32147979736328125, 0.593410074710845947, 0, 0, 0.292370796203613281, 0.956305027008056640, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 47, 2194.7416992187500, 1990.3529052734375, 56.56264114379882812, 0.244345575571060180, 0, 0, 0.121869087219238281, 0.992546200752258300, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1734, 47, 2045.91, 1882.22, 57.761, 2.74017, 0, 0, 0.979925, 0.199368, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1734, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 47, 2041.6707763671875, 1541.7465820312500, 65.69308471679687500, 1.850048899650573730, 0, 0, 0.798635482788085937, 0.601815044879913330, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 47, 2106.1533203125000, 2016.0100097656250, 65.32147979736328125, 0.593410074710845947, 0, 0, 0.292370796203613281, 0.956305027008056640, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 47, 2194.7416992187500, 1990.3529052734375, 56.56264114379882812, 0.244345575571060180, 0, 0, 0.121869087219238281, 0.992546200752258300, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1735, 47, 2024.36, 1721.48, 61.2561, 0.628317, 0, 0, 0.309016, 0.951057, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1735, 47, 2036.34, 1845.86, 56.4932, 5.16618, 0, 0, -0.529919, 0.848048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1735, 47, 2045.91, 1882.22, 57.761, 2.74017, 0, 0, 0.979925, 0.199368, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1735, 47, 2058.58, 1947.86, 61.6662, 1.69297, 0, 0, 0.748956, 0.66262, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1735, 47, 2097.83, 1864.54, 52.5586, 0.680677, 0, 0, 0.333806, 0.942642, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1735, 47, 2120.08, 1781.03, 49.4096, 1.29154, 0, 0, 0.601814, 0.798636, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1735, 47, 2128.26, 2016.69, 65.9018, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1735, 47, 2128.49, 1922.27, 68.3568, -2.72271, 0, 0, 0.978148, -0.207912, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1735, 47, 2131.68, 1863.87, 55.9283, 0.122173, 0, 0, 0.0610485, 0.998135, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1735, 47, 2137.69, 1906.08, 71.468, 3.22886, 0, 0, -0.999048, 0.0436193, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1735, 47, 2166.68, 1998.86, 62.0029, 5.3058, 0, 0, -0.469471, 0.882948, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1735, 47, 2170.38, 1883.72, 73.6948, 5.32326, 0, 0, -0.461748, 0.887011, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1735, 47, 2175.92, 1714.05, 55.2663, -1.81514, 0, 0, 0.788011, -0.615661, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1735, 47, 2041.6707763671875, 1541.7465820312500, 65.69308471679687500, 1.850048899650573730, 0, 0, 0.798635482788085937, 0.601815044879913330, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1735, 47, 2106.1533203125000, 2016.0100097656250, 65.32147979736328125, 0.593410074710845947, 0, 0, 0.292370796203613281, 0.956305027008056640, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1735, 47, 2194.7416992187500, 1990.3529052734375, 56.56264114379882812, 0.244345575571060180, 0, 0, 0.121869087219238281, 0.992546200752258300, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+12, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+13, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+14, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+15, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+16, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+17, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+18, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+19, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+20, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+21, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+22, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+23, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+24, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+25, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+26, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+27, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+28, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+29, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+30, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+31, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+32, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+33, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+34, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+35, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+36, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+37, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+38, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+39, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+40, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+41, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+42, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+43, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+44, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+45, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+46, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+47, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10),
(@OGUID+48, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(7123, 3, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+13, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+14, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+15, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+16, 7123, 0, 'Razorfen Kraul - Silver Vein / Gold Vein / Iron Deposit', 0);

UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 3008;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 21601;

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Razorfen Kraul" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
