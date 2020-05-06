DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200502140021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200502140021');
-- Add your query below.


-- Correct stats for non-boss ZG creatures.

-- 'Saltscale Warrior'
UPDATE `creature_template` SET `armor`=1480 WHERE `entry`=871;
-- 'Saltscale Forager'
UPDATE `creature_template` SET `armor`=1480 WHERE `entry`=877;
-- 'Saltscale Hunter'
UPDATE `creature_template` SET `armor`=1480 WHERE `entry`=879;
-- 'Hakkari Shadowcaster'
UPDATE `creature_template` SET `dmg_min`=788, `dmg_max`=1043 WHERE `entry`=11338;
-- 'Hakkari Shadow Hunter'
UPDATE `creature_template` SET `dmg_min`=591, `dmg_max`=782 WHERE `entry`=11339;
-- 'Hakkari Blood Priest'
UPDATE `creature_template` SET `dmg_min`=591, `dmg_max`=782 WHERE `entry`=11340;
-- 'Gurubashi Axe Thrower'
UPDATE `creature_template` SET `dmg_min`=416, `dmg_max`=552 WHERE `entry`=11350;
-- 'Gurubashi Headhunter'
UPDATE `creature_template` SET `dmg_min`=520, `dmg_max`=689 WHERE `entry`=11351;
-- 'Gurubashi Berserker'
UPDATE `creature_template` SET `dmg_min`=1510, `dmg_max`=2004 WHERE `entry`=11352;
-- 'Gurubashi Blood Drinker'
UPDATE `creature_template` SET `dmg_min`=935, `dmg_max`=1241 WHERE `entry`=11353;
-- 'Gurubashi Champion'
UPDATE `creature_template` SET `dmg_min`=741, `dmg_max`=982 WHERE `entry`=11356;
-- 'Soulflayer'
UPDATE `creature_template` SET `dmg_min`=1270, `dmg_max`=1684 WHERE `entry`=11359;
-- 'Bloodseeker Bat'
UPDATE `creature_template` SET `level_min`=60, `dmg_min`=130, `dmg_max`=172, `health_min`=5341 WHERE `entry`=11368;
-- 'Razzashi Serpent'
UPDATE `creature_template` SET `dmg_min`=416, `dmg_max`=551 WHERE `entry`=11371;
-- 'Razzashi Adder'
UPDATE `creature_template` SET `dmg_min`=436, `dmg_max`=579 WHERE `entry`=11372;
-- 'Hooktooth Frenzy'
UPDATE `creature_template` SET `dmg_min`=249, `dmg_max`=331 WHERE `entry`=11374;
-- 'Bloodscalp Speaker'
UPDATE `creature_template` SET `dmg_min`=529, `dmg_max`=702 WHERE `entry`=11389 && `patch`=9;
-- 'Skullsplitter Speaker'
UPDATE `creature_template` SET `dmg_min`=529, `dmg_max`=702 WHERE `entry`=11390 && `patch`=9;
-- 'Hakkari Priest'
UPDATE `creature_template` SET `dmg_min`=484, `dmg_max`=641 WHERE `entry`=11830 && `patch`=5;
-- 'Hakkari Witch Doctor'
UPDATE `creature_template` SET `level_min`=60, `dmg_min`=581, `dmg_max`=769, `health_min`=24420, `mana_min`=12170 WHERE `entry`=11831;
-- 'Gurubashi Bat Rider'
UPDATE `creature_template` SET `dmg_min`=1058, `dmg_max`=1403 WHERE `entry`=14750;
-- 'Razzashi Raptor'
UPDATE `creature_template` SET `dmg_min`=831, `dmg_max`=1103 WHERE `entry`=14821;
-- 'Zulian Crocolisk'
UPDATE `creature_template` SET `dmg_min`=416, `dmg_max`=552 WHERE `entry`=15043;

-- Correct stats for non-boss BWL creatures.

-- Faulty War Golem
UPDATE `creature_template` SET `dmg_min`=77, `dmg_max`=102 WHERE `entry`=8279;
-- Blackwing Spellbinder
UPDATE `creature_template` SET `dmg_min`=1506, `dmg_max`=1996 WHERE `entry`=12457;
-- Blackwing Taskmaster
UPDATE `creature_template` SET `dmg_min`=1506, `dmg_max`=1996 WHERE `entry`=12458;
-- Blackwing Warlock
UPDATE `creature_template` SET `dmg_min`=1478, `dmg_max`=1956 WHERE `entry`=12459;
-- Death Talon Wyrmguard
UPDATE `creature_template` SET `dmg_min`=2746, `dmg_max`=3640 WHERE `entry`=12460;
-- Death Talon Overseer
UPDATE `creature_template` SET `dmg_min`=2374, `dmg_max`=3149 WHERE `entry`=12461;
-- Death Talon Flamescale
UPDATE `creature_template` SET `dmg_min`=1942, `dmg_max`=2576 WHERE `entry`=12463;
-- Death Talon Seether
UPDATE `creature_template` SET `dmg_min`=2158, `dmg_max`=2862 WHERE `entry`=12464;
-- Death Talon Wyrmkin
UPDATE `creature_template` SET `dmg_min`=1774, `dmg_max`=2347 WHERE `entry`=12465;
-- Death Talon Captain
UPDATE `creature_template` SET `dmg_min`=3107, `dmg_max`=4122 WHERE `entry`=12467;
-- Death Talon Hatcher
UPDATE `creature_template` SET `dmg_min`=1971, `dmg_max`=2607 WHERE `entry`=12468;
-- Grethok the Controller
UPDATE `creature_template` SET `dmg_min`=1807, `dmg_max`=2395, `health_min`=64750, `health_max`=64750, `mana_min`=25680, `mana_max`=25680 WHERE `entry`=12557;
-- Blackwing Technician
UPDATE `creature_template` SET `dmg_min`=520, `dmg_max`=689 WHERE `entry`=13996;
-- Corrupted Red Whelp
UPDATE `creature_template` SET `dmg_min`=312, `dmg_max`=414 WHERE `entry`=14022;
-- Corrupted Green Whelp
UPDATE `creature_template` SET `dmg_min`=312, `dmg_max`=414 WHERE `entry`=14023;
-- Corrupted Blue Whelp
UPDATE `creature_template` SET `dmg_min`=312, `dmg_max`=414 WHERE `entry`=14024;
-- Corrupted Bronze Whelp
UPDATE `creature_template` SET `dmg_min`=312, `dmg_max`=414 WHERE `entry`=14025;
-- Master Elemental Shaper Krixix
UPDATE `creature_template` SET `dmg_min`=311, `dmg_max`=413 WHERE `entry`=14401;
-- Blackwing Guardsman
UPDATE `creature_template` SET `dmg_min`=1481, `dmg_max`=1964 WHERE `entry`=14456;

