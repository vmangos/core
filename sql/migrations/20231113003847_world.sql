DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231113003847');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231113003847');
-- Add your query below.


-- Defias Ambusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=583; -- old 1.9, level 8, hits 10

-- Sneed
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=643; -- old 3, level 20, hits 22

-- Watcher Jan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=826; -- old 0.75, level 39, hits 7

-- Watcher Petras
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=828; -- old 1, level 38, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=828; -- old 1.15, level 38, hits 41

-- Antonio Perelli
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=844; -- old 1.05, level 35, hits 5

-- Watcher Keller
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=885; -- old 0.75, level 39, hits 5

-- Watcher Blomberg
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1000; -- old 1.3, level 20, hits 16

-- Crimson Whelp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1069; -- old 0, level 25, hits 4

-- Angus Stern
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1141; -- old 1.6, level 60, hits 20

-- Morbent Fel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=1200; -- old 2.35, level 32, hits 57

-- Miran
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1379; -- old 1, level 15, hits 91

-- Mok'rash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.25 WHERE `entry`=1493; -- old 3.35, level 50, hits 5

-- Negolash
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1494; -- old 0.75, level 52, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=1494; -- old 3.75, level 52, hits 5

-- Tirion Fordring
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=3 WHERE `entry`=1855; -- old 1.45, level 61, hits 1

-- Stephen Bhartec
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=1916; -- old 0.92, level 3, hits 8

-- Karrel Grayves
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1918; -- old 1.4, level 3, hits 7

-- Bloodfeather Matriarch
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=2021; -- old 1, level 11, hits 38

-- Timberling Bark Ripper
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=2025; -- old 0.14, level 7, hits 24

-- Bael'dun Digger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=2989; -- old 1, level 8, hits 27

-- Matt Johnson
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=3137; -- old 0.85, level 20, hits 25
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=3137; -- old 0.14, level 20, hits 25

-- Razormane Water Seeker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3267; -- old 1, level 11, hits 87

-- Shadow Charger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3865; -- old 1.55, level 21, hits 14

-- Deathsworn Captain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=3872; -- old 2.8, level 25, hits 5

-- Herod
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3975; -- old 0.14, level 40, hits 21

-- Fenrus the Devourer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.25 WHERE `entry`=4274; -- old 2.95, level 25, hits 30

-- Snapping Crustacean
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=4822; -- old 3.2, level 24, hits 14

-- Connor Rivers
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=5081; -- old 1.4, level 25, hits 3

-- Deep Strider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.55 WHERE `entry`=5360; -- old 3.55, level 49, hits 4

-- Thistleshrub Rootshaper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5485; -- old 1.1, level 49, hits 341

-- Captured Sprite Darter
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.2 WHERE `entry`=7997; -- old 0.14, level 42, hits 283

-- Greater Firebird
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8207; -- old 3.2, level 46, hits 7

-- The Reak
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=8212; -- old 3.25, level 49, hits 4

-- Blighted Horror
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.14 WHERE `entry`=8521; -- old 0.11, level 57, hits 46

-- Battle Chicken
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.01 WHERE `entry`=8836; -- old 1.3, level 60, hits 663

-- Dadanga
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9274; -- old 1.5, level 45, hits 1

-- Ground Pounder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=9396; -- old 1.8, level 43, hits 29

-- Ribbly Screwspigot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.35 WHERE `entry`=9543; -- old 2.7, level 53, hits 31

-- Parrot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.66 WHERE `entry`=9600; -- old 1.3, level 1, hits 3

-- Ranshalla
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=10300; -- old 0.14, level 58, hits 233

-- Crimson Cannon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11199; -- old 0, level 61, hits 6

-- Cyclone Warrior
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11745; -- old 0.65, level 58, hits 3

-- Stormpike Mountaineer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12047; -- old 17, level 55, hits 2350

-- Duros
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12122; -- old 1.1, level 60, hits 74

-- Masha Swiftcut
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13088; -- old 3.4, level 58, hits 28

-- Lieutenant Rugba
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13137; -- old 1.1, level 59, hits 209

-- Lieutenant Grummus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13145; -- old 1.1, level 59, hits 190

-- Frostwolf Shaman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=13284; -- old 3.85, level 58, hits 240

-- Seasoned Coldmine Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13534; -- old 5.2, level 57, hits 46

-- Seasoned Coldmine Surveyor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13537; -- old 1.25, level 57, hits 27
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13537; -- old 3.4, level 57, hits 10

-- The Rot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14235; -- old 3.1, level 43, hits 11

-- Snarlflare
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=14272; -- old 4.95, level 18, hits 6

-- Rogue Black Drake
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.85 WHERE `entry`=14388; -- old 3, level 51, hits 5

-- Threggil
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14432; -- old 1.15, level 6, hits 3

-- Dun Baldar North Marshal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14762; -- old 13.5, level 60, hits 38

-- Thaddius
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=15928; -- old 0.14, level 63, hits 26

-- Spectral Stalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16093; -- old 0.9, level 60, hits 104

-- Nerubian Overseer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16184; -- old 1.1, level 60, hits 75


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
