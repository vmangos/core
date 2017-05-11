INSERT INTO `migrations` VALUES ('20170510234600');

-- Dun Morogh Wendigos
DELETE FROM `creature` WHERE `guid` IN (3583, 3551, 3554, 3261, 3262, 3548, 3552, 3255, 3558, 3257, 3258, 3578, 3574, 3566, 3565, 3567, 3573, 3239, 3243, 3246, 3137, 3570);
DELETE FROM `creature_addon` WHERE `guid` IN (3583, 3551, 3554, 3261, 3262, 3548, 3552, 3255, 3558, 3257, 3258, 3578, 3574, 3566, 3565, 3567, 3573, 3239, 3243, 3246, 3137, 3570);

-- Spawn Cleanups in Shadowglen
UPDATE `creature` SET `position_x` = 10351.280273, `position_y` = 657.048523, `position_z` = 1329.953857, `orientation` = 5.177292 WHERE `guid` = 49568;
UPDATE `creature` SET `position_x` = 10340.298828, `position_y` = 615.088806, `position_z` = 1331.572998, `orientation` = 4.970732 WHERE `guid` = 49564;
UPDATE `creature` SET `position_x` = 10661.814453, `position_y` = 917.384399, `position_z` = 1321.113159, `orientation` = 5.929706 WHERE `guid` = 47062;
UPDATE `creature` SET `position_x` = 10839.787109, `position_y` = 914.243347, `position_z` = 1335.780151, `orientation` = 5.228345 WHERE `guid` = 47002;
UPDATE `creature` SET `position_x` = 10920.755859, `position_y` = 930.499390, `position_z` = 1321.458130, `orientation` = 0.737440 WHERE `guid` = 47053;
UPDATE `creature` SET `position_x` = 10951.365234, `position_y` = 970.038452, `position_z` = 1329.072388, `orientation` = 0.380083 WHERE `guid` = 47029;
UPDATE `creature` SET `position_x` = 10854.833008, `position_y` = 970.725464, `position_z` = 1336.109009, `orientation` = 3.734515 WHERE `guid` = 47018;
UPDATE `creature` SET `position_x` = 10839.347656, `position_y` = 951.701233, `position_z` = 1335.822388, `orientation` = 3.686607 WHERE `guid` = 47262;
DELETE FROM `creature` WHERE `guid` IN (47011, 47013, 47014, 47015, 47059, 47058, 46996, 47024, 47005, 47007, 46968, 47019, 47022, 47269, 47271, 47020, 47270);

-- North of Kharanos
DELETE FROM `creature` WHERE `guid` IN (155,2095,154,1727,153,1730,3218,3224,2902,1736);
DELETE FROM `creature_addon` WHERE `guid` IN (155,2095,154,1727,153,1730,3218,3224,2902,1736);

-- Redridge Murlocs
DELETE FROM `creature` WHERE `guid` IN (6190,6273,6178,6182,8776,8785,8775,6704);
DELETE FROM `creature_addon` WHERE `guid` IN (6190,6273,6178,6182,8776,8785,8775,6704);
UPDATE `creature` SET `position_x` = -9315.09, `position_y` = -2824.39, `position_z` = 70.0909, `orientation` = 2.80891 WHERE `guid` = 6184;
UPDATE `creature` SET `position_x` = -9317.58, `position_y` = -2794.08, `position_z` = 69.1543, `orientation` = 3.24875 WHERE `guid` = 10457;
UPDATE `creature` SET `position_x` = -9480.56, `position_y` = -2860.51, `position_z` = 79.6394, `orientation` = 1.15957 WHERE `guid` = 6705;

-- Redridge Bashers
DELETE FROM `creature` WHERE `guid` IN (7516,16421);
DELETE FROM `creature_addon` WHERE `guid` IN (7516,16421);

-- Redridge Blackrock Grunt
DELETE FROM `creature` WHERE `guid` IN (31808,31830);
DELETE FROM `creature_addon` WHERE `guid` IN (31808,31830);

-- Redridge Tarantula
DELETE FROM `creature` WHERE `guid` IN (10418);
DELETE FROM `creature_addon` WHERE `guid` IN (10418);


