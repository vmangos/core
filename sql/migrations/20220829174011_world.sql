DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220829174011');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220829174011');
-- Add your query below.


-- Final Tidy
-- Sort Messed up Pooling in Searing George
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George";
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit - Searing George";

UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George";
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein - Searing George";

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE `pool_entry` = 4030;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE `entry` = 4030;

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4081;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `entry` = 4081;

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4085;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `entry` = 4085;

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4089;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `entry` = 4089;

UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George' WHERE `pool_entry` = 4009;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George' WHERE `entry` = 4009;

UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George' WHERE `pool_entry` = 4066;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George' WHERE `entry` = 4066;

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `pool_entry` = 4053;
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George' WHERE `entry` = 4053;

UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE  `guid`=26365;

UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE  `guid`=38261;

DELETE FROM `gameobject` WHERE  `guid` IN (27331, 27332, 27333, 27335, 27336, 27337, 27339, 27340, 27341, 27343, 27344, 27345);
DELETE FROM `pool_gameobject` WHERE  `guid` IN (27331, 27332, 27333, 27335, 27336, 27337, 27339, 27340, 27341, 27343, 27344, 27345);

UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE `description` = 4030;

DELETE FROM `pool_gameobject` WHERE  `guid`=26371;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(26371, 4028, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George', 10);
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE  `entry`=4028;
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George' WHERE  `pool_entry`=4028;

UPDATE `pool_template` SET `description`='Burning Steppes - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein (Master Pool)' WHERE  `entry`=1296;

-- Add Missing Searing George Pool Pools
DELETE FROM pool_pool WHERE mother_pool = 1338;

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4002, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4003, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4005, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4006, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4007, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4008, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4010, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4011, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4012, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4013, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4014, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4015, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4018, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4019, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4021, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4025, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4026, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4029, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4033, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4036, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4038, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4040, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4041, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4042, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4043, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4044, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4046, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4047, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4049, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4051, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4054, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4056, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4057, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4058, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4063, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4064, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4065, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4067, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4068, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4069, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4070, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4073, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4074, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4075, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4077, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4078, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4079, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4080, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4082, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4083, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4084, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4087, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4088, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4090, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4091, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4092, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4094, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4096, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4097, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4099, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0),
(4100, 1338, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit', 0);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4350, 4, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4059, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4071, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4072, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4081, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4085, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(2867, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(2868, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(2869, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(2870, 4350, 0, 'Searing George - Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4351, 11, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4001, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4004, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4016, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4017, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4020, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4022, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4024, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4027, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4028, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4030, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4031, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4032, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4034, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4035, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4037, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4039, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4045, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4048, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4052, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4060, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4061, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4062, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4076, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4093, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0),
(4095, 4351, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit', 0);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(4352, 3, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(4023, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4050, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4053, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4055, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4086, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4089, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0),
(4098, 4352, 0, 'Searing George - Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein', 0);

-- Correct Nmaing Convention
UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands' WHERE  `entry`=17142;
UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein - Blasted Lands' WHERE  `pool_entry`=17142;

UPDATE `pool_template` SET `description`='Truesilver Deposit / Small Thorium Vein - Blasted Lands' WHERE  `entry` IN (17201, 14401, 14402, 14403);
UPDATE `pool_gameobject` SET `description`='Truesilver Deposit / Small Thorium Vein - Blasted Lands' WHERE  `pool_entry` IN (17201, 14401, 14402, 14403);

UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes' WHERE `description` = "Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes";
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes' WHERE `description` = "Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes";

UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory' WHERE `description` = "Small Thorium Vein / Truesilver Deposit - Blasted Lands - Garrison Armory";

UPDATE `pool_pool` SET `description`='Burning Steppes - Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein' WHERE  `mother_pool`=1296;

UPDATE `pool_pool` SET `description`='Blasted Lands - Gold Vein / Mithril Deposit / Truesilver Deposit / Small Thorium Vein' WHERE  `pool_id`=17142;

UPDATE `pool_pool` SET `description`='Blasted Lands - Truesilver Deposit / Small Thorium Vein' WHERE  `mother_pool`=1359;

UPDATE `pool_pool` SET `description`='Western Plaguelands - Truesilver Deposit / Small Thorium Vein' WHERE  `mother_pool`=1331;

UPDATE `pool_template` SET `description`='Copper Veins - Hillsbrad Foothills' WHERE  `entry`=1066;

DELETE FROM `pool_template` WHERE  `entry`=1272;

UPDATE `pool_template` SET `description`='Copper Veins - Wetlands' WHERE  `entry`=1156;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Wetlands' WHERE  `pool_entry`=1156;

UPDATE `pool_template` SET `description`='Copper Veins - Silverpine Forest' WHERE  `entry`=1044;

UPDATE `pool_gameobject` SET `pool_entry`='1352' WHERE  `guid`=34750;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Silverpine Forest' WHERE `pool_entry`=1044;

UPDATE `pool_template` SET `description`='Tin Veins - Silverpine Forest' WHERE  `entry`=1045;

UPDATE `pool_gameobject` SET `description`='Tin Vein - Silverpine Forest' WHERE  `pool_entry`=1045;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Hillsbrad Foothills' WHERE  `pool_entry`=1066;

UPDATE `pool_template` SET `description`='Copper Veins - Loch Modan' WHERE  `entry`=1166;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Loch Modan' WHERE  `pool_entry`=1166;

UPDATE `pool_template` SET `description`='Copper Veins - Duskwood' WHERE  `entry`=1119;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Duskwood' WHERE  `pool_entry`=1119;

UPDATE `pool_template` SET `description`='Copper Veins - Westfall' WHERE  `entry`=1111;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Westfall' WHERE  `pool_entry`=1111;

UPDATE `pool_template` SET `description`='Copper Veins - Redridge Mountains' WHERE  `entry`=1128;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Redridge Mountains' WHERE  `pool_entry`=1128;

UPDATE `pool_template` SET `description`='Barrens - Giant Clam' WHERE  `entry`=1343;

UPDATE `pool_template` SET `description`='Barrens - Laden Mushroom' WHERE  `entry`=1615;

UPDATE `pool_template` SET `description`='Barrens - Silithid Mound' WHERE  `entry`=1616;

UPDATE `pool_gameobject` SET `description`='Copper Vein - Stonetalon Mountains' WHERE  `pool_entry`=1089;

UPDATE `pool_gameobject` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring' WHERE  `guid` IN (427524, 427525, 427526, 427527, 427528, 427529, 427530, 427531, 427532, 427533, 427534, 427535);

UPDATE `pool_template` SET `description`='Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring' WHERE  `entry` IN (17183, 17184, 17185, 17186);

UPDATE `pool_template` SET `description`='Hillsbrad Foothills - Darrow Hill - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit (Master Pool)' WHERE  `entry`=322;

UPDATE `pool_template` SET `description`='Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein' WHERE  `entry`=22910;

-- Gold Vein / Mithril Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 80 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

UPDATE `pool_template` SET `description`='Copper Veins - Elwynn Forest' WHERE  `entry`=1015;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Elwynn Forest' WHERE  `pool_entry`=1015;
UPDATE `pool_template` SET `description`='Copper Veins - Dun Morogh' WHERE  `entry`=1019;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Dun Morogh' WHERE  `pool_entry`=1019;
UPDATE `pool_template` SET `description`='Copper Veins - Mulgore' WHERE  `entry`=1028;
UPDATE `pool_template` SET `description`='Copper Veins - Durotar' WHERE  `entry`=1024;
UPDATE `pool_template` SET `description`='Copper Veins - Desolace' WHERE  `entry`=1139;
UPDATE `pool_template` SET `description`='Copper Veins - Tirisfal Glades' WHERE  `entry`=1008;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Mulgore' WHERE  `pool_entry`=1028;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Durotar' WHERE  `pool_entry`=1024;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Desolace' WHERE  `pool_entry`=1139;
UPDATE `pool_gameobject` SET `description`='Copper Vein - Tirisfal Glades' WHERE  `pool_entry`=1008;

-- Final Missing Spawns
SET @OGUID = 34740;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 1, 4614.32, -5556.65, 105.257, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+2, 175404, 1, 4695.86, -5989.7, 117.796, 5.02655, 0, 0, -0.587785, 0.809017,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+3, 175404, 1, 2236.38, -6675.25, 127.433, 1.29154, 0, 0, 0.601814, 0.798636,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+4, 175404, 1, 3075.36, -5776.95, 25.3971, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+5, 175404, 1, 3980.69, -6278.7, 8.60821, 5.67232, 0, 0, -0.300705, 0.953717, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+6, 2040, 1, 4680.67, -7671.08, 56.161, 3.75246, 0, 0, -0.953716, 0.300708,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+7, 2040, 1, 4280.41, -7293.17, 17.8182, 1.51844, 0, 0, 0.688354, 0.725374,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+8, 2040, 1, 2809.74, -5501.43, 108.372, 4.59022, 0, 0, -0.748956, 0.66262, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+9, 2040, 1, 3319.4, -5781.67, 11.9572, 0.349065, 0, 0, 0.173648, 0.984808, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+10, 1734, 1, 2407.6, -6540.76, 117.029, 3.08918, 0, 0, 0.999657, 0.0262016,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+11, 2047, 0, -13231.2, -540.241, 7.93169, 3.89209, 0, 0, -0.930417, 0.366502, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+12, 2040, 0, -11406.3, -916.361, 19.125, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+13, 2040, 0, -12389.8, -1067.46, 3.13742, 0.418879, 0, 0, 0.207911, 0.978148, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+14, 2040, 0, -12840.5, -610.494, 66.9924, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+15, 2040, 0, -14577.6, -241.361, 16.7222, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+16, 2040, 0, -14643.3, 481.62, 23.7943, 2.72271, 0, 0, 0.978148, 0.207912, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+17, 1735, 0, -12048.4, -958.832, 50.9151, 0.209439, 0, 0, 0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+18, 1735, 0, -12327.2, -990.796, 19.8739, 4.15388, 0, 0, -0.874619, 0.48481,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+19, 1735, 0, -13201.1, -490.142, 4.77076, 0.139624, 0, 0, 0.0697556, 0.997564,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+20, 1735, 0, -13110.2, -323.97, 21.008, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+21, 1735, 0, -13598.4, -379.535, 11.0353, 1.41372, 0, 0, 0.649447, 0.760406,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+22, 1731, 0, -9882.71, 1425.49, 41.2258, 5.68977, 0, 0, -0.292372, 0.956305,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+23, 1731, 0, -9584.58, 815.144, 51.4657, 3.80482, 0, 0, -0.945518, 0.325568, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+24, 1731, 0, -9311.26, 643.967, 130.898, 5.02655, 0, 0, -0.587785, 0.809017, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+25, 1731, 0, -9050.06, -1040.05, 78.6428, 0.925024, 0, 0, 0.446198, 0.894935,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+26, 1731, 0, -8687.83, -2249.76, 157.838, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+27, 1731, 0, -8805.47, -2238.1, 148.948, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+28, 1731, 0, -8823.3, -2168.43, 150.618, 5.68977, 0, 0, -0.292372, 0.956305,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+29, 1731, 0, -9048, -2063.1, 139.674, 5.41052, 0, 0, -0.422618, 0.906308,  300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 1732, 0, -8778.13, -2251.59, 149.732, 1.64061, 0, 0, 0.731353, 0.681999,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+31, 1732, 0, -8932.18, -2079.43, 139.813, 4.7822, 0, 0, -0.681998, 0.731354,  300, 300, 100, 1, 0, 0, 0, 10); 

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+2, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+3, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+4, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+5, 1246, 'Rich Thorium Vein - Azshara', 10),
(@OGUID+6, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+7, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+8, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+9, 1329, 'Mithril Deposit - Azshara', 10),
(@OGUID+11, 1178, 'Truesilver Deposit - Stranglethorn', 10),
(@OGUID+12, 1177, 'Mithril Deposit - Stranglethorn', 10),
(@OGUID+13, 1177, 'Mithril Deposit - Stranglethorn', 10),
(@OGUID+14, 1177, 'Mithril Deposit - Stranglethorn', 10),
(@OGUID+15, 1177, 'Mithril Deposit - Stranglethorn', 10),
(@OGUID+16, 1177, 'Mithril Deposit - Stranglethorn', 10),
(@OGUID+17, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+18, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+19, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+20, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+21, 1175, 'Iron Deposit - Stranglethorn', 10),
(@OGUID+22, 1111, 'Copper Vein - Westfall', 10),
(@OGUID+23, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+24, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+25, 1015, 'Copper Vein - Elwynn Forest', 10),
(@OGUID+26, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+27, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+28, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+29, 1128, 'Copper Vein - Redridge', 10),
(@OGUID+30, 1128, 'Tin Vein - Redridge Mountains', 10),
(@OGUID+31, 1128, 'Tin Vein - Redridge Mountains', 10);

