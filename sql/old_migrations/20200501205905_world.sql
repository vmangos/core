DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200501205905');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200501205905');
-- Add your query below.


-- Correct faction for BWL creatures.
UPDATE `creature_template` SET `faction`=62 WHERE `entry`=11981;
UPDATE `creature_template` SET `faction`=62 WHERE `entry`=11983;
UPDATE `creature_template` SET `faction`=1114 WHERE `entry`=12435;
UPDATE `creature_template` SET `faction`=103 WHERE `entry`=12461;
UPDATE `creature_template` SET `faction`=7 WHERE `entry`=13976;
UPDATE `creature_template` SET `faction`=62 WHERE `entry`=14020;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14449;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=14459;
UPDATE `creature_template` SET `faction`=62 WHERE `entry`=14601;

-- Correct levels for BWL creatures.
UPDATE `creature_template` SET `level_min`=62, `level_max`=62 WHERE `entry`=12557;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=12999;
UPDATE `creature_template` SET `level_min`=40, `level_max`=40 WHERE `entry`=13976;

-- Correct health for BWL creatures.
UPDATE `creature_template` SET `health_min`=64750, `health_max`=64750, `mana_min`=25680, `mana_max`=25680 WHERE `entry`=12557;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=12999;
UPDATE `creature_template` SET `health_min`=7620, `health_max`=7620 WHERE `entry`=13976;

-- Correct melee attack speed for BWL creatures.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8279;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11981;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11983;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12017;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12435;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12457;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12458;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12459;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12460;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12461;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12463;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12464;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12465;
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=12467;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12468;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12557;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13976;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13996;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14020;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14022;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14023;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14024;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14025;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14377;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14401;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14456;
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14601;

-- Correct ranged attack speed for BWL creatures.
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=8279;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11981;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=11983;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12017;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12435;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12457;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12458;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12459;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12460;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12461;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12463;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12464;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12465;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12467;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12468;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12557;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=12999;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13020;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13976;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=13996;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14020;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14022;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14023;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14024;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14025;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14401;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14449;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14456;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14459;
UPDATE `creature_template` SET `ranged_attack_time`=2000 WHERE `entry`=14601;

-- Correct walk speed for BWL creatures.
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=11981;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12017;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12458;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12463;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12464;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12465;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=12468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13020;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13976;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=14022;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=14023;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=14024;
UPDATE `creature_template` SET `speed_walk`=1.11111 WHERE `entry`=14025;

-- Correct run speed for BWL creatures.
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=11981;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=11983;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=12435;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=12460;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=13020;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14020;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=14601;

-- Razorgore the Untamed
UPDATE `creature_template` SET `dmg_min`=2416, `dmg_max`=3203, `armor`=4691 WHERE `entry`=12435;
UPDATE `creature_template` SET `health_min`=449685, `health_max`=449685, `mana_min`=0, `mana_max`=0 WHERE `entry`=12435;
-- Vaelastrasz the Corrupt
UPDATE `creature_template` SET `dmg_min`=3844, `dmg_max`=5096, `armor`=4691 WHERE `entry`=13020;
UPDATE `creature_template` SET `health_min`=3331000, `health_max`=3331000, `mana_min`=0, `mana_max`=0 WHERE `entry`=13020;
-- Broodlord Lashlayer
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640, `armor`=4691 WHERE `entry`=12017;
UPDATE `creature_template` SET `mana_min`=0, `mana_max`=0 WHERE `entry`=12017;
-- Firemaw
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640, `armor`=4691 WHERE `entry`=11983;
UPDATE `creature_template` SET `health_min`=999300, `health_max`=999300, `mana_min`=0, `mana_max`=0 WHERE `entry`=11983;
-- Ebonroc
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640, `armor`=4691 WHERE `entry`=14601;
UPDATE `creature_template` SET `health_min`=999300, `health_max`=999300 WHERE `entry`=14601;
-- Flamegor
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640, `armor`=4691 WHERE `entry`=11981;
UPDATE `creature_template` SET `health_min`=999300, `health_max`=999300, `mana_min`=0, `mana_max`=0 WHERE `entry`=11981;
-- Chromaggus
UPDATE `creature_template` SET `dmg_min`=3295, `dmg_max`=4368, `armor`=4691 WHERE `entry`=14020;
UPDATE `creature_template` SET `health_min`=1832050, `health_max`=1832050 WHERE `entry`=14020;
-- Nefarian
UPDATE `creature_template` SET `dmg_min`=3844, `dmg_max`=5096, `armor`=4691 WHERE `entry`=11583;
UPDATE `creature_template` SET `health_min`=2165150, `health_max`=2165150, `mana_min`=0, `mana_max`=0 WHERE `entry`=11583;

