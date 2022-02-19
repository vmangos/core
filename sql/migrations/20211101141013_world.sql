DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211101141013');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211101141013');
-- Add your query below.


-- Spawn script for Creature Flawless Draenethyst Fragment (Entry: 7365)
DELETE FROM `generic_scripts` WHERE `id`=25210;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25210, 0, 15, 10387, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Flawless Draenethyst Fragment - Cast Spell Lightning Surge');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 566)
DELETE FROM `generic_scripts` WHERE `id`=25211;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25211, 0, 3, 0, 3245, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11348.5, -2953.11, 12.658, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25211, 1, 3, 0, 4680, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11338.8, -2967.93, 5.33431, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25211, 4, 3, 0, 3727, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11355.9, -2970.98, 3.94515, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25211, 6, 3, 0, 3119, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11361.9, -2974.77, 0.459062, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25211, 9, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.96035, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25211, 16, 3, 0, 1789, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11365.2, -2978.34, 0.422498, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25211, 19, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 567)
DELETE FROM `generic_scripts` WHERE `id`=25212;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25212, 0, 3, 0, 2530, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11349.7, -2939.2, 16.1839, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 1, 3, 0, 2466, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11350.9, -2949.05, 13.9437, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 3, 3, 0, 5474, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11345.8, -2979.93, 2.34017, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 4, 3, 0, 2957, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11328.9, -2978.01, 6.29086, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 6, 3, 0, 1863, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11341.1, -2974.63, 4.26326, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 8, 3, 0, 2614, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11370.3, -2977, 1.17285, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 9, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11358.6, -2975.7, 0.505263, 3.57665, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 17, 3, 0, 4969, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11370.8, -2980.29, 1.62647, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 18, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11360.4, -2976.36, -0.204024, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25212, 19, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 568)
DELETE FROM `generic_scripts` WHERE `id`=25213;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25213, 0, 3, 0, 4171, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11362.3, -2943.75, 11.5691, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 1, 3, 0, 5965, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11356.4, -2958.47, 8.06084, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 3, 3, 0, 3367, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11346.8, -2975.13, 4.92269, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 4, 3, 0, 4925, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11325.5, -2981.46, 5.90365, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 6, 3, 0, 1562, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11343.4, -2969.88, 6.56185, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 8, 3, 0, 3428, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11373.3, -2981.32, 1.25147, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 9, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11357, -2975.08, 1.37361, 3.56286, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 17, 3, 0, 4893, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11366.8, -2978.97, 0.703126, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 18, 3, 0, 1974, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11364.7, -2978.15, 0.210527, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 19, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11360.9, -2976.63, -0.183267, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25213, 19, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 569)
DELETE FROM `generic_scripts` WHERE `id`=25214;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25214, 0, 3, 0, 3412, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11313.6, -2963.89, 13.2191, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 1, 3, 0, 2900, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11318.9, -2968.2, 10.3099, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 3, 3, 0, 3184, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11333.5, -2967.46, 6.05769, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 5, 3, 0, 3700, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11349.8, -2968.26, 5.39607, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 6, 3, 0, 2882, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11355.3, -2971.07, 4.12825, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 10, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.79078, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25214, 16, 3, 0, 4808, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11365.1, -2978.47, 0.500289, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25214, 23, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 570)
DELETE FROM `generic_scripts` WHERE `id`=25215;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25215, 0, 3, 0, 4644, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11331.2, -2971.91, 6.30893, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 1, 3, 0, 652, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11320.7, -2951.67, 19.3695, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 3, 3, 0, 1082, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11314.7, -2961.97, 14.3817, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 5, 3, 0, 2600, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11334.7, -2982.36, 3.20003, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 6, 3, 0, 2746, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11355.5, -2961.02, 7.11431, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 8, 3, 0, 2506, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11355.1, -2965.21, 4.44267, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 10, 3, 0, 1599, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11355.2, -2970.92, 4.20467, 3.88553, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 18, 3, 0, 2911, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11358.2, -2973.6, 1.57649, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 19, 3, 0, 3759, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11366.7, -2979.83, 0.724122, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 21, 3, 0, 2308, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11367.1, -2979.92, 0.868654, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 23, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11364.6, -2978.09, 0.267391, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25215, 23, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 571)
DELETE FROM `generic_scripts` WHERE `id`=25216;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25216, 0, 3, 0, 2654, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11299.1, -2979.68, 12.1386, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 1, 3, 0, 3070, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11312, -2977.58, 5.92587, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 3, 3, 0, 3715, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11329.7, -2979.38, 5.9122, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 5, 3, 0, 3792, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11342.5, -2978.24, 2.99373, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 6, 3, 0, 3580, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11353.4, -2978.62, 1.41072, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 11, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.17752, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25216, 16, 3, 0, 4332, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11364.9, -2979.03, 0.251054, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25216, 21, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 572)
DELETE FROM `generic_scripts` WHERE `id`=25217;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25217, 0, 3, 0, 1707, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11284.5, -2982.16, 20.1828, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 1, 3, 0, 6001, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11311.7, -2978.35, 5.68393, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 3, 3, 0, 3314, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11325.2, -2979.2, 6.81064, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 5, 3, 0, 2455, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11321, -2975.09, 7.59311, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 6, 3, 0, 1453, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11326, -2979, 6.69443, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 8, 3, 0, 3788, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11359.7, -2974.61, 0.782793, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 10, 3, 0, 3211, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11353.4, -2978.62, 1.41072, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 11, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.20598, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25217, 18, 3, 0, 5917, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11357.4, -2977.98, 0.0071578, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 19, 3, 0, 5206, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11360, -2977.72, -0.576094, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 21, 3, 0, 1903, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11359.8, -2978.5, -0.481123, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25217, 21, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 573)
DELETE FROM `generic_scripts` WHERE `id`=25218;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25218, 0, 3, 0, 2849, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11291, -2985.36, 15.1545, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 1, 3, 0, 3076, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11299.2, -2986.88, 9.09321, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 3, 3, 0, 3968, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11326, -2973.74, 7.4144, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 5, 3, 0, 2490, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11317, -2982.33, 5.50229, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 6, 3, 0, 3974, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11344.4, -2978.03, 2.86263, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 8, 3, 0, 3777, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11357.5, -2982.74, 0.692216, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 10, 3, 0, 2104, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11348.6, -2979.74, 2.15193, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 11, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.02438, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25218, 18, 3, 0, 4789, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11357.4, -2981.32, 0.238359, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 19, 3, 0, 4352, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11361, -2981.5, 0.482988, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 21, 3, 0, 1922, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11360.7, -2980.06, 0.0288863, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25218, 21, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Spawn script for Creature Draenei Refugee (Entry: 7401 Guid: 574)
DELETE FROM `generic_scripts` WHERE `id`=25219;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(25219, 0, 3, 0, 2808, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11296.8, -2980.83, 13.6188, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 1, 3, 0, 3053, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11302.3, -2981.52, 9.18246, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 3, 3, 0, 2753, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11314.9, -2980.12, 5.34286, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 5, 3, 0, 2401, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11322.8, -2979.72, 6.19955, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 6, 3, 0, 1225, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11326, -2979, 6.69443, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 8, 3, 0, 3723, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11359.7, -2973.27, 1.31282, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 10, 3, 0, 2204, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11350.6, -2978.15, 2.58602, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 11, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.22069, 0, 'To Serve Kum\'isha: Draenei Refugee - Set Orientation'),
(25219, 18, 3, 0, 4928, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11359.9, -2977.36, -0.520674, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 19, 3, 0, 4737, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11364.1, -2977.47, 0.0489058, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 21, 3, 0, 2309, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11362.4, -2978.61, -0.218916, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Move'),
(25219, 21, 15, 10454, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Draenei Refugee - Cast Spell Into the Rift');

-- Main script
DELETE FROM `generic_scripts` WHERE `id`=2521;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2521, 104, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Remove Npc Flags'),
(2521, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3441, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Say Text'),
(2521, 112, 10, 7364, 15797, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11366.8, -2979.6, -0.198364, 0.628319, 0, 'To Serve Kum\'isha: Summon Creature Flawless Draenethyst Sphere'),
(2521, 114, 1, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Emote OneShotSpellCast'),
(2521, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3442, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Say Text'),
(2521, 114, 15, 10387, 0, 0, 0, 7364, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Flawless Draenethyst Sphere - Cast Spell Lightning Surge'),
(2521, 115, 10, 7365, 1609, 0, 0, 0, 0, 0, 0, 0, 25210, -1, 1, -11364.8, -2978.08, 0.21003, 0.523599, 0, 'To Serve Kum\'isha: Summon Creature Flawless Draenethyst Fragment'),
(2521, 117, 10, 7365, 3235, 0, 0, 0, 0, 0, 0, 0, 25210, -1, 1, -11365.2, -2981.1, 0.722663, 1.01229, 0, 'To Serve Kum\'isha: Summon Creature Flawless Draenethyst Fragment'),
(2521, 121, 10, 7365, 2828, 0, 0, 0, 0, 0, 0, 0, 25210, -1, 1, -11367.9, -2980.55, 1.2531, 0.610865, 0, 'To Serve Kum\'isha: Summon Creature Flawless Draenethyst Fragment'),
(2521, 124, 10, 7365, 2438, 0, 0, 0, 0, 0, 0, 0, 25210, -1, 1, -11367.9, -2977.98, 0.831891, 0.226893, 0, 'To Serve Kum\'isha: Summon Creature Flawless Draenethyst Fragment'),
(2521, 129, 76, 137167, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -11365.9, -2979.07, 0.413705, 2.02458, 0, 'To Serve Kum\'isha: Summon GameObject Nether Rift'),
(2521, 132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3475, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Say Text'),
(2521, 134, 10, 7401, 21641, 0, 0, 0, 0, 0, 0, 0, 25219, -1, 1, -11283.3, -2978.3, 21.7695, 3.327, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 21641, 0, 0, 0, 0, 0, 0, 0, 25218, -1, 1, -11281.2, -2979.6, 21.7026, 3.67157, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 21641, 0, 0, 0, 0, 0, 0, 0, 25217, -1, 1, -11278.9, -2978.77, 22.0463, 3.69067, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 21641, 0, 0, 0, 0, 0, 0, 0, 25216, -1, 1, -11283, -2977.42, 21.7573, 3.28084, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 23250, 0, 0, 0, 0, 0, 0, 0, 25215, -1, 1, -11326.5, -2940.2, 26.2404, 4.56531, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 23250, 0, 0, 0, 0, 0, 0, 0, 25214, -1, 1, -11326.9, -2945.39, 22.8358, 5.49779, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 19610, 0, 0, 0, 0, 0, 0, 0, 25213, -1, 1, -11346.9, -2926.89, 20.1307, 3.9705, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 19610, 0, 0, 0, 0, 0, 0, 0, 25212, -1, 1, -11350, -2927.87, 19.9723, 4.73971, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 134, 10, 7401, 19610, 0, 0, 0, 0, 0, 0, 0, 25211, -1, 1, -11353.1, -2930.6, 19.0882, 4.99767, 0, 'To Serve Kum\'isha: Summon Creature Draenei Refugee'),
(2521, 147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3476, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Say Text'),
(2521, 162, 10, 7409, 10890, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -11366.1, -2979.03, 1.05193, 0.541052, 0, 'To Serve Kum\'isha: Summon Creature Faltering Draenethyst Sphere'),
(2521, 162, 15, 10451, 0, 0, 0, 7409, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Faltering Draenethyst Sphere - Cast Spell Implosion'),
(2521, 172, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Set Stand State to UNIT_STAND_STATE_DEAD'),
(2521, 174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3477, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Say Text'),
(2521, 177, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Set Stand State to UNIT_STAND_STATE_STAND'),
(2521, 177, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Kum\'isha the Collector - Add Npc Flags');

-- Assign script to quest.
DELETE FROM `quest_end_scripts` WHERE `id`=2521;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2521, 0, 61, 2521, 180, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Start Scripted Map Event');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2521, 1, 39, 2521, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'To Serve Kum\'isha: Start Script');
UPDATE `quest_template` SET `CompleteScript`=2521 WHERE `entry`=2521;

-- Correct creature data.
UPDATE `creature_template` SET `faction`=35, `unit_flags`=768, `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=7364;
UPDATE `creature_template` SET `faction`=35, `unit_flags`=768, `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=7365;
UPDATE `creature_template` SET `faction`=120, `unit_flags`=768, `speed_walk`=1.11111, `speed_run`=1.14286 WHERE `entry`=7401;
UPDATE `creature_template` SET `faction`=14, `unit_flags`=33555200, `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=7409;

-- Define targets for spell Implosion.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (10451, 1, 7363, 0, 0, 0, 5875);

-- This text should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=3475;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