-- Tin Vein / Silver Vein in Duskwood
SET @OGUID = 34772;
SET @PTEMPLATE = 34910;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -10766.7, -1437.56, 71.3134, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+2, 1732, 0, -11235.4, -875.842, 85.4821, 2.67035, 0, 0, 0.972369, 0.233448,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+3, 1732, 0, -11095.3, -29.8368, 29.2261, 6.02139, 0, 0, -0.130526, 0.991445,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+4, 1732, 0, -10687.9, -1475.34, 94.9893, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+5, 1733, 0, -10766.7, -1437.56, 71.3134, 5.20108, 0, 0, -0.515038, 0.857168, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+6, 1733, 0, -11235.4, -875.842, 85.4821, 2.67035, 0, 0, 0.972369, 0.233448,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+7, 1733, 0, -11095.3, -29.8368, 29.2261, 6.02139, 0, 0, -0.130526, 0.991445,  300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+8, 1733, 0, -10687.9, -1475.34, 94.9893, 3.68265, 0, 0, -0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+3, 1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@PTEMPLATE+4, 1, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+2, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+3, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+4, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+5, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+6, @PTEMPLATE+2, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+7, @PTEMPLATE+3, 'Tin Vein / Silver Vein - Duskwood', 10),
(@OGUID+8, @PTEMPLATE+4, 'Tin Vein / Silver Vein - Duskwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+3, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+4, 399, 0, 'Duskwood - Tin Vein / Silver Vein', 0);

-- Gold Vein / Iron Deposit in Duskwood
SET @OGUID = 34781;
SET @PTEMPLATE = 34915;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11152.4, -150.115, 10.1164, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -10283.3, -709.007, 55.0537, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -11152.4, -150.115, 10.1164, 2.70526, 0, 0, 0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1735, 0, -10283.3, -709.007, 55.0537, 4.15388, 0, 0, -0.874619, 0.48481, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Iron Deposit - Duskwood', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Iron Deposit - Duskwood', 10),
(@OGUID+4, @PTEMPLATE+2, 'Gold Vein / Iron Deposit - Duskwood', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 1120, 0, 'Duskwood - Gold Vein / Iron Deposit', 0);

