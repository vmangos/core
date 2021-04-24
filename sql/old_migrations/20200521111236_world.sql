DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200521111236');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200521111236');
-- Add your query below.


-- Massive Longbow - Skolmin Goldfury 
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5122 AND `item` = 11307;

-- Sturdy Recurve - Skolmin Goldfury
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5122 AND `item` = 11306;

-- Fine Shortbow - Skolmin Goldfury
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 10800 WHERE `entry` = 5122 AND `item` = 11303;



-- Flamberge - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2521;

-- Bullova - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2523;

-- War Hammer - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2525;

-- Zweihander - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2529;

-- Great Axe - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2531;

-- War Maul - Thalgus Thunderfist
DELETE FROM `npc_vendor` WHERE `entry` = 7976 AND `item` = 2533;



-- Missing Items - Brenwyn Wintersteel 
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(5120, 3111),
(5120, 2946),
(5120, 3107),
(5120, 3137),
(5120, 3108),
(5120, 3131),
(5120, 3135),
(5120, 2947),
(5120, 15326),
(5120, 15327);



-- Weighted Throwing Axe - Bryllia Ironbrand
DELETE FROM `npc_vendor` WHERE `entry` = 5101 AND `item` = 3131;

-- Balanced Throwing Dagger - Bryllia Ironbrand
DELETE FROM `npc_vendor` WHERE `entry` = 5101 AND `item` = 2946;



-- Strong Fishing Pole - Tansy Puddlefizz
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 5162 AND `item` = 6365;



-- Gyrochronatom - Gearcutter Cogspinner
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5175 AND `item` = 4389;

-- Schematic: Thorium Grenade - Gearcutter Cogspinner
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5175 AND `item` = 16041;

-- Schematic: Thorium Widget - Gearcutter Cogspinner
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5175 AND `item` = 16042;

-- Schematic: Blue Firework - Gearcutter Cogspinner
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5175 AND `item` = 18649;



-- Lesser Mana Potion - Soolie Berryfizz
DELETE FROM `npc_vendor` WHERE `entry` = 5178 AND `item` = 3385;

-- Lesser Healing Potion - Soolie Berryfizz
DELETE FROM `npc_vendor` WHERE `entry` = 5178 AND `item` = 858;



-- Black Dye - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 2325;

-- Red Dye - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 2604;

-- Dust of Decay - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 2928;

-- Gray Dye - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 4340;

-- Yellow Dye - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 4341;

-- Purple Dye - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 4342;

-- Fishing Pole - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 6256;

-- Skinning Knife - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 7005;

-- Heavy Silken Thread - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 8343;

-- Crystal Vial - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 8925;

-- Rune Thread - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 14341;

-- Imbued Vial - Burbik Gearspanner
DELETE FROM `npc_vendor` WHERE `entry` = 5163 AND `item` = 18256;



-- Pattern: Tuxedo Jacket - Outfitter Eric
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 3600 WHERE `entry` = 8681 AND `item` = 10326;

-- Pattern: Tuxedo Pants - Outfitter Eric
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 3600 WHERE `entry` = 8681 AND `item` = 10323;

-- Pattern: Tuxedo Shirt - Outfitter Eric
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 3600 WHERE `entry` = 8681 AND `item` = 10321;

-- Pattern: Lavender Mageweave Shirt - Outfitter Eric
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 8681 AND `item` = 10314;



-- Pattern: Heavy Leather Ball - Bombus Finespindle
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 5128 AND `item` = 18731;



-- Formula: Enchant 2H Weapon - Lesser Intellect - Tilli Thistlefuzz 
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 5158 AND `item` = 6349;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
