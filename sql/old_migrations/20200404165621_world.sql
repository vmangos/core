DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200404165621');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200404165621');
-- Add your query below.


-- Correct level range for some creatures.
UPDATE `creature_template` SET `level_min`=44, `level_max`=44 WHERE `entry`=2608;
UPDATE `creature_template` SET `level_min`=38, `level_max`=40 WHERE `entry`=2812;
UPDATE `creature_template` SET `level_min`=43, `level_max`=45 WHERE `entry`=6169;
UPDATE `creature_template` SET `level_min`=49, `level_max`=50 WHERE `entry`=8760;
UPDATE `creature_template` SET `level_min`=52, `level_max`=53 WHERE `entry`=10982;
UPDATE `creature_template` SET `level_min`=44, `level_max`=44 WHERE `entry`=11874;
UPDATE `creature_template` SET `level_min`=54, `level_max`=55 WHERE `entry`=13080;
UPDATE `creature_template` SET `level_min`=54, `level_max`=55 WHERE `entry`=13081;
UPDATE `creature_template` SET `level_min`=54, `level_max`=55 WHERE `entry`=13097;
UPDATE `creature_template` SET `level_min`=61, `level_max`=61 WHERE `entry`=13256;
UPDATE `creature_template` SET `level_min`=52, `level_max`=53 WHERE `entry`=13316;
UPDATE `creature_template` SET `level_min`=52, `level_max`=53 WHERE `entry`=13397;
UPDATE `creature_template` SET `level_min`=56, `level_max`=56 WHERE `entry`=14349;
UPDATE `creature_template` SET `level_min`=59, `level_max`=60 WHERE `entry`=16229;
UPDATE `creature_template` SET `level_min`=18, `level_max`=19 WHERE `entry`=2112;
UPDATE `creature_template` SET `level_min`=19, `level_max`=21 WHERE `entry`=5914;
UPDATE `creature_template` SET `level_min`=30, `level_max`=35 WHERE `entry`=8130;
UPDATE `creature_template` SET `level_min`=40, `level_max`=42 WHERE `entry`=8276;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=9299;
UPDATE `creature_template` SET `level_min`=52, `level_max`=54 WHERE `entry`=9503;
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=12050;
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=12053;
UPDATE `creature_template` SET `level_min`=57, `level_max`=57 WHERE `entry`=12127;
UPDATE `creature_template` SET `level_min`=1, `level_max`=2 WHERE `entry`=12350;
UPDATE `creature_template` SET `level_min`=52, `level_max`=54 WHERE `entry`=12418;
UPDATE `creature_template` SET `level_min`=54, `level_max`=55 WHERE `entry`=13098;
UPDATE `creature_template` SET `level_min`=54, `level_max`=55 WHERE `entry`=13099;
UPDATE `creature_template` SET `level_min`=58, `level_max`=58 WHERE `entry`=13216;
UPDATE `creature_template` SET `level_min`=59, `level_max`=59 WHERE `entry`=13326;
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13535;
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13538;
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13541;
UPDATE `creature_template` SET `level_min`=58, `level_max`=59 WHERE `entry`=13544;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=13756;
UPDATE `creature_template` SET `level_min`=56, `level_max`=57 WHERE `entry`=13776;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=13778;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=13796;
UPDATE `creature_template` SET `level_min`=61, `level_max`=61 WHERE `entry`=13840;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14026;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14027;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14028;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14030;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14386;
UPDATE `creature_template` SET `level_min`=57, `level_max`=58 WHERE `entry`=14395;
UPDATE `creature_template` SET `level_min`=1, `level_max`=2 WHERE `entry`=14602;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=14848;
UPDATE `creature_template` SET `level_min`=30, `level_max`=30 WHERE `entry`=14962;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=15218;
UPDATE `creature_template` SET `level_min`=30, `level_max`=30 WHERE `entry`=15746;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=15897;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=16045;
UPDATE `creature_template` SET `level_min`=60, `level_max`=60 WHERE `entry`=16100;

