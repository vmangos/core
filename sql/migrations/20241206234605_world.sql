DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241206234605');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241206234605');
-- Add your query below.


-- Arathi Cannon Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(577, 113529, 0, -2071.66, -2020.84, 12.8919, 5.41052, 0, 0, -0.422618, 0.906308, 180, 180, 100, 1, 0, 10); -- Arathi Highlands
UPDATE `gameobject_template` SET `data10`=0 WHERE `entry`=113531;

-- Stone of Binding
DELETE FROM `gameobject` WHERE `id`=141812;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(42474, 141812, 0, -11855.1, -2959.74, 10.3145, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 1, 100),
(42469, 141812, 0, -11763.8, -3049.82, 15.8468, 0.401425, 0, 0, 0.199368, 0.979925, 300, 300, 1, 100),
(42471, 141812, 0, -11697, -3096.81, 17.242, 3.00195, 0, 0, 0.997563, 0.0697661, 300, 300, 1, 100),
(42478, 141812, 0, -11666.4, -3184.9, 16.6786, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100),
(42479, 141812, 0, -11683.2, -3252.66, 14.6128, 1.32645, 0, 0, 0.615661, 0.788011, 300, 300, 1, 100),
(42437, 141812, 0, -11719.9, -3324.45, 16.3167, 5.98648, 0, 0, -0.147809, 0.989016, 300, 300, 1, 100),
(42476, 141812, 0, -11899.7, -3025.95, 21.0243, 5.88176, 0, 0, -0.199368, 0.979925, 300, 300, 1, 100),
(42465, 141812, 0, -11815.3, -3377.41, 7.89995, 0.767944, 0, 0, 0.374606, 0.927184, 300, 300, 1, 100),
(42477, 141812, 0, -11844.8, -3357.05, 7.89991, 4.5204, 0, 0, -0.771625, 0.636078, 300, 300, 1, 100);

-- forcefield
UPDATE `gameobject` SET `position_x`=-518.154, `position_y`=-85.2353, `position_z`=-74.488, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=399323;

-- Elevator
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(732, 152614, 1, -9665.58, -5645.32, -490.159, 0.445059, 0, 0, 0.220697, 0.975342, 25, 25, 100, 1, 0, 10); -- Tanaris
UPDATE `gameobject` SET `position_x`=-11341.3, `position_y`=-4760.17, `position_z`=19.0981, `orientation`=2.37364, `rotation0`=0, `rotation1`=0, `rotation2`=0.927183, `rotation3`=0.374608 WHERE `guid`=93886;

