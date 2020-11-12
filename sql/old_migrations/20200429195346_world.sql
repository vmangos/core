DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200429195346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200429195346');
-- Add your query below.


-- Correct levels for ZG creatures.
UPDATE `creature_template` SET `level_min`=56, `level_max`=56 WHERE `entry`=14921;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14758;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=14758;
UPDATE `creature_template` SET `health_min`=8097, `health_max`=8097 WHERE `entry`=14921;

-- Correct melee attack speeds for ZG creatures.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=871;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=877;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=879;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14517;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14902;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14903;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14904;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14905;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14921;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15070;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11338;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11339;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11340;
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=11350;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11351;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11352;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11353;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11356;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11359;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11371;
UPDATE `creature_template` SET `base_attack_time`=1400 WHERE `entry`=11372;
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=11374;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11389;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11390;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11830;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11831;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14750;

-- Correct ranged attack speeds for ZG creatures.
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=855;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=871;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=877;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=879;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3197;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=3204;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=4260;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=5822;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14902;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14903;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14904;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14905;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14921;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=15070;

-- Correct walking speed for ZG creatures.
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=11352;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=11368;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=14750;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=14902;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14905;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14990;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15188;

-- Correct run speed for ZG creatures.
UPDATE `creature_template` SET `speed_run`=0.857143 WHERE `entry`=3197;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=11352;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=11357;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=11359;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14507;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14510;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14517;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14750;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14834;

-- Correct bounding radius for ZG creatures.
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.6 WHERE `display_id`=11081;
UPDATE `creature_display_info_addon` SET `bounding_radius`=1 WHERE `display_id`=15191;
UPDATE `creature_display_info_addon` SET `bounding_radius`=2.38 WHERE `display_id`=15295;

-- Correct combat reach for ZG creatures.
UPDATE `creature_display_info_addon` SET `combat_reach`=0 WHERE `display_id`=11081;
UPDATE `creature_display_info_addon` SET `combat_reach`=2 WHERE `display_id`=15191;
UPDATE `creature_display_info_addon` SET `combat_reach`=10.5 WHERE `display_id`=15295;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
