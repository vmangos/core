DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220821214504');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220821214504');
-- Add your query below.


-- Remove 0 Rotation2 Custom Spawns
DELETE FROM `pool_gameobject` WHERE `guid` IN (
SELECT `guid` FROM `gameobject` WHERE `id` IN (2040, 175404, 1735, 324, 1732, 1733, 2047, 1731, 1734, 165658, 2653, 177388, 123848, 105569, 176645, 181068, 150079, 150082, 180215, 3764, 123310, 1610, 19903, 150081, 176643, 181069, 181108, 103711, 2054, 73941, 123309, 2055, 103709, 73940, 181109, 35253, 1667, 103712, 103710, 176644, 323, 103714, 73939, 150080, 103713, 3763, 123308)
AND `rotation2` = 0);

DELETE FROM `gameobject` WHERE `id` IN (2040, 175404, 1735, 324, 1732, 1733, 2047, 1731, 1734, 165658, 2653, 177388, 123848, 105569, 176645, 181068, 150079, 150082, 180215, 3764, 123310, 1610, 19903, 150081, 176643, 181069, 181108, 103711, 2054, 73941, 123309, 2055, 103709, 73940, 181109, 35253, 1667, 103712, 103710, 176644, 323, 103714, 73939, 150080, 103713, 3763, 123308)
AND `rotation2` = 0;


DELETE FROM `pool_gameobject` WHERE `guid` IN (
SELECT `guid` FROM `gameobject` WHERE `id` IN (2040, 175404, 1735, 324, 1732, 1733, 2047, 1731, 1734, 165658, 2653, 177388, 123848, 105569, 176645, 181068, 150079, 150082, 180215, 3764, 123310, 1610, 19903, 150081, 176643, 181069, 181108, 103711, 2054, 73941, 123309, 2055, 103709, 73940, 181109, 35253, 1667, 103712, 103710, 176644, 323, 103714, 73939, 150080, 103713, 3763, 123308) 
AND position_x NOT LIKE "%.%" AND position_y NOT LIKE "%.%");

DELETE FROM `gameobject` WHERE `id` IN (2040, 175404, 1735, 324, 1732, 1733, 2047, 1731, 1734, 165658, 2653, 177388, 123848, 105569, 176645, 181068, 150079, 150082, 180215, 3764, 123310, 1610, 19903, 150081, 176643, 181069, 181108, 103711, 2054, 73941, 123309, 2055, 103709, 73940, 181109, 35253, 1667, 103712, 103710, 176644, 323, 103714, 73939, 150080, 103713, 3763, 123308) 
AND position_x NOT LIKE "%.%" AND position_y NOT LIKE "%.%";

-- Copper Veins
SET @OGUID = 43233;

UPDATE `gameobject` SET `position_x`=-1384.13, `position_y`=325.697, `position_z`=32.8761, `orientation`=2.68781, `rotation0`=0, `rotation1`=0, `rotation2`=0.97437, `rotation3`=0.224951 WHERE `guid`=4830;
UPDATE `gameobject` SET `orientation`=4.38078, `rotation2`=-0.814116 WHERE  `guid`=42480;
UPDATE `gameobject` SET `orientation`=4.50295, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE  `guid`=34233;
UPDATE `gameobject` SET `orientation`=5.20108, `rotation2`=-0.515038, `rotation3`=0.857168 WHERE  `guid`=31111;
UPDATE `gameobject` SET `orientation`=2.9845, `rotation3`=0.0784664 WHERE  `guid`=5440;
UPDATE `gameobject` SET `orientation`=5.53269, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE  `guid`=25045;
UPDATE `gameobject` SET `orientation`=5.06146, `rotation2`=-0.573576, `rotation3`=0.819152 WHERE  `guid`=10843;
UPDATE `gameobject` SET `orientation`=5.70723, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE  `guid`=12610;
UPDATE `gameobject` SET `orientation`=5.41052, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE  `guid`=31103;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1731, 0, -11386.2, 1643.82, 72.648, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1731, 0, -9737.25, -2440.96, 70.0273, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1731, 0, -9233.06, -3284.12, 104.102, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1731, 0, -6135.1, -2944.09, 398.718, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1731, 0, -5727.6, -1662.49, 363.751, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1731, 0, -5108.46, -3121.91, 313.321, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1731, 0, -4957.82, -2984.35, 347.496, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1731, 1, -2038.94, -1100.57, 82.7365, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1731, 1, -309.233, -5194.16, 22.4343, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1731, 1, 73.9236, -4487.36, 50.8945, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1731, 0, 1888.04, 979.146, 29.1322, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1731, 0, -5051.87, -585.697, 426.163, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+1, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+2, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+3, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+4, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+5, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+6, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+7, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+8, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+9, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+10, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+11, 1019, 'Copper Vein - Dun Morogh', 10);

-- Tin Veins
SET @OGUID = 43245;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, -11755.9, -176.016, 23.3022, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1732, 1, -3876.55, -3889.24, 65.1546, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, -2632.81, -3647.33, 41.4555, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, -704.537, 1343.63, 94.3765, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, -1443.48, 993.682, 96.2679, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, -284.348, 1431.92, 105.729, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, 295.198, 1856.66, 111.337, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -11717.2, -139.426, 19.3768, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 1, 210.452, 1705.18, 143.72, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 405, 'Tin Vein - Stranglethorn', 10),
(@OGUID+1, 43521, 'Tin Vein - Dustwallow Marsh', 10),
(@OGUID+2, 43521, 'Tin Vein - Dustwallow Marsh', 10),
(@OGUID+3, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+4, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+5, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+6, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+7, 405, 'Tin Vein - Stranglethorn', 10),
(@OGUID+8, 1140, 'Tin Vein - Desolace', 10);

-- Silver Veins
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(43254, 1733, 0, -71.7572, -460.453, 102.154, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(396411, 1733, 0, -16.5498, 463.366, 53.6286, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(396412, 1732, 0, -41.0918, 415.415, 62.6462, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43254, 397, 'Silver Vein - Alterac Mountains', 10),
(396411, 397, 'Silver Vein - Alterac Mountains', 10),
(396412, 397, 'Silver Vein - Alterac Mountains', 10);

-- Gold Veins
SET @OGUID = 43255;

UPDATE `gameobject` SET `position_x`=-11137.5, `position_y`=-1174.14, `position_z`=43.9296, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid` IN (25270, 25300);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1734, 0, 582.789, -746.925, 152.998, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1734, 0, -12741.6, -451.59, 32.6192, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -13801.1, -120.558, 24.5498, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 1, 100, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1353, 'Gold Vein - Alterac Mountains', 10),
(@OGUID+1, 1176, 'Gold Vein - Stranglethorn', 10),
(@OGUID+2, 1176, 'Gold Vein - Stranglethorn', 10);

-- Iron Deposits
SET @OGUID = 389458;

UPDATE `gameobject` SET `position_y`=-424.372 WHERE  `guid`=5896;
UPDATE `gameobject` SET `position_y`=-424.372, `orientation`=5.2709, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE  `guid`=11969;
UPDATE `gameobject` SET `position_x`=-913.527, `position_y`=1033.02, `position_z`=96.0823, `orientation`=0.925024, `rotation0`=0, `rotation1`=0, `rotation2`=0.446198, `rotation3`=0.894935 WHERE `guid`=4001871;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1735, 0, -11506.1, 480.384, 65.5531, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 1735, 0, -11463.3, -872.963, 39.4088, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 1735, 0, -12354.7, -992.975, 12.0588, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 1735, 0, -11681.5, 317.656, 43.8298, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 1735, 0, -13957.4, 172.505, 27.5382, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 1735, 0, -13894.2, -1.97103, 35.2379, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1735, 0, 888.666, -574.497, 153.781, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1735, 0, 1127.2, -742.367, 79.6405, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1735, 0, 859.253, -547.027, 144.743, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1735, 0, 668.344, -416.631, 161.627, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1735, 0, 927.011, -342.925, 143.022, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1735, 1, -2265.13, 1574.06, 78.2124, 4.2237, 0, 0, -0.857167, 0.515038, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1735, 1, 192.382, 1893.76, 135.219, 6.12611, 0, 0, -0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 1735, 1, -3456.27, -3365.72, 52.7804, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1735, 1, -3051.64, -3319.91, 52.5062, 2.09439, 0, 0, 0.866025, 0.500001, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+1, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+2, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+3, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+4, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+5, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+6, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+7, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+8, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+9, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+10, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+11, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+12, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+13, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+14, 43520, 'Iron Deposit - Dustwallow Marsh', 10);

-- Tin Vein / Silver Vein in Hillsbrad
SET @OGUID = 43272;
SET @PTEMPLATE = 21700;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, 306.792, -1082.6, 93.0067, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1733, 0, 306.792, -1082.6, 93.0067, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein in Arathi
SET @OGUID = 43274;
SET @PTEMPLATE = 21664;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, -1835.7, -3131.75, 45.4336, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1733, 0, -1835.7, -3131.75, 45.4336, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 406, 0, ' Arathi Highlands - Tin Vein / Silver Vein', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Hillsbrad Foothills
SET @OGUID = 43280;
SET @PTEMPLATE = 21667;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1733, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1733, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 0, -203.769, -338.907, 55.2152, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 0, -156.596, -312.964, 53.5226, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 0, -241.383, -330.625, 46.4368, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+4, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+5, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+6, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+9, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+10, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+11, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+12, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+13, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+14, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Arathi Highlands
SET @OGUID = 43298;
SET @PTEMPLATE = 21671;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1733, 0, -1841.37, -2928.97, 72.3839, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 1733, 0, -1935.9, -2793.63, 82.0799, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 1733, 0, -1982.09, -2808.73, 86.8473, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 1733, 0, -2005.38, -2816.19, 77.8807, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 1733, 0, -1228.73, -1993.95, 36.6098, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 1733, 0, -1259.59, -2936.51, 39.8619, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 1733, 0, -1251.96, -2055.88, 77.5748, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 1734, 0, -1841.37, -2928.97, 72.3839, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 1734, 0, -1935.9, -2793.63, 82.0799, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 1734, 0, -1982.09, -2808.73, 86.8473, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 1734, 0, -2005.38, -2816.19, 77.8807, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 1734, 0, -1228.73, -1993.95, 36.6098, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 1734, 0, -1259.59, -2936.51, 39.8619, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 1734, 0, -1251.96, -2055.88, 77.5748, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 1735, 0, -1841.37, -2928.97, 72.3839, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 1735, 0, -1935.9, -2793.63, 82.0799, 2.00713, 0, 0, 0.843391, 0.5373, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 1735, 0, -1982.09, -2808.73, 86.8473, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 1735, 0, -2005.38, -2816.19, 77.8807, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 1735, 0, -1228.73, -1993.95, 36.6098, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 1735, 0, -1259.59, -2936.51, 39.8619, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10),
(@OGUID+20, 1735, 0, -1251.96, -2055.88, 77.5748, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+13, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+14, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+15, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+16, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+17, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+18, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+19, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+20, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Iron Deposit in Hillsbrad
SET @OGUID = 43325;
SET @PTEMPLATE = 21698;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1734, 0, -152.853, -402.945, 90.7132, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 1735, 0, -152.853, -402.945, 90.7132, 2.04204, 0, 0, 0.85264, 0.522499, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0);

-- Mithril Deposits
SET @OGUID = 220400;

UPDATE `gameobject` SET `position_x`=1102.3, `position_y`=-1479.79, `position_z`=81.7374, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid` IN (21881, 21908, 21854);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 2040, 0, -13734.4, 588.942, 28.3662, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 2040, 0, -14641.5, -301.463, 27.0929, 3.83973, 0, 0, -0.939692, 0.34202, 300, 300, 1, 100, 0, 10),
(@OGUID+2, 2040, 0, -14800.5, -344.491, 13.0164, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 1, 100, 0, 10),
(@OGUID+3, 2040, 1, 29.4768, 852.77, 130.517, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 1, 100, 0, 10),
(@OGUID+4, 2040, 1, -1844.3, 2087.51, 77.5889, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10),
(@OGUID+5, 2040, 1, -2073.42, 2055.29, 76.7987, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10),
(@OGUID+6, 2040, 0, 889.775, -560.039, 143.449, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10),
(@OGUID+7, 2040, 0, 649.918, -631.854, 157.594, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+8, 2040, 0, 812.972, -693.54, 173.467, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100, 0, 10),
(@OGUID+9, 2040, 0, 690.51, -623.184, 166.421, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 1, 100, 0, 10),
(@OGUID+10, 2040, 0, 722.529, -660.758, 161.868, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10),
(@OGUID+11, 2040, 0, 591.945, -724.726, 151.695, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10),
(@OGUID+12, 2040, 0, 860.572, -569.382, 144.673, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 1, 100, 0, 10),
(@OGUID+13, 2040, 1, -1769.87, 2977.38, 39.2272, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10),
(@OGUID+14, 2040, 1, -4566.88, -2734.63, 45.9512, -1.55334, 0, 0, 0.700909, -0.71325, 300, 300, 1, 100, 0, 10),
(@OGUID+15, 2040, 1, -4346.2, -3005.47, 35.1079, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10),
(@OGUID+16, 2040, 1, 4373.93, -6309.83, 96.4017, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10),
(@OGUID+17, 2040, 1, 4588.05, -6850.55, 140.756, -2.40855, 0, 0, 0.93358, -0.358368, 300, 300, 1, 100, 0, 10),
(@OGUID+18, 2040, 1, 5025.34, -6505.18, -8.06637, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 1, 100, 0, 10),
(@OGUID+19, 2040, 1, -2766.39, -2606.88, 34.2974, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1177, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+1, 1177, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+2, 1177, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+3, 1146, 'Mithril Deposit - Desolace', 10),
(@OGUID+4, 1146, 'Mithril Deposit - Desolace', 10),
(@OGUID+5, 1146, 'Mithril Deposit - Desolace', 10),
(@OGUID+6, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+7, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+8, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+9, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+10, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+11, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+12, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+13, 1146, 'Mithril Deposit - Desolace', 10),
(@OGUID+14, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+15, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+16, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+17, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+18, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+19, 43524, 'Mithril Deposit - Dustwallow Marsh', 10);

-- Truesilver Deposits
SET @OGUID = 220420;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 2047, 1, -1395.65, 2749.97, 119.239, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 2047, 1, -1440.75, 2949.23, 124.248, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1147, 'Truesilver Deposit - Desolace', 10),
(@OGUID+1, 1147, 'Truesilver Deposit - Desolace', 10);

-- Iron Deposits
SET @OGUID = 220422;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1735, 0, -254.604, 379.709, 121.872, -0.05236, 0, 0, 0.026177, -0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1735, 0, -161.117, 398.667, 105.474, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1735, 0, -130.354, -149.858, 120.737, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, 12.0793, -148.168, 130.97, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1735, 0, 75.6466, -78.375, 114.581, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 0, 225.675, -72.2974, 110.061, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, 244.997, -10.5061, 83.3397, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 0, 502.952, -1391.69, 72.4759, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 0, -31.1745, -221.648, 138.074, -0.628319, 0, 0, 0.309017, -0.951056, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 0, 545.352, -1686.1, 57.1031, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+1, 1068, 'Iron Deposits - Alterac Mountainse', 10),
(@OGUID+2, 1068, 'Iron Deposits - Alterac Mountainse', 10),
(@OGUID+3, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+4, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+5, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+6, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+7, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+8, 1068, 'Iron Deposits - Alterac Mountains', 10),
(@OGUID+9, 1068, 'Iron Deposits - Alterac Mountains', 10);

-- Mithril Deposit / Truesilver Deposit in Arathi
SET @OGUID = 220433;
SET @PTEMPLATE = 17000;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 2040, 0, -1941.89, -1648.68, 48.6327, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 2047, 0, -1941.89, -1648.68, 48.6327, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+1, @PTEMPLATE, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1358, 0, 'Arathi Highlands - Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit in Blasted Lands
SET @OGUID = 220435;
SET @PTEMPLATE = 17002;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1734, 0, -11470.4, -3198.2, 24.3378, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10),
(@OGUID+1, 2040, 0, -11470.4, -3198.2, 24.3378, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 1, 100, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Gold Vein / Mithril Deposit - Blasted Lands', 10),
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1279, 0, 'Blasted Lands - Gold Vein / Mithril Deposit', 0);

-- Tin Vein / Silver Vein in Wetlands
SET @OGUID = 220437;
SET @PTEMPLATE = 17003;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, -3993.14, -2598.76, 59.9468, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1733, 0, -3993.14, -2598.76, 59.9468, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Arathi
SET @OGUID = 220439;
SET @PTEMPLATE = 17004;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1733, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1734, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1735, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2040, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, -2339.53, -1646.11, -24.6021, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit in Burning Steppes
SET @OGUID = 220444;
SET @PTEMPLATE = 17005;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 324, 0, -8228.16, -2947.63, 159.85, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 324, 0, -7814.68, -2648.13, 223.628, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, -8228.16, -2947.63, 159.85, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -7814.68, -2648.13, 223.628, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 165658, 0, -8228.16, -2947.63, 159.85, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 165658, 0, -7814.68, -2648.13, 223.628, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@PTEMPLATE+1, 1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE+1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@OGUID+1, @PTEMPLATE+2, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@OGUID+2, @PTEMPLATE+1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@OGUID+3, @PTEMPLATE+2, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@OGUID+4, @PTEMPLATE+1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10),
(@OGUID+5, @PTEMPLATE+2, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1296, 0, 'Burning Steppes - Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit', 0),
(@PTEMPLATE+1, 1296, 0, 'Burning Steppes - Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit', 0);

-- Truesilver Deposit / Small Thorium Vein in EPL
SET @OGUID = 220450;
SET @PTEMPLATE = 17007;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 324, 0, 1995.39, -5110.2, 98.9908, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 2040, 0, 1995.39, -5110.2, 98.9908, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+1, @PTEMPLATE, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1264, 0, 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein', 0);

-- Gold Vein / Iron Deposit in Hillsbrad
SET @OGUID = 220452;
SET @PTEMPLATE = 17008;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1734, 0, -90.0451, -1361.99, 123.778, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1735, 0, -90.0451, -1361.99, 123.778, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0);

