DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210524140709');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210524140709');
-- Add your query below.


-- Missing traps.
UPDATE `gameobject_template` SET `flags`=0, `script_name`='' WHERE `entry`=177417;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (177493, 0, 6, 327, 'Fire of Elune (Trap)', 0, 0, 1, 0, 0, 0, 18955, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (48907, 177493, 1, 5770.62, -4995.14, 810.364, 0.820305, 0, 0, 0.398749, 0.91706, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (48908, 177493, 1, 5607.76, -5028.4, 809.056, -1.58825, 0, 0, 0.71325, -0.700909, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (48944, 177493, 1, 5629.28, -4890.11, 806.031, 0.10472, 0, 0, 0.052336, 0.99863, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (48953, 177493, 1, 5695.09, -5057.97, 808.54, -2.56563, 0, 0, 0.95882, -0.284015, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (48954, 177493, 1, 5464.57, -4983.42, 851.758, -2.09439, 0, 0, 0.866025, -0.5, 900, 900, 100, 1, 0, 0, 0, 10);
UPDATE `gameobject_template` SET `flags`=16, `script_name`='' WHERE `entry`=177404;
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (177529, 0, 6, 327, 'Altar of Elune (Trap)', 0, 0, 1, 0, 0, 0, 18993, 0, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (49218, 177529, 1, 5514.49, -4917.57, 845.538, 2.3911, 0, 0, 0.930418, 0.366501, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (18955, 1, 10300, 0, 0, 0, 5875);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (18993, 1, 10300, 0, 0, 0, 5875);

-- Correct unit flags for Priestess of Elune.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=12116;

-- Correct unit flags for Voice of Elune.
UPDATE `creature_template` SET `unit_flags`=33555200 WHERE `entry`=12152;

-- Correct unit flags for Guardian of Elune.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=12140;

-- Remove hardcoded script from Ranshalla.
DELETE FROM `script_waypoint` WHERE `entry`=10300;
UPDATE `creature_template` SET `script_name`='', `flags_extra`=`flags_extra` | 524288 WHERE `entry`=10300;

-- Remove texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1780149, -1780150, -1780151, -1780152, -1780153, -1780154, -1780155, -1780157, -1780158, -1780159, -1780160, -1780161, -1780162, -1780163, -1780164, -1780165, -1780166, -1780167, -1780168, -1780169, -1780170, -1780171, -1780172, -1780173, -1780174, -1780175, -1780176, -1780178, -1780179, -1780180, -1780181, -1780182, -1780183);

-- Waypoints for Ranshalla.
DELETE FROM `creature_movement_template` WHERE `entry`=10300;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(10300, 1, 5717.890137, -4794.959961, 778.146973, 100.000000, 0, 0.000000, 0),
(10300, 2, 5727.169922, -4803.649902, 778.065979, 100.000000, 0, 0.000000, 0),
(10300, 3, 5730.779785, -4807.779785, 777.900024, 100.000000, 0, 0.000000, 0),
(10300, 4, 5729.790039, -4833.950195, 777.630981, 100.000000, 3000, 0.000000, 1030004),
(10300, 5, 5725.509766, -4840.390137, 779.768005, 100.000000, 0, 0.000000, 0),
(10300, 6, 5723.839844, -4842.890137, 780.703003, 100.000000, 0, 0.000000, 0),
(10300, 7, 5717.470215, -4869.899902, 789.249023, 100.000000, 0, 0.000000, 0),
(10300, 8, 5716.359863, -4874.649902, 790.966003, 100.000000, 0, 0.000000, 0),
(10300, 9, 5701.189941, -4900.220215, 799.614014, 100.000000, 0, 0.000000, 0),
(10300, 10, 5699.240234, -4903.450195, 800.655029, 100.000000, 0, 0.000000, 0),
(10300, 11, 5681.100098, -4919.770020, 802.942017, 100.000000, 0, 0.000000, 0),
(10300, 12, 5665.319824, -4923.390137, 804.982971, 100.000000, 0, 0.000000, 0),
(10300, 13, 5633.240234, -4893.879883, 805.171997, 100.000000, 3000, 0.000000, 1030013),
(10300, 14, 5633.240234, -4893.879883, 805.171997, 100.000000, 1000, 0.000000, 1030014),
(10300, 15, 5662.540039, -4921.189941, 805.390015, 100.000000, 0, 0.000000, 0),
(10300, 16, 5684.509766, -4944.649902, 803.109009, 100.000000, 0, 0.000000, 0),
(10300, 17, 5686.870117, -4947.279785, 803.513977, 100.000000, 0, 0.000000, 0),
(10300, 18, 5711.790039, -4972.899902, 807.291992, 100.000000, 0, 0.000000, 0),
(10300, 19, 5725.060059, -4982.229980, 808.218018, 100.000000, 0, 0.000000, 0),
(10300, 20, 5733.140137, -4985.640137, 810.320984, 100.000000, 0, 0.000000, 0),
(10300, 21, 5764.080078, -4993.600098, 809.349976, 100.000000, 3000, 0.000000, 1030013),
(10300, 22, 5764.080078, -4993.600098, 809.349976, 100.000000, 1000, 0.000000, 1030014),
(10300, 23, 5730.819824, -4985.040039, 810.229980, 100.000000, 0, 0.000000, 0),
(10300, 24, 5708.930176, -4987.609863, 808.039001, 100.000000, 0, 0.000000, 0),
(10300, 25, 5696.629883, -4993.000000, 807.705994, 100.000000, 0, 0.000000, 0),
(10300, 26, 5686.080078, -5005.770020, 807.148010, 100.000000, 0, 0.000000, 0),
(10300, 27, 5688.290039, -5020.129883, 808.481018, 100.000000, 0, 0.000000, 0),
(10300, 28, 5693.729980, -5052.540039, 807.630981, 100.000000, 3000, 0.000000, 1030013),
(10300, 29, 5693.729980, -5052.540039, 807.630981, 100.000000, 1000, 0.000000, 1030014),
(10300, 30, 5690.069824, -5030.750000, 807.224976, 100.000000, 0, 0.000000, 0),
(10300, 31, 5688.220215, -5019.700195, 808.403992, 100.000000, 0, 0.000000, 0),
(10300, 32, 5677.759766, -5010.370117, 807.273010, 100.000000, 0, 0.000000, 0),
(10300, 33, 5673.759766, -5007.720215, 807.273010, 100.000000, 0, 0.000000, 0),
(10300, 34, 5663.549805, -5004.390137, 807.479980, 100.000000, 0, 0.000000, 0),
(10300, 35, 5648.750000, -5002.860000, 807.529000, 100.000000, 0, 0.000000, 0),
(10300, 36, 5635.419922, -5010.359863, 809.093994, 100.000000, 0, 0.000000, 0),
(10300, 37, 5612.029785, -5025.560059, 808.172974, 100.000000, 3000, 0.000000, 1030013),
(10300, 38, 5612.029785, -5025.560059, 808.172974, 100.000000, 1000, 0.000000, 1030014),
(10300, 39, 5639.430176, -5007.759766, 809.080017, 100.000000, 0, 0.000000, 0),
(10300, 40, 5649.620117, -4992.580078, 808.078979, 100.000000, 0, 0.000000, 0),
(10300, 41, 5648.129883, -4980.479980, 808.260010, 100.000000, 0, 0.000000, 0),
(10300, 42, 5641.430176, -4968.700195, 808.807007, 100.000000, 0, 0.000000, 0),
(10300, 43, 5618.089844, -4947.399902, 812.651001, 100.000000, 0, 0.000000, 0),
(10300, 44, 5615.049805, -4944.919922, 814.080994, 100.000000, 0, 0.000000, 0),
(10300, 45, 5589.810059, -4936.910156, 825.362000, 100.000000, 0, 0.000000, 0),
(10300, 46, 5561.459961, -4937.189941, 833.450989, 100.000000, 0, 0.000000, 0),
(10300, 47, 5534.509766, -4942.399902, 839.643982, 100.000000, 0, 0.000000, 0),
(10300, 48, 5513.120117, -4948.540039, 848.273010, 100.000000, 0, 0.000000, 0),
(10300, 49, 5509.720215, -4949.569824, 849.705017, 100.000000, 0, 0.000000, 0),
(10300, 50, 5495.089844, -4955.649902, 851.414001, 100.000000, 0, 0.000000, 0),
(10300, 51, 5490.569824, -4957.939941, 851.546997, 100.000000, 0, 0.000000, 0),
(10300, 52, 5469.060059, -4979.149902, 850.697021, 100.000000, 3000, 0.000000, 1030013),
(10300, 53, 5469.060059, -4979.149902, 850.697021, 100.000000, 1000, 0.000000, 1030014),
(10300, 54, 5491.259766, -4956.109863, 851.627991, 100.000000, 0, 0.000000, 0),
(10300, 55, 5495.399902, -4951.799805, 851.265015, 100.000000, 0, 0.000000, 0),
(10300, 56, 5506.109863, -4938.899902, 848.039001, 100.000000, 0, 0.000000, 0),
(10300, 57, 5518.490234, -4921.870117, 844.687012, 100.000000, 5000, 0.000000, 1030057),
(10300, 58, 5518.490234, -4921.870117, 844.687012, 2.319580, 3000, 0.000000, 1030013),
(10300, 59, 5518.490234, -4921.870117, 844.687012, 2.319580, 1000, 0.000000, 1030059),
(10300, 60, 5517.060059, -4912.620117, 846.075989, 100.000000, 0, 0.000000, 0),
(10300, 61, 5510.100098, -4913.629883, 847.500000, 5.551790, 1000, 0.000000, 1030061),
(10300, 62, 5510.100098, -4913.629883, 847.500000, 5.551790, 0, 0.000000, 0);

-- Waypoint scripts.
DELETE FROM `creature_movement_scripts` WHERE `id`=1030004;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1030004, 0, 0, 0, 0, 0, 0, 4901, 0, 21, 0, 7375, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1030013;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1030013, 0, 15, 18953, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Cast Spell Ranshalla Waiting'),
(1030013, 0, 0, 0, 0, 0, 0, 4901, 0, 21, 0, 7378, 7379, 7380, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030013, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7467, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1030014;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1030014, 0, 0, 0, 0, 0, 0, 4901, 0, 21, 0, 7410, 7411, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1030057;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1030057, 0, 0, 0, 0, 0, 0, 4901, 0, 21, 0, 7385, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030057, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7386, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030057, 4, 2, 9, 0, 0, 0, 177404, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Altar of Elune - Set Flags');
DELETE FROM `creature_movement_scripts` WHERE `id`=1030059;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1030059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7412, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1030061;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1030061, 1, 76, 177415, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5511.9, -4918.36, 846.461, 5.07891, 0, 'Light of Elune - Summon GameObject Light of Elune'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5527.26, -4912.58, 843.406, 1.69297, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5522.46, -4927.17, 842.977, 0.994837, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5504.72, -4907.62, 849.14, 3.61284, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5498.32, -4920.97, 849.679, 5.74214, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5517.6, -4901.66, 845.948, 2.32129, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177419, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5508, -4931.3, 846.031, 0.314158, 0, 'Light of Elune (SMALL) - Summon GameObject Light of Elune (SMALL)'),
(1030061, 1, 76, 177418, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5511.23, -4915.28, 847.05, 4.08407, 0, 'Light of Elune (LARGE) - Summon GameObject Light of Elune (LARGE)'),
(1030061, 1, 76, 177415, 125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5514.62, -4915.22, 846.298, 2.91469, 0, 'Light of Elune - Summon GameObject Light of Elune'),
(1030061, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7388, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030061, 6, 10, 12116, 116000, 0, 0, 0, 0, 0, 0, 0, 750, -1, 1, 5501.97, -4920.5, 848.736, 0.244346, 0, 'Priestess of Elune - Summon Creature Priestess of Elune 1'),
(1030061, 6, 10, 12116, 116000, 0, 0, 0, 0, 0, 0, 0, 751, -1, 1, 5516.34, -4902.81, 846.321, 4.82861, 0, 'Priestess of Elune - Summon Creature Priestess of Elune 2'),
(1030061, 6, 10, 12152, 116000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 5514.27, -4917.42, 846.21, 1.74533, 0, 'Voice of Elune - Summon Creature Voice of Elune'),
(1030061, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7391, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030061, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7392, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030061, 21, 3, 0, 3878, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5510.38, -4922.52, 846.102, 0, 0, 'Ranshalla - Move'),
(1030061, 23, 3, 0, 5209, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5517.27, -4922.39, 844.854, 0, 0, 'Ranshalla - Move'),
(1030061, 31, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.40855, 0, 'Ranshalla - Set Orientation'),
(1030061, 37, 76, 177414, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5514.45, -4917.49, 847.357, 1.09956, 0, 'Gem of Elune - Summon GameObject Gem of Elune'),
(1030061, 37, 76, 177416, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5514.31, -4917.43, 846.117, 4.72984, 0, 'Aura of Elune (SMALL) - Summon GameObject Aura of Elune (SMALL)'),
(1030061, 37, 76, 177486, 89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5514.17, -4917.21, 846.175, 6.26573, 0, 'Aura of Elune (LARGE) - Summon GameObject Aura of Elune (LARGE)'),
(1030061, 69, 10, 12140, 54000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 5499.57, -4904.06, 850.518, 5.56691, 0, 'Guardian of Elune - Summon Creature Guardian of Elune'),
(1030061, 70, 3, 0, 5429, 0, 2, 12140, 30, 8, 2, 0, 0, 0, 0, 5511.6, -4914.9, 847.088, 0, 0, 'Guardian of Elune - Move'),
(1030061, 77, 35, 1, 0, 0, 0, 12140, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.53824, 0, 'Guardian of Elune - Set Orientation'),
(1030061, 83, 0, 0, 0, 0, 0, 12152, 30, 8, 2, 7416, 0, 0, 0, 0, 0, 0, 0, 0, 'Voice of Elune - Say Text'),
(1030061, 89, 15, 18994, 0, 0, 0, 12140, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Elune - Cast Spell Ranshalla - Bind Wildkin'),
(1030061, 89, 35, 1, 0, 0, 0, 12140, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 5.53824, 0, 'Guardian of Elune - Set Orientation'),
(1030061, 109, 1, 53, 0, 0, 0, 12140, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Elune - Emote OneShotBattleRoar'),
(1030061, 112, 3, 0, 6797, 0, 2, 12140, 30, 8, 2, 0, 0, 0, 0, 5499.25, -4903.9, 850.52, 0, 0, 'Guardian of Elune - Move'),
(1030061, 120, 15, 18994, 0, 0, 0, 12140, 30, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardian of Elune - Cast Spell Ranshalla - Bind Wildkin'),
(1030061, 120, 35, 1, 0, 0, 0, 12140, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 2.42047, 0, 'Guardian of Elune - Set Orientation'),
(1030061, 125, 87, 0, 0, 0, 0, 177404, 30, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Altar of Elune - Reset Button'),
(1030061, 131, 35, 0, 0, 0, 0, 4901, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Set Orientation'),
(1030061, 131, 0, 0, 0, 0, 0, 4901, 0, 21, 0, 7434, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030061, 134, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Set Stand State'),
(1030061, 134, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.0945, 0, 'Ranshalla - Set Orientation'),
(1030061, 135, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Reset Home Position'),
(1030061, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7435, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Say Text'),
(1030061, 135, 18, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - Despawn in 30 seconds'),
(1030061, 135, 62, 4901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ranshalla - End Event');

-- Summon script for Priestess of Elune 1.
DELETE FROM `generic_scripts` WHERE `id`=750;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(750, 1, 3, 0, 3635, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5510.3, -4921.18, 846.442, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(750, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.05629, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(750, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7390, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7393, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7394, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 77, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.36696, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(750, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7419, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 83, 3, 0, 1671, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5514.29, -4920.21, 845.747, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(750, 86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7422, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7424, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(750, 108, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Emote OneShotBow'),
(750, 108, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.05629, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(750, 111, 3, 0, 7902, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5495.57, -4921.99, 850.761, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(750, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7432, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text');

-- Summon script for Priestess of Elune 2.
DELETE FROM `generic_scripts` WHERE `id`=751;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(751, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5517.92, -4913.22, 845.797, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(751, 4, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.02655, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(751, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7389, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 35, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.90954, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(751, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7413, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 39, 3, 0, 2091, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5517.65, -4918.41, 845.364, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(751, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7414, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 48, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.11381, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(751, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7415, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7417, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7418, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7427, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7428, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text'),
(751, 108, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Emote OneShotBow'),
(751, 108, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.69494, 0, 'Guardians of the Altar: Priestess of Elune - Set Orientation'),
(751, 111, 3, 0, 6606, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 5515.91, -4902.12, 846.43, 0, 0, 'Guardians of the Altar: Priestess of Elune - Move'),
(751, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7431, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Priestess of Elune - Say Text');

-- Script on quest failed.
DELETE FROM `generic_scripts` WHERE `id`=490100;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(490100, 0, 70, 4901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar Failed: Fail Quest'),
(490100, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar Failed: Ranshalla - Reset Home Position'),
(490100, 1, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar Failed: Ranshalla - Respawn');

-- Script on quest completed.
DELETE FROM `generic_scripts` WHERE `id`=490101;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(490101, 0, 7, 4901, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar Complete: Complete Quest');

-- Script on accepting quest.
DELETE FROM `quest_start_scripts` WHERE `id`=4901;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4901, 0, 61, 4901, 1800, 0, 0, 0, 0, 0, 8, 0, 490101, 6303, 490100, 0, 0, 0, 0, 0, 'Guardians of the Altar: Start Scripted Map Event'),
(4901, 1, 20, 2, 0, 0, 1, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Ranshalla - Start Waypoints'),
(4901, 1, 22, 10, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Ranshalla - Set Faction'),
(4901, 1, 4, 147, 3, 2, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Ranshalla - Remove Gossip and Quest Giver Flags'),
(4901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 8, 7365, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Ranshalla - Say Text');
UPDATE `quest_template` SET `StartScript`=4901 WHERE `entry`=4901;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
