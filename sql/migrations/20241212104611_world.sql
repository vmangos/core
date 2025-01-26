DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241212104611');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241212104611');
-- Add your query below.


-- Remove wrong Campfire spawns.
DELETE FROM `gameobject` WHERE `guid` IN (3998307, 3998308, 3998309, 3998310);

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2402, 176428, 229, -63.2568, -581.483, 29.2934, 3.14169, 0.0295649, -0.0015707, -0.999561, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2403, 176429, 229, -37.6863, -551.822, 16.2163, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2409, 176430, 229, -25.3349, -478.438, 17.2504, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2410, 176431, 229, -46.3865, -448.61, -18.5644, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2411, 176432, 229, -2.64242, -579.144, -18.7609, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2412, 176433, 229, 26.982, -583.365, -18.5153, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2413, 176434, 229, 35.6424, -550.73, -18.411, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2414, 176435, 229, 33.1643, -471.047, -18.5059, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2417, 176436, 229, 31.9839, -495.349, -18.8984, 3.14444, 0.00822973, -0.0190172, -0.999784, 0.00126859, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2418, 176437, 229, -39.3852, -424.878, -18.8471, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2419, 176439, 229, -76.0975, -418.801, -18.9234, 4.45059, 0, 0, -0.793352, 0.608763, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2421, 176440, 229, -59.9712, -409.641, -18.8443, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2423, 176441, 229, -79.5309, -453.927, -18.8332, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2424, 176442, 229, -15.4378, -368.781, 49.4936, 3.14085, -0.0333757, -0.0110826, 0.999381, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2425, 176443, 229, -121.137, -296.445, 71.0397, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2426, 176444, 229, -137.264, -305.605, 70.9606, 4.45059, 0, 0, -0.793352, 0.608763, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Bonfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2427, 176445, 229, -59.1198, -339.829, 70.9606, 4.45059, 0, 0, -0.793352, 0.608763, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2429, 176446, 229, -87.3357, -348.37, 71.0397, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Meat Rack
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2430, 176456, 229, -60.6476, -584.383, 29.1115, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2431, 176457, 229, -115.273, -428.518, -18.701, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Meat Rack
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2433, 176458, 229, -114.982, -421.897, -18.9179, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Blackrock Spire

-- Eva Remains Ablaze
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2643, 176546, 289, 196.846, -73.9371, 85.2284, 2.56563, 0, 0, 0.958819, 0.284016, -18, -18, 100, 1, 0, 10); -- Scholomance (SPAWN)
DELETE FROM `event_scripts` WHERE `id`=5439;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5439, 0, 9, 2643, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remains of Eva Sarkhoff: Respawn GameObject Eva Remains Ablaze');

-- Lucien Remains Ablaze
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2644, 176547, 289, 165.337, -81.144, 85.2284, 3.03684, 0, 0, 0.998629, 0.0523532, -18, -18, 100, 1, 0, 10); -- Scholomance (SPAWN)
DELETE FROM `event_scripts` WHERE `id`=5438;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5438, 0, 9, 2644, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remains of Lucien Sarkhoff: Respawn GameObject Lucien Remains Ablaze');

-- Alliance Bell
-- Event 78: Hourly Bells
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2648, 176573, 529, 1307.12, 1320.6, -2.68807, 0.785397, 0, 0, 0.382683, 0.92388, 180, 180, 100, 1, 0, 10); -- Arathi Basin
UPDATE `gameobject` SET `position_x`=-8585.28, `position_y`=808.048, `position_z`=106.519, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=18901;
UPDATE `gameobject` SET `position_x`=-8760.2, `position_y`=1117.5, `position_z`=110.842, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=42905;

-- Dreamfoil
-- Pool 4291: Herbs in Dire Maul
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2650, 176584, 429, -36.5852, -319.271, -51.7758, 0.244346, 0, 0, 0.121869, 0.992546, 604800, 604800, 100, 1, 1, 10), -- Dire Maul
(2651, 176584, 429, -76.5402, -246.546, -56.9004, 4.7473, 0, 0, -0.694658, 0.71934, 604800, 604800, 100, 1, 1, 10); -- Dire Maul
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(2650, 4291, 0, 'Dreamfoil', 0, 1, 10),
(2651, 4291, 0, 'Dreamfoil', 0, 1, 10);

