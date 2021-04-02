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
UPDATE gameobject_template SET data2=0 WHERE entry IN (176150,176151);
UPDATE gameobject SET spawntimesecsmin = 60, spawntimesecsmax = 60 WHERE id = 176151;
UPDATE gameobject SET spawntimesecsmin = 60, spawntimesecsmax = 60 WHERE id = 176150;

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
UPDATE `creature` SET `position_x` = -4006.34375, `position_y` = -1752.7042236328125, `position_z` = 97.34051513671875, `orientation` = 5.724679946899414062 WHERE (`guid` = 20877);
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
UPDATE `creature` SET `position_x` = -4073.6220703125, `position_y` = -2275.51025390625, `position_z` = 123.2482376098632812, `orientation` = 3.826325893402099609, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13648);
UPDATE `creature` SET `position_x` = -4046.876708984375, `position_y` = -2287.065185546875, `position_z` = 119.27734375, `orientation` = 5.50900888442993164, `wander_distance` = 3 WHERE (`guid` = 13649);
UPDATE `creature` SET `position_x` = -4116.95556640625, `position_y` = -2312.180908203125, `position_z` = 127.6861343383789062, `orientation` = 2.477593421936035156, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13641);
UPDATE `creature` SET `position_x` = -4099.82080078125, `position_y` = -2328.198486328125, `position_z` = 126.21124267578125, `orientation` = 1.884955525398254394 WHERE (`guid` = 13642);
UPDATE `creature` SET `position_x` = -4086.07080078125, `position_y` = -2322.52734375, `position_z` = 126.2125167846679687, `orientation` = 2.042035102844238281 WHERE (`guid` = 13643);
UPDATE `creature` SET `position_x` = -4107.5546875, `position_y` = -2352.7587890625, `position_z` = 127.6026992797851562, `orientation` = 3.70369720458984375, `wander_distance` = 3 WHERE (`guid` = 13644);
UPDATE `creature` SET `position_x` = -4098.99072265625, `position_y` = -2372.481689453125, `position_z` = 126.2137527465820312, `orientation` = 5.922992229461669921 WHERE (`guid` = 13646);
UPDATE `creature` SET `position_x` = -4091.74169921875, `position_y` = -2385.422607421875, `position_z` = 124.8254852294921875, `orientation` = 5.976780891418457031, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13638);
UPDATE `creature` SET `position_x` = -4058.741455078125, `position_y` = -2385.67236328125, `position_z` = 126.2137985229492187, `orientation` = 4.184454917907714843, `wander_distance` = 1, `movement_type` = 1 WHERE (`guid` = 13633);
UPDATE `creature` SET `position_x` = -4080.41064453125, `position_y` = -2365.312255859375, `position_z` = 126.2137374877929687, `orientation` = 5.538718223571777343, `wander_distance` = 3 WHERE (`guid` = 13647);
UPDATE `creature` SET `position_x` = -4068.97607421875, `position_y` = -2377.65380859375, `position_z` = 110.3807830810546875, `orientation` = 2.129301786422729492 WHERE (`guid` = 13636);
UPDATE `creature` SET `position_x` = -4071.76171875, `position_y` = -2360.882568359375, `position_z` = 126.2137374877929687, `orientation` = 5.11779022216796875, `wander_distance` = 3 WHERE (`guid` = 13645);
UPDATE `creature` SET `position_x` = -4035.935791015625, `position_y` = -2398.487060546875, `position_z` = 135.9376068115234375, `orientation` = 4.787994861602783203, `wander_distance` = 3 WHERE (`guid` = 13662);
UPDATE `creature` SET `position_x` = -4071.420654296875, `position_y` = -2357.952392578125, `position_z` = 108.9924774169921875, `orientation` = 5.047953605651855468, `wander_distance` = 3 WHERE (`guid` = 13634);
UPDATE `creature` SET `position_x` = -4050.10986328125, `position_y` = -2410.66259765625, `position_z` = 135.9365386962890625, `orientation` = 4.310963153839111328, `wander_distance` = 3 WHERE (`guid` = 13640);
UPDATE `creature` SET `position_x` = -4058, `position_y` = -2417.599853515625, `position_z` = 126.219482421875, `orientation` = 1.443122506141662597, `wander_distance` = 3 WHERE (`guid` = 13639);
UPDATE `creature` SET `position_x` = -4059.4619140625, `position_y` = -2414.691162109375, `position_z` = 135.936737060546875, `orientation` = 4.204134464263916015, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13635);