-- Copper Veins
SET @OGUID = 112600;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1731, 0, -11485, 1908.38, -11.5041, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1731, 0, -11326.8, 1575.95, 35.7038, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1731, 0, -11308.4, 1854.01, 17.9742, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1731, 0, -11264.5, 1643.5, 34.9335, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1731, 0, -11243, 1217.15, 92.6842, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1731, 0, -11172, 1969.6, 21.3377, 2.3911, 0, 0, 0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1731, 0, -11146.4, 1511.06, 24.2333, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1731, 0, -10809.5, 2013.99, 20.7217, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1731, 0, -10562.8, 2011.39, -6.07262, 3.12412, 0, 0, 0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1731, 0, -10544, 1994.56, -8.69469, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1731, 0, -10524.5, 1949.69, 5.92688, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1731, 0, -10515.4, 1963.25, 7.24226, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1731, 0, -10401.1, 1803.21, 28.0696, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1731, 0, -9949.87, 1447.89, 42.4058, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1731, 0, -9763.95, 1813.47, -6.19053, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1731, 0, -9834.56, -3128.48, 82.4222, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1731, 0, -9740.51, -2102.63, 61.384, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1731, 0, -9724.31, -2653.92, 68.1898, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+19, 1731, 0, -9256.75, -3097.38, 100.289, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1731, 0, -9185.33, -2912.15, 112.081, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1731, 0, -8779.88, -2262.33, 148.743, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1731, 0, -8776.36, -2120.69, 153.261, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1731, 0, -8694.48, -2204.4, 157.692, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1731, 0, -8662.57, -2246.8, 156.706, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1731, 0, -9875.08, -251.75, 38.4121, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+26, 1731, 0, -9781.55, 92.5236, 6.73226, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1731, 0, -9770.37, 150.617, 25.7016, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+28, 1731, 0, -9758.25, -460.59, 43.6968, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1731, 0, -9320.33, 560.396, 83.3102, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1731, 0, -9110.23, -588.506, 57.1738, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1731, 0, -9070.51, -550.896, 59.402, 4.62512, 0, 0, -0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1731, 0, -5980.43, -2017.1, 432.131, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1731, 0, -5963, -307.491, 455.642, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1731, 0, -5881.39, -1432.3, 415.593, 5.32326, 0, 0, -0.461748, 0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1731, 0, -5821.6, -1922.89, 413.296, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1731, 0, -5810.35, 394.826, 435.296, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1731, 0, -5807.19, -1498.15, 363.662, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1731, 0, -5789.91, -781.136, 401.291, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1731, 0, -5770.21, -2184.04, 410.181, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1731, 0, -5757, -1705.79, 369.181, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1731, 0, -5697.27, -1723.45, 361.68, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1731, 0, -5661.16, 362.743, 393.995, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1731, 0, -5654.57, -1675.68, 360.795, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1731, 0, -5649.31, -52.1474, 418.394, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1731, 0, -5641.67, -1815.62, 357.022, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1731, 0, -5605.74, -1713.77, 360.251, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1731, 0, -5600.61, -1761.3, 370.283, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1731, 0, -5596.4, 608.955, 392.607, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1731, 0, -5569.23, 662.99, 396.228, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1731, 0, -5486.29, 467.214, 392.111, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1731, 0, -5476.83, 105.969, 407.061, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1731, 0, -5413.44, -217.931, 374.285, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1731, 0, -5405.12, 446.462, 393.463, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1731, 0, -5288.14, -60.5661, 401.245, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1731, 0, -5286.26, -840.516, 406.846, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1731, 0, -5220.57, -2126.2, 447.289, 4.79966, 0, 0, -0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1731, 0, -5213.95, 339.462, 405.109, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1731, 0, -5082.65, -153.88, 442.593, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1731, 0, -5018.81, 466.14, 419.118, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1731, 0, -4988.01, 285.855, 417.786, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1731, 0, -4831.69, -371.356, 404.549, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1731, 0, -6120.49, -3021.54, 396.495, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+63, 1731, 0, -6119.89, -2964.38, 398.496, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+64, 1731, 0, -6046.64, -2981.06, 402.833, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+65, 1731, 0, -6022.11, -2966.86, 404.811, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+66, 1731, 0, -5964.72, -2932.67, 382.428, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+67, 1731, 0, -5909.5, -2847.64, 379.652, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+68, 1731, 0, -5880.03, -3092.93, 332.414, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+69, 1731, 0, -5673.48, -4166.66, 403.834, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+70, 1731, 0, -5605.75, -4105.8, 388.812, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+71, 1731, 0, -5127.31, -3926.78, 325.466, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+72, 1731, 0, -4950.32, -2971.38, 322.214, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+73, 1731, 0, -4938.17, -2631.88, 331.642, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+74, 1731, 0, -4926.39, -2996.57, 321.114, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+75, 1731, 0, -4855.06, -2882.53, 336.653, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+76, 1731, 0, -308.792, 977.584, 133.276, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+77, 1731, 0, 29.3031, 1397.52, 81.6737, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+78, 1731, 0, 1185.11, 1844.1, 27.4475, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+79, 1731, 0, 1315.74, 1995.45, 16.4672, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+80, 1731, 0, 1374.36, 1952.43, 14.2391, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+81, 1731, 0, 1444.68, 1124.77, 65.5705, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+82, 1731, 0, 1450.78, 1995.89, 11.8788, 3.49067, 0, 0, -0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+83, 1731, 0, 1588.55, -378.296, 62.58, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+84, 1731, 0, 1734.12, 1113.7, 80.2802, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+85, 1731, 0, 2155.69, -810.184, 87.418, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+86, 1731, 0, 2378.69, -428.059, 73.0505, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+87, 1731, 0, 2467.54, 1642.65, 20.5912, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+88, 1731, 0, 2510.28, -62.2036, 26.7767, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+89, 1731, 0, 2520.7, 833.101, 102.437, 0.436332, 0, 0, 0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+90, 1731, 0, 2529.08, 541.433, 16.1038, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+91, 1731, 0, 2588.84, -907.501, 61.8384, 4.92183, 0, 0, -0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+92, 1731, 0, 2628.19, 667.826, 28.7643, 3.87463, 0, 0, -0.93358, 0.358368, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+93, 1731, 0, 2673.13, 1071.51, 116.882, 1.8675, 0, 0, 0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+94, 1731, 0, 2692.15, 509.926, 20.9888, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+95, 1731, 0, 2968.59, 1132.8, 84.2412, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+96, 1731, 0, 2968.69, -519.012, 109.958, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+97, 1731, 0, 2982.13, -569.891, 121.658, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+98, 1731, 1, 7686.48, -446.749, -21.1478, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+99, 1731, 1, 7649.98, -1102.91, 63.6381, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+100, 1731, 1, 7133.58, -733.704, 65.4046, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+101, 1731, 1, 7015.85, -507.879, 40.9607, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+102, 1731, 1, 6840.3, -674.375, 64.1044, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+103, 1731, 1, 6127.96, 57.2855, 28.7722, 0.802851, 0, 0, 0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+104, 1731, 1, 4602.47, 26.3402, 74.3763, 5.46288, 0, 0, -0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+105, 1731, 1, 4524.07, 48.9337, 81.6434, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+106, 1731, 1, 3414.26, -24.0284, 21.7966, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+107, 1731, 1, 3406.06, 891.166, 26.0137, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+108, 1731, 1, 2480.6, -324.883, 115.091, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+109, 1731, 1, 2330.51, 1107.6, 305.062, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+110, 1731, 1, 1803.22, 708.189, 157.308, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+111, 1731, 1, 1400.16, 244.774, 17.0226, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+112, 1731, 1, 1242, 366.093, 60.4805, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+113, 1731, 1, 972.06, -4718.87, 29.4653, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+114, 1731, 1, 931.159, -4703.13, 23.2867, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+115, 1731, 1, 908.307, -4224.11, 26.1928, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+116, 1731, 1, 869.838, -4706.02, 31.0907, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+117, 1731, 1, 855.443, -4789.1, 36.5689, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+118, 1731, 1, 842.223, -4749.95, 12.749, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+119, 1731, 1, 825.367, -4773.86, 36.2124, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+120, 1731, 1, 544.077, -4581.3, 49.0066, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+121, 1731, 1, 413.759, -4445.5, 53.9382, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+122, 1731, 1, 306.357, -5001.68, 22.337, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+123, 1731, 1, -548.849, -4909.94, 45.4167, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+124, 1731, 1, -493.118, -661.287, 53.0064, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+125, 1731, 1, -515.116, 78.7818, 60.9084, 1.44862, 0, 0, 0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+126, 1731, 1, -576.829, 126.768, 58.9101, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+127, 1731, 1, -759.502, -750.369, 19.4819, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+128, 1731, 1, -1271.72, -1073.83, 57.5627, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+129, 1731, 1, -1286.13, -866.034, -5.33929, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+130, 1731, 1, -2373.84, 431.821, 67.2257, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+131, 1731, 1, -2564.31, 281.961, 109.876, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+132, 1731, 1, -530.082, -3206.66, 177.408, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+133, 1731, 1, -1263.85, -1621.39, 185.774, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+134, 1731, 1, -1510.91, -3421.34, 221.707, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+135, 1731, 1, -1618.35, -3331.58, 188.647, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+136, 1731, 1, -4220.12, -895.213, -51.1738, 0.157079, 0, 0, 0.0784588, 0.996917, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+137, 1731, 0, -11116.7, -1016.64, 80.8207, 5.91667, 0, 0, -0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+138, 1731, 0, -3103.4, -1676.96, 3.06479, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+2, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+3, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+4, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+5, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+6, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+7, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+8, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+9, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+10, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+11, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+12, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+13, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+14, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+15, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+16, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+17, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+18, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+19, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+20, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+21, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+22, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+23, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+24, 1128, 'Copper Vein - Redridge Mountains', 10),
(@OGUID+25, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+26, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+27, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+28, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+29, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+30, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+31, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+32, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+33, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+34, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+35, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+36, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+37, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+38, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+39, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+40, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+41, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+42, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+43, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+44, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+45, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+46, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+47, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+48, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+49, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+50, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+51, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+52, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+53, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+54, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+55, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+56, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+57, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+58, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+59, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+60, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+61, 1019, 'Copper Vein - Dun Morogh', 10),
(@OGUID+62, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+63, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+64, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+65, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+66, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+67, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+68, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+69, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+70, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+71, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+72, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+73, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+74, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+75, 1166, 'Copper Vein - Loch Modan', 10),
(@OGUID+77, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+78, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+79, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+80, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+81, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+82, 1044, 'Copper Vein - Silverpine Forest', 10),
(@OGUID+83, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+84, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+85, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+86, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+87, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+88, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+89, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+90, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+91, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+92, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+93, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+94, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+95, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+96, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+97, 1008, 'Copper Vein - Tirisfal Glades', 10),
(@OGUID+98, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+99, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+100, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+101, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+102, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+103, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+104, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+105, 1098, 'Copper Vein - Darkshore', 10),
(@OGUID+106, 1075, 'Copper Vein - Ashenvale', 10),
(@OGUID+107, 1075, 'Copper Vein - Ashenvale', 10),
(@OGUID+108, 1075, 'Copper Vein - Ashenvale', 10),
(@OGUID+109, 1089, 'Copper Vein - Stonetalon Mountains', 10),
(@OGUID+110, 1089, 'Copper Vein - Stonetalon Mountains', 10),
(@OGUID+111, 1089, 'Copper Vein - Stonetalon Mountains', 10),
(@OGUID+112, 1089, 'Copper Vein - Stonetalon Mountains', 10),
(@OGUID+113, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+114, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+115, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+116, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+117, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+118, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+119, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+120, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+121, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+122, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+123, 1024, 'Copper Vein - Durotar', 10),
(@OGUID+124, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+125, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+126, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+127, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+128, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+129, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+130, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+131, 1028, 'Copper Vein - Mulgore', 10),
(@OGUID+132, 4303, 'Copper Vein - Barrens', 10),
(@OGUID+133, 4303, 'Copper Vein - Barrens', 10),
(@OGUID+134, 4303, 'Copper Vein - Barrens', 10),
(@OGUID+135, 4303, 'Copper Vein - Barrens', 10),
(@OGUID+136, 2585, 'Copper Vein - Thousand Needles', 10),
(@OGUID+137, 1119, 'Copper Vein - Duskwood', 10),
(@OGUID+138, 1156, 'Copper Vein - Wetlands', 10);

-- Lesser Bloodstone Deposit in Arathi
SET @OGUID = 112800;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 2653, 0, -906.06024169921875, -3912.308593750000, 139.7058868408203125, 2.094393253326416015, 0, 0, 0.866024971008300781, 0.500000774860382080, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 2653, 0, -887.10382080078125, -4012.095947265625, 145.7963104248046875, 3.159062385559082031, 0, 0, -0.99996185302734375, 0.008734640665352344, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2653, 0, -871.71118164062500, -3959.098144531250, 133.4881134033203125, 5.567600727081298828, 0, 0, -0.35020732879638671, 0.936672210693359375, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 298, 'Lesser Bloodstone Deposit - Arathi Highlands', 10),
(@OGUID+1, 298, 'Lesser Bloodstone Deposit - Arathi Highlands', 10),
(@OGUID+2, 298, 'Lesser Bloodstone Deposit - Arathi Highlands', 10);

-- Incendicite Mineral Vein (1667) in Wetlands
SET @OGUID = 112803;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1667, 0, -3877.418457031250, -2484.441894531250, 41.59187698364257812, 4.450590610504150390, 0, 0, -0.79335308074951171, 0.608761727809906005, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1667, 0, -3758.245605468750, -2456.140625000000, 28.31234550476074218, 4.171337604522705078, 0, 0, -0.87035560607910156, 0.492423713207244873, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, 3655, 'Incendicite Mineral Vein (1667) - Wetlands', 10),
(@OGUID+1, 3655, 'Incendicite Mineral Vein (1667) - Wetlands', 10);

-- Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) in Wetlands
SET @OGUID = 118805;
SET @PTEMPLATE = 17009;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, -3870.253173828125, -2383.634033203125, 26.57918357849121093, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1732, 0, -3929.862548828125, -2318.629882812500, 23.00192070007324218, 5.934120178222656250, 0, 0, -0.17364788055419921, 0.984807789325714111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -3799.523925781250, -2390.446533203125, 28.52526473999023437, 2.670347690582275390, 0, 0, 0.972369194030761718, 0.233448356389999389, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -3785.216064453125, -2375.884033203125, 30.60120010375976562, 3.316144466400146484, 0, 0, -0.99619388580322265, 0.087165042757987976, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -3833.576904296875, -2299.875976562500, 30.47358512878417968, 4.468043327331542968, 0, 0, -0.78801059722900390, 0.615661680698394775, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -3870.253173828125, -2383.634033203125, 26.57918357849121093, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -3929.862548828125, -2318.629882812500, 23.00192070007324218, 5.934120178222656250, 0, 0, -0.17364788055419921, 0.984807789325714111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -3799.523925781250, -2390.446533203125, 28.52526473999023437, 2.670347690582275390, 0, 0, 0.972369194030761718, 0.233448356389999389, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -3785.216064453125, -2375.884033203125, 30.60120010375976562, 3.316144466400146484, 0, 0, -0.99619388580322265, 0.087165042757987976, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -3833.576904296875, -2299.875976562500, 30.47358512878417968, 4.468043327331542968, 0, 0, -0.78801059722900390, 0.615661680698394775, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1610, 0, -3870.253173828125, -2383.634033203125, 26.57918357849121093, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1610, 0, -3929.862548828125, -2318.629882812500, 23.00192070007324218, 5.934120178222656250, 0, 0, -0.17364788055419921, 0.984807789325714111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1610, 0, -3799.523925781250, -2390.446533203125, 28.52526473999023437, 2.670347690582275390, 0, 0, 0.972369194030761718, 0.233448356389999389, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1610, 0, -3785.216064453125, -2375.884033203125, 30.60120010375976562, 3.316144466400146484, 0, 0, -0.99619388580322265, 0.087165042757987976, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1610, 0, -3833.576904296875, -2299.875976562500, 30.47358512878417968, 4.468043327331542968, 0, 0, -0.78801059722900390, 0.615661680698394775, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+5, @PTEMPLATE, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+6, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+7, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+8, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+9, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+10, @PTEMPLATE, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+11, @PTEMPLATE+1, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+12, @PTEMPLATE+2, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+13, @PTEMPLATE+3, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10),
(@OGUID+14, @PTEMPLATE+4, 'Tin Vein / Silver Vein / Incendicite Mineral Vein (1610) - Wetlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+1, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+2, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+3, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0),
(@PTEMPLATE+4, 3660, 0, 'Wetlands - Tin Vein / Silver Vein / Incendicite Mineral Vein', 0);

-- Gold Vein / Iron Deposit in Wetlands
SET @OGUID = 112820;
SET @PTEMPLATE = 17014;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1734, 0, -3420.223876953125, -2121.0883789062500, 94.66082763671875000, 3.508116960525512695, 0, 0, -0.98325443267822265, 0.182238012552261352, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1734, 0, -3000.093750000000, -3074.998779296875, 75.74973297119140625, 1.082102894783020019, 0, 0, 0.515037536621093750, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -2808.982177734375, -2934.108398437500, 52.18629837036132812, 4.171337604522705078, 0, 0, -0.87035560607910156, 0.492423713207244873, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -2883.332031250000, -3046.207519531250, 63.11866760253906250, 5.934120178222656250, 0, 0, -0.17364788055419921, 0.984807789325714111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -3085.135009765625, -3260.258789062500, 66.21117401123046875, 3.822272777557373046, 0, 0, -0.94264125823974609, 0.333807557821273803, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -2967.274169921875, -3240.072753906250, 54.20602035522460937, 5.323255538940429687, 0, 0, -0.46174812316894531, 0.887011110782623291, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, -2925.585205078125, -3305.690429687500, 54.27831268310546875, 3.438302755355834960, 0, 0, -0.98901557922363281, 0.147811368107795715, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, -3003.794677734375, -3222.195556640625, 54.21199035644531250, 1.326448202133178710, 0, 0, 0.615660667419433593, 0.788011372089385986, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -2906.903076171875, -3236.438964843750, 57.58070373535156250, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, -2940.861328125000, -3273.188720703125, 61.91619873046875000, 1.483528137207031250, 0, 0, 0.675589561462402343, 0.737277925014495849, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, -2935.616943359375, -3243.305908203125, 54.47927474975585937, 2.129300594329833984, 0, 0, 0.874619483947753906, 0.484810054302215576, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 0, -3420.223876953125, -2121.0883789062500, 94.66082763671875000, 3.508116960525512695, 0, 0, -0.98325443267822265, 0.182238012552261352, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 0, -3000.093750000000, -3074.998779296875, 75.74973297119140625, 1.082102894783020019, 0, 0, 0.515037536621093750, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 0, -2808.982177734375, -2934.108398437500, 52.18629837036132812, 4.171337604522705078, 0, 0, -0.87035560607910156, 0.492423713207244873, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 0, -2883.332031250000, -3046.207519531250, 63.11866760253906250, 5.934120178222656250, 0, 0, -0.17364788055419921, 0.984807789325714111, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 0, -3085.135009765625, -3260.258789062500, 66.21117401123046875, 3.822272777557373046, 0, 0, -0.94264125823974609, 0.333807557821273803, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 0, -2967.274169921875, -3240.072753906250, 54.20602035522460937, 5.323255538940429687, 0, 0, -0.46174812316894531, 0.887011110782623291, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 0, -2925.585205078125, -3305.690429687500, 54.27831268310546875, 3.438302755355834960, 0, 0, -0.98901557922363281, 0.147811368107795715, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 0, -3003.794677734375, -3222.195556640625, 54.21199035644531250, 1.326448202133178710, 0, 0, 0.615660667419433593, 0.788011372089385986, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 0, -2906.903076171875, -3236.438964843750, 57.58070373535156250, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 0, -2940.861328125000, -3273.188720703125, 61.91619873046875000, 1.483528137207031250, 0, 0, 0.675589561462402343, 0.737277925014495849, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 0, -2935.616943359375, -3243.305908203125, 54.47927474975585937, 2.129300594329833984, 0, 0, 0.874619483947753906, 0.484810054302215576, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Iron Deposit - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+11, @PTEMPLATE, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+12, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+13, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+14, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+15, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+16, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+17, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+18, @PTEMPLATE+7, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+19, @PTEMPLATE+8, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+20, @PTEMPLATE+9, 'Gold Vein / Iron Deposit - Wetlands', 10),
(@OGUID+21, @PTEMPLATE+10, 'Gold Vein / Iron Deposit - Wetlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+1, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 1355, 0, 'Wetlands - Gold Vein / Iron Deposit', 0);

-- Tin Vein / Silver Vein
SET @OGUID = 112842;
SET @PTEMPLATE = 17025;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 1732, 0, -3029.731933593750, -3194.978027343750, 59.59239959716796875, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+1, 1733, 0, -3029.731933593750, -3194.978027343750, 59.59239959716796875, 5.061456203460693359, 0, 0, -0.57357597351074218, 0.819152355194091796, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID, @PTEMPLATE, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Tin Veins
SET @OGUID = 251500;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -11729.8, -681.524, 36.0557, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -11713, -645.439, 49.3283, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -11437.8, 25.9817, 35.6237, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, -2063.69, 1770.31, 70.3513, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, -508.031, 859.585, 94.608, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, -649.171, 2845.33, -11.483, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 1, -499.658, 1782.47, 112.706, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 1, -453.404, 2403.45, 95.6945, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1732, 1, -440.694, 2249.32, 94.6829, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1732, 1, -211.131, 2427.72, 4.66274, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1732, 1, -31.4126, 1103.66, 107.949, 2.96704, 0, 0, 0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1732, 1, 126.755, 1559.23, 158.139, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1732, 0, -9077.6, -3180.13, 115.942, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1732, 0, -8818.36, -2204.01, 137.801, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1732, 0, -8808.98, -2176.18, 143.724, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1732, 0, -8805.3, -2146, 154.329, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1732, 0, -8758.65, -2191.66, 139.589, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1732, 0, -8750, -2144, 156.404, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1732, 0, -378.764, 769.298, 95.0073, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1732, 0, -350.898, 954.154, 129.027, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1732, 0, -345.379, 1029.21, 120.191, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1732, 0, -334.676, 770.501, 107.438, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1732, 0, -324.499, 927.473, 131.106, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1732, 0, -317.895, 855.736, 90.625, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1732, 0, -309.482, 971.346, 133.761, 3.927, 0, 0, -0.923879, 0.382686, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1732, 0, -305.998, 1099.13, 75.9756, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1732, 0, -293.892, 1008, 113.602, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1732, 0, -30.8879, 1023, 74.69, 6.24828, 0, 0, -0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1732, 0, 380.065, 1130.56, 108.131, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1732, 0, 394.553, 1004.06, 108.397, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1732, 0, 756.192, 1784.68, 30.1367, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1732, 0, 1075.68, 860.883, 18.6506, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1732, 1, -4117.82, -3831.94, 56.7862, 3.08918, 0, 0, 0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1732, 1, -3608.11, -3567.09, 44.7214, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1732, 1, -2737.97, -2789.71, 50.6377, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1732, 1, 1697.17, -3224.84, 132.26, 3.15906, 0, 0, -0.999962, 0.00873464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1732, 1, 1858.93, -1305.12, 92.4798, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1732, 1, 2003.38, -3402.16, 111.222, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1732, 1, 2023.88, -3217.42, 79.4702, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1732, 1, 2432.82, -2368.57, 145.165, 5.16618, 0, 0, -0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1732, 1, 2618.98, -1431.62, 180.995, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1732, 1, 2645.09, -1162.48, 159.764, 6.10865, 0, 0, -0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1732, 1, 2715.31, -3558.39, 110.357, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1732, 1, 2970.38, -895.964, 204.453, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1732, 1, 3098.87, -687.36, 192.509, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1732, 1, 3140.14, 693.865, 12.33, 3.61284, 0, 0, -0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1732, 1, 3633.34, 1033.18, 5.18991, 4.13643, 0, 0, -0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1732, 1, 3914.48, -42.4635, 12.0686, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1732, 1, 4108.62, 1381.43, -0.659214, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1732, 1, 4180.02, 1106.51, 28.5489, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 405, 'Tin Vein - Stranglethorn', 10),
(@OGUID+2, 405, 'Tin Vein - Stranglethorn', 10),
(@OGUID+3, 405, 'Tin Vein - Stranglethorn', 10),
(@OGUID+4, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+5, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+6, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+7, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+8, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+9, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+10, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+11, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+12, 1140, 'Tin Vein - Desolace', 10),
(@OGUID+13, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+14, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+15, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+16, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+17, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+18, 1129, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+19, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+20, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+21, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+22, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+23, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+24, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+25, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+26, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+27, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+28, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+29, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+30, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+31, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+32, 1045, 'Tin Vein - Silverpine Forest', 10),
(@OGUID+33, 43521, 'Tin Vein - Dustwallow Marsh', 10),
(@OGUID+34, 43521, 'Tin Vein - Dustwallow Marsh', 10),
(@OGUID+35, 43521, 'Tin Vein - Dustwallow Marsh', 10),
(@OGUID+36, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+37, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+38, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+39, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+40, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+41, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+42, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+43, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+44, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+45, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+46, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+47, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+48, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+49, 1074, 'Tin Vein - Ashenvale', 10),
(@OGUID+50, 1074, 'Tin Vein - Ashenvale', 10);

-- Tin Vein / Silver Veins in Duskwood
SET @OGUID = 251600;
SET @PTEMPLATE = 7000;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -11166.5, 154.265, 35.092, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -11107.3, -1089.97, 63.3644, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -11092.8, -1157.22, 55.1905, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -11091.6, -257.724, 32.2351, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -10991.6, -1399.99, 71.7657, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -10449.9, -1020.57, 53.7499, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -11166.5, 154.265, 35.092, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -11107.3, -1089.97, 63.3644, 3.99681, 0, 0, -0.909961, 0.414694, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -11092.8, -1157.22, 55.1905, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -11091.6, -257.724, 32.2351, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -10991.6, -1399.99, 71.7657, 4.99164, 0, 0, -0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -10449.9, -1020.57, 53.7499, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+7, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+8, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+9, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+10, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+11, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+12, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Westfall
SET @OGUID = 251613;
SET @PTEMPLATE = 7007;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -11324.3, 1661.3, 67.0822, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -11159.2, 981.381, 52.027, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -10488.2, 1941.07, 10.6379, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -10484.2, 1968.27, 12.5137, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -10376, 1898.9, 13.8374, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -9927.15, 1456.44, 41.3144, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -9859.78, 1395.48, 40.2416, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -11324.3, 1661.3, 67.0822, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -11159.2, 981.381, 52.027, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -10488.2, 1941.07, 10.6379, 0.715585, 0, 0, 0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -10484.2, 1968.27, 12.5137, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -10376, 1898.9, 13.8374, 4.7822, 0, 0, -0.681998, 0.731354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -9927.15, 1456.44, 41.3144, 3.50812, 0, 0, -0.983254, 0.182238, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -9859.78, 1395.48, 40.2416, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Westfall', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+8, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+9, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+10, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+11, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+12, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+13, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+14, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Redridge
SET @OGUID = 251628;
SET @PTEMPLATE = 7015;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -8767.71, -2379.35, 159.891, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -9011.86, -2370.78, 140.35, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -9057.66, -1975.82, 157.037, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -8767.71, -2379.35, 159.891, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -9011.86, -2370.78, 140.35, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -9057.66, -1975.82, 157.037, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+4, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+5, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+6, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Loch Modan
SET @OGUID = 251635;
SET @PTEMPLATE = 7019;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -6225.2, -2998.35, 386.989, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -6173.96, -2945.99, 407.144, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -6088.7, -2908.38, 419.217, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -6062.61, -2740.13, 422.309, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -5843.45, -4005.39, 375.697, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -5691.15, -4099.24, 397.565, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -4828.55, -4099.71, 306.208, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 0, -4746.73, -4183.38, 307.557, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1732, 0, -4740.04, -3639.89, 310.857, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -6225.2, -2998.35, 386.989, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -6173.96, -2945.99, 407.144, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -6088.7, -2908.38, 419.217, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -6062.61, -2740.13, 422.309, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -5843.45, -4005.39, 375.697, 3.14159, 0, 0, -1, 0, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -5691.15, -4099.24, 397.565, 4.97419, 0, 0, -0.608761, 0.793354, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -4828.55, -4099.71, 306.208, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 0, -4746.73, -4183.38, 307.557, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 0, -4740.04, -3639.89, 310.857, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@PTEMPLATE+9, 1, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+9, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+10, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+11, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+12, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+13, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+14, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+15, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+16, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+17, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+18, @PTEMPLATE+9, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+9, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Wetlands
SET @OGUID = 251654;
SET @PTEMPLATE = 7029;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -3804.76, -2277.9, 33.1575, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -3488.49, -1900.41, 24.2657, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -3187.19, -3199.9, 56.6329, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -3804.76, -2277.9, 33.1575, 1.0821, 0, 0, 0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -3488.49, -1900.41, 24.2657, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -3187.19, -3199.9, 56.6329, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+4, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+5, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Wetlands', 10),
(@OGUID+6, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Wetlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

--  Tin Vein / Silver Veins in Arathi
SET @OGUID = 251661;
SET @PTEMPLATE = 7033;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -1735.06, -3433.71, 55.8404, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -1436.69, -1717.95, 56.1873, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -1391.16, -2574.25, 84.4007, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -1114.41, -2361.25, 51.8908, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -1735.06, -3433.71, 55.8404, 1.71042, 0, 0, 0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -1436.69, -1717.95, 56.1873, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -1391.16, -2574.25, 84.4007, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -1114.41, -2361.25, 51.8908, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1,  @PTEMPLATE+1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+2,  @PTEMPLATE+2, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+3,  @PTEMPLATE+3, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+4,  @PTEMPLATE+4, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+5,  @PTEMPLATE+1, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+6,  @PTEMPLATE+2, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+7,  @PTEMPLATE+3, 'Tin Vein / Silver Vein - Arathi Highlands', 10),
(@OGUID+8,  @PTEMPLATE+4, 'Tin Vein / Silver Vein - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 406, 0, 'Arathi Highlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 406, 0, 'Arathi Highlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 406, 0, 'Arathi Highlands - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 406, 0, 'Arathi Highlands - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Hillsbrad
SET @OGUID = 251670;
SET @PTEMPLATE = 7038;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -1093.54, -1064.15, 49.2755, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 0, -927.094, -374.569, 30.9798, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 0, -923.453, -1098.07, 51.5852, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 0, -922.306, -1453.78, 59.1559, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 0, -908.72, -761.622, 22.966, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 0, -338.068, -322.731, 66.6804, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 0, -175.762, 21.1603, 82.2342, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 0, -150.023, -996.154, 60.5231, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -1093.54, -1064.15, 49.2755, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -927.094, -374.569, 30.9798, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -923.453, -1098.07, 51.5852, 4.46804, 0, 0, -0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -922.306, -1453.78, 59.1559, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -908.72, -761.622, 22.966, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -338.068, -322.731, 66.6804, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -175.762, 21.1603, 82.2342, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -150.023, -996.154, 60.5231, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+9, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+10, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+11, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+12, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+13, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+14, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+15, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10),
(@OGUID+16, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 1273, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Thousand Needles
SET @OGUID = 251687;
SET @PTEMPLATE = 7047;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, -6333.72, -4334.13, -57.0247, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, -5687.59, -2302.37, -43.6993, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, -5447.94, -1810.31, -36.5369, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, -5172.77, -2214.85, -28.0028, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, -5121.02, -2374.72, -51.7483, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, -5092.3, -1212.15, -48.1643, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 1, -4858.21, -2070.35, -25.6796, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, -6333.72, -4334.13, -57.0247, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, -5687.59, -2302.37, -43.6993, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, -5447.94, -1810.31, -36.5369, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, -5172.77, -2214.85, -28.0028, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, -5121.02, -2374.72, -51.7483, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 1, -5092.3, -1212.15, -48.1643, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 1, -4858.21, -2070.35, -25.6796, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+8, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+9, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+10, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+11, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+12, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+13, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Thousand Needles', 10),
(@OGUID+14, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Barrens
SET @OGUID = 251711;
SET @PTEMPLATE = 7055;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, -4239.39, -2364.1, 101.539, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, -3945.92, -2316.32, 99.2972, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, -3641.16, -1643.57, 92.7791, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, -1857.84, -2606.39, 95.3395, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, 687.582, -1709.01, 95.4418, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, -4239.39, -2364.1, 101.539, 4.45059, 0, 0, -0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, -3945.92, -2316.32, 99.2972, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, -3641.16, -1643.57, 92.7791, 3.4383, 0, 0, -0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, -1857.84, -2606.39, 95.3395, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, 687.582, -1709.01, 95.4418, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Barrens', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Barrens', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Barrens', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Barrens', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Barrens', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+6, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+7, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+8, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+9, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Barrens', 10),
(@OGUID+10, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Barrens', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Ashenvale
SET @OGUID = 251721;
SET @PTEMPLATE = 7061;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, 2263.34, -1097.95, 101.96, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, 2596.89, 191.057, 102.818, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, 3308.44, -676.181, 163.166, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, 2263.34, -1097.95, 101.96, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 1, 2596.89, 191.057, 102.818, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, 3308.44, -676.181, 163.166, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Ashenvale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@OGUID+4, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@OGUID+5, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Ashenvale', 10),
(@OGUID+6, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Ashenvale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Stonetalon
SET @OGUID = 2516727;
SET @PTEMPLATE = 7065;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, 18.1759, 335.581, 108.974, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, 807.062, 1789.04, -8.88894, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, 890.925, 1651.49, -5.28425, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, 1475.66, 565.024, 161.926, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, 1914.61, 837.69, 169.293, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, 2552.11, 1558.34, 276.763, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, 118.1759, 335.581, 108.974, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, 807.062, 1789.04, -8.88894, 4.86947, 0, 0, -0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, 890.925, 1651.49, -5.28425, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, 1475.66, 565.024, 161.926, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, 1914.61, 837.69, 169.293, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, 2552.11, 1558.34, 276.763, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+7, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+8, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+9, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+10, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+11, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10),
(@OGUID+12, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Stonetalon Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Veins in Darkshore
SET @OGUID = 251740;
SET @PTEMPLATE = 7072;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, 4600.01, 333.36, 32.1979, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1732, 1, 4628.75, 11.0809, 72.8467, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1732, 1, 5393.58, 149.119, 41.419, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1732, 1, 6677.4, -277.544, 51.7848, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1732, 1, 6717.78, -632.348, 69.6979, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1732, 1, 7010.49, -421.742, 47.4607, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1732, 1, 7124.58, -422.058, 36.2174, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1732, 1, 7432.04, -1000.82, 4.36965, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, 4600.01, 333.36, 32.1979, 2.21657, 0, 0, 0.894934, 0.446199, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 1, 4628.75, 11.0809, 72.8467, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 1, 5393.58, 149.119, 41.419, 0.820303, 0, 0, 0.398748, 0.91706, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 1, 6677.4, -277.544, 51.7848, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 1, 6717.78, -632.348, 69.6979, 1.53589, 0, 0, 0.694658, 0.71934, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 1, 7010.49, -421.742, 47.4607, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 1, 7124.58, -422.058, 36.2174, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 1, 7432.04, -1000.82, 4.36965, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+5, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+6, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+7, 1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@PTEMPLATE+8, 1, 'Tin Vein / Silver Vein - Darkshore', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+5, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+6, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+7, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+8, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+9, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+10, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+11, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+12, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+13, @PTEMPLATE+5, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+14, @PTEMPLATE+6, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+15, @PTEMPLATE+7, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+16, @PTEMPLATE+8, 'Tin Vein / Silver Vein - Darkshore', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+5, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+6, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+7, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+8, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0);

-- Silver Veins
SET @OGUID = 427000;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -13272, -574.499, 16.0171, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, 995.454, -632.881, 124.128, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -894.552, 1317.25, 91.781, 4.55531, 0, 0, -0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 386, 'Silver Vein - Stranglethorn', 10),
(@OGUID+2, 397, 'Silver Vein - Alterac Mountains', 10),
(@OGUID+3, 321, 'Silver Vein - Desolace', 10);

-- Tin Veins / Silver Veins in Westfall
SET @OGUID = 427004;
SET @PTEMPLATE = 17026;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 1732, 0, -11095.1, 1161.66, 54.5803, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -11095.1, 1161.66, 54.5803, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Westfall', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Westfall', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1112, 0, 'Westfall - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein in Redridge
SET @OGUID = 427007;
SET @PTEMPLATE = 17028;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -8791.89, -1984.2, 125.494, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -8791.89, -1984.2, 125.494, 3.82227, 0, 0, -0.942641, 0.333808, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein in Loch Modan
SET @OGUID = 427010;
SET @PTEMPLATE = 17030;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -5217.76, -4201.67, 358.266, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -5217.76, -4201.67, 358.266, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Loch Modan', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Loch Modan', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1186, 0, 'Loch Modan - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein in Silverpine
SET @OGUID = 427013;
SET @PTEMPLATE = 17032;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, 254.54, 1100.55, 90.5359, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, 254.54, 1100.55, 90.5359, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Silverpine Forest', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Silverpine Forest', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein
SET @OGUID = 427016;
SET @PTEMPLATE = 17034;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, 6899.86, -190.798, 50.7708, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, 6899.86, -190.798, 50.7708, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Darkshore', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Darkshore', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Darkshore', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0);

-- Tin Vein / Silver Vein / Iron Deposit in Ashenvale
SET @OGUID = 427019;
SET @PTEMPLATE = 17036;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 1, 2238.02, -2863.79, 132.181, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, 2238.02, -2863.79, 132.181, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 1, 2238.02, -2863.79, 132.181, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+3, @PTEMPLATE, 'Tin Vein / Silver Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 10005, 0, 'Ashenvale - Tin Vein / Silver Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Arathi Highlands
SET @OGUID = 427023;
SET @PTEMPLATE = 17038;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -2084.63, -3244.11, 66.7315, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -1966.82, -2875.04, 78.3628, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -1892.92, -2863.2, 69.9444, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -1513.85, -3394.19, 54.8384, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -681.161, -2014.57, 57.8267, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -578.061, -1840.35, 58.6231, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, -2084.63, -3244.11, 66.7315, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -1966.82, -2875.04, 78.3628, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, -1892.92, -2863.2, 69.9444, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, -1513.85, -3394.19, 54.8384, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 0, -681.161, -2014.57, 57.8267, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 0, -578.061, -1840.35, 58.6231, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 0, -2084.63, -3244.11, 66.7315, 1.62316, 0, 0, 0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 0, -1966.82, -2875.04, 78.3628, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 0, -1892.92, -2863.2, 69.9444, 1.48353, 0, 0, 0.67559, 0.737278, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 0, -1513.85, -3394.19, 54.8384, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 0, -681.161, -2014.57, 57.8267, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 0, -578.061, -1840.35, 58.6231, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+13, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+14, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+15, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+16, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+17, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+18, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Thousand Needles
SET @OGUID = 427042;
SET @PTEMPLATE = 17045;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -5689.62, -2554.05, -50.765, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -5457.66, -2200.77, -57.5791, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -4823.91, -1644.61, -42.987, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -5689.62, -2554.05, -50.765, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -5457.66, -2200.77, -57.5791, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -4823.91, -1644.61, -42.987, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 1, -5689.62, -2554.05, -50.765, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 1, -5457.66, -2200.77, -57.5791, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, -4823.91, -1644.61, -42.987, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+4, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+5, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+6, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+9, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Veins
SET @OGUID = 427052;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -14690.7, -250.13, 18.0443, 0.855211, 0, 0, 0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, 1200.03, -539.305, 77.9553, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, 1220.72, -362.385, 56.5595, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -4434.57, -2908.51, 27.2165, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -857.031, 1367.46, 74.1345, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1176, 'Gold Vein - Stranglethorn', 10),
(@OGUID+2, 1353, 'Gold Vein - Alterac Mountains', 10),
(@OGUID+3, 1353, 'Gold Vein - Alterac Mountains', 10),
(@OGUID+4, 1335, 'Gold Vein - Dustwallow Marsh', 10),
(@OGUID+5, 1347, 'Gold Vein - Desolace', 10);

