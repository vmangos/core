DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241211105148');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241211105148');
-- Add your query below.


-- Doodad_RuinedSign06
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2078, 175654, 0, 3477.52, -3359.29, 151.06, 4.71239, 0, 0, -0.707107, 0.707107, 180, 180, 100, 1, 0, 10), -- Stratholme
(2079, 175654, 533, 3477.52, -3359.29, 151.06, 4.71239, 0, 0, -0.707107, 0.707107, 180, 180, 100, 1, 0, 10); -- Naxxramas

-- Doodad_RuinedSign07
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2080, 175655, 0, 3473.01, -3294.13, 147.507, 5.14872, 0, 0, -0.5373, 0.843391, 180, 180, 100, 1, 0, 10), -- Stratholme
(2082, 175655, 533, 3473.01, -3294.13, 147.507, 5.14872, 0, 0, -0.5373, 0.843391, 180, 180, 100, 1, 0, 10); -- Naxxramas

-- Doodad_WoodSignPointerNice10
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2084, 175656, 533, 3446.54, -3370.09, 140.956, 1.65806, 0, 0, 0.737277, 0.675591, 180, 180, 100, 1, 0, 10); -- Naxxramas

-- Doodad_WoodSignPointerNice11
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2086, 175657, 533, 3447.17, -3369.94, 140.925, 4.79442, -0.117315, 0.128027, -0.665326, 0.726077, 180, 180, 100, 1, 0, 10); -- Naxxramas

-- Doodad_GnomeSign_Engineer01
UPDATE `gameobject` SET `position_x`=146.94, `position_y`=-6.10418, `position_z`=-3.15419, `orientation`=2.41291, `rotation0`=0, `rotation1`=0, `rotation2`=0.93436, `rotation3`=0.356332 WHERE `guid`=18511;

-- Doodad_DwarfSign_Alchemist01
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(14232, 175664, 369, 146.438, 27.883, -0.142696, 3.879, 0, 0, -0.932796, 0.360406, 180, 180, 100, 1, 0, 10); -- Deeprun Tram

-- Doodad_DwarvenBrazier196
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(14110, 175666, 369, 109.351, 16.2142, -4.29443, 0.850847, 0, 0, 0.412706, 0.910864, 180, 180, 100, 1, 0, 10); -- Deeprun Tram

-- Doodad_DwarvenBrazier195
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(14063, 175667, 369, 109.847, 4.7277, -4.29443, 0.850847, 0, 0, 0.412706, 0.910864, 180, 180, 100, 1, 0, 10); -- Deeprun Tram

-- Doodad_PostBoxGnome01
UPDATE `gameobject` SET `position_x`=112.364, `position_y`=5.07913, `position_z`=-4.35765, `orientation`=0.850847, `rotation0`=0, `rotation1`=0, `rotation2`=0.412706, `rotation3`=0.910864 WHERE `guid`=18513;

-- Rend Head Event Timer
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2095, 175789, 1, 1920.27, -4134.9, 8.82368, 1.72787, 0, 0, 0.760406, 0.649449, -10800, -10800, 100, 1, 0, 10); -- Orgrimmar
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4974, 0, 0, 9, 2095, 10800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Respawn Rend Head Event Timer');

-- Horde Bell
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2098, 175885, 529, 692.502, 672.742, -6.67027, 3.3685, 0, 0, -0.993571, 0.113208, 180, 180, 100, 1, 0, 10); -- Arathi Basin

-- Roughshod Pike
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2099, 175886, 229, -37.7856, -589.639, 30.9964, 3.194, 0, 0, -0.999657, 0.0262016, 25, 25, 100, 1, 0, 10), -- Blackrock Spire
(2103, 175886, 229, -37.1093, -589.641, 30.9548, 1.29154, 0, 0, 0.601814, 0.798636, 25, 25, 100, 1, 0, 10), -- Blackrock Spire
(2104, 175886, 229, -35.6387, -589.632, 30.9825, 4.31097, 0, 0, -0.833885, 0.551938, 25, 25, 100, 1, 0, 10), -- Blackrock Spire
(2105, 175886, 229, -34.5386, -589.635, 30.9964, 5.68977, 0, 0, -0.292372, 0.956305, 25, 25, 100, 1, 0, 10), -- Blackrock Spire
(2106, 175886, 229, -36.2977, -589.617, 31.0103, 1.09956, 0, 0, 0.522498, 0.85264, 25, 25, 100, 1, 0, 10), -- Blackrock Spire
(2107, 175886, 229, -34.7324, -589.615, 30.9339, 1.62316, 0, 0, 0.725374, 0.688355, 25, 25, 100, 1, 0, 10); -- Blackrock Spire
DELETE FROM `gameobject` WHERE `guid`=321191;

