DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201216203835');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201216203835');
-- Add your query below.


-- update cear darrow citizen template
UPDATE `creature_template` SET `level_min` = 14, `gossip_menu_id` = 3362, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000, `faction` = 35, `npc_flags` = 1 WHERE `entry` = 11277;

UPDATE `creature` SET `position_x` = 1146.79, `position_y` = -2561.22, `position_z` = 60.1145,`orientation` = 0.959931 WHERE `guid` = 13179;
UPDATE `creature` SET `position_x` = 1095.56, `position_y` = -2529.47, `position_z` = 61.1291, `orientation` = 2.37365 WHERE `guid` = 300335;
UPDATE `creature` SET `position_x` = 1093.95, `position_y` = -2528.63, `position_z` = 61.2475, `orientation` = 5.74213 WHERE `guid` = 300334;
UPDATE `creature` SET `position_x` = 1148.08, `position_y` = -2559.31, `position_z` = 60.1493, `orientation` = 4.15388 WHERE `guid` = 300337;
UPDATE `creature` SET `position_x` = 1098.58, `position_y` = -2589.77, `position_z` = 60.6845, `orientation` = 6.10865 WHERE `guid` = 300336;
UPDATE `creature` SET `position_x` = 1146.79, `position_y` = -2561.22, `position_z` = 60.1145, `orientation` = 0.959931 WHERE `guid` = 300338;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(118, 11277, 0, 0, 0, 0, 1127.87, -2387.57, 59.297, 1.58825, 25, 25, 0, 100, 0, 0, 0, 0, 0, 10);


-- update caer darrow guardsman template
UPDATE `creature_template` SET `gossip_menu_id` = 3363, `level_max` = 55, `faction` = 35, `npc_flags` = 1, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11279;
UPDATE `creature` SET `position_x` = 1056.5, `position_y` = -2536.54, `position_z` = 59.9694, `orientation` = 2.35619 WHERE `guid` = 300342;
UPDATE `creature` SET `position_x` = 1064.06, `position_y` = -2519.78, `position_z` = 60.2259, `orientation` = 3.19395 WHERE `guid` = 300343;
UPDATE `creature` SET `position_x` = 1239.31, `position_y` = -2587.39, `position_z` = 90.4068, `orientation` = 3.66519 WHERE `guid` = 300345;
UPDATE `creature` SET `position_x` = 1245.02, `position_y` = -2597.47, `position_z` = 90.3675, `orientation` = 3.52556 WHERE `guid` = 300344;


-- update caer darrow cannoneer template
UPDATE `creature_template` SET `level_min` = 50, `level_max` = 54, `faction` = 35, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11280;

UPDATE `creature` SET `position_x` = 1162.86, `position_y` = -2595.08, `position_z` = 75.4329, `orientation` = 2.71204 WHERE `guid` = 300347;
UPDATE `creature` SET `position_x` = 1180.07, `position_y` = -2536.72, `position_z` = 85.3681, `orientation` = 1.0821 WHERE `guid` = 300348;
UPDATE `creature` SET `position_x` = 1187.12, `position_y` = -2532.58, `position_z` = 85.3681, `orientation` = 2.16421 WHERE `guid` = 300349;
UPDATE `creature` SET `position_x` = 1163.91, `position_y` = -2591.62, `position_z` = 75.5474, `orientation` = 4.20133 WHERE `guid` = 300350;
UPDATE `creature` SET `position_x` = 1210.32, `position_y` = -2575.44, `position_z` = 94.3508, `orientation` = 4.56343 WHERE `guid` = 300351;
UPDATE `creature` SET `position_x` = 1208.19, `position_y` = -2583.32, `position_z` = 98.2479, `orientation` = 2.72271 WHERE `guid` = 300352;


-- update magistrate marduke template
UPDATE `creature_template` SET `gossip_menu_id` = 3372, `npc_flags` = 1, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11286;
UPDATE `creature` SET `position_x` = 1245.52, `position_y` = -2616.74, `position_z` = 90.4419, `orientation` = 2.23402 WHERE `guid` = 18037;


-- update baker masterson template
UPDATE `creature_template` SET `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11287;
UPDATE `creature` SET `position_x` = 1086.09, `position_y` = -2573.8, `position_z` = 60.0421, `orientation` = 0.383972 WHERE `guid` = 300333;


-- update joseph dirte template
UPDATE `creature_template` SET `gossip_menu_id` = 3381, `npc_flags` = 1, `health_min` = 1107, `health_max` = 1107, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11316;
UPDATE `creature` SET `position_x` = 1223.27, `position_y` = -2506.41, `position_z` = 72.9261, `orientation` = 4.10152 WHERE `guid` = 300346;


-- update eva sarkhoff template
UPDATE `creature_template` SET `health_min` = 3293, `health_max` = 3293, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11286;


-- update magnus frostwake template
UPDATE `creature_template` SET `faction` = 35, `health_min` = 2769, `health_max` = 2769, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11278;
UPDATE `creature` SET `position_x` = 1144.51, `position_y` = -2510.08, `position_z` = 62.1604, `orientation` = 4.03171 WHERE `guid` = 300332;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