-- Tin Vein / Silver Vein in Redridge
SET @OGUID = 34786;
SET @PTEMPLATE = 34918;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 0, -8729.84, -2176.29, 160.474, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -8729.84, -2176.29, 160.474, 0.279252, 0, 0, 0.139173, 0.990268, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Tin Vein / Silver Vein - Redridge Mountains', 10),
(@OGUID+2, @PTEMPLATE, 'Tin Vein / Silver Vein - Redridge Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 400, 0, 'Redridge Mountains - Tin Vein / Silver Vein', 0);

-- Silver Vein / Gold Vein / Iron Deposit in Swamp of Sorrows
SET @OGUID = 34789;
SET @PTEMPLATE = 34919;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -10146.2, -2564.31, 29.1208, 0.349065, 0, 0, 0.173648, 0.984808,  300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -10146.2, -2564.31, 29.1208, 0.349065, 0, 0, 0.173648, 0.984808,  300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -10146.2, -2564.31, 29.1208, 0.349065, 0, 0, 0.173648, 0.984808,  300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE, 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 1318, 0, 'Swamp of Sorrows - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Small Thorium Vein / Truesilver Deposit in Blasted Lands
SET @OGUID = 34793;
SET @PTEMPLATE = 34920;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, -11487.6, -3406.52, 18.8567, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, -11487.6, -3406.52, 18.8567, 5.2709, 0, 0, -0.484809, 0.87462, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1359, 0, 'Blasted Lands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1359, 0, 'Blasted Lands - Truesilver Deposit / Small Thorium Vein', 0);

-- Pool Remaining Objects Not in Pools
SET @OGUID = 200010;
SET @PTEMPLATE = 33000;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -6421.86, -1300.82, 180.939, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -6421.86, -1300.82, 180.939, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 165658, 0, -6421.86, -1300.82, 180.939, 4.01426, 0, 0, -0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(29702, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 4350, 0, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 0);

SET @OGUID = 200014;
SET @PTEMPLATE = 33001;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -7040.06, -1185.06, 255.285, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -7040.06, -1185.06, 255.285, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 165658, 0, -7040.06, -1185.06, 255.285, 0.558504, 0, 0, 0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE, 1, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+2, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(@OGUID+3, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10),
(58158, @PTEMPLATE, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE, 4350, 0, 'Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George', 0);

SET @OGUID = 200018;
SET @PTEMPLATE =33002;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -7218.9, -1842.2, 292.806, -3.00197, 0, 0, 0.997564, -0.069756, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 0, -6833.31, -1762.8, 260.022, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -7218.9, -1842.2, 292.806, -3.00197, 0, 0, 0.997564, -0.069756, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -6833.31, -1762.8, 260.022, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1735, 0, -7218.9, -1842.2, 292.806, -3.00197, 0, 0, 0.997564, -0.069756, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1735, 0, -6833.31, -1762.8, 260.022, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -7218.9, -1842.2, 292.806, -3.00197, 0, 0, 0.997564, -0.069756, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -6833.31, -1762.8, 260.022, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 165658, 0, -7218.9, -1842.2, 292.806, -3.00197, 0, 0, 0.997564, -0.069756, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 165658, 0, -6833.31, -1762.8, 260.022, 3.01941, 0, 0, 0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+4, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+5, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+6, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+7, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+8, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+9, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10),
(@OGUID+10, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(34930, 3, 'Searing George - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 34930, 0, 'Searing George - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit', 0),
(@PTEMPLATE+2, 34930, 0, 'Searing George - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit', 0),
(4009, 34930, 0, 'Searing George - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit', 0),
(4066, 34930, 0, 'Searing George - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit', 0);

DELETE FROM `gameobject` WHERE `guid` IN (29519, 29518);

UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 30 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(112676, 1044, 'Copper Vein - Silverpine Forest', 10),
(34750, 1044, 'Gold Vein - Azshara', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(34931, 3, 'Tin Veins - Alterac Mountains', 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(33196, 34931, 'Tin Vein - Alterac Mountains', 10),
(42200, 34931, 'Tin Vein - Alterac Mountains', 10),
(33198, 34931, 'Tin Vein - Alterac Mountains', 10),
(42201, 34931, 'Tin Vein - Alterac Mountains', 10),
(42202, 34931, 'Tin Vein - Alterac Mountains', 10),
(42203, 34931, 'Tin Vein - Alterac Mountains', 10),
(42204, 34931, 'Tin Vein - Alterac Mountains', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3310, 4, 'Hillsbrad Foothills - Azurelode Mine - Tin Veins / Silver Veins (Master Pool)', 0, 0, 0, 10);
UPDATE `pool_pool` SET `mother_pool`=3310 WHERE  `pool_id` IN (1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1482, 14445, 14446);

UPDATE `pool_pool` SET `description`='Hillsbrad Foothills - Azurelode Mine - Tin Veins / Silver Veins' WHERE  `pool_id` IN (1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1482, 14445, 14446);

-- Verify All Chances Have Applied After All Changes
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 25 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

-- Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 50 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Gold Vein / Mithril Deposit / Dark Iron Deposit / Truesilver Deposit / Small Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Searing George" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

-- Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Small Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

-- Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein
UPDATE `pool_gameobject` SET `chance` = 10 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 70 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 165658);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);

UPDATE `gameobject` SET `id` = 2047 WHERE `guid`=220451;
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `guid`=220451;

UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `entry` IN (1567, 1573);
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `pool_entry` IN (1567, 1573);

UPDATE `pool_gameobject` SET `chance`=80 WHERE  `guid` IN (28126, 28123, 28127, 34792);

UPDATE `pool_gameobject` SET `chance`=70 WHERE  `guid`=255269;

UPDATE `pool_gameobject` SET `chance`=90 WHERE  `guid` IN (34784, 34785, 34773, 34774, 34775, 34776, 34787, 100204, 100205, 100206);

UPDATE `pool_gameobject` SET `chance`=10 WHERE  `guid` IN (34783, 34782, 34777, 34778, 34779, 34780, 22082, 22910, 220452, 20263, 20269, 34788, 34791, 34790, 27179, 427404, 427406, 100201, 100202, 100203, 27264, 27301);

UPDATE `pool_gameobject` SET `chance`=40 WHERE  `guid` IN (427405, 427407);

DELETE FROM `pool_gameobject` WHERE  `guid` IN (27655, 27672);

UPDATE `pool_gameobject` SET `chance` = 90, `description`='Tin Vein (3764) / Silver Vein - Barrens' WHERE  `guid`=41985;
UPDATE `pool_gameobject` SET `description`='Tin Vein (3764) / Silver Vein - Barrens' WHERE  `guid`=34735;
UPDATE `pool_template` SET `description`='Tin Vein (3764) / Silver Vein - Barrens' WHERE  `entry`=2856;

UPDATE `gameobject` SET `animprogress`=100 WHERE `guid` IN (25268, 40010, 40009, 40007, 40006, 40003, 39981, 56024, 55955, 25286, 39941, 55949, 56059, 55878, 55884, 55938, 55948, 55950, 55954, 55962, 56021, 56026, 56057);
UPDATE `gameobject` SET `animprogress`=100, `state`=1 WHERE  `guid`=43257;
UPDATE `gameobject` SET `spawn_flags`=0 WHERE  `guid` IN (14214, 14213, 14223, 14222);

-- Remove Empty Templates
DELETE FROM `pool_template` WHERE  `entry` IN (1245, 3662, 409);

-- Update Counters
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=1262;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1271;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1331;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=325;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1263;
UPDATE `pool_template` SET `max_limit`=34 WHERE  `entry`=1044;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1354;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1045;
UPDATE `pool_template` SET `max_limit`=26 WHERE  `entry`=1273;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=322;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1274;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1066;
UPDATE `pool_template` SET `max_limit`=40 WHERE  `entry`=1067;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1358;
UPDATE `pool_template` SET `max_limit`=44 WHERE  `entry`=323;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=406;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=298;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=18840;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1348;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1156;
UPDATE `pool_template` SET `max_limit`=4 WHERE  `entry`=3655;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1355;
UPDATE `pool_template` SET `max_limit`=50 WHERE  `entry`=1166;
UPDATE `pool_template` SET `max_limit`=17 WHERE  `entry`=1186;
UPDATE `pool_template` SET `max_limit`=27 WHERE  `entry`=1287;
UPDATE `pool_template` SET `max_limit`=25 WHERE  `entry`=1288;
UPDATE `pool_template` SET `max_limit`=10 WHERE  `entry`=1120;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=399;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1119;
UPDATE `pool_template` SET `max_limit`=47 WHERE  `entry`=1111;
UPDATE `pool_template` SET `max_limit`=16 WHERE  `entry`=1112;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1128;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=400;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1318;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1280;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1359;
UPDATE `pool_template` SET `max_limit`=30 WHERE  `entry`=1338;
UPDATE `pool_template` SET `max_limit`=12 WHERE  `entry`=4351;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=4350;
UPDATE `pool_template` SET `max_limit`=14 WHERE  `entry`=1299;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1297;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1203;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1200;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1204;
UPDATE `pool_template` SET `max_limit`=19 WHERE  `entry`=1211;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1217;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1220;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=985;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=413;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=1198;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1357;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=1196;
UPDATE `pool_template` SET `max_limit`=3 WHERE  `entry`=1197;
UPDATE `pool_template` SET `max_limit`=32 WHERE  `entry`=1132;
UPDATE `pool_template` SET `max_limit`=15 WHERE  `entry`=2585;
UPDATE `pool_template` SET `max_limit`=28 WHERE  `entry`=1131;
UPDATE `pool_template` SET `max_limit`=6 WHERE  `entry`=329;
UPDATE `pool_template` SET `max_limit`=90 WHERE  `entry`=4303;
UPDATE `pool_template` SET `max_limit`=35 WHERE  `entry`=1033;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=2588;
UPDATE `pool_template` SET `max_limit`=18 WHERE  `entry`=2587;
UPDATE `pool_template` SET `max_limit`=7 WHERE  `entry`=3165;
UPDATE `pool_template` SET `max_limit`=2224 WHERE  `entry`=1090;
UPDATE `pool_template` SET `max_limit`=20 WHERE  `entry`=1089;
UPDATE `pool_template` SET `max_limit`=9 WHERE  `entry`=1091;
UPDATE `pool_template` SET `max_limit`=24 WHERE  `entry`=1080;
UPDATE `pool_template` SET `max_limit`=21 WHERE  `entry`=1074;
UPDATE `pool_template` SET `max_limit`=11 WHERE  `entry`=1079;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1351;
UPDATE `pool_template` SET `max_limit`=8 WHERE  `entry`=1234;
UPDATE `pool_template` SET `max_limit`=13 WHERE  `entry`=1233;
UPDATE `pool_template` SET `max_limit`=51 WHERE  `entry`=1098;
UPDATE `pool_template` SET `max_limit`=22 WHERE  `entry`=1099;
UPDATE `pool_template` SET `max_limit`=67 WHERE  `entry`=1019;
UPDATE `pool_template` SET `max_limit`=58 WHERE  `entry`=1015;
UPDATE `pool_template` SET `max_limit`=71 WHERE  `entry`=1024;
UPDATE `pool_template` SET `max_limit`=46 WHERE  `entry`=1028;
UPDATE `pool_template` SET `max_limit`=55 WHERE  `entry`=1008;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