-- Update their health based on multipliers.
UPDATE `creature_template` SET `health_max`=449 WHERE `entry`=2112 && `patch`=0;
UPDATE `creature_template` SET `health_min`=2138, `health_max`=2138 WHERE `entry`=2608 && `patch`=0;
UPDATE `creature_template` SET `health_min`=1604 WHERE `entry`=2812 && `patch`=0;
UPDATE `creature_template` SET `health_max`=521 WHERE `entry`=5914 && `patch`=0;
UPDATE `creature_template` SET `health_min`=2059 WHERE `entry`=6169 && `patch`=0;
UPDATE `creature_template` SET `health_max`=3660 WHERE `entry`=8130 && `patch`=0;
UPDATE `creature_template` SET `health_min`=1524, `health_max`=1651 WHERE `entry`=8276 && `patch`=0;
UPDATE `creature_template` SET `health_min`=2672, `health_max`=2768 WHERE `entry`=8760 && `patch`=0;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=9299 && `patch`=0;
UPDATE `creature_template` SET `health_max`=3292 WHERE `entry`=9503 && `patch`=0;
UPDATE `creature_template` SET `health_min`=1185, `health_max`=1226 WHERE `entry`=10982 && `patch`=3;
UPDATE `creature_template` SET `health_min`=2138, `health_max`=2138 WHERE `entry`=11874 && `patch`=0;
UPDATE `creature_template` SET `health_min`=1148, `health_max`=1148 WHERE `entry`=12050 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1148, `health_max`=1148 WHERE `entry`=12053 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1670, `health_max`=1670 WHERE `entry`=12127 && `patch`=3;
UPDATE `creature_template` SET `health_max`=55 WHERE `entry`=12350 && `patch`=0;
UPDATE `creature_template` SET `health_max`=2533 WHERE `entry`=12418 && `patch`=0;
UPDATE `creature_template` SET `health_min`=1013, `health_max`=1045 WHERE `entry`=13080 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1013, `health_max`=1045 WHERE `entry`=13081 && `patch`=3;
UPDATE `creature_template` SET `health_min`=810, `health_max`=836, `mana_min`=4082, `mana_max`=4234 WHERE `entry`=13097 && `patch`=3;
UPDATE `creature_template` SET `health_max`=836, `mana_max`=4234 WHERE `entry`=13098 && `patch`=3;
UPDATE `creature_template` SET `health_max`=836, `mana_max`=4234 WHERE `entry`=13099 && `patch`=3;
UPDATE `creature_template` SET `health_min`=28710, `health_max`=28710 WHERE `entry`=13216 && `patch`=3;
UPDATE `creature_template` SET `health_min`=125750, `health_max`=125750, `mana_min`=19888, `mana_max`=19888 WHERE `entry`=13256 && `patch`=3;
UPDATE `creature_template` SET `health_min`=711, `health_max`=735 WHERE `entry`=13316 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1480, `health_max`=1480 WHERE `entry`=13326 && `patch`=3;
UPDATE `creature_template` SET `health_min`=711, `health_max`=735 WHERE `entry`=13397 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1722, `health_max`=1776 WHERE `entry`=13535 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1378, `health_max`=1421, `mana_min`=4578, `mana_max`=4738 WHERE `entry`=13538 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1378, `health_max`=1421, `mana_min`=4578, `mana_max`=4738 WHERE `entry`=13541 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1722, `health_max`=1776 WHERE `entry`=13544 && `patch`=3;
UPDATE `creature_template` SET `health_min`=30, `health_max`=30 WHERE `entry`=13756 && `patch`=3;
UPDATE `creature_template` SET `health_min`=8097, `health_max`=8352 WHERE `entry`=13776 && `patch`=3;
UPDATE `creature_template` SET `health_min`=30, `health_max`=30 WHERE `entry`=13778 && `patch`=3;
UPDATE `creature_template` SET `health_min`=30, `health_max`=30 WHERE `entry`=13796 && `patch`=3;
UPDATE `creature_template` SET `health_min`=62880, `health_max`=62880 WHERE `entry`=13840 && `patch`=3;
UPDATE `creature_template` SET `health_min`=7326, `health_max`=7326, `mana_min`=4868, `mana_max`=4868 WHERE `entry`=14026 && `patch`=3;
UPDATE `creature_template` SET `health_min`=7326, `health_max`=7326, `mana_min`=4868, `mana_max`=4868 WHERE `entry`=14027 && `patch`=3;
UPDATE `creature_template` SET `health_min`=7326, `health_max`=7326, `mana_min`=4868, `mana_max`=4868 WHERE `entry`=14028 && `patch`=3;
UPDATE `creature_template` SET `health_min`=7326, `health_max`=7326, `mana_min`=4868, `mana_max`=4868 WHERE `entry`=14030 && `patch`=3;
UPDATE `creature_template` SET `health_min`=6477, `health_max`=6477, `mana_min`=6489, `mana_max`=6489 WHERE `entry`=14349 && `patch`=1;
UPDATE `creature_template` SET `health_min`=305, `health_max`=305 WHERE `entry`=14386 && `patch`=1;
UPDATE `creature_template` SET `health_max`=2871 WHERE `entry`=14395 && `patch`=1;
UPDATE `creature_template` SET `health_max`=55 WHERE `entry`=14602 && `patch`=2;
UPDATE `creature_template` SET `health_min`=45780, `health_max`=45780 WHERE `entry`=14848 && `patch`=3;
UPDATE `creature_template` SET `health_min`=1002, `health_max`=1002 WHERE `entry`=14962 && `patch`=5;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=15218 && `patch`=6;
UPDATE `creature_template` SET `health_min`=1002, `health_max`=1002 WHERE `entry`=15746 && `patch`=6;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=15897 && `patch`=7;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=16045 && `patch`=8;
UPDATE `creature_template` SET `health_min`=4120, `health_max`=4120 WHERE `entry`=16100 && `patch`=8;
UPDATE `creature_template` SET `health_min`=5922 WHERE `entry`=16229 && `patch`=9;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