-- Smoldering Brazier
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2671, 176905, 429, -21.1058, -392.466, -58.1027, 5.12254, 0, 0, -0.548293, 0.836286, 180, 180, 100, 1, 0, 10); -- Dire Maul
DELETE FROM `gameobject` WHERE `guid`=3997173;

-- Smoldering Brazier
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2672, 176906, 429, 4.30648, -441.621, -37.9976, 3.5692, 0, 0, -0.977231, 0.212178, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2673, 177211, 429, -41.8254, 159.874, -3.44834, 0, 0, 0, 0, 1, 25, 25, 100, 1, 1, 10); -- Dire Maul

-- Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2675, 177212, 429, 10.7216, 159.459, -3.44834, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2676, 177213, 429, 10.5911, -154.998, -2.69379, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Door
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2677, 177215, 429, 255.408, 10.3791, -2.69381, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 100, 1, 0, 10); -- Dire Maul

-- Gordok Inner Door
UPDATE `gameobject` SET `position_x`=491.204, `position_y`=515.133, `position_z`=29.4675, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=240540;

-- Gordok Courtyard Door
UPDATE `gameobject` SET `position_x`=385.327, `position_y`=374.232, `position_z`=-1.34314, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=240359;

-- Door
UPDATE `gameobject` SET `id`=177221, `position_x`=50.5863, `position_y`=501.94, `position_z`=-23.1499, `orientation`=4.71239, `rotation0`=0, `rotation1`=0, `rotation2`=-0.707107, `rotation3`=0.707107 WHERE `guid`=397125;

-- Troll Drum Sound Object
UPDATE `gameobject` SET `position_x`=7313.22, `position_y`=-1490.33, `position_z`=155.965, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=50453;

