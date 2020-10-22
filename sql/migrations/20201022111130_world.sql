DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201022111130');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201022111130');
-- Add your query below.


-- Add gossip menu for Spoops.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8312, 8, 8312, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`,  `condition_id`) VALUES
(6591, 7808, 0),
(6591, 7809, 8312);
UPDATE `creature_template` SET `gossip_menu_id`=6591, `npc_flags`=3 WHERE `entry`=15309;

-- Rachelle Gothena should only sell Hallow's End Pumpkin Treat if quest 8312 is completed.
UPDATE `npc_vendor` SET `condition_id`=8312 WHERE `entry`=15354 && `item`=20557;

-- Add gossip menu for Jesper.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8311, 8, 8311, 0, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`) VALUES (7811, 1, 0, 0, 0, 0, 0, 0, 0, 10814, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`,  `condition_id`) VALUES
(6592, 7810, 0),
(6592, 7811, 8311);
UPDATE `creature_template` SET `gossip_menu_id`=6592, `npc_flags`=3 WHERE `entry`=15310;

-- Katrina Shimmerstar should only sell Hallow's End Pumpkin Treat if quest 8311 is completed.
UPDATE `npc_vendor` SET `condition_id`=8311 WHERE `entry`=15353 && `item`=20557;

-- Add gossip menu for Katrina Shimmerstar.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(6589, 7805),
(6594, 7813);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6589, 0, 1, 'What Hallow\'s End candy do you have for sale?', 10815, 3, 4, 0, 0, 0, 0, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`) VALUES (6589, 1, 0, 'What is there to do on Hallow\'s End?', 10816, 1, 1, 6594, 0, 0, 0, NULL, 0);
UPDATE `creature_template` SET `gossip_menu_id`=6589, `npc_flags`=5 WHERE `entry`=15353;

-- The emote quests should be repeatable.
UPDATE `quest_template` SET `SpecialFlags`=3 WHERE `entry` IN (8353, 8357, 8356, 8355, 8354, 8360, 8359, 8358);

-- Hallow's End Treats for Spoops! should not be repeatable.
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `entry`=8312;

-- Stinking Up Southshore should not be repeatable.
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `entry`=1657;

-- Add targets for Despawn Ice Block since i removed hack for it in core.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `build_min`, `build_max`) VALUES (30132, 0, 181247, 0, 5464, 5875);

-- Add inverse effect mask to spell script targets.
ALTER TABLE `spell_script_target`
	ADD COLUMN `inverseEffectMask` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `conditionId`;

-- Fix item Forsaken Stink Bomb Cluster.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `patch_min`, `patch_max`) VALUES (202776, 15415, 0, -854.598, -504.041, 11.3208, 3.64774, 0, 6, 10);
DELETE FROM `event_scripts` WHERE `id`=9417;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9417, 0, 83, 0, 0, 0, 0, 15415, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toss Stink Bomb - Quest Credit for Stinking Up Southshore');
UPDATE `creature_template` SET `unit_flags` = 256 + 512 + 33554432 WHERE `entry`=15415;

