DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210401204014');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210401204014');
-- Add your query below.


-- mana surge should not drop loot 
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 6550;

-- musty tome must despawn after used (has that flag set up.. but with restock timer it will never happen)
-- UPDATE `gameobject_template` SET `data2`=0 WHERE `entry` IN (176150,176151);
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE id = 176151;
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE id = 176150;

-- onu play sound OOC
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3616;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (361601, 3616, 0, 1, 0, 100, 1, 100, 5000, 40000, 90000, 361601, 0, 0, 'Onu - Play Sound on OOC Timer');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (361601, 0, 16, 6528, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Onu - Play Sound');

-- update darnassus sentinel waypoints (credit cmangos)
UPDATE `creature` SET `position_x` = 8644.208, `position_y` = 853.2105, `position_z` = 22.355267, `orientation` = 1.50239 WHERE `guid` = 46825;
DELETE FROM `creature_movement` WHERE `id` = 46825;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime` , `script_id`) VALUES
(46825, 1, 8647.808, 868.63934, 23.212633, 100, 0, 0),
(46825, 2, 8657.981, 873.3514, 22.37611, 100, 0, 0),
(46825, 3, 8670.864, 876.9106, 22.123152, 100, 0, 0),
(46825, 4, 8680.514, 881.326, 23.230516, 100, 0, 0),
(46825, 5, 8685.484, 889.3323, 22.422583, 100, 0, 0),
(46825, 6, 8686.014, 904.0842, 21.40408, 100, 0, 0),
(46825, 7, 8687.324, 922.13214, 16.083908, 100, 0, 0),
(46825, 8, 8689.776, 930.66925, 15.553102, 100, 0, 0),
(46825, 9, 8696.605, 941.5968, 13.781057, 100, 0, 0),
(46825, 10, 8696.757, 949.54407, 13.006399, 100, 0, 0),
(46825, 11, 8695.549, 956.4781, 12.202627, 100, 0, 0),
(46825, 12, 8691.133, 966.0688, 11.514212, 100, 0, 0),
(46825, 13, 8684.711, 974.0922, 10.755286, 100, 0, 0),
(46825, 14, 8676.798, 984.3464, 8.006629, 100, 0, 0),
(46825, 15, 8682.726, 987.4831, 9.514258, 100, 0, 0),
(46825, 16, 8689.632, 988.9705, 11.368621, 100, 0, 0),
(46825, 17, 8682.726, 987.4831, 9.514258, 100, 0, 0),
(46825, 18, 8676.798, 984.3464, 8.006629, 100, 0, 0),
(46825, 19, 8684.711, 974.0922, 10.755286, 100, 0, 0),
(46825, 20, 8691.133, 966.0688, 11.514212, 100, 0, 0),
(46825, 21, 8695.549, 956.4781, 12.202627, 100, 0, 0),
(46825, 22, 8696.757, 949.54407, 13.006399, 100, 0, 0),
(46825, 23, 8696.605, 941.5968, 13.781057, 100, 0, 0),
(46825, 24, 8689.776, 930.66925, 15.553102, 100, 0, 0),
(46825, 25, 8687.324, 922.13214, 16.083908, 100, 0, 0),
(46825, 26, 8686.014, 904.0842, 21.40408, 100, 0, 0),
(46825, 27, 8685.484, 889.3323, 22.422583, 100, 0, 0),
(46825, 28, 8680.514, 881.326, 23.230516, 100, 0, 0),
(46825, 29, 8670.864, 876.9106, 22.123152, 100, 0, 0),
(46825, 30, 8657.981, 873.3514, 22.37611, 100, 0, 0),
(46825, 31, 8647.808, 868.63934, 23.212633, 100, 0, 0),
(46825, 32, 8644.208, 853.2105, 22.355267, 100, 0, 0);

-- add hagg taurenbane spawns (credit cmangos)                                         
UPDATE `creature` SET `position_x` = -4006.34375, `position_y` = -1752.7042236328125, `position_z` = 97.34051513671875, `orientation` = 5.724679946899414062 WHERE `guid` = 20877;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(20941, 5859, 1, -4212.91, -2274.4, 50.3081, 3.14864, 19800, 19800, 100, 0, 0, 0, 10),
(20942, 5859, 1, -4212.91, -2274.4, 50.3081, 3.14864, 19800, 19800, 100, 0, 0, 0, 10),
(20943, 5859, 1, -4212.91, -2274.4, 50.3081, 3.14864, 19800, 19800, 100, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(120, 1, 'Hagg Taurenbane (5859)');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(20877, 120, 'Hagg Taurenbane #1'),
(20941, 120, 'Hagg Taurenbane #2'),
(20942, 120, 'Hagg Taurenbane #3'),
(20943, 120, 'Hagg Taurenbane #4');

-- update bael'dun keep spawns (credit cmangos)
DELETE FROM `creature_movement` WHERE `id` IN (13670, 13638, 13668, 13667, 13674);
UPDATE `creature` SET `position_x` = -4073.6220703125, `position_y` = -2275.51025390625, `position_z` = 123.2482376098632812, `orientation` = 3.826325893402099609, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13648;
UPDATE `creature` SET `position_x` = -4046.876708984375, `position_y` = -2287.065185546875, `position_z` = 119.27734375, `orientation` = 5.50900888442993164, `wander_distance` = 3 WHERE `guid` = 13649;
UPDATE `creature` SET `position_x` = -4116.95556640625, `position_y` = -2312.180908203125, `position_z` = 127.6861343383789062, `orientation` = 2.477593421936035156, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13641;
UPDATE `creature` SET `position_x` = -4099.82080078125, `position_y` = -2328.198486328125, `position_z` = 126.21124267578125, `orientation` = 1.884955525398254394 WHERE `guid` = 13642;
UPDATE `creature` SET `position_x` = -4086.07080078125, `position_y` = -2322.52734375, `position_z` = 126.2125167846679687, `orientation` = 2.042035102844238281 WHERE `guid` = 13643;
UPDATE `creature` SET `position_x` = -4107.5546875, `position_y` = -2352.7587890625, `position_z` = 127.6026992797851562, `orientation` = 3.70369720458984375, `wander_distance` = 3 WHERE `guid` = 13644;
UPDATE `creature` SET `position_x` = -4098.99072265625, `position_y` = -2372.481689453125, `position_z` = 126.2137527465820312, `orientation` = 5.922992229461669921 WHERE `guid` = 13646;
UPDATE `creature` SET `position_x` = -4091.74169921875, `position_y` = -2385.422607421875, `position_z` = 124.8254852294921875, `orientation` = 5.976780891418457031, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13638;
UPDATE `creature` SET `position_x` = -4058.741455078125, `position_y` = -2385.67236328125, `position_z` = 126.2137985229492187, `orientation` = 4.184454917907714843, `wander_distance` = 1, `movement_type` = 1 WHERE `guid` = 13633;
UPDATE `creature` SET `position_x` = -4080.41064453125, `position_y` = -2365.312255859375, `position_z` = 126.2137374877929687, `orientation` = 5.538718223571777343, `wander_distance` = 3 WHERE `guid` = 13647;
UPDATE `creature` SET `position_x` = -4068.97607421875, `position_y` = -2377.65380859375, `position_z` = 110.3807830810546875, `orientation` = 2.129301786422729492 WHERE `guid` = 13636;
UPDATE `creature` SET `position_x` = -4071.76171875, `position_y` = -2360.882568359375, `position_z` = 126.2137374877929687, `orientation` = 5.11779022216796875, `wander_distance` = 3 WHERE `guid` = 13645;
UPDATE `creature` SET `position_x` = -4035.935791015625, `position_y` = -2398.487060546875, `position_z` = 135.9376068115234375, `orientation` = 4.787994861602783203, `wander_distance` = 3 WHERE `guid` = 13662;
UPDATE `creature` SET `position_x` = -4071.420654296875, `position_y` = -2357.952392578125, `position_z` = 108.9924774169921875, `orientation` = 5.047953605651855468, `wander_distance` = 3 WHERE `guid` = 13634;
UPDATE `creature` SET `position_x` = -4050.10986328125, `position_y` = -2410.66259765625, `position_z` = 135.9365386962890625, `orientation` = 4.310963153839111328, `wander_distance` = 3 WHERE `guid` = 13640;
UPDATE `creature` SET `position_x` = -4058, `position_y` = -2417.599853515625, `position_z` = 126.219482421875, `orientation` = 1.443122506141662597, `wander_distance` = 3 WHERE `guid` = 13639;
UPDATE `creature` SET `position_x` = -4059.4619140625, `position_y` = -2414.691162109375, `position_z` = 135.936737060546875, `orientation` = 4.204134464263916015, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13635;

UPDATE `creature` SET `position_x` = -4055.1376953125, `position_y` = -2306.86669921875, `position_z` = 127.787078857421875, `orientation` = 4.270235538482666015, `wander_distance` = 3 WHERE `guid` = 13689;
UPDATE `creature` SET `position_x` = -4105.28955078125, `position_y` = -2295.9501953125, `position_z` = 126.5861282348632812, `orientation` = 6.160146713256835937, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13669;
UPDATE `creature` SET `position_x` = -4083.8212890625, `position_y` = -2335.78076171875, `position_z` = 126.2137451171875, `orientation` = 3.37507486343383789, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13670;
UPDATE `creature` SET `position_x` = -4069.796142578125, `position_y` = -2299.737060546875, `position_z` = 124.76275634765625, `orientation` = 3.944444179534912109, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13690;
UPDATE `creature` SET `position_x` = -4084.69189453125, `position_y` = -2345.906982421875, `position_z` = 126.2137527465820312, `orientation` = 5.969049453735351562, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13672;
UPDATE `creature` SET `position_x` = -4124.1611328125, `position_y` = -2332.4765625, `position_z` = 128.82806396484375, `orientation` = 1.902408838272094726, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13671;
UPDATE `creature` SET `position_x` = -4074.55517578125, `position_y` = -2392.81884765625, `position_z` = 118.1594161987304687, `orientation` = 0.059694856405258178, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13668;
UPDATE `creature` SET `position_x` = -4084.069091796875, `position_y` = -2397.787353515625, `position_z` = 135.938751220703125, `orientation` = 3.50811171531677246, `wander_distance` = 3 WHERE `guid` = 13666;
UPDATE `creature` SET `position_x` = -4064.229248046875, `position_y` = -2331.41845703125, `position_z` = 127.6026687622070312, `orientation` = 0.496271520853042602 WHERE `guid` = 13673;
UPDATE `creature` SET `position_x` = -4084.97314453125, `position_y` = -2388.474365234375, `position_z` = 118.1597824096679687, `orientation` = 2.247568845748901367, `wander_distance` = 3 WHERE `guid` = 13664;
UPDATE `creature` SET `position_x` = -4055.341064453125, `position_y` = -2380.49853515625, `position_z` = 118.1593856811523437, `orientation` = 0.715584993362426757, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13667;
UPDATE `creature` SET `position_x` = -4053.16455078125, `position_y` = -2354.985107421875, `position_z` = 126.2137374877929687, `orientation` = 5.252184867858886718, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 13674;
UPDATE `creature` SET `position_x` = -4043.064697265625, `position_y` = -2382.08642578125, `position_z` = 135.9406280517578125, `orientation` = 5.560290336608886718, `wander_distance` = 3 WHERE `guid` = 13691;
UPDATE `creature` SET `position_x` = -4078.411376953125, `position_y` = -2369.834716796875, `position_z` = 108.9921188354492187, `orientation` = 1.675516128540039062 WHERE `guid` = 13665;
UPDATE `creature` SET `position_x` = -4092.169677734375, `position_y` = -2377.300048828125, `position_z` = 135.938262939453125, `orientation` = 2.575075626373291015, `wander_distance` = 3 WHERE `guid` = 13663;

UPDATE `creature` SET `position_x` = -4079.028564453125, `position_y` = -2305.741455078125, `position_z` = 125.7790985107421875, `orientation` = 1.815142393112182617 WHERE `guid` = 13700;
UPDATE `creature` SET `position_x` = -4068.24267578125, `position_y` = -2364.6298828125, `position_z` = 108.9923095703125, `orientation` = 2.460914134979248046 WHERE `guid` = 13693;
UPDATE `creature` SET `position_x` = -4050.232666015625, `position_y` = -2366.896484375, `position_z` = 118.1592483520507812, `orientation` = 4.23455810546875 WHERE `guid` = 13692;
UPDATE `creature` SET `position_x` = -4060.27392578125, `position_y` = -2392.2861328125, `position_z` = 126.2138595581054687, `orientation` = 4.291341781616210937, `wander_distance` = 2, `movement_type` = 1 WHERE `guid` = 13699;
UPDATE `creature` SET `position_x` = -4070.25830078125, `position_y` = -2419.35107421875, `position_z` = 135.937255859375, `orientation` = 4.460751533508300781 WHERE `guid` = 13694;
UPDATE `creature` SET `position_x` = -4083.482177734375, `position_y` = -2363.377685546875, `position_z` = 108.9924850463867187, `orientation` = 2.595665693283081054 WHERE `guid` = 13695;
UPDATE `creature` SET `position_x` = -4085.991455078125, `position_y` = -2394.42529296875, `position_z` = 124.825714111328125, `orientation` = 1.274184226989746093, `wander_distance` = 2, `movement_type` = 1 WHERE `guid` = 13696;
UPDATE `creature` SET `position_x` = -4034.768310546875, `position_y` = -2403.956298828125, `position_z` = 126.21417236328125, `orientation` = 5.756762504577636718, `wander_distance` = 2, `movement_type` = 1 WHERE `guid` = 13698;
UPDATE `creature` SET `position_x` = -4056.475830078125, `position_y` = -2356.2421875, `position_z` = 135.938140869140625, `orientation` = 2.960889339447021484 WHERE `guid` = 13697;
UPDATE `creature` SET `position_x` = -4071.732666015625, `position_y` = -2381.637939453125, `position_z` = 126.2137374877929687, `orientation` = 2.429510831832885742, `wander_distance` = 2, `movement_type` = 1 WHERE `guid` = 13701;
UPDATE `creature` SET `wander_distance`= 2 WHERE `guid` = 51819;

-- update bluff runner windstrider waypoints (credit cmangos)
UPDATE `creature` SET `position_x` = -1258.878, `position_y` = 53.962566, `position_z` = 126.969604 WHERE id = 10881;
DELETE FROM `creature_movement` WHERE `id` IN (SELECT `guid` FROM `creature` WHERE `id` = 10881);
DELETE FROM `creature_movement_template` WHERE `entry` = 10881;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(10881, 1, -1258.878, 53.962566, 126.969604, 100, 0, 0),
(10881, 2, -1246.9214, 65.498535, 127.314575, 100, 0, 0),
(10881, 3, -1224.9215, 87.38759, 131.42007, 100, 0, 0),
(10881, 4, -1210.0996, 106.45025, 134.02478, 100, 0, 0),
(10881, 5, -1205.4197, 118.94437, 134.62341, 100, 0, 0),
(10881, 6, -1210.4836, 129.97784, 134.47864, 100, 0, 0),
(10881, 7, -1224.1403, 138.96002, 133.51216, 100, 0, 0),
(10881, 8, -1242.7533, 133.13496, 132.38449, 100, 0, 0),
(10881, 9, -1263.6498, 129.13365, 131.77036, 100, 0, 0),
(10881, 10, -1278.4678, 122.21289, 131.34344, 100, 0, 0),
(10881, 11, -1292.0016, 108.51972, 131.21844, 100, 0, 0),
(10881, 12, -1279.579, 89.99417, 129.15378, 100, 0, 0),
(10881, 13, -1265.1466, 72.79845, 127.73132, 100, 0, 0),
(10881, 14, -1246.938, 66.752495, 127.50574, 100, 0, 0),
(10881, 15, -1225.2654, 87.69873, 131.45486, 100, 0, 0),
(10881, 16, -1209.452, 106.00795, 134.10266, 100, 0, 0),
(10881, 17, -1204.6263, 118.88873, 134.81384, 100, 0, 0),
(10881, 18, -1209.9927, 130.29185, 134.53772, 100, 0, 0),
(10881, 19, -1224.5853, 137.18607, 133.47163, 100, 0, 0),
(10881, 20, -1242.8, 133.86388, 132.55144, 100, 0, 0),
(10881, 21, -1264.6481, 129.59421, 131.83456, 100, 0, 0),
(10881, 22, -1291.852, 107.38696, 131.2923, 100, 0, 0),
(10881, 23, -1263.6343, 73.05393, 127.68298, 100, 0, 0),
(10881, 24, -1271.1027, 62.49056, 127.41394, 100, 0, 0),
(10881, 25, -1297.4215, 60.88097, 128.78162, 100, 0, 0),
(10881, 26, -1323.3235, 55.73557, 129.12485, 100, 0, 0),
(10881, 27, -1331.5046, 43.56836, 129.24985, 100, 0, 0),
(10881, 28, -1328.7695, 28.182346, 129.32643, 100, 0, 0),
(10881, 29, -1321.5947, 15.010742, 130.22414, 100, 0, 0),
(10881, 30, -1313.2676, 5.03125, 132.57643, 100, 0, 0),
(10881, 31, -1298.2849, 0.096191, 133.16522, 100, 0, 0),
(10881, 32, -1285.0809, -2.094455, 134.23892, 100, 0, 0),
(10881, 33, -1278.8915, -16.228027, 140.63223, 100, 0, 0),
(10881, 34, -1279.4957, -21.175594, 142.65372, 100, 0, 0),
(10881, 35, -1280.5413, -31.30919, 146.36734, 100, 0, 0),
(10881, 36, -1280.6606, -36.26666, 148.2692, 100, 0, 0),
(10881, 37, -1281.3783, -47.740993, 152.14688, 100, 0, 0),
(10881, 38, -1281.7482, -58.54069, 155.19382, 100, 0, 0),
(10881, 39, -1282.2838, -70.57406, 157.78886, 100, 0, 0),
(10881, 40, -1267.4594, -79.44803, 162.63017, 100, 0, 0),
(10881, 41, -1254.8102, -78.07655, 162.99677, 100, 0, 0),
(10881, 42, -1230.3444, -67.61344, 162.36197, 100, 0, 0),
(10881, 43, -1228.4113, -82.74897, 162.67325, 100, 0, 0),
(10881, 44, -1219.8137, -97.4598, 162.8417, 100, 0, 0),
(10881, 45, -1201.5387, -100.09386, 162.89145, 100, 0, 0),
(10881, 46, -1192.1188, -91.5574, 162.72011, 100, 0, 0),
(10881, 47, -1185.5045, -81.63634, 162.54579, 100, 0, 0),
(10881, 48, -1184.0348, -66.65267, 161.89906, 100, 0, 0),
(10881, 49, -1188.6537, -50.857475, 161.88515, 100, 0, 0), 
(10881, 50, -1200.2048, -36.68023, 162.40787, 100, 0, 0),
(10881, 51, -1212.2988, -33.86388, 163.08316, 100, 0, 0),
(10881, 52, -1222.895, -45.217556, 162.96524, 100, 0, 0),
(10881, 53, -1229.6758, -59.198895, 162.7106, 100, 0, 0),
(10881, 54, -1232.1641, -69.4713, 162.50626, 100, 0, 0),
(10881, 55, -1253.0083, -78.41298, 162.99677, 100, 0, 0),
(10881, 56, -1267.7615, -80.29845, 162.65508, 100, 0, 0),
(10881, 57, -1282.3258, -71.691734, 158.1978, 100, 0, 0),
(10881, 58, -1282.0757, -58.58692, 155.54141, 100, 0, 0),
(10881, 59, -1282.3276, -48.19157, 152.46475, 100, 0, 0),
(10881, 60, -1281.4308, -31.95459, 146.76236, 100, 0, 0),
(10881, 61, -1279.5905, -15.625922, 140.13492, 100, 0, 0),
(10881, 62, -1286.704, -1.506185, 134.09781, 100, 0, 0),
(10881, 63, -1300.445, 0.512207, 133.07643, 100, 0, 0),
(10881, 64, -1314.4199, 5.9609375, 132.32643, 100, 0, 0),
(10881, 65, -1328.3633, 27.155544, 129.32643, 100, 0, 0),
(10881, 66, -1332.2041, 43.451225, 129.24985, 100, 0, 0),
(10881, 67, -1323.8455, 55.51096, 129.12485, 100, 0, 0),
(10881, 68, -1297.5516, 61.62397, 128.66028, 100, 0, 0),
(10881, 69, -1271.4805, 63.266655, 127.550415, 100, 0, 0);

-- make some of npcs walk correctly on theirs path (credit cmangos)
-- chepi 8361
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `entry` = 8361;

-- bluff runner windstrider 10881
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `entry` = 10881;

-- hunter sagewind 14440
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `entry` = 14440;

-- hunter ragetotem 14441
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `entry` = 14441; 

-- add some details to searing gorge elementals (credit cmangos)
UPDATE `creature_template` SET `auras` = '11966' WHERE  `entry` = 5850;
UPDATE `creature_template` SET `school_immune_mask`= 8 WHERE `entry` = 5855;

-- make weaver immune to nature (credit cmangos)
UPDATE `creature_template` SET `school_immune_mask` = 8 WHERE `entry` = 5720;

-- add SrcSpell to bring the light (credit cmangos)
UPDATE `quest_template` SET `SrcSpell` = 2791 WHERE `entry` = 3636;

-- add washte pawne spawns (credit cmangos)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(15215, 3472, 1, -3716.850830078125, -1917.6165771484375, 91.7601318359375, 5.458455085754394531, 413, 413, 100, 0, 1, 40, 10),
(15217, 3472, 1, -3449.927001953125, -1917.60009765625, 95.30474090576171875, 1.559170365333557128, 413, 413, 100, 0, 1, 40, 10),
(15222, 3472, 1, -3783.507080078125, -2184.351318359375, 93.82526397705078125, 0.88516998291015625, 413, 413, 100, 0, 1, 40, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(121, 1, 'Washte Pawne (3472)');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(15215, 121, 'Washte Pawne #1'),
(15217, 121, 'Washte Pawne #2'),
(15222, 121, 'Washte Pawne #3'),
(15081, 121, 'Washte Pawne #4');

-- add owatanka spawns (credit cmangos)
UPDATE `creature` SET `position_x` = -2515.481689453125, `position_y` = -2383.766845703125, `position_z` = 92.19029998779296875, `orientation` = 2.392263174057006835, `wander_distance` = 40, `movement_type` = 1 WHERE `guid` = 15082;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(15223, 3473, 1, -2379.904052734375, -2383.2734375, 91.75, 5.385590076446533203, 413, 413, 100, 0, 1, 40, 10),
(15224, 3473, 1, -2616.596435546875, -2017.2301025390625, 93.0281982421875, 2.328437089920043945, 413, 413, 100, 0, 1, 40, 10),
(15225, 3473, 1, -2584.930908203125, -1849.863525390625, 91.9208984375, 5.536968708038330078, 413, 413, 100, 0, 1, 40, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(122, 1, 'Owatanka (3473)');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(15082, 122, 'Owatanka #1'),
(15223, 122, 'Owatanka #2'),
(15224, 122, 'Owatanka #3'),
(15225, 122, 'Owatanka #4');

-- add lakota mani spawns (credit cmangos)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(15318, 3474, 1, -1950.4051513671875, -1949.997802734375, 92.8021087646484375, 5.445427417755126953, 413, 413, 100, 0, 0, 0, 10),
(15540, 3474, 1, -1981.5889892578125, -2452.464111328125, 93.39815521240234375, 3.926990747451782226, 413, 413, 100, 0, 0, 0, 10),
(15576, 3474, 1, -1716.923583984375, -2051.568603515625, 91.8554840087890625, 0.872664630413055419, 413, 413, 100, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(123, 1, 'Lakota\'mani (3474)');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(15083, 123, 'Lakota\'mani #1'),
(15318, 123, 'Lakota\'mani #2'),
(15540, 123, 'Lakota\'mani #3'),
(15576, 123, 'Lakota\'mani #4');

-- add mising gobject gossip (credit cmangos)
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2985, 3677),
(6030, 7181);

-- update outer rfc spawns (credit cmangos)
DELETE FROM `creature` WHERE `guid` IN (20264, 20327, 20328, 20323);
DELETE FROM `creature_addon` WHERE `guid` IN (20264, 20327, 20328, 20323);
DELETE FROM `creature_movement` WHERE `id` IN (20327, 20328, 20323);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(20298, 7335, 1, -4675.4833984375, -2450.9169921875, 85.88103485107421875, 2.36769723892211914, 300, 300, 100, 100, 2, 0, 10),
(20299, 7335, 1, -4633.3203125, -2451.29638671875, 90.25988006591796875, 5.249682903289794921, 300, 300, 100, 100, 2, 0, 10),
(20424, 7335, 1, -4656.3232421875, -2486.209228515625, 82.2027587890625, 0.41590234637260437, 300, 300, 100, 100, 1, 5, 10),
(20425, 7335, 1, -4653.55029296875, -2436.837646484375, 93.53961181640625, 3.351032257080078125, 300, 300, 100, 100, 1, 5, 10),
(20428, 7335, 1, -4656.20703125, -2397.89306640625, 93.3379364013671875, 0.593411922454833984, 300, 300, 100, 100, 1, 5, 10),
(20556, 7335, 1, -4662.93212890625, -2459.820068359375, 85.69669342041015625, 3.141592741012573242, 300, 300, 100, 100, 1, 5, 10),
(20861, 7335, 1, -4644.61962890625, -2484.787353515625, 84.35382080078125, 1.226791739463806152, 300, 300, 100, 100, 1, 5, 10),
(20945, 7327, 1, -4684.419921875, -2439.602783203125, 85.99167633056640625, 3.95905160903930664, 300, 300, 100, 0, 1, 5, 10),
(20946, 7327, 1, -4673.03564453125, -2415.18701171875, 85.8564910888671875, 0.209439516067504882, 300, 300, 100, 0, 1, 5, 10),
(21055, 7327, 1, -4666.00390625, -2437.4677734375, 93.3555755615234375, 5.969026088714599609, 300, 300, 100, 0, 1, 5, 10),
(21232, 7327, 1, -4646.71875, -2399.069580078125, 93.28741455078125, 3.438298702239990234, 300, 300, 100, 0, 1, 5, 10),
(21699, 7327, 1, -4639.26025390625, -2419.673583984375, 85.870880126953125, 1.815142393112182617, 300, 300, 100, 0, 1, 5, 10),
(20297, 7327, 1, -4636.59814453125, -2385.98291015625, 86.11891937255859375, 5.177532672882080078, 300, 300, 100, 0, 1, 5, 10);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(20297, 1, -4683.59033203125, -2437.88134765625, 85.75897979736328125, 100, 0, 0),
(20297, 2, -4685.54150390625, -2431.92333984375, 85.98188018798828125, 100, 0, 0),
(20297, 3, -4683.080078125, -2424.030029296875, 85.675506591796875, 100, 0, 0),
(20297, 4, -4678.9677734375, -2420.04052734375, 85.69084930419921875, 100, 0, 0),
(20297, 5, -4670.70947265625, -2413.8056640625, 85.76495361328125, 100, 0, 0),
(20297, 6, -4660.92138671875, -2413.91845703125, 85.833709716796875, 100, 0, 0),
(20297, 7, -4653.736328125, -2416.694580078125, 85.80951690673828125, 100, 0, 0),
(20297, 8, -4636.728515625, -2418.4892578125, 86.0050048828125, 100, 0, 0),
(20297, 9, -4630.82275390625, -2407.128173828125, 86.1377105712890625, 100, 0, 0),
(20297, 10, -4630.26708984375, -2401.712890625, 86.19843292236328125, 100, 0, 0),
(20297, 11, -4631.8681640625, -2392.086181640625, 86.134613037109375, 100, 0, 0),
(20297, 12, -4640.3759765625, -2384.387939453125, 86.12937164306640625, 100, 0, 0),
(20297, 13, -4647.17529296875, -2381.139404296875, 86.26778411865234375, 100, 0, 0),
(20297, 14, -4635.92431640625, -2386.434814453125, 86.03851318359375, 100, 0, 0),
(20297, 15, -4629.0234375, -2392.868408203125, 85.898590087890625, 100, 0, 0),
(20297, 16, -4629.27880859375, -2405.135986328125, 86.1762847900390625, 100, 0, 0),
(20297, 17, -4633.30615234375, -2413.456298828125, 86.16745758056640625, 100, 0, 0),
(20297, 18, -4646.80078125, -2419.127685546875, 85.7448577880859375, 100, 0, 0),
(20297, 19, -4657.28369140625, -2416.6455078125, 85.75188446044921875, 100, 0, 0),
(20297, 20, -4670.5380859375, -2417.719970703125, 86.16943359375, 100, 0, 0),
(20297, 21, -4684.8828125, -2422.637939453125, 86.23764801025390625, 100, 0, 0),
(20297, 22, -4684.134765625, -2435.67236328125, 85.711669921875, 100, 0, 0),
(20297, 23, -4679.4697265625, -2447.653076171875, 85.83795928955078125, 100, 0, 0),
(20297, 24, -4667.91943359375, -2456.115966796875, 85.9508819580078125, 100, 0, 0),
(20297, 25, -4657.95068359375, -2467.560791015625, 85.30413055419921875, 100, 0, 0),
(20297, 26, -4646.8681640625, -2482.7861328125, 83.60642242431640625, 100, 0, 0),
(20297, 27, -4657.2265625, -2467.923095703125, 85.26404571533203125, 100, 0, 0),
(20297, 28, -4666.77783203125, -2456.09716796875, 85.7393798828125, 100, 0, 0),
(20297, 29, -4672.15771484375, -2452.938232421875, 85.87339019775390625, 100, 0, 0),
(20297, 30, -4676.11669921875, -2450.298095703125, 85.705596923828125, 100, 0, 0),
(20297, 31, -4678.60888671875, -2445.959228515625, 85.8825531005859375, 100, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(20298, 1, -4630.0927734375, -2456.714111328125, 89.13394927978515625, 100, 0, 0),
(20298, 2, -4625.1142578125, -2466.857177734375, 88.18202972412109375, 100, 0, 0),
(20298, 3, -4625.650390625, -2472.214111328125, 88.29196929931640625, 100, 0, 0),
(20298, 4, -4626.1552734375, -2464.6728515625, 88.03557586669921875, 100, 0, 0),
(20298, 5, -4628.49365234375, -2459.278076171875, 88.61887359619140625, 100, 0, 0),
(20298, 6, -4631.99658203125, -2454.838623046875, 89.52185821533203125, 100, 0, 0),
(20298, 7, -4639.8662109375, -2449.490966796875, 90.50461578369140625, 100, 0, 0),
(20298, 8, -4645.97998046875, -2446.50439453125, 91.5135955810546875, 100, 0, 0),
(20298, 9, -4653.9990234375, -2442.831787109375, 92.7446746826171875, 100, 0, 0),
(20298, 10, -4658.64404296875, -2437.843017578125, 93.0769805908203125, 100, 0, 0),
(20298, 11, -4657.7314453125, -2430.552734375, 93.58847808837890625, 100, 0, 0),
(20298, 12, -4652.162109375, -2411.0458984375, 94.1855316162109375, 100, 0, 0),
(20298, 13, -4649.2490234375, -2400.725830078125, 93.1791839599609375, 100, 0, 0),
(20298, 14, -4654.5673828125, -2394.675048828125, 92.98937225341796875, 100, 0, 0),
(20298, 15, -4662.22509765625, -2389.377685546875, 93.877197265625, 100, 0, 0),
(20298, 16, -4670.08349609375, -2385.115478515625, 94.61676025390625, 100, 0, 0),
(20298, 17, -4662.4677734375, -2389.029541015625, 93.958526611328125, 100, 0, 0),
(20298, 18, -4653.56884765625, -2395.0908203125, 93.08307647705078125, 100, 0, 0),
(20298, 19, -4650.3388671875, -2400.7060546875, 93.20104217529296875, 100, 0, 0),
(20298, 20, -4650.08984375, -2405.364013671875, 93.84693145751953125, 100, 0, 0),
(20298, 21, -4658.07666015625, -2429.705810546875, 94.14007568359375, 100, 0, 0),
(20298, 22, -4657.4931640625, -2438.9306640625, 93.067291259765625, 100, 0, 0),
(20298, 23, -4650.08349609375, -2443.77001953125, 92.63680267333984375, 100, 0, 0),
(20298, 24, -4639.78125, -2447.902099609375, 90.9450836181640625, 100, 0, 0),
(20298, 25, -4633.26171875, -2451.2822265625, 90.18062591552734375, 100, 0, 0);

-- Events list for Venture Co. Drudger
DELETE FROM `creature_ai_events` WHERE `creature_id`=3284;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (328401, 3284, 0, 2, 0, 100, 0, 20, 0, 0, 0, 328401, 0, 0, 'Venture Co. Drudger - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (328401, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Drudger - Flee');

-- Events list for Venture Co. Peon
DELETE FROM `creature_ai_events` WHERE `creature_id`=3285;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (328501, 3285, 0, 2, 0, 100, 0, 20, 0, 0, 0, 328501, 0, 0, 'Venture Co. Peon - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (328501, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venture Co. Peon - Flee');

-- Events list for  Theramore Marine
DELETE FROM `creature_ai_events` WHERE `creature_id`=3385;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (338501, 3385, 0, 2, 0, 100, 0, 20, 0, 0, 0, 338501, 0, 0, 'Theramore Marine - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (338501, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Marine - Flee');

-- add keg of shindigger stout spawns (credit cmangos)
UPDATE `gameobject` SET `position_x` = -1327.418701171875, `position_y` = -1223.4053955078125, `position_z` = 38.79104995727539062, `orientation` = 4.607671737670898437, `rotation2` = -0.74314403533935546, `rotation3` = 0.669131457805633544 WHERE `guid` = 30028;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(1046, 1727, 0, -1309.9664306640625, -1225.2359619140625, 22.95736122131347656, 2.094393253326416015, 0, 0, 0.866024971008300781, 0.50000077486038208, 2, 2, 100, 1),
(1132, 1727, 0, -1331.35595703125, -1238.0267333984375, 32.1243743896484375, 1.972219824790954589, 0, 0, 0.83388519287109375, 0.55193793773651123, 2, 2, 100, 1),
(1167, 1727, 0, -1325.471435546875, -1222.341064453125, 32.12459182739257812, 5.532694816589355468, 0, 0, -0.3665008544921875, 0.93041771650314331, 2, 2, 100, 1),
(1181, 1727, 0, -1308.4083251953125, -1259.481689453125, 38.79087448120117187, 3.926995515823364257, 0, 0, -0.92387866973876953, 0.38268551230430603, 2, 2, 100, 1),
(1200, 1727, 0, -1302.0880126953125, -1251.3330078125, 32.12409591674804687, 4.537858963012695312, 0, 0, -0.76604366302490234, 0.642788589000701904, 2, 2, 100, 1);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
(1727, 1339, 0, 'Hillsbrad Foothills - Dun Garok - Keg of Shindigger Stout (1727)');
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(1339, 1, 'Hillsbrad Foothills - Dun Garok - Keg of Shindigger Stout (1727)');

-- correct scale for novice warriors
UPDATE `creature_template` SET `display_scale1` = 1.35, `display_scale2` = 1.35 WHERE `entry` = 10721;

-- add defias raider - talk on aggro
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (618002, 6180, 0, 4, 0, 100, 0, 0, 0, 0, 0, 618002, 0, 0, 'Defias Raider - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (618002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1867, 1866, 1865, 0, 0, 0, 0, 0, 0, 'Defias Raider - Talk on Aggro');

-- add tamra stormpike spawns (credit cmangos)
UPDATE `creature` SET `position_x` = -1265.12255859375, `position_y` = -1195.08447265625, `position_z` = 40.0485687255859375, `orientation` = 3.393389225006103515, `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 90783;
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 14275;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `movement_type`, `wander_distance`, `patch_max`) VALUES
(90784, 14275, 0, -1329.939453125, -1277.459228515625, 49.98560333251953125, 2.301288127899169921, 27000, 27000, 100, 100, 1, 3, 10),
(90786, 14275, 0, -1356.63818359375, -1247.211669921875, 49.98707962036132812, 3.446519136428833007, 27000, 27000, 100, 100, 1, 3, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(124, 1, 'Tamra Stormpike (14275)');
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(90783, 124, 'Tamra Stormpike #1'),
(90784, 124, 'Tamra Stormpike #2'),
(90786, 124, 'Tamra Stormpike #3');

-- quest 813 should be repeatable
UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 813;

-- Witherbark Bloodling should not drop loot
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry`= 7768;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