-- Correct stats for non-boss MC creatures.

-- Molten Giant
UPDATE `creature_template` SET `dmg_min`=1618, `dmg_max`=2147, `fire_res`=93 WHERE `entry`=11658;
-- Molten Destroyer
UPDATE `creature_template` SET `dmg_min`=1757, `dmg_max`=2330, `fire_res`=93 WHERE `entry`=11659;
-- Flamewaker
UPDATE `creature_template` SET `dmg_min`=1305, `dmg_max`=1729, `fire_res`=93 WHERE `entry`=11661;
-- Flamewaker Priest
UPDATE `creature_template` SET `dmg_min`=1023, `dmg_max`=1352, `fire_res`=93 WHERE `entry`=11662;
-- Flamewaker Healer
UPDATE `creature_template` SET `dmg_min`=1161, `dmg_max`=1538, `armor`=3075, `fire_res`=15 WHERE `entry`=11663;
-- Flamewaker Elite
UPDATE `creature_template` SET `dmg_min`=1687, `dmg_max`=2235, `armor`=4421, `fire_res`=93, `nature_res`=-93, `frost_res`=-93, `shadow_res`=-93, `arcane_res`=-93 WHERE `entry`=11664;
-- Lava Annihilator
UPDATE `creature_template` SET `dmg_min`=1524, `dmg_max`=2061, `armor`=4391, `fire_res`=93, `nature_res`=93 WHERE `entry`=11665;
-- Firewalker
UPDATE `creature_template` SET `dmg_min`=1058, `dmg_max`=1431, `armor`=4391, `fire_res`=15 WHERE `entry`=11666;
-- Flameguard
UPDATE `creature_template` SET `dmg_min`=1058, `dmg_max`=1431, `armor`=4391, `fire_res`=15 WHERE `entry`=11667;
-- Firelord
UPDATE `creature_template` SET `dmg_min`=952, `dmg_max`=1288, `armor`=4391, `fire_res`=15 WHERE `entry`=11668;
-- Flame Imp
UPDATE `creature_template` SET `dmg_min`=317, `dmg_max`=429, `fire_res`=186 WHERE `entry`=11669;
-- Core Hound
UPDATE `creature_template` SET `dmg_min`=1058, `dmg_max`=1403, `fire_res`=93 WHERE `entry`=11671;
-- Core Rager
UPDATE `creature_template` SET `dmg_min`=1510, `dmg_max`=2004, `fire_res`=95 WHERE `entry`=11672;
-- Ancient Core Hound
UPDATE `creature_template` SET `dmg_min`=1726, `dmg_max`=2290, `fire_res`=93 WHERE `entry`=11673;
-- Lava Elemental
UPDATE `creature_template` SET `dmg_min`=1587, `dmg_max`=2147, `armor`=4391, `fire_res`=95, `nature_res`=95 WHERE `entry`=12076;
-- Firesworn
UPDATE `creature_template` SET `dmg_min`=1455, `dmg_max`=1930, `fire_res`=95, `nature_res`=95 WHERE `entry`=12099;
-- Lava Reaver
UPDATE `creature_template` SET `dmg_min`=1381, `dmg_max`=1864, `armor`=4691, `fire_res`=95, `nature_res`=95 WHERE `entry`=12100;
-- Lava Surger
UPDATE `creature_template` SET `dmg_min`=1376, `dmg_max`=1861, `armor`=4391, `fire_res`=93, `nature_res`=93 WHERE `entry`=12101;
-- Flamewaker Protector
UPDATE `creature_template` SET `dmg_min`=1305, `dmg_max`=1729 WHERE `entry`=12119;

-- Correct stats for non-boss Ony creatures.

-- Onyxian Warder
UPDATE `creature_template` SET `dmg_min`=1039, `dmg_max`=1456, `fire_res`=250, `nature_res`=0 WHERE `entry`=12129;
-- Onyxian Whelp
UPDATE `creature_template` SET `dmg_min`=355, `dmg_max`=480, `fire_res`=171, `nature_res`=0 WHERE `entry`=11262;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