-- Silver Vein / Gold Vein / Iron Deposit in Swamp of Sorrows
SET @OGUID = 427058;
SET @PTEMPLATE = 17049;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -10986, -3968.31, 34.5542, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -10986, -3968.31, 34.5542, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -10986, -3968.31, 34.5542, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Arathi Highlands
SET @OGUID = 427062;
SET @PTEMPLATE = 17050;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -2092.98, -3309.56, 67.8537, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -2092.98, -3309.56, 67.8537, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -2092.98, -3309.56, 67.8537, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Iron Deposit in Hillsbrad
SET @OGUID = 427066;
SET @PTEMPLATE = 17051;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -1329.09, 469.776, 34.2974, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1735, 0, -1329.09, 469.776, 34.2974, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Hinterlands
SET @OGUID = 427069;
SET @PTEMPLATE = 17052;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, 487.049, -4189.84, 135.667, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, 487.049, -4189.84, 135.667, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, 487.049, -4189.84, 135.667, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1349, 0, 'Hinterlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Feralas
SET @OGUID = 427073;
SET @PTEMPLATE = 17053;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -5040.29, 1781.08, 71.5072, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -5040.29, 1781.08, 71.5072, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 1, -5040.29, 1781.08, 71.5072, 0, 0, 0, 0, 1, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Iron Deposit in Thousand Needles
SET @OGUID = 427077;
SET @PTEMPLATE = 17054;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -4928.64, -2353.08, -48.7368, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1735, 1, -4928.64, -2353.08, -48.7368, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Stonetalon
SET @OGUID = 427080;
SET @PTEMPLATE = 17055;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 1, 2463.74, 1770.67, 374.254, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Ashenvale
SET @OGUID = 427086;
SET @PTEMPLATE = 17056;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 2871.85, -1367.18, 220.637, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 2871.85, -1367.18, 220.637, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 1, 2871.85, -1367.18, 220.637, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Iron Deposits
SET @OGUID = 427090;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1735, 0, -13725.4, 346.743, 49.9747, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1735, 0, -13582.2, -201.529, 34.3294, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -13571, -141.395, 49.1922, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1735, 0, -13569.7, -16.018, 49.3623, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 0, -13404.2, 609.748, 18.1996, 4.4855, 0, 0, -0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -13133, -474.707, 10.5634, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 0, -13129.7, -569.609, 12.6068, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 0, -13120.5, -522.741, 9.26869, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 0, -12970.8, -415.276, 42.9962, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 0, -12808.4, -650.557, 67.8432, 1.64061, 0, 0, 0.731353, 0.681999, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 0, -12384, -832.929, 49.2845, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 0, -12367.7, -979.129, 14.7117, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 0, -12352.9, -1021.89, 7.57272, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 0, -12313, -1031.56, 9.10183, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 0, -12291.5, -1096.73, 10.2265, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 0, -12233.6, -1033.41, 61.6938, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 0, -12128.2, -777.814, 23.5145, 3.76991, 0, 0, -0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 0, -11897.4, -726.011, 23.0206, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 0, -11822.3, 577.765, 48.6223, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 0, -11746.5, 469.79, 52.5784, 5.70723, 0, 0, -0.284015, 0.95882, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 0, -11745.3, -947.944, 58.7745, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1735, 0, -11553.7, -919.246, 70.8843, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 0, -11542.6, -919.15, 27.9049, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1735, 0, -11508.1, -904.844, 29.4344, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1735, 0, -11471.5, -951.882, 28.4177, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1735, 0, -11464.5, -792.715, 16.9409, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1735, 0, -11444.7, -718.875, 31.5775, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1735, 0, -11439.9, -898.279, 21.0529, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1735, 0, -11410.6, -761.634, 16.6565, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1735, 0, -11405.4, -946.741, 21.5275, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1735, 0, 235.168, -283.933, 148.17, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1735, 0, 266.302, -508.268, 197.204, 4.03171, 0, 0, -0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1735, 0, 361.617, -272.293, 174.191, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1735, 0, 546.099, 25.8329, 132.257, 4.85202, 0, 0, -0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1735, 0, 660.074, -693.955, 163.728, 2.67035, 0, 0, 0.972369, 0.233448, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1735, 0, 688.843, -1369.28, 111.343, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1735, 0, 716.587, -648.227, 170.116, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1735, 0, 725.663, -1076.18, 157.488, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1735, 0, 781.768, -457.309, 146.165, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1735, 0, 846.026, -1021.78, 144.245, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1735, 0, 868.787, -536.433, 146.763, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1735, 0, 900.264, -560.414, 144.415, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1735, 0, 943.097, -808.099, 126.39, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1735, 0, 970.277, -916.3, 136.895, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1735, 1, -4420.88, -2947.3, 26.1393, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1735, 1, -4332.39, -2608.17, 40.8422, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1735, 1, -2793.1, -2622.57, 33.5015, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1735, 1, -2791.36, -2560.33, 29.9303, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1735, 1, -2747.91, -2619.6, 29.4423, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1735, 1, -2587.26, -3420.52, 51.0784, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1735, 1, -2199.96, 1511.52, 98.9612, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1735, 1, -2002.61, 1662.37, 74.5551, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1735, 1, -1593.27, 2493.74, 142.673, 0.331611, 0, 0, 0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1735, 1, -1437.98, 2781.71, 116.279, 0.890117, 0, 0, 0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1735, 1, -1175.74, 684.178, 182.837, 5.28835, 0, 0, -0.477159, 0.878817, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1735, 1, -1082.72, 1344.55, 72.0954, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1735, 1, -859.79, 1664.28, 70.2439, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1735, 1, -840.317, 2114.2, 73.7164, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1735, 1, -581.519, 2129.99, 95.8021, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1735, 1, -172.933, 1551.46, 86.9544, 5.84685, 0, 0, -0.216439, 0.976296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+61, 1735, 1, 85.895, 1468.23, 139.609, 2.54818, 0, 0, 0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+62, 1735, 1, 207.636, 2918.99, 23.1314, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+2, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+3, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+4, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+5, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+6, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+7, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+8, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+9, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+10, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+11, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+12, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+13, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+14, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+15, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+16, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+17, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+18, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+19, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+20, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+21, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+22, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+23, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+24, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+25, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+26, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+27, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+28, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+29, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+30, 1175, 'Iron Deposit - Stranglethorn Vale', 10),
(@OGUID+31, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+32, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+33, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+34, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+35, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+36, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+37, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+38, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+39, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+40, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+41, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+42, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+43, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+44, 1068, 'Iron Deposit - Alterac Mountains', 10),
(@OGUID+45, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+46, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+47, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+48, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+49, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+50, 43520, 'Iron Deposit - Dustwallow Marsh', 10),
(@OGUID+51, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+52, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+53, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+54, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+55, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+56, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+57, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+58, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+59, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+60, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+61, 1141, 'Iron Deposit - Desolace', 10),
(@OGUID+62, 1141, 'Iron Deposit - Desolace', 10);