-- Add targets for Stink Bomb Cleaner.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (24973, 0, 180449, 0, 2, 4878, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (24973, 0, 180450, 0, 4, 4878, 5875);

-- Fix unusable Apple Bob objects.
UPDATE `gameobject` SET `state` = 1 WHERE `guid` IN (332880, 332864) AND `id` = 180523;

-- Forsaken Banner was added in patch 1.8.
UPDATE `gameobject_template` SET `patch`=6 WHERE `entry`=180432;

-- Correct faction and flags of The Wickerman.
UPDATE `gameobject_template` SET `faction`=1375, `flags`=32 WHERE `entry`=180433;

-- Missing Hallow's End gameobjects.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
(34305, 180405, 0, -3656.67, -840.95, 41.3908, 0, 0, 0.656058, 0.75471, 255, 1, 6, 10),
(34306, 180405, 0, 392.129, -2101.99, 131.562, 0, 0, 0.887011, 0.461749, 255, 1, 6, 10),
(34307, 180523, 0, 398.111, -2100.5, 131.839, 0, 0, 0.961261, 0.27564, 255, 1, 6, 10),
(34308, 180415, 0, 392.212, -2104.05, 132.208, 0, 0, 0.748956, 0.66262, 255, 1, 6, 10),
(34309, 180425, 0, 398.663, -2098.36, 132.465, 0, 0, -0.891007, 0.453991, 255, 1, 6, 10),
(34310, 180425, 0, 392.13, -2103.66, 132.263, 0, 0, 0.0348988, 0.999391, 255, 1, 6, 10),
(34311, 180411, 0, 399.422, -2100.04, 135.029, 0, 0, 0.130526, 0.991445, 255, 1, 6, 10),
(34312, 180415, 0, 399.96, -2102.41, 132.458, 0, 0, -0.216439, 0.976296, 255, 1, 6, 10),
(34313, 180471, 0, 397.906, -2094.09, 137.988, 0, 0, -0.636078, 0.771625, 255, 1, 6, 10),
(34314, 180472, 0, 398.528, -2097.02, 139.411, 0, 0, -0.991445, 0.130528, 255, 1, 6, 10),
(34315, 180472, 0, 400.004, -2103.2, 139.439, 0, 0, -0.990268, 0.139175, 255, 1, 6, 10),
(34316, 180471, 0, 400.667, -2106.41, 137.946, 0, 0, -0.580703, 0.814116, 255, 1, 6, 10),
(34317, 180472, 0, 386.052, -2091.51, 135.415, 0, 0, -0.601814, 0.798636, 255, 1, 6, 10),
(34318, 180472, 0, 389.484, -2086.82, 135.594, 0, 0, 0.267238, 0.963631, 255, 1, 6, 10),
(34319, 180472, 0, 382.179, -2098.06, 139.411, 0, 0, -0.984807, 0.173652, 255, 1, 6, 10),
(34320, 180472, 0, 394.663, -2084.8, 135.633, 0, 0, -0.986285, 0.16505, 255, 1, 6, 10),
(34321, 180472, 0, 391.22, -2113.92, 135.401, 0, 0, 0.782608, 0.622515, 255, 1, 6, 10),
(34322, 180405, 0, 379.283, -2098.82, 132.368, 0, 0, -0.461748, 0.887011, 255, 1, 6, 10),
(34323, 180472, 0, 384.632, -2109.8, 139.446, 0, 0, -0.987688, 0.156436, 255, 1, 6, 10),
(34324, 180471, 0, 388.87, -2084.19, 134.186, 0, 0, 0.942641, 0.333808, 255, 1, 6, 10),
(34325, 180405, 0, 399.259, -2086.7, 121.839, 0, 0, -0.748956, 0.66262, 255, 1, 6, 10),
(34326, 180407, 0, 381.987, -2110.23, 132.368, 0, 0, -0.45399, 0.891007, 255, 1, 6, 10),
(34327, 180471, 0, 394.082, -2082.22, 134.244, 0, 0, -0.878817, 0.47716, 255, 1, 6, 10),
(34328, 180425, 0, 395.389, -2084.17, 122.995, 0, 0, -0.636078, 0.771625, 255, 1, 6, 10),
(34329, 180472, 0, 396.389, -2116.89, 135.623, 0, 0, 0.130526, 0.991445, 255, 1, 6, 10),
(34330, 180472, 0, 401.812, -2115.88, 135.628, 0, 0, -0.990268, 0.139175, 255, 1, 6, 10),
(34331, 180406, 0, 405.191, -2112.43, 121.841, 0, 0, -0.190808, 0.981627, 255, 1, 6, 10),
(34332, 180412, 0, 401.024, -2118.11, 131.563, 0, 0, -0.906307, 0.422619, 255, 1, 6, 10),
(34333, 180471, 0, 396.917, -2119.25, 134.174, 0, 0, 0.382683, 0.92388, 255, 1, 6, 10),
(34334, 180425, 0, 402.851, -2116.42, 122.997, 0, 0, 0.798635, 0.601815, 255, 1, 6, 10),
(34335, 180471, 0, 402.512, -2118.77, 134.163, 0, 0, -0.350207, 0.936672, 255, 1, 6, 10),
(34336, 180472, 0, 405.172, -2117.85, 130.156, 0, 0, 0.782608, 0.622515, 255, 1, 6, 10),
(34337, 180472, 0, 391.903, -2120.49, 135.639, 0, 0, -0.615661, 0.788011, 255, 1, 6, 10),
(34338, 180472, 0, 404.819, -2118.23, 135.601, 0, 0, -0.587785, 0.809017, 255, 1, 6, 10),
(34339, 180425, 0, 393.408, -2077.38, 132.44, 0, 0, -0.882947, 0.469473, 255, 1, 6, 10),
(34340, 180471, 0, 407.55, -2117.49, 134.33, 0, 0, -0.300705, 0.953717, 255, 1, 6, 10),
(34341, 180425, 0, 386.444, -2078.66, 132.441, 0, 0, 0.788011, 0.615662, 255, 1, 6, 10),
(34342, 180425, 0, 393.681, -2076.9, 127.718, 0, 0, 0.139173, 0.990268, 255, 1, 6, 10),
(34343, 180472, 0, 408.075, -2120.25, 135.615, 0, 0, -0.994521, 0.104535, 255, 1, 6, 10),
(34344, 180425, 0, 404.063, -2123.43, 132.442, 0, 0, 0.942641, 0.333808, 255, 1, 6, 10),
(34345, 180425, 0, 397.191, -2125.18, 132.443, 0, 0, -0.62932, 0.777146, 255, 1, 6, 10),
(34346, 180425, 0, 404.52, -2123.7, 127.713, 0, 0, 0.0697555, 0.997564, 255, 1, 6, 10),
(34347, 180407, 0, 382.116, -2076.26, 131.562, 0, 0, 0.642787, 0.766045, 255, 1, 6, 10),
(34348, 180471, 0, 392.509, -2126.05, 134.23, 0, 0, 0.913545, 0.406738, 255, 1, 6, 10),
(34349, 180471, 0, 408.587, -2122.39, 134.185, 0, 0, -0.66262, 0.748956, 255, 1, 6, 10),
(34350, 180406, 0, 396.103, -2072.96, 126.839, 0, 0, -0.0871553, 0.996195, 255, 1, 6, 10),
(34351, 180472, 0, 390.53, -2126.46, 135.619, 0, 0, 0.814116, 0.580703, 255, 1, 6, 10),
(34352, 180472, 0, 409.052, -2124.5, 135.636, 0, 0, -0.986285, 0.16505, 255, 1, 6, 10),
(34353, 180472, 0, 393.18, -2128.56, 135.597, 0, 0, 0.173648, 0.984808, 255, 1, 6, 10),
(34354, 180406, 0, 394.451, -2129.34, 131.564, 0, 0, 0.996917, 0.0784664, 255, 1, 6, 10),
(34355, 180471, 0, 402.352, -2128.56, 134.172, 0, 0, -0.996194, 0.087165, 255, 1, 6, 10),
(34356, 180407, 0, 408.374, -2126.16, 126.841, 0, 0, -0.788011, 0.615662, 255, 1, 6, 10),
(34357, 180472, 0, 398.167, -2129.51, 135.609, 0, 0, 0.798635, 0.601815, 255, 1, 6, 10),
(34358, 180472, 0, 406.291, -2127.58, 135.595, 0, 0, 0.793353, 0.608762, 255, 1, 6, 10),
(34359, 180471, 0, 393.667, -2130.51, 134.172, 0, 0, 0.936672, 0.350207, 255, 1, 6, 10),
(34360, 180471, 0, 409.724, -2127.03, 134.226, 0, 0, -0.909961, 0.414694, 255, 1, 6, 10),
(34361, 180407, 0, 314.214, -2119.87, 155.812, 0, 0, -0.469471, 0.882948, 255, 1, 6, 10),
(34362, 180411, 0, 305.977, -2121.64, 129.292, 0, 0, 0.182235, 0.983255, 255, 1, 6, 10),
(34363, 180405, 0, 294.173, -2137.15, 124.875, 0, 0, -0.492423, 0.870356, 255, 1, 6, 10),
(34364, 180405, 0, 288.705, -2113.15, 124.89, 0, 0, -0.477158, 0.878817, 255, 1, 6, 10),
(34365, 180433, 0, 1731.44, 508.817, 41.359, 0, 0, 0.681998, 0.731354, 255, 1, 6, 10),
(34366, 180434, 0, 1707.36, 519.654, 34.9732, 0, 0, -0.309016, 0.951057, 255, 1, 6, 10),
(34367, 180432, 0, 1709.51, 509.677, 36.9045, 0, 0, 0.656058, 0.75471, 255, 1, 6, 10),
(34368, 180434, 0, 1735.59, 549.929, 33.6816, 0, 0, 0.0958452, 0.995396, 255, 1, 6, 10),
(34369, 180434, 0, 1714.29, 473.916, 61.6468, 0, 0, 0.902585, 0.430512, 255, 1, 6, 10),
(34370, 180432, 0, 1731.35, 474.773, 61.6564, 0, 0, 0.707107, 0.707107, 255, 1, 6, 10),
(34371, 180434, 0, 1759.49, 515.949, 35.3091, 0, 0, -0.492423, 0.870356, 255, 1, 6, 10),
(34372, 180434, 0, 1744.99, 475.504, 61.6564, 0, 0, -0.522498, 0.852641, 255, 1, 6, 10),
(34373, 180432, 0, 1750.81, 509.617, 38.3357, 0, 0, 0.694658, 0.71934, 255, 1, 6, 10),
(34374, 180411, 1, -4370.96, 3328.83, 28.7201, 0, 0, -0.67559, 0.737278, 255, 1, 6, 10),
(34375, 180471, 1, -4360.54, 3319.92, 21.281, 0, 0, -0.999657, 0.0262017, 255, 1, 6, 10),
(34376, 180472, 1, -4353.02, 3317, 21.784, 0, 0, -0.00872612, 0.999962, 255, 1, 6, 10),
(34377, 180406, 1, -4360.24, 3318.73, 14.4334, 0, 0, -0.983254, 0.182238, 255, 1, 6, 10),
(34378, 180472, 1, -4371.37, 3317.45, 21.4659, 0, 0, 0.737277, 0.675591, 255, 1, 6, 10),
(34379, 180471, 1, -4382.14, 3320.5, 21.234, 0, 0, 0.996194, 0.087165, 255, 1, 6, 10),
(34380, 180407, 1, -4382.49, 3319.27, 14.4422, 0, 0, -0.984807, 0.173652, 255, 1, 6, 10),
(34381, 180472, 1, -4340.62, 3301.73, 23.5147, 0, 0, 0.681998, 0.731354, 255, 1, 6, 10),
(34382, 180471, 1, -4349.34, 3301.98, 22.0187, 0, 0, 0.998629, 0.0523532, 255, 1, 6, 10),
(34383, 180472, 1, -4390.11, 3318, 21.9916, 0, 0, -0.999048, 0.0436193, 255, 1, 6, 10),
(34384, 180406, 1, -4337.6, 3295.78, 18.6969, 0, 0, 0.803857, 0.594823, 255, 1, 6, 10),
(34385, 180410, 1, -4353.52, 3295.18, 19.317, 0, 0, -0.731354, 0.681998, 255, 1, 6, 10),
(34386, 180471, 1, -4349.59, 3293.71, 22.0801, 0, 0, 0.0261765, 0.999657, 255, 1, 6, 10),
(34387, 180405, 1, -4387.96, 3309.8, 14.9332, 0, 0, -0.573576, 0.819152, 255, 1, 6, 10),
(34388, 180471, 1, -4392.77, 3309.38, 19.9972, 0, 0, -0.743144, 0.669132, 255, 1, 6, 10),
(34389, 180411, 1, -4327.14, 3287.82, 27.903, 0, 0, 0.999847, 0.0174693, 255, 1, 6, 10),
(34390, 180407, 1, -4389.1, 3301.69, 14.9135, 0, 0, -0.566406, 0.824126, 255, 1, 6, 10),
(34391, 180471, 1, -4349.85, 3283.19, 22.1567, 0, 0, 0.999657, 0.0262017, 255, 1, 6, 10),
(34392, 180472, 1, -4394.25, 3302.19, 21.6209, 0, 0, -0.999657, 0.0262017, 255, 1, 6, 10),
(34393, 180412, 1, -4379.91, 3292, 14.836, 0, 0, 0.414693, 0.909962, 255, 1, 6, 10),
(34394, 180405, 1, -4337.97, 3280.32, 18.6924, 0, 0, 0.83867, 0.54464, 255, 1, 6, 10),
(34395, 180471, 1, -4341.35, 3274.67, 22.2062, 0, 0, -0.0436192, 0.999048, 255, 1, 6, 10),
(34396, 180472, 1, -4350.06, 3274.93, 23.5513, 0, 0, -0.788011, 0.615662, 255, 1, 6, 10),
(34397, 180523, 1, -4381.68, 3279.98, 13.8363, 0, 0, 0.979924, 0.19937, 255, 1, 6, 10),
(34398, 180406, 1, -4389.75, 3277.26, 14.9121, 0, 0, -0.587785, 0.809017, 255, 1, 6, 10),
(34399, 180471, 1, -4391.23, 3261.16, 20.451, 0, 0, -0.700909, 0.713251, 255, 1, 6, 10),
(34400, 180471, 1, -4372.85, 3260.74, 20.0147, 0, 0, 0.0174522, 0.999848, 255, 1, 6, 10),
(34401, 180411, 1, -4373.13, 3249.73, 27.8623, 0, 0, 0.642787, 0.766045, 255, 1, 6, 10),
(34402, 180472, 1, -4362.25, 3257.48, 22.7778, 0, 0, -0.748956, 0.66262, 255, 1, 6, 10),
(34403, 180405, 1, -4389.1, 3269.09, 14.9168, 0, 0, -0.559193, 0.829038, 255, 1, 6, 10),
(34404, 180471, 1, -4394.86, 3277.05, 20.1297, 0, 0, -0.731354, 0.681998, 255, 1, 6, 10),
(34405, 180472, 1, -4393.83, 3269.74, 21.5106, 0, 0, -0.997563, 0.0697661, 255, 1, 6, 10),
(34406, 180471, 1, -4354.57, 3260.12, 20.382, 0, 0, 0.66913, 0.743145, 255, 1, 6, 10),
(34407, 180407, 1, -4384.11, 3259.27, 14.4343, 0, 0, 0.216439, 0.976296, 255, 1, 6, 10),
(34408, 180406, 1, -4361.85, 3258.67, 14.4313, 0, 0, 0.182235, 0.983255, 255, 1, 6, 10),
(34409, 180472, 1, -4383.75, 3258.02, 22.7724, 0, 0, -0.615661, 0.788011, 255, 1, 6, 10),
(34410, 180471, 1, 10153.9, 2244.09, 1333.74, 0, 0, 0.97437, 0.224951, 255, 1, 6, 10),
(34411, 180406, 1, 10152.1, 2238.2, 1344.3, 0, 0, -0.878817, 0.47716, 255, 1, 6, 10),
(34412, 180405, 1, 10139.1, 2229.3, 1344.3, 0, 0, -0.861628, 0.507539, 255, 1, 6, 10),
(34413, 180405, 1, 10135.5, 2228.11, 1329.61, 0, 0, -0.906307, 0.422619, 255, 1, 6, 10),
(34414, 180523, 1, 10139.2, 2223.77, 1330.25, 0, 0, 0.906307, 0.422619, 255, 1, 6, 10),
(34415, 180406, 1, 10125.6, 2220.15, 1344.3, 0, 0, -0.891007, 0.453991, 255, 1, 6, 10),
(34416, 180472, 1, 10129.5, 2227, 1334.85, 0, 0, 0.93358, 0.358368, 255, 1, 6, 10),
(34417, 180406, 1, 10126.6, 2222.05, 1329.61, 0, 0, -0.870356, 0.492424, 255, 1, 6, 10),
(34418, 180412, 1, 10125, 2224.55, 1328.38, 0, 0, -0.999962, 0.00873464, 255, 1, 6, 10),
(34419, 180471, 1, 10105.7, 2211.15, 1333.77, 0, 0, -0.788011, 0.615662, 255, 1, 6, 10),
(34420, 180407, 1, 10112.7, 2211.48, 1344.3, 0, 0, -0.906307, 0.422619, 255, 1, 6, 10),
(34421, 180407, 1, 9812.1, 932.718, 1308.52, 0, 0, -0.113203, 0.993572, 255, 1, 6, 10),
(34422, 180471, 1, 1612.7, -4463.88, 32.7327, 0, 0, 0.990268, 0.139175, 255, 1, 6, 10),
(34423, 180407, 0, 2436.84, 350.483, 33.7, 0, 0, 0.870356, 0.492424, 255, 1, 6, 10);

-- Add new objects to event.
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(34305, 12),
(34306, 12),
(34307, 12),
(34308, 12),
(34309, 12),
(34310, 12),
(34311, 12),
(34312, 12),
(34313, 12),
(34314, 12),
(34315, 12),
(34316, 12),
(34317, 12),
(34318, 12),
(34319, 12),
(34320, 12),
(34321, 12),
(34322, 12),
(34323, 12),
(34324, 12),
(34325, 12),
(34326, 12),
(34327, 12),
(34328, 12),
(34329, 12),
(34330, 12),
(34331, 12),
(34332, 12),
(34333, 12),
(34334, 12),
(34335, 12),
(34336, 12),
(34337, 12),
(34338, 12),
(34339, 12),
(34340, 12),
(34341, 12),
(34342, 12),
(34343, 12),
(34344, 12),
(34345, 12),
(34346, 12),
(34347, 12),
(34348, 12),
(34349, 12),
(34350, 12),
(34351, 12),
(34352, 12),
(34353, 12),
(34354, 12),
(34355, 12),
(34356, 12),
(34357, 12),
(34358, 12),
(34359, 12),
(34360, 12),
(34361, 12),
(34362, 12),
(34363, 12),
(34364, 12),
(34365, 12),
(34366, 12),
(34367, 12),
(34368, 12),
(34369, 12),
(34370, 12),
(34371, 12),
(34372, 12),
(34373, 12),
(34374, 12),
(34375, 12),
(34376, 12),
(34377, 12),
(34378, 12),
(34379, 12),
(34380, 12),
(34381, 12),
(34382, 12),
(34383, 12),
(34384, 12),
(34385, 12),
(34386, 12),
(34387, 12),
(34388, 12),
(34389, 12),
(34390, 12),
(34391, 12),
(34392, 12),
(34393, 12),
(34394, 12),
(34395, 12),
(34396, 12),
(34397, 12),
(34398, 12),
(34399, 12),
(34400, 12),
(34401, 12),
(34402, 12),
(34403, 12),
(34404, 12),
(34405, 12),
(34406, 12),
(34407, 12),
(34408, 12),
(34409, 12),
(34410, 12),
(34411, 12),
(34412, 12),
(34413, 12),
(34414, 12),
(34415, 12),
(34416, 12),
(34417, 12),
(34418, 12),
(34419, 12),
(34420, 12),
(34421, 12),
(34422, 12),
(34423, 12);

-- Correct quest details.
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=255;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=20 WHERE `entry`=314;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=418;
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=1387;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2981;
UPDATE `quest_template` SET `DetailsEmote2`=0 WHERE `entry`=3791;
UPDATE `quest_template` SET `DetailsEmote4`=5 WHERE `entry`=7482;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=1, `DetailsEmote4`=1, `DetailsEmoteDelay1`=0 WHERE `entry`=7722;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8311;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8312;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8353;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8354;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8355;
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1 WHERE `entry`=8356;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8357;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8358;
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=8359;
UPDATE `quest_template` SET `DetailsEmote2`=1 WHERE `entry`=8360;

-- Correct quest offer reward.
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='Ah, well done!  I hope the Alliance chokes on the foul gift we\'ve given them, much like we were forced to choke on the yoke of enslavement to the Scourge!$B$BYou\'ve kept the ideas of Hallow\'s End true, $N, and for that I salute you.  As an extra bonus, let me share some of these Hallow\'s End treats I have with you.  I think you might find them to be quite the enjoyable diversion!' WHERE `entry`=1657;
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmote2`=1, `OfferRewardText`='Well done, $N.  The Wickerman Festival will continue to be trouble so long as the abominable Forsaken are allowed to haunt the remnants of Lordaeron.  It is NOT a fitting tribute to that once proud kingdom, let me tell you...$B$BHere\'s some coin for any repairs you might need, and in the spirit of the season I\'ve also included some treats you might like.  Happy Hallow\'s End - let\'s keep it as safe as possible here in Southshore.' WHERE `entry`=1658;
UPDATE `quest_template` SET `OfferRewardEmote2`=0 WHERE `entry`=3788;
UPDATE `quest_template` SET `OfferRewardText`='Well done, $r. You have proven that while you are tolerant of others, you will stop at nothing to destroy the minions of Kel\'Thuzad.\n' WHERE `entry`=5243;
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=8311;
UPDATE `quest_template` SET `OfferRewardText`='Having successfully fought your way inside the inn, you now place the eggs inside the keg.  You can smell the foul odor permeating the air...' WHERE `entry`=8322;
UPDATE `quest_template` SET `OfferRewardText`='Too funny!  Well done, $N!  Here\'s your treat.$B$BHappy Hallow\'s End!' WHERE `entry`=8353;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Too funny!  Well done, $N!  Here\'s your treat.$B$BHappy Hallow\'s End!' WHERE `entry`=8354;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='Woo-woo!  Well done, $N!  Here\'s your treat.$B$BHappy Hallow\'s End!' WHERE `entry`=8355;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='You are truly mighty, haha!  Well done, and thanks for being such a good sport.  Here\'s your candy.$B$BHappy Hallow\'s End, $N!' WHERE `entry`=8356;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='You\'re quite the dancing machine, $N!$B$BHere\'s your treat for being such a good sport.  Happy Hallow\'s End, and give my best to your sick little friend!  I hope they get better soon.' WHERE `entry`=8357;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='Woo-woo!  Well done, $N!  Here\'s your treat.$B$BHappy Hallow\'s End!' WHERE `entry`=8358;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='You are truly mighty, haha!  Well done, and thanks for being such a good sport.  Here\'s your candy.$B$BHappy Hallow\'s End, $N!' WHERE `entry`=8359;
UPDATE `quest_template` SET `OfferRewardEmote2`=1, `OfferRewardText`='You\'re quite the dancing machine, $N!$B$BHere\'s your treat for being such a good sport.  Happy Hallow\'s End, and give my best to your sick little friend!  I hope they get better soon.' WHERE `entry`=8360;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardText`='Ah, it almost smells better around here already.  Almost.$B$BThanks to you, $N, Southshore just might make it through another Hallow\'s End.  Here\'s your treats, with my thanks!  If you run out of candy, I think there\'s a gnome named Katrina Shimmerstar in Ironforge who can sell you more; she\'s only around during Hallow\'s End, I believe.' WHERE `entry`=8373;
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `OfferRewardEmote3`=5, `OfferRewardText`='Ah, success!  You\'ve shown true Hallow\'s End spirit - FORSAKEN spirit, I should say!$B$B<Darkcaller Yanka laughs and rubs her hands together.>$B$BI revel in the fact that Southshore must now feast on bad ale or go without!  As for you, take these treats.  I believe you will find good use for them!' WHERE `entry`=8409;

-- Correct quest request items.
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='Have you gone up to Tirisfal Glade and checked things out?  They usually hold the festival close to the Undercity...' WHERE `entry`=1658;
UPDATE `quest_template` SET `IncompleteEmote`=1, `RequestItemsText`='My associate, the tauren sage, Korolusk, is recruiting his allies for this task.' WHERE `entry`=7482;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8311;
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=8312;
UPDATE `quest_template` SET `CompleteEmote`=0, `RequestItemsText`='The keg is filled with ale.' WHERE `entry`=8322;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25, `RequestItemsText`='I\'m waiting...' WHERE `entry`=8353;
UPDATE `quest_template` SET `IncompleteEmote`=25, `CompleteEmote`=25, `RequestItemsText`='I\'m waiting...' WHERE `entry`=8354;
UPDATE `quest_template` SET `IncompleteEmote`=11, `CompleteEmote`=11 WHERE `entry`=8355;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=8356;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='You know how to dance, don\'t you?  Try by putting your right foot in... then your right foot out... your right foot in... shake it all about...' WHERE `entry`=8357;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6 WHERE `entry`=8358;
UPDATE `quest_template` SET `IncompleteEmote`=1, `CompleteEmote`=1 WHERE `entry`=8359;
UPDATE `quest_template` SET `IncompleteEmote`=6, `CompleteEmote`=6, `RequestItemsText`='You know how to dance, don\'t you?  Try by putting your right foot in... then your right foot out... your right foot in... shake it all about...' WHERE `entry`=8360;
UPDATE `quest_template` SET `IncompleteEmote`=15, `CompleteEmote`=15, `RequestItemsText`='Those blasted Forsaken... it\'s already bad enough that they\'re undead, but then they get all riled up and start causing trouble in MY village!' WHERE `entry`=8373;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