UPDATE `creature` SET `position_x` = -4055.1376953125, `position_y` = -2306.86669921875, `position_z` = 127.787078857421875, `orientation` = 4.270235538482666015, `wander_distance` = 3 WHERE (`guid` = 13689);
UPDATE `creature` SET `position_x` = -4105.28955078125, `position_y` = -2295.9501953125, `position_z` = 126.5861282348632812, `orientation` = 6.160146713256835937, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13669);
UPDATE `creature` SET `position_x` = -4083.8212890625, `position_y` = -2335.78076171875, `position_z` = 126.2137451171875, `orientation` = 3.37507486343383789, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13670);
UPDATE `creature` SET `position_x` = -4069.796142578125, `position_y` = -2299.737060546875, `position_z` = 124.76275634765625, `orientation` = 3.944444179534912109, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13690);
UPDATE `creature` SET `position_x` = -4084.69189453125, `position_y` = -2345.906982421875, `position_z` = 126.2137527465820312, `orientation` = 5.969049453735351562, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13672);
UPDATE `creature` SET `position_x` = -4124.1611328125, `position_y` = -2332.4765625, `position_z` = 128.82806396484375, `orientation` = 1.902408838272094726, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13671);
UPDATE `creature` SET `position_x` = -4074.55517578125, `position_y` = -2392.81884765625, `position_z` = 118.1594161987304687, `orientation` = 0.059694856405258178, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13668);
UPDATE `creature` SET `position_x` = -4084.069091796875, `position_y` = -2397.787353515625, `position_z` = 135.938751220703125, `orientation` = 3.50811171531677246, `wander_distance` = 3 WHERE (`guid` = 13666);
UPDATE `creature` SET `position_x` = -4064.229248046875, `position_y` = -2331.41845703125, `position_z` = 127.6026687622070312, `orientation` = 0.496271520853042602 WHERE (`guid` = 13673);
UPDATE `creature` SET `position_x` = -4084.97314453125, `position_y` = -2388.474365234375, `position_z` = 118.1597824096679687, `orientation` = 2.247568845748901367, `wander_distance` = 3 WHERE (`guid` = 13664);
UPDATE `creature` SET `position_x` = -4055.341064453125, `position_y` = -2380.49853515625, `position_z` = 118.1593856811523437, `orientation` = 0.715584993362426757, `wander_distance` = 3, `movement_type` = 1 WHERE (`guid` = 13667);
UPDATE `creature` SET `position_x` = -4053.16455078125, `position_y` = -2354.985107421875, `position_z` = 126.2137374877929687, `orientation` = 5.252184867858886718, `movement_type` = 1 WHERE (`guid` = 13674);
UPDATE `creature` SET `position_x` = -4043.064697265625, `position_y` = -2382.08642578125, `position_z` = 135.9406280517578125, `orientation` = 5.560290336608886718, `wander_distance` = 3 WHERE (`guid` = 13691);
UPDATE `creature` SET `position_x` = -4078.411376953125, `position_y` = -2369.834716796875, `position_z` = 108.9921188354492187, `orientation` = 1.675516128540039062 WHERE (`guid` = 13665);
UPDATE `creature` SET `position_x` = -4092.169677734375, `position_y` = -2377.300048828125, `position_z` = 135.938262939453125, `orientation` = 2.575075626373291015, `wander_distance` = 3 WHERE (`guid` = 13663);

UPDATE `creature` SET `position_x` = -4079.028564453125, `position_y` = -2305.741455078125, `position_z` = 125.7790985107421875, `orientation` = 1.815142393112182617 WHERE (`guid` = 13700);
UPDATE `creature` SET `position_x` = -4068.24267578125, `position_y` = -2364.6298828125, `position_z` = 108.9923095703125, `orientation` = 2.460914134979248046 WHERE (`guid` = 13693);
UPDATE `creature` SET `position_x` = -4050.232666015625, `position_y` = -2366.896484375, `position_z` = 118.1592483520507812, `orientation` = 4.23455810546875 WHERE (`guid` = 13692);
UPDATE `creature` SET `position_x` = -4060.27392578125, `position_y` = -2392.2861328125, `position_z` = 126.2138595581054687, `orientation` = 4.291341781616210937, `wander_distance` = 2, `movement_type` = 1 WHERE (`guid` = 13699);
UPDATE `creature` SET `position_x` = -4070.25830078125, `position_y` = -2419.35107421875, `position_z` = 135.937255859375, `orientation` = 4.460751533508300781 WHERE (`guid` = 13694);
UPDATE `creature` SET `position_x` = -4083.482177734375, `position_y` = -2363.377685546875, `position_z` = 108.9924850463867187, `orientation` = 2.595665693283081054 WHERE (`guid` = 13695);
UPDATE `creature` SET `position_x` = -4085.991455078125, `position_y` = -2394.42529296875, `position_z` = 124.825714111328125, `orientation` = 1.274184226989746093, `wander_distance` = 2, `movement_type` = 1 WHERE (`guid` = 13696);
UPDATE `creature` SET `position_x` = -4034.768310546875, `position_y` = -2403.956298828125, `position_z` = 126.21417236328125, `orientation` = 5.756762504577636718, `wander_distance` = 2, `movement_type` = 1 WHERE (`guid` = 13698);
UPDATE `creature` SET `position_x` = -4056.475830078125, `position_y` = -2356.2421875, `position_z` = 135.938140869140625, `orientation` = 2.960889339447021484 WHERE (`guid` = 13697);
UPDATE `creature` SET `position_x` = -4071.732666015625, `position_y` = -2381.637939453125, `position_z` = 126.2137374877929687, `orientation` = 2.429510831832885742, `wander_distance` = 2, `movement_type` = 1 WHERE (`guid` = 13701);
UPDATE `creature` SET `wander_distance`= 2 WHERE `guid` = 51819;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