-- Gold Vein / Iron Deposit in Duskwood
SET @OGUID = 427153;
SET @PTEMPLATE = 17057;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11160.1, -1168.44, 44.7962, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -11141.6, -866.69, 73.6912, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -11105.3, -138.255, 14.2671, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -10395.6, -748.918, 72.097, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 0, -11160.1, -1168.44, 44.7962, 0.785397, 0, 0, 0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -11141.6, -866.69, 73.6912, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 0, -11105.3, -138.255, 14.2671, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 0, -10395.6, -748.918, 72.097, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Duskwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+5, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+6, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+7, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+8, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Duskwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Swamp of Sorrows
SET @OGUID = 427162;
SET @PTEMPLATE = 17062;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -10964.4, -3679.77, 8.75931, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -10850.2, -3632.54, 14.7196, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -10158.9, -2762.31, 28.9108, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -10153.7, -2383.9, 43.2872, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -10091.5, -2350.08, 27.358, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -10038.5, -3414.23, 28.1607, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -9915.04, -3621.54, 36.3629, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -10964.4, -3679.77, 8.75931, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, -10850.2, -3632.54, 14.7196, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, -10158.9, -2762.31, 28.9108, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 0, -10153.7, -2383.9, 43.2872, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 0, -10091.5, -2350.08, 27.358, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 0, -10038.5, -3414.23, 28.1607, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 0, -9915.04, -3621.54, 36.3629, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 0, -10964.4, -3679.77, 8.75931, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 0, -10850.2, -3632.54, 14.7196, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 0, -10158.9, -2762.31, 28.9108, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 0, -10153.7, -2383.9, 43.2872, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 0, -10091.5, -2350.08, 27.358, 3.21142, 0, 0, -0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 0, -10038.5, -3414.23, 28.1607, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 0, -9915.04, -3621.54, 36.3629, 1.78023, 0, 0, 0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+8, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+9, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+10, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+11, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+12, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+13, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+14, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+15, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+16, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+17, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+18, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+19, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+20, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+21, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Arathi Highlands
SET @OGUID = 427184;
SET @PTEMPLATE = 17070;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -2089.75, -2849.91, 78.4582, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -2057.36, -3367.59, 60.9896, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -2045.15, -2790.11, 71.8366, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -2026.57, -2841.76, 78.3791, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -2012.62, -3390.32, 52.3592, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -1997.32, -2702.11, 86.2068, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 0, -1967.31, -3303.95, 56.4634, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 0, -1904.85, -3380.88, 76.3063, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 0, -1844.39, -2797.95, 63.7121, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1733, 0, -1739.74, -3479.38, 58.7864, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1733, 0, -1662.89, -3521.96, 71.4645, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1733, 0, -1378.18, -3469.35, 62.7929, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1733, 0, -1321.91, -3414.91, 48.8469, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1733, 0, -1207.98, -2092.81, 51.3807, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1733, 0, -1179.93, -3657.81, 60.1514, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1733, 0, -1168.9, -2260.43, 61.133, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1733, 0, -991.399, -3831.51, 149.535, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1733, 0, -949.486, -3910.12, 149.206, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1733, 0, -871.734, -3928.11, 132.047, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1733, 0, -861.309, -1812.96, 46.9976, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1734, 0, -2089.75, -2849.91, 78.4582, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1734, 0, -2057.36, -3367.59, 60.9896, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1734, 0, -2045.15, -2790.11, 71.8366, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1734, 0, -2026.57, -2841.76, 78.3791, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1734, 0, -2012.62, -3390.32, 52.3592, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1734, 0, -1997.32, -2702.11, 86.2068, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1734, 0, -1967.31, -3303.95, 56.4634, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 1734, 0, -1904.85, -3380.88, 76.3063, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 1734, 0, -1844.39, -2797.95, 63.7121, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1734, 0, -1739.74, -3479.38, 58.7864, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 1734, 0, -1662.89, -3521.96, 71.4645, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 1734, 0, -1378.18, -3469.35, 62.7929, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 1734, 0, -1321.91, -3414.91, 48.8469, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 1734, 0, -1207.98, -2092.81, 51.3807, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 1734, 0, -1179.93, -3657.81, 60.1514, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 1734, 0, -1168.9, -2260.43, 61.133, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 1734, 0, -991.399, -3831.51, 149.535, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 1734, 0, -949.486, -3910.12, 149.206, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 1734, 0, -871.734, -3928.11, 132.047, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 1734, 0, -861.309, -1812.96, 46.9976, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 1735, 0, -2089.75, -2849.91, 78.4582, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 1735, 0, -2057.36, -3367.59, 60.9896, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 1735, 0, -2045.15, -2790.11, 71.8366, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 1735, 0, -2026.57, -2841.76, 78.3791, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+45, 1735, 0, -2012.62, -3390.32, 52.3592, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+46, 1735, 0, -1997.32, -2702.11, 86.2068, 1.3439, 0, 0, 0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+47, 1735, 0, -1967.31, -3303.95, 56.4634, 1.6057, 0, 0, 0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+48, 1735, 0, -1904.85, -3380.88, 76.3063, 2.79252, 0, 0, 0.984807, 0.173652, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+49, 1735, 0, -1844.39, -2797.95, 63.7121, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+50, 1735, 0, -1739.74, -3479.38, 58.7864, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+51, 1735, 0, -1662.89, -3521.96, 71.4645, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+52, 1735, 0, -1378.18, -3469.35, 62.7929, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+53, 1735, 0, -1321.91, -3414.91, 48.8469, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+54, 1735, 0, -1207.98, -2092.81, 51.3807, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+55, 1735, 0, -1179.93, -3657.81, 60.1514, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+56, 1735, 0, -1168.9, -2260.43, 61.133, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+57, 1735, 0, -991.399, -3831.51, 149.535, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+58, 1735, 0, -949.486, -3910.12, 149.206, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+59, 1735, 0, -871.734, -3928.11, 132.047, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+60, 1735, 0, -861.309, -1812.96, 46.9976, 4.57276, 0, 0, -0.754709, 0.656059, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+10, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+11, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+12, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+13, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+14, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+15, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+16, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+17, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+18, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+19, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@PTEMPLATE+20, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+13, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+14, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+15, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+16, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+17, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+18, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+19, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+20, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+21, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+22, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+23, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+24, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+25, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+26, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+27, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+28, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+29, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+30, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+31, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+32, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+33, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+34, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+35, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+36, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+37, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+38, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+39, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+40, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+41, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+42, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+43, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+44, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+45, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+46, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+47, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+48, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+49, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+50, @PTEMPLATE+10, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+51, @PTEMPLATE+11, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+52, @PTEMPLATE+12, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+53, @PTEMPLATE+13, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+54, @PTEMPLATE+14, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+55, @PTEMPLATE+15, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+56, @PTEMPLATE+16, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+57, @PTEMPLATE+17, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+58, @PTEMPLATE+18, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+59, @PTEMPLATE+19, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+60, @PTEMPLATE+20, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+10, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+11, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+12, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+13, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+14, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+15, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+16, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+17, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+18, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+19, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+20, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Iron Deposit in Hillsbrad
SET @OGUID = 427245;
SET @PTEMPLATE = 17091;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -1316.33, -1155.77, 42.5717, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -1310.49, 564.733, 106.517, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -1110.85, -1301.28, 60.684, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -1012.89, -1185.04, 65.5292, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -284.476, -1593.24, 96.5185, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -1316.33, -1155.77, 42.5717, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 0, -1310.49, 564.733, 106.517, 4.66003, 0, 0, -0.725374, 0.688355, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 0, -1110.85, -1301.28, 60.684, 3.75246, 0, 0, -0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 0, -1012.89, -1185.04, 65.5292, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 0, -284.476, -1593.24, 96.5185, 3.59538, 0, 0, -0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+6, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+7, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+8, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+9, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10),
(@OGUID+10, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1274, 0, 'Hillsbrad Foothills - Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Tanaris
SET @OGUID = 427255;
SET @PTEMPLATE = 17097;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -8809.97, -3823.42, 37.536, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -7879.23, -5001.2, 18.1521, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -7825.65, -4809.04, 12.0139, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, -7523.69, -4725.07, 9.27064, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -8809.97, -3823.42, 37.536, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -7879.23, -5001.2, 18.1521, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, -7825.65, -4809.04, 12.0139, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, -7523.69, -4725.07, 9.27064, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, -8809.97, -3823.42, 37.536, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 1, -7879.23, -5001.2, 18.1521, 0.174532, 0, 0, 0.0871553, 0.996195, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 1, -7825.65, -4809.04, 12.0139, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 1, -7523.69, -4725.07, 9.27064, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+7, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+8, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+11, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10),
(@OGUID+12, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Tanaris', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1200, 0, 'Tanaris - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Gold Vein / Iron Deposit in Thousand Needles
SET @OGUID = 427268;
SET @PTEMPLATE = 17102;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -5520.2, -4100.96, -55.0269, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -5492.38, -3416.5, -37.0193, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -5345.78, -1597.08, -53.6225, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -5174.3, -1392.93, -49.6103, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -5075.88, -1345.86, -44.2591, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -5049.19, -1018.44, -3.38531, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 1, -5520.2, -4100.96, -55.0269, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 1, -5492.38, -3416.5, -37.0193, 2.30383, 0, 0, 0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, -5345.78, -1597.08, -53.6225, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 1, -5174.3, -1392.93, -49.6103, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 1, -5075.88, -1345.86, -44.2591, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 1, -5049.19, -1018.44, -3.38531, 0.453785, 0, 0, 0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+10, @PTEMPLATE+4, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+11, @PTEMPLATE+5, 'Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+12, @PTEMPLATE+6, 'Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1132, 0, 'Thousand Needles - Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Thousand Needles
SET @OGUID = 427281;
SET @PTEMPLATE = 17109;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -5279.69, -1477.94, -54.0407, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -4925.01, -2128.93, -45.7114, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -4913.53, -2309.18, -65.4606, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, -4708.47, -987.417, -51.0312, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -5279.69, -1477.94, -54.0407, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -4925.01, -2128.93, -45.7114, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, -4913.53, -2309.18, -65.4606, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, -4708.47, -987.417, -51.0312, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, -5279.69, -1477.94, -54.0407, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 1, -4925.01, -2128.93, -45.7114, 4.67748, 0, 0, -0.719339, 0.694659, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 1, -4913.53, -2309.18, -65.4606, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 1, -4708.47, -987.417, -51.0312, 4.64258, 0, 0, -0.731354, 0.681998, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+7, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+8, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+11, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10),
(@OGUID+12, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 329, 0, 'Thousand Needles - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Feralas
SET @OGUID = 427294;
SET @PTEMPLATE = 17114;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, -4971.01, 1753.83, 65.7742, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, -4963.41, 1607.13, 70.1086, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, -4950.17, 1679.01, 63.5371, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, -3878.53, 222.919, 114.312, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -4971.01, 1753.83, 65.7742, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -4963.41, 1607.13, 70.1086, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, -4950.17, 1679.01, 63.5371, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, -3878.53, 222.919, 114.312, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, -4971.01, 1753.83, 65.7742, 1.74533, 0, 0, 0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1735, 1, -4963.41, 1607.13, 70.1086, 1.43117, 0, 0, 0.656058, 0.75471, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1735, 1, -4950.17, 1679.01, 63.5371, 3.33359, 0, 0, -0.995396, 0.0958512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1735, 1, -3878.53, 222.919, 114.312, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+7, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+8, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+11, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10),
(@OGUID+12, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Feralas', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1196, 0, 'Feralas - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Stonetalon
SET @OGUID = 427307;
SET @PTEMPLATE = 17119;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1735, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1735, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1735, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 1, 471.83, 1693.53, 31.8308, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 1, 2616.56, 1516.24, 257.183, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 1, 892.079, 1850.13, 15.1665, 4.53786, 0, 0, -0.766044, 0.642789, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+6, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+9, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+10, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+11, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+12, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+13, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+14, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+15, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1091, 0, 'Stonetalon Mountains - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Ashenvale
SET @OGUID = 427323;
SET @PTEMPLATE = 17124;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 1584.62, -2556.85, 114.66, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 1, 1664.91, -2132.63, 108.924, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 1, 1682.31, -2997.83, 139.246, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 1, 1927, -3208.13, 115.076, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 1, 2366.13, -2384.03, 147.632, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 1, 2428.87, -2274.57, 146.585, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 1, 2663.34, -2749.27, 184.821, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1733, 1, 2712.33, -2471.16, 187.539, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1733, 1, 2908.74, -2547.21, 236.158, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 1, 1584.62, -2556.85, 114.66, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 1, 1664.91, -2132.63, 108.924, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 1, 1682.31, -2997.83, 139.246, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 1, 1927, -3208.13, 115.076, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 1, 2366.13, -2384.03, 147.632, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1734, 1, 2428.87, -2274.57, 146.585, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1734, 1, 2663.34, -2749.27, 184.821, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1734, 1, 2712.33, -2471.16, 187.539, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1734, 1, 2908.74, -2547.21, 236.158, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 1, 1584.62, -2556.85, 114.66, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 1, 1664.91, -2132.63, 108.924, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 1, 1682.31, -2997.83, 139.246, 1.91986, 0, 0, 0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 1735, 1, 1927, -3208.13, 115.076, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 1735, 1, 2366.13, -2384.03, 147.632, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 1735, 1, 2428.87, -2274.57, 146.585, 5.55015, 0, 0, -0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 1735, 1, 2663.34, -2749.27, 184.821, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 1735, 1, 2712.33, -2471.16, 187.539, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 1735, 1, 2908.74, -2547.21, 236.158, 1.37881, 0, 0, 0.636078, 0.771625, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+8, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+9, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+8, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+9, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+10, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+11, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+12, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+13, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+14, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+15, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+16, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+17, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+18, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+19, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+20, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+21, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+22, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+23, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+24, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+25, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+26, @PTEMPLATE+8, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+27, @PTEMPLATE+9, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+8, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+9, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Darrow Hill
SET @OGUID = 427350;
SET @PTEMPLATE = 17134;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, -317.189, -300.147, 44.563, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+4, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10),
(@OGUID+5, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Darrow Hill - Hillsbrad Foothills', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Hinterlands
SET @OGUID = 427356;
SET @PTEMPLATE = 17136;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, 351.404, -3269.4, 127.413, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, 351.404, -3269.4, 127.413, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, 351.404, -3269.4, 127.413, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1349, 0, 'Hinterlands - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Mithril Deposits
SET @OGUID = 220800;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2040, 0, -14588.1, 345.029, 8.2059, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -13775.4, 452.27, 92.77, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2040, 0, -13375.2, -373.266, 23.5344, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -13271.5, -311.882, 25.4076, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -13258.2, -211.438, 35.7719, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -13118.3, 164.409, 42.8251, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -13102, -670.346, 79.2665, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -13003.7, -756.31, 59.3426, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 0, -12977.2, -542.209, 73.2442, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 0, -12306.5, -1111.94, 5.93664, 2.93214, 0, 0, 0.994521, 0.104536, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 0, -11444.6, -935.033, 22.5053, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 1, -2142.28, 2611.28, 29.1127, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2040, 1, -2017.71, 2153.94, 57.9873, 5.35816, 0, 0, -0.446198, 0.894935, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2040, 1, -1772.81, 2008.24, 69.5281, 5.00909, 0, 0, -0.594823, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2040, 1, -1134.3, 2753.29, 129.11, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2040, 1, -945.641, 2493.51, 127.732, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2040, 1, -500.233, 2633.11, 5.49796, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2040, 1, -94.0791, 865.526, 121.01, 5.21854, 0, 0, -0.507538, 0.861629, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 2040, 1, -50.3689, 2667.23, -103.501, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 2040, 1, -23.8319, 2580.51, -95.5648, 0.523598, 0, 0, 0.258819, 0.965926, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 2040, 0, 669.802, -606.522, 163.762, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 2040, 0, 444.605, -80.3419, 149.462, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2040, 0, 556.295, -716.672, 154.8, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2040, 1, -5025.09, -3735.54, 52.0642, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2040, 1, -2784.04, -2644.28, 32.2065, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2040, 1, -2742.7, -2574.46, 33.3991, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2040, 1, -4470.82, -2971.23, 30.2181, 5.39307, 0, 0, -0.430511, 0.902586, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2040, 1, -4381.84, -2918.38, 26.5274, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2040, 1, -4949.52, -2293.53, -82.4419, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2040, 1, -4941.11, -2333.84, -54.8899, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 2040, 1, -4888.66, -2285.12, -59.6999, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 2040, 1, 2241.44, -6389.57, 17.3552, 0.733038, 0, 0, 0.358368, 0.93358, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 2040, 1, 2691.49, -5241.29, 119.195, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 2040, 1, 3547.02, -5481.67, 53.6473, 4.71239, 0, 0, -0.707107, 0.707107, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 2040, 1, 3801.09, -4842.9, 158.188, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 2040, 1, 3932.33, -4933.86, 159.605, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 2040, 1, 4269.99, -7110.64, 45.3157, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 2040, 1, 4653.78, -5907.58, 122.904, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 2040, 1, 4745.73, -5473.62, 110.335, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 2040, 1, -4464.97, -2882.58, 22.3767, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+2, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+3, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+4, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+5, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+6, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+7, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+8, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+9, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+10, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+11, 1175, 'Mithril Deposit - Stranglethorn Vale', 10),
(@OGUID+12, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+13, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+14, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+15, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+16, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+17, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+18, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+19, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+20, 1141, 'Mithril Deposit - Desolace', 10),
(@OGUID+21, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+22, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+23, 1069, 'Mithril Deposit - Alterac Mountains', 10),
(@OGUID+24, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+25, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+26, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+27, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+28, 43524, 'Mithril Deposit - Dustwallow Marsh', 10),
(@OGUID+29, 2586, 'Mithril Deposit - Thousand Needles', 10),
(@OGUID+30, 2586, 'Mithril Deposit - Thousand Needles', 10),
(@OGUID+31, 2586, 'Mithril Deposit - Thousand Needles', 10),
(@OGUID+32, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+33, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+34, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+35, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+36, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+37, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+38, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+39, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+40, 43524, 'Mithril Deposit - Dustwallow Marsh', 10);

-- Gold Vein / Mithril Deposit in Blasted Lands
SET @OGUID = 427400;
SET @PTEMPLATE = 17140;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11705.4, -2752.12, 12.5473, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -11705.4, -2752.12, 12.5473, 1.85005, 0, 0, 0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1279, 0, 'Blasted Lands - Gold Vein / Mithril Deposit', 0);

-- Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit in Blasted Lands
SET @OGUID = 427403;
SET @PTEMPLATE = 17142;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11556.6, -3112.53, 12.1533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -11556.6, -3112.53, 12.1533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -11556.6, -3112.53, 12.1533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 0, -11556.6, -3112.53, 12.1533, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+4, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1280, 0, 'Blasted Lands - Gold Vein / Mithril Deposit / Small Thorium Vein / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Swamp of Sorrows
SET @OGUID = 427408;
SET @PTEMPLATE = 17144;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+4, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1332, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1332, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit in Arathi
SET @OGUID = 427419;
SET @PTEMPLATE = 17147;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1735, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1735, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 2040, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 2040, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 2040, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 2040, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2040, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2040, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2047, 0, -2044.11, -3332.36, 59.5733, 2.9845, 0, 0, 0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2047, 0, -2032.64, -3347.23, 61.9084, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2047, 0, -1920.89, -1674.88, 62.1752, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2047, 0, -920.493, -3939.74, 149.412, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2047, 0, -890.553, -3868.59, 135.962, 1.88495, 0, 0, 0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2047, 0, -821.052, -3915.51, 146.443, 4.93928, 0, 0, -0.622514, 0.782609, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+9, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+10, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+11, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+12, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+13, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+14, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+15, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+16, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+17, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+18, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+19, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+20, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+21, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+22, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+23, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+24, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+25, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+26, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+27, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+28, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+29, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+30, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 18840, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in The Hinterlands
SET @OGUID = 427450;
SET @PTEMPLATE = 17154;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -509.514, -4208.35, 220.523, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -303.98, -2627.9, 117.719, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -285.923, -2732.25, 122.36, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, 55.5584, -2734.18, 143.136, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, 385.355, -3445.47, 119.731, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, 552.948, -3753.24, 128.218, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 0, 584.298, -3912.17, 135.986, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 0, 769.416, -4265.38, 141.246, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 0, 958.159, -4201.19, 137.316, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 0, 1033.61, -4026.54, 132.153, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 0, -509.514, -4208.35, 220.523, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 0, -303.98, -2627.9, 117.719, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2040, 0, -285.923, -2732.25, 122.36, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2040, 0, 55.5584, -2734.18, 143.136, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2040, 0, 385.355, -3445.47, 119.731, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2040, 0, 552.948, -3753.24, 128.218, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2040, 0, 584.298, -3912.17, 135.986, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2040, 0, 769.416, -4265.38, 141.246, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 2040, 0, 958.159, -4201.19, 137.316, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 2040, 0, 1033.61, -4026.54, 132.153, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 2047, 0, -509.514, -4208.35, 220.523, 4.27606, 0, 0, -0.843391, 0.5373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 2047, 0, -303.98, -2627.9, 117.719, 5.96903, 0, 0, -0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2047, 0, -285.923, -2732.25, 122.36, 3.24635, 0, 0, -0.998629, 0.0523532, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2047, 0, 55.5584, -2734.18, 143.136, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2047, 0, 385.355, -3445.47, 119.731, 5.34071, 0, 0, -0.45399, 0.891007, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2047, 0, 552.948, -3753.24, 128.218, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2047, 0, 584.298, -3912.17, 135.986, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2047, 0, 769.416, -4265.38, 141.246, 3.9619, 0, 0, -0.91706, 0.39875, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2047, 0, 958.159, -4201.19, 137.316, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2047, 0, 1033.61, -4026.54, 132.153, 5.58505, 0, 0, -0.34202, 0.939693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+11, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+12, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+13, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+14, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+15, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+16, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+17, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+18, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+19, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+20, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+21, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+22, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+23, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+24, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+25, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+26, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+27, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+28, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+29, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+30, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in Tanaris
SET @OGUID = 427481;
SET @PTEMPLATE = 17165;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -9422.37, -2212.6, 20.6264, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -9109.86, -4197.31, -30.1479, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -8944.28, -2418.16, 21.9379, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -8785.42, -4360.96, 23.3049, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -8499.34, -3094.56, 11.5067, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 1, -8376.25, -3071.58, 8.40438, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1734, 1, -8081.92, -2524.82, -48.981, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 1, -8017.08, -2530.51, -37.303, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 1, -7983.81, -2430.09, -25.6644, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 1, -7839.7, -2503.52, -45.4649, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 1, -9422.37, -2212.6, 20.6264, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 1, -9109.86, -4197.31, -30.1479, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2040, 1, -8944.28, -2418.16, 21.9379, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2040, 1, -8785.42, -4360.96, 23.3049, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2040, 1, -8499.34, -3094.56, 11.5067, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2040, 1, -8376.25, -3071.58, 8.40438, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2040, 1, -8081.92, -2524.82, -48.981, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2040, 1, -8017.08, -2530.51, -37.303, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 2040, 1, -7983.81, -2430.09, -25.6644, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 2040, 1, -7839.7, -2503.52, -45.4649, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 2047, 1, -9422.37, -2212.6, 20.6264, 5.48033, 0, 0, -0.390731, 0.920505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 2047, 1, -9109.86, -4197.31, -30.1479, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 2047, 1, -8944.28, -2418.16, 21.9379, 0.471238, 0, 0, 0.233445, 0.97237, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 2047, 1, -8785.42, -4360.96, 23.3049, 5.8294, 0, 0, -0.224951, 0.97437, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 2047, 1, -8499.34, -3094.56, 11.5067, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 2047, 1, -8376.25, -3071.58, 8.40438, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 2047, 1, -8081.92, -2524.82, -48.981, 2.37364, 0, 0, 0.927183, 0.374608, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 2047, 1, -8017.08, -2530.51, -37.303, 1.55334, 0, 0, 0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 2047, 1, -7983.81, -2430.09, -25.6644, 3.63029, 0, 0, -0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 2047, 1, -7839.7, -2503.52, -45.4649, 6.26573, 0, 0, -0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+7, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+8, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+9, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@PTEMPLATE+10, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+7, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+8, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+9, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+10, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+11, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+12, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+13, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+14, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+15, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+16, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+17, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+18, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+19, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+20, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+21, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+22, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+23, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+24, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+25, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+26, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+27, @PTEMPLATE+7, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+28, @PTEMPLATE+8, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+29, @PTEMPLATE+9, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10),
(@OGUID+30, @PTEMPLATE+10, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+7, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+8, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+9, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+10, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Mithril Deposit / Truesilver Deposit in Silithus
SET @OGUID = 427512;
SET @PTEMPLATE = 17176;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2040, 1, -7098.66, 153.395, 12.9174, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 1, -6530.46, 199.051, 17.1798, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2040, 1, -6480.22, 1923.44, 13.1481, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 1, -6324.74, 1631.31, 25.6828, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 1, -6240.55, 354.44, 33.4529, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 1, -7098.66, 153.395, 12.9174, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 1, -6530.46, 199.051, 17.1798, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 1, -6480.22, 1923.44, 13.1481, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, -6324.74, 1631.31, 25.6828, 0.680677, 0, 0, 0.333806, 0.942642, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 1, -6240.55, 354.44, 33.4529, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+2, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+3, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+4, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+5, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+4, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+5, @PTEMPLATE+5, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+6, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+7, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+8, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+9, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+10, @PTEMPLATE+5, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in Winterspring
SET @OGUID = 427523;
SET @PTEMPLATE = 17182;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, 6395.65, -2627.46, 588.774, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 6809.59, -3184.82, 598.276, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, 6864.97, -2973.88, 605.116, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, 6943.38, -3352.7, 751.9, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 1, 6395.65, -2627.46, 588.774, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 1, 6809.59, -3184.82, 598.276, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 1, 6864.97, -2973.88, 605.116, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 1, 6943.38, -3352.7, 751.9, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, 6395.65, -2627.46, 588.774, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 1, 6809.59, -3184.82, 598.276, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2047, 1, 6864.97, -2973.88, 605.116, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 1, 6943.38, -3352.7, 751.9, 4.43314, 0, 0, -0.798635, 0.601815, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@PTEMPLATE+2, 1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@PTEMPLATE+3, 1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@PTEMPLATE+4, 1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+2, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+3, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+4, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+5, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+6, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+7, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+8, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+9, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+10, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+11, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+12, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Winterspring', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1234, 0, 'Winterspring - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1234, 0, 'Winterspring - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1234, 0, 'Winterspring - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 1234, 0, 'Winterspring - Mithril Deposit / Truesilver Deposit', 0);