-- Azsharite Formation
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(51209, 152622, 1, 2678.63, -6335.86, 95.0077, 3.194, 0, 0, -0.999657, 0.0262016, 180, 180, 100, 1, 0, 10),
(51210, 152631, 1, 2678.63, -6335.86, 95.0077, 3.194, 0, 0, -0.999657, 0.0262016, 180, 180, 100, 1, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (51209, 3600, 0, 'Azsharite Formation - Azshara', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (51210, 3600, 0, 'Azsharite Formation - Azshara', 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (3600, 1, 'Azsharite Formation - Azshara', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (3600, 3815, 0, 'Azsharite Formation - Azshara', 0);

-- Rune of the Defiler
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(751, 153204, 0, -11208.5, -2960.48, 9.29594, 5.16618, 0, 0, -0.529919, 0.848048, 900, 900, 100, 1, 0, 10), -- Blasted Lands
(752, 153204, 0, -11079.8, -2855.81, 10.9242, 6.10865, 0, 0, -0.0871553, 0.996195, 900, 900, 100, 1, 0, 10), -- Blasted Lands
(754, 153204, 0, -11204.6, -2730.84, 15.2066, 0.0349062, 0, 0, 0.0174522, 0.999848, 900, 900, 100, 1, 0, 10), -- Blasted Lands
(764, 153204, 0, -11337.4, -2848.64, 9.61797, 3.45576, 0, 0, -0.987688, 0.156436, 900, 900, 100, 1, 0, 10); -- Blasted Lands

-- Rune of Return
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(765, 153359, 0, -11184.4, -2834.53, 116.978, 4.03171, 0, 0, -0.902585, 0.430512, 180, 180, 100, 1, 0, 10); -- Blasted Lands

-- Rune of Return
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(767, 153360, 0, -11184.6, -2834.55, 116.575, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 10), -- Blasted Lands
(769, 153360, 0, -11184.4, -2834.53, 116.978, 4.03171, 0, 0, -0.902585, 0.430512, 180, 180, 100, 1, 0, 10); -- Blasted Lands

-- Gor'tesh's Lopped Off Head
UPDATE `gameobject` SET `position_x`=-7944.79, `position_y`=-2638.81, `position_z`=218.717, `orientation`=1.98967, `rotation0`=0, `rotation1`=0, `rotation2`=0.83867, `rotation3`=0.54464 WHERE `guid`=98643;

-- Samophlange
UPDATE `gameobject` SET `position_x`=858.994, `position_y`=-2346.49, `position_z`=92.5872, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=6579;
UPDATE `gameobject` SET `position_x`=-900.611, `position_y`=-3758.95, `position_z`=11.3319, `orientation`=5.07891, `rotation0`=0, `rotation1`=0, `rotation2`=-0.566406, `rotation3`=0.824126 WHERE `guid`=6552;

-- Miblon's Door
UPDATE `gameobject` SET `position_x`=-2848.59, `position_y`=2339.68, `position_z`=40.262, `orientation`=1.85005, `rotation0`=0, `rotation1`=0, `rotation2`=0.798635, `rotation3`=0.601815 WHERE `guid`=17428;

-- Smoke Emitter 02
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(817, 164870, 30, -1250.9, -311.025, 77.1771, 0.366518, 0, 0, 0.182235, 0.983255, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Thunderbrew Lager Keg
UPDATE `gameobject` SET `position_x`=915.2, `position_y`=-148.373, `position_z`=-49.7569, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=43097;
UPDATE `gameobject` SET `position_x`=913.62, `position_y`=-148.629, `position_z`=-49.7571, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=43099;

-- JD Yellow Crystal 1
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(169, 164927, 1, -6026.55, -1021.78, -217.151, 0.174532, 0, 0, 0.0871553, 0.996195, -10, -10, 1, 100);
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3941, 10, 9, 169, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: Respawn GameObject JD Yellow Crystal 1');

-- Zukk'ash Pod
UPDATE `gameobject` SET `position_x`=-5318.97, `position_y`=433.019, `position_z`=15.4401, `orientation`=5.48033, `rotation0`=0, `rotation1`=0, `rotation2`=-0.390731, `rotation3`=0.920505 WHERE `guid`=50015;

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(842, 165587, 0, 1431.33, -2809.98, -59.7745, 3.62156, 0, 0, -0.971342, 0.237686, 180, 180, 100, 1, 0, 10); -- Western Plaguelands

-- Dark Iron Deposit
UPDATE `gameobject` SET `position_x`=-6718.6, `position_y`=-1252.82, `position_z`=183.493, `orientation`=0.139624, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697556, `rotation3`=0.997564 WHERE `guid`=38499;
UPDATE `gameobject` SET `position_x`=418.63, `position_y`=-158.696, `position_z`=-63.1528, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=43750;

-- Chest of The Seven
UPDATE `gameobject` SET `position_x`=1265.85, `position_y`=-285.098, `position_z`=-78.2193, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=399065;

-- J.D.'s Manual
UPDATE `gameobject` SET `position_x`=-6036.81, `position_y`=-1016.01, `position_z`=-216.879, `orientation`=0.0174525, `rotation0`=0, `rotation1`=0, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=63180;

-- Doodad_Drake_Rider_portcullis
UPDATE `gameobject` SET `position_x`=194.235, `position_y`=-420.225, `position_z`=110.761, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=258803;

-- Bijou's Belongings
UPDATE `gameobject` SET `position_x`=33.7166, `position_y`=-466.067, `position_z`=-18.4651, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=10251;

-- Doodad_DarkIronBrazier01
UPDATE `gameobject` SET `position_x`=100.257, `position_y`=-313.14, `position_z`=66.5453, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=397168;

-- Doodad_DarkIronBrazier02
UPDATE `gameobject` SET `position_x`=100.257, `position_y`=-324.88, `position_z`=66.5453, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=397169;

-- Doodad_DarkIronBrazier03
UPDATE `gameobject` SET `position_x`=110.215, `position_y`=-324.88, `position_z`=68.0355, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=397171;

-- Doodad_DarkIronBrazier04
UPDATE `gameobject` SET `position_x`=110.215, `position_y`=-313.14, `position_z`=68.0355, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=397170;

-- Doodad_DarkIronBrazier05
UPDATE `gameobject` SET `position_x`=120.462, `position_y`=-324.88, `position_z`=73.5331, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=397172;

-- Blazing Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1998, 175591, 1, -4996.21, -2235.8, -52.611, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Thousand Needles

-- Dark Iron Dwarf Corpse
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2067, 175607, 229, 20.4895, -438.857, -18.7827, 4.01426, 0, 0, -0.906307, 0.422619, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Dark Iron Dwarf Corpse
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2068, 175608, 229, 23.8203, -440.806, -18.7587, 1.43117, 0, 0, 0.656058, 0.75471, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Dark Iron Dwarf Corpse
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2069, 175609, 229, 23.7352, -445.173, -18.935, 2.11185, 0, 0, 0.870356, 0.492424, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(2070, 175609, 229, 25.9651, -443.545, -18.9203, 3.52557, 0, 0, -0.981627, 0.190812, 180, 180, 100, 1, 0, 10), -- Blackrock Spire
(2071, 175609, 229, 20.9914, -443.119, -18.9183, 1.0821, 0, 0, 0.515038, 0.857168, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Challenge to Urok
DELETE FROM `event_scripts` WHERE `id`=4845;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4845, 0, 0, 76, 175584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -14.3415, -395.729, 48.5381, 2.86234, 0, 'Challenge to Urok - Summon GameObject Challenge to Urok');

-- Urok's Tribute Pile
UPDATE `gameobject` SET `position_x`=-14.3501, `position_y`=-395.828, `position_z`=48.5065, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=324139;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