-- Correct bounding radius for BWL creatures.
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.278 WHERE `display_id`=694;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.7 WHERE `display_id`=4449;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.214 WHERE `display_id`=7923;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.278 WHERE `display_id`=9994;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4836 WHERE `display_id`=11967;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4836 WHERE `display_id`=11969;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.2832 WHERE `display_id`=12021;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.2832 WHERE `display_id`=12022;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4464 WHERE `display_id`=12024;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4464 WHERE `display_id`=12025;
UPDATE `creature_display_info_addon` SET `bounding_radius`=2.625 WHERE `display_id`=12892;
UPDATE `creature_display_info_addon` SET `bounding_radius`=3.44225 WHERE `display_id`=12893;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.459 WHERE `display_id`=13991;
UPDATE `creature_display_info_addon` SET `bounding_radius`=1.5 WHERE `display_id`=13992;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4464 WHERE `display_id`=14292;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4464 WHERE `display_id`=14293;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.2832 WHERE `display_id`=14294;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.2832 WHERE `display_id`=14295;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.4836 WHERE `display_id`=14296;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.3068 WHERE `display_id`=14300;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.3068 WHERE `display_id`=14301;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.459 WHERE `display_id`=14302;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.459 WHERE `display_id`=14303;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.459 WHERE `display_id`=14304;
UPDATE `creature_display_info_addon` SET `bounding_radius`=1.5 WHERE `display_id`=14308;
UPDATE `creature_display_info_addon` SET `bounding_radius`=1.05 WHERE `display_id`=14367;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.5202 WHERE `display_id`=14498;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.875 WHERE `display_id`=14544;
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.278 WHERE `display_id`=14720;

-- Correct combat reach for BWL creatures.
UPDATE `creature_display_info_addon` SET `combat_reach`=1.25 WHERE `display_id`=694;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.05 WHERE `display_id`=4449;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.5 WHERE `display_id`=7923;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.25 WHERE `display_id`=9994;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.95 WHERE `display_id`=11967;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.95 WHERE `display_id`=11969;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=12021;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=12022;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=12024;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=12025;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.625 WHERE `display_id`=12892;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.625 WHERE `display_id`=12893;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.25 WHERE `display_id`=13991;
UPDATE `creature_display_info_addon` SET `combat_reach`=15 WHERE `display_id`=13992;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=14292;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=14293;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=14294;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.8 WHERE `display_id`=14295;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.95 WHERE `display_id`=14296;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.95 WHERE `display_id`=14300;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.95 WHERE `display_id`=14301;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.25 WHERE `display_id`=14302;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.25 WHERE `display_id`=14303;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.25 WHERE `display_id`=14304;
UPDATE `creature_display_info_addon` SET `combat_reach`=5 WHERE `display_id`=14308;
UPDATE `creature_display_info_addon` SET `combat_reach`=12 WHERE `display_id`=14367;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.55 WHERE `display_id`=14498;
UPDATE `creature_display_info_addon` SET `combat_reach`=2.625 WHERE `display_id`=14544;
UPDATE `creature_display_info_addon` SET `combat_reach`=1.25 WHERE `display_id`=14720;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