-- Mithril Deposit / Truesilver Deposit in Feralas
SET @OGUID = 427535;
SET @PTEMPLATE = 17187;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2040, 1, -3868.76, 1682.71, 141.231, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 1, -3518.93, 2750.2, 97.9244, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, -3868.76, 1682.71, 141.231, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, -3518.93, 2750.2, 97.9244, 3.17653, 0, 0, -0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Mithril Deposit / Truesilver Deposit - Feralas', 10),
(@PTEMPLATE+2, 1, 'Mithril Deposit / Truesilver Deposit - Feralas', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Feralas', 10),
(@OGUID+2, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Feralas', 10),
(@OGUID+3, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Feralas', 10),
(@OGUID+4, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Feralas', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1197, 0, 'Feralas - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1197, 0, 'Feralas - Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in Western Plaguelands
SET @OGUID = 427540;
SET @PTEMPLATE = 17190;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, 990.545, -1235.31, 72.8464, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, 1082.01, -1647.78, 67.9516, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2040, 0, 990.545, -1235.31, 72.8464, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, 1082.01, -1647.78, 67.9516, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 990.545, -1235.31, 72.8464, 2.05949, 0, 0, 0.857167, 0.515038, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 1082.01, -1647.78, 67.9516, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1,  1271, 0, 'Western Plaguelands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2,  1271, 0, 'Western Plaguelands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in Eastern Plaguelands
SET @OGUID = 427547;
SET @PTEMPLATE = 17193;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, 1848.97, -3361.27, 121.265, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, 1848.97, -3361.27, 121.265, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 1848.97, -3361.27, 121.265, 1.76278, 0, 0, 0.771625, 0.636078, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1263, 0, 'Eastern Plaguelands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Truesilver Deposits
SET @OGUID = 427550;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, -2078.25, 1179.16, 126.976, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -2015.01, 1972.72, 76.5862, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, 146.219, 2856.42, -8.38591, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1147, 'Mithril Deposit - Desolace', 10),
(@OGUID+2, 1147, 'Mithril Deposit - Desolace', 10),
(@OGUID+3, 1147, 'Mithril Deposit - Desolace', 10);

-- Truesilver Deposit / Small Thorium Vein in Silithus
SET @OGUID = 427554;
SET @PTEMPLATE = 17193;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, -7906.02, 1050.05, -0.715897, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -6608.58, 1800.85, 0.117497, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 1, -7906.02, 1050.05, -0.715897, 5.5676, 0, 0, -0.350207, 0.936672, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 1, -6608.58, 1800.85, 0.117497, 0.90757, 0, 0, 0.438371, 0.898794, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0);

-- Mithril Deposit / Truesilver Deposit
SET @OGUID = 427559;
SET @PTEMPLATE = 17196;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2040, 1, -7723.87, 1732.58, 12.2933, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 1, -6245.81, 727.328, 27.7256, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, -7723.87, 1732.58, 12.2933, 5.51524, 0, 0, -0.374606, 0.927184, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, -6245.81, 727.328, 27.7256, 2.82743, 0, 0, 0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+2, 1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+4, @PTEMPLATE+4, 'Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 326, 0, 'Silithus - Mithril Deposit / Truesilver Deposit', 0);

-- Truesilver Deposit / Rich Thorium Vein in Ungoro
SET @OGUID = 427564;
SET @PTEMPLATE = 17199;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 2047, 1, -7878.98, -908.608, -272.927, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 1, -7878.98, -908.608, -272.927, 5.18363, 0, 0, -0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+2, @PTEMPLATE, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1217, 0, 'Un\'Goro Crater - Truesilver Deposit / Rich Thorium Vein', 0);

-- Small Thorium Vein / Truesilver Deposit in Blasted Lands
SET @OGUID = 427567;
SET @PTEMPLATE = 17201;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, -11309.9, -2952.67, 22.2286, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, -11309.9, -2952.67, 22.2286, 1.36136, 0, 0, 0.62932, 0.777146, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1359, 0, 'Blasted Lands - Small Thorium Vein / Truesilver Deposit', 0);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in The Hinterlands
SET @OGUID = 427570;
SET @PTEMPLATE = 17203;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, 579.51, -4220.77, 142.145, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, 579.51, -4220.77, 142.145, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 579.51, -4220.77, 142.145, 5.25344, 0, 0, -0.492423, 0.870356, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1067, 0, 'Hinterlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Mithril Deposit / Truesilver Deposit in Arathi
SET @OGUID = 427574;
SET @PTEMPLATE = 17204;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2040, 0, -873.642, -4014.27, 146.178, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -674.432, -3671.85, 231.279, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -873.642, -4014.27, 146.178, 6.21337, 0, 0, -0.0348988, 0.999391, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, -674.432, -3671.85, 231.279, 3.47321, 0, 0, -0.986285, 0.16505, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@PTEMPLATE+2, 1, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1358, 0, 'Arathi Highlands - Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1358, 0, 'Arathi Highlands - Mithril Deposit / Truesilver Deposit', 0);

-- Small Thorium Vein

-- Small Thorium Vein / Truesilver Deposit in Blasted Lands
SET @OGUID = 58100;
SET @PTEMPLATE = 14400;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 0, -11639, -2895.58, 12.2637, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, -11542.9, -2873.28, 12.1575, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -11232.6, -3480.72, 9.60974, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 0, -11639, -2895.58, 12.2637, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 324, 0, -11542.9, -2873.28, 12.1575, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 324, 0, -11232.6, -3480.72, 9.60974, 3.71755, 0, 0, -0.958819, 0.284016, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@PTEMPLATE+2, 1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@PTEMPLATE+3, 1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+4, @PTEMPLATE+1, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+5, @PTEMPLATE+2, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+6, @PTEMPLATE+3, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1359, 0, 'Blasted Lands - Small Thorium Vein / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1359, 0, 'Blasted Lands - Small Thorium Vein / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1359, 0, 'Blasted Lands - Small Thorium Vein / Truesilver Deposit', 0);

-- Truesilver Deposit / Small Thorium Vein in Winterspring
SET @OGUID = 58107;
SET @PTEMPLATE = 14404;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, 5347.31, -4354.35, 912.447, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, 5914.67, -4968.7, 801.964, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, 6148.27, -4359.32, 660.467, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, 6329.18, -4463.41, 751.479, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 1, 6567.14, -5122.41, 770.087, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 1, 6619.86, -5353.58, 760.134, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 1, 7785.89, -4284.32, 693.261, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 324, 1, 5347.31, -4354.35, 912.447, 5.68977, 0, 0, -0.292372, 0.956305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 324, 1, 5914.67, -4968.7, 801.964, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 324, 1, 6148.27, -4359.32, 660.467, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 324, 1, 6329.18, -4463.41, 751.479, 3.85718, 0, 0, -0.936671, 0.35021, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 324, 1, 6567.14, -5122.41, 770.087, 1.22173, 0, 0, 0.573576, 0.819152, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 324, 1, 6619.86, -5353.58, 760.134, 1.13446, 0, 0, 0.537299, 0.843392, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 324, 1, 7785.89, -4284.32, 693.261, 0.610863, 0, 0, 0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+7, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+8, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+9, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+10, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+11, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+12, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+13, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10),
(@OGUID+14, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+4, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+5, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+6, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+7, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0);

-- Truesilver Deposit / Small Thorium Vein
SET @OGUID = 58122;
SET @PTEMPLATE = 14412;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -8184.28, -1342.96, -215.911, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 1, -7580.82, -1666.22, -264.925, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 1, -6783.65, -2261.43, -243.971, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 1, -6352.3, -1933.49, -267.386, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 324, 1, -6347.17, -912.215, -251.031, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 324, 1, -3808.13, 3028.04, 15.419, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 1, -8184.28, -1342.96, -215.911, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 1, -7580.82, -1666.22, -264.925, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, -6783.65, -2261.43, -243.971, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 1, -6352.3, -1933.49, -267.386, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2047, 1, -6347.17, -912.215, -251.031, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 1, -3808.13, 3028.04, 15.419, 3.38594, 0, 0, -0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+7, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+8, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+9, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+10, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+11, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+12, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+4, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+5, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+6, 1211, 0, 'Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein', 0);

-- Small Thorium Vein in Tanaris
SET @OGUID = 58135;
SET @PTEMPLATE = 1204;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -8998.67, -2266.72, 21.2362, 0.314158, 0, 0, 0.156434, 0.987688, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 1, -8105.63, -4545.38, 22.5823, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 1, -8025.82, -2638.29, -44.5267, 5.93412, 0, 0, -0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Small Thorium Vein - Tanaris', 10),
(@OGUID+2, @PTEMPLATE, 'Small Thorium Vein - Tanaris', 10),
(@OGUID+3, @PTEMPLATE, 'Small Thorium Vein - Tanaris', 10);

-- Truesilver Deposit / Small Thorium Vein in Silithus
SET @OGUID = 58139;
SET @PTEMPLATE = 14419;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 1, -7608.47, 244.193, 13.565, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -7143.75, 663.009, 12.4242, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, -7080.28, 330.513, 14.6361, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 1, -7608.47, 244.193, 13.565, 1.67551, 0, 0, 0.743144, 0.669131, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 324, 1, -7143.75, 663.009, 12.4242, 5.41052, 0, 0, -0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 324, 1, -7080.28, 330.513, 14.6361, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0);

-- Truesilver Deposit / Small Thorium Vein in EPL
SET @OGUID = 58146;
SET @PTEMPLATE = 14423;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 0, 2182.35, -3156, 104.26, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 2673, -3923.74, 123.806, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 2782.94, -3699.49, 107.701, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 0, 2182.35, -3156, 104.26, 0.488691, 0, 0, 0.241921, 0.970296, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 324, 0, 2673, -3923.74, 123.806, 3.54302, 0, 0, -0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 324, 0, 2782.94, -3699.49, 107.701, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1264, 0, 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1264, 0, 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1264, 0, 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein', 0);

-- Truesilver Deposit / Small Thorium Vein in WPL
SET @OGUID = 58153;
SET @PTEMPLATE = 14427;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 2047, 0, 2185.09, -1871.73, 72.2382, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 2410.72, -1453.93, 110.569, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 0, 2185.09, -1871.73, 72.2382, 2.89725, 0, 0, 0.992546, 0.12187, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 0, 2410.72, -1453.93, 110.569, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1,  1331, 0, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 0),
(@PTEMPLATE+2,  1331, 0, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 0);

-- Small Thorium Vein in Searing George
SET @OGUID = 58158;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 324, 0, -7040.06, -1185.06, 255.285, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);

-- Rich Thorium Vein

-- Truesilver Deposit / Rich Thorium Vein in WPL
SET @OGUID = 58160;
SET @PTEMPLATE = 14430;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 3116.42, -1540.37, 150.228, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 3079.41, -1533.49, 150.627, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 0, 3047.89, -1518.56, 161.842, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 3116.42, -1540.37, 150.228, 2.65289, 0, 0, 0.970295, 0.241925, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 3079.41, -1533.49, 150.627, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 3047.89, -1518.56, 161.842, 1.98967, 0, 0, 0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1262, 0, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 0),
(@PTEMPLATE+2, 1262, 0, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 0),
(@PTEMPLATE+3, 1262, 0, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands', 0);

-- Truesilver Deposit / Rich Thorium Vein in EPL
SET @OGUID = 58167;
SET @PTEMPLATE =14434;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 3027.03, -4576.48, 117.661, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 2748.38, -4846.44, 87.5709, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 0, 2509.19, -5086.59, 91.7197, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 175404, 0, 1879.16, -5459.39, 118.915, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 3027.03, -4576.48, 117.661, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 2748.38, -4846.44, 87.5709, 0.977383, 0, 0, 0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 0, 2509.19, -5086.59, 91.7197, 3.194, 0, 0, -0.999657, 0.0262016, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 0, 1879.16, -5459.39, 118.915, 4.50295, 0, 0, -0.777145, 0.629321, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+7, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+8, @PTEMPLATE+4, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+3, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+4, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0);

-- Truesilver Deposit / Rich Thorium Vein in Ungoro
SET @OGUID = 58176;
SET @PTEMPLATE = 14438;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 175404, 1, -7700.99, -519.104, -266.717, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 1, -7563.85, -980.964, -260.45, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 1, -7274.41, -1168.11, -246.12, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, -7700.99, -519.104, -266.717, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 1, -7563.85, -980.964, -260.45, 5.42797, 0, 0, -0.414693, 0.909961, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 1, -7274.41, -1168.11, -246.12, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1217, 0, 'Un\'Goro Crater - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 1217, 0, 'Un\'Goro Crater - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+3, 1217, 0, 'Un\'Goro Crater - Truesilver Deposit / Rich Thorium Vein', 0);

-- Truesilver Deposit / Rich Thorium Vein in Winterspring
SET @OGUID = 58183;
SET @PTEMPLATE = 14442;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 1, 5325.27, -4534.76, 708.286, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 1, 7843.49, -4284.76, 690.4, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, 5325.27, -4534.76, 708.286, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, 7843.49, -4284.76, 690.4, 5.95157, 0, 0, -0.165047, 0.986286, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Winterspring', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1235, 0, 'Winterspring - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 1235, 0, 'Winterspring - Truesilver Deposit / Rich Thorium Vein', 0);

-- Azshara
SET @OGUID = 58188;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 1, 2093.01, -5585.94, -7.77245, 4.29351, 0, 0, -0.83867, 0.54464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 1, 4458.91, -5549.51, 111.424, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 1, 3413.1, -5354.91, 115.967, 2.53072, 0, 0, 0.953716, 0.300708, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 175404, 1, 3601.63, -5412.79, 118.231, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 175404, 1, 3741.3, -5366.5, 99.7494, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+2, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+3, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+4, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+5, 1246, 'Rich Thorium Vein - Azshara', 10);

-- Misc

-- Hillsbrad Foothills - Azurelode Mine
SET @OGUID = 84120;
SET @PTEMPLATE = 14444;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 103711, 0, -796.207, 179.361, 22.4636, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 103711, 0, -772.392, 120.247, 17.784, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 105569, 0, -796.207, 179.361, 22.4636, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 105569, 0, -772.392, 120.247, 17.784, 5.77704, 0, 0, -0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1272, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1272, 0, 'Hillsbrad Foothills - Tin Vein / Silver Vein', 0);

-- Tin Vein (3764)
SET @OGUID = 84125;
SET @PTEMPLATE = 2587;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3764, 1, -1314.38, -3040.59, 83.7026, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3764, 1, -34.0801, -3400.02, 91.6849, 1.46608, 0, 0, 0.66913, 0.743145, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3764, 1, 78.5835, -1962.28, 84.1297, 3.10665, 0, 0, 0.999847, 0.0174693, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3764, 1, 467.337, -1225.43, 110.27, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3764, 1, 545.992, -1100.04, 107.342, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3764, 1, 792.941, -1411.38, 105.288, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10),
(@OGUID+3, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10),
(@OGUID+4, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10),
(@OGUID+5, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10),
(@OGUID+6, @PTEMPLATE, 'Tin Vein (3764) - Barrens', 10);

-- Copper Vein (3763)
SET @OGUID = 84132;
SET @PTEMPLATE = 2588;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3763, 1, -1297.31, -3028.46, 72.4677, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Copper Vein (3763) - Barrens', 10);

-- Gold Vein / Mithril Deposit / Truesilver Deposit in Felwood
SET @OGUID = 84134;
SET @PTEMPLATE = 14447;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176645, 1, 4356.84, -1061.1, 337.485, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 181109, 1, 4356.84, -1061.1, 337.485, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 181108, 1, 4356.84, -1061.1, 337.485, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Truesilver Deposit / Small Thorium Vein in Felwood
SET @OGUID = 84138;
SET @PTEMPLATE = 14448;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 176643, 1, 6615.5, -1016.11, 482.13, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 176643, 1, 6871.38, -1885.74, 555.55, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 181108, 1, 6615.5, -1016.11, 482.13, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 181108, 1, 6871.38, -1885.74, 555.55, 1.27409, 0, 0, 0.594822, 0.803857, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Felwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1232, 0, 'Felwood - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1232, 0, 'Felwood - Truesilver Deposit / Small Thorium Vein', 0);

-- Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein in Ungoro
SET @OGUID = 84143;
SET @PTEMPLATE = 14451;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 123309, 1, -8008.19, -1194.46, -322.1, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 123848, 1, -8008.19, -1194.46, -322.1, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater', 10),
(@OGUID+2, @PTEMPLATE, 'Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 412, 0, 'Un\'Goro Crater - Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein', 0);

-- Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein in Silithus
SET @OGUID = 84146;
SET @PTEMPLATE = 14452;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 123309, 1, -7836.3, 438.322, -30.4315, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 123309, 1, -8134.32, 382.409, -69.2152, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 123309, 1, -7515.65, 1533.93, -54.6314, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 123309, 1, -7414.58, 1333.6, -89.3359, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 177388, 1, -7836.3, 438.322, -30.4315, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 177388, 1, -8134.32, 382.409, -69.2152, 2.68781, 0, 0, 0.97437, 0.224951, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 177388, 1, -7515.65, 1533.93, -54.6314, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 177388, 1, -7414.58, 1333.6, -89.3359, 1.81514, 0, 0, 0.788011, 0.615662, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@PTEMPLATE+2, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@PTEMPLATE+3, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@PTEMPLATE+4, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+4, @PTEMPLATE+4, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+5, @PTEMPLATE+1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+6, @PTEMPLATE+2, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+7, @PTEMPLATE+3, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10),
(@OGUID+8, @PTEMPLATE+4, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+2, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+3, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+4, 1220, 0, 'Silithus - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COPPER

UPDATE `gameobject` SET `position_x`=5214.68, `position_y`=316.013, `position_z`=43.3236, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=363598;
UPDATE `gameobject` SET `position_x`=-3438.17, `position_y`=-1643.46, `position_z`=21.7195, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=34133;
UPDATE `gameobject` SET `position_x`=620.868, `position_y`=-3887.83, `position_z`=29.8135, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=40321;
UPDATE `gameobject` SET `position_x`=2067.76, `position_y`=1119.08, `position_z`=268.52, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=20953;
UPDATE `gameobject` SET `position_x`=-6111.96, `position_y`=-2923.69, `position_z`=401.062, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=30088;
UPDATE `gameobject` SET `position_x`=2270.87, `position_y`=649.895, `position_z`=25.2218, `orientation`=1.97222, `rotation0`=0, `rotation1`=0, `rotation2`=0.833885, `rotation3`=0.551938 WHERE `guid`=5280;
UPDATE `gameobject` SET `position_x`=-5570.23, `position_y`=-1705.6, `position_z`=371.531, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=29619;
UPDATE `gameobject` SET `position_x`=908.046, `position_y`=1309.13, `position_z`=48.4337, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=35497;
UPDATE `gameobject` SET `position_x`=-5247.1, `position_y`=-186.159, `position_z`=442.975, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=29577;
UPDATE `gameobject` SET `position_x`=-5587.96, `position_y`=642.124, `position_z`=385.477, `orientation`=3.33359, `rotation0`=0, `rotation1`=0, `rotation2`=-0.995396, `rotation3`=0.0958512 WHERE `guid`=10000;
UPDATE `gameobject` SET `position_x`=-5564.47, `position_y`=-307.319, `position_z`=365.538, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477159, `rotation3`=0.878817 WHERE `guid`=29338;
UPDATE `gameobject` SET `position_x`=-342.521, `position_y`=1673.51, `position_z`=25.3212, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=42064;
UPDATE `gameobject` SET `position_x`=-10638.4, `position_y`=-1390.38, `position_z`=60.8947, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=30343;
UPDATE `gameobject` SET `position_x`=-10795.9, `position_y`=1266.73, `position_z`=34.3962, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=5346;
UPDATE `gameobject` SET `position_x`=-11189, `position_y`=1550.16, `position_z`=21.2664, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=31947;
UPDATE `gameobject` SET `position_x`=-11133.9, `position_y`=1440.32, `position_z`=59.9664, `orientation`=4.25861, `rotation0`=0, `rotation1`=0, `rotation2`=-0.848047, `rotation3`=0.529921 WHERE `guid`=5128;
UPDATE `gameobject` SET `position_x`=-11120.1, `position_y`=1514.71, `position_z`=25.5972, `orientation`=5.44543, `rotation0`=0, `rotation1`=0, `rotation2`=-0.406736, `rotation3`=0.913546 WHERE `guid`=31946;
UPDATE `gameobject` SET `position_x`=-1582.62, `position_y`=275.626, `position_z`=21.9404, `orientation`=4.03171, `rotation0`=0, `rotation1`=0, `rotation2`=-0.902585, `rotation3`=0.430512 WHERE `guid`=5475;
UPDATE `gameobject` SET `position_x`=-840.207, `position_y`=175.43, `position_z`=-2.1451, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=4803;
UPDATE `gameobject` SET `position_x`=2399.98, `position_y`=569.822, `position_z`=39.9219, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=4662;
UPDATE `gameobject` SET `position_x`=6573.82, `position_y`=-218.569, `position_z`=48.1495, `orientation`=2.9496, `rotation0`=0, `rotation1`=0, `rotation2`=0.995396, `rotation3`=0.0958512 WHERE `guid`=363582;
UPDATE `gameobject` SET `position_x`=-713.669, `position_y`=489.348, `position_z`=82.6661, `orientation`=0.366518, `rotation0`=0, `rotation1`=0, `rotation2`=0.182235, `rotation3`=0.983255 WHERE `guid`=5222;
UPDATE `gameobject` SET `position_x`=-10326.8, `position_y`=1437.81, `position_z`=41.681, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=5252;
UPDATE `gameobject` SET `position_x`=2804.28, `position_y`=742.075, `position_z`=138.342, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=5063;
UPDATE `gameobject` SET `position_x`=512.921, `position_y`=1052.21, `position_z`=107.61, `orientation`=0.244346, `rotation0`=0, `rotation1`=0, `rotation2`=0.121869, `rotation3`=0.992546 WHERE `guid`=5397;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TIN

UPDATE `gameobject` SET `position_x`=2450.75, `position_y`=1557.49, `position_z`=277.38, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid` IN (27255, 27301);
UPDATE `gameobject` SET `position_x`=-11171.6, `position_y`=653.933, `position_z`=40.0183, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid` IN (23366, 23394);
UPDATE `gameobject` SET `position_x`=5661.84, `position_y`=11.5731, `position_z`=68.7362, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.34202 WHERE `guid` IN (365562, 365598);
UPDATE `gameobject` SET `position_x`=-79.3546, `position_y`=21.6975, `position_z`=95.3539, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid` IN (22105, 22058);
UPDATE `gameobject` SET `position_x`=7063.3, `position_y`=-212.508, `position_z`=48.6065, `orientation`=2.86234, `rotation0`=0, `rotation1`=0, `rotation2`=0.990268, `rotation3`=0.139175 WHERE `guid` IN (365555, 365591);

-- Missing Tin Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(57644, 1732, 0, -11525, -484.469, 44.4924, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 57641 at 145.951263 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(57644, 405, 'Tin Veins in Stranglethorn', 10);

-- Missing Tin Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33196, 1732, 0, 225.675, -72.2974, 110.061, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 248.217819 yards.
(42200, 1732, 0, 244.997, -10.5061, 83.3397, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 266.550751 yards.
(33198, 1732, 0, 12.0793, -148.168, 130.97, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 121.186020 yards.
(42201, 1732, 0, -185.258, 375.062, 116.572, 1.02974, 0, 0, 0.492423, 0.870356, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32279 at 69.703323 yards.
(42202, 1732, 0, -161.117, 398.667, 105.474, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32279 at 96.789047 yards.
(42203, 1732, 0, 75.6466, -78.375, 114.581, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33195 at 105.404190 yards.
(42204, 1732, 0, -130.354, -149.858, 120.737, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33195 at 161.181259 yards.

-- Missing Tin Vein spawns in Hillsbrad Foothills. (add to pool 17008)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21297, 1732, 0, -90.0451, -1361.99, 123.778, 3.3685, 0, 0, -0.993571, 0.113208, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 21295 at 143.713776 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(21297, 17008, 'Tin Vein / Silver Vein - Hillsbrad Foothills', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE `pool_entry` = 17008;
UPDATE `pool_gameobject` SET `chance` = 45 WHERE `guid` IN (220453, 21297);
UPDATE `pool_template` SET `description`='Tin Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `entry`=17008;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SILVER

UPDATE `gameobject` SET `position_x`=-11184.5, `position_y`=1488.37, `position_z`=17.4355, `orientation`=5.93412, `rotation0`=0, `rotation1`=0, `rotation2`=-0.173648, `rotation3`=0.984808 WHERE `guid` IN (23402, 23374);

-- Missing Silver Vein spawns in Wetlands. (add to pool 22976)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22913, 1733, 0, -3399.97, -1966.67, 121.708, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22894 at 87.718216 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(22913, 22976, 'Gold Vein / Iron Deposit - Wetlands', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Wetlands' WHERE `pool_entry` = 22976;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Wetlands' WHERE  `entry`=22976;
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `guid` IN (22913, 255260);

-- Missing Silver Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31525, 1733, 0, -11922.4, 306.106, 20.0254, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31518 at 238.059082 yards.
(31526, 1733, 0, -11777.7, -424.371, 27.5906, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31519 at 260.297577 yards.
(427007, 1733, 0, -14099, 318.75, 24.437, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427001 at 1217.330566 yards.
(31528, 1733, 0, -11755.9, -176.016, 23.3022, 2.47837, 0, 0, 0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31519 at 385.885071 yards.
(31529, 1733, 0, -11501, -191.352, 56.1841, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31519 at 294.330200 yards.
(31531, 1733, 0, -11761, -254.122, 28.2692, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31519 at 330.180145 yards.
(427010, 1733, 0, -13894.2, -1.97103, 35.2379, 1.97222, 0, 0, 0.833885, 0.551938, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427001 at 845.748657 yards.
(31532, 1733, 0, -11755.1, -547.294, 23.6612, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 31519 at 239.430054 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(31525, 386, 'Silver Veins in Stranglethorn', 10),
(31526, 386, 'Silver Veins in Stranglethorn', 10),
(427007, 386, 'Silver Veins in Stranglethorn', 10),
(31528, 386, 'Silver Veins in Stranglethorn', 10),
(31529, 386, 'Silver Veins in Stranglethorn', 10),
(31531, 386, 'Silver Veins in Stranglethorn', 10),
(427010, 386, 'Silver Veins in Stranglethorn', 10),
(31532, 386, 'Silver Veins in Stranglethorn', 10);

-- Missing Silver Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427004, 1733, 0, 1302.34, -290.889, 67.2381, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427002 at 463.005371 yards.
(31527, 1733, 0, 545.352, -1686.1, 57.1031, 2.91469, 0, 0, 0.993571, 0.113208, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31524 at 368.350128 yards.
(31530, 1733, 0, 271.415, -259.615, 148.774, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 31522 at 370.721924 yards.
(427013, 1733, 0, 779.732, -346.297, 151.973, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427002 at 359.780090 yards.
(427019, 1733, 0, 627.304, -724.827, 188.74, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427002 at 384.919708 yards.
(427073, 1733, 0, 1003.41, 96.0792, 18.3702, 1.309, 0, 0, 0.608761, 0.793354, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427002 at 736.634888 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427004, 397, 'Silver Veins in Alterac Mountains', 10),
(31527, 397, 'Silver Veins in Alterac Mountains', 10),
(31530, 397, 'Silver Veins in Alterac Mountains', 10),
(427013, 397, 'Silver Veins in Alterac Mountains', 10),
(427019, 397, 'Silver Veins in Alterac Mountains', 10),
(427073, 397, 'Silver Veins in Alterac Mountains', 10);

-- Missing Silver Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22129, 1733, 0, -156.347, -135.198, 114.634, 0.750491, 0, 0, 0.366501, 0.930418, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22101 at 70.879982 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(22129, 1573, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE `pool_entry` = 1573;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=20285;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=22129;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `entry`=1573;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(22130, 1733, 0, -356.236, -1705.29, 96.5566, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 22102 at 295.032501 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(22130, 1567, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE `pool_entry` = 1567;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=20279;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=22130;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `entry`=1567;

-- Missing Silver Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23566, 1733, 1, -5997.79, -3502.85, -55.509, 0.541051, 0, 0, 0.267238, 0.963631, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23546 at 398.603394 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(23566, 3204, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3204;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=27966;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=23566;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3204;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427066, 1733, 1, -5466.35, -2869.42, -44.2802, 6.17847, 0, 0, -0.0523357, 0.99863, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427043 at 386.457886 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427066, 3219, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3219;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=27981;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=427066;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3219;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23567, 1733, 1, -4682.48, -1486.84, -48.1071, 1.50098, 0, 0, 0.681998, 0.731354, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23544 at 58.881893 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(23567, 3243, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3243;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=28005;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=23567;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3243;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(23564, 1733, 1, -5370.03, -3160.29, -25.9727, 5.06146, 0, 0, -0.573576, 0.819152, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23546 at 336.721100 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(23564, 3250, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3250;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=28012;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=23564;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3250;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427307, 1733, 1, -5061.47, -2103.62, -37.6556, 5.79449, 0, 0, -0.241921, 0.970296, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427283 at 139.021362 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427307, 3227, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3227;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=27989;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=427307;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3227;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(251706, 1733, 1, -5127.78, -2299.17, -52.9948, 5.75959, 0, 0, -0.258819, 0.965926, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 251699 at 75.862099 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(251706, 3226, 'Silver Vein / Gold Vein / Iron Deposit - Thousand Needles', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE `pool_entry` = 3226;
UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=27988;
UPDATE `pool_gameobject` SET `chance`=20 WHERE  `guid`=251706;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Thousand Needles' WHERE  `entry`=3226;

-- Missing Silver Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43800, 1733, 1, -1328.47, 2576.41, 116.466, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20855 at 109.725983 yards.
(20865, 1733, 1, -1619.46, 1323.85, 85.8146, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 20863 at 150.197464 yards.
(427042, 1733, 1, -956.861, 1253.08, 111.268, 1.01229, 0, 0, 0.484809, 0.87462, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427003 at 91.542076 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43800, 321, 'Silver Veins in Desolace', 10),
(20865, 321, 'Silver Veins in Desolace', 10),
(427042, 321, 'Silver Veins in Desolace', 10);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GOLD

UPDATE `gameobject` SET `position_x`=-11777.7, `position_y`=-424.371, `position_z`=27.5906, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid` IN (5896, 11969);
UPDATE `gameobject` SET `position_x`=581.203, `position_y`=-703.03, `position_z`=153.828, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=6494;
UPDATE `gameobject` SET `position_x`=648.067, `position_y`=-590.311, `position_z`=164.735, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid` IN (6517, 9907);
UPDATE `gameobject` SET `position_x`=-11754.6, `position_y`=223.55, `position_z`=21.0039, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid` IN (6570, 6545);
UPDATE `gameobject` SET `position_x`=-1002.77, `position_y`=2398.7, `position_z`=101.129, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid` IN (34189, 20849);
UPDATE `gameobject` SET `position_x`=-7967.46, `position_y`=-866.854, `position_z`=-265.65, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`IN (23873, 23856, 23839);

-- Missing Gold Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43801, 1734, 0, -11922.4, 306.106, 20.0254, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32096 at 129.085312 yards.
(43258, 1734, 0, -12906.5, 387.039, 53.7599, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 43256 at 854.948914 yards.
(6571, 1734, 0, -11681.5, 317.656, 43.8298, 5.86431, 0, 0, -0.207911, 0.978148, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6570 at 121.268135 yards.
(43802, 1734, 0, -13796.6, 610.099, 43.7884, 1.0472, 0, 0, 0.5, 0.866025, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 12286 at 418.383362 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43801, 1176, 'Gold Veins in Stranglethorn', 10),
(43258, 1176, 'Gold Veins in Stranglethorn', 10),
(6571, 1176, 'Gold Veins in Stranglethorn', 10),
(43802, 1176, 'Gold Veins in Stranglethorn', 10);

-- Missing Gold Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43803, 1734, 0, 264.654, -44.6943, 124.458, 5.11382, 0, 0, -0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10622 at 205.485077 yards.
(6488, 1734, 0, 502.952, -1391.69, 72.4759, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6487 at 492.425018 yards.
(6489, 1734, 0, 444.871, -1604.78, 68.803, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 6487 at 701.278015 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43803, 1353, 'Gold Veins in Alterac Mountains', 10),
(6488, 1353, 'Gold Veins in Alterac Mountains', 10),
(6489, 1353, 'Gold Veins in Alterac Mountains', 10);

-- Missing Gold Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34192, 1734, 1, -1352.43, 891.679, 112.672, 1.51844, 0, 0, 0.688354, 0.725374, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 34191 at 486.300842 yards.
(34200, 1734, 1, -1367.99, 1272.66, 105.93, 0.925024, 0, 0, 0.446198, 0.894935, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34194 at 257.414429 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34192, 1347, 'Gold Veins in Desolace', 10),
(34200, 1347, 'Gold Veins in Desolace', 10);

-- Missing Gold Vein spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34589, 1734, 0, -1819.15, -2011.03, 66.5258, 2.02458, 0, 0, 0.848047, 0.529921, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34445 at 109.545471 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34589, 2466, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE `pool_entry` = 2466;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=34589;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=28144;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE  `entry`=2466;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427450, 1734, 0, -1824.19, -1799.81, 60.5315, 1.79769, 0, 0, 0.782608, 0.622515, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427428 at 157.990891 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427450, 2465, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE `pool_entry` = 2465;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=28143;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427450;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE  `entry`=2465;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427481, 1734, 0, -1848.64, -1760.39, 67.3599, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427428 at 112.066521 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427481, 2462, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE `pool_entry` = 2462;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=28140;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427481;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands' WHERE  `entry`=2462;

-- Missing Gold Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20295, 1734, 0, -1171.69, -1305.33, 86.2144, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 20264 at 57.301006 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(20295, 1503, 'Tin Vein / Silver Vein / Gold Vein - Hillsbrad Foothills', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Gold Vein - Hillsbrad Foothills' WHERE `pool_entry` = 1503;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=22035;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=20295;
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein / Gold Vein - Hillsbrad Foothills' WHERE  `entry`=1503;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IRON

UPDATE `gameobject` SET `position_x`=-11777.7, `position_y`=-424.371, `position_z`=27.5906, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid` IN (11969, 5896);
UPDATE `gameobject` SET `position_x`=-14071.1, `position_y`=126.637, `position_z`=23.9541, `orientation`=0.855211, `rotation0`=0, `rotation1`=0, `rotation2`=0.414693, `rotation3`=0.909961 WHERE `guid`=6137;
UPDATE `gameobject` SET `position_x`=-956.861, `position_y`=1253.08, `position_z`=111.268, `orientation`=1.01229, `rotation0`=0, `rotation1`=0, `rotation2`=0.484809, `rotation3`=0.87462 WHERE `guid`=6669;
UPDATE `gameobject` SET `position_x`=-11754.6, `position_y`=223.55, `position_z`=21.0039, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`IN (6545, 6570);
UPDATE `gameobject` SET `position_x`=-2985.63, `position_y`=-3170.38, `position_z`=58.5365, `orientation`=4.95674, `rotation0`=0, `rotation1`=0, `rotation2`=-0.615661, `rotation3`=0.788011 WHERE `guid` IN (255272, 255263);

-- Missing Iron Deposit spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427162, 1735, 1, -2525.41, -3510.83, 50.4315, 1.72787, 0, 0, 0.760406, 0.649449, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427140 at 109.461227 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427162, 43520, 'Iron Deposits in Dustwallow Marsh', 10);

-- Missing Iron Deposit spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(389473, 1735, 0, -13946.2, 220.203, 18.3835, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 389462 at 49.843273 yards.
(43804, 1735, 0, -11919.8, 178.668, 40.417, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 32486 at 129.085312 yards.
(43805, 1735, 0, -12741.6, -451.591, 32.6192, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 29533 at 165.302887 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(389473, 1175, 'Iron Deposits in Stranglethorn', 10),
(43804, 1175, 'Iron Deposits in Stranglethorn', 10),
(43805, 1175, 'Iron Deposits in Stranglethorn', 10);

-- Missing Iron Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43806, 1735, 0, -71.7572, -460.453, 102.154, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 35396 at 242.846436 yards.
(427153, 1735, 0, 995.454, -632.881, 124.128, 2.56563, 0, 0, 0.958819, 0.284016, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427132 at 121.343155 yards.
(10572, 1735, 0, 412.711, -672.618, 179.944, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10571 at 207.291656 yards.
(10573, 1735, 0, 595.001, -651.02, 153.667, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10571 at 22.153973 yards.
(43807, 1735, 0, 581.203, -703.03, 153.828, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 33182 at 41.961742 yards.
(427184, 1735, 0, 247.102, -286.261, 153.984, 1.23918, 0, 0, 0.580703, 0.814116, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427121 at 13.477481 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43806, 1068, 'Iron Deposits in Alterac Mountains', 10),
(427153, 1068, 'Iron Deposits in Alterac Mountains', 10),
(10572, 1068, 'Iron Deposits in Alterac Mountains', 10),
(10573, 1068, 'Iron Deposits in Alterac Mountains', 10),
(43807, 1068, 'Iron Deposits in Alterac Mountains', 10),
(427184, 1068, 'Iron Deposits in Alterac Mountains', 10);

-- Missing Iron Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43817, 1735, 1, -857.031, 1367.46, 74.1345, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 10589 at 133.737106 yards.
(43808, 1735, 1, -1628.29, 1604.64, 91.5897, 1.90241, 0, 0, 0.814116, 0.580703, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 6253 at 114.213814 yards.
(10249, 1735, 1, -1636.06, 2065.69, 75.1803, 5.81195, 0, 0, -0.233445, 0.97237, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 10248 at 303.454742 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43817, 1141, 'Iron Deposits in Desolace', 10),
(43808, 1141, 'Iron Deposits in Desolace', 10),
(10249, 1141, 'Iron Deposits in Desolace', 10);

-- Missing Iron Deposit spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34146, 1735, 0, -2993.18, -3294.01, 58.3186, 5.89921, 0, 0, -0.190808, 0.981627, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34144 at 42.027134 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34146, 2820, 'Tin Vein / Silver Vein / Iron Deposit - Wetlands', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Wetlands' WHERE `pool_entry` = 2820;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=22871;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=34146;
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Wetlands' WHERE  `entry`=2820;

-- Missing Iron Deposit spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28419, 1735, 1, 471.047, 1521.84, 31.6324, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 28372 at 64.179543 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(28419, 2299, 'Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains' WHERE `pool_entry` = 2299;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=27218;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=28419;
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains' WHERE  `entry`=2299;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427323, 1735, 1, 2450.95, 1559.48, 277.567, 2.86234, 0, 0, 0.990268, 0.139175, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427315 at 172.371429 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427323, 2336, 'Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains' WHERE `pool_entry` = 2336;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=27255;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427323;
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Stonetalon Mountains' WHERE  `entry`=2336;

-- Missing Iron Deposit spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55703, 1735, 1, 2006.29, -2638.44, 107.348, 2.49582, 0, 0, 0.948323, 0.317306, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55688 at 244.403961 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(55703, 9287, 'Tin Vein / Silver Vein / Iron Deposit - Ashenvale', 10);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Ashenvale' WHERE `pool_entry` = 9287;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=55767;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=55703;
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein / Iron Deposit - Ashenvale' WHERE  `entry`=9287;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MITHRIL

UPDATE `gameobject` SET `position_x`=-12932, `position_y`=316.983, `position_z`=23.4552, `orientation`=0.314158, `rotation0`=0, `rotation1`=0, `rotation2`=0.156434, `rotation3`=0.987688 WHERE `guid`=7221;
UPDATE `gameobject` SET `position_x`=-3517.99, `position_y`=1857.62, `position_z`=74.4841, `orientation`=4.60767, `rotation0`=0, `rotation1`=0, `rotation2`=-0.743144, `rotation3`=0.669131 WHERE `guid` IN (21378, 21352);
UPDATE `gameobject` SET `position_x`=-7967.46, `position_y`=-866.854, `position_z`=-265.65, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477159, `rotation3`=0.878817 WHERE `guid`IN (23856, 23873, 23839);
UPDATE `gameobject` SET `position_x`=-12851.3, `position_y`=268.715, `position_z`=19.0539, `orientation`=1.69297, `rotation0`=0, `rotation1`=0, `rotation2`=0.748956, `rotation3`=0.66262 WHERE `guid`=7176;

-- Missing Mithril Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(220841, 2040, 1, 4004.27, -5020.26, 144.709, 3.14159, 0, 0, -1, 0, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 220836 at 113.411591 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220841, 1329, 'Mithril Deposits in Azshara', 10);

-- Missing Mithril Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(220432, 2040, 0, 742.411, -759.57, 179.781, 0.122173, 0, 0, 0.0610485, 0.998135, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220408 at 96.843605 yards.
(220454, 2040, 0, 582.789, -746.925, 152.998, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220411 at 24.048382 yards.
(387421, 2040, 0, 759.1, -212.715, 145.379, 1.39626, 0, 0, 0.642787, 0.766045, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 387420 at 149.046204 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220432, 1069, 'Mithril Deposits in Alterac Mountains', 10),
(220454, 1069, 'Mithril Deposits in Alterac Mountains', 10),
(387421, 1069, 'Mithril Deposits in Alterac Mountains', 10);

-- Missing Mithril Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(220455, 2040, 1, -2118.6, 1952.15, 73.0367, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 220405 at 112.664383 yards.
(43809, 2040, 1, -1930.25, 1766.63, 74.6961, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 7060 at 5.517547 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(220455, 1146, 'Mithril Deposits in Desolace', 10),
(43809, 1146, 'Mithril Deposits in Desolace', 10);

-- Missing Mithril Deposit spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427574, 2040, 0, 487.049, -4189.84, 135.667, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427572 at 97.712212 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427574, 17052, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit - Hinterlands', 10);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit - Hinterlands' WHERE `pool_entry` = 17052;
UPDATE `pool_gameobject` SET `chance`=40 WHERE  `guid`=427072;
UPDATE `pool_gameobject` SET `chance`=40 WHERE  `guid`=427574;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427071;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427070;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit - Hinterlands' WHERE  `entry`=17052;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRUESILVER

-- Missing Truesilver Deposit spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43810, 2047, 1, 4689.64, -5369.46, 118.006, 6.00393, 0, 0, -0.139173, 0.990268, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48486 at 1134.194092 yards.
(14128, 2047, 1, 3801.09, -4842.9, 158.188, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14127 at 1291.380615 yards.
(14129, 2047, 1, 2930.96, -4063.48, 121.14, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14127 at 123.712982 yards.
(14130, 2047, 1, 3036.39, -4058.49, 123.179, 1.25664, 0, 0, 0.587785, 0.809017, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 14127 at 217.791107 yards.
(43811, 2047, 1, 4373.93, -6309.83, 96.4017, 2.18166, 0, 0, 0.887011, 0.461749, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 48486 at 366.321930 yards.
(43812, 2047, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 48486 at 1301.465210 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43810, 1244, 'Truesilver Deposits in Azshara', 10),
(14128, 1244, 'Truesilver Deposits in Azshara', 10),
(14129, 1244, 'Truesilver Deposits in Azshara', 10),
(14130, 1244, 'Truesilver Deposits in Azshara', 10),
(43811, 1244, 'Truesilver Deposits in Azshara', 10),
(43812, 1244, 'Truesilver Deposits in Azshara', 10);

-- Missing Truesilver Deposit spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43813, 2047, 0, -12851.3, 268.715, 19.0539, 1.69297, 0, 0, 0.748956, 0.66262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11679 at 1021.360413 yards.
(43814, 2047, 0, -13258.2, -211.438, 35.7719, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 11679 at 896.735352 yards.
(43815, 2047, 0, -13118.3, 164.409, 42.8251, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 11679 at 792.008057 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43813, 1178, 'Truesilver Deposits in Stranglethorn', 10),
(43814, 1178, 'Truesilver Deposits in Stranglethorn', 10),
(43815, 1178, 'Truesilver Deposits in Stranglethorn', 10);

-- Missing Truesilver Deposit spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(87882, 2047, 0, 669.802, -606.522, 163.762, 2.1293, 0, 0, 0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 87879 at 170.153992 yards.
(87883, 2047, 0, 444.605, -80.3419, 149.462, 4.95674, 0, 0, -0.615661, 0.788011, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 87881 at 164.124237 yards.
(87884, 2047, 0, 722.529, -660.758, 161.868, 3.29869, 0, 0, -0.996917, 0.0784664, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 87879 at 102.371796 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(87882, 407, 'Truesilver Deposits in Alterac Mountains', 10),
(87883, 407, 'Truesilver Deposits in Alterac Mountains', 10),
(87884, 407, 'Truesilver Deposits in Alterac Mountains', 10);

-- Missing Truesilver Deposit spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427554, 2047, 1, -2073.42, 2055.29, 76.7987, 0.645772, 0, 0, 0.317305, 0.948324, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427552 at 101.141380 yards.
(427559, 2047, 1, -1777.43, 1765.9, 83.9239, 1.06465, 0, 0, 0.507538, 0.861629, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427552 at 315.075500 yards.
(14091, 2047, 1, -2142.28, 2611.28, 29.1127, 1.20428, 0, 0, 0.566406, 0.824126, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 14090 at 180.369843 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427554, 1147, 'Truesilver Deposits in Desolace', 10),
(427559, 1147, 'Truesilver Deposits in Desolace', 10),
(14091, 1147, 'Truesilver Deposits in Desolace', 10);

-- Missing Truesilver Deposit spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427570, 2047, 0, -11347.9, -2880.95, 12.63, 3.90954, 0, 0, -0.927183, 0.374608, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427569 at 81.730583 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427570, 21621, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands' WHERE `pool_entry` = 21621;
UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid`=27190;
UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid`=427570;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands' WHERE  `entry`=21621;

-- Missing Truesilver Deposit spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26370, 2047, 0, -6727.07, -1085.87, 185.576, 0.994837, 0, 0, 0.477159, 0.878817, 300, 300, 1, 100, 5, 10); -- Closest existing guid is 26367 at 102.620529 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(26370, 4053, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4053;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE  `entry`=4053;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26371, 2047, 0, -7040.85, -1749.85, 259.663, 0.104719, 0, 0, 0.0523357, 0.99863, 300, 300, 1, 100, 5, 10); -- Closest existing guid is 26365 at 8.728897 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(26371, 4027, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4027;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE  `entry`=4027;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26372, 2047, 0, -6560.44, -824.799, 297.716, 3.6652, 0, 0, -0.965925, 0.258821, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26362 at 104.411003 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(26372, 4086, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4086;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George' WHERE  `entry`=4086;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43816, 2047, 0, -6612.19, -721.802, 248.035, 4.10153, 0, 0, -0.887011, 0.461749, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 26354 at 183.764740 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(43816, 4076, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George', 10);
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George' WHERE `pool_entry` = 4076;
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George' WHERE  `entry`=4076;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SMALL THORIUM

UPDATE `gameobject` SET `position_x`=1632.36, `position_y`=-2385.01, `position_z`=73.8914, `orientation`=0.558504, `rotation0`=0, `rotation1`=0, `rotation2`=0.275637, `rotation3`=0.961262 WHERE `guid` IN (261426, 261407);
UPDATE `gameobject` SET `position_x`=2207.13, `position_y`=-1719.47, `position_z`=81.9363, `orientation`=1.50098, `rotation0`=0, `rotation1`=0, `rotation2`=0.681998, `rotation3`=0.731354 WHERE `guid` IN (261431, 261412);
UPDATE `gameobject` SET `position_x`=-7509.1, `position_y`=1091.58, `position_z`=-1.2318, `orientation`=-0.803857, `rotation0`=0, `rotation1`=0, `rotation2`=-0.803857, `rotation3`=0.594823 WHERE `guid` IN (23530, 23501);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DARK IRON
UPDATE `gameobject` SET `position_x`=-7890.92, `position_y`=-2537.66, `position_z`=129.832, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid` IN (31233, 31197, 31161);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RICH THORIUM

UPDATE `gameobject` SET `position_x`=-6947.93, `position_y`=-411.617, `position_z`=-268.135, `orientation`=2.93214, `rotation0`=0, `rotation1`=0, `rotation2`=0.994521, `rotation3`=0.104536 WHERE `guid` IN (21180, 21169);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LESSER BLOODSTONE

UPDATE `gameobject` SET `position_x`=-882.01, `position_y`=-3885.88, `position_z`=135.174, `orientation`=2.9845, `rotation0`=0, `rotation1`=0, `rotation2`=0.996917, `rotation3`=0.0784664 WHERE `guid`=25338;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BARRENS

UPDATE `gameobject` SET `position_x`=-1334.28, `position_y`=-3164.35, `position_z`=96.3886, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=40202;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FELWOOD

UPDATE `gameobject` SET `position_x`=6187.7, `position_y`=-1992.97, `position_z`=598.183, `orientation`=1.64061, `rotation0`=0, `rotation1`=0, `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid` IN (170050, 170080);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SMALL THORIUM GARRISON

-- Missing Small Thorium Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28616, 150082, 0, -10594.3, -3199.24, 10.6181, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28533 at 50.573498 yards.
(28617, 150082, 0, -10732.7, -3276.7, -10.6695, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28534 at 118.500000 yards.
(28618, 150082, 0, -10736.8, -3450.88, -15.9763, 0.59341, 0, 0, 0.292371, 0.956305, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28535 at 131.073730 yards.
(28619, 150082, 0, -10702.7, -3170.85, 24.7436, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 28528 at 76.376228 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(28616, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28617, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28618, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28619, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MITHRIL GARRISON

-- Missing Mithril Deposit spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(28620, 150079, 0, -10625, -3655, -15.6897, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28537 at 70.261040 yards.
(28621, 150079, 0, -10705.5, -3127.19, 29.0701, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28541 at 69.681274 yards.
(28622, 150079, 0, -10818.7, -3475.05, -21.4749, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28543 at 180.995743 yards.
(28623, 150079, 0, -10613, -3328.92, -7.07186, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28543 at 76.930832 yards.
(28624, 150079, 0, -10780.1, -3291.37, -10.1236, 3.78737, 0, 0, -0.948323, 0.317306, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 28543 at 156.411591 yards.
(28625, 150079, 0, -10661.6, -3303.15, -9.63558, 4.60767, 0, 0, -0.743144, 0.669131, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 28543 at 87.271095 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(28620, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28621, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28622, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28623, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28624, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10),
(28625, 22910, 'Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory', 10);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Tin Vein spawns in Duskwood.
SET @OGUID = 27310;
SET @PTEMPLATE = 2855;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -11185.4, -756.179, 62.4482, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 23285 at 80.042374 yards.
(@OGUID+2, 1733, 0, -11185.4, -756.179, 62.4482, 4.17134, 0, 0, -0.870356, 0.492424, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 23285 at 80.042374 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Silver Vein spawns in The Barrens. (remove gobject 41985 from pool 25787 and pool together)
SET @PTEMPLATE = 2856;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34735, 1733, 1, -1853.02, -1887.78, 98.8276, 1.93731, 0, 0, 0.824125, 0.566408, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 34688 at 218.718826 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Barrens', 10);
DELETE FROM `pool_gameobject` WHERE `guid` = 41985;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34735, @PTEMPLATE, 'Tin Vein / Silver Vein - Barrens', 10),
(41985, @PTEMPLATE, 'Tin Vein / Silver Vein - Barrens', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Silver Vein spawns in Silverpine Forest.
SET @PTEMPLATE = 2857;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16857, 1733, 0, 192.598, 601.971, 50.1232, 2.40855, 0, 0, 0.93358, 0.358368, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 16829 at 84.169327 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
DELETE FROM `pool_gameobject` WHERE `guid` = 9687;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(16857, @PTEMPLATE, 'Tin Vein / Silver Vein - Silverpine Forest', 10),
(9687, @PTEMPLATE, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427016, 1733, 0, 404.157, 1015.15, 108.756, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427015 at 173.235062 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
DELETE FROM `pool_gameobject` WHERE `guid` = 42061;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427016, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Silverpine Forest', 10),
(42061, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(427069, 1733, 0, 394.553, 1004.06, 108.397, 4.81711, 0, 0, -0.66913, 0.743145, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427015 at 170.976593 yards.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
DELETE FROM `pool_gameobject` WHERE `guid` = 251530;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(427069, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Silverpine Forest', 10),
(251530, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Silverpine Forest', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+2, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Missing Silver Vein / Gold Vein / Iron Deposit spawns in Ashenvale.
SET @OGUID = 27313;
SET @PTEMPLATE = 2860;

DELETE FROM `gameobject` WHERE `guid` IN (55688, 55697, 55676, 55690, 55695);
DELETE FROM `pool_gameobject` WHERE `guid` IN (55688, 55697, 55676, 55690, 55695);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 1, 2185.05, -2803.73, 128.734, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427021 at 80.155540 yards.
(@OGUID+2, 1733, 1, 2480.12, -2480.06, 183.31, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5715 at 125.684624 yards.
(@OGUID+3, 1733, 1, 1470.32, -2110.5, 96.8607, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5745 at 17.269676 yards.
(@OGUID+4, 1733, 1, 2810.71, -1888.54, 194.402, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5925 at 405.831543 yards.
(@OGUID+5, 1733, 1, 1737.65, -3504.75, 144.517, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427336 at 353.134094 yards.
(@OGUID+6, 1734, 1, 2185.05, -2803.73, 128.734, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427021 at 80.155540 yards.
(@OGUID+7, 1734, 1, 2480.12, -2480.06, 183.31, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5715 at 125.684624 yards.
(@OGUID+8, 1734, 1, 1470.32, -2110.5, 96.8607, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5745 at 17.269676 yards.
(@OGUID+9, 1734, 1, 2810.71, -1888.54, 194.402, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5925 at 405.831543 yards.
(@OGUID+10, 1734, 1, 1737.65, -3504.75, 144.517, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427336 at 353.134094 yards.
(@OGUID+11, 1735, 1, 2185.05, -2803.73, 128.734, 1.16937, 0, 0, 0.551936, 0.833886, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 427021 at 80.155540 yards.
(@OGUID+12, 1735, 1, 2480.12, -2480.06, 183.31, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5715 at 125.684624 yards.
(@OGUID+13, 1735, 1, 1470.32, -2110.5, 96.8607, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5745 at 17.269676 yards.
(@OGUID+14, 1735, 1, 2810.71, -1888.54, 194.402, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 5925 at 405.831543 yards.
(@OGUID+15, 1735, 1, 1737.65, -3504.75, 144.517, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 427336 at 353.134094 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+6, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+7, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+8, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+9, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+10, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+11, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+12, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+13, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+14, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10),
(@OGUID+15, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 1351, 0, 'Ashenvale - Silver Vein / Gold Vein / Iron Deposit', 0);


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Missing Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George
SET @OGUID = 27329;
SET @PTEMPLATE = 2866;

DELETE FROM `gameobject` WHERE `guid` = 29701;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+2, 1734, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+3, 1734, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+4, 1734, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+5, 2040, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+6, 2040, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+7, 2040, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+8, 2040, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+9, 165658, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+10, 165658, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+11, 165658, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+12, 165658, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+13, 324, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+14, 324, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+15, 324, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10), -- Closest existing guid is 38494 at 143.071548 yards.
(@OGUID+16, 324, 0, -6892.15, -851.136, 260.943, 2.80998, 0, 0, 0.986285, 0.16505, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 38494 at 143.071548 yards.

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+5, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+6, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+7, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+8, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+9, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+10, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+11, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+12, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