-- Fifth Mosh'aru Tablet
UPDATE `gameobject` SET `position_x`=-128.234, `position_y`=-482.381, `position_z`=25.4535, `orientation`=6.26573, `rotation0`=0, `rotation1`=0, `rotation2`=-0.00872612, `rotation3`=0.999962 WHERE `guid`=30277;

-- Sixth Mosh'aru Tablet
UPDATE `gameobject` SET `position_x`=-11.1345, `position_y`=-466.205, `position_z`=-16.8553, `orientation`=4.72984, `rotation0`=0, `rotation1`=0, `rotation2`=-0.700909, `rotation3`=0.713251 WHERE `guid`=350470;

-- Skin of Shadow
UPDATE `gameobject` SET `position_x`=257.26, `position_y`=-5.07736, `position_z`=75.8889, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=397022;

-- Frostwhisper's Embalming Fluid
UPDATE `gameobject` SET `position_x`=-17.8299, `position_y`=124.581, `position_z`=84.8528, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=43205;

-- Blood of Heroes
-- Pool 38: Eastern Plaguelands - Blood of Heroes
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2122, 176213, 0, 1870, -3988.17, 118.568, 0.174532, 0, 0, 0.0871553, 0.996195, 7200, 7200, 100, 1, 0, 10); -- Eastern Plaguelands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(2122, 38, 0, 'Blood of Heroes', 0, 0, 10);

-- Archive Fire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2135, 176295, 329, 3462.58, -3101.21, 136.546, 3.52557, 0, 0, -0.981627, 0.190812, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2136, 176295, 329, 3450.44, -3103.39, 136.546, 3.4383, 0, 0, -0.989016, 0.147811, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2137, 176295, 329, 3458.97, -3105.15, 136.546, 0.541051, 0, 0, 0.267238, 0.963631, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2138, 176295, 329, 3459.59, -3110.38, 136.546, 1.18682, 0, 0, 0.559193, 0.829038, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2139, 176295, 329, 3452.87, -3108.56, 136.546, 0.418879, 0, 0, 0.207911, 0.978148, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2141, 176295, 329, 3465.55, -3105.72, 136.587, 2.89725, 0, 0, 0.992546, 0.12187, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2142, 176295, 329, 3459.45, -3097.48, 136.546, 4.88692, 0, 0, -0.642787, 0.766045, -86400, -86400, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2143, 176295, 329, 3456.64, -3112.31, 136.546, 2.75761, 0, 0, 0.981627, 0.190812, -86400, -86400, 100, 1, 0, 10); -- Stratholme (SPAWN)
DELETE FROM `event_scripts` WHERE `id`=5258;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5258, 0, 9, 2135, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2136, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2137, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2138, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2139, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2141, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2142, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire'),
(5258, 0, 9, 2143, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Archive: Respawn GameObject Archive Fire');

-- Postbox Parcel
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2455, 176360, 329, 3564.43, -3352.55, 131.89, 2.30383, 0, 0, 0.913545, 0.406738, -3600, -3600, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2459, 176360, 329, 3690.1, -3404.56, 133.962, 1.36136, 0, 0, 0.62932, 0.777146, -3600, -3600, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2461, 176360, 329, 3659.45, -3477.42, 139.558, 4.11898, 0, 0, -0.882947, 0.469473, -3600, -3600, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2462, 176360, 329, 3473.96, -3294.85, 133.178, 5.34071, 0, 0, -0.45399, 0.891007, -3600, -3600, 100, 1, 0, 10), -- Stratholme (SPAWN)
(2463, 176360, 329, 3639.37, -3640.66, 139.679, 1.88495, 0, 0, 0.809016, 0.587786, -3600, -3600, 100, 1, 0, 10); -- Stratholme (SPAWN)
DELETE FROM `gameobject_scripts` WHERE `id`=47276;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47276, 0, 0, 9, 2455, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King\'s Square Postbox - Respawn Postbox Parcel');
DELETE FROM `gameobject_scripts` WHERE `id`=45220;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(45220, 0, 0, 9, 2459, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Market Row Postbox - Respawn Postbox Parcel');
DELETE FROM `gameobject_scripts` WHERE `id`=47274;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47274, 0, 0, 9, 2461, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Festival Lane Postbox - Respawn Postbox Parcel');
DELETE FROM `gameobject_scripts` WHERE `id`=47277;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47277, 0, 0, 9, 2462, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fras Siabi\'s Postbox - Respawn Postbox Parcel');
DELETE FROM `gameobject_scripts` WHERE `id`=47275;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47275, 0, 0, 9, 2463, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elders\' Square Postbox - Respawn Postbox Parcel');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