-- Remove custom spawns of Arcane Aberration and Mana Remnant and replace with spawns from sniffs.
DELETE FROM `creature` WHERE `id` IN (11480, 11483);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`, `patch_min`, `patch_max`) VALUES 
(84210, 11483, 429, 13.3353, 265.504, -7.47873, 4.85202, 0, 0, 7200, 7200, 1, 10),
(84211, 11483, 429, 0.18435, 277.584, -8.35593, 3.03687, 0, 0, 7200, 7200, 1, 10),
(84212, 11480, 429, 4.51283, 268.919, -8.03384, 3.83972, 0, 0, 7200, 7200, 1, 10),
(84213, 11480, 429, 22.2903, 268.93, -7.75637, 5.61996, 0, 0, 7200, 7200, 1, 10),
(84214, 11483, 429, 24.4087, 277.987, -8.40844, 6.0912, 0, 0, 7200, 7200, 1, 10),
(84215, 11483, 429, 22.2632, 286.032, -8.67728, 0.855211, 0, 0, 7200, 7200, 1, 10),
(84216, 11483, 429, 13.7393, 290.024, -8.81422, 1.43117, 0, 0, 7200, 7200, 1, 10),
(84218, 11480, 429, 4.86775, 286.17, -8.49644, 2.51327, 0, 0, 7200, 7200, 1, 10),
(84219, 11483, 429, 116.572, 441.026, 28.6844, 1.90241, 0, 0, 7200, 7200, 1, 10),
(84220, 11480, 429, 109.187, 432.731, 28.6844, 2.93215, 0, 0, 7200, 7200, 1, 10),
(84221, 11483, 429, 109.499, 423.1, 28.6844, 3.31613, 0, 0, 7200, 7200, 1, 10),
(84222, 11480, 429, 116.239, 417.468, 28.6844, 4.41568, 0, 0, 7200, 7200, 1, 10),
(84223, 11483, 429, -86.7868, 430.229, 28.6855, 4.83456, 0, 0, 7200, 7200, 1, 10),
(84224, 11480, 429, -79.4082, 437.517, 28.6859, 5.61996, 0, 0, 7200, 7200, 1, 10),
(84225, 11483, 429, -79.6795, 447.35, 28.6859, 0.401426, 0, 0, 7200, 7200, 1, 10),
(84227, 11480, 429, -86.4111, 454.612, 28.6864, 1.18682, 0, 0, 7200, 7200, 1, 10),
(84230, 11483, 429, -97.6146, 454.302, 28.6873, 2.21657, 0, 0, 7200, 7200, 1, 10),
(84231, 11483, 429, -104.249, 447.252, 28.6878, 2.75762, 0, 0, 7200, 7200, 1, 10),
(84234, 11483, 429, -104.42, 436.883, 28.6865, 3.36849, 0, 0, 7200, 7200, 1, 10),
(84235, 11480, 429, -98.4999, 429.365, 28.6854, 4.20624, 0, 0, 7200, 7200, 1, 10),
(84239, 11483, 429, 126.092, 416.945, 28.6844, 4.99164, 0, 0, 7200, 7200, 1, 10),
(84240, 11483, 429, 133.068, 423.411, 28.6844, 5.93412, 0, 0, 7200, 7200, 1, 10),
(84241, 11480, 429, 126.612, 440.825, 28.6844, 1.18682, 0, 0, 7200, 7200, 1, 10),
(84242, 11483, 429, 133.537, 434.405, 28.6844, 0.471239, 0, 0, 7200, 7200, 1, 10),
(84245, 11483, 429, 78.1069, 724.323, -24.4956, 4.67748, 0, 0, 7200, 7200, 1, 10),
(84246, 11480, 429, 87.2501, 727.643, -24.497, 5.16617, 0, 0, 7200, 7200, 1, 10),
(84247, 11483, 429, 91.785, 737.786, -24.497, 0, 0, 0, 7200, 7200, 1, 10),
(84257, 11480, 429, 89.8462, 745.194, -24.497, 0.715585, 0, 0, 7200, 7200, 1, 10),
(84258, 11483, 429, 78.097, 749.842, -24.497, 1.41372, 0, 0, 7200, 7200, 1, 10),
(84259, 11483, 429, 68.7335, 747.766, -24.497, 2.33874, 0, 0, 7200, 7200, 1, 10),
(84260, 11483, 429, 64.6404, 736.824, -24.497, 3.33358, 0, 0, 7200, 7200, 1, 10),
(84261, 11480, 429, 68.4746, 728.471, -24.4956, 3.9619, 0, 0, 7200, 7200, 1, 10),
(84262, 11480, 429, -154.641, 721.118, -24.4952, 4.64258, 0, 0, 7200, 7200, 1, 10),
(84264, 11483, 429, -146.109, 724.521, -24.4951, 5.48033, 0, 0, 7200, 7200, 1, 10),
(84265, 11483, 429, -140.277, 734.367, -24.4966, 6.07375, 0, 0, 7200, 7200, 1, 10),
(84266, 11480, 429, -142.956, 743.886, -24.497, 0.715585, 0, 0, 7200, 7200, 1, 10),
(84267, 11483, 429, -164.966, 724.302, -24.4968, 3.78736, 0, 0, 7200, 7200, 1, 10);

-- Doodad_DireMaulCrystalGenerator02
UPDATE `gameobject` SET `position_x`=-92.3456, `position_y`=442.67, `position_z`=28.547, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=261762;

-- Doodad_DireMaulCrystalGenerator03
UPDATE `gameobject` SET `position_x`=121.222, `position_y`=429.092, `position_z`=28.4548, `orientation`=0.418879, `rotation0`=0, `rotation1`=0, `rotation2`=0.207911, `rotation3`=0.978148 WHERE `guid`=262113;

-- Doodad_DireMaulCrystalGenerator01
UPDATE `gameobject` SET `position_x`=12.9414, `position_y`=277.931, `position_z`=-8.93289, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=261760;

-- Moonwell
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2690, 177278, 1, 9554.63, 1655.24, 1298.83, 2.53945, 0, 0, 0.95502, 0.296542, 900, 900, 100, 1, 0, 10); -- Teldrassil

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2691, 177324, 30, -375.018, -523.71, 84.0771, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2694, 177325, 30, -413.51, -521.414, 84.0771, 2.05949, 0, 0, 0.857167, 0.515038, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2695, 177326, 30, -487.402, -526.486, 82.5708, 5.47161, 0, 0, -0.394744, 0.918791, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2696, 177327, 30, -251.556, -562.061, 68.1725, 6.11738, 0, 0, -0.0828075, 0.996566, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Demon Portal
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(32664, 177367, 1, -2002.06, 1866.33, 52.4633, 3.194, 0, 0, -0.999657, 0.0262016, 900, 900, 100, 1, 0, 10), -- Desolace (SPAWN)
(32665, 177368, 1, -2067.9, 1844.89, 60.4518, 2.87979, 0, 0, 0.991445, 0.130528, 900, 900, 100, 1, 0, 10); -- Desolace (SPAWN)
UPDATE `gameobject_template` SET `data5`=0, `data10`=0 WHERE `entry` IN (177367, 177368);
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(32664, 900, 82, 32664, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32664, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32664, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian'),
(32665, 900, 82, 32665, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Load to Map'),
(32665, 2, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Demon Portal - Delete Self on Use'),
(32665, 0, 10, 11937, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Demon Portal - Summon Demon Portal Guardian');

-- Cauldron
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2700, 177396, 30, 12.8251, -120.211, 41.6669, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2734, 177425, 30, -353.118, 37.0957, 65.8904, 3.14159, 0, 0, -1, 0, 180, 180, 100, 1, 0, 10); -- Alterac Valley

-- Atal'ai Statue
UPDATE `gameobject` SET `position_x`=-491.396, `position_y`=53.5787, `position_z`=-148.74, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=315030;
UPDATE `gameobject` SET `position_x`=-490.969, `position_y`=135.714, `position_z`=-148.74, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=315027;
UPDATE `gameobject` SET `position_x`=-515.046, `position_y`=95.1471, `position_z`=-148.74, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=315021;
UPDATE `gameobject` SET `position_x`=-420.155, `position_y`=94.3731, `position_z`=-148.74, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=315024;
UPDATE `gameobject` SET `position_x`=-444.448, `position_y`=136.106, `position_z`=-148.74, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=315033;
UPDATE `gameobject` SET `position_x`=-443.55, `position_y`=53.9243, `position_z`=-148.74, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=315036;

-- Atal'ai Statue
UPDATE `gameobject` SET `position_x`=-444.448, `position_y`=136.106, `position_z`=-148.74, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=315034;
UPDATE `gameobject` SET `position_x`=-443.55, `position_y`=53.9243, `position_z`=-148.74, `orientation`=0.90757, `rotation0`=0, `rotation1`=0, `rotation2`=0.438371, `rotation3`=0.898794 WHERE `guid`=315037;
UPDATE `gameobject` SET `position_x`=-491.396, `position_y`=53.5787, `position_z`=-148.74, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=315031;
UPDATE `gameobject` SET `position_x`=-490.969, `position_y`=135.714, `position_z`=-148.74, `orientation`=0.226892, `rotation0`=0, `rotation1`=0, `rotation2`=0.113203, `rotation3`=0.993572 WHERE `guid`=315028;
UPDATE `gameobject` SET `position_x`=-515.046, `position_y`=95.1471, `position_z`=-148.74, `orientation`=2.74016, `rotation0`=0, `rotation1`=0, `rotation2`=0.979924, `rotation3`=0.19937 WHERE `guid`=315022;
UPDATE `gameobject` SET `position_x`=-420.155, `position_y`=94.3731, `position_z`=-148.74, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=315025;

-- Moonkin Stone Aura
UPDATE `gameobject` SET `spawntimesecsmin`=-120, `spawntimesecsmax`=-120 WHERE `guid`=15727;
-- Script when using item 15710 spell 19138.
DELETE FROM `event_scripts` WHERE `id`=6028;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6028, 0, 0, 9, 15727, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cenarion Lunardust: Respawn GameObject Moonkin Stone Aura'),
(6028, 0, 0, 10, 12138, 120000, 0, 0, 0, 0, 0, 0, 1, 1213801, -1, 1, -2445.6, -1646.02, 92.8553, 1.11701, 0, 'Cenarion Lunardust: Summon Creature Lunaclaw');
DELETE FROM `generic_scripts` WHERE `id`=1213801;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1213801, 0, 0, 60, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 1213801, 0, 0, 0, 0, 0, 0, 0, 'Cenarion Lunardust: Lunaclaw - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1213801, 1, -2444.711914, -1642.662109, 92.690582, 100.000000, 0, 0.000000, 0),
(1213801, 2, -2446.711914, -1631.662109, 92.190582, 100.000000, 0, 0.000000, 0),
(1213801, 3, -2452.721924, -1625.327637, 92.110733, 100.000000, 0, 0.000000, 0),
(1213801, 4, -2472.471924, -1628.077637, 91.860733, 100.000000, 0, 0.000000, 0),
(1213801, 5, -2498.009033, -1631.718384, 91.791679, 100.000000, 0, 0.000000, 0),
(1213801, 6, -2497.068115, -1631.025391, 91.791679, 100.000000, 4000, 0.000000, 0),
(1213801, 7, -2497.068115, -1631.025391, 91.791679, 100.000000, 0, 0.000000, 2);

-- Moonkin Stone Aura
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(15742, 177644, 1, 6326.01, 92.7007, 21.9577, 4.08407, 0, 0, -0.891006, 0.453991, -120, -120, 100, 1, 0, 10); -- Darkshore
-- Script when using item 15208 spell 18974.
DELETE FROM `event_scripts` WHERE `id`=5991;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5991, 0, 0, 10, 12138, 120000, 0, 0, 0, 0, 0, 0, 1, 1213802, -1, 1, 6366.34, 140.382, 24.2587, 3.68264, 0, 'Cenarion Moondust: Summon Creature Lunaclaw'),
(5991, 1, 0, 9, 15742, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cenarion Moondust: Respawn GameObject Moonkin Stone Aura');
DELETE FROM `generic_scripts` WHERE `id`=1213802;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1213802, 0, 0, 60, 3, 0, 1000, 0, 0, 0, 0, 0, 0, 1213802, 0, 0, 0, 0, 0, 0, 0, 'Cenarion Moondust: Lunaclaw - Start Waypoints');
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1213802, 1, 6365.421875, 139.798553, 24.188501, 100.000000, 0, 0.000000, 0),
(1213802, 2, 6356.171875, 133.298553, 22.938501, 100.000000, 0, 0.000000, 0),
(1213802, 3, 6349.310059, 125.077438, 22.138916, 100.000000, 0, 0.000000, 0),
(1213802, 4, 6345.013184, 122.000290, 22.793526, 100.000000, 0, 0.000000, 0),
(1213802, 5, 6341.763184, 117.250290, 22.793526, 100.000000, 0, 0.000000, 0),
(1213802, 6, 6339.005859, 113.137695, 21.242620, 100.000000, 0, 0.000000, 0),
(1213802, 7, 6335.020020, 107.050438, 21.803505, 100.000000, 0, 0.000000, 0),
(1213802, 8, 6333.560059, 104.820793, 22.023548, 100.000000, 0, 0.000000, 0), 
(1213802, 9, 6330.335938, 100.653168, 21.263285, 100.000000, 0, 0.000000, 0),
(1213802, 10, 6325.043945, 94.151260, 22.016369, 100.000000, 0, 0.000000, 0),
(1213802, 11, 6323.289551, 93.937569, 22.318190, 100.000000, 0, 0.000000, 2);
UPDATE `creature_template` SET `spawn_spell_id`=10389 WHERE `entry`=12138;

-- Plaguewood Fire (Small)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2780, 177669, 0, 2797.07, -3756.1, 146.486, 4.88692, 0, 0, -0.642787, 0.766045, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2781, 177669, 0, 2821.02, -3767.79, 126.122, 5.60251, 0, 0, -0.333807, 0.942641, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2782, 177669, 0, 2790.2, -3772.12, 125.424, 1.37881, 0, 0, 0.636078, 0.771625, -12, -12, 100, 1, 0, 10); -- Eastern Plaguelands

-- Plaguewood Fire (Large)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2783, 177670, 0, 2814.97, -3755.91, 146.494, 0.942477, 0, 0, 0.45399, 0.891007, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2784, 177670, 0, 2779.1, -3769.18, 133.583, 5.91667, 0, 0, -0.182235, 0.983255, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2787, 177670, 0, 2796.34, -3778.98, 125.424, 3.12412, 0, 0, 0.999962, 0.00873464, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2790, 177670, 0, 2816.53, -3774.73, 125.424, 3.78737, 0, 0, -0.948323, 0.317306, -12, -12, 100, 1, 0, 10); -- Eastern Plaguelands

-- Plaguewood Smoke
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2791, 177671, 0, 2803.39, -3750.83, 150.657, 4.81711, 0, 0, -0.66913, 0.743145, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2792, 177671, 0, 2823.36, -3754.3, 130.373, 0.506145, 0, 0, 0.25038, 0.968148, -12, -12, 100, 1, 0, 10), -- Eastern Plaguelands
(2793, 177671, 0, 2779.57, -3773.03, 125.424, 3.03684, 0, 0, 0.998629, 0.0523532, -12, -12, 100, 1, 0, 10); -- Eastern Plaguelands

-- Shallow Grave
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2796, 177677, 0, 3377.68, -4896.83, 159.627, 2.19911, 0, 0, 0.891006, 0.453991, 900, 900, 100, 1, 0, 10); -- Eastern Plaguelands


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
